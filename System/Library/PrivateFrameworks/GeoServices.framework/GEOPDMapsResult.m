@implementation GEOPDMapsResult

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
  if (self->_reader && (_GEOPDMapsResultIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDMapsResult readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_place)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_collection)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_publisher)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_placeQuestionnaire)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_batchReverseGeocode)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

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
      v8 = (int *)&readAll__recursiveTag_4732;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4733;
    GEOPDMapsResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDMapsResultCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOPDPlace)place
{
  -[GEOPDMapsResult _readPlace]((uint64_t)self);
  return self->_place;
}

- (void)_readPlace
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlace_tags_4718);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (int)resultType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_resultType;
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_place, 0);
  objc_storeStrong((id *)&self->_placeQuestionnaire, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocode, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOPDMapsResult)init
{
  GEOPDMapsResult *v2;
  GEOPDMapsResult *v3;
  GEOPDMapsResult *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDMapsResult;
  v2 = -[GEOPDMapsResult init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setResultType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_resultType = a3;
}

- (void)setPlace:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_place, a3);
}

- (BOOL)hasPlace
{
  -[GEOPDMapsResult _readPlace]((uint64_t)self);
  return self->_place != 0;
}

- (GEOPDMapsResult)initWithData:(id)a3
{
  GEOPDMapsResult *v3;
  GEOPDMapsResult *v4;
  GEOPDMapsResult *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDMapsResult;
  v3 = -[GEOPDMapsResult initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setHasResultType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasResultType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)resultTypeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0BBD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsResultType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_COLLECTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PUBLISHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCollection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCollection_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasCollection
{
  -[GEOPDMapsResult _readCollection]((uint64_t)self);
  return self->_collection != 0;
}

- (GEOPDCollectionResult)collection
{
  -[GEOPDMapsResult _readCollection]((uint64_t)self);
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_collection, a3);
}

- (void)_readPublisher
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisher_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPublisher
{
  -[GEOPDMapsResult _readPublisher]((uint64_t)self);
  return self->_publisher != 0;
}

- (GEOPDPublisherResult)publisher
{
  -[GEOPDMapsResult _readPublisher]((uint64_t)self);
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void)_readPlaceQuestionnaire
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceQuestionnaire_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPlaceQuestionnaire
{
  -[GEOPDMapsResult _readPlaceQuestionnaire]((uint64_t)self);
  return self->_placeQuestionnaire != 0;
}

- (GEOPDPlaceQuestionnaireResult)placeQuestionnaire
{
  -[GEOPDMapsResult _readPlaceQuestionnaire]((uint64_t)self);
  return self->_placeQuestionnaire;
}

- (void)setPlaceQuestionnaire:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_placeQuestionnaire, a3);
}

- (void)_readBatchReverseGeocode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDMapsResultReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBatchReverseGeocode_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasBatchReverseGeocode
{
  -[GEOPDMapsResult _readBatchReverseGeocode]((uint64_t)self);
  return self->_batchReverseGeocode != 0;
}

- (GEOPDBatchReverseGeocodeResult)batchReverseGeocode
{
  -[GEOPDMapsResult _readBatchReverseGeocode]((uint64_t)self);
  return self->_batchReverseGeocode;
}

