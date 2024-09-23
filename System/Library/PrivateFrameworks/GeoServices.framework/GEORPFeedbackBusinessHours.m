@implementation GEORPFeedbackBusinessHours

- (GEORPFeedbackBusinessHours)init
{
  GEORPFeedbackBusinessHours *v2;
  GEORPFeedbackBusinessHours *v3;
  GEORPFeedbackBusinessHours *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackBusinessHours;
  v2 = -[GEORPFeedbackBusinessHours init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackBusinessHours)initWithData:(id)a3
{
  GEORPFeedbackBusinessHours *v3;
  GEORPFeedbackBusinessHours *v4;
  GEORPFeedbackBusinessHours *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackBusinessHours;
  v3 = -[GEORPFeedbackBusinessHours initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readWeeklyHours
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
        GEORPFeedbackBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWeeklyHours_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasWeeklyHours
{
  -[GEORPFeedbackBusinessHours _readWeeklyHours]((uint64_t)self);
  return self->_weeklyHours != 0;
}

- (GEOPDHours)weeklyHours
{
  -[GEORPFeedbackBusinessHours _readWeeklyHours]((uint64_t)self);
  return self->_weeklyHours;
}

- (void)setWeeklyHours:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_weeklyHours, a3);
}

- (unint64_t)start
{
  return self->_start;
}

- (void)setStart:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_start = a3;
}

- (void)setHasStart:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasStart
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unint64_t)end
{
  return self->_end;
}

- (void)setEnd:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_end = a3;
}

- (void)setHasEnd:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasEnd
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)_readComments
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
        GEORPFeedbackBusinessHoursReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readComments_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasComments
{
  -[GEORPFeedbackBusinessHours _readComments]((uint64_t)self);
  return self->_comments != 0;
}

- (NSString)comments
{
  -[GEORPFeedbackBusinessHours _readComments]((uint64_t)self);
  return self->_comments;
}

- (void)setComments:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_comments, a3);
}

- (int)hoursType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 4) != 0)
    return self->_hoursType;
  else
    return 0;
}

- (void)setHoursType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_hoursType = a3;
}

- (void)setHasHoursType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasHoursType
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (id)hoursTypeAsString:(int)a3
{
  if (a3 < 5)
    return *((id *)&off_1E1C14920 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsHoursType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_HOURS_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_HOURS_NORMAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_HOURS_SPECIAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_HOURS_TEMPORARY_CLOSURE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_HOURS_PERMANENT_CLOSURE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
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
  v8.super_class = (Class)GEORPFeedbackBusinessHours;
  -[GEORPFeedbackBusinessHours description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackBusinessHours dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackBusinessHours _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "weeklyHours");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("weeklyHours");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("weekly_hours");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    v9 = *(_BYTE *)(a1 + 64);
    if ((v9 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("start"));

      v9 = *(_BYTE *)(a1 + 64);
    }
    if ((v9 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("end"));

    }
    objc_msgSend((id)a1, "comments");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("comments"));

    if ((*(_BYTE *)(a1 + 64) & 4) != 0)
    {
      v13 = *(int *)(a1 + 60);
      if (v13 >= 5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = (void *)*((_QWORD *)&off_1E1C14920 + v13);
      }
      if (a2)
        v15 = CFSTR("hoursType");
      else
        v15 = CFSTR("hours_type");
      objc_msgSend(v4, "setObject:forKey:", v14, v15);

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
  return -[GEORPFeedbackBusinessHours _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackBusinessHours)initWithDictionary:(id)a3
{
  return (GEORPFeedbackBusinessHours *)-[GEORPFeedbackBusinessHours _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOPDHours *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  uint64_t v18;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("weeklyHours");
      else
        v6 = CFSTR("weekly_hours");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOPDHours alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOPDHours initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOPDHours initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setWeeklyHours:", v9);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("start"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStart:", objc_msgSend(v11, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("end"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setEnd:", objc_msgSend(v12, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("comments"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setComments:", v14);

      }
      if (a3)
        v15 = CFSTR("hoursType");
      else
        v15 = CFSTR("hours_type");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = v16;
        if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FEEDBACK_HOURS_UNKNOWN")) & 1) != 0)
        {
          v18 = 0;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FEEDBACK_HOURS_NORMAL")) & 1) != 0)
        {
          v18 = 1;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FEEDBACK_HOURS_SPECIAL")) & 1) != 0)
        {
          v18 = 2;
        }
        else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("FEEDBACK_HOURS_TEMPORARY_CLOSURE")) & 1) != 0)
        {
          v18 = 3;
        }
        else if (objc_msgSend(v17, "isEqualToString:", CFSTR("FEEDBACK_HOURS_PERMANENT_CLOSURE")))
        {
          v18 = 4;
        }
        else
        {
          v18 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_36:

          goto LABEL_37;
        }
        v18 = objc_msgSend(v16, "intValue");
      }
      objc_msgSend(a1, "setHoursType:", v18);
      goto LABEL_36;
    }
  }
