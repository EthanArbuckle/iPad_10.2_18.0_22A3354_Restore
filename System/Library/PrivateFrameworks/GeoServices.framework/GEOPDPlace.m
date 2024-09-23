@implementation GEOPDPlace

- (void)enumerateComponentsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  char v4;
  void (**v6)(id, uint64_t, char *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, char *))a4;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GEOPDPlace components](self, "components", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11);
      if (((v4 & 1) == 0 || objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11), "statusCodeIsValid"))
        && ((v4 & 2) == 0 || v12 && objc_msgSend(*(id *)(v12 + 48), "count")))
      {
        v6[2](v6, v12, &v17);
        if (v17)
          break;
      }
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

void __86__GEOPDPlace_PlaceDataExtras__enumerateComponentOfType_enumerationOptions_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3 && (*((_WORD *)v3 + 50) & 0x80) != 0)
    v5 = *((_DWORD *)v3 + 22);
  else
    v5 = 0;
  if (v5 == *(_DWORD *)(a1 + 40))
  {
    v6 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v6;
  }

}

- (NSMutableArray)components
{
  -[GEOPDPlace _readComponents]((uint64_t)self);
  return self->_components;
}

- (BOOL)hasMuid
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

void __92__GEOPDPlace_PlaceDataExtras__enumerateComponentValuesOfType_enumerationOptions_usingBlock___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GEOPDComponent values](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
      if (*a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)componentOfType:(int)a3 options:(unint64_t)a4
{
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__36;
  v11 = __Block_byref_object_dispose__36;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__GEOPDPlace_PlaceDataExtras__componentOfType_options___block_invoke;
  v6[3] = &unk_1E1C09768;
  v6[4] = &v7;
  -[GEOPDPlace enumerateComponentOfType:enumerationOptions:usingBlock:](self, "enumerateComponentOfType:enumerationOptions:usingBlock:", *(_QWORD *)&a3, a4, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)enumerateComponentValuesOfType:(int)a3 enumerationOptions:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__GEOPDPlace_PlaceDataExtras__enumerateComponentValuesOfType_enumerationOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E1C097E0;
  v11 = v8;
  v9 = v8;
  -[GEOPDPlace enumerateComponentOfType:enumerationOptions:usingBlock:](self, "enumerateComponentOfType:enumerationOptions:usingBlock:", v6, a4, v10);

}

- (void)enumerateComponentOfType:(int)a3 enumerationOptions:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  int v12;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__GEOPDPlace_PlaceDataExtras__enumerateComponentOfType_enumerationOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E1C097B8;
  v12 = a3;
  v11 = v8;
  v9 = v8;
  -[GEOPDPlace enumerateComponentsWithOptions:usingBlock:](self, "enumerateComponentsWithOptions:usingBlock:", a4, v10);

}

- (void)enumerateValidComponentWithValuesOfType:(int)a3 usingBlock:(id)a4
{
  -[GEOPDPlace enumerateComponentOfType:enumerationOptions:usingBlock:](self, "enumerateComponentOfType:enumerationOptions:usingBlock:", *(_QWORD *)&a3, 3, a4);
}

- (void)enumerateValidComponentValuesOfType:(int)a3 usingBlock:(id)a4
{
  -[GEOPDPlace enumerateComponentValuesOfType:enumerationOptions:usingBlock:](self, "enumerateComponentValuesOfType:enumerationOptions:usingBlock:", *(_QWORD *)&a3, 3, a4);
}

void __55__GEOPDPlace_PlaceDataExtras__componentOfType_options___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (BOOL)hasExpectedComponentTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    -[GEOPDPlace components](self, "components");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[GEOPDPlace components](self, "components", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (v13 && (*(_WORD *)(v13 + 100) & 0x80) != 0)
            v14 = *(unsigned int *)(v13 + 88);
          else
            v14 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v16 = objc_msgSend(v4, "isSubsetOfSet:", v7);
  }
  else
  {
    v16 = 1;
  }

  return v16;
}

+ (id)componentTypesFromComponentInfos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v10 && (*(_BYTE *)(v10 + 44) & 4) != 0)
          v11 = *(unsigned int *)(v10 + 32);
        else
          v11 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v4, "copy");
  return v13;
}

+ (id)failedPlaceData
{
  return (id)objc_msgSend(a1, "failedPlaceDataForMuid:", 0);
}

- (void)_addNoFlagsComponent:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (BOOL)meetsManifestVersioningForServiceVersion:(id)a3
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v14;
  BOOL v15;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (id *)a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[GEOPDPlace components](self, "components");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v8);
        if (!v9 || (*(_WORD *)(v9 + 100) & 0x20) == 0 || !*(_DWORD *)(v9 + 80))
        {
          -[GEOPDComponent versionDomains](*(id **)(*((_QWORD *)&v18 + 1) + 8 * v8));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[GEOServiceVersion versionDomains](v4);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[GEOPDPlace _isKey:subsetOf:](self, "_isKey:subsetOf:", v10, v11);

          v13 = !v9 || !v12;
          if (!v13
            && v4
            && (*(_WORD *)(v9 + 100) & 0x200) != 0
            && (*((_BYTE *)v4 + 28) & 1) != 0
            && *(_DWORD *)(v9 + 96) < *((_DWORD *)v4 + 6))
          {
            v15 = 0;
            goto LABEL_23;
          }
        }
        ++v8;
      }
      while (v6 != v8);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v6 = v14;
    }
    while (v14);
  }
  v15 = 1;
LABEL_23:

  return v15;
}

- (BOOL)_isKey:(id)a3 subsetOf:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = objc_msgSend(v6, "count");
    if (v9 <= objc_msgSend(v5, "count"))
    {
      if (objc_msgSend(v7, "count"))
      {
        v10 = 0;
        do
        {
          objc_msgSend(v7, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "caseInsensitiveCompare:", v12);
          v8 = v13 == 0;

          if (v13)
            break;
          ++v10;
        }
        while (v10 < objc_msgSend(v7, "count"));
      }
      else
      {
        v8 = 1;
      }
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $E293E9EAAB2B8016EDB279585BF8500E flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  $E293E9EAAB2B8016EDB279585BF8500E v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  $E293E9EAAB2B8016EDB279585BF8500E v20;
  NSMutableArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  $E293E9EAAB2B8016EDB279585BF8500E v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  PBUnknownFields *v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_40;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlace readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_7;
LABEL_42:
    *(_DWORD *)(v5 + 132) = self->_status;
    *(_DWORD *)(v5 + 140) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_QWORD *)(v5 + 56) = self->_muid;
  *(_DWORD *)(v5 + 140) |= 2u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
    goto LABEL_42;
LABEL_7:
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_8:
    *(_QWORD *)(v5 + 80) = self->_preferredMuid;
    *(_DWORD *)(v5 + 140) |= 4u;
  }
LABEL_9:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v10 = self->_components;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addComponent:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v11);
  }

  v15 = self->_flags;
  if ((*(_BYTE *)&v15 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 128) = self->_resultProviderId;
    *(_DWORD *)(v5 + 140) |= 0x80u;
    v15 = self->_flags;
  }
  if ((*(_BYTE *)&v15 & 8) != 0)
  {
    *(_QWORD *)(v5 + 96) = self->_updateVersion;
    *(_DWORD *)(v5 + 140) |= 8u;
  }
  v16 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v16;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 40) = self->_createdTime;
    *(_DWORD *)(v5 + 140) |= 1u;
  }
  v18 = -[GEOPDPlacecardLayoutData copyWithZone:](self->_placeLayoutData, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v18;

  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 136) = self->_isPartiallyClientizedSearchResult;
    *(_DWORD *)(v5 + 140) |= 0x200u;
    v20 = self->_flags;
  }
  if ((*(_BYTE *)&v20 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_mapDisplayType;
    *(_DWORD *)(v5 + 140) |= 0x10u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v21 = self->_abExpBranchIds;
  v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v21);
        v25 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v33);
        objc_msgSend((id)v5, "addAbExpBranchId:", v25);

      }
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

  v26 = self->_flags;
  if ((*(_BYTE *)&v26 & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 120) = self->_rapFlowType;
    *(_DWORD *)(v5 + 140) |= 0x20u;
    v26 = self->_flags;
  }
  if ((*(_BYTE *)&v26 & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 124) = self->_referenceFrame;
    *(_DWORD *)(v5 + 140) |= 0x40u;
  }
  v27 = -[GEOMapItemInitialRequestData copyWithZone:](self->_requestData, "copyWithZone:", a3, (_QWORD)v33);
  v28 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v27;

  v29 = -[NSString copyWithZone:](self->_placeCacheKey, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v29;

  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    *(_BYTE *)(v5 + 137) = self->_nilPlace;
    *(_DWORD *)(v5 + 140) |= 0x400u;
  }
  v31 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v31;
LABEL_40:

  return (id)v5;
}

- (void)addComponent:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlace _readComponents]((uint64_t)self);
  -[GEOPDPlace _addNoFlagsComponent:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (void)_readComponents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 141) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComponents_tags_5271);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $E293E9EAAB2B8016EDB279585BF8500E flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $E293E9EAAB2B8016EDB279585BF8500E v11;
  $E293E9EAAB2B8016EDB279585BF8500E v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  $E293E9EAAB2B8016EDB279585BF8500E v17;
  PBDataReader *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDPlaceIsDirty((uint64_t)self) & 1) == 0)
  {
    v18 = self->_reader;
    objc_sync_enter(v18);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v19);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v18);
    goto LABEL_50;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlace readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_5;
LABEL_47:
    PBDataWriterWriteInt32Field();
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
    goto LABEL_47;
LABEL_5:
  if ((*(_BYTE *)&flags & 4) != 0)
LABEL_6:
    PBDataWriterWriteUint64Field();
LABEL_7:
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v7 = self->_components;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);
  }

  v11 = self->_flags;
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = self->_flags;
  }
  if ((*(_BYTE *)&v11 & 8) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_mapsId)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_placeLayoutData)
    PBDataWriterWriteSubmessage();
  v12 = self->_flags;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    v12 = self->_flags;
  }
  if ((*(_BYTE *)&v12 & 0x10) != 0)
    PBDataWriterWriteInt32Field();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_abExpBranchIds;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteStringField();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v14);
  }

  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v17 = self->_flags;
  }
  if ((*(_BYTE *)&v17 & 0x40) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_requestData)
    PBDataWriterWriteSubmessage();
  if (self->_placeCacheKey)
    PBDataWriterWriteStringField();
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v20);
LABEL_50:

}

- (void)readAll:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v7;
  int *v8;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (v3)
      v8 = (int *)&readAll__recursiveTag_5323;
    else
      v8 = (int *)&readAll__nonRecursiveTag_5324;
    GEOPDPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (void)enumerateValidComponentsWithValuesUsingBlock:(id)a3
{
  -[GEOPDPlace enumerateComponentsWithOptions:usingBlock:](self, "enumerateComponentsWithOptions:usingBlock:", 3, a3);
}