- (void)setBatchReverseGeocode:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_batchReverseGeocode, a3);
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
  v8.super_class = (Class)GEOPDMapsResult;
  -[GEOPDMapsResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMapsResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDMapsResult _dictionaryRepresentation:]((uint64_t)self, 0);
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
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v5 = *(int *)(a1 + 76);
    if (v5 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0BBD0[v5];
    }
    if (a2)
      v7 = CFSTR("resultType");
    else
      v7 = CFSTR("result_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "place");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("place"));

  }
  objc_msgSend((id)a1, "collection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v11, "jsonRepresentation");
    else
      objc_msgSend(v11, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("collection"));

  }
  objc_msgSend((id)a1, "publisher");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v14, "jsonRepresentation");
    else
      objc_msgSend(v14, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("publisher"));

  }
  objc_msgSend((id)a1, "placeQuestionnaire");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("placeQuestionnaire");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("place_questionnaire");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend((id)a1, "batchReverseGeocode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("batchReverseGeocode");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("batch_reverse_geocode");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  v25 = *(void **)(a1 + 16);
  if (v25)
  {
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v26, "count"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __45__GEOPDMapsResult__dictionaryRepresentation___block_invoke;
      v32[3] = &unk_1E1C00600;
      v29 = v28;
      v33 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v32);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDMapsResult _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __45__GEOPDMapsResult__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDMapsResult)initWithDictionary:(id)a3
{
  return (GEOPDMapsResult *)-[GEOPDMapsResult _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(uint64_t)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  GEOPDPlace *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  GEOPDCollectionResult *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  GEOPDMapsIdentifier *v20;
  GEOPDMapsIdentifier *v21;
  GEOPDMapsIdentifier *v22;
  void *v23;
  id v24;
  int v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  GEOPDComponent *v33;
  char *v34;
  uint64_t v35;
  void *v36;
  GEOPDPublisherResult *v37;
  id v38;
  const __CFString *v39;
  void *v40;
  GEOPDMapsIdentifier *v41;
  GEOPDMapsIdentifier *v42;
  GEOPDMapsIdentifier *v43;
  void *v44;
  id v45;
  int v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  GEOPDComponent *v54;
  char *v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  GEOPDPlaceQuestionnaireResult *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  GEOPDBatchReverseGeocodeResult *v63;
  id v64;
  void *v65;
  GEOPDPlace *v66;
  GEOPDPlace *v67;
  GEOPDPlace *v68;
  const __CFString *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t i;
  uint64_t v76;
  GEOPDPlace *v77;
  GEOPDPlace *v78;
  GEOPDPlace *v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_174;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if ((_DWORD)a3)
      v7 = CFSTR("resultType");
    else
      v7 = CFSTR("result_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_UNKNOWN")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_COLLECTION")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PUBLISHER")) & 1) != 0)
      {
        v10 = 3;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
      {
        v10 = 4;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("MAPS_RESULT_TYPE_BATCH_REVERSE_GEOCODE")))
      {
        v10 = 5;
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
        goto LABEL_24;
      v10 = objc_msgSend(v8, "intValue");
    }
    objc_msgSend(v6, "setResultType:", v10);
