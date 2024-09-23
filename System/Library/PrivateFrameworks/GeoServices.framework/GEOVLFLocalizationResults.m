@implementation GEOVLFLocalizationResults

- (GEOVLFLocalizationResults)init
{
  GEOVLFLocalizationResults *v2;
  GEOVLFLocalizationResults *v3;
  GEOVLFLocalizationResults *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFLocalizationResults;
  v2 = -[GEOVLFLocalizationResults init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFLocalizationResults)initWithData:(id)a3
{
  GEOVLFLocalizationResults *v3;
  GEOVLFLocalizationResults *v4;
  GEOVLFLocalizationResults *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFLocalizationResults;
  v3 = -[GEOVLFLocalizationResults initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readVlfCorrection
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
        GEOVLFLocalizationResultsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVlfCorrection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasVlfCorrection
{
  -[GEOVLFLocalizationResults _readVlfCorrection]((uint64_t)self);
  return self->_vlfCorrection != 0;
}

- (GEOVLFCorrection)vlfCorrection
{
  -[GEOVLFLocalizationResults _readVlfCorrection]((uint64_t)self);
  return self->_vlfCorrection;
}

- (void)setVlfCorrection:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x18u;
  objc_storeStrong((id *)&self->_vlfCorrection, a3);
}

- (int)vlfFinalState
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_vlfFinalState;
  else
    return 0;
}

- (void)setVlfFinalState:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x12u;
  self->_vlfFinalState = a3;
}

- (void)setHasVlfFinalState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 18;
  else
    v3 = 16;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasVlfFinalState
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)vlfFinalStateAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C23A70[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsVlfFinalState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_FAILED_TO_INITIALIZE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_USER_ABANDONED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_FAILED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VLFFinalState_SUCCEEDED")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readLocalizationDetails
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
        GEOVLFLocalizationResultsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalizationDetails_tags_10027);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)localizationDetails
{
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  return self->_localizationDetails;
}

- (void)setLocalizationDetails:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *localizationDetails;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  localizationDetails = self->_localizationDetails;
  self->_localizationDetails = v4;

}

- (void)clearLocalizationDetails
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
  -[NSMutableArray removeAllObjects](self->_localizationDetails, "removeAllObjects");
}

- (void)addLocalizationDetails:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  -[GEOVLFLocalizationResults _addNoFlagsLocalizationDetails:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x10u;
}

- (void)_addNoFlagsLocalizationDetails:(uint64_t)a1
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

- (unint64_t)localizationDetailsCount
{
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  return -[NSMutableArray count](self->_localizationDetails, "count");
}

- (id)localizationDetailsAtIndex:(unint64_t)a3
{
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_localizationDetails, "objectAtIndex:", a3);
}

+ (Class)localizationDetailsType
{
  return (Class)objc_opt_class();
}

- (GEOVLFPositionContextClassification)positionContextClassification
{
  *retstr = *(GEOVLFPositionContextClassification *)&self->_type;
  return self;
}

- (void)setPositionContextClassification:(GEOVLFPositionContextClassification *)a3
{
  uint64_t v3;

  *(_BYTE *)&self->_flags |= 0x11u;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_positionContextClassification._indoorProbability = *(_OWORD *)&a3->_indoorProbability;
  *(_QWORD *)&self->_positionContextClassification._type = v3;
}

- (void)setHasPositionContextClassification:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x10;
}

- (BOOL)hasPositionContextClassification
{
  return *(_BYTE *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOVLFLocalizationResults;
  -[GEOVLFLocalizationResults description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFLocalizationResults dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocalizationResults _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  __CFString *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "vlfCorrection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("vlfCorrection");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("vlf_correction");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_BYTE *)(a1 + 72) & 2) != 0)
  {
    v9 = *(int *)(a1 + 68);
    if (v9 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C23A70[v9];
    }
    if (a2)
      v11 = CFSTR("vlfFinalState");
    else
      v11 = CFSTR("vlf_final_state");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = *(id *)(a1 + 40);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("localizationDetails");
    else
      v20 = CFSTR("localization_details");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  if ((*(_BYTE *)(a1 + 72) & 1) != 0)
  {
    _GEOVLFPositionContextClassificationDictionaryRepresentation(a1 + 16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("positionContextClassification");
    else
      v22 = CFSTR("position_context_classification");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOVLFLocalizationResults _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocalizationResults)initWithDictionary:(id)a3
{
  return (GEOVLFLocalizationResults *)-[GEOVLFLocalizationResults _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOVLFCorrection *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  GEOVLFLocalizationDetails *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_53;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_53;
  if (a3)
    v6 = CFSTR("vlfCorrection");
  else
    v6 = CFSTR("vlf_correction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOVLFCorrection alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOVLFCorrection initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOVLFCorrection initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setVlfCorrection:", v9);

  }
  if (a3)
    v11 = CFSTR("vlfFinalState");
  else
    v11 = CFSTR("vlf_final_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VLFFinalState_UNKNOWN")) & 1) != 0)
    {
      v14 = 0;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VLFFinalState_FAILED_TO_INITIALIZE")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VLFFinalState_USER_ABANDONED")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("VLFFinalState_FAILED")) & 1) != 0)
    {
      v14 = 3;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("VLFFinalState_SUCCEEDED")))
    {
      v14 = 4;
    }
    else
    {
      v14 = 0;
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_29:
    objc_msgSend(a1, "setVlfFinalState:", v14);
  }

  if (a3)
    v15 = CFSTR("localizationDetails");
  else
    v15 = CFSTR("localization_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = v5;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v35 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v23 = [GEOVLFLocalizationDetails alloc];
            if ((a3 & 1) != 0)
              v24 = -[GEOVLFLocalizationDetails initWithJSON:](v23, "initWithJSON:", v22);
            else
              v24 = -[GEOVLFLocalizationDetails initWithDictionary:](v23, "initWithDictionary:", v22);
            v25 = (void *)v24;
            objc_msgSend(a1, "addLocalizationDetails:", v24);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v19);
    }

    v5 = v29;
  }

  if (a3)
    v26 = CFSTR("positionContextClassification");
  else
    v26 = CFSTR("position_context_classification");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = 0uLL;
    v33 = 0;
    _GEOVLFPositionContextClassificationFromDictionaryRepresentation(v27, (uint64_t)&v32);
    v30 = v32;
    v31 = v33;
    objc_msgSend(a1, "setPositionContextClassification:", &v30);
  }

