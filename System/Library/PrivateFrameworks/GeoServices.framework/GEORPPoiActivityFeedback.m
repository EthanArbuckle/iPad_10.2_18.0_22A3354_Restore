@implementation GEORPPoiActivityFeedback

- (GEORPPoiActivityFeedback)init
{
  GEORPPoiActivityFeedback *v2;
  GEORPPoiActivityFeedback *v3;
  GEORPPoiActivityFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPPoiActivityFeedback;
  v2 = -[GEORPPoiActivityFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPPoiActivityFeedback)initWithData:(id)a3
{
  GEORPPoiActivityFeedback *v3;
  GEORPPoiActivityFeedback *v4;
  GEORPPoiActivityFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPPoiActivityFeedback;
  v3 = -[GEORPPoiActivityFeedback initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORPPoiActivityFeedback;
  -[GEORPPoiActivityFeedback dealloc](&v3, sel_dealloc);
}

- (void)_readMapsId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiActivityFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMapsId
{
  -[GEORPPoiActivityFeedback _readMapsId]((uint64_t)self);
  return self->_mapsId != 0;
}

- (GEOPDMapsIdentifier)mapsId
{
  -[GEORPPoiActivityFeedback _readMapsId]((uint64_t)self);
  return self->_mapsId;
}

- (void)setMapsId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_mapsId, a3);
}

- (void)_readRepresentativeHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPPoiActivityFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRepresentativeHours_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)representativeHoursCount
{
  -[GEORPPoiActivityFeedback _readRepresentativeHours]((uint64_t)self);
  return self->_representativeHours.count;
}

- (unsigned)representativeHours
{
  -[GEORPPoiActivityFeedback _readRepresentativeHours]((uint64_t)self);
  return self->_representativeHours.list;
}

- (void)clearRepresentativeHours
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Clear();
}

- (void)addRepresentativeHours:(unsigned int)a3
{
  -[GEORPPoiActivityFeedback _readRepresentativeHours]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
}

- (unsigned)representativeHoursAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_representativeHours;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPPoiActivityFeedback _readRepresentativeHours]((uint64_t)self);
  p_representativeHours = &self->_representativeHours;
  count = self->_representativeHours.count;
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
  return p_representativeHours->list[a3];
}

- (void)setRepresentativeHours:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x40u;
  PBRepeatedUInt32Set();
}

- (BOOL)isDataUseful
{
  return self->_isDataUseful;
}

- (void)setIsDataUseful:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_isDataUseful = a3;
}

- (void)setHasIsDataUseful:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasIsDataUseful
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (BOOL)isDataCorrect
{
  return self->_isDataCorrect;
}

- (void)setIsDataCorrect:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_isDataCorrect = a3;
}

- (void)setHasIsDataCorrect:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasIsDataCorrect
{
  return *(_BYTE *)&self->_flags & 1;
}

- (BOOL)isVisualRepresentationValid
{
  return self->_isVisualRepresentationValid;
}

- (void)setIsVisualRepresentationValid:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  self->_isVisualRepresentationValid = a3;
}

- (void)setHasIsVisualRepresentationValid:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 68;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsVisualRepresentationValid
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
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
  v8.super_class = (Class)GEORPPoiActivityFeedback;
  -[GEORPPoiActivityFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPPoiActivityFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPPoiActivityFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  char v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "mapsId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("mapsId");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("maps_id");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("representativeHours");
    else
      v10 = CFSTR("representative_hours");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(_BYTE *)(a1 + 72);
  if ((v11 & 2) == 0)
  {
    if ((*(_BYTE *)(a1 + 72) & 1) == 0)
      goto LABEL_14;
LABEL_29:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("isDataCorrect");
    else
      v24 = CFSTR("is_data_correct");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

    if ((*(_BYTE *)(a1 + 72) & 4) == 0)
      goto LABEL_19;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 69));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("isDataUseful");
  else
    v22 = CFSTR("is_data_useful");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v11 = *(_BYTE *)(a1 + 72);
  if ((v11 & 1) != 0)
    goto LABEL_29;