- (int)referenceFrame
{
  os_unfair_lock_s *p_readerLock;
  $E293E9EAAB2B8016EDB279585BF8500E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_referenceFrame;
  else
    return 0;
}

- (BOOL)statusCodeIsValid
{
  return !-[GEOPDPlace status](self, "status") || -[GEOPDPlace status](self, "status") == 2;
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  $E293E9EAAB2B8016EDB279585BF8500E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x100) != 0)
    return self->_status;
  else
    return 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEOPDPlace _readMapsId]((uint64_t)self);
  return self->_mapsId;
}

- (BOOL)hasMapsId
{
  -[GEOPDPlace _readMapsId]((uint64_t)self);
  return self->_mapsId != 0;
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 141) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags_5272);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (int)resultProviderId
{
  return self->_resultProviderId;
}

- (BOOL)hasResultProviderId
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (BOOL)hasPreferredMuid
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setFirstSeenTimestamp:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[GEOPDPlace components](self, "components", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v9, "hasTimestampFirstSeen") & 1) == 0)
          objc_msgSend(v9, "setTimestampFirstSeen:", a3);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)setReferenceFrame:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40040u;
  self->_referenceFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestData, 0);
  objc_storeStrong((id *)&self->_placeLayoutData, 0);
  objc_storeStrong((id *)&self->_placeCacheKey, 0);
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_abExpBranchIds, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

void __42__GEOPDPlace_PlaceDataExtras___entityName__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bestLocalizedName");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringValue");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)bestName
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDPlace _entityName](self, "_entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    +[GEOPDResultSnippet resultSnippetForPlaceData:](GEOPDResultSnippet, "resultSnippetForPlaceData:", self);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (-[GEOPDResultSnippet _readName](v5), *(_QWORD *)(v6 + 56)))
    {
      -[GEOPDResultSnippet name]((id *)v6);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v4;
}

- (id)_entityName
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__GEOPDPlace_PlaceDataExtras___entityName__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (id)failedPlaceDataForMuid:(unint64_t)a3
{
  GEOPDPlace *v4;

  v4 = objc_alloc_init(GEOPDPlace);
  -[GEOPDPlace setMuid:](v4, "setMuid:", a3);
  -[GEOPDPlace setStatus:](v4, "setStatus:", 20);
  return v4;
}

- (GEOPDPlace)init
{
  GEOPDPlace *v2;
  GEOPDPlace *v3;
  GEOPDPlace *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlace;
  v2 = -[GEOPDPlace init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40100u;
  self->_status = a3;
}

- (void)setMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40002u;
  self->_muid = a3;
}

- (void)setRequestData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x60000u;
  objc_storeStrong((id *)&self->_requestData, a3);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  int v26;
  __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  int v34;
  void *v35;
  const __CFString *v36;
  int v37;
  __CFString *v38;
  void *v39;
  const __CFString *v40;
  int v41;
  uint64_t v42;
  __CFString *v43;
  const __CFString *v44;
  uint64_t v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  _QWORD v61[4];
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 140);
  if ((v5 & 2) == 0)
  {
    if ((v5 & 0x100) == 0)
      goto LABEL_4;
LABEL_35:
    v26 = *(_DWORD *)(a1 + 132);
    if (v26 <= 29)
    {
      v27 = CFSTR("STATUS_SUCCESS");
      switch(v26)
      {
        case 0:
          break;
        case 1:
          v27 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v27 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_106;
        case 5:
          v27 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v26 != 20)
            goto LABEL_106;
          v27 = CFSTR("FAILED_NO_RESULT");
          break;
      }
LABEL_111:
      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("status"));

      if ((*(_DWORD *)(a1 + 140) & 4) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
    if (v26 > 49)
    {
      if (v26 == 50)
      {
        v27 = CFSTR("STATUS_DEDUPED");
        goto LABEL_111;
      }
      if (v26 == 60)
      {
        v27 = CFSTR("VERSION_MISMATCH");
        goto LABEL_111;
      }
    }
    else
    {
      if (v26 == 30)
      {
        v27 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_111;
      }
      if (v26 == 40)
      {
        v27 = CFSTR("FAILED_NOT_AUTHORIZED");
        goto LABEL_111;
      }
    }
LABEL_106:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 132));
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_111;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("muid"));

  v5 = *(_DWORD *)(a1 + 140);
  if ((v5 & 0x100) != 0)
    goto LABEL_35;
LABEL_4:
  if ((v5 & 4) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("preferredMuid");
    else
      v7 = CFSTR("preferred_muid");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
LABEL_9:
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v9 = *(id *)(a1 + 32);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v64 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("component"));
  }
  v16 = *(_DWORD *)(a1 + 140);
  if ((v16 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 128));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("resultProviderId");
    else
      v18 = CFSTR("result_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v16 = *(_DWORD *)(a1 + 140);
  }
  if ((v16 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 96));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("updateVersion");
    else
      v20 = CFSTR("update_version");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend((id)a1, "mapsId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if ((*(_BYTE *)(a1 + 140) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("createdTime");
    else
      v29 = CFSTR("created_time");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

  }
  objc_msgSend((id)a1, "placeLayoutData");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v30, "jsonRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("placeLayoutData");
    }
    else
    {
      objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = CFSTR("place_layout_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  v34 = *(_DWORD *)(a1 + 140);
  if ((v34 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 136));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v36 = CFSTR("isPartiallyClientizedSearchResult");
    else
      v36 = CFSTR("is_partially_clientized_search_result");
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

    v34 = *(_DWORD *)(a1 + 140);
  }
  if ((v34 & 0x10) != 0)
  {
    v37 = *(_DWORD *)(a1 + 116);
    if (v37)
    {
      if (v37 == 1)
      {
        v38 = CFSTR("TOPOGRAPHIC");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 116));
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v38 = CFSTR("DEFAULT");
    }
    objc_msgSend(v4, "setObject:forKey:", v38, CFSTR("mapDisplayType"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend((id)a1, "abExpBranchIds");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("abExpBranchId");
    else
      v40 = CFSTR("ab_exp_branch_id");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  v41 = *(_DWORD *)(a1 + 140);
  if ((v41 & 0x20) != 0)
  {
    v42 = *(int *)(a1 + 120);
    if (v42 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 120));
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E1C0BF20[v42];
    }
    if (a2)
      v44 = CFSTR("rapFlowType");
    else
      v44 = CFSTR("rap_flow_type");
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

    v41 = *(_DWORD *)(a1 + 140);
  }
  if ((v41 & 0x40) != 0)
  {
    v45 = *(int *)(a1 + 124);
    if (v45 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
      v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = off_1E1C0BF60[v45];
    }
    objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("referenceFrame"));

  }
  objc_msgSend((id)a1, "requestData");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("requestData");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("request_data");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  objc_msgSend((id)a1, "placeCacheKey");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
    objc_msgSend(v4, "setObject:forKey:", v51, CFSTR("placeCacheKey"));

  if ((*(_BYTE *)(a1 + 141) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 137));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v53 = CFSTR("nilPlace");
    else
      v53 = CFSTR("nil_place");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

  }
  v54 = *(void **)(a1 + 16);
  if (v54)
  {
    objc_msgSend(v54, "dictionaryRepresentation");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v55;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v55, "count"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __40__GEOPDPlace__dictionaryRepresentation___block_invoke;
      v61[3] = &unk_1E1C00600;
      v58 = v57;
      v62 = v58;
      objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v61);
      v59 = v58;

      v56 = v59;
    }
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)isDisputed
{
  id *v3;
  void *v4;
  id *v5;
  void *v6;
  char v7;
  id *v8;
  void *v9;
  id *v10;
  _BYTE *v11;

  -[GEOPDPlace componentOfType:options:](self, "componentOfType:options:", 1, 3);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponent values](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponentValue entity](v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasIsDisputed"))
  {
    v7 = objc_msgSend(v6, "isDisputed");
  }
  else
  {
    -[GEOPDPlace componentOfType:options:](self, "componentOfType:options:", 77, 3);
    v8 = (id *)objc_claimAutoreleasedReturnValue();

    -[GEOPDComponent values](v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDComponentValue iso3166Code](v10);
    v11 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    v7 = v11 && (v11[64] & 1) != 0 && v11[60] != 0;
    v3 = v8;
  }

  return v7;
}

- (GEOMapItemInitialRequestData)requestData
{
  -[GEOPDPlace _readRequestData]((uint64_t)self);
  return self->_requestData;
}

- (void)_readRequestData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)setNilPlace:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40400u;
  self->_nilPlace = a3;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOPDPlacecardLayoutData)placeLayoutData
{
  -[GEOPDPlace _readPlaceLayoutData]((uint64_t)self);
  return self->_placeLayoutData;
}

- (NSString)placeCacheKey
{
  -[GEOPDPlace _readPlaceCacheKey]((uint64_t)self);
  return self->_placeCacheKey;
}

- (BOOL)nilPlace
{
  return self->_nilPlace;
}

- (GEOPDPlace)initWithData:(id)a3
{
  GEOPDPlace *v3;
  GEOPDPlace *v4;
  GEOPDPlace *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlace;
  v3 = -[GEOPDPlace initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlace _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (void)_readPlaceLayoutData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 142) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceLayoutData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (void)_readPlaceCacheKey
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 141) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCacheKey_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (unsigned)minTTL
{
  unsigned int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int16 v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[GEOPDPlace nilPlace](self, "nilPlace"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[GEOPDPlace components](self, "components", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v5)
    {
      v3 = -1;
      goto LABEL_23;
    }
    v6 = v5;
    v3 = -1;
    v7 = *(_QWORD *)v16;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (v9)
        {
          v10 = *(_WORD *)(v9 + 100);
          if ((v10 & 0x20) == 0)
          {
            if ((v10 & 2) == 0)
              continue;
LABEL_16:
            if (*(_DWORD *)(v9 + 64) == 2)
            {
              v13 = *(_DWORD *)(v9 + 84);
              if (v3 >= v13)
                v3 = v13;
            }
            continue;
          }
          v11 = v10 & 2;
          if (*(_DWORD *)(v9 + 80))
            v12 = 1;
          else
            v12 = v11 == 0;
          if (!v12)
            goto LABEL_16;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (!v6)
      {
LABEL_23:

        return v3;
      }
    }
  }
  return GEOConfigGetUInteger(GeoServicesConfig_PDPlaceCacheNegativeResultTTL, (uint64_t)off_1EDF4D358);
}

