@implementation GEORPProblemStatus

- (GEORPProblemStatus)init
{
  GEORPProblemStatus *v2;
  GEORPProblemStatus *v3;
  GEORPProblemStatus *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblemStatus;
  v2 = -[GEORPProblemStatus init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblemStatus)initWithData:(id)a3
{
  GEORPProblemStatus *v3;
  GEORPProblemStatus *v4;
  GEORPProblemStatus *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblemStatus;
  v3 = -[GEORPProblemStatus initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readProblemId
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
        GEORPProblemStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemId_tags_2447);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemId
{
  -[GEORPProblemStatus _readProblemId]((uint64_t)self);
  return self->_problemId != 0;
}

- (NSString)problemId
{
  -[GEORPProblemStatus _readProblemId]((uint64_t)self);
  return self->_problemId;
}

- (void)setProblemId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x50u;
  objc_storeStrong((id *)&self->_problemId, a3);
}

- (double)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x41u;
  self->_creationDate = a3;
}

- (void)setHasCreationDate:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x40;
}

- (BOOL)hasCreationDate
{
  return *(_BYTE *)&self->_flags & 1;
}

- (int)problemState
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_problemState;
  else
    return 1;
}

- (void)setProblemState:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x42u;
  self->_problemState = a3;
}

- (void)setHasProblemState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 66;
  else
    v3 = 64;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasProblemState
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)problemStateAsString:(int)a3
{
  if ((a3 - 1) < 5)
    return off_1E1C0EF08[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsProblemState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unresolved")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Resolved")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NeedsAdditionalInformation")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ResolvedNotLive")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readProblemResolution
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
        GEORPProblemStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemResolution_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemResolution
{
  -[GEORPProblemStatus _readProblemResolution]((uint64_t)self);
  return self->_problemResolution != 0;
}

- (GEORPResolution)problemResolution
{
  -[GEORPProblemStatus _readProblemResolution]((uint64_t)self);
  return self->_problemResolution;
}

- (void)setProblemResolution:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x60u;
  objc_storeStrong((id *)&self->_problemResolution, a3);
}

- (void)_readNotification
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
        GEORPProblemStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNotification_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasNotification
{
  -[GEORPProblemStatus _readNotification]((uint64_t)self);
  return self->_notification != 0;
}

- (GEORPNotification)notification
{
  -[GEORPProblemStatus _readNotification]((uint64_t)self);
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x48u;
  objc_storeStrong((id *)&self->_notification, a3);
}

- (void)_readDetails
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
        GEORPProblemStatusReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetails_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasDetails
{
  -[GEORPProblemStatus _readDetails]((uint64_t)self);
  return self->_details != 0;
}

- (GEORPDetails)details
{
  -[GEORPProblemStatus _readDetails]((uint64_t)self);
  return self->_details;
}

