@implementation GEOETAStep

- (GEOETAStep)init
{
  GEOETAStep *v2;
  GEOETAStep *v3;
  GEOETAStep *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETAStep;
  v2 = -[GEOETAStep init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETAStep)initWithData:(id)a3
{
  GEOETAStep *v3;
  GEOETAStep *v4;
  GEOETAStep *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETAStep;
  v3 = -[GEOETAStep initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)stepID
{
  return self->_stepID;
}

- (void)setStepID:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_stepID = a3;
}

- (void)setHasStepID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasStepID
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)expectedTime
{
  return self->_expectedTime;
}

- (void)setExpectedTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_expectedTime = a3;
}

- (void)setHasExpectedTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasExpectedTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int)zilchPointIndex
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_zilchPointIndex;
  else
    return -1;
}

- (void)setZilchPointIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_zilchPointIndex = a3;
}

- (void)setHasZilchPointIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 528;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasZilchPointIndex
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readTimeCheckpoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 80) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTimeCheckpoints_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasTimeCheckpoints
{
  -[GEOETAStep _readTimeCheckpoints]((uint64_t)self);
  return self->_timeCheckpoints != 0;
}

- (GEOTimeCheckpoints)timeCheckpoints
{
  -[GEOETAStep _readTimeCheckpoints]((uint64_t)self);
  return self->_timeCheckpoints;
}

- (void)setTimeCheckpoints:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_timeCheckpoints, a3);
}

- (unsigned)zilchPathIndex
{
  return self->_zilchPathIndex;
}

- (void)setZilchPathIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_zilchPathIndex = a3;
}

- (void)setHasZilchPathIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 520;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasZilchPathIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readEvInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvInfo_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEvInfo
{
  -[GEOETAStep _readEvInfo]((uint64_t)self);
  return self->_evInfo != 0;
}

- (GEOStopStepEVInfo)evInfo
{
  -[GEOETAStep _readEvInfo]((uint64_t)self);
  return self->_evInfo;
}

- (void)setEvInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_evInfo, a3);
}

- (void)_readEvStateInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_WORD *)(a1 + 80) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAStepReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvStateInfo_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasEvStateInfo
{
  -[GEOETAStep _readEvStateInfo]((uint64_t)self);
  return self->_evStateInfo != 0;
}

- (GEOEVStateInfo)evStateInfo
{
  -[GEOETAStep _readEvStateInfo]((uint64_t)self);
  return self->_evStateInfo;
}

- (void)setEvStateInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_evStateInfo, a3);
}

- (unsigned)distanceCm
{
  return self->_distanceCm;
}

- (void)setDistanceCm:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_distanceCm = a3;
}

- (void)setHasDistanceCm:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasDistanceCm
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOETAStep;
  -[GEOETAStep description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETAStep dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAStep _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[4];
  id v31;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 4) == 0)
  {
    if ((v5 & 2) == 0)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 64));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("expectedTime"));

    if ((*(_WORD *)(a1 + 80) & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("stepID"));

  v5 = *(_WORD *)(a1 + 80);
  if ((v5 & 2) != 0)
    goto LABEL_10;
LABEL_4:
  if ((v5 & 0x10) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 76));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("zilchPointIndex"));

  }
LABEL_6:
  objc_msgSend((id)a1, "timeCheckpoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("timeCheckpoints"));

  }
  if ((*(_WORD *)(a1 + 80) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("zilchPathIndex"));

  }
  objc_msgSend((id)a1, "evInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("evInfo");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("ev_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend((id)a1, "evStateInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("evStateInfo");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("ev_state_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if ((*(_WORD *)(a1 + 80) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 60));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("distanceCm");
    else
      v22 = CFSTR("distance_cm");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  v23 = *(void **)(a1 + 16);
  if (v23)
  {
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v24, "count"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __40__GEOETAStep__dictionaryRepresentation___block_invoke;
      v30[3] = &unk_1E1C00600;
      v27 = v26;
      v31 = v27;
      objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v30);
      v28 = v27;

      v25 = v28;
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAStep _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __40__GEOETAStep__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETAStep)initWithDictionary:(id)a3
{
  return (GEOETAStep *)-[GEOETAStep _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOTimeCheckpoints *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEOStopStepEVInfo *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOEVStateInfo *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stepID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStepID:", objc_msgSend(v6, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expectedTime"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setExpectedTime:", objc_msgSend(v7, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("zilchPointIndex"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZilchPointIndex:", objc_msgSend(v8, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeCheckpoints"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOTimeCheckpoints alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOTimeCheckpoints initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOTimeCheckpoints initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setTimeCheckpoints:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("zilchPathIndex"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setZilchPathIndex:", objc_msgSend(v13, "unsignedIntValue"));

      if (a3)
        v14 = CFSTR("evInfo");
      else
        v14 = CFSTR("ev_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [GEOStopStepEVInfo alloc];
        if ((a3 & 1) != 0)
          v17 = -[GEOStopStepEVInfo initWithJSON:](v16, "initWithJSON:", v15);
        else
          v17 = -[GEOStopStepEVInfo initWithDictionary:](v16, "initWithDictionary:", v15);
        v18 = (void *)v17;
        objc_msgSend(a1, "setEvInfo:", v17);

      }
      if (a3)
        v19 = CFSTR("evStateInfo");
      else
        v19 = CFSTR("ev_state_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = [GEOEVStateInfo alloc];
        if ((a3 & 1) != 0)
          v22 = -[GEOEVStateInfo initWithJSON:](v21, "initWithJSON:", v20);
        else
          v22 = -[GEOEVStateInfo initWithDictionary:](v21, "initWithDictionary:", v20);
        v23 = (void *)v22;
        objc_msgSend(a1, "setEvStateInfo:", v22);

      }
      if (a3)
        v24 = CFSTR("distanceCm");
      else
        v24 = CFSTR("distance_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDistanceCm:", objc_msgSend(v25, "unsignedIntValue"));

    }
  }

  return a1;
}

