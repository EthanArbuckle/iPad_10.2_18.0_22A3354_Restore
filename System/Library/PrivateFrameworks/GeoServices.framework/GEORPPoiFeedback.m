@implementation GEORPPoiFeedback

- (GEORPPoiFeedback)init
{
  GEORPPoiFeedback *v2;
  GEORPPoiFeedback *v3;
  GEORPPoiFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiFeedback;
  v2 = -[GEORPPoiFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiFeedback)initWithData:(id)a3
{
  GEORPPoiFeedback *v3;
  GEORPPoiFeedback *v4;
  GEORPPoiFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiFeedback;
  v3 = -[GEORPPoiFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)correctionType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_correctionType;
  else
    return 0;
}

- (void)setCorrectionType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_correctionType = a3;
}

- (void)setHasCorrectionType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasCorrectionType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)correctionTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C03CB0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCorrectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_ADD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_EDIT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_OTHER")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCorrections_tags_2651);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasCorrections
{
  -[GEORPPoiFeedback _readCorrections]((uint64_t)self);
  return self->_corrections != 0;
}

- (GEORPPoiCorrections)corrections
{
  -[GEORPPoiFeedback _readCorrections]((uint64_t)self);
  return self->_corrections;
}

- (void)setCorrections:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_corrections, a3);
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_2652);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlace
{
  -[GEORPPoiFeedback _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDPlace)place
{
  -[GEORPPoiFeedback _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (void)_readPlaceRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequest_tags_2653);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPlaceRequest
{
  -[GEORPPoiFeedback _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest != 0;
}

- (GEOPDPlaceRequest)placeRequest
{
  -[GEORPPoiFeedback _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest;
}

- (void)setPlaceRequest:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (BOOL)addOtherPoi
{
  return self->_addOtherPoi;
}

- (void)setAddOtherPoi:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_addOtherPoi = a3;
}

- (void)setHasAddOtherPoi:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasAddOtherPoi
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readPoiCuratedCollectionContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiCuratedCollectionContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasPoiCuratedCollectionContext
{
  -[GEORPPoiFeedback _readPoiCuratedCollectionContext]((uint64_t)self);
  return self->_poiCuratedCollectionContext != 0;
}

- (GEORPCuratedCollectionContext)poiCuratedCollectionContext
{
  -[GEORPPoiFeedback _readPoiCuratedCollectionContext]((uint64_t)self);
  return self->_poiCuratedCollectionContext;
}

- (void)setPoiCuratedCollectionContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_poiCuratedCollectionContext, a3);
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
  v8.super_class = (Class)GEORPPoiFeedback;
  -[GEORPPoiFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 76) & 1) != 0)
  {
    v5 = *(int *)(a1 + 68);
    if (v5 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C03CB0[v5];
    }
    if (a2)
      v7 = CFSTR("correctionType");
    else
      v7 = CFSTR("correction_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "corrections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("corrections"));

  }
  objc_msgSend((id)a1, "place");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("place"));

  }
  objc_msgSend((id)a1, "placeRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("placeRequest");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("place_request");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if ((*(_BYTE *)(a1 + 76) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 72));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("addOtherPoi");
    else
      v19 = CFSTR("add_other_poi");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  objc_msgSend((id)a1, "poiCuratedCollectionContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v20, "jsonRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("poiCuratedCollectionContext");
    }
    else
    {
      objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("poi_curated_collection_context");
    }
    objc_msgSend(v4, "setObject:forKey:", v22, v23);

  }
  v24 = *(void **)(a1 + 16);
  if (v24)
  {
    objc_msgSend(v24, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __46__GEORPPoiFeedback__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v28 = v27;
      v32 = v28;
      objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v31);
      v29 = v28;

      v26 = v29;
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __46__GEORPPoiFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiFeedback)initWithDictionary:(id)a3
{
  return (GEORPPoiFeedback *)-[GEORPPoiFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  GEORPPoiCorrections *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  GEOPDPlace *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  GEOPDPlaceRequest *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEORPCuratedCollectionContext *v27;
  uint64_t v28;
  void *v29;

  v5 = a2;
  if (!a1)
    goto LABEL_52;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_52;
  if (a3)
    v6 = CFSTR("correctionType");
  else
    v6 = CFSTR("correction_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_ADD")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_EDIT")) & 1) != 0)
    {
      v9 = 2;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("POI_CORRECTION_TYPE_OTHER")))
    {
      v9 = 3;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_19:
    objc_msgSend(a1, "setCorrectionType:", v9);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("corrections"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEORPPoiCorrections alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEORPPoiCorrections initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEORPPoiCorrections initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setCorrections:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEOPDPlace alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEOPDPlace initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEOPDPlace initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setPlace:", v16);

  }
  if (a3)
    v18 = CFSTR("placeRequest");
  else
    v18 = CFSTR("place_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = [GEOPDPlaceRequest alloc];
    if ((a3 & 1) != 0)
      v21 = -[GEOPDPlaceRequest initWithJSON:](v20, "initWithJSON:", v19);
    else
      v21 = -[GEOPDPlaceRequest initWithDictionary:](v20, "initWithDictionary:", v19);
    v22 = (void *)v21;
    objc_msgSend(a1, "setPlaceRequest:", v21);

  }
  if (a3)
    v23 = CFSTR("addOtherPoi");
  else
    v23 = CFSTR("add_other_poi");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAddOtherPoi:", objc_msgSend(v24, "BOOLValue"));

  if (a3)
    v25 = CFSTR("poiCuratedCollectionContext");
  else
    v25 = CFSTR("poi_curated_collection_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEORPCuratedCollectionContext alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEORPCuratedCollectionContext initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEORPCuratedCollectionContext initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setPoiCuratedCollectionContext:", v28);

  }
LABEL_52:

  return a1;
}