- (void)setDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x44u;
  objc_storeStrong((id *)&self->_details, a3);
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
  v8.super_class = (Class)GEORPProblemStatus;
  -[GEORPProblemStatus description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblemStatus dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblemStatus _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  char v7;
  void *v8;
  const __CFString *v9;
  unsigned int v10;
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
  void *v21;
  void *v22;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "problemId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("problemId");
      else
        v6 = CFSTR("problem_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    v7 = *(_BYTE *)(a1 + 72);
    if ((v7 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 16));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v9 = CFSTR("creationDate");
      else
        v9 = CFSTR("creation_date");
      objc_msgSend(v4, "setObject:forKey:", v8, v9);

      v7 = *(_BYTE *)(a1 + 72);
    }
    if ((v7 & 2) != 0)
    {
      v10 = *(_DWORD *)(a1 + 68) - 1;
      if (v10 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
        v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = off_1E1C0EF08[v10];
      }
      if (a2)
        v12 = CFSTR("problemState");
      else
        v12 = CFSTR("problem_state");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "problemResolution");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v13, "jsonRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("problemResolution");
      }
      else
      {
        objc_msgSend(v13, "dictionaryRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = CFSTR("problem_resolution");
      }
      objc_msgSend(v4, "setObject:forKey:", v15, v16);

    }
    objc_msgSend((id)a1, "notification");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v17, "jsonRepresentation");
      else
        objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("notification"));

    }
    objc_msgSend((id)a1, "details");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v20, "jsonRepresentation");
      else
        objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("details"));

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
  return -[GEORPProblemStatus _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblemStatus)initWithDictionary:(id)a3
{
  return (GEORPProblemStatus *)-[GEORPProblemStatus _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  GEORPResolution *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  GEORPNotification *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  GEORPDetails *v25;
  uint64_t v26;
  void *v27;

  v5 = a2;
  if (!a1)
    goto LABEL_51;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_51;
  if (a3)
    v6 = CFSTR("problemId");
  else
    v6 = CFSTR("problem_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setProblemId:", v8);

  }
  if (a3)
    v9 = CFSTR("creationDate");
  else
    v9 = CFSTR("creation_date");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "doubleValue");
    objc_msgSend(a1, "setCreationDate:");
  }

  if (a3)
    v11 = CFSTR("problemState");
  else
    v11 = CFSTR("problem_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = v12;
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Unresolved")) & 1) != 0)
    {
      v14 = 1;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Resolved")) & 1) != 0)
    {
      v14 = 2;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("Rejected")) & 1) != 0)
    {
      v14 = 3;
    }
    else if ((objc_msgSend(v13, "isEqualToString:", CFSTR("NeedsAdditionalInformation")) & 1) != 0)
    {
      v14 = 4;
    }
    else if (objc_msgSend(v13, "isEqualToString:", CFSTR("ResolvedNotLive")))
    {
      v14 = 5;
    }
    else
    {
      v14 = 1;
    }

    goto LABEL_31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = objc_msgSend(v12, "intValue");
LABEL_31:
    objc_msgSend(a1, "setProblemState:", v14);
  }

  if (a3)
    v15 = CFSTR("problemResolution");
  else
    v15 = CFSTR("problem_resolution");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = [GEORPResolution alloc];
    if ((a3 & 1) != 0)
      v18 = -[GEORPResolution initWithJSON:](v17, "initWithJSON:", v16);
    else
      v18 = -[GEORPResolution initWithDictionary:](v17, "initWithDictionary:", v16);
    v19 = (void *)v18;
    objc_msgSend(a1, "setProblemResolution:", v18);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("notification"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEORPNotification alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEORPNotification initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEORPNotification initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setNotification:", v22);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("details"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = [GEORPDetails alloc];
    if ((a3 & 1) != 0)
      v26 = -[GEORPDetails initWithJSON:](v25, "initWithJSON:", v24);
    else
      v26 = -[GEORPDetails initWithDictionary:](v25, "initWithDictionary:", v24);
    v27 = (void *)v26;
    objc_msgSend(a1, "setDetails:", v26);

  }
LABEL_51:

  return a1;
}