- (GEOETAStep)initWithJSON:(id)a3
{
  return (GEOETAStep *)-[GEOETAStep _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1150_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1151_0;
    GEOETAStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOTimeCheckpoints readAll:](self->_timeCheckpoints, "readAll:", 1);
    -[GEOStopStepEVInfo readAll:](self->_evInfo, "readAll:", 1);
    -[GEOEVStateInfo readAll:](self->_evStateInfo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETAStepIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAStepReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  id v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETAStepIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOETAStep readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    v6 = v9;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      v6 = v9;
    }
    if (self->_timeCheckpoints)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
    }
    if (self->_evInfo)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if (self->_evStateInfo)
    {
      PBDataWriterWriteSubmessage();
      v6 = v9;
    }
    if ((*(_WORD *)&self->_flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v6 = v9;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOETAStep readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_stepID;
    *((_WORD *)v6 + 40) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v6 + 16) = self->_expectedTime;
  *((_WORD *)v6 + 40) |= 2u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_4:
    *((_DWORD *)v6 + 19) = self->_zilchPointIndex;
    *((_WORD *)v6 + 40) |= 0x10u;
  }
LABEL_5:
  if (self->_timeCheckpoints)
  {
    objc_msgSend(v6, "setTimeCheckpoints:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 18) = self->_zilchPathIndex;
    *((_WORD *)v4 + 40) |= 8u;
  }
  if (self->_evInfo)
  {
    objc_msgSend(v6, "setEvInfo:");
    v4 = v6;
  }
  if (self->_evStateInfo)
  {
    objc_msgSend(v6, "setEvStateInfo:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_distanceCm;
    *((_WORD *)v4 + 40) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  PBUnknownFields *v16;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x200) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETAStepReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAStep readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((flags & 2) == 0)
      goto LABEL_7;
LABEL_16:
    *(_DWORD *)(v5 + 64) = self->_expectedTime;
    *(_WORD *)(v5 + 80) |= 2u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(_DWORD *)(v5 + 68) = self->_stepID;
  *(_WORD *)(v5 + 80) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
    goto LABEL_16;
LABEL_7:
  if ((flags & 0x10) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 76) = self->_zilchPointIndex;
    *(_WORD *)(v5 + 80) |= 0x10u;
  }
LABEL_9:
  v10 = -[GEOTimeCheckpoints copyWithZone:](self->_timeCheckpoints, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_zilchPathIndex;
    *(_WORD *)(v5 + 80) |= 8u;
  }
  v12 = -[GEOStopStepEVInfo copyWithZone:](self->_evInfo, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = -[GEOEVStateInfo copyWithZone:](self->_evStateInfo, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_distanceCm;
    *(_WORD *)(v5 + 80) |= 1u;
  }
  v16 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v16;
LABEL_14:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  GEOTimeCheckpoints *timeCheckpoints;
  GEOStopStepEVInfo *evInfo;
  GEOEVStateInfo *evStateInfo;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[GEOETAStep readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 40);
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_stepID != *((_DWORD *)v4 + 17))
      goto LABEL_33;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_expectedTime != *((_DWORD *)v4 + 16))
      goto LABEL_33;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_zilchPointIndex != *((_DWORD *)v4 + 19))
      goto LABEL_33;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_33;
  }
  timeCheckpoints = self->_timeCheckpoints;
  if ((unint64_t)timeCheckpoints | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOTimeCheckpoints isEqual:](timeCheckpoints, "isEqual:"))
    {
LABEL_33:
      v11 = 0;
      goto LABEL_34;
    }
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 40);
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_zilchPathIndex != *((_DWORD *)v4 + 18))
      goto LABEL_33;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_33;
  }
  evInfo = self->_evInfo;
  if ((unint64_t)evInfo | *((_QWORD *)v4 + 3) && !-[GEOStopStepEVInfo isEqual:](evInfo, "isEqual:"))
    goto LABEL_33;
  evStateInfo = self->_evStateInfo;
  if ((unint64_t)evStateInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOEVStateInfo isEqual:](evStateInfo, "isEqual:"))
      goto LABEL_33;
  }
  v10 = *((_WORD *)v4 + 40);
  v11 = (v10 & 1) == 0;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_distanceCm != *((_DWORD *)v4 + 15))
      goto LABEL_33;
    v11 = 1;
  }