- (id)entityComponent
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  int *v7;
  uint64_t i;
  id *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GEOPDPlace components](self, "components");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v24;
    v6 = &OBJC_IVAR___GEOXPCReply__methodName;
    v7 = &OBJC_IVAR___GEOXPCReply__methodName;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(v2);
        v9 = *(id **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v9 && (*(_WORD *)((_BYTE *)v9 + v6[731]) & 0x80) != 0 && *(_DWORD *)((char *)v9 + v7[732]) == 1)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          -[GEOPDComponent values](v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v20;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v20 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(id **)(*((_QWORD *)&v19 + 1) + 8 * j);
                -[GEOPDComponentValue entity](v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  -[GEOPDComponentValue entity](v15);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_23;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
              if (v12)
                continue;
              break;
            }
          }

          v6 = &OBJC_IVAR___GEOXPCReply__methodName;
          v7 = &OBJC_IVAR___GEOXPCReply__methodName;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      v17 = 0;
    }
    while (v4);
  }
  else
  {
    v17 = 0;
  }
LABEL_23:

  return v17;
}

- (BOOL)shouldCacheByIDForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "requestType") != 2 && objc_msgSend(v5, "requestType") != 19)
    goto LABEL_7;
  if ((GEOConfigGetBOOL(GeoServicesConfig_PlaceCacheFwdGeoSubpremisesCanCacheByID, (uint64_t)off_1EDF4D308) & 1) != 0)
    goto LABEL_7;
  v6 = (void *)MEMORY[0x18D764E2C]();
  +[GEOAddressObject addressObjectForPlaceData:](GEOAddressObject, "addressObjectForPlaceData:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "address");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "structuredAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "subPremisesCount");

  objc_autoreleasePoolPop(v6);
  if (v10)
    v11 = 0;
  else
LABEL_7:
    v11 = 1;

  return v11;
}

- (id)pdPlaceCacheKeyForRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  if (!-[GEOPDPlace shouldCacheByIDForRequest:](self, "shouldCacheByIDForRequest:", a3))
    goto LABEL_9;
  if (!-[GEOPDPlace hasMuid](self, "hasMuid"))
  {
    -[GEOPDPlace mapsId](self, "mapsId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "shardedId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasMuid");

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      -[GEOPDPlace mapsId](self, "mapsId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shardedId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("muid-%llu"), objc_msgSend(v10, "muid"));
LABEL_8:
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    -[GEOPDPlace mapsId](self, "mapsId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shardedId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasBasemapId");

    if (v13)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[GEOPDPlace mapsId](self, "mapsId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "shardedId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("bmid-%llu"), objc_msgSend(v10, "basemapId"));
      goto LABEL_8;
    }
LABEL_9:
    -[GEOPDPlace cacheKey](self, "cacheKey");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "description");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    return v4;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("muid-%llu"), -[GEOPDPlace muid](self, "muid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  return v4;
}

- (BOOL)isCacheable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  BOOL v10;
  BOOL v11;
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
  -[GEOPDPlace components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v5)
        objc_enumerationMutation(v2);
      v7 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v6);
      if (v7)
      {
        v8 = *(_WORD *)(v7 + 100);
        if ((v8 & 0x20) != 0)
        {
          v9 = v8 & 2;
          if (*(_DWORD *)(v7 + 80))
            v10 = 1;
          else
            v10 = v9 == 0;
          if (!v10)
          {
LABEL_14:
            if (*(_DWORD *)(v7 + 64) != 2)
            {
              v11 = 0;
              goto LABEL_19;
            }
          }
        }
        else if ((v8 & 2) != 0)
        {
          goto LABEL_14;
        }
      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }
  v11 = 1;
LABEL_19:

  return v11;
}

- (id)calculateMissingComponentTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[GEOPDPlace components](self, "components", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (v11 && (*(_WORD *)(v11 + 100) & 0x80) != 0)
            v12 = *(unsigned int *)(v11 + 88);
          else
            v12 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "removeObject:", v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)successfulComponentWithValuesOfType:(int)a3
{
  return -[GEOPDPlace componentOfType:options:](self, "componentOfType:options:", *(_QWORD *)&a3, 3);
}

- (id)phoneNumbers
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__GEOPDPlace_PlaceDataExtras__phoneNumbers__block_invoke;
  v8[3] = &unk_1E1C09808;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __43__GEOPDPlace_PlaceDataExtras__phoneNumbers__block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[GEOPDComponentValue entity](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "telephone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_cleanedPhoneNumberForPhoneNumberRepresentation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "altTelephones", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(a1 + 32), "_cleanedPhoneNumberForPhoneNumberRepresentation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

  }
}

- (BOOL)phoneNumberOptsOutOfAds:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__GEOPDPlace_PlaceDataExtras__phoneNumberOptsOutOfAds___block_invoke;
  v7[3] = &unk_1E1C09830;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __55__GEOPDPlace_PlaceDataExtras__phoneNumberOptsOutOfAds___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "telephone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_cleanedPhoneNumberForPhoneNumberRepresentation:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 40)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "telephoneAdsOptOut");
      *a3 = 1;
    }
    else
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      objc_msgSend(v6, "altTelephones", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v18;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v18 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(a1 + 32), "_cleanedPhoneNumberForPhoneNumberRepresentation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15 && objc_msgSend(v15, "isEqualToString:", *(_QWORD *)(a1 + 40)))
            {
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "telephoneAdsOptOut");
              *a3 = 1;

              goto LABEL_16;
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_16:

    }
  }

}

- (BOOL)hasExpiredComponentsAsOf:(double)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__GEOPDPlace_PlaceDataExtras__hasExpiredComponentsAsOf___block_invoke;
  v5[3] = &unk_1E1C09858;
  *(double *)&v5[5] = a3;
  v5[4] = &v6;
  -[GEOPDPlace enumerateComponentsWithOptions:usingBlock:](self, "enumerateComponentsWithOptions:usingBlock:", 1, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __56__GEOPDPlace_PlaceDataExtras__hasExpiredComponentsAsOf___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  int v5;
  void *v6;
  unint64_t v7;
  double v8;
  id v9;

  v9 = a2;
  v5 = objc_msgSend(v9, "hasTimestampFirstSeen");
  v6 = v9;
  if (v9)
  {
    if (v5)
    {
      if ((*((_WORD *)v9 + 50) & 0x40) != 0)
      {
        if (*((_DWORD *)v9 + 21))
        {
          objc_msgSend(v9, "timestampFirstSeen");
          v6 = v9;
          LODWORD(v7) = *((_DWORD *)v9 + 21);
          if (v8 + (double)v7 < *(double *)(a1 + 40))
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
            *a3 = 1;
          }
        }
      }
    }
  }

}

- (id)_cleanedPhoneNumberForPhoneNumberRepresentation:(id)a3
{
  if (!a3)
    return 0;
  +[GEOPNRUtils _stringByStrippingFormattingAndNotVisiblyAllowable:](GEOPNRUtils, "_stringByStrippingFormattingAndNotVisiblyAllowable:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)spokenNameForLocale:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__36;
    v15 = __Block_byref_object_dispose__36;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51__GEOPDPlace_PlaceDataExtras__spokenNameForLocale___block_invoke;
    v8[3] = &unk_1E1C09880;
    v10 = &v11;
    v9 = v4;
    -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51__GEOPDPlace_PlaceDataExtras__spokenNameForLocale___block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "spokenNames");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOLocalizedString bestString:forPreferredLanguages:fallbackToFirstAvailable:](GEOLocalizedString, "bestString:forPreferredLanguages:fallbackToFirstAvailable:", v7, v8, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a3 = 1;
  }

}

- (id)secondaryName
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__GEOPDPlace_PlaceDataExtras__secondaryName__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__GEOPDPlace_PlaceDataExtras__secondaryName__block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    objc_msgSend(v5, "secondaryName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v5 = v10;
    *a3 = 1;
  }

}

