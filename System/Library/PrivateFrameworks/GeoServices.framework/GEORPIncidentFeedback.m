@implementation GEORPIncidentFeedback

- (GEORPIncidentFeedback)init
{
  GEORPIncidentFeedback *v2;
  GEORPIncidentFeedback *v3;
  GEORPIncidentFeedback *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPIncidentFeedback;
  v2 = -[GEORPIncidentFeedback init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPIncidentFeedback)initWithData:(id)a3
{
  GEORPIncidentFeedback *v3;
  GEORPIncidentFeedback *v4;
  GEORPIncidentFeedback *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPIncidentFeedback;
  v3 = -[GEORPIncidentFeedback initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C02BE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_FEEDBACK_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEW_INCIDENT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOTATE")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readNewIncidentDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNewIncidentDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasNewIncidentDetails
{
  -[GEORPIncidentFeedback _readNewIncidentDetails]((uint64_t)self);
  return self->_newIncidentDetails != 0;
}

- (GEORPNewIncidentDetails)newIncidentDetails
{
  -[GEORPIncidentFeedback _readNewIncidentDetails]((uint64_t)self);
  return self->_newIncidentDetails;
}

- (void)setNewIncidentDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  objc_storeStrong((id *)&self->_newIncidentDetails, a3);
}

- (void)_readIncidentAnnotationDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentAnnotationDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasIncidentAnnotationDetails
{
  -[GEORPIncidentFeedback _readIncidentAnnotationDetails]((uint64_t)self);
  return self->_incidentAnnotationDetails != 0;
}

- (GEORPIncidentAnnotationDetails)incidentAnnotationDetails
{
  -[GEORPIncidentFeedback _readIncidentAnnotationDetails]((uint64_t)self);
  return self->_incidentAnnotationDetails;
}

- (void)setIncidentAnnotationDetails:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  objc_storeStrong((id *)&self->_incidentAnnotationDetails, a3);
}

- (void)_readSiriContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSiriContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSiriContext
{
  -[GEORPIncidentFeedback _readSiriContext]((uint64_t)self);
  return self->_siriContext != 0;
}

- (GEORPSiriContext)siriContext
{
  -[GEORPIncidentFeedback _readSiriContext]((uint64_t)self);
  return self->_siriContext;
}

- (void)setSiriContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_siriContext, a3);
}

- (void)_readUserPath
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPIncidentFeedbackReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserPath_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasUserPath
{
  -[GEORPIncidentFeedback _readUserPath]((uint64_t)self);
  return self->_userPath != 0;
}

- (GEORPIncidentUserPath)userPath
{
  -[GEORPIncidentFeedback _readUserPath]((uint64_t)self);
  return self->_userPath;
}