LABEL_24:

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("place"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = [GEOPDPlace alloc];
      if ((a3 & 1) != 0)
        v13 = -[GEOPDPlace initWithJSON:](v12, "initWithJSON:", v11);
      else
        v13 = -[GEOPDPlace initWithDictionary:](v12, "initWithDictionary:", v11);
      v14 = (void *)v13;
      objc_msgSend(v6, "setPlace:", v13);

    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("collection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_82:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("publisher"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_135:

        if ((_DWORD)a3)
          v57 = CFSTR("placeQuestionnaire");
        else
          v57 = CFSTR("place_questionnaire");
        objc_msgSend(v5, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v59 = [GEOPDPlaceQuestionnaireResult alloc];
          if (v59)
            v60 = (void *)-[GEOPDPlaceQuestionnaireResult _initWithDictionary:isJSON:](v59, v58, a3);
          else
            v60 = 0;
          objc_msgSend(v6, "setPlaceQuestionnaire:", v60);

        }
        if ((_DWORD)a3)
          v61 = CFSTR("batchReverseGeocode");
        else
          v61 = CFSTR("batch_reverse_geocode");
        objc_msgSend(v5, "objectForKeyedSubscript:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v63 = [GEOPDBatchReverseGeocodeResult alloc];
          if (v63)
          {
            v64 = v62;
            v63 = -[GEOPDBatchReverseGeocodeResult init](v63, "init");
            if (v63)
            {
              objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("place"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v66 = [GEOPDPlace alloc];
                if ((a3 & 1) != 0)
                  v67 = -[GEOPDPlace initWithJSON:](v66, "initWithJSON:", v65);
                else
                  v67 = -[GEOPDPlace initWithDictionary:](v66, "initWithDictionary:", v65);
                v68 = v67;
                -[GEOPDBatchReverseGeocodeResult setPlace:]((uint64_t)v63, v67);

              }
              if ((_DWORD)a3)
                v69 = CFSTR("additionalPlace");
              else
                v69 = CFSTR("additional_place");
              objc_msgSend(v64, "objectForKeyedSubscript:", v69);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v84 = v6;
                v87 = v5;
                v90 = 0u;
                v91 = 0u;
                v88 = 0u;
                v89 = 0u;
                v81 = v70;
                v71 = v70;
                v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
                if (v72)
                {
                  v73 = v72;
                  v74 = *(_QWORD *)v89;
                  do
                  {
                    for (i = 0; i != v73; ++i)
                    {
                      if (*(_QWORD *)v89 != v74)
                        objc_enumerationMutation(v71);
                      v76 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v77 = [GEOPDPlace alloc];
                        if ((a3 & 1) != 0)
                          v78 = -[GEOPDPlace initWithJSON:](v77, "initWithJSON:", v76);
                        else
                          v78 = -[GEOPDPlace initWithDictionary:](v77, "initWithDictionary:", v76);
                        v79 = v78;
                        -[GEOPDBatchReverseGeocodeResult addAdditionalPlace:]((uint64_t)v63, v78);

                      }
                    }
                    v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
                  }
                  while (v73);
                }

                v6 = v84;
                v5 = v87;
                v70 = v81;
              }

            }
          }
          objc_msgSend(v6, "setBatchReverseGeocode:", v63, v81);

        }
        goto LABEL_174;
      }
      v37 = [GEOPDPublisherResult alloc];
      if (!v37)
      {
LABEL_134:
        objc_msgSend(v6, "setPublisher:", v37, v81);

        goto LABEL_135;
      }
      v38 = v36;
      v37 = -[GEOPDPublisherResult init](v37, "init");
      if (!v37)
      {
LABEL_133:

        goto LABEL_134;
      }
      if ((_DWORD)a3)
        v39 = CFSTR("publisherId");
      else
        v39 = CFSTR("publisher_id");
      objc_msgSend(v38, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v41 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v42 = -[GEOPDMapsIdentifier initWithJSON:](v41, "initWithJSON:", v40);
        else
          v42 = -[GEOPDMapsIdentifier initWithDictionary:](v41, "initWithDictionary:", v40);
        v43 = v42;
        -[GEOPDPublisherResult setPublisherId:]((uint64_t)v37, v42);

      }
      objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("status"));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v44;
        if ((objc_msgSend(v45, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
        {
          v46 = 0;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
        {
          v46 = 1;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
        {
          v46 = 2;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
        {
          v46 = 5;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
        {
          v46 = 20;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
        {
          v46 = 30;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
        {
          v46 = 40;
        }
        else if ((objc_msgSend(v45, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
        {
          v46 = 50;
        }
        else if (objc_msgSend(v45, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
        {
          v46 = 60;
        }
        else
        {
          v46 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_117:

          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("component"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v83 = v6;
            v86 = v5;
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
            v81 = v47;
            v48 = v47;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
            if (v49)
            {
              v50 = v49;
              v51 = *(_QWORD *)v89;
              do
              {
                v52 = 0;
                do
                {
                  if (*(_QWORD *)v89 != v51)
                    objc_enumerationMutation(v48);
                  v53 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v52);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v54 = [GEOPDComponent alloc];
                    if (v54)
                      v55 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v54, v53, a3);
                    else
                      v55 = 0;
                    -[GEOPDPublisherResult addComponent:]((uint64_t)v37, v55);

                  }
                  ++v52;
                }
                while (v50 != v52);
                v56 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
                v50 = v56;
              }
              while (v56);
            }

            v6 = v83;
            v5 = v86;
            v47 = v81;
          }

          goto LABEL_133;
        }
        v46 = objc_msgSend(v44, "intValue");
      }
      *(_BYTE *)&v37->_flags |= 0x10u;
      *(_BYTE *)&v37->_flags |= 1u;
      v37->_status = v46;
      goto LABEL_117;
    }
    v16 = [GEOPDCollectionResult alloc];
    if (!v16)
    {
LABEL_81:
      objc_msgSend(v6, "setCollection:", v16, v81);

      goto LABEL_82;
    }
    v17 = v15;
    v16 = -[GEOPDCollectionResult init](v16, "init");
    if (!v16)
    {
LABEL_80:

      goto LABEL_81;
    }
    if ((_DWORD)a3)
      v18 = CFSTR("collectionId");
    else
      v18 = CFSTR("collection_id");
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = [GEOPDMapsIdentifier alloc];
      if ((a3 & 1) != 0)
        v21 = -[GEOPDMapsIdentifier initWithJSON:](v20, "initWithJSON:", v19);
      else
        v21 = -[GEOPDMapsIdentifier initWithDictionary:](v20, "initWithDictionary:", v19);
      v22 = v21;
      -[GEOPDCollectionResult setCollectionId:]((uint64_t)v16, v21);

    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("status"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = v23;
      if ((objc_msgSend(v24, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
      {
        v25 = 0;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
      {
        v25 = 1;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
      {
        v25 = 2;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
      {
        v25 = 5;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
      {
        v25 = 20;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
      {
        v25 = 30;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
      {
        v25 = 40;
      }
      else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
      {
        v25 = 50;
      }
      else if (objc_msgSend(v24, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
      {
        v25 = 60;
      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_64:

        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("component"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v82 = v6;
          v85 = v5;
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v81 = v26;
          v27 = v26;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v89;
            do
            {
              v31 = 0;
              do
              {
                if (*(_QWORD *)v89 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * v31);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v33 = [GEOPDComponent alloc];
                  if (v33)
                    v34 = -[GEOPDComponent _initWithDictionary:isJSON:]((char *)v33, v32, a3);
                  else
                    v34 = 0;
                  -[GEOPDCollectionResult addComponent:]((uint64_t)v16, v34);

                }
                ++v31;
              }
              while (v29 != v31);
              v35 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v88, v92, 16);
              v29 = v35;
            }
            while (v35);
          }

          v6 = v82;
          v5 = v85;
          v26 = v81;
        }

        goto LABEL_80;
      }
      v25 = objc_msgSend(v23, "intValue");
    }
    *(_BYTE *)&v16->_flags |= 0x10u;
    *(_BYTE *)&v16->_flags |= 1u;
    v16->_status = v25;
    goto LABEL_64;
  }
LABEL_174:

  return v6;
}

- (GEOPDMapsResult)initWithJSON:(id)a3
{
  return (GEOPDMapsResult *)-[GEOPDMapsResult _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDMapsResultIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDMapsResultReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOPDMapsResultClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  GEOPDBatchReverseGeocodeResult *batchReverseGeocode;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOPDCollectionResult *collection;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  GEOPDPublisherResult *publisher;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v3 = a3;
  v28 = *MEMORY[0x1E0C80C00];
  -[GEOPDMapsResult _readBatchReverseGeocode]((uint64_t)self);
  batchReverseGeocode = self->_batchReverseGeocode;
  if (batchReverseGeocode)
  {
    -[GEOPDBatchReverseGeocodeResult _readAdditionalPlaces]((uint64_t)self->_batchReverseGeocode);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = batchReverseGeocode->_additionalPlaces;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v24;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v6);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v10), "hasGreenTeaWithValue:", v3, (_QWORD)v23) & 1) != 0)
          {

            return 1;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v8)
          continue;
        break;
      }
    }

    -[GEOPDBatchReverseGeocodeResult _readPlace]((uint64_t)batchReverseGeocode);
    if (-[GEOPDPlace hasGreenTeaWithValue:](batchReverseGeocode->_place, "hasGreenTeaWithValue:", v3))
      return 1;
  }
  -[GEOPDMapsResult _readCollection]((uint64_t)self);
  collection = self->_collection;
  if (!collection)
    goto LABEL_22;
  -[GEOPDCollectionResult _readCollectionId]((uint64_t)self->_collection);
  if (!-[GEOPDMapsIdentifier hasGreenTeaWithValue:](collection->_collectionId, "hasGreenTeaWithValue:", v3))
  {
    -[GEOPDCollectionResult _readComponents]((uint64_t)collection);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = collection->_components;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
LABEL_15:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        if ((-[GEOPDComponent hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v16), v3) & 1) != 0)
          break;
        if (v14 == ++v16)
        {
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v14)
            goto LABEL_15;
          goto LABEL_21;
        }
      }
LABEL_37:

      return 1;
    }
LABEL_21:

LABEL_22:
    -[GEOPDMapsResult _readPlace]((uint64_t)self);
    if (-[GEOPDPlace hasGreenTeaWithValue:](self->_place, "hasGreenTeaWithValue:", v3))
      return 1;
    -[GEOPDMapsResult _readPlaceQuestionnaire]((uint64_t)self);
    if ((-[GEOPDPlaceQuestionnaireResult hasGreenTeaWithValue:]((uint64_t)self->_placeQuestionnaire, v3) & 1) != 0)
      return 1;
    -[GEOPDMapsResult _readPublisher]((uint64_t)self);
    publisher = self->_publisher;
    if (!publisher)
      return 0;
    -[GEOPDPublisherResult _readComponents]((uint64_t)publisher);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = publisher->_components;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v18)
    {
LABEL_33:

      -[GEOPDPublisherResult _readPublisherId]((uint64_t)publisher);
      return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](publisher->_publisherId, "hasGreenTeaWithValue:", v3);
    }
    v19 = v18;
    v20 = *(_QWORD *)v24;
LABEL_27:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v20)
        objc_enumerationMutation(v12);
      if ((-[GEOPDComponent hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v21), v3) & 1) != 0)
        goto LABEL_37;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v19)
          goto LABEL_27;
        goto LABEL_33;
      }
    }
  }
  return 1;
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOPDMapsResult readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 19) = self->_resultType;
    *((_BYTE *)v5 + 80) |= 1u;
  }
  if (self->_place)
  {
    objc_msgSend(v5, "setPlace:");
    v4 = v5;
  }
  if (self->_collection)
  {
    objc_msgSend(v5, "setCollection:");
    v4 = v5;
  }
  if (self->_publisher)
  {
    objc_msgSend(v5, "setPublisher:");
    v4 = v5;
  }
  if (self->_placeQuestionnaire)
  {
    objc_msgSend(v5, "setPlaceQuestionnaire:");
    v4 = v5;
  }
  if (self->_batchReverseGeocode)
  {
    objc_msgSend(v5, "setBatchReverseGeocode:");
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
  id v17;
  void *v18;
  PBUnknownFields *v19;

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
      GEOPDMapsResultReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDMapsResult readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_resultType;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEOPDPlace copyWithZone:](self->_place, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOPDCollectionResult copyWithZone:](self->_collection, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[GEOPDPublisherResult copyWithZone:](self->_publisher, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v13;

  v15 = -[GEOPDPlaceQuestionnaireResult copyWithZone:](self->_placeQuestionnaire, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[GEOPDBatchReverseGeocodeResult copyWithZone:](self->_batchReverseGeocode, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPlace *place;
  GEOPDCollectionResult *collection;
  GEOPDPublisherResult *publisher;
  GEOPDPlaceQuestionnaireResult *placeQuestionnaire;
  GEOPDBatchReverseGeocodeResult *batchReverseGeocode;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDMapsResult readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_resultType != *((_DWORD *)v4 + 19))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  place = self->_place;
  if ((unint64_t)place | *((_QWORD *)v4 + 6) && !-[GEOPDPlace isEqual:](place, "isEqual:"))
    goto LABEL_17;
  collection = self->_collection;
  if ((unint64_t)collection | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDCollectionResult isEqual:](collection, "isEqual:"))
      goto LABEL_17;
  }
  publisher = self->_publisher;
  if ((unint64_t)publisher | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDPublisherResult isEqual:](publisher, "isEqual:"))
      goto LABEL_17;
  }
  placeQuestionnaire = self->_placeQuestionnaire;
  if ((unint64_t)placeQuestionnaire | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDPlaceQuestionnaireResult isEqual:](placeQuestionnaire, "isEqual:"))
      goto LABEL_17;
  }
  batchReverseGeocode = self->_batchReverseGeocode;
  if ((unint64_t)batchReverseGeocode | *((_QWORD *)v4 + 3))
    v10 = -[GEOPDBatchReverseGeocodeResult isEqual:](batchReverseGeocode, "isEqual:");
  else
    v10 = 1;