- (id)secondarySpokenName
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__GEOPDPlace_PlaceDataExtras__secondarySpokenName__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__GEOPDPlace_PlaceDataExtras__secondarySpokenName__block_invoke(uint64_t a1, id *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  -[GEOPDComponentValue entity](a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v10 = v5;
    objc_msgSend(v5, "secondarySpokenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringValue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v5 = v10;
    *a3 = 1;
  }

}

- (BOOL)isStandAloneBrand
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__GEOPDPlace_PlaceDataExtras__isStandAloneBrand__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __48__GEOPDPlace_PlaceDataExtras__isStandAloneBrand__block_invoke(uint64_t a1, id *a2)
{
  id v3;

  -[GEOPDComponentValue entity](a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasIsStandaloneBrand"))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "isStandaloneBrand");

}

- (BOOL)hasBrandMUID
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43__GEOPDPlace_PlaceDataExtras__hasBrandMUID__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __43__GEOPDPlace_PlaceDataExtras__hasBrandMUID__block_invoke(uint64_t a1, id *a2)
{
  id v3;

  -[GEOPDComponentValue entity](a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "hasBrandMuid");

}

- (unint64_t)brandMUID
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__GEOPDPlace_PlaceDataExtras__brandMUID__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __40__GEOPDPlace_PlaceDataExtras__brandMUID__block_invoke(uint64_t a1, id *a2)
{
  id v3;

  -[GEOPDComponentValue entity](a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasBrandMuid"))
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "brandMuid");

}

- (id)businessURL
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__36;
  v9 = __Block_byref_object_dispose__36;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__GEOPDPlace_PlaceDataExtras__businessURL__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __42__GEOPDPlace_PlaceDataExtras__businessURL__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  -[GEOPDComponentValue entity](a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "url");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (int)placeDisplayType
{
  int v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  int v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__GEOPDPlace_PlaceDataExtras__placeDisplayType__block_invoke;
  v4[3] = &unk_1E1C09718;
  v4[4] = &v5;
  -[GEOPDPlace enumerateValidComponentValuesOfType:usingBlock:](self, "enumerateValidComponentValuesOfType:usingBlock:", 1, v4);
  if (*((_DWORD *)v6 + 6) >= 6u)
    v2 = 0;
  else
    v2 = *((_DWORD *)v6 + 6);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __47__GEOPDPlace_PlaceDataExtras__placeDisplayType__block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  id v5;

  -[GEOPDComponentValue entity](a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v5, "placeDisplayType");
  *a3 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != 0;

}

+ (id)attributionForPlaceData:(id)a3 type:(int)a4
{
  uint64_t v4;
  id v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__36;
  v13 = __Block_byref_object_dispose__36;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__GEOPDPlace_PlaceDataExtras__attributionForPlaceData_type___block_invoke;
  v8[3] = &unk_1E1C09768;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateComponentOfType:enumerationOptions:usingBlock:", v4, 1, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __60__GEOPDPlace_PlaceDataExtras__attributionForPlaceData_type___block_invoke(uint64_t a1, id *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[GEOPDComponent attribution](a2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) != 0;
}

- (id)copyWithoutETAComponents
{
  void *v2;

  v2 = (void *)-[GEOPDPlace copy](self, "copy");
  objc_msgSend(v2, "_removeETAComponents");
  return v2;
}

- (void)_removeETAComponents
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__GEOPDPlace_PlaceDataExtras___removeETAComponents__block_invoke;
  v6[3] = &unk_1E1C098A8;
  v5 = v3;
  v7 = v5;
  -[GEOPDPlace enumerateComponentOfType:enumerationOptions:usingBlock:](self, "enumerateComponentOfType:enumerationOptions:usingBlock:", 12, 0, v6);
  if (objc_msgSend(v5, "count"))
  {
    -[GEOPDPlace components](self, "components");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

uint64_t __51__GEOPDPlace_PlaceDataExtras___removeETAComponents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)copyWithStrippedOptionalData
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  uint64_t v12;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = (void *)-[GEOPDPlace copy](self, "copy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v2, "components", 0);
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
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        if (v9 && (*(_WORD *)(v9 + 100) & 0x80) != 0)
        {
          v10 = *(_DWORD *)(v9 + 88);
          v11 = v10 > 0x29;
          v12 = (1 << v10) & 0x2008000002ELL;
          if (!v11 && v12 != 0)
            objc_msgSend(v3, "addObject:");
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v2, "setComponents:", v3);
  return v2;
}

- (double)firstSeenTimestamp
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  double v9;
  double v10;
  double result;
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
  -[GEOPDPlace components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = 1.79769313e308;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "hasTimestampFirstSeen"))
        {
          objc_msgSend(v8, "timestampFirstSeen");
          if (v9 < v6)
          {
            objc_msgSend(v8, "timestampFirstSeen");
            v6 = v10;
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1.79769313e308;
  }

  result = 0.0;
  if (v6 != 1.79769313e308)
    return v6;
  return result;
}

- (void)forceUncacheable
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GEOPDPlace components](self, "components", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if (v7)
        {
          *(_WORD *)(v7 + 100) |= 2u;
          *(_DWORD *)(v7 + 64) = 1;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)cacheKey
{
  void *v3;
  void *v4;
  void *v5;

  -[GEOPDPlace placeCacheKey](self, "placeCacheKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlace setPlaceCacheKey:](self, "setPlaceCacheKey:", v5);

  }
  return -[GEOPDPlace placeCacheKey](self, "placeCacheKey");
}

- (id)compactDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  void *v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[GEOPDPlace mapsId](self, "mapsId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("identifier: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v6);

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[GEOPDPlace resultProviderId](self, "resultProviderId"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR(" | provider: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v9);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[GEOPDPlace components](self, "components");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14);
        if (!v15)
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
LABEL_10:
          v18 = CFSTR("COMPONENT_TYPE_UNKNOWN");
LABEL_11:
          objc_msgSend(v17, "stringWithFormat:", CFSTR(" | %@"), v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendString:", v19);

          goto LABEL_12;
        }
        v16 = *(_WORD *)(v15 + 100);
        if ((v16 & 0x20) == 0 || !*(_DWORD *)(v15 + 80))
        {
          v17 = (void *)MEMORY[0x1E0CB3940];
          if ((v16 & 0x80) == 0)
            goto LABEL_10;
          v20 = *(unsigned int *)(v15 + 88);
          v18 = CFSTR("COMPONENT_TYPE_UNKNOWN");
          switch((int)v20)
          {
            case 0:
              goto LABEL_11;
            case 1:
              v18 = CFSTR("COMPONENT_TYPE_ENTITY");
              break;
            case 2:
              v18 = CFSTR("COMPONENT_TYPE_PLACE_INFO");
              break;
            case 3:
              v18 = CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO");
              break;
            case 4:
              v18 = CFSTR("COMPONENT_TYPE_BOUNDS");
              break;
            case 5:
              v18 = CFSTR("COMPONENT_TYPE_ADDRESS");
              break;
            case 6:
              v18 = CFSTR("COMPONENT_TYPE_RATING");
              break;
            case 7:
              v18 = CFSTR("COMPONENT_TYPE_REVIEW");
              break;
            case 8:
              v18 = CFSTR("COMPONENT_TYPE_PHOTO");
              break;
            case 9:
              v18 = CFSTR("COMPONENT_TYPE_HOURS");
              break;
            case 10:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO");
              break;
            case 11:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE");
              break;
            case 12:
              v18 = CFSTR("COMPONENT_TYPE_ETA");
              break;
            case 13:
              v18 = CFSTR("COMPONENT_TYPE_FLYOVER");
              break;
            case 14:
              v18 = CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE");
              break;
            case 15:
              v18 = CFSTR("COMPONENT_TYPE_AMENITIES");
              break;
            case 16:
              v18 = CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES");
              break;
            case 20:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT");
              break;
            case 21:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO");
              break;
            case 22:
              v18 = CFSTR("COMPONENT_TYPE_TEXT_BLOCK");
              break;
            case 23:
              v18 = CFSTR("COMPONENT_TYPE_FACTOID");
              break;
            case 24:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION");
              break;
            case 25:
              v18 = CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM");
              break;
            case 26:
              v18 = CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO");
              break;
            case 27:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET");
              break;
            case 29:
              v18 = CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION");
              break;
            case 30:
              v18 = CFSTR("COMPONENT_TYPE_RESULT_SNIPPET");
              break;
            case 31:
              v18 = CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT");
              break;
            case 32:
              v18 = CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT");
              break;
            case 33:
              v18 = CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK");
              break;
            case 34:
              v18 = CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT");
              break;
            case 36:
              v18 = CFSTR("COMPONENT_TYPE_TIP");
              break;
            case 37:
              v18 = CFSTR("COMPONENT_TYPE_PLACECARD_URL");
              break;
            case 38:
              v18 = CFSTR("COMPONENT_TYPE_ASSOCIATED_APP");
              break;
            case 39:
              v18 = CFSTR("COMPONENT_TYPE_MESSAGE_LINK");
              break;
            case 40:
              v18 = CFSTR("COMPONENT_TYPE_QUICK_LINK");
              break;
            case 41:
              v18 = CFSTR("COMPONENT_TYPE_RAP");
              break;
            case 42:
              v18 = CFSTR("COMPONENT_TYPE_OFFLINE_AREA");
              break;
            case 43:
              v18 = CFSTR("COMPONENT_TYPE_LOCATION_EVENT");
              break;
            case 44:
              v18 = CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS");
              break;
            case 45:
              v18 = CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER");
              break;
            case 46:
              v18 = CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES");
              break;
            case 47:
              v18 = CFSTR("COMPONENT_TYPE_OFFLINE_SIZE");
              break;
            case 48:
              v18 = CFSTR("COMPONENT_TYPE_VENUE_INFO");
              break;
            case 49:
              v18 = CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST");
              break;
            case 50:
              v18 = CFSTR("COMPONENT_TYPE_CONTAINED_PLACE");
              break;
            case 51:
              v18 = CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT");
              break;
            case 52:
              v18 = CFSTR("COMPONENT_TYPE_ICON");
              break;
            case 53:
              v18 = CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION");
              break;
            case 54:
              v18 = CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES");
              break;
            case 55:
              v18 = CFSTR("COMPONENT_TYPE_STOREFRONT");
              break;
            case 56:
              v18 = CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL");
              break;
            case 57:
              v18 = CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST");
              break;
            case 58:
              v18 = CFSTR("COMPONENT_TYPE_POI_EVENT");
              break;
            case 59:
              v18 = CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION");
              break;
            case 60:
              v18 = CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT");
              break;
            case 61:
              v18 = CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER");
              break;
            case 62:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION");
              break;
            case 63:
              v18 = CFSTR("COMPONENT_TYPE_LINKED_SERVICE");
              break;
            case 64:
              v18 = CFSTR("COMPONENT_TYPE_BUSINESS_HOURS");
              break;
            case 65:
              v18 = CFSTR("COMPONENT_TYPE_COLLECTION");
              break;
            case 66:
              v18 = CFSTR("COMPONENT_TYPE_RELATED_PLACE");
              break;
            case 67:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP");
              break;
            case 68:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME");
              break;
            case 69:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY");
              break;
            case 70:
              v18 = CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES");
              break;
            case 71:
              v18 = CFSTR("COMPONENT_TYPE_PUBLISHER");
              break;
            case 72:
              v18 = CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES");
              break;
            case 73:
              v18 = CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE");
              break;
            case 74:
              v18 = CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM");
              break;
            case 76:
              v18 = CFSTR("COMPONENT_TYPE_COLLECTION_IDS");
              break;
            case 77:
              v18 = CFSTR("COMPONENT_TYPE_ISO_3166_CODE");
              break;
            case 78:
              v18 = CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES");
              break;
            case 79:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE");
              break;
            case 81:
              v18 = CFSTR("COMPONENT_TYPE_STOREFRONT_FACES");
              break;
            case 82:
              v18 = CFSTR("COMPONENT_TYPE_GUIDE_GROUP");
              break;
            case 83:
              v18 = CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE");
              break;
            case 84:
              v18 = CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS");
              break;
            case 85:
              v18 = CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES");
              break;
            case 86:
              v18 = CFSTR("COMPONENT_TYPE_ABOUT");
              break;
            case 87:
              v18 = CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY");
              break;
            case 88:
              v18 = CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT");
              break;
            case 89:
              v18 = CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE");
              break;
            case 90:
              v18 = CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT");
              break;
            case 91:
              v18 = CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO");
              break;
            case 92:
              v18 = CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS");
              break;
            case 93:
              v18 = CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO");
              break;
            case 94:
              v18 = CFSTR("COMPONENT_TYPE_ACTION_DATA");
              break;
            case 95:
              v18 = CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA");
              break;
            case 96:
              v18 = CFSTR("COMPONENT_TYPE_POI_CLAIM");
              break;
            case 97:
              v18 = CFSTR("COMPONENT_TYPE_EV_CHARGER");
              break;
            case 98:
              v18 = CFSTR("COMPONENT_TYPE_TRAIL_HEAD");
              break;
            case 99:
              v18 = CFSTR("COMPONENT_TYPE_TOOL_TIP");
              break;
            case 100:
              v18 = CFSTR("COMPONENT_TYPE_REFRESH_ID");
              break;
            case 101:
              v18 = CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS");
              break;
            case 102:
              v18 = CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO");
              break;
            case 103:
              v18 = CFSTR("COMPONENT_TYPE_FORWARD_INFO");
              break;
            case 104:
              v18 = CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO");
              break;
            case 105:
              v18 = CFSTR("COMPONENT_TYPE_HIKE_SUMMARY");
              break;
            case 106:
              v18 = CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY");
              break;
            default:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v20);
              v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
              break;
          }
          goto LABEL_11;
        }
LABEL_12:
        ++v14;
      }
      while (v12 != v14);
      v21 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v12 = v21;
    }
    while (v21);
  }

  return v3;
}