- (void)setUserPath:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_userPath, a3);
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
  v8.super_class = (Class)GEORPIncidentFeedback;
  -[GEORPIncidentFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPIncidentFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPIncidentFeedback _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      v5 = *(int *)(a1 + 60);
      if (v5 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C02BE8[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    v7 = (void *)objc_msgSend((id)a1, "newIncidentDetails");
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v7, "jsonRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("newIncidentDetails");
      }
      else
      {
        objc_msgSend(v7, "dictionaryRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = CFSTR("new_incident_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v9, v10);

    }
    objc_msgSend((id)a1, "incidentAnnotationDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v11, "jsonRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("incidentAnnotationDetails");
      }
      else
      {
        objc_msgSend(v11, "dictionaryRepresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = CFSTR("incident_annotation_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    objc_msgSend((id)a1, "siriContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("siriContext");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("siri_context");
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

    }
    objc_msgSend((id)a1, "userPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v19, "jsonRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("userPath");
      }
      else
      {
        objc_msgSend(v19, "dictionaryRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("user_path");
      }
      objc_msgSend(v4, "setObject:forKey:", v21, v22);

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
  return -[GEORPIncidentFeedback _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPIncidentFeedback)initWithDictionary:(id)a3
{
  return (GEORPIncidentFeedback *)-[GEORPIncidentFeedback _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  GEORPNewIncidentDetails *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  GEORPIncidentAnnotationDetails *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEORPSiriContext *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  GEORPIncidentUserPath *v26;
  uint64_t v27;
  void *v28;

  v5 = a2;
  if (!a1)
    goto LABEL_48;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_48;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INCIDENT_FEEDBACK_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NEW_INCIDENT")) & 1) != 0)
    {
      v8 = 1;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("ANNOTATE")))
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
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("newIncidentDetails");
  else
    v9 = CFSTR("new_incident_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEORPNewIncidentDetails alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEORPNewIncidentDetails initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEORPNewIncidentDetails initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setNewIncidentDetails:", v12);

  }
  if (a3)
    v14 = CFSTR("incidentAnnotationDetails");
  else
    v14 = CFSTR("incident_annotation_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = [GEORPIncidentAnnotationDetails alloc];
    if ((a3 & 1) != 0)
      v17 = -[GEORPIncidentAnnotationDetails initWithJSON:](v16, "initWithJSON:", v15);
    else
      v17 = -[GEORPIncidentAnnotationDetails initWithDictionary:](v16, "initWithDictionary:", v15);
    v18 = (void *)v17;
    objc_msgSend(a1, "setIncidentAnnotationDetails:", v17);

  }
  if (a3)
    v19 = CFSTR("siriContext");
  else
    v19 = CFSTR("siri_context");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEORPSiriContext alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEORPSiriContext initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEORPSiriContext initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(a1, "setSiriContext:", v22);

  }
  if (a3)
    v24 = CFSTR("userPath");
  else
    v24 = CFSTR("user_path");
  objc_msgSend(v5, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = [GEORPIncidentUserPath alloc];
    if ((a3 & 1) != 0)
      v27 = -[GEORPIncidentUserPath initWithJSON:](v26, "initWithJSON:", v25);
    else
      v27 = -[GEORPIncidentUserPath initWithDictionary:](v26, "initWithDictionary:", v25);
    v28 = (void *)v27;
    objc_msgSend(a1, "setUserPath:", v27);

  }
LABEL_48:

  return a1;
}

- (GEORPIncidentFeedback)initWithJSON:(id)a3
{
  return (GEORPIncidentFeedback *)-[GEORPIncidentFeedback _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_142;
    else
      v8 = (int *)&readAll__nonRecursiveTag_143;
    GEORPIncidentFeedbackReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPIncidentFeedbackCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPIncidentFeedbackIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPIncidentFeedbackReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPIncidentFeedbackIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPIncidentFeedback readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_newIncidentDetails)
      PBDataWriterWriteSubmessage();
    if (self->_incidentAnnotationDetails)
      PBDataWriterWriteSubmessage();
    if (self->_siriContext)
      PBDataWriterWriteSubmessage();
    if (self->_userPath)
      PBDataWriterWriteSubmessage();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPIncidentFeedbackClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPIncidentFeedback _readIncidentAnnotationDetails]((uint64_t)self);
  if (-[GEORPIncidentAnnotationDetails hasGreenTeaWithValue:](self->_incidentAnnotationDetails, "hasGreenTeaWithValue:", v3))
  {
    return 1;
  }
  -[GEORPIncidentFeedback _readNewIncidentDetails]((uint64_t)self);
  return -[GEORPNewIncidentDetails hasGreenTeaWithValue:](self->_newIncidentDetails, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPIncidentFeedback readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 12) = self->_readerMarkPos;
  *((_DWORD *)v5 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_type;
    *((_BYTE *)v5 + 64) |= 1u;
  }
  if (self->_newIncidentDetails)
  {
    objc_msgSend(v5, "setNewIncidentDetails:");
    v4 = v5;
  }
  if (self->_incidentAnnotationDetails)
  {
    objc_msgSend(v5, "setIncidentAnnotationDetails:");
    v4 = v5;
  }
  if (self->_siriContext)
  {
    objc_msgSend(v5, "setSiriContext:");
    v4 = v5;
  }
  if (self->_userPath)
  {
    objc_msgSend(v5, "setUserPath:");
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPIncidentFeedbackReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPIncidentFeedback readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v9 = -[GEORPNewIncidentDetails copyWithZone:](self->_newIncidentDetails, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEORPIncidentAnnotationDetails copyWithZone:](self->_incidentAnnotationDetails, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[GEORPSiriContext copyWithZone:](self->_siriContext, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEORPIncidentUserPath copyWithZone:](self->_userPath, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPNewIncidentDetails *newIncidentDetails;
  GEORPIncidentAnnotationDetails *incidentAnnotationDetails;
  GEORPSiriContext *siriContext;
  GEORPIncidentUserPath *userPath;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  -[GEORPIncidentFeedback readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  newIncidentDetails = self->_newIncidentDetails;
  if ((unint64_t)newIncidentDetails | *((_QWORD *)v4 + 3)
    && !-[GEORPNewIncidentDetails isEqual:](newIncidentDetails, "isEqual:"))
  {
    goto LABEL_15;
  }
  incidentAnnotationDetails = self->_incidentAnnotationDetails;
  if ((unint64_t)incidentAnnotationDetails | *((_QWORD *)v4 + 2))
  {
    if (!-[GEORPIncidentAnnotationDetails isEqual:](incidentAnnotationDetails, "isEqual:"))
      goto LABEL_15;
  }
  siriContext = self->_siriContext;
  if ((unint64_t)siriContext | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORPSiriContext isEqual:](siriContext, "isEqual:"))
      goto LABEL_15;
  }
  userPath = self->_userPath;
  if ((unint64_t)userPath | *((_QWORD *)v4 + 5))
    v9 = -[GEORPIncidentUserPath isEqual:](userPath, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[GEORPIncidentFeedback readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[GEORPNewIncidentDetails hash](self->_newIncidentDetails, "hash") ^ v3;
  v5 = -[GEORPIncidentAnnotationDetails hash](self->_incidentAnnotationDetails, "hash");
  v6 = v4 ^ v5 ^ -[GEORPSiriContext hash](self->_siriContext, "hash");
  return v6 ^ -[GEORPIncidentUserPath hash](self->_userPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORPNewIncidentDetails *newIncidentDetails;
  uint64_t v6;
  GEORPIncidentAnnotationDetails *incidentAnnotationDetails;
  uint64_t v8;
  GEORPSiriContext *siriContext;
  uint64_t v10;
  GEORPIncidentUserPath *userPath;
  uint64_t v12;
  int *v13;

  v13 = (int *)a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = v13;
  if ((v13[16] & 1) != 0)
  {
    self->_type = v13[15];
    *(_BYTE *)&self->_flags |= 1u;
  }
  newIncidentDetails = self->_newIncidentDetails;
  v6 = *((_QWORD *)v13 + 3);
  if (newIncidentDetails)
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPNewIncidentDetails mergeFrom:](newIncidentDetails, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORPIncidentFeedback setNewIncidentDetails:](self, "setNewIncidentDetails:");
  }
  v4 = v13;
LABEL_9:
  incidentAnnotationDetails = self->_incidentAnnotationDetails;
  v8 = *((_QWORD *)v4 + 2);
  if (incidentAnnotationDetails)
  {
    if (!v8)
      goto LABEL_15;
    -[GEORPIncidentAnnotationDetails mergeFrom:](incidentAnnotationDetails, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEORPIncidentFeedback setIncidentAnnotationDetails:](self, "setIncidentAnnotationDetails:");
  }
  v4 = v13;
LABEL_15:
  siriContext = self->_siriContext;
  v10 = *((_QWORD *)v4 + 4);
  if (siriContext)
  {
    if (!v10)
      goto LABEL_21;
    -[GEORPSiriContext mergeFrom:](siriContext, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEORPIncidentFeedback setSiriContext:](self, "setSiriContext:");
  }
  v4 = v13;
LABEL_21:
  userPath = self->_userPath;
  v12 = *((_QWORD *)v4 + 5);
  if (userPath)
  {
    if (v12)
    {
      -[GEORPIncidentUserPath mergeFrom:](userPath, "mergeFrom:");
LABEL_26:
      v4 = v13;
    }
  }
  else if (v12)
  {
    -[GEORPIncidentFeedback setUserPath:](self, "setUserPath:");
    goto LABEL_26;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userPath, 0);
  objc_storeStrong((id *)&self->_siriContext, 0);
  objc_storeStrong((id *)&self->_newIncidentDetails, 0);
  objc_storeStrong((id *)&self->_incidentAnnotationDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