- (GEORPPoiFeedback)initWithJSON:(id)a3
{
  return (GEORPPoiFeedback *)-[GEORPPoiFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2663;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2664;
    GEORPPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPPoiFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEORPPoiFeedbackIsDirty((uint64_t)self))
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPoiFeedback readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_corrections)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeRequest)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if ((*(_BYTE *)&self->_flags & 2) != 0)
    {
      PBDataWriterWriteBOOLField();
      v5 = v8;
    }
    if (self->_poiCuratedCollectionContext)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPPoiFeedbackClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPoiFeedback _readCorrections]((uint64_t)self);
  if (-[GEORPPoiCorrections hasGreenTeaWithValue:](self->_corrections, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPPoiFeedback _readPlace]((uint64_t)self);
  if (-[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPPoiFeedback _readPlaceRequest]((uint64_t)self);
  return -[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_placeRequest, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPPoiFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 14) = self->_readerMarkPos;
  *((_DWORD *)v5 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 17) = self->_correctionType;
    *((_BYTE *)v5 + 76) |= 1u;
  }
  if (self->_corrections)
  {
    objc_msgSend(v5, "setCorrections:");
    v4 = v5;
  }
  if (self->_place)
  {
    objc_msgSend(v5, "setPlace:");
    v4 = v5;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v5, "setPlaceRequest:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_BYTE *)v4 + 72) = self->_addOtherPoi;
    *((_BYTE *)v4 + 76) |= 2u;
  }
  if (self->_poiCuratedCollectionContext)
  {
    objc_msgSend(v5, "setPoiCuratedCollectionContext:");
    v4 = v5;
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
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPPoiFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPoiFeedback readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_correctionType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[GEORPPoiCorrections copyWithZone:](self->_corrections, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOPDPlaceRequest copyWithZone:](self->_placeRequest, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 72) = self->_addOtherPoi;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v15 = -[GEORPCuratedCollectionContext copyWithZone:](self->_poiCuratedCollectionContext, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v17 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPPoiCorrections *corrections;
  GEOPDPlace *place;
  GEOPDPlaceRequest *placeRequest;
  char v8;
  GEORPCuratedCollectionContext *poiCuratedCollectionContext;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEORPPoiFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_correctionType != *((_DWORD *)v4 + 17))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_17;
  }
  corrections = self->_corrections;
  if ((unint64_t)corrections | *((_QWORD *)v4 + 3) && !-[GEORPPoiCorrections isEqual:](corrections, "isEqual:"))
    goto LABEL_17;
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDPlace isEqual:](place, "isEqual:"))
      goto LABEL_17;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDPlaceRequest isEqual:](placeRequest, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0)
      goto LABEL_23;
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  if ((*((_BYTE *)v4 + 76) & 2) == 0)
    goto LABEL_17;
  if (!self->_addOtherPoi)
  {
    if (!*((_BYTE *)v4 + 72))
      goto LABEL_23;
    goto LABEL_17;
  }
  if (!*((_BYTE *)v4 + 72))
    goto LABEL_17;