LABEL_18:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  -[GEOPDMapsResult readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_resultType;
  else
    v3 = 0;
  v4 = -[GEOPDPlace hash](self->_place, "hash") ^ v3;
  v5 = -[GEOPDCollectionResult hash](self->_collection, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDPublisherResult hash](self->_publisher, "hash");
  v7 = -[GEOPDPlaceQuestionnaireResult hash](self->_placeQuestionnaire, "hash");
  return v6 ^ v7 ^ -[GEOPDBatchReverseGeocodeResult hash](self->_batchReverseGeocode, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDPlace *place;
  uint64_t v6;
  GEOPDCollectionResult *collection;
  void *v8;
  id v9;
  GEOPDMapsIdentifier *collectionId;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  GEOPDPublisherResult *publisher;
  void *v18;
  id v19;
  GEOPDMapsIdentifier *publisherId;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  GEOPDPlaceQuestionnaireResult *placeQuestionnaire;
  void *v28;
  GEOPDBatchReverseGeocodeResult *batchReverseGeocode;
  void *v30;
  id *v31;
  GEOPDPlace *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  int *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v39 = (int *)a3;
  objc_msgSend(v39, "readAll:", 0);
  v4 = v39;
  if ((v39[20] & 1) != 0)
  {
    self->_resultType = v39[19];
    *(_BYTE *)&self->_flags |= 1u;
  }
  place = self->_place;
  v6 = *((_QWORD *)v39 + 6);
  if (place)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDPlace mergeFrom:](place, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDMapsResult setPlace:](self, "setPlace:");
  }
  v4 = v39;
