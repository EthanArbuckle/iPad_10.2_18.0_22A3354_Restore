@implementation GEOAttributionApp

- (GEOAttributionApp)init
{
  GEOAttributionApp *v2;
  GEOAttributionApp *v3;
  GEOAttributionApp *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAttributionApp;
  v2 = -[GEOAttributionApp init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAttributionApp)initWithData:(id)a3
{
  GEOAttributionApp *v3;
  GEOAttributionApp *v4;
  GEOAttributionApp *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAttributionApp;
  v3 = -[GEOAttributionApp initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (NSString)appBundleIdentifier
{
  PBDataReader *reader;
  PBDataReader *v4;

  if (self)
  {
    os_unfair_lock_lock(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x10) == 0)
    {
      reader = self->_reader;
      if (reader)
      {
        v4 = reader;
        objc_sync_enter(v4);
        GEOAttributionAppReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&_readAppBundleIdentifier_tags);
        objc_sync_exit(v4);

      }
    }
    os_unfair_lock_unlock(&self->_readerLock);
  }
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_appBundleIdentifier, a3);
}

- (void)_readHandledSchemes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 60) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAttributionAppReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHandledSchemes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)handledSchemes
{
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  return self->_handledSchemes;
}

- (void)setHandledSchemes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *handledSchemes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  handledSchemes = self->_handledSchemes;
  self->_handledSchemes = v4;

}

- (void)clearHandledSchemes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_handledSchemes, "removeAllObjects");
}

- (void)addHandledSchemes:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  -[GEOAttributionApp _addNoFlagsHandledSchemes:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsHandledSchemes:(uint64_t)a1
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

- (unint64_t)handledSchemesCount
{
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  return -[NSMutableArray count](self->_handledSchemes, "count");
}

- (id)handledSchemesAtIndex:(unint64_t)a3
{
  -[GEOAttributionApp _readHandledSchemes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_handledSchemes, "objectAtIndex:", a3);
}

+ (Class)handledSchemesType
{
  return (Class)objc_opt_class();
}

- (BOOL)supportsRestaurantReservations
{
  return self->_supportsRestaurantReservations;
}

- (void)setSupportsRestaurantReservations:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_supportsRestaurantReservations = a3;
}

- (void)setHasSupportsRestaurantReservations:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasSupportsRestaurantReservations
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (BOOL)supportsRestaurantQueueing
{
  return self->_supportsRestaurantQueueing;
}

- (void)setSupportsRestaurantQueueing:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_supportsRestaurantQueueing = a3;
}

- (void)setHasSupportsRestaurantQueueing:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSupportsRestaurantQueueing
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)restaurantReservationExtensionSupport
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_restaurantReservationExtensionSupport;
  else
    return 1;
}

- (void)setRestaurantReservationExtensionSupport:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_restaurantReservationExtensionSupport = a3;
}

- (void)setHasRestaurantReservationExtensionSupport:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasRestaurantReservationExtensionSupport
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)restaurantReservationExtensionSupportAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C10120[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRestaurantReservationExtensionSupport:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTENSION_SUPPORT_ALLOW_APP")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTENSION_SUPPORT_OFFER_APP")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("EXTENSION_SUPPORT_BLACKLIST_APP")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
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
  v8.super_class = (Class)GEOAttributionApp;
  -[GEOAttributionApp description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAttributionApp dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAttributionApp _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "appBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("appBundleIdentifier"));

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)a1, "handledSchemes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("handledSchemes"));

  }
  v7 = *(_BYTE *)(a1 + 60);
  if ((v7 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("supportsRestaurantReservations"));

    v7 = *(_BYTE *)(a1 + 60);
    if ((v7 & 2) == 0)
    {
LABEL_8:
      if ((v7 & 1) == 0)
        goto LABEL_16;
LABEL_12:
      v10 = *(_DWORD *)(a1 + 52) - 1;
      if (v10 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 52));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E1C10120[v10];
      }
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("restaurantReservationExtensionSupport"));

      goto LABEL_16;
    }
  }
  else if ((*(_BYTE *)(a1 + 60) & 2) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("supportsRestaurantQueueing"));

  if ((*(_BYTE *)(a1 + 60) & 1) != 0)
    goto LABEL_12;