LABEL_37:

  return a1;
}

- (GEORPFeedbackBusinessHours)initWithJSON:(id)a3
{
  return (GEORPFeedbackBusinessHours *)-[GEORPFeedbackBusinessHours _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_189;
    else
      v8 = (int *)&readAll__nonRecursiveTag_190;
    GEORPFeedbackBusinessHoursReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPDHours readAll:](self->_weeklyHours, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackBusinessHoursIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackBusinessHoursReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORPFeedbackBusinessHoursIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORPFeedbackBusinessHours readAll:](self, "readAll:", 0);
    if (self->_weeklyHours)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    if (self->_comments)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  char flags;
  id *v5;
  id *v6;

  v6 = (id *)a3;
  -[GEORPFeedbackBusinessHours readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_weeklyHours)
    objc_msgSend(v6, "setWeeklyHours:");
  flags = (char)self->_flags;
  v5 = v6;
  if ((flags & 2) != 0)
  {
    v6[4] = (id)self->_start;
    *((_BYTE *)v6 + 64) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    v6[3] = (id)self->_end;
    *((_BYTE *)v6 + 64) |= 1u;
  }
  if (self->_comments)
  {
    objc_msgSend(v6, "setComments:");
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v5 + 15) = self->_hoursType;
    *((_BYTE *)v5 + 64) |= 4u;
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
  char flags;
  uint64_t v12;
  void *v13;

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
      GEORPFeedbackBusinessHoursReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackBusinessHours readAll:](self, "readAll:", 0);
  v9 = -[GEOPDHours copyWithZone:](self->_weeklyHours, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_start;
    *(_BYTE *)(v5 + 64) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 24) = self->_end;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  v12 = -[NSString copyWithZone:](self->_comments, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v12;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_hoursType;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDHours *weeklyHours;
  char flags;
  char v7;
  NSString *comments;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEORPFeedbackBusinessHours readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  weeklyHours = self->_weeklyHours;
  if ((unint64_t)weeklyHours | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDHours isEqual:](weeklyHours, "isEqual:"))
      goto LABEL_21;
  }
  flags = (char)self->_flags;
  v7 = *((_BYTE *)v4 + 64);
  if ((flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_start != *((_QWORD *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_end != *((_QWORD *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_21;
  }
  comments = self->_comments;
  if ((unint64_t)comments | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](comments, "isEqual:"))
    {
LABEL_21:
      v9 = 0;
      goto LABEL_22;
    }
    flags = (char)self->_flags;
    v7 = *((_BYTE *)v4 + 64);
  }
  v9 = (v7 & 4) == 0;
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_hoursType != *((_DWORD *)v4 + 15))
      goto LABEL_21;
    v9 = 1;
  }
LABEL_22:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  -[GEORPFeedbackBusinessHours readAll:](self, "readAll:", 1);
  v3 = -[GEOPDHours hash](self->_weeklyHours, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v4 = 2654435761u * self->_start;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
    {
LABEL_3:
      v5 = 2654435761u * self->_end;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  v6 = -[NSString hash](self->_comments, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v7 = 2654435761 * self->_hoursType;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  GEOPDHours *weeklyHours;
  unint64_t v5;
  unint64_t *v6;
  char v7;
  unint64_t *v8;

  v8 = (unint64_t *)a3;
  objc_msgSend(v8, "readAll:", 0);
  weeklyHours = self->_weeklyHours;
  v5 = v8[5];
  if (weeklyHours)
  {
    if (v5)
      -[GEOPDHours mergeFrom:](weeklyHours, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackBusinessHours setWeeklyHours:](self, "setWeeklyHours:");
  }
  v6 = v8;
  v7 = *((_BYTE *)v8 + 64);
  if ((v7 & 2) != 0)
  {
    self->_start = v8[4];
    *(_BYTE *)&self->_flags |= 2u;
    v7 = *((_BYTE *)v8 + 64);
  }
  if ((v7 & 1) != 0)
  {
    self->_end = v8[3];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (v8[2])
  {
    -[GEORPFeedbackBusinessHours setComments:](self, "setComments:");
    v6 = v8;
  }
  if ((v6[8] & 4) != 0)
  {
    self->_hoursType = *((_DWORD *)v6 + 15);
    *(_BYTE *)&self->_flags |= 4u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weeklyHours, 0);
  objc_storeStrong((id *)&self->_comments, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