LABEL_34:

  return v11;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  -[GEOETAStep readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
    v4 = 0;
    if ((flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v5 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v4 = 2654435761 * self->_stepID;
  if ((flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v5 = 2654435761 * self->_expectedTime;
  if ((flags & 0x10) != 0)
  {
LABEL_4:
    v6 = 2654435761 * self->_zilchPointIndex;
    goto LABEL_8;
  }
LABEL_7:
  v6 = 0;
LABEL_8:
  v7 = -[GEOTimeCheckpoints hash](self->_timeCheckpoints, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v8 = 2654435761 * self->_zilchPathIndex;
  else
    v8 = 0;
  v9 = -[GEOStopStepEVInfo hash](self->_evInfo, "hash");
  v10 = -[GEOEVStateInfo hash](self->_evStateInfo, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_distanceCm;
  else
    v11 = 0;
  return v5 ^ v4 ^ v6 ^ v8 ^ v7 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  __int16 v5;
  GEOTimeCheckpoints *timeCheckpoints;
  uint64_t v7;
  GEOStopStepEVInfo *evInfo;
  uint64_t v9;
  GEOEVStateInfo *evStateInfo;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  v5 = *((_WORD *)v12 + 40);
  if ((v5 & 4) != 0)
  {
    self->_stepID = *((_DWORD *)v12 + 17);
    *(_WORD *)&self->_flags |= 4u;
    v5 = *((_WORD *)v12 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expectedTime = *((_DWORD *)v12 + 16);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v12 + 40) & 0x10) != 0)
  {
LABEL_4:
    self->_zilchPointIndex = *((_DWORD *)v12 + 19);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_5:
  timeCheckpoints = self->_timeCheckpoints;
  v7 = *((_QWORD *)v12 + 5);
  if (timeCheckpoints)
  {
    if (!v7)
      goto LABEL_14;
    -[GEOTimeCheckpoints mergeFrom:](timeCheckpoints, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_14;
    -[GEOETAStep setTimeCheckpoints:](self, "setTimeCheckpoints:");
  }
  v4 = v12;
LABEL_14:
  if ((v4[20] & 8) != 0)
  {
    self->_zilchPathIndex = v4[18];
    *(_WORD *)&self->_flags |= 8u;
  }
  evInfo = self->_evInfo;
  v9 = *((_QWORD *)v4 + 3);
  if (evInfo)
  {
    if (!v9)
      goto LABEL_22;
    -[GEOStopStepEVInfo mergeFrom:](evInfo, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_22;
    -[GEOETAStep setEvInfo:](self, "setEvInfo:");
  }
  v4 = v12;
LABEL_22:
  evStateInfo = self->_evStateInfo;
  v11 = *((_QWORD *)v4 + 4);
  if (evStateInfo)
  {
    if (!v11)
      goto LABEL_28;
    -[GEOEVStateInfo mergeFrom:](evStateInfo, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_28;
    -[GEOETAStep setEvStateInfo:](self, "setEvStateInfo:");
  }
  v4 = v12;
LABEL_28:
  if ((v4[20] & 1) != 0)
  {
    self->_distanceCm = v4[15];
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETAStepReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1154_0);
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
  *(_WORD *)&self->_flags |= 0x220u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETAStep readAll:](self, "readAll:", 0);
    -[GEOTimeCheckpoints clearUnknownFields:](self->_timeCheckpoints, "clearUnknownFields:", 1);
    -[GEOStopStepEVInfo clearUnknownFields:](self->_evInfo, "clearUnknownFields:", 1);
    -[GEOEVStateInfo clearUnknownFields:](self->_evStateInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeCheckpoints, 0);
  objc_storeStrong((id *)&self->_evStateInfo, 0);
  objc_storeStrong((id *)&self->_evInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
