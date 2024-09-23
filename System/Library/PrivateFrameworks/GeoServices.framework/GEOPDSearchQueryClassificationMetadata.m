@implementation GEOPDSearchQueryClassificationMetadata

- (GEOPDSearchQueryClassificationMetadata)init
{
  GEOPDSearchQueryClassificationMetadata *v2;
  GEOPDSearchQueryClassificationMetadata *v3;
  GEOPDSearchQueryClassificationMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryClassificationMetadata;
  v2 = -[GEOPDSearchQueryClassificationMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryClassificationMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryClassificationMetadata *v3;
  GEOPDSearchQueryClassificationMetadata *v4;
  GEOPDSearchQueryClassificationMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryClassificationMetadata;
  v3 = -[GEOPDSearchQueryClassificationMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addPrediction:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPredictions_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchQueryClassificationMetadata _addNoFlagsPrediction:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsPrediction:(uint64_t)a1
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

- (void)addModelVersion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 8) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readModelVersions_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    -[GEOPDSearchQueryClassificationMetadata _addNoFlagsModelVersion:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 60) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
    *(_BYTE *)(a1 + 60) |= 0x20u;
  }
}

- (void)_addNoFlagsModelVersion:(uint64_t)a1
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDSearchQueryClassificationMetadata;
  -[GEOPDSearchQueryClassificationMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryClassificationMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryClassificationMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  double v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  const __CFString *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchQueryClassificationMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if ((*(_BYTE *)(a1 + 60) & 4) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClassiferId_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  v7 = *(id *)(a1 + 16);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("classiferId");
    else
      v8 = CFSTR("classifer_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = *(id *)(a1 + 32);
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v34 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v15, "jsonRepresentation");
          else
            objc_msgSend(v15, "dictionaryRepresentation");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v12);
    }

    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("prediction"));
  }
  v17 = *(_BYTE *)(a1 + 60);
  if ((v17 & 2) != 0)
  {
    LODWORD(v9) = *(_DWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("poiGeoThreshold"));

    v17 = *(_BYTE *)(a1 + 60);
  }
  if ((v17 & 1) != 0)
  {
    LODWORD(v9) = *(_DWORD *)(a1 + 52);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("localGlobalThreshold"));

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = *(id *)(a1 + 24);
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v25, "jsonRepresentation");
          else
            objc_msgSend(v25, "dictionaryRepresentation", (_QWORD)v29);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObject:", v26, (_QWORD)v29);

        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    if (a2)
      v27 = CFSTR("modelVersion");
    else
      v27 = CFSTR("model_version");
    objc_msgSend(v4, "setObject:forKey:", v20, v27, (_QWORD)v29);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryClassificationMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_873;
      else
        v6 = (int *)&readAll__nonRecursiveTag_874;
      GEOPDSearchQueryClassificationMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQueryClassificationMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryClassificationMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryClassificationMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 0);
    if (self->_classiferId)
      PBDataWriterWriteStringField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_predictions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteFloatField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteFloatField();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_modelVersions;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char flags;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryClassificationMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_23;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_classiferId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v9;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = self->_predictions;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchQueryClassificationMetadata addPrediction:](v5, v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v12);
  }

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(float *)(v5 + 56) = self->_poiGeoThreshold;
    *(_BYTE *)(v5 + 60) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(float *)(v5 + 52) = self->_localGlobalThreshold;
    *(_BYTE *)(v5 + 60) |= 1u;
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_modelVersions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v8);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDSearchQueryClassificationMetadata addModelVersion:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }
LABEL_23:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *classiferId;
  NSMutableArray *predictions;
  NSMutableArray *modelVersions;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)v4, 1);
  classiferId = self->_classiferId;
  if ((unint64_t)classiferId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](classiferId, "isEqual:"))
      goto LABEL_18;
  }
  predictions = self->_predictions;
  if ((unint64_t)predictions | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](predictions, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0 || self->_poiGeoThreshold != *((float *)v4 + 14))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 60) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_localGlobalThreshold != *((float *)v4 + 13))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 60) & 1) != 0)
  {
    goto LABEL_18;
  }
  modelVersions = self->_modelVersions;
  if ((unint64_t)modelVersions | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](modelVersions, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  char flags;
  unint64_t v6;
  float poiGeoThreshold;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  float localGlobalThreshold;
  double v13;
  long double v14;
  double v15;

  -[GEOPDSearchQueryClassificationMetadata readAll:]((uint64_t)self, 1);
  v3 = -[NSString hash](self->_classiferId, "hash");
  v4 = -[NSMutableArray hash](self->_predictions, "hash");
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    poiGeoThreshold = self->_poiGeoThreshold;
    v8 = poiGeoThreshold;
    if (poiGeoThreshold < 0.0)
      v8 = -poiGeoThreshold;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((flags & 1) != 0)
  {
    localGlobalThreshold = self->_localGlobalThreshold;
    v13 = localGlobalThreshold;
    if (localGlobalThreshold < 0.0)
      v13 = -localGlobalThreshold;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11 ^ -[NSMutableArray hash](self->_modelVersions, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictions, 0);
  objc_storeStrong((id *)&self->_modelVersions, 0);
  objc_storeStrong((id *)&self->_classiferId, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