LABEL_9:
  collection = self->_collection;
  v8 = (void *)*((_QWORD *)v4 + 4);
  if (collection)
  {
    if (!v8)
      goto LABEL_29;
    v9 = v8;
    -[GEOPDCollectionResult readAll:]((uint64_t)v9, 0);
    collectionId = collection->_collectionId;
    v11 = *((_QWORD *)v9 + 3);
    if (collectionId)
    {
      if (v11)
        -[GEOPDMapsIdentifier mergeFrom:](collectionId, "mergeFrom:");
    }
    else if (v11)
    {
      -[GEOPDCollectionResult setCollectionId:]((uint64_t)collection, *((void **)v9 + 3));
    }
    if ((*((_BYTE *)v9 + 56) & 1) != 0)
    {
      collection->_status = *((_DWORD *)v9 + 13);
      *(_BYTE *)&collection->_flags |= 1u;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = *((id *)v9 + 4);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v12);
          -[GEOPDCollectionResult addComponent:]((uint64_t)collection, *(void **)(*((_QWORD *)&v40 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v14);
    }

  }
  else
  {
    if (!v8)
      goto LABEL_29;
    -[GEOPDMapsResult setCollection:](self, "setCollection:");
  }
  v4 = v39;
LABEL_29:
  publisher = self->_publisher;
  v18 = (void *)*((_QWORD *)v4 + 7);
  if (publisher)
  {
    if (!v18)
      goto LABEL_49;
    v19 = v18;
    -[GEOPDPublisherResult readAll:]((uint64_t)v19, 0);
    publisherId = publisher->_publisherId;
    v21 = *((_QWORD *)v19 + 4);
    if (publisherId)
    {
      if (v21)
        -[GEOPDMapsIdentifier mergeFrom:](publisherId, "mergeFrom:");
    }
    else if (v21)
    {
      -[GEOPDPublisherResult setPublisherId:]((uint64_t)publisher, *((void **)v19 + 4));
    }
    if ((*((_BYTE *)v19 + 56) & 1) != 0)
    {
      publisher->_status = *((_DWORD *)v19 + 13);
      *(_BYTE *)&publisher->_flags |= 1u;
    }
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v22 = *((id *)v19 + 3);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v41 != v25)
            objc_enumerationMutation(v22);
          -[GEOPDPublisherResult addComponent:]((uint64_t)publisher, *(void **)(*((_QWORD *)&v40 + 1) + 8 * j));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v24);
    }

  }
  else
  {
    if (!v18)
      goto LABEL_49;
    -[GEOPDMapsResult setPublisher:](self, "setPublisher:");
  }
  v4 = v39;