LABEL_14:
  if ((v11 & 4) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 70));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("isVisualRepresentationValid");
    else
      v13 = CFSTR("is_visual_representation_valid");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
LABEL_19:
  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __54__GEORPPoiActivityFeedback__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v18 = v17;
      v26 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v25);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPPoiActivityFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEORPPoiActivityFeedback__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPPoiActivityFeedback)initWithDictionary:(id)a3
{
  return (GEORPPoiActivityFeedback *)-[GEORPPoiActivityFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDMapsIdentifier *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("mapsId");
      else
        v6 = CFSTR("maps_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDMapsIdentifier alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDMapsIdentifier initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDMapsIdentifier initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setMapsId:", v9);

      }
      if (a3)
        v11 = CFSTR("representativeHours");
      else
        v11 = CFSTR("representative_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = 0u;
        v29 = 0u;
        v26 = 0u;
        v27 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v27 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addRepresentativeHours:", objc_msgSend(v18, "unsignedIntValue", (_QWORD)v26));
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          }
          while (v15);
        }

      }
      if (a3)
        v19 = CFSTR("isDataUseful");
      else
        v19 = CFSTR("is_data_useful");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19, (_QWORD)v26);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsDataUseful:", objc_msgSend(v20, "BOOLValue"));

      if (a3)
        v21 = CFSTR("isDataCorrect");
      else
        v21 = CFSTR("is_data_correct");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsDataCorrect:", objc_msgSend(v22, "BOOLValue"));

      if (a3)
        v23 = CFSTR("isVisualRepresentationValid");
      else
        v23 = CFSTR("is_visual_representation_valid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsVisualRepresentationValid:", objc_msgSend(v24, "BOOLValue"));

    }
  }

  return a1;
}

- (GEORPPoiActivityFeedback)initWithJSON:(id)a3
{
  return (GEORPPoiActivityFeedback *)-[GEORPPoiActivityFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2457;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2458;
    GEORPPoiActivityFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPDMapsIdentifier readAll:](self->_mapsId, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPPoiActivityFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPPoiActivityFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  unint64_t v6;
  char flags;
  PBDataReader *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x70) == 0)
    {
      v8 = self->_reader;
      objc_sync_enter(v8);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writeData:", v9);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_17;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPPoiActivityFeedback readAll:](self, "readAll:", 0);
  if (self->_mapsId)
    PBDataWriterWriteSubmessage();
  v5 = v10;
  if (self->_representativeHours.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v5 = v10;
      ++v6;
    }
    while (v6 < self->_representativeHours.count);
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_10;
LABEL_14:
    PBDataWriterWriteBOOLField();
    v5 = v10;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  v5 = v10;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_14;
LABEL_10:
  if ((flags & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    v5 = v10;
  }
LABEL_12:
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_17:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPPoiActivityFeedback _readMapsId]((uint64_t)self);
  return -[GEOPDMapsIdentifier hasGreenTeaWithValue:](self->_mapsId, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  char flags;
  id *v8;

  v8 = (id *)a3;
  -[GEORPPoiActivityFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_mapsId)
    objc_msgSend(v8, "setMapsId:");
  if (-[GEORPPoiActivityFeedback representativeHoursCount](self, "representativeHoursCount"))
  {
    objc_msgSend(v8, "clearRepresentativeHours");
    v4 = -[GEORPPoiActivityFeedback representativeHoursCount](self, "representativeHoursCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addRepresentativeHours:", -[GEORPPoiActivityFeedback representativeHoursAtIndex:](self, "representativeHoursAtIndex:", i));
    }
  }
  flags = (char)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
LABEL_13:
    *((_BYTE *)v8 + 68) = self->_isDataCorrect;
    *((_BYTE *)v8 + 72) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *((_BYTE *)v8 + 69) = self->_isDataUseful;
  *((_BYTE *)v8 + 72) |= 2u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *((_BYTE *)v8 + 70) = self->_isVisualRepresentationValid;
    *((_BYTE *)v8 + 72) |= 4u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  char flags;
  PBUnknownFields *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPPoiActivityFeedback readAll:](self, "readAll:", 0);
    v9 = -[GEOPDMapsIdentifier copyWithZone:](self->_mapsId, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v9;

    PBRepeatedUInt32Copy();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_BYTE *)(v5 + 69) = self->_isDataUseful;
      *(_BYTE *)(v5 + 72) |= 2u;
      flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_7:
        if ((flags & 4) == 0)
        {
LABEL_9:
          v12 = self->_unknownFields;
          v8 = *(id *)(v5 + 16);
          *(_QWORD *)(v5 + 16) = v12;
          goto LABEL_10;
        }