- (unint64_t)muid
{
  return self->_muid;
}

- (void)setHasMuid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262146;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (void)setHasStatus:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262400;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasStatus
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)preferredMuid
{
  return self->_preferredMuid;
}

- (void)setPreferredMuid:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40004u;
  self->_preferredMuid = a3;
}

- (void)setHasPreferredMuid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262148;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFBFFFB | v3);
}

- (void)setComponents:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *components;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  components = self->_components;
  self->_components = v4;

}

- (void)clearComponents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  -[NSMutableArray removeAllObjects](self->_components, "removeAllObjects");
}

- (unint64_t)componentsCount
{
  -[GEOPDPlace _readComponents]((uint64_t)self);
  return -[NSMutableArray count](self->_components, "count");
}

- (id)componentAtIndex:(unint64_t)a3
{
  -[GEOPDPlace _readComponents]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_components, "objectAtIndex:", a3);
}

+ (Class)componentType
{
  return (Class)objc_opt_class();
}

- (void)setResultProviderId:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40080u;
  self->_resultProviderId = a3;
}

- (void)setHasResultProviderId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262272;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (unint64_t)updateVersion
{
  return self->_updateVersion;
}

- (void)setUpdateVersion:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40008u;
  self->_updateVersion = a3;
}

- (void)setHasUpdateVersion:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262152;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasUpdateVersion
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)setMapsId:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x44000u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (unint64_t)createdTime
{
  return self->_createdTime;
}

- (void)setCreatedTime:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x40001u;
  self->_createdTime = a3;
}

- (void)setHasCreatedTime:(BOOL)a3
{
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFFE | a3 | 0x40000);
}

- (BOOL)hasCreatedTime
{
  return *(_DWORD *)&self->_flags & 1;
}

- (BOOL)hasPlaceLayoutData
{
  -[GEOPDPlace _readPlaceLayoutData]((uint64_t)self);
  return self->_placeLayoutData != 0;
}

- (void)setPlaceLayoutData:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x50000u;
  objc_storeStrong((id *)&self->_placeLayoutData, a3);
}

- (BOOL)isPartiallyClientizedSearchResult
{
  return self->_isPartiallyClientizedSearchResult;
}

- (void)setIsPartiallyClientizedSearchResult:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x40200u;
  self->_isPartiallyClientizedSearchResult = a3;
}

- (void)setHasIsPartiallyClientizedSearchResult:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262656;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasIsPartiallyClientizedSearchResult
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (int)mapDisplayType
{
  os_unfair_lock_s *p_readerLock;
  $E293E9EAAB2B8016EDB279585BF8500E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_mapDisplayType;
  else
    return 0;
}

- (void)setMapDisplayType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40010u;
  self->_mapDisplayType = a3;
}

- (void)setHasMapDisplayType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262160;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasMapDisplayType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (id)mapDisplayTypeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("DEFAULT");
  if (a3 == 1)
  {
    v3 = CFSTR("TOPOGRAPHIC");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsMapDisplayType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("TOPOGRAPHIC"));

  return v4;
}

- (void)_readAbExpBranchIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_BYTE *)(a1 + 141) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbExpBranchIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (NSMutableArray)abExpBranchIds
{
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  return self->_abExpBranchIds;
}

- (void)setAbExpBranchIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *abExpBranchIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  abExpBranchIds = self->_abExpBranchIds;
  self->_abExpBranchIds = v4;

}

- (void)clearAbExpBranchIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
  -[NSMutableArray removeAllObjects](self->_abExpBranchIds, "removeAllObjects");
}

- (void)addAbExpBranchId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  -[GEOPDPlace _addNoFlagsAbExpBranchId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x40000u;
}

- (void)_addNoFlagsAbExpBranchId:(uint64_t)a1
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

- (unint64_t)abExpBranchIdsCount
{
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  return -[NSMutableArray count](self->_abExpBranchIds, "count");
}

- (id)abExpBranchIdAtIndex:(unint64_t)a3
{
  -[GEOPDPlace _readAbExpBranchIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_abExpBranchIds, "objectAtIndex:", a3);
}

+ (Class)abExpBranchIdType
{
  return (Class)objc_opt_class();
}

- (int)rapFlowType
{
  os_unfair_lock_s *p_readerLock;
  $E293E9EAAB2B8016EDB279585BF8500E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_rapFlowType;
  else
    return 0;
}

- (void)setRapFlowType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x40020u;
  self->_rapFlowType = a3;
}

- (void)setHasRapFlowType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262176;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasRapFlowType
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (id)rapFlowTypeAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C0BF20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRapFlowType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_POI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_LOCALITY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_EV")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_HIKING_TRAIL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_HIKING_TRAILHEAD")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_ADDRESS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_FLOW_TRANSIT")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDPlace;
  -[GEOPDPlace description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlace dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlace _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOPDPlace__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "base64EncodedStringWithOptions:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "description");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v9);

  }
  else
  {
    objc_msgSend(v10, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, v8);
  }

}