LABEL_53:
  return a1;
}

- (GEOVLFLocalizationResults)initWithJSON:(id)a3
{
  return (GEOVLFLocalizationResults *)-[GEOVLFLocalizationResults _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_10038;
    else
      v8 = (int *)&readAll__nonRecursiveTag_10039;
    GEOVLFLocalizationResultsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOVLFLocalizationResultsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocalizationResultsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocalizationResultsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
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
  if (self->_reader && (_GEOVLFLocalizationResultsIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOVLFLocalizationResults readAll:](self, "readAll:", 0);
    if (self->_vlfCorrection)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_localizationDetails;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
      PBDataWriterPlaceMark();
      GEOVLFPositionContextClassificationWriteTo((uint64_t)&self->_positionContextClassification);
      PBDataWriterRecallMark();
    }
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOVLFLocalizationResults _readLocalizationDetails]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_localizationDetails;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOVLFLocalizationResults readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 14) = self->_readerMarkPos;
  *((_DWORD *)v9 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_vlfCorrection)
    objc_msgSend(v9, "setVlfCorrection:");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v9 + 17) = self->_vlfFinalState;
    *((_BYTE *)v9 + 72) |= 2u;
  }
  if (-[GEOVLFLocalizationResults localizationDetailsCount](self, "localizationDetailsCount"))
  {
    objc_msgSend(v9, "clearLocalizationDetails");
    v4 = -[GEOVLFLocalizationResults localizationDetailsCount](self, "localizationDetailsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOVLFLocalizationResults localizationDetailsAtIndex:](self, "localizationDetailsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addLocalizationDetails:", v7);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v8 = *(void **)&self->_positionContextClassification._type;
    *((_OWORD *)v9 + 1) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    v9[4] = v8;
    *((_BYTE *)v9 + 72) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
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
      GEOVLFLocalizationResultsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFLocalizationResults readAll:](self, "readAll:", 0);
  v9 = -[GEOVLFCorrection copyWithZone:](self->_vlfCorrection, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_vlfFinalState;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = self->_localizationDetails;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
        objc_msgSend((id)v5, "addLocalizationDetails:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v12);
  }

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v16 = *(_QWORD *)&self->_positionContextClassification._type;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    *(_QWORD *)(v5 + 32) = v16;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOVLFCorrection *vlfCorrection;
  char flags;
  char v7;
  NSMutableArray *localizationDetails;
  BOOL v9;
  BOOL v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEOVLFLocalizationResults readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  vlfCorrection = self->_vlfCorrection;
  if ((unint64_t)vlfCorrection | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOVLFCorrection isEqual:](vlfCorrection, "isEqual:"))
      goto LABEL_21;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 72);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_vlfFinalState != *((_DWORD *)v4 + 17))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_21;
  }
  localizationDetails = self->_localizationDetails;
  if ((unint64_t)localizationDetails | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](localizationDetails, "isEqual:"))
    {
LABEL_21:
      v9 = 0;
      goto LABEL_22;
    }
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 72);
  }
  v9 = (v7 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) != 0)
    {
      v10 = *(_QWORD *)&self->_positionContextClassification._indoorProbability == *((_QWORD *)v4 + 2)
         && *(_QWORD *)&self->_positionContextClassification._outdoorProbability == *((_QWORD *)v4 + 3);
      if (v10 && *(_QWORD *)&self->_positionContextClassification._type == *((_QWORD *)v4 + 4))
      {
        v9 = 1;
        goto LABEL_22;
      }
    }
    goto LABEL_21;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOVLFLocalizationResults readAll:](self, "readAll:", 1);
  v3 = -[GEOVLFCorrection hash](self->_vlfCorrection, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v4 = 2654435761 * self->_vlfFinalState;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_localizationDetails, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v6 = PBHashBytes();
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOVLFCorrection *vlfCorrection;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  vlfCorrection = self->_vlfCorrection;
  v6 = *((_QWORD *)v4 + 6);
  if (vlfCorrection)
  {
    if (v6)
      -[GEOVLFCorrection mergeFrom:](vlfCorrection, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOVLFLocalizationResults setVlfCorrection:](self, "setVlfCorrection:");
  }
  if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    self->_vlfFinalState = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = *((id *)v4 + 5);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        -[GEOVLFLocalizationResults addLocalizationDetails:](self, "addLocalizationDetails:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    v12 = *((_QWORD *)v4 + 4);
    *(_OWORD *)&self->_positionContextClassification._indoorProbability = *((_OWORD *)v4 + 1);
    *(_QWORD *)&self->_positionContextClassification._type = v12;
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vlfCorrection, 0);
  objc_storeStrong((id *)&self->_localizationDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
