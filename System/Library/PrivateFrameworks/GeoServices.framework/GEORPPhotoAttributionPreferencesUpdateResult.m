@implementation GEORPPhotoAttributionPreferencesUpdateResult

- (GEORPPhotoAttributionPreferencesUpdateResult)init
{
  GEORPPhotoAttributionPreferencesUpdateResult *v2;
  GEORPPhotoAttributionPreferencesUpdateResult *v3;
  GEORPPhotoAttributionPreferencesUpdateResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPhotoAttributionPreferencesUpdateResult;
  v2 = -[GEORPPhotoAttributionPreferencesUpdateResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPhotoAttributionPreferencesUpdateResult)initWithData:(id)a3
{
  GEORPPhotoAttributionPreferencesUpdateResult *v3;
  GEORPPhotoAttributionPreferencesUpdateResult *v4;
  GEORPPhotoAttributionPreferencesUpdateResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPhotoAttributionPreferencesUpdateResult;
  v3 = -[GEORPPhotoAttributionPreferencesUpdateResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPPhotoAttributionPreferencesUpdateResult;
  -[GEORPPhotoAttributionPreferencesUpdateResult dealloc](&v3, sel_dealloc);
}

- (void)_readErrors
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoAttributionPreferencesUpdateResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readErrors_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (unint64_t)errorsCount
{
  -[GEORPPhotoAttributionPreferencesUpdateResult _readErrors]((uint64_t)self);
  return self->_errors.count;
}

- (int)errors
{
  -[GEORPPhotoAttributionPreferencesUpdateResult _readErrors]((uint64_t)self);
  return self->_errors.list;
}

- (void)clearErrors
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Clear();
}

- (void)addErrors:(int)a3
{
  -[GEORPPhotoAttributionPreferencesUpdateResult _readErrors]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
}

- (int)errorsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_errors;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPPhotoAttributionPreferencesUpdateResult _readErrors]((uint64_t)self);
  p_errors = &self->_errors;
  count = self->_errors.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_errors->list[a3];
}

- (void)setErrors:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 1u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 4u;
  PBRepeatedInt32Set();
}

- (id)errorsAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C11938[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsErrors:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_ATTRIBUTION_PREFERENCES_UPDATE_ERROR_UNSPECIFIED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_ATTRIBUTION_PREFERENCES_UPDATE_ERROR_OUTDATED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_ATTRIBUTION_PREFERENCES_UPDATE_ERROR_NAME_UNAVAILABLE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPreferences
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 60) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPhotoAttributionPreferencesUpdateResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreferences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasPreferences
{
  -[GEORPPhotoAttributionPreferencesUpdateResult _readPreferences]((uint64_t)self);
  return self->_preferences != 0;
}

- (GEORPPhotoAttributionPreferences)preferences
{
  -[GEORPPhotoAttributionPreferencesUpdateResult _readPreferences]((uint64_t)self);
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  *(_BYTE *)&self->_flags |= 6u;
  objc_storeStrong((id *)&self->_preferences, a3);
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
  v8.super_class = (Class)GEORPPhotoAttributionPreferencesUpdateResult;
  -[GEORPPhotoAttributionPreferencesUpdateResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPhotoAttributionPreferencesUpdateResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPhotoAttributionPreferencesUpdateResult _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a1)
  {
    objc_msgSend(a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (a1[3])
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = a1 + 2;
      if (a1[3])
      {
        v7 = 0;
        do
        {
          v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E1C11938[v8];
          }
          objc_msgSend(v5, "addObject:", v9);

          ++v7;
          v6 = a1 + 2;
        }
        while (v7 < a1[3]);
      }
      objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("errors"));

    }
    objc_msgSend(a1, "preferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v10, "jsonRepresentation");
      else
        objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("preferences"));

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPhotoAttributionPreferencesUpdateResult _dictionaryRepresentation:](self, 1);
}

- (GEORPPhotoAttributionPreferencesUpdateResult)initWithDictionary:(id)a3
{
  return (GEORPPhotoAttributionPreferencesUpdateResult *)-[GEORPPhotoAttributionPreferencesUpdateResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  GEORPPhotoAttributionPreferences *v16;
  uint64_t v17;
  void *v18;
  char v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_30;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_30;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("errors"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  v20 = a3;
  v21 = v5;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (!v8)
    goto LABEL_23;
  v9 = v8;
  v10 = *(_QWORD *)v23;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v23 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;
        if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PHOTO_ATTRIBUTION_PREFERENCES_UPDATE_ERROR_UNSPECIFIED")) & 1) != 0)
        {
          v14 = 0;
        }
        else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("PHOTO_ATTRIBUTION_PREFERENCES_UPDATE_ERROR_OUTDATED")) & 1) != 0)
        {
          v14 = 1;
        }
        else if (objc_msgSend(v13, "isEqualToString:", CFSTR("PHOTO_ATTRIBUTION_PREFERENCES_UPDATE_ERROR_NAME_UNAVAILABLE")))
        {
          v14 = 2;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          continue;
        v14 = objc_msgSend(v12, "intValue");
      }
      objc_msgSend(a1, "addErrors:", v14);
    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  }
  while (v9);