- (GEOPDPlace)initWithDictionary:(id)a3
{
  return (GEOPDPlace *)-[GEOPDPlace _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(id)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  GEOPDComponent *v21;
  char *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEOPDMapsIdentifier *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  GEOPDPlacecardLayoutData *v37;
  GEOPDPlacecardLayoutData *v38;
  id v39;
  const __CFString *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const __CFString *v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  GEOPDModuleConfiguration *v49;
  id v50;
  void *v51;
  int v52;
  void *v53;
  GEOPDModuleConfigurationValue *v54;
  id *v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  GEOPDPlacecardLayoutConfiguration *v59;
  GEOPDPlacecardLayoutConfiguration *v60;
  GEOPDPlacecardLayoutConfiguration *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  id v65;
  uint64_t v66;
  const __CFString *v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t i;
  void *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  id v78;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  const __CFString *v83;
  void *v84;
  GEOMapItemInitialRequestData *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v93;
  id v94;
  void *v95;
  id v96;
  const __CFString *v97;
  const __CFString *v98;
  GEOPDPlacecardLayoutData *v99;
  id obj;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_226;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("muid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setMuid:", objc_msgSend(v7, "unsignedLongLongValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
      {
        v10 = 5;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
      {
        v10 = 20;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
      {
        v10 = 30;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
      {
        v10 = 40;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
      {
        v10 = 50;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
      {
        v10 = 60;
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_29;
      v10 = objc_msgSend(v8, "intValue");
    }
    objc_msgSend(v6, "setStatus:", v10);
LABEL_29:

    if ((_DWORD)a3)
      v11 = CFSTR("preferredMuid");
    else
      v11 = CFSTR("preferred_muid");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setPreferredMuid:", objc_msgSend(v12, "unsignedLongLongValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("component"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v14 = (uint64_t)a3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      a3 = v5;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v15 = v13;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v106;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v106 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * v19);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v21 = [GEOPDComponent alloc];
              if (v21)
                v22 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v21, v20, v14);
              else
                v22 = 0;
              objc_msgSend(v6, "addComponent:", v22);

            }
            ++v19;
          }
          while (v17 != v19);
          v23 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v105, v114, 16);
          v17 = v23;
        }
        while (v23);
      }

      v5 = a3;
      LODWORD(a3) = v14;
    }

    if ((_DWORD)a3)
      v24 = CFSTR("resultProviderId");
    else
      v24 = CFSTR("result_provider_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setResultProviderId:", objc_msgSend(v25, "intValue"));

    if ((_DWORD)a3)
      v26 = CFSTR("updateVersion");
    else
      v26 = CFSTR("update_version");
    objc_msgSend(v5, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setUpdateVersion:", objc_msgSend(v27, "unsignedLongLongValue"));

    if ((_DWORD)a3)
      v28 = CFSTR("mapsId");
    else
      v28 = CFSTR("maps_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = [GEOPDMapsIdentifier alloc];
      if ((a3 & 1) != 0)
        v31 = -[GEOPDMapsIdentifier initWithJSON:](v30, "initWithJSON:", v29);
      else
        v31 = -[GEOPDMapsIdentifier initWithDictionary:](v30, "initWithDictionary:", v29);
      v32 = (void *)v31;
      objc_msgSend(v6, "setMapsId:", v31);

    }
    if ((_DWORD)a3)
      v33 = CFSTR("createdTime");
    else
      v33 = CFSTR("created_time");
    objc_msgSend(v5, "objectForKeyedSubscript:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setCreatedTime:", objc_msgSend(v34, "unsignedLongLongValue"));

    if ((_DWORD)a3)
      v35 = CFSTR("placeLayoutData");
    else
      v35 = CFSTR("place_layout_data");
    objc_msgSend(v5, "objectForKeyedSubscript:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v37 = [GEOPDPlacecardLayoutData alloc];
      if (v37)
      {
        v38 = v37;
        v39 = v36;
        v99 = -[GEOPDPlacecardLayoutData init](v38, "init");
        if (v99)
        {
          if ((_DWORD)a3)
            v40 = CFSTR("moduleConfiguration");
          else
            v40 = CFSTR("module_configuration");
          objc_msgSend(v39, "objectForKeyedSubscript:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v94 = v39;
            v95 = v36;
            v96 = v5;
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            v93 = v41;
            obj = v41;
            v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
            if (!v42)
              goto LABEL_134;
            v43 = v42;
            v44 = *(_QWORD *)v110;
            if ((_DWORD)a3)
              v45 = CFSTR("moduleConfigurationType");
            else
              v45 = CFSTR("module_configuration_type");
            v46 = CFSTR("module_configuration_value");
            if ((_DWORD)a3)
              v46 = CFSTR("moduleConfigurationValue");
            v97 = v46;
            v98 = v45;
            while (1)
            {
              v47 = 0;
              do
              {
                if (*(_QWORD *)v110 != v44)
                  objc_enumerationMutation(obj);
                v48 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v47);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v49 = [GEOPDModuleConfiguration alloc];
                  if (v49)
                  {
                    v50 = v48;
                    v49 = -[GEOPDModuleConfiguration init](v49, "init");
                    if (v49)
                    {
                      objc_msgSend(v50, "objectForKeyedSubscript:", v98);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        a3 = v51;
                        if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_UNKNOWN")) & 1) != 0)
                        {
                          v52 = 0;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_PLACE_RIBBON")) & 1) != 0)
                        {
                          v52 = 1;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_ACTIONS")) & 1) != 0)
                        {
                          v52 = 2;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_RELATED_PLACE")) & 1) != 0)
                        {
                          v52 = 3;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_WEB_CONTENT")) & 1) != 0)
                        {
                          v52 = 4;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_TEMPLATE_PLACE")) & 1) != 0)
                        {
                          v52 = 5;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_PLACE_INFOS")) & 1) != 0)
                        {
                          v52 = 6;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_BUSINESS_INFOS")) & 1) != 0)
                        {
                          v52 = 7;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_HEADER_BUTTONS")) & 1) != 0)
                        {
                          v52 = 8;
                        }
                        else if ((objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_UNIFIED_ACTIONS")) & 1) != 0)
                        {
                          v52 = 9;
                        }
                        else if (objc_msgSend(a3, "isEqualToString:", CFSTR("MODULE_CONFIGURATION_TYPE_HIKING_ASSOCIATION")))
                        {
                          v52 = 10;
                        }
                        else
                        {
                          v52 = 0;
                        }

                        LODWORD(a3) = v14;
LABEL_122:
                        *(_BYTE *)&v49->_flags |= 1u;
                        v49->_moduleConfigurationType = v52;
                      }
                      else
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v52 = objc_msgSend(v51, "intValue");
                          goto LABEL_122;
                        }
                      }

                      objc_msgSend(v50, "objectForKeyedSubscript:", v97);
                      v53 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v54 = [GEOPDModuleConfigurationValue alloc];
                        if (v54)
                          v55 = -[GEOPDModuleConfigurationValue _initWithDictionary:isJSON:](v54, v53, (int)a3);
                        else
                          v55 = 0;
                        -[GEOPDModuleConfiguration setModuleConfigurationValue:]((uint64_t)v49, v55);

                      }
                    }

                  }
                  -[GEOPDPlacecardLayoutData addModuleConfiguration:]((uint64_t)v99, v49);

                }
                ++v47;
              }
              while (v43 != v47);
              v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v115, 16);
              v43 = v56;
              if (!v56)
              {
LABEL_134:

                v36 = v95;
                v5 = v96;
                v41 = v93;
                v39 = v94;
                break;
              }
            }
          }

          if ((_DWORD)a3)
            v57 = CFSTR("layoutConfiguration");
          else
            v57 = CFSTR("layout_configuration");
          objc_msgSend(v39, "objectForKeyedSubscript:", v57, v93, v94, v95, v96);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v59 = [GEOPDPlacecardLayoutConfiguration alloc];
            if ((a3 & 1) != 0)
              v60 = -[GEOPDPlacecardLayoutConfiguration initWithJSON:](v59, "initWithJSON:", v58);
            else
              v60 = -[GEOPDPlacecardLayoutConfiguration initWithDictionary:](v59, "initWithDictionary:", v58);
            v61 = v60;
            -[GEOPDPlacecardLayoutData setLayoutConfiguration:]((uint64_t)v99, v60);

          }
        }

      }
      else
      {
        v99 = 0;
      }
      objc_msgSend(v6, "setPlaceLayoutData:", v99);

    }
    if ((_DWORD)a3)
      v62 = CFSTR("isPartiallyClientizedSearchResult");
    else
      v62 = CFSTR("is_partially_clientized_search_result");
    objc_msgSend(v5, "objectForKeyedSubscript:", v62);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setIsPartiallyClientizedSearchResult:", objc_msgSend(v63, "BOOLValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapDisplayType"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v65 = v64;
      if ((objc_msgSend(v65, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
        v66 = 0;
      else
        v66 = objc_msgSend(v65, "isEqualToString:", CFSTR("TOPOGRAPHIC"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_159;
      v66 = objc_msgSend(v64, "intValue");
    }
    objc_msgSend(v6, "setMapDisplayType:", v66);
LABEL_159:

    if ((_DWORD)a3)
      v67 = CFSTR("abExpBranchId");
    else
      v67 = CFSTR("ab_exp_branch_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v69 = v68;
      v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
      if (v70)
      {
        v71 = v70;
        v72 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v71; ++i)
          {
            if (*(_QWORD *)v102 != v72)
              objc_enumerationMutation(v69);
            v74 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v75 = (void *)objc_msgSend(v74, "copy");
              objc_msgSend(v6, "addAbExpBranchId:", v75);

            }
          }
          v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v101, v113, 16);
        }
        while (v71);
      }

    }
    if ((_DWORD)a3)
      v76 = CFSTR("rapFlowType");
    else
      v76 = CFSTR("rap_flow_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v76);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v78 = v77;
      if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_UNKNOWN")) & 1) != 0)
      {
        v79 = 0;
      }
      else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_POI")) & 1) != 0)
      {
        v79 = 1;
      }
      else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_LOCALITY")) & 1) != 0)
      {
        v79 = 2;
      }
      else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_EV")) & 1) != 0)
      {
        v79 = 3;
      }
      else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_HIKING_TRAIL")) & 1) != 0)
      {
        v79 = 4;
      }
      else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_HIKING_TRAILHEAD")) & 1) != 0)
      {
        v79 = 5;
      }
      else if ((objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_ADDRESS")) & 1) != 0)
      {
        v79 = 6;
      }
      else if (objc_msgSend(v78, "isEqualToString:", CFSTR("RAP_FLOW_TRANSIT")))
      {
        v79 = 7;
      }
      else
      {
        v79 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_198;
      v79 = objc_msgSend(v77, "intValue");
    }
    objc_msgSend(v6, "setRapFlowType:", v79);
LABEL_198:

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("referenceFrame"));
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v81 = v80;
      if ((objc_msgSend(v81, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v82 = 0;
      }
      else if ((objc_msgSend(v81, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
      {
        v82 = 1;
      }
      else if (objc_msgSend(v81, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
      {
        v82 = 2;
      }
      else
      {
        v82 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_210:

        if ((_DWORD)a3)
          v83 = CFSTR("requestData");
        else
          v83 = CFSTR("request_data");
        objc_msgSend(v5, "objectForKeyedSubscript:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v85 = [GEOMapItemInitialRequestData alloc];
          if ((a3 & 1) != 0)
            v86 = -[GEOMapItemInitialRequestData initWithJSON:](v85, "initWithJSON:", v84);
          else
            v86 = -[GEOMapItemInitialRequestData initWithDictionary:](v85, "initWithDictionary:", v84);
          v87 = (void *)v86;
          objc_msgSend(v6, "setRequestData:", v86);

        }
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeCacheKey"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v89 = (void *)objc_msgSend(v88, "copy");
          objc_msgSend(v6, "setPlaceCacheKey:", v89);

        }
        if ((_DWORD)a3)
          v90 = CFSTR("nilPlace");
        else
          v90 = CFSTR("nil_place");
        objc_msgSend(v5, "objectForKeyedSubscript:", v90);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setNilPlace:", objc_msgSend(v91, "BOOLValue"));

        goto LABEL_226;
      }
      v82 = objc_msgSend(v80, "intValue");
    }
    objc_msgSend(v6, "setReferenceFrame:", v82);
    goto LABEL_210;
  }
LABEL_226:

  return v6;
}

- (GEOPDPlace)initWithJSON:(id)a3
{
  return (GEOPDPlace *)-[GEOPDPlace _initWithDictionary:isJSON:](self, a3, (id)1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceIsValid((char *)a3);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDPlaceClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEOPDPlace _readComponents]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_components;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((-[GEOPDComponent hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9), v3) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEOPDPlace _readMapsId]((uint64_t)self);
  if (-[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3, (_QWORD)v11))
    return 1;
  -[GEOPDPlace _readRequestData]((uint64_t)self);
  return -[GEOMapItemInitialRequestData hasGreenTeaWithValue:](self->_requestData, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  $E293E9EAAB2B8016EDB279585BF8500E flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  $E293E9EAAB2B8016EDB279585BF8500E v9;
  id *v10;
  $E293E9EAAB2B8016EDB279585BF8500E v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t j;
  void *v15;
  $E293E9EAAB2B8016EDB279585BF8500E v16;
  id *v17;
  id *v18;

  v18 = (id *)a3;
  -[GEOPDPlace readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 26) = self->_readerMarkPos;
  *((_DWORD *)v18 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    if ((*(_WORD *)&flags & 0x100) == 0)
      goto LABEL_3;
LABEL_39:
    *((_DWORD *)v18 + 33) = self->_status;
    *((_DWORD *)v18 + 35) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  v18[7] = (id)self->_muid;
  *((_DWORD *)v18 + 35) |= 2u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x100) != 0)
    goto LABEL_39;
LABEL_3:
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_4:
    v18[10] = (id)self->_preferredMuid;
    *((_DWORD *)v18 + 35) |= 4u;
  }
LABEL_5:
  if (-[GEOPDPlace componentsCount](self, "componentsCount"))
  {
    objc_msgSend(v18, "clearComponents");
    v5 = -[GEOPDPlace componentsCount](self, "componentsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPDPlace componentAtIndex:](self, "componentAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addComponent:", v8);

      }
    }
  }
  v9 = self->_flags;
  v10 = v18;
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    *((_DWORD *)v18 + 32) = self->_resultProviderId;
    *((_DWORD *)v18 + 35) |= 0x80u;
    v9 = self->_flags;
  }
  if ((*(_BYTE *)&v9 & 8) != 0)
  {
    v18[12] = (id)self->_updateVersion;
    *((_DWORD *)v18 + 35) |= 8u;
  }
  if (self->_mapsId)
  {
    objc_msgSend(v18, "setMapsId:");
    v10 = v18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v10[5] = (id)self->_createdTime;
    *((_DWORD *)v10 + 35) |= 1u;
  }
  if (self->_placeLayoutData)
  {
    objc_msgSend(v18, "setPlaceLayoutData:");
    v10 = v18;
  }
  v11 = self->_flags;
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    *((_BYTE *)v10 + 136) = self->_isPartiallyClientizedSearchResult;
    *((_DWORD *)v10 + 35) |= 0x200u;
    v11 = self->_flags;
  }
  if ((*(_BYTE *)&v11 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 29) = self->_mapDisplayType;
    *((_DWORD *)v10 + 35) |= 0x10u;
  }
  if (-[GEOPDPlace abExpBranchIdsCount](self, "abExpBranchIdsCount"))
  {
    objc_msgSend(v18, "clearAbExpBranchIds");
    v12 = -[GEOPDPlace abExpBranchIdsCount](self, "abExpBranchIdsCount");
    if (v12)
    {
      v13 = v12;
      for (j = 0; j != v13; ++j)
      {
        -[GEOPDPlace abExpBranchIdAtIndex:](self, "abExpBranchIdAtIndex:", j);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addAbExpBranchId:", v15);

      }
    }
  }
  v16 = self->_flags;
  v17 = v18;
  if ((*(_BYTE *)&v16 & 0x20) != 0)
  {
    *((_DWORD *)v18 + 30) = self->_rapFlowType;
    *((_DWORD *)v18 + 35) |= 0x20u;
    v16 = self->_flags;
  }
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    *((_DWORD *)v18 + 31) = self->_referenceFrame;
    *((_DWORD *)v18 + 35) |= 0x40u;
  }
  if (self->_requestData)
  {
    objc_msgSend(v18, "setRequestData:");
    v17 = v18;
  }
  if (self->_placeCacheKey)
  {
    objc_msgSend(v18, "setPlaceCacheKey:");
    v17 = v18;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    *((_BYTE *)v17 + 137) = self->_nilPlace;
    *((_DWORD *)v17 + 35) |= 0x400u;
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $E293E9EAAB2B8016EDB279585BF8500E flags;
  int v6;
  NSMutableArray *components;
  GEOPDMapsIdentifier *mapsId;
  GEOPDPlacecardLayoutData *placeLayoutData;
  NSMutableArray *abExpBranchIds;
  GEOMapItemInitialRequestData *requestData;
  NSString *placeCacheKey;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_74;
  -[GEOPDPlace readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 35);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_muid != *((_QWORD *)v4 + 7))
      goto LABEL_74;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&flags & 0x100) != 0)
  {
    if ((v6 & 0x100) == 0 || self->_status != *((_DWORD *)v4 + 33))
      goto LABEL_74;
  }
  else if ((v6 & 0x100) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_preferredMuid != *((_QWORD *)v4 + 10))
      goto LABEL_74;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_74;
  }
  components = self->_components;
  if ((unint64_t)components | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](components, "isEqual:"))
      goto LABEL_74;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_resultProviderId != *((_DWORD *)v4 + 32))
      goto LABEL_74;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_updateVersion != *((_QWORD *)v4 + 12))
      goto LABEL_74;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_74;
  }
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_74;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_createdTime != *((_QWORD *)v4 + 5))
      goto LABEL_74;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_74;
  }
  placeLayoutData = self->_placeLayoutData;
  if ((unint64_t)placeLayoutData | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDPlacecardLayoutData isEqual:](placeLayoutData, "isEqual:"))
      goto LABEL_74;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0)
      goto LABEL_74;
    if (self->_isPartiallyClientizedSearchResult)
    {
      if (!*((_BYTE *)v4 + 136))
        goto LABEL_74;
    }
    else if (*((_BYTE *)v4 + 136))
    {
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_mapDisplayType != *((_DWORD *)v4 + 29))
      goto LABEL_74;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_74;
  }
  abExpBranchIds = self->_abExpBranchIds;
  if ((unint64_t)abExpBranchIds | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](abExpBranchIds, "isEqual:"))
      goto LABEL_74;
    flags = self->_flags;
    v6 = *((_DWORD *)v4 + 35);
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_rapFlowType != *((_DWORD *)v4 + 30))
      goto LABEL_74;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_referenceFrame != *((_DWORD *)v4 + 31))
      goto LABEL_74;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_74;
  }
  requestData = self->_requestData;
  if ((unint64_t)requestData | *((_QWORD *)v4 + 11)
    && !-[GEOMapItemInitialRequestData isEqual:](requestData, "isEqual:"))
  {
    goto LABEL_74;
  }
  placeCacheKey = self->_placeCacheKey;
  if ((unint64_t)placeCacheKey | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](placeCacheKey, "isEqual:"))
      goto LABEL_74;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
  {
    if ((*((_DWORD *)v4 + 35) & 0x400) != 0)
    {
      if (self->_nilPlace)
      {
        if (!*((_BYTE *)v4 + 137))
          goto LABEL_74;
      }
      else if (*((_BYTE *)v4 + 137))
      {
        goto LABEL_74;
      }
      v13 = 1;
      goto LABEL_75;
    }
LABEL_74:
    v13 = 0;
    goto LABEL_75;
  }
  v13 = (*((_DWORD *)v4 + 35) & 0x400) == 0;