LABEL_23:
  poiCuratedCollectionContext = self->_poiCuratedCollectionContext;
  if ((unint64_t)poiCuratedCollectionContext | *((_QWORD *)v4 + 6))
    v8 = -[GEORPCuratedCollectionContext isEqual:](poiCuratedCollectionContext, "isEqual:");
  else
    v8 = 1;
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEORPPoiFeedback readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_correctionType;
  else
    v3 = 0;
  v4 = -[GEORPPoiCorrections hash](self->_corrections, "hash");
  v5 = -[GEOPDPlace hash](self->_place, "hash");
  v6 = -[GEOPDPlaceRequest hash](self->_placeRequest, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v7 = 2654435761 * self->_addOtherPoi;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ -[GEORPCuratedCollectionContext hash](self->_poiCuratedCollectionContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORPPoiCorrections *corrections;
  uint64_t v6;
  GEOPDPlace *place;
  uint64_t v8;
  GEOPDPlaceRequest *placeRequest;
  uint64_t v10;
  GEORPCuratedCollectionContext *poiCuratedCollectionContext;
  uint64_t v12;
  int *v13;

  v13 = (int *)a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = v13;
  if ((v13[19] & 1) != 0)
  {
    self->_correctionType = v13[17];
    *(_BYTE *)&self->_flags |= 1u;
  }
  corrections = self->_corrections;
  v6 = *((_QWORD *)v13 + 3);
  if (corrections)
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPPoiCorrections mergeFrom:](corrections, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPPoiFeedback setCorrections:](self, "setCorrections:");
  }
  v4 = v13;
LABEL_9:
  place = self->_place;
  v8 = *((_QWORD *)v4 + 5);
  if (place)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEORPPoiFeedback setPlace:](self, "setPlace:");
  }
  v4 = v13;
LABEL_15:
  placeRequest = self->_placeRequest;
  v10 = *((_QWORD *)v4 + 4);
  if (placeRequest)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDPlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEORPPoiFeedback setPlaceRequest:](self, "setPlaceRequest:");
  }
  v4 = v13;
LABEL_21:
  if ((v4[19] & 2) != 0)
  {
    self->_addOtherPoi = *((_BYTE *)v4 + 72);
    *(_BYTE *)&self->_flags |= 2u;
  }
  poiCuratedCollectionContext = self->_poiCuratedCollectionContext;
  v12 = *((_QWORD *)v4 + 6);
  if (poiCuratedCollectionContext)
  {
    if (v12)
    {
      -[GEORPCuratedCollectionContext mergeFrom:](poiCuratedCollectionContext, "mergeFrom:");
LABEL_28:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[GEORPPoiFeedback setPoiCuratedCollectionContext:](self, "setPoiCuratedCollectionContext:");
    goto LABEL_28;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPPoiFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2667);
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
  *(_BYTE *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPPoiFeedback readAll:](self, "readAll:", 0);
    -[GEORPPoiCorrections clearUnknownFields:](self->_corrections, "clearUnknownFields:", 1);
    -[GEOPDPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    -[GEOPDPlaceRequest clearUnknownFields:](self->_placeRequest, "clearUnknownFields:", 1);
    -[GEORPCuratedCollectionContext clearUnknownFields:](self->_poiCuratedCollectionContext, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_poiCuratedCollectionContext, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_corrections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
