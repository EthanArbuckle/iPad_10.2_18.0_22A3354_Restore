@implementation GEOWalkingOptions

- (GEOWalkingOptions)init
{
  GEOWalkingOptions *v2;
  GEOWalkingOptions *v3;
  GEOWalkingOptions *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWalkingOptions;
  v2 = -[GEOWalkingOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWalkingOptions)initWithData:(id)a3
{
  GEOWalkingOptions *v3;
  GEOWalkingOptions *v4;
  GEOWalkingOptions *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWalkingOptions;
  v3 = -[GEOWalkingOptions initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOWalkingOptions;
  -[GEOWalkingOptions dealloc](&v3, sel_dealloc);
}

- (double)preferredSpeed
{
  return self->_preferredSpeed;
}

- (void)setPreferredSpeed:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_preferredSpeed = a3;
}

- (void)setHasPreferredSpeed:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPreferredSpeed
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readAvoidedModes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWalkingOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAvoidedModes_tags_7382);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (unint64_t)avoidedModesCount
{
  -[GEOWalkingOptions _readAvoidedModes]((uint64_t)self);
  return self->_avoidedModes.count;
}

- (int)avoidedModes
{
  -[GEOWalkingOptions _readAvoidedModes]((uint64_t)self);
  return self->_avoidedModes.list;
}

- (void)clearAvoidedModes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Clear();
}

- (void)addAvoidedMode:(int)a3
{
  -[GEOWalkingOptions _readAvoidedModes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (int)avoidedModeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_avoidedModes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWalkingOptions _readAvoidedModes]((uint64_t)self);
  p_avoidedModes = &self->_avoidedModes;
  count = self->_avoidedModes.count;
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
  return p_avoidedModes->list[a3];
}

- (void)setAvoidedModes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  PBRepeatedInt32Set();
}

- (id)avoidedModesAsString:(int)a3
{
  if (!a3)
    return CFSTR("AVOID_FERRY");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAvoidedModes:(id)a3
{
  objc_msgSend(a3, "isEqualToString:", CFSTR("AVOID_FERRY"));
  return 0;
}

- (void)_readWalkingUserPreferences
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWalkingOptionsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingUserPreferences_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasWalkingUserPreferences
{
  -[GEOWalkingOptions _readWalkingUserPreferences]((uint64_t)self);
  return self->_walkingUserPreferences != 0;
}

- (GEOWalkingUserPreferences)walkingUserPreferences
{
  -[GEOWalkingOptions _readWalkingUserPreferences]((uint64_t)self);
  return self->_walkingUserPreferences;
}

- (void)setWalkingUserPreferences:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_walkingUserPreferences, a3);
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
  v8.super_class = (Class)GEOWalkingOptions;
  -[GEOWalkingOptions description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWalkingOptions dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWalkingOptions _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("preferredSpeed");
    else
      v6 = CFSTR("preferred_speed");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v9 = 0;
      do
      {
        v10 = *(unsigned int *)(*v8 + 4 * v9);
        if ((_DWORD)v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = CFSTR("AVOID_FERRY");
        }
        objc_msgSend(v7, "addObject:", v11);

        ++v9;
        v8 = (_QWORD *)(a1 + 24);
      }
      while (v9 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v12 = CFSTR("avoidedMode");
    else
      v12 = CFSTR("avoided_mode");
    objc_msgSend(v4, "setObject:forKey:", v7, v12);

  }
  objc_msgSend((id)a1, "walkingUserPreferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("walkingUserPreferences");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("walking_user_preferences");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(void **)(a1 + 16);
  if (v17)
  {
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v18, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __47__GEOWalkingOptions__dictionaryRepresentation___block_invoke;
      v24[3] = &unk_1E1C00600;
      v21 = v20;
      v25 = v21;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v24);
      v22 = v21;

      v19 = v22;
    }
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWalkingOptions _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOWalkingOptions__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOWalkingOptions)initWithDictionary:(id)a3
{
  return (GEOWalkingOptions *)-[GEOWalkingOptions _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  GEOWalkingUserPreferences *v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("preferredSpeed");
      else
        v6 = CFSTR("preferred_speed");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setPreferredSpeed:");
      }

      if (a3)
        v8 = CFSTR("avoidedMode");
      else
        v8 = CFSTR("avoided_mode");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v5;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (!v11)
          goto LABEL_24;
        v12 = v11;
        v13 = *(_QWORD *)v25;
        while (1)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v10);
            v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "isEqualToString:", CFSTR("AVOID_FERRY"));
              v16 = 0;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v16 = objc_msgSend(v15, "intValue");
            }
            objc_msgSend(a1, "addAvoidedMode:", v16);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (!v12)
          {
LABEL_24:

            v5 = v23;
            break;
          }
        }
      }

      if (a3)
        v17 = CFSTR("walkingUserPreferences");
      else
        v17 = CFSTR("walking_user_preferences");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOWalkingUserPreferences alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOWalkingUserPreferences initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOWalkingUserPreferences initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setWalkingUserPreferences:", v20);

      }
    }
  }

  return a1;
}