LABEL_75:

  return v13;
}

- (unint64_t)hash
{
  $E293E9EAAB2B8016EDB279585BF8500E flags;
  $E293E9EAAB2B8016EDB279585BF8500E v4;
  $E293E9EAAB2B8016EDB279585BF8500E v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  $E293E9EAAB2B8016EDB279585BF8500E v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;

  -[GEOPDPlace readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    v24 = 0;
    if ((*(_WORD *)&flags & 0x100) != 0)
      goto LABEL_3;
LABEL_6:
    v23 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v24 = 2654435761u * self->_muid;
  if ((*(_WORD *)&flags & 0x100) == 0)
    goto LABEL_6;
LABEL_3:
  v23 = 2654435761 * self->_status;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_4:
    v22 = 2654435761u * self->_preferredMuid;
    goto LABEL_8;
  }
LABEL_7:
  v22 = 0;
LABEL_8:
  v21 = -[NSMutableArray hash](self->_components, "hash");
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
    v20 = 2654435761 * self->_resultProviderId;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_10;
  }
  else
  {
    v20 = 0;
    if ((*(_BYTE *)&v4 & 8) != 0)
    {
LABEL_10:
      v19 = 2654435761u * self->_updateVersion;
      goto LABEL_13;
    }
  }
  v19 = 0;
LABEL_13:
  v18 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v17 = 2654435761u * self->_createdTime;
  else
    v17 = 0;
  v16 = -[GEOPDPlacecardLayoutData hash](self->_placeLayoutData, "hash");
  v5 = self->_flags;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
    v6 = 2654435761 * self->_isPartiallyClientizedSearchResult;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
      goto LABEL_18;
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&v5 & 0x10) != 0)
    {
LABEL_18:
      v7 = 2654435761 * self->_mapDisplayType;
      goto LABEL_21;
    }
  }
  v7 = 0;
LABEL_21:
  v8 = -[NSMutableArray hash](self->_abExpBranchIds, "hash");
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x20) != 0)
  {
    v10 = 2654435761 * self->_rapFlowType;
    if ((*(_BYTE *)&v9 & 0x40) != 0)
      goto LABEL_23;
  }
  else
  {
    v10 = 0;
    if ((*(_BYTE *)&v9 & 0x40) != 0)
    {
LABEL_23:
      v11 = 2654435761 * self->_referenceFrame;
      goto LABEL_26;
    }
  }
  v11 = 0;