- (GEORPProblemStatus)initWithJSON:(id)a3
{
  return (GEORPProblemStatus *)-[GEORPProblemStatus _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2463;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2464;
    GEORPProblemStatusReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPResolution readAll:](self->_problemResolution, "readAll:", 1);
    -[GEORPNotification readAll:](self->_notification, "readAll:", 1);
    -[GEORPDetails readAll:](self->_details, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemStatusIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemStatusReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemStatusIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPProblemStatus readAll:](self, "readAll:", 0);
    if (self->_problemId)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteDoubleField();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_problemResolution)
      PBDataWriterWriteSubmessage();
    if (self->_notification)
      PBDataWriterWriteSubmessage();
    if (self->_details)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPProblemStatus _readDetails]((uint64_t)self);
  if (-[GEORPDetails hasGreenTeaWithValue:](self->_details, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblemStatus _readProblemResolution]((uint64_t)self);
  return -[GEORPResolution hasGreenTeaWithValue:](self->_problemResolution, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEORPProblemStatus readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_problemId)
    objc_msgSend(v6, "setProblemId:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 1) != 0)
  {
    v6[2] = *(id *)&self->_creationDate;
    *((_BYTE *)v6 + 72) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v6 + 17) = self->_problemState;
    *((_BYTE *)v6 + 72) |= 2u;
  }
  if (self->_problemResolution)
  {
    objc_msgSend(v6, "setProblemResolution:");
    v5 = v6;
  }
  if (self->_notification)
  {
    objc_msgSend(v6, "setNotification:");
    v5 = v6;
  }
  if (self->_details)
  {
    objc_msgSend(v6, "setDetails:");
    v5 = v6;
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
  char flags;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

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
      GEORPProblemStatusReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblemStatus readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_problemId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(double *)(v5 + 16) = self->_creationDate;
    *(_BYTE *)(v5 + 72) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_problemState;
    *(_BYTE *)(v5 + 72) |= 2u;
  }
  v12 = -[GEORPResolution copyWithZone:](self->_problemResolution, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  v14 = -[GEORPNotification copyWithZone:](self->_notification, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v14;

  v16 = -[GEORPDetails copyWithZone:](self->_details, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v16;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *problemId;
  GEORPResolution *problemResolution;
  GEORPNotification *notification;
  GEORPDetails *details;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEORPProblemStatus readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  problemId = self->_problemId;
  if ((unint64_t)problemId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](problemId, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 1) == 0 || self->_creationDate != *((double *)v4 + 2))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 72) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 2) == 0 || self->_problemState != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 72) & 2) != 0)
  {
    goto LABEL_20;
  }
  problemResolution = self->_problemResolution;
  if ((unint64_t)problemResolution | *((_QWORD *)v4 + 6)
    && !-[GEORPResolution isEqual:](problemResolution, "isEqual:"))
  {
    goto LABEL_20;
  }
  notification = self->_notification;
  if ((unint64_t)notification | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPNotification isEqual:](notification, "isEqual:"))
      goto LABEL_20;
  }
  details = self->_details;
  if ((unint64_t)details | *((_QWORD *)v4 + 3))
    v9 = -[GEORPDetails isEqual:](details, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  char flags;
  unint64_t v5;
  double creationDate;
  double v7;
  long double v8;
  double v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  -[GEORPProblemStatus readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_problemId, "hash");
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    creationDate = self->_creationDate;
    v7 = -creationDate;
    if (creationDate >= 0.0)
      v7 = self->_creationDate;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((flags & 2) != 0)
    v10 = 2654435761 * self->_problemState;
  else
    v10 = 0;
  v11 = v5 ^ v3 ^ v10 ^ -[GEORPResolution hash](self->_problemResolution, "hash");
  v12 = -[GEORPNotification hash](self->_notification, "hash");
  return v11 ^ v12 ^ -[GEORPDetails hash](self->_details, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEORPResolution *problemResolution;
  uint64_t v7;
  GEORPNotification *notification;
  uint64_t v9;
  GEORPDetails *details;
  uint64_t v11;
  _QWORD *v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  v4 = v12;
  if (v12[5])
  {
    -[GEORPProblemStatus setProblemId:](self, "setProblemId:");
    v4 = v12;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 1) != 0)
  {
    self->_creationDate = (double)v4[2];
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 2) != 0)
  {
    self->_problemState = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 2u;
  }
  problemResolution = self->_problemResolution;
  v7 = v4[6];
  if (problemResolution)
  {
    if (!v7)
      goto LABEL_13;
    -[GEORPResolution mergeFrom:](problemResolution, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[GEORPProblemStatus setProblemResolution:](self, "setProblemResolution:");
  }
  v4 = v12;
LABEL_13:
  notification = self->_notification;
  v9 = v4[4];
  if (notification)
  {
    if (!v9)
      goto LABEL_19;
    -[GEORPNotification mergeFrom:](notification, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_19;
    -[GEORPProblemStatus setNotification:](self, "setNotification:");
  }
  v4 = v12;
LABEL_19:
  details = self->_details;
  v11 = v4[3];
  if (details)
  {
    if (v11)
    {
      -[GEORPDetails mergeFrom:](details, "mergeFrom:");
LABEL_24:
      v4 = v12;
    }
  }
  else if (v11)
  {
    -[GEORPProblemStatus setDetails:](self, "setDetails:");
    goto LABEL_24;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemResolution, 0);
  objc_storeStrong((id *)&self->_problemId, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
