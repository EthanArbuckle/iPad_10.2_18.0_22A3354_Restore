@implementation GEOAddressCorrectionUpdateRequest

- (GEOAddressCorrectionUpdateRequest)init
{
  GEOAddressCorrectionUpdateRequest *v2;
  GEOAddressCorrectionUpdateRequest *v3;
  GEOAddressCorrectionUpdateRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAddressCorrectionUpdateRequest;
  v2 = -[GEOAddressCorrectionUpdateRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAddressCorrectionUpdateRequest)initWithData:(id)a3
{
  GEOAddressCorrectionUpdateRequest *v3;
  GEOAddressCorrectionUpdateRequest *v4;
  GEOAddressCorrectionUpdateRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAddressCorrectionUpdateRequest;
  v3 = -[GEOAddressCorrectionUpdateRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)correctionStatus
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_correctionStatus;
  else
    return 0;
}

- (void)setCorrectionStatus:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x11u;
  self->_correctionStatus = a3;
}

- (void)setHasCorrectionStatus:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasCorrectionStatus
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)correctionStatusAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C071D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCorrectionStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_LOCATION_EXACT_MATCH")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_LOCATION_NEARBY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_LOCATION_FAR_AWAY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSignificantLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSignificantLocations_tags_214);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)significantLocations
{
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  return self->_significantLocations;
}

- (void)setSignificantLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *significantLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  significantLocations = self->_significantLocations;
  self->_significantLocations = v4;

}

- (void)clearSignificantLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_significantLocations, "removeAllObjects");
}

- (void)addSignificantLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  -[GEOAddressCorrectionUpdateRequest _addNoFlagsSignificantLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsSignificantLocation:(uint64_t)a1
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

- (unint64_t)significantLocationsCount
{
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_significantLocations, "count");
}

- (id)significantLocationAtIndex:(unint64_t)a3
{
  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_significantLocations, "objectAtIndex:", a3);
}

+ (Class)significantLocationType
{
  return (Class)objc_opt_class();
}

- (void)_readAddressID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressID_tags_215);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (BOOL)hasAddressID
{
  -[GEOAddressCorrectionUpdateRequest _readAddressID]((uint64_t)self);
  return self->_addressID != 0;
}

- (NSString)addressID
{
  -[GEOAddressCorrectionUpdateRequest _readAddressID]((uint64_t)self);
  return self->_addressID;
}

- (void)setAddressID:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  objc_storeStrong((id *)&self->_addressID, a3);
}

- (void)_readAddressResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if ((*(_BYTE *)(a1 + 56) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAddressCorrectionUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
}

- (NSMutableArray)addressResults
{
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  return self->_addressResults;
}

- (void)setAddressResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *addressResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  addressResults = self->_addressResults;
  self->_addressResults = v4;

}

- (void)clearAddressResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_addressResults, "removeAllObjects");
}

- (void)addAddressResult:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  -[GEOAddressCorrectionUpdateRequest _addNoFlagsAddressResult:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsAddressResult:(uint64_t)a1
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

- (unint64_t)addressResultsCount
{
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  return -[NSMutableArray count](self->_addressResults, "count");
}

- (id)addressResultAtIndex:(unint64_t)a3
{
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_addressResults, "objectAtIndex:", a3);
}

+ (Class)addressResultType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOAddressCorrectionUpdateRequest;
  -[GEOAddressCorrectionUpdateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAddressCorrectionUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAddressCorrectionUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v5 = *(int *)(a1 + 52);
    if (v5 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 52));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C071D8[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("correctionStatus"));

  }
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = *(id *)(a1 + 32);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v30 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("significantLocation"));
  }
  objc_msgSend((id)a1, "addressID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("addressID"));

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v17 = *(id *)(a1 + 24);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v22, "jsonRepresentation");
          else
            objc_msgSend(v22, "dictionaryRepresentation");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v23);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v19);
    }

    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("addressResult"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOAddressCorrectionUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAddressCorrectionUpdateRequest)initWithDictionary:(id)a3
{
  return (GEOAddressCorrectionUpdateRequest *)-[GEOAddressCorrectionUpdateRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  GEOSignificantLocation *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  GEOAddressCorrectionResult *v28;
  uint64_t v29;
  void *v30;
  id v32;
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
  v5 = a2;
  if (!a1)
    goto LABEL_46;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_46;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("correctionStatus"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_LOCATION_EXACT_MATCH")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_LOCATION_NEARBY")) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS_LOCATION_FAR_AWAY")))
    {
      v8 = 2;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_14:
    objc_msgSend(a1, "setCorrectionStatus:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("significantLocation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v32 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v38 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = [GEOSignificantLocation alloc];
            if ((a3 & 1) != 0)
              v17 = -[GEOSignificantLocation initWithJSON:](v16, "initWithJSON:", v15);
            else
              v17 = -[GEOSignificantLocation initWithDictionary:](v16, "initWithDictionary:", v15);
            v18 = (void *)v17;
            objc_msgSend(a1, "addSignificantLocation:", v17);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v12);
    }

    v5 = v32;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(a1, "setAddressID:", v20);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("addressResult"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v34 != v25)
            objc_enumerationMutation(v22);
          v27 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = [GEOAddressCorrectionResult alloc];
            if ((a3 & 1) != 0)
              v29 = -[GEOAddressCorrectionResult initWithJSON:](v28, "initWithJSON:", v27);
            else
              v29 = -[GEOAddressCorrectionResult initWithDictionary:](v28, "initWithDictionary:", v27);
            v30 = (void *)v29;
            objc_msgSend(a1, "addAddressResult:", v29);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v24);
    }

    v5 = v32;
  }