LABEL_49:
  placeQuestionnaire = self->_placeQuestionnaire;
  v28 = (void *)*((_QWORD *)v4 + 5);
  if (placeQuestionnaire)
  {
    if (!v28)
      goto LABEL_55;
    -[GEOPDPlaceQuestionnaireResult mergeFrom:]((uint64_t)placeQuestionnaire, v28);
  }
  else
  {
    if (!v28)
      goto LABEL_55;
    -[GEOPDMapsResult setPlaceQuestionnaire:](self, "setPlaceQuestionnaire:", *((_QWORD *)v4 + 5));
  }
  v4 = v39;
LABEL_55:
  batchReverseGeocode = self->_batchReverseGeocode;
  v30 = (void *)*((_QWORD *)v4 + 3);
  if (batchReverseGeocode)
  {
    if (v30)
    {
      v31 = v30;
      -[GEOPDBatchReverseGeocodeResult readAll:]((uint64_t)v31, 0);
      v32 = batchReverseGeocode->_place;
      v33 = v31[4];
      if (v32)
      {
        if (v33)
          -[GEOPDPlace mergeFrom:](v32, "mergeFrom:");
      }
      else if (v33)
      {
        -[GEOPDBatchReverseGeocodeResult setPlace:]((uint64_t)batchReverseGeocode, v31[4]);
      }
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v34 = v31[3];
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v41;
        do
        {
          for (k = 0; k != v36; ++k)
          {
            if (*(_QWORD *)v41 != v37)
              objc_enumerationMutation(v34);
            -[GEOPDBatchReverseGeocodeResult addAdditionalPlace:]((uint64_t)batchReverseGeocode, *(void **)(*((_QWORD *)&v40 + 1) + 8 * k));
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        }
        while (v36);
      }

      goto LABEL_72;
    }
  }
  else if (v30)
  {
    -[GEOPDMapsResult setBatchReverseGeocode:](self, "setBatchReverseGeocode:");
LABEL_72:
    v4 = v39;
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
      GEOPDMapsResultReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_4736);
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
  GEOPDCollectionResult *collection;
  PBUnknownFields *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GEOPDPublisherResult *publisher;
  PBUnknownFields *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  GEOPDBatchReverseGeocodeResult *batchReverseGeocode;
  PBUnknownFields *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x82u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDMapsResult readAll:](self, "readAll:", 0);
    -[GEOPDPlace clearUnknownFields:](self->_place, "clearUnknownFields:", 1);
    collection = self->_collection;
    if (collection)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)&collection->_flags |= 2u;
      *(_BYTE *)&collection->_flags |= 0x10u;
      os_unfair_lock_unlock(&collection->_readerLock);
      v8 = collection->_unknownFields;
      collection->_unknownFields = 0;

      -[GEOPDCollectionResult readAll:]((uint64_t)collection, 0);
      -[GEOPDMapsIdentifier clearUnknownFields:](collection->_collectionId, "clearUnknownFields:", 1);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v9 = collection->_components;
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v29;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v29 != v12)
              objc_enumerationMutation(v9);
            -[GEOPDComponent clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v13++), 1);
          }
          while (v11 != v13);
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v11);
      }

    }
    publisher = self->_publisher;
    if (publisher)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)&publisher->_flags |= 2u;
      *(_BYTE *)&publisher->_flags |= 0x10u;
      os_unfair_lock_unlock(&publisher->_readerLock);
      v15 = publisher->_unknownFields;
      publisher->_unknownFields = 0;

      -[GEOPDPublisherResult readAll:]((uint64_t)publisher, 0);
      -[GEOPDMapsIdentifier clearUnknownFields:](publisher->_publisherId, "clearUnknownFields:", 1);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v16 = publisher->_components;
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        do
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            -[GEOPDComponent clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20++), 1);
          }
          while (v18 != v20);
          v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v18);
      }

    }
    batchReverseGeocode = self->_batchReverseGeocode;
    if (batchReverseGeocode)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)&batchReverseGeocode->_flags |= 1u;
      *(_BYTE *)&batchReverseGeocode->_flags |= 8u;
      os_unfair_lock_unlock(&batchReverseGeocode->_readerLock);
      v22 = batchReverseGeocode->_unknownFields;
      batchReverseGeocode->_unknownFields = 0;

      -[GEOPDBatchReverseGeocodeResult readAll:]((uint64_t)batchReverseGeocode, 0);
      -[GEOPDPlace clearUnknownFields:](batchReverseGeocode->_place, "clearUnknownFields:", 1);
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v23 = batchReverseGeocode->_additionalPlaces;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v29;
        do
        {
          v27 = 0;
          do
          {
            if (*(_QWORD *)v29 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v27++), "clearUnknownFields:", 1);
          }
          while (v25 != v27);
          v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v25);
      }

    }
  }
}

@end
