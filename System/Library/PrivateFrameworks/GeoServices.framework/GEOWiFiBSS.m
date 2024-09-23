@implementation GEOWiFiBSS

- (GEOWiFiBSS)init
{
  GEOWiFiBSS *v2;
  GEOWiFiBSS *v3;
  GEOWiFiBSS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOWiFiBSS;
  v2 = -[GEOWiFiBSS init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOWiFiBSS)initWithData:(id)a3
{
  GEOWiFiBSS *v3;
  GEOWiFiBSS *v4;
  GEOWiFiBSS *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOWiFiBSS;
  v3 = -[GEOWiFiBSS initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOWiFiBSS;
  -[GEOWiFiBSS dealloc](&v3, sel_dealloc);
}

- (void)_readIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIdentifier_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasIdentifier
{
  -[GEOWiFiBSS _readIdentifier]((uint64_t)self);
  return self->_identifier != 0;
}

- (NSString)identifier
{
  -[GEOWiFiBSS _readIdentifier]((uint64_t)self);
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_5);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLocation
{
  -[GEOWiFiBSS _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOLatLng)location
{
  -[GEOWiFiBSS _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)_readAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)attributesCount
{
  -[GEOWiFiBSS _readAttributes]((uint64_t)self);
  return self->_attributes.count;
}

- (int)attributes
{
  -[GEOWiFiBSS _readAttributes]((uint64_t)self);
  return self->_attributes.list;
}

- (void)clearAttributes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Clear();
}

- (void)addAttributes:(int)a3
{
  -[GEOWiFiBSS _readAttributes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (int)attributesAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_attributes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOWiFiBSS _readAttributes]((uint64_t)self);
  p_attributes = &self->_attributes;
  count = self->_attributes.count;
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
  return p_attributes->list[a3];
}

- (void)setAttributes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedInt32Set();
}

- (id)attributesAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C09E30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAttributes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISEDGE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ISTCPGOOD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ISSUSPICIOUS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readQualities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQualities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)qualities
{
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  return self->_qualities;
}

- (void)setQualities:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *qualities;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  qualities = self->_qualities;
  self->_qualities = v4;

}

- (void)clearQualities
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  -[NSMutableArray removeAllObjects](self->_qualities, "removeAllObjects");
}

- (void)addQualities:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  -[GEOWiFiBSS _addNoFlagsQualities:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (void)_addNoFlagsQualities:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)qualitiesCount
{
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  return -[NSMutableArray count](self->_qualities, "count");
}

- (id)qualitiesAtIndex:(unint64_t)a3
{
  -[GEOWiFiBSS _readQualities]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_qualities, "objectAtIndex:", a3);
}

+ (Class)qualitiesType
{
  return (Class)objc_opt_class();
}

- (int64_t)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(int64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_uniqueIdentifier = a3;
}

- (void)setHasUniqueIdentifier:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasUniqueIdentifier
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readLatLngE7
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 92) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOWiFiBSSReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLatLngE7_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasLatLngE7
{
  -[GEOWiFiBSS _readLatLngE7]((uint64_t)self);
  return self->_latLngE7 != 0;
}

- (GEOLatLngE7)latLngE7
{
  -[GEOWiFiBSS _readLatLngE7]((uint64_t)self);
  return self->_latLngE7;
}