LABEL_16:
  v12 = *(void **)(a1 + 16);
  if (v12)
  {
    objc_msgSend(v12, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v13, "count"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __47__GEOAttributionApp__dictionaryRepresentation___block_invoke;
      v19[3] = &unk_1E1C00600;
      v16 = v15;
      v20 = v16;
      objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v19);
      v17 = v16;

      v14 = v17;
    }
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAttributionApp _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __47__GEOAttributionApp__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOAttributionApp)initWithDictionary:(id)a3
{
  return (GEOAttributionApp *)-[GEOAttributionApp _initWithDictionary:isJSON:](self, a3);
}

- (void)_initWithDictionary:(void *)a1 isJSON:(void *)a2
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("appBundleIdentifier"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = (void *)objc_msgSend(v4, "copy");
        objc_msgSend(a1, "setAppBundleIdentifier:", v5);

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("handledSchemes"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = (void *)objc_msgSend(v12, "copy", (_QWORD)v20);
                objc_msgSend(a1, "addHandledSchemes:", v13);

              }
              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          }
          while (v9);
        }

      }
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsRestaurantReservations"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsRestaurantReservations:", objc_msgSend(v14, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("supportsRestaurantQueueing"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSupportsRestaurantQueueing:", objc_msgSend(v15, "BOOLValue"));

      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("restaurantReservationExtensionSupport"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXTENSION_SUPPORT_ALLOW_APP")) & 1) != 0)
        {
          v18 = 1;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("EXTENSION_SUPPORT_OFFER_APP")) & 1) != 0)
        {
          v18 = 2;
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("EXTENSION_SUPPORT_BLACKLIST_APP")))
        {
          v18 = 3;
        }
        else
        {
          v18 = 1;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_32:

          goto LABEL_33;
        }
        v18 = objc_msgSend(v16, "intValue");
      }
      objc_msgSend(a1, "setRestaurantReservationExtensionSupport:", v18, (_QWORD)v20);
      goto LABEL_32;
    }
  }
LABEL_33:

  return a1;
}