- (GEOWalkingOptions)initWithJSON:(id)a3
{
  return (GEOWalkingOptions *)-[GEOWalkingOptions _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_7392;
    else
      v8 = (int *)&readAll__nonRecursiveTag_7393;
    GEOWalkingOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOWalkingUserPreferences readAll:](self->_walkingUserPreferences, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWalkingOptionsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWalkingOptionsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x1C) == 0))
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOWalkingOptions readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    v5 = v9;
    if (self->_avoidedModes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        v5 = v9;
        ++v6;
      }
      while (v6 < self->_avoidedModes.count);
    }
    if (self->_walkingUserPreferences)
    {
      PBDataWriterWriteSubmessage();
      v5 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;

  v7 = (id *)a3;
  -[GEOWalkingOptions readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 16) = self->_readerMarkPos;
  *((_DWORD *)v7 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v7[6] = *(id *)&self->_preferredSpeed;
    *((_BYTE *)v7 + 76) |= 1u;
  }
  if (-[GEOWalkingOptions avoidedModesCount](self, "avoidedModesCount"))
  {
    objc_msgSend(v7, "clearAvoidedModes");
    v4 = -[GEOWalkingOptions avoidedModesCount](self, "avoidedModesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addAvoidedMode:", -[GEOWalkingOptions avoidedModeAtIndex:](self, "avoidedModeAtIndex:", i));
    }
  }
  if (self->_walkingUserPreferences)
    objc_msgSend(v7, "setWalkingUserPreferences:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  PBUnknownFields *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWalkingOptionsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWalkingOptions readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 48) = self->_preferredSpeed;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  PBRepeatedInt32Copy();
  v9 = -[GEOWalkingUserPreferences copyWithZone:](self->_walkingUserPreferences, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOWalkingUserPreferences *walkingUserPreferences;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOWalkingOptions readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_preferredSpeed != *((double *)v4 + 6))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_10;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  walkingUserPreferences = self->_walkingUserPreferences;
  if ((unint64_t)walkingUserPreferences | *((_QWORD *)v4 + 7))
    v6 = -[GEOWalkingUserPreferences isEqual:](walkingUserPreferences, "isEqual:");
  else
    v6 = 1;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  double preferredSpeed;
  double v5;
  long double v6;
  double v7;
  uint64_t v8;

  -[GEOWalkingOptions readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    preferredSpeed = self->_preferredSpeed;
    v5 = -preferredSpeed;
    if (preferredSpeed >= 0.0)
      v5 = self->_preferredSpeed;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = PBRepeatedInt32Hash() ^ v3;
  return v8 ^ -[GEOWalkingUserPreferences hash](self->_walkingUserPreferences, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  GEOWalkingUserPreferences *walkingUserPreferences;
  double *v8;
  uint64_t v9;
  double *v10;

  v10 = (double *)a3;
  objc_msgSend(v10, "readAll:", 0);
  if ((*((_BYTE *)v10 + 76) & 1) != 0)
  {
    self->_preferredSpeed = v10[6];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v4 = objc_msgSend(v10, "avoidedModesCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOWalkingOptions addAvoidedMode:](self, "addAvoidedMode:", objc_msgSend(v10, "avoidedModeAtIndex:", i));
  }
  walkingUserPreferences = self->_walkingUserPreferences;
  v8 = v10;
  v9 = *((_QWORD *)v10 + 7);
  if (walkingUserPreferences)
  {
    if (v9)
    {
      -[GEOWalkingUserPreferences mergeFrom:](walkingUserPreferences, "mergeFrom:");
LABEL_11:
      v8 = v10;
    }
  }
  else if (v9)
  {
    -[GEOWalkingOptions setWalkingUserPreferences:](self, "setWalkingUserPreferences:");
    goto LABEL_11;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOWalkingOptionsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_7396);
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

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x12u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOWalkingOptions readAll:](self, "readAll:", 0);
    -[GEOWalkingUserPreferences clearUnknownFields:](self->_walkingUserPreferences, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingUserPreferences, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