LABEL_23:

  v5 = v21;
  a3 = v20;
LABEL_24:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("preferences"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEORPPhotoAttributionPreferences alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEORPPhotoAttributionPreferences initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEORPPhotoAttributionPreferences initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setPreferences:", v17);

  }
LABEL_30:

  return a1;
}

- (GEORPPhotoAttributionPreferencesUpdateResult)initWithJSON:(id)a3
{
  return (GEORPPhotoAttributionPreferencesUpdateResult *)-[GEORPPhotoAttributionPreferencesUpdateResult _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_111;
    else
      v8 = (int *)&readAll__nonRecursiveTag_112;
    GEORPPhotoAttributionPreferencesUpdateResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEORPPhotoAttributionPreferences readAll:](self->_preferences, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPhotoAttributionPreferencesUpdateResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPhotoAttributionPreferencesUpdateResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPPhotoAttributionPreferencesUpdateResultIsDirty((uint64_t)self))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_9;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPhotoAttributionPreferencesUpdateResult readAll:](self, "readAll:", 0);
  v5 = v9;
  if (self->_errors.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      ++v6;
    }
    while (v6 < self->_errors.count);
  }
  if (self->_preferences)
  {
    PBDataWriterWriteSubmessage();
LABEL_9:
    v5 = v9;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;

  v7 = (id *)a3;
  -[GEORPPhotoAttributionPreferencesUpdateResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 12) = self->_readerMarkPos;
  *((_DWORD *)v7 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEORPPhotoAttributionPreferencesUpdateResult errorsCount](self, "errorsCount"))
  {
    objc_msgSend(v7, "clearErrors");
    v4 = -[GEORPPhotoAttributionPreferencesUpdateResult errorsCount](self, "errorsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addErrors:", -[GEORPPhotoAttributionPreferencesUpdateResult errorsAtIndex:](self, "errorsAtIndex:", i));
    }
  }
  if (self->_preferences)
    objc_msgSend(v7, "setPreferences:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPhotoAttributionPreferencesUpdateResult readAll:](self, "readAll:", 0);
    PBRepeatedInt32Copy();
    v8 = -[GEORPPhotoAttributionPreferences copyWithZone:](self->_preferences, "copyWithZone:", a3);
    v7 = (PBDataReader *)v5[5];
    v5[5] = v8;
    goto LABEL_6;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPPhotoAttributionPreferencesUpdateResultReadAllFrom((uint64_t)v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);
LABEL_6:

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPPhotoAttributionPreferences *preferences;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && (-[GEORPPhotoAttributionPreferencesUpdateResult readAll:](self, "readAll:", 1),
        objc_msgSend(v4, "readAll:", 1),
        PBRepeatedInt32IsEqual()))
  {
    preferences = self->_preferences;
    if ((unint64_t)preferences | v4[5])
      v6 = -[GEORPPhotoAttributionPreferences isEqual:](preferences, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEORPPhotoAttributionPreferencesUpdateResult readAll:](self, "readAll:", 1);
  v3 = PBRepeatedInt32Hash();
  return -[GEORPPhotoAttributionPreferences hash](self->_preferences, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  GEORPPhotoAttributionPreferences *preferences;
  void *v8;
  uint64_t v9;
  _QWORD *v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = objc_msgSend(v10, "errorsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPPhotoAttributionPreferencesUpdateResult addErrors:](self, "addErrors:", objc_msgSend(v10, "errorsAtIndex:", i));
  }
  preferences = self->_preferences;
  v8 = v10;
  v9 = v10[5];
  if (preferences)
  {
    if (v9)
    {
      -[GEORPPhotoAttributionPreferences mergeFrom:](preferences, "mergeFrom:");
LABEL_9:
      v8 = v10;
    }
  }
  else if (v9)
  {
    -[GEORPPhotoAttributionPreferencesUpdateResult setPreferences:](self, "setPreferences:");
    goto LABEL_9;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