- (void)setLatLngE7:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_latLngE7, a3);
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
  v8.super_class = (Class)GEOWiFiBSS;
  -[GEOWiFiBSS description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOWiFiBSS dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOWiFiBSS _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  unint64_t v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend((id)a1, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v6, "jsonRepresentation");
    else
      objc_msgSend(v6, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("location"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v11 = 0;
      do
      {
        v12 = *(int *)(*v10 + 4 * v11);
        if (v12 >= 4)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v13 = off_1E1C09E30[v12];
        }
        objc_msgSend(v9, "addObject:", v13);

        ++v11;
        v10 = (_QWORD *)(a1 + 16);
      }
      while (v11 < *(_QWORD *)(a1 + 24));
    }
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("attributes"));

  }
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v15 = *(id *)(a1 + 64);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v17);
    }

    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("qualities"));
  }
  if ((*(_BYTE *)(a1 + 92) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 72));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("uniqueIdentifier"));

  }
  objc_msgSend((id)a1, "latLngE7");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("latLngE7"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOWiFiBSS _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOWiFiBSS)initWithDictionary:(id)a3
{
  return (GEOWiFiBSS *)-[GEOWiFiBSS _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  GEOLatLng *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  uint64_t v28;
  GEOWiFiQualityProfile *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  GEOLatLngE7 *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  id v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1)
  {
    v5 = (void *)objc_msgSend(a1, "init");
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(v5, "setIdentifier:", v7);

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = [GEOLatLng alloc];
        if ((a3 & 1) != 0)
          v10 = -[GEOLatLng initWithJSON:](v9, "initWithJSON:", v8);
        else
          v10 = -[GEOLatLng initWithDictionary:](v9, "initWithDictionary:", v8);
        v11 = (void *)v10;
        objc_msgSend(v5, "setLocation:", v10);

      }
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = v12;
        v39 = v4;
        v47 = 0u;
        v48 = 0u;
        v45 = 0u;
        v46 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (!v14)
          goto LABEL_32;
        v15 = v14;
        v16 = *(_QWORD *)v46;
        while (1)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v46 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
              {
                v20 = 0;
              }
              else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("ISEDGE")) & 1) != 0)
              {
                v20 = 1;
              }
              else if ((objc_msgSend(v19, "isEqualToString:", CFSTR("ISTCPGOOD")) & 1) != 0)
              {
                v20 = 2;
              }
              else if (objc_msgSend(v19, "isEqualToString:", CFSTR("ISSUSPICIOUS")))
              {
                v20 = 3;
              }
              else
              {
                v20 = 0;
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              v20 = objc_msgSend(v18, "intValue");
            }
            objc_msgSend(v5, "addAttributes:", v20);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
          if (!v15)
          {
LABEL_32:

            v12 = v38;
            v4 = v39;
            break;
          }
        }
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("qualities"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v4;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v23 = v21;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v42;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v42 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v29 = [GEOWiFiQualityProfile alloc];
                if ((a3 & 1) != 0)
                  v30 = -[GEOWiFiQualityProfile initWithJSON:](v29, "initWithJSON:", v28);
                else
                  v30 = -[GEOWiFiQualityProfile initWithDictionary:](v29, "initWithDictionary:", v28);
                v31 = (void *)v30;
                objc_msgSend(v5, "addQualities:", v30);

              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
          }
          while (v25);
        }

        v4 = v22;
      }

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "setUniqueIdentifier:", objc_msgSend(v32, "longLongValue"));

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("latLngE7"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v34 = [GEOLatLngE7 alloc];
        if ((a3 & 1) != 0)
          v35 = -[GEOLatLngE7 initWithJSON:](v34, "initWithJSON:", v33);
        else
          v35 = -[GEOLatLngE7 initWithDictionary:](v34, "initWithDictionary:", v33);
        v36 = (void *)v35;
        objc_msgSend(v5, "setLatLngE7:", v35);

      }
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOWiFiBSS)initWithJSON:(id)a3
{
  return (GEOWiFiBSS *)-[GEOWiFiBSS _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_33;
    else
      v8 = (int *)&readAll__nonRecursiveTag_33;
    GEOWiFiBSSReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOWiFiBSSCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOWiFiBSSIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOWiFiBSSReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x7E) == 0))
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
    -[GEOWiFiBSS readAll:](self, "readAll:", 0);
    if (self->_identifier)
      PBDataWriterWriteStringField();
    if (self->_location)
      PBDataWriterWriteSubmessage();
    if (self->_attributes.count)
    {
      v6 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v6;
      }
      while (v6 < self->_attributes.count);
    }
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_qualities;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt64Field();
    if (self->_latLngE7)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOWiFiBSS _readLocation]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  unint64_t v7;
  unint64_t v8;
  uint64_t j;
  void *v10;
  id *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOWiFiBSS readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 20) = self->_readerMarkPos;
  *((_DWORD *)v12 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_identifier)
    objc_msgSend(v12, "setIdentifier:");
  if (self->_location)
    objc_msgSend(v12, "setLocation:");
  if (-[GEOWiFiBSS attributesCount](self, "attributesCount"))
  {
    objc_msgSend(v12, "clearAttributes");
    v4 = -[GEOWiFiBSS attributesCount](self, "attributesCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v12, "addAttributes:", -[GEOWiFiBSS attributesAtIndex:](self, "attributesAtIndex:", i));
    }
  }
  if (-[GEOWiFiBSS qualitiesCount](self, "qualitiesCount"))
  {
    objc_msgSend(v12, "clearQualities");
    v7 = -[GEOWiFiBSS qualitiesCount](self, "qualitiesCount");
    if (v7)
    {
      v8 = v7;
      for (j = 0; j != v8; ++j)
      {
        -[GEOWiFiBSS qualitiesAtIndex:](self, "qualitiesAtIndex:", j);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addQualities:", v10);

      }
    }
  }
  v11 = v12;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v12[9] = (id)self->_uniqueIdentifier;
    *((_BYTE *)v12 + 92) |= 1u;
  }
  if (self->_latLngE7)
  {
    objc_msgSend(v12, "setLatLngE7:");
    v11 = v12;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOWiFiBSSReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOWiFiBSS readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  v11 = -[GEOLatLng copyWithZone:](self->_location, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  PBRepeatedInt32Copy();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = self->_qualities;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
        objc_msgSend((id)v5, "addQualities:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v14);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 72) = self->_uniqueIdentifier;
    *(_BYTE *)(v5 + 92) |= 1u;
  }
  v18 = -[GEOLatLngE7 copyWithZone:](self->_latLngE7, "copyWithZone:", a3, (_QWORD)v20);
  v8 = *(id *)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v18;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  GEOLatLng *location;
  NSMutableArray *qualities;
  GEOLatLngE7 *latLngE7;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOWiFiBSS readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  identifier = self->_identifier;
  if ((unint64_t)identifier | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](identifier, "isEqual:"))
      goto LABEL_16;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLatLng isEqual:](location, "isEqual:"))
      goto LABEL_16;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_16;
  qualities = self->_qualities;
  if ((unint64_t)qualities | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](qualities, "isEqual:"))
      goto LABEL_16;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 92) & 1) == 0 || self->_uniqueIdentifier != *((_QWORD *)v4 + 9))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  latLngE7 = self->_latLngE7;
  if ((unint64_t)latLngE7 | *((_QWORD *)v4 + 6))
    v9 = -[GEOLatLngE7 isEqual:](latLngE7, "isEqual:");
  else
    v9 = 1;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEOWiFiBSS readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[GEOLatLng hash](self->_location, "hash");
  v5 = PBRepeatedInt32Hash();
  v6 = -[NSMutableArray hash](self->_qualities, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_uniqueIdentifier;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[GEOLatLngE7 hash](self->_latLngE7, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLatLng *location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  GEOLatLngE7 *latLngE7;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 5))
    -[GEOWiFiBSS setIdentifier:](self, "setIdentifier:");
  location = self->_location;
  v6 = *((_QWORD *)v4 + 7);
  if (location)
  {
    if (v6)
      -[GEOLatLng mergeFrom:](location, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOWiFiBSS setLocation:](self, "setLocation:");
  }
  v7 = objc_msgSend(v4, "attributesCount");
  if (v7)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
      -[GEOWiFiBSS addAttributes:](self, "addAttributes:", objc_msgSend(v4, "attributesAtIndex:", i));
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = *((id *)v4 + 8);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[GEOWiFiBSS addQualities:](self, "addQualities:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j), (_QWORD)v17);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  if ((*((_BYTE *)v4 + 92) & 1) != 0)
  {
    self->_uniqueIdentifier = *((_QWORD *)v4 + 9);
    *(_BYTE *)&self->_flags |= 1u;
  }
  latLngE7 = self->_latLngE7;
  v16 = *((_QWORD *)v4 + 6);
  if (latLngE7)
  {
    if (v16)
      -[GEOLatLngE7 mergeFrom:](latLngE7, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOWiFiBSS setLatLngE7:](self, "setLatLngE7:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_qualities, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_latLngE7, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
