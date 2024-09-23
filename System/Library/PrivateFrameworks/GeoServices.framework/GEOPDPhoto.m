@implementation GEOPDPhoto

+ (id)photosForPlaceData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__GEOPDPhoto_PlaceDataExtras__photosForPlaceData___block_invoke;
  v10[3] = &unk_1E1C09968;
  v11 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateValidComponentValuesOfType:usingBlock:", 8, v10);

  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

void __50__GEOPDPhoto_PlaceDataExtras__photosForPlaceData___block_invoke(uint64_t a1, id *a2)
{
  void *v3;
  void *v4;

  -[GEOPDComponentValue photo](a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (id)bestURL
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;

  -[GEOPDPhoto photoVersions]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_75);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (id *)objc_claimAutoreleasedReturnValue();

  -[GEOPDPhotoContent url](v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __38__GEOPDPhoto_PlaceDataExtras__bestURL__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "_area");
  v6 = objc_msgSend(v4, "_area");

  if (v5 < v6)
    return -1;
  else
    return v5 > v6;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 1u;
    *(_BYTE *)(a1 + 52) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    v2 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    -[GEOPDPhoto readAll:](a1, 0);
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
          if (v8)
          {
            v9 = *(void **)(v8 + 8);
            *(_QWORD *)(v8 + 8) = 0;

          }
          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

  }
}

- (GEOPDPhoto)init
{
  GEOPDPhoto *v2;
  GEOPDPhoto *v3;
  GEOPDPhoto *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPhoto;
  v2 = -[GEOPDPhoto init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPhoto)initWithData:(id)a3
{
  GEOPDPhoto *v3;
  GEOPDPhoto *v4;
  GEOPDPhoto *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPhoto;
  v3 = -[GEOPDPhoto initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPhotoId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)photoId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPhoto _readPhotoId]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)setPhotoId:(uint64_t)a1
{
  id v4;

  v4 = a2;
  *(_BYTE *)(a1 + 52) |= 2u;
  *(_BYTE *)(a1 + 52) |= 8u;
  objc_storeStrong((id *)(a1 + 24), a2);

}

- (void)_readPhotoVersions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 52) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoVersions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (id)photoVersions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDPhoto _readPhotoVersions]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)addPhotoVersion:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDPhoto _readPhotoVersions](a1);
    -[GEOPDPhoto _addNoFlagsPhotoVersion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 52) |= 4u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 52) |= 8u;
  }
}

- (void)_addNoFlagsPhotoVersion:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDPhoto;
  -[GEOPDPhoto description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPhoto dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPhoto _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDPhoto readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPhoto photoId]((id *)a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("photoId");
    else
      v6 = CFSTR("photo_id");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("photoVersion");
    else
      v15 = CFSTR("photo_version");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  v16 = *(void **)(a1 + 16);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __40__GEOPDPhoto__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPhoto _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_5200;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5201;
      GEOPDPhotoReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDPhotoCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

void __40__GEOPDPhoto__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  GEOPDPhotoContent *v19;
  GEOPDPhotoContent *v20;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  int v31;
  uint64_t v32;
  void *v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("photoId");
    else
      v7 = CFSTR("photo_id");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[GEOPDPhoto setPhotoId:](v6, v9);

    }
    if (a3)
      v10 = CFSTR("photoVersion");
    else
      v10 = CFSTR("photo_version");
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = v11;
      v35 = v5;
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v12 = v11;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (!v13)
        goto LABEL_42;
      v14 = v13;
      v15 = CFSTR("url_type");
      v16 = *(_QWORD *)v39;
      if (a3)
        v15 = CFSTR("urlType");
      v36 = v6;
      v37 = v15;
      while (1)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v39 != v16)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = [GEOPDPhotoContent alloc];
            if (v19)
            {
              v20 = v19;
              v21 = v18;
              v22 = -[GEOPDPhotoContent init](v20, "init");
              if (v22)
              {
                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("width"));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v24 = objc_msgSend(v23, "unsignedIntValue");
                  *(_BYTE *)(v22 + 36) |= 4u;
                  *(_DWORD *)(v22 + 32) = v24;
                }

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("height"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v26 = objc_msgSend(v25, "unsignedIntValue");
                  *(_BYTE *)(v22 + 36) |= 1u;
                  *(_DWORD *)(v22 + 24) = v26;
                }

                objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("url"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v28 = (void *)objc_msgSend(v27, "copy");
                  -[GEOPDPhotoContent setUrl:](v22, v28);

                }
                objc_msgSend(v21, "objectForKeyedSubscript:", v37);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v30 = v29;
                  if ((objc_msgSend(v30, "isEqualToString:", CFSTR("URL_TYPE_REGULAR")) & 1) != 0)
                    v31 = 0;
                  else
                    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("URL_TYPE_AMP_TEMPLATE"));

LABEL_34:
                  *(_BYTE *)(v22 + 36) |= 2u;
                  *(_DWORD *)(v22 + 28) = v31;
                  v6 = v36;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v31 = objc_msgSend(v29, "intValue");
                    goto LABEL_34;
                  }
                }

              }
            }
            else
            {
              v22 = 0;
            }
            -[GEOPDPhoto addPhotoVersion:](v6, (void *)v22);

          }
          ++v17;
        }
        while (v14 != v17);
        v32 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        v14 = v32;
        if (!v32)
        {
LABEL_42:

          v11 = v34;
          v5 = v35;
          break;
        }
      }
    }

  }
  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPhotoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0xE) == 0))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDPhoto readAll:]((uint64_t)self, 0);
    if (self->_photoId)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_photoVersions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  uint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPhotoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPhoto readAll:]((uint64_t)self, 0);
  v8 = -[NSString copyWithZone:](self->_photoId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = self->_photoVersions;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "copyWithZone:", a3, (_QWORD)v16);
        -[GEOPDPhoto addPhotoVersion:](v5, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *photoId;
  NSMutableArray *photoVersions;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDPhoto readAll:]((uint64_t)self, 1),
         -[GEOPDPhoto readAll:]((uint64_t)v4, 1),
         photoId = self->_photoId,
         !((unint64_t)photoId | v4[3]))
     || -[NSString isEqual:](photoId, "isEqual:")))
  {
    photoVersions = self->_photoVersions;
    if ((unint64_t)photoVersions | v4[4])
      v7 = -[NSMutableArray isEqual:](photoVersions, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  -[GEOPDPhoto readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_photoId, "hash");
  return -[NSMutableArray hash](self->_photoVersions, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoVersions, 0);
  objc_storeStrong((id *)&self->_photoId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