LABEL_26:
  v12 = -[GEOMapItemInitialRequestData hash](self->_requestData, "hash");
  v13 = -[NSString hash](self->_placeCacheKey, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 4) != 0)
    v14 = 2654435761 * self->_nilPlace;
  else
    v14 = 0;
  return v23 ^ v24 ^ v22 ^ v20 ^ v19 ^ v21 ^ v18 ^ v17 ^ v16 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  int v11;
  GEOPDMapsIdentifier *mapsId;
  uint64_t v13;
  GEOPDPlacecardLayoutData *placeLayoutData;
  void *v15;
  void **v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  GEOPDPlacecardLayoutConfiguration *layoutConfiguration;
  void *v23;
  int v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  int v30;
  GEOMapItemInitialRequestData *requestData;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
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
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_DWORD *)v4 + 35);
  if ((v5 & 2) != 0)
  {
    self->_muid = *((_QWORD *)v4 + 7);
    *(_DWORD *)&self->_flags |= 2u;
    v5 = *((_DWORD *)v4 + 35);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_status = *((_DWORD *)v4 + 33);
  *(_DWORD *)&self->_flags |= 0x100u;
  if ((*((_DWORD *)v4 + 35) & 4) != 0)
  {
LABEL_4:
    self->_preferredMuid = *((_QWORD *)v4 + 10);
    *(_DWORD *)&self->_flags |= 4u;
  }
LABEL_5:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = *((id *)v4 + 4);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v6);
        -[GEOPDPlace addComponent:](self, "addComponent:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v8);
  }

  v11 = *((_DWORD *)v4 + 35);
  if ((v11 & 0x80) != 0)
  {
    self->_resultProviderId = *((_DWORD *)v4 + 32);
    *(_DWORD *)&self->_flags |= 0x80u;
    v11 = *((_DWORD *)v4 + 35);
  }
  if ((v11 & 8) != 0)
  {
    self->_updateVersion = *((_QWORD *)v4 + 12);
    *(_DWORD *)&self->_flags |= 8u;
  }
  mapsId = self->_mapsId;
  v13 = *((_QWORD *)v4 + 6);
  if (mapsId)
  {
    if (v13)
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOPDPlace setMapsId:](self, "setMapsId:");
  }
  if ((*((_BYTE *)v4 + 140) & 1) != 0)
  {
    self->_createdTime = *((_QWORD *)v4 + 5);
    *(_DWORD *)&self->_flags |= 1u;
  }
  placeLayoutData = self->_placeLayoutData;
  v15 = (void *)*((_QWORD *)v4 + 9);
  if (placeLayoutData)
  {
    if (v15)
    {
      v16 = v15;
      -[GEOPDPlacecardLayoutData readAll:]((uint64_t)v16, 0);
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v17 = v16[4];
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v42 != v20)
              objc_enumerationMutation(v17);
            -[GEOPDPlacecardLayoutData addModuleConfiguration:]((uint64_t)placeLayoutData, *(void **)(*((_QWORD *)&v41 + 1) + 8 * j));
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v19);
      }

      layoutConfiguration = placeLayoutData->_layoutConfiguration;
      v23 = v16[3];
      if (layoutConfiguration)
      {
        if (v23)
          -[GEOPDPlacecardLayoutConfiguration mergeFrom:](layoutConfiguration, "mergeFrom:");
      }
      else if (v23)
      {
        -[GEOPDPlacecardLayoutData setLayoutConfiguration:]((uint64_t)placeLayoutData, v16[3]);
      }

    }
  }
  else if (v15)
  {
    -[GEOPDPlace setPlaceLayoutData:](self, "setPlaceLayoutData:");
  }
  v24 = *((_DWORD *)v4 + 35);
  if ((v24 & 0x200) != 0)
  {
    self->_isPartiallyClientizedSearchResult = *((_BYTE *)v4 + 136);
    *(_DWORD *)&self->_flags |= 0x200u;
    v24 = *((_DWORD *)v4 + 35);
  }
  if ((v24 & 0x10) != 0)
  {
    self->_mapDisplayType = *((_DWORD *)v4 + 29);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v25 = *((id *)v4 + 3);
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        -[GEOPDPlace addAbExpBranchId:](self, "addAbExpBranchId:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k), (_QWORD)v33);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v27);
  }

  v30 = *((_DWORD *)v4 + 35);
  if ((v30 & 0x20) != 0)
  {
    self->_rapFlowType = *((_DWORD *)v4 + 30);
    *(_DWORD *)&self->_flags |= 0x20u;
    v30 = *((_DWORD *)v4 + 35);
  }
  if ((v30 & 0x40) != 0)
  {
    self->_referenceFrame = *((_DWORD *)v4 + 31);
    *(_DWORD *)&self->_flags |= 0x40u;
  }
  requestData = self->_requestData;
  v32 = *((_QWORD *)v4 + 11);
  if (requestData)
  {
    if (v32)
      -[GEOMapItemInitialRequestData mergeFrom:](requestData, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEOPDPlace setRequestData:](self, "setRequestData:");
  }
  if (*((_QWORD *)v4 + 8))
    -[GEOPDPlace setPlaceCacheKey:](self, "setPlaceCacheKey:");
  if ((*((_BYTE *)v4 + 141) & 4) != 0)
  {
    self->_nilPlace = *((_BYTE *)v4 + 137);
    *(_DWORD *)&self->_flags |= 0x400u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDPlaceReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_5327);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOPDPlacecardLayoutData *placeLayoutData;
  PBUnknownFields *v13;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  GEOPDPlacecardLayoutData *v76;
  NSMutableArray *obj;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v3 = a3;
  v97 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40800u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDPlace readAll:](self, "readAll:", 0);
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v7 = self->_components;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v83;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v83 != v10)
            objc_enumerationMutation(v7);
          -[GEOPDComponent clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * v11++), 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
      }
      while (v9);
    }

    -[GEOPDMapsIdentifier clearUnknownFields:](self->_mapsId, "clearUnknownFields:", 1);
    placeLayoutData = self->_placeLayoutData;
    if (placeLayoutData)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)&placeLayoutData->_flags |= 1u;
      *(_BYTE *)&placeLayoutData->_flags |= 8u;
      os_unfair_lock_unlock(&placeLayoutData->_readerLock);
      v13 = placeLayoutData->_unknownFields;
      placeLayoutData->_unknownFields = 0;

      -[GEOPDPlacecardLayoutData readAll:]((uint64_t)placeLayoutData, 0);
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      v76 = placeLayoutData;
      obj = placeLayoutData->_moduleConfigurations;
      v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
      if (v79)
      {
        v78 = *(_QWORD *)v87;
        v14 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v87 != v78)
              objc_enumerationMutation(obj);
            v80 = v15;
            v16 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * v15);
            if (v16)
            {
              v17 = *(void **)(v16 + 8);
              *(_QWORD *)(v16 + 8) = 0;

              v18 = *(_QWORD *)(v16 + 16);
              if (v18)
              {
                os_unfair_lock_lock_with_options();
                *(_WORD *)(v18 + 116) |= 1u;
                *(_WORD *)(v18 + 116) |= 0x800u;
                os_unfair_lock_unlock((os_unfair_lock_t)(v18 + 112));
                v19 = *(void **)(v18 + 16);
                *(_QWORD *)(v18 + 16) = 0;

                -[GEOPDModuleConfigurationValue readAll:](v18, 0);
                v20 = *(_QWORD *)(v18 + 72);
                v81 = v18;
                if (v20)
                {
                  v21 = *(void **)(v20 + 8);
                  *(_QWORD *)(v20 + 8) = 0;

                  v92 = 0u;
                  v93 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  v22 = *(id *)(v20 + 16);
                  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                  if (v23)
                  {
                    v24 = v23;
                    v25 = *(_QWORD *)v91;
                    do
                    {
                      v26 = 0;
                      do
                      {
                        if (*(_QWORD *)v91 != v25)
                          objc_enumerationMutation(v22);
                        v27 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v26);
                        if (v27)
                        {
                          os_unfair_lock_lock_with_options();
                          *(_BYTE *)(v27 + 56) |= 2u;
                          *(_BYTE *)(v27 + 56) |= 0x10u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v27 + 48));
                          v28 = *(void **)(v27 + 16);
                          *(_QWORD *)(v27 + 16) = 0;

                          -[GEOPDRibbonItem readAll:](v27, 0);
                          v29 = *(_QWORD *)(v27 + 32);
                          if (v29)
                          {
                            v30 = *(void **)(v29 + 8);
                            *(_QWORD *)(v29 + 8) = 0;

                          }
                          v31 = *(_QWORD *)(v27 + 24);
                          if (v31)
                          {
                            v32 = *(void **)(v31 + 8);
                            *(_QWORD *)(v31 + 8) = 0;

                          }
                        }
                        ++v26;
                      }
                      while (v24 != v26);
                      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                    }
                    while (v24);
                  }

                  v14 = &OBJC_IVAR___GEOPDButtonModuleConfiguration__unknownFields;
                  v18 = v81;
                }
                v33 = *(_QWORD *)(v18 + 32);
                if (v33)
                {
                  v34 = *(void **)(v33 + 8);
                  *(_QWORD *)(v33 + 8) = 0;

                  v92 = 0u;
                  v93 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  v35 = *(id *)(v33 + 16);
                  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                  if (v36)
                  {
                    v37 = v36;
                    v38 = *(_QWORD *)v91;
                    do
                    {
                      v39 = 0;
                      do
                      {
                        if (*(_QWORD *)v91 != v38)
                          objc_enumerationMutation(v35);
                        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v39++), "clearUnknownFields:", 1, v76);
                      }
                      while (v37 != v39);
                      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                    }
                    while (v37);
                  }

                  v18 = v81;
                }
                v40 = *(_QWORD *)(v18 + 64);
                if (v40)
                {
                  v41 = *(void **)(v40 + 8);
                  *(_QWORD *)(v40 + 8) = 0;

                  v92 = 0u;
                  v93 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  v42 = *(id *)(v40 + 16);
                  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                  if (v43)
                  {
                    v44 = v43;
                    v45 = *(_QWORD *)v91;
                    do
                    {
                      v46 = 0;
                      do
                      {
                        if (*(_QWORD *)v91 != v45)
                          objc_enumerationMutation(v42);
                        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v46++), "clearUnknownFields:", 1, v76);
                      }
                      while (v44 != v46);
                      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                    }
                    while (v44);
                  }

                  v18 = v81;
                }
                v47 = *(_QWORD *)(v18 + 96);
                if (v47)
                {
                  v48 = *(void **)(v47 + 8);
                  *(_QWORD *)(v47 + 8) = 0;

                }
                -[GEOPDTemplatePlaceModuleConfiguration clearUnknownFields:](*(_QWORD *)(v18 + 80));
                v49 = *(_QWORD *)(v18 + 56);
                if (v49)
                {
                  os_unfair_lock_lock_with_options();
                  *(_BYTE *)(v49 + 56) |= 2u;
                  *(_BYTE *)(v49 + 56) |= 0x10u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v49 + 48));
                  v50 = *(void **)(v49 + 16);
                  *(_QWORD *)(v49 + 16) = 0;

                  -[GEOPDPlaceInfosModuleConfiguration readAll:](v49, 0);
                  v51 = *(_QWORD *)(v49 + 32);
                  if (v51)
                  {
                    v52 = *(void **)(v51 + 8);
                    *(_QWORD *)(v51 + 8) = 0;

                  }
                  v53 = *(_QWORD *)(v49 + 24);
                  if (v53)
                  {
                    v54 = *(void **)(v53 + 8);
                    *(_QWORD *)(v53 + 8) = 0;

                    v92 = 0u;
                    v93 = 0u;
                    v90 = 0u;
                    v91 = 0u;
                    v55 = *(id *)(v53 + 16);
                    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                    if (v56)
                    {
                      v57 = v56;
                      v58 = *(_QWORD *)v91;
                      do
                      {
                        v59 = 0;
                        do
                        {
                          if (*(_QWORD *)v91 != v58)
                            objc_enumerationMutation(v55);
                          v60 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * v59);
                          if (v60)
                          {
                            v61 = v14[336];
                            v62 = *(void **)(v60 + v61);
                            *(_QWORD *)(v60 + v61) = 0;

                          }
                          ++v59;
                        }
                        while (v57 != v59);
                        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                      }
                      while (v57);
                    }

                    v18 = v81;
                  }
                }
                v63 = *(_QWORD *)(v18 + 24);
                if (v63)
                {
                  v64 = *(void **)(v63 + 8);
                  *(_QWORD *)(v63 + 8) = 0;

                }
                v65 = *(_QWORD *)(v18 + 40);
                if (v65)
                {
                  v66 = *(void **)(v65 + 8);
                  *(_QWORD *)(v65 + 8) = 0;

                }
                v67 = *(_QWORD *)(v18 + 88);
                if (v67)
                {
                  v68 = *(void **)(v67 + 8);
                  *(_QWORD *)(v67 + 8) = 0;

                  v92 = 0u;
                  v93 = 0u;
                  v90 = 0u;
                  v91 = 0u;
                  v69 = *(id *)(v67 + 16);
                  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                  if (v70)
                  {
                    v71 = v70;
                    v72 = *(_QWORD *)v91;
                    do
                    {
                      v73 = 0;
                      do
                      {
                        if (*(_QWORD *)v91 != v72)
                          objc_enumerationMutation(v69);
                        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v73++), "clearUnknownFields:", 1, v76);
                      }
                      while (v71 != v73);
                      v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v90, v96, 16);
                    }
                    while (v71);
                  }

                  v18 = v81;
                }
                v74 = *(_QWORD *)(v18 + 48);
                if (v74)
                {
                  v75 = *(void **)(v74 + 8);
                  *(_QWORD *)(v74 + 8) = 0;

                  -[GEOPDTemplatePlaceModuleConfiguration clearUnknownFields:](*(_QWORD *)(v74 + 16));
                }
              }
            }
            v15 = v80 + 1;
          }
          while (v80 + 1 != v79);
          v79 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v95, 16);
        }
        while (v79);
      }

      -[GEOPDPlacecardLayoutConfiguration clearUnknownFields:](v76->_layoutConfiguration, "clearUnknownFields:", 1);
    }
  }
}

- (void)setHasReferenceFrame:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 262208;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasReferenceFrame
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)referenceFrameAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0BF60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsReferenceFrame:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WGS84")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CHINA_SHIFTED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasRequestData
{
  -[GEOPDPlace _readRequestData]((uint64_t)self);
  return self->_requestData != 0;
}

- (BOOL)hasPlaceCacheKey
{
  -[GEOPDPlace _readPlaceCacheKey]((uint64_t)self);
  return self->_placeCacheKey != 0;
}

- (void)setPlaceCacheKey:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x48000u;
  objc_storeStrong((id *)&self->_placeCacheKey, a3);
}

- (void)setHasNilPlace:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 263168;
  else
    v3 = 0x40000;
  self->_flags = ($E293E9EAAB2B8016EDB279585BF8500E)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasNilPlace
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)geoMapItem
{
  return -[GEOPDPlace geoMapItemWithDetourInfo:](self, "geoMapItemWithDetourInfo:", 0);
}

- (id)geoMapItemWithDetourInfo:(id)a3
{
  id v4;
  _GEOPlaceDataItem *v5;

  v4 = a3;
  v5 = -[_GEOPlaceDataItem initWithPlaceData:detourInfo:]([_GEOPlaceDataItem alloc], "initWithPlaceData:detourInfo:", self, v4);

  return v5;
}

@end