LABEL_46:
  return a1;
}

- (GEOAddressCorrectionUpdateRequest)initWithJSON:(id)a3
{
  return (GEOAddressCorrectionUpdateRequest *)-[GEOAddressCorrectionUpdateRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_221;
    else
      v8 = (int *)&readAll__nonRecursiveTag_222;
    GEOAddressCorrectionUpdateRequestReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAddressCorrectionUpdateRequestCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAddressCorrectionUpdateRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAddressCorrectionUpdateRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAddressCorrectionUpdateRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOAddressCorrectionUpdateRequest readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_significantLocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_addressID)
      PBDataWriterWriteStringField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_addressResults;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

  }
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOAddressCorrectionUpdateRequestClearSensitiveFields((uint64_t)self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[GEOAddressCorrectionUpdateRequest _readAddressResults]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = self->_addressResults;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_18;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOAddressCorrectionUpdateRequest _readSignificantLocations]((uint64_t)self);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_significantLocations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)
        break;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
        if (v11)
          goto LABEL_11;
        goto LABEL_17;
      }
    }
LABEL_18:
    v14 = 1;
    goto LABEL_19;
  }
LABEL_17:
  v14 = 0;
LABEL_19:

  return v14;
}

- (unsigned)requestTypeCode
{
  return 54;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  id *v12;

  v12 = (id *)a3;
  -[GEOAddressCorrectionUpdateRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v12 + 1, self->_reader);
  *((_DWORD *)v12 + 10) = self->_readerMarkPos;
  *((_DWORD *)v12 + 11) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v12 + 13) = self->_correctionStatus;
    *((_BYTE *)v12 + 56) |= 1u;
  }
  if (-[GEOAddressCorrectionUpdateRequest significantLocationsCount](self, "significantLocationsCount"))
  {
    objc_msgSend(v12, "clearSignificantLocations");
    v4 = -[GEOAddressCorrectionUpdateRequest significantLocationsCount](self, "significantLocationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOAddressCorrectionUpdateRequest significantLocationAtIndex:](self, "significantLocationAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addSignificantLocation:", v7);

      }
    }
  }
  if (self->_addressID)
    objc_msgSend(v12, "setAddressID:");
  if (-[GEOAddressCorrectionUpdateRequest addressResultsCount](self, "addressResultsCount"))
  {
    objc_msgSend(v12, "clearAddressResults");
    v8 = -[GEOAddressCorrectionUpdateRequest addressResultsCount](self, "addressResultsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOAddressCorrectionUpdateRequest addressResultAtIndex:](self, "addressResultAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addAddressResult:", v11);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
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
      GEOAddressCorrectionUpdateRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAddressCorrectionUpdateRequest readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 52) = self->_correctionStatus;
    *(_BYTE *)(v5 + 56) |= 1u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = self->_significantLocations;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addSignificantLocation:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v10);
  }

  v14 = -[NSString copyWithZone:](self->_addressID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = self->_addressResults;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v22 != v17)
          objc_enumerationMutation(v8);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addAddressResult:", v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v16);
  }
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *significantLocations;
  NSString *addressID;
  NSMutableArray *addressResults;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_13;
  -[GEOAddressCorrectionUpdateRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 56) & 1) == 0 || self->_correctionStatus != *((_DWORD *)v4 + 13))
      goto LABEL_13;
  }
  else if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
LABEL_13:
    v8 = 0;
    goto LABEL_14;
  }
  significantLocations = self->_significantLocations;
  if ((unint64_t)significantLocations | *((_QWORD *)v4 + 4)
    && !-[NSMutableArray isEqual:](significantLocations, "isEqual:"))
  {
    goto LABEL_13;
  }
  addressID = self->_addressID;
  if ((unint64_t)addressID | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](addressID, "isEqual:"))
      goto LABEL_13;
  }
  addressResults = self->_addressResults;
  if ((unint64_t)addressResults | *((_QWORD *)v4 + 3))
    v8 = -[NSMutableArray isEqual:](addressResults, "isEqual:");
  else
    v8 = 1;
LABEL_14:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  -[GEOAddressCorrectionUpdateRequest readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_correctionStatus;
  else
    v3 = 0;
  v4 = -[NSMutableArray hash](self->_significantLocations, "hash") ^ v3;
  v5 = -[NSString hash](self->_addressID, "hash");
  return v4 ^ v5 ^ -[NSMutableArray hash](self->_addressResults, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 56) & 1) != 0)
  {
    self->_correctionStatus = *((_DWORD *)v4 + 13);
    *(_BYTE *)&self->_flags |= 1u;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = *((id *)v4 + 4);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        -[GEOAddressCorrectionUpdateRequest addSignificantLocation:](self, "addSignificantLocation:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  if (*((_QWORD *)v4 + 2))
    -[GEOAddressCorrectionUpdateRequest setAddressID:](self, "setAddressID:");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = *((id *)v4 + 3);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[GEOAddressCorrectionUpdateRequest addAddressResult:](self, "addAddressResult:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_significantLocations, 0);
  objc_storeStrong((id *)&self->_addressResults, 0);
  objc_storeStrong((id *)&self->_addressID, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