LABEL_8:
        *(_BYTE *)(v5 + 70) = self->_isVisualRepresentationValid;
        *(_BYTE *)(v5 + 72) |= 4u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      goto LABEL_7;
    }
    *(_BYTE *)(v5 + 68) = self->_isDataCorrect;
    *(_BYTE *)(v5 + 72) |= 1u;
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_8;
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
  GEORPPoiActivityFeedbackReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDMapsIdentifier *mapsId;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEORPPoiActivityFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  mapsId = self->_mapsId;
  if ((unint64_t)mapsId | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDMapsIdentifier isEqual:](mapsId, "isEqual:"))
      goto LABEL_23;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_23;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0)
      goto LABEL_23;
    if (self->_isDataUseful)
    {
      if (!*((_BYTE *)v4 + 69))
        goto LABEL_23;
    }
    else if (*((_BYTE *)v4 + 69))
    {
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0)
      goto LABEL_23;
    if (self->_isDataCorrect)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_23;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_23;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 72) & 4) == 0;
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) != 0)
    {
      if (self->_isVisualRepresentationValid)
      {
        if (!*((_BYTE *)v4 + 70))
          goto LABEL_23;
      }
      else if (*((_BYTE *)v4 + 70))
      {
        goto LABEL_23;
      }
      v6 = 1;
      goto LABEL_24;
    }
LABEL_23:
    v6 = 0;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  -[GEORPPoiActivityFeedback readAll:](self, "readAll:", 1);
  v3 = -[GEOPDMapsIdentifier hash](self->_mapsId, "hash");
  v4 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_4;
LABEL_7:
    v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7;
  }
  v5 = 2654435761 * self->_isDataUseful;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_isDataCorrect;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_7;
LABEL_4:
  v7 = 2654435761 * self->_isVisualRepresentationValid;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  GEOPDMapsIdentifier *mapsId;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  BOOL *v10;

  v10 = (BOOL *)a3;
  objc_msgSend(v10, "readAll:", 0);
  mapsId = self->_mapsId;
  v5 = *((_QWORD *)v10 + 6);
  if (mapsId)
  {
    if (v5)
      -[GEOPDMapsIdentifier mergeFrom:](mapsId, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPPoiActivityFeedback setMapsId:](self, "setMapsId:");
  }
  v6 = objc_msgSend(v10, "representativeHoursCount");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
      -[GEORPPoiActivityFeedback addRepresentativeHours:](self, "addRepresentativeHours:", objc_msgSend(v10, "representativeHoursAtIndex:", i));
  }
  v9 = v10[72];
  if ((v9 & 2) == 0)
  {
    if (!v10[72])
      goto LABEL_11;
LABEL_15:
    self->_isDataCorrect = v10[68];
    *(_BYTE *)&self->_flags |= 1u;
    if ((v10[72] & 4) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  self->_isDataUseful = v10[69];
  *(_BYTE *)&self->_flags |= 2u;
  v9 = v10[72];
  if (v9)
    goto LABEL_15;
LABEL_11:
  if ((v9 & 4) != 0)
  {
LABEL_12:
    self->_isVisualRepresentationValid = v10[70];
    *(_BYTE *)&self->_flags |= 4u;
  }
LABEL_13:

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
      GEORPPoiActivityFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2461);
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
  {
    -[GEORPPoiActivityFeedback readAll:](self, "readAll:", 0);
    -[GEOPDMapsIdentifier clearUnknownFields:](self->_mapsId, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapsId, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