- (GEOAttributionApp)initWithJSON:(id)a3
{
  return (GEOAttributionApp *)-[GEOAttributionApp _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_55;
    else
      v8 = (int *)&readAll__nonRecursiveTag_55;
    GEOAttributionAppReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAttributionAppIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAttributionAppReadAllFrom((uint64_t)self, a3, 0);
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
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x70) == 0))
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAttributionApp readAll:](self, "readAll:", 0);
    PBDataWriterWriteStringField();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_handledSchemes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  id *v9;

  v9 = (id *)a3;
  -[GEOAttributionApp readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 10) = self->_readerMarkPos;
  *((_DWORD *)v9 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  objc_msgSend(v9, "setAppBundleIdentifier:", self->_appBundleIdentifier);
  if (-[GEOAttributionApp handledSchemesCount](self, "handledSchemesCount"))
  {
    objc_msgSend(v9, "clearHandledSchemes");
    v4 = -[GEOAttributionApp handledSchemesCount](self, "handledSchemesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOAttributionApp handledSchemesAtIndex:](self, "handledSchemesAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addHandledSchemes:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
LABEL_11:
    *((_BYTE *)v9 + 56) = self->_supportsRestaurantQueueing;
    *((_BYTE *)v9 + 60) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *((_BYTE *)v9 + 57) = self->_supportsRestaurantReservations;
  *((_BYTE *)v9 + 60) |= 4u;
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_11;
LABEL_7:
  if ((flags & 1) != 0)
  {
LABEL_8:
    *((_DWORD *)v9 + 13) = self->_restaurantReservationExtensionSupport;
    *((_BYTE *)v9 + 60) |= 1u;
  }
LABEL_9:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char flags;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAttributionApp readAll:](self, "readAll:", 0);
    v9 = -[NSString copyWithZone:](self->_appBundleIdentifier, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v9;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_handledSchemes;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
          objc_msgSend((id)v5, "addHandledSchemes:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_BYTE *)(v5 + 57) = self->_supportsRestaurantReservations;
      *(_BYTE *)(v5 + 60) |= 4u;
      flags = (char)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_14:
        if ((flags & 1) == 0)
        {
LABEL_16:
          v17 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v17;
          goto LABEL_17;
        }
LABEL_15:
        *(_DWORD *)(v5 + 52) = self->_restaurantReservationExtensionSupport;
        *(_BYTE *)(v5 + 60) |= 1u;
        goto LABEL_16;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 2) == 0)
    {
      goto LABEL_14;
    }
    *(_BYTE *)(v5 + 56) = self->_supportsRestaurantQueueing;
    *(_BYTE *)(v5 + 60) |= 2u;
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOAttributionAppReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_17:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *appBundleIdentifier;
  NSMutableArray *handledSchemes;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[GEOAttributionApp readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  appBundleIdentifier = self->_appBundleIdentifier;
  if ((unint64_t)appBundleIdentifier | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](appBundleIdentifier, "isEqual:"))
      goto LABEL_26;
  }
  handledSchemes = self->_handledSchemes;
  if ((unint64_t)handledSchemes | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](handledSchemes, "isEqual:"))
      goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 4) == 0)
      goto LABEL_26;
    if (self->_supportsRestaurantReservations)
    {
      if (!*((_BYTE *)v4 + 57))
        goto LABEL_26;
    }
    else if (*((_BYTE *)v4 + 57))
    {
      goto LABEL_26;
    }
  }
  else if ((*((_BYTE *)v4 + 60) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) != 0)
    {
      if (self->_supportsRestaurantQueueing)
      {
        if (!*((_BYTE *)v4 + 56))
          goto LABEL_26;
        goto LABEL_22;
      }
      if (!*((_BYTE *)v4 + 56))
        goto LABEL_22;
    }
LABEL_26:
    v7 = 0;
    goto LABEL_27;
  }
  if ((*((_BYTE *)v4 + 60) & 2) != 0)
    goto LABEL_26;
LABEL_22:
  v7 = (*((_BYTE *)v4 + 60) & 1) == 0;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 60) & 1) == 0 || self->_restaurantReservationExtensionSupport != *((_DWORD *)v4 + 13))
      goto LABEL_26;
    v7 = 1;
  }
LABEL_27:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOAttributionApp readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_appBundleIdentifier, "hash");
  v4 = -[NSMutableArray hash](self->_handledSchemes, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_supportsRestaurantReservations;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_supportsRestaurantQueueing;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_restaurantReservationExtensionSupport;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 3))
    -[GEOAttributionApp setAppBundleIdentifier:](self, "setAppBundleIdentifier:");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[GEOAttributionApp addHandledSchemes:](self, "addHandledSchemes:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 60);
  if ((v10 & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 60) & 2) == 0)
      goto LABEL_12;
LABEL_16:
    self->_supportsRestaurantQueueing = *((_BYTE *)v4 + 56);
    *(_BYTE *)&self->_flags |= 2u;
    if ((*((_BYTE *)v4 + 60) & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  self->_supportsRestaurantReservations = *((_BYTE *)v4 + 57);
  *(_BYTE *)&self->_flags |= 4u;
  v10 = *((_BYTE *)v4 + 60);
  if ((v10 & 2) != 0)
    goto LABEL_16;
LABEL_12:
  if ((v10 & 1) != 0)
  {
LABEL_13:
    self->_restaurantReservationExtensionSupport = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }
LABEL_14:

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOAttributionAppReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_12);
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
  *(_BYTE *)&self->_flags |= 0x48u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
    -[GEOAttributionApp readAll:](self, "readAll:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handledSchemes, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
