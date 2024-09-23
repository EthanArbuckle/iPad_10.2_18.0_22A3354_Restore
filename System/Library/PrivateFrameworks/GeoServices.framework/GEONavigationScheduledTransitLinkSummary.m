@implementation GEONavigationScheduledTransitLinkSummary

- (GEONavigationScheduledTransitLinkSummary)init
{
  GEONavigationScheduledTransitLinkSummary *v2;
  GEONavigationScheduledTransitLinkSummary *v3;
  GEONavigationScheduledTransitLinkSummary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEONavigationScheduledTransitLinkSummary;
  v2 = -[GEONavigationScheduledTransitLinkSummary init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEONavigationScheduledTransitLinkSummary)initWithData:(id)a3
{
  GEONavigationScheduledTransitLinkSummary *v3;
  GEONavigationScheduledTransitLinkSummary *v4;
  GEONavigationScheduledTransitLinkSummary *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEONavigationScheduledTransitLinkSummary;
  v3 = -[GEONavigationScheduledTransitLinkSummary initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)lineID
{
  return self->_lineID;
}

- (void)setLineID:(unint64_t)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_lineID = a3;
}

- (void)setHasLineID:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasLineID
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)scheduledDeparture
{
  return self->_scheduledDeparture;
}

- (void)setScheduledDeparture:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_scheduledDeparture = a3;
}

- (void)setHasScheduledDeparture:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasScheduledDeparture
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)scheduledArrival
{
  return self->_scheduledArrival;
}

- (void)setScheduledArrival:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_scheduledArrival = a3;
}

- (void)setHasScheduledArrival:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasScheduledArrival
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readStopFrom
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationScheduledTransitLinkSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopFrom_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStopFrom
{
  -[GEONavigationScheduledTransitLinkSummary _readStopFrom]((uint64_t)self);
  return self->_stopFrom != 0;
}

- (GEONavigationTransitStopSummary)stopFrom
{
  -[GEONavigationScheduledTransitLinkSummary _readStopFrom]((uint64_t)self);
  return self->_stopFrom;
}

- (void)setStopFrom:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_stopFrom, a3);
}

- (void)_readStopTo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEONavigationScheduledTransitLinkSummaryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStopTo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasStopTo
{
  -[GEONavigationScheduledTransitLinkSummary _readStopTo]((uint64_t)self);
  return self->_stopTo != 0;
}

- (GEONavigationTransitStopSummary)stopTo
{
  -[GEONavigationScheduledTransitLinkSummary _readStopTo]((uint64_t)self);
  return self->_stopTo;
}

- (void)setStopTo:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_stopTo, a3);
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
  v8.super_class = (Class)GEONavigationScheduledTransitLinkSummary;
  -[GEONavigationScheduledTransitLinkSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEONavigationScheduledTransitLinkSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEONavigationScheduledTransitLinkSummary _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 68);
  if ((v5 & 1) == 0)
  {
    if ((*(_BYTE *)(a1 + 68) & 4) == 0)
      goto LABEL_4;
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("scheduledDeparture"));

    if ((*(_BYTE *)(a1 + 68) & 2) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 16));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("lineID"));

  v5 = *(_BYTE *)(a1 + 68);
  if ((v5 & 4) != 0)
    goto LABEL_10;
LABEL_4:
  if ((v5 & 2) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("scheduledArrival"));

  }
LABEL_6:
  objc_msgSend((id)a1, "stopFrom");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("stopFrom"));

  }
  objc_msgSend((id)a1, "stopTo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v12, "jsonRepresentation");
    else
      objc_msgSend(v12, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("stopTo"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEONavigationScheduledTransitLinkSummary _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEONavigationScheduledTransitLinkSummary)initWithDictionary:(id)a3
{
  return (GEONavigationScheduledTransitLinkSummary *)-[GEONavigationScheduledTransitLinkSummary _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEONavigationTransitStopSummary *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  GEONavigationTransitStopSummary *v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lineID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLineID:", objc_msgSend(v6, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scheduledDeparture"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setScheduledDeparture:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("scheduledArrival"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "doubleValue");
        objc_msgSend(a1, "setScheduledArrival:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stopFrom"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEONavigationTransitStopSummary alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEONavigationTransitStopSummary initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEONavigationTransitStopSummary initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setStopFrom:", v11);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("stopTo"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = [GEONavigationTransitStopSummary alloc];
        if ((a3 & 1) != 0)
          v15 = -[GEONavigationTransitStopSummary initWithJSON:](v14, "initWithJSON:", v13);
        else
          v15 = -[GEONavigationTransitStopSummary initWithDictionary:](v14, "initWithDictionary:", v13);
        v16 = (void *)v15;
        objc_msgSend(a1, "setStopTo:", v15);

      }
    }
  }

  return a1;
}

- (GEONavigationScheduledTransitLinkSummary)initWithJSON:(id)a3
{
  return (GEONavigationScheduledTransitLinkSummary *)-[GEONavigationScheduledTransitLinkSummary _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_372;
    else
      v8 = (int *)&readAll__nonRecursiveTag_373;
    GEONavigationScheduledTransitLinkSummaryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEONavigationTransitStopSummary readAll:](self->_stopFrom, "readAll:", 1);
    -[GEONavigationTransitStopSummary readAll:](self->_stopTo, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEONavigationScheduledTransitLinkSummaryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEONavigationScheduledTransitLinkSummaryReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0x38) == 0)
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
      goto LABEL_15;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEONavigationScheduledTransitLinkSummary readAll:](self, "readAll:", 0);
  flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 4) == 0)
      goto LABEL_5;
LABEL_12:
    PBDataWriterWriteDoubleField();
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteUint64Field();
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_12;
LABEL_5:
  if ((flags & 2) != 0)
LABEL_6:
    PBDataWriterWriteDoubleField();
LABEL_7:
  if (self->_stopFrom)
    PBDataWriterWriteSubmessage();
  if (self->_stopTo)
    PBDataWriterWriteSubmessage();
LABEL_15:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEONavigationScheduledTransitLinkSummary _readStopFrom]((uint64_t)self);
  if (-[GEONavigationTransitStopSummary hasGreenTeaWithValue:](self->_stopFrom, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEONavigationScheduledTransitLinkSummary _readStopTo]((uint64_t)self);
  return -[GEONavigationTransitStopSummary hasGreenTeaWithValue:](self->_stopTo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEONavigationScheduledTransitLinkSummary readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 14) = self->_readerMarkPos;
  *((_DWORD *)v6 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v6[2] = (id)self->_lineID;
    *((_BYTE *)v6 + 68) |= 1u;
    flags = (char)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v6[4] = *(id *)&self->_scheduledDeparture;
  *((_BYTE *)v6 + 68) |= 4u;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
LABEL_4:
    v6[3] = *(id *)&self->_scheduledArrival;
    *((_BYTE *)v6 + 68) |= 2u;
  }
LABEL_5:
  if (self->_stopFrom)
  {
    objc_msgSend(v6, "setStopFrom:");
    v4 = v6;
  }
  if (self->_stopTo)
  {
    objc_msgSend(v6, "setStopTo:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  id v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEONavigationScheduledTransitLinkSummary readAll:](self, "readAll:", 0);
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      *(_QWORD *)(v5 + 16) = self->_lineID;
      *(_BYTE *)(v5 + 68) |= 1u;
      flags = (char)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 2) == 0)
        {
LABEL_9:
          v10 = -[GEONavigationTransitStopSummary copyWithZone:](self->_stopFrom, "copyWithZone:", a3);
          v11 = *(void **)(v5 + 40);
          *(_QWORD *)(v5 + 40) = v10;

          v12 = -[GEONavigationTransitStopSummary copyWithZone:](self->_stopTo, "copyWithZone:", a3);
          v8 = *(id *)(v5 + 48);
          *(_QWORD *)(v5 + 48) = v12;
          goto LABEL_10;
        }
LABEL_8:
        *(double *)(v5 + 24) = self->_scheduledArrival;
        *(_BYTE *)(v5 + 68) |= 2u;
        goto LABEL_9;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 32) = self->_scheduledDeparture;
    *(_BYTE *)(v5 + 68) |= 4u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEONavigationScheduledTransitLinkSummaryReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_10:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEONavigationTransitStopSummary *stopFrom;
  GEONavigationTransitStopSummary *stopTo;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_21;
  -[GEONavigationScheduledTransitLinkSummary readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 1) == 0 || self->_lineID != *((_QWORD *)v4 + 2))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 1) != 0)
  {
LABEL_21:
    v7 = 0;
    goto LABEL_22;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 4) == 0 || self->_scheduledDeparture != *((double *)v4 + 4))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 4) != 0)
  {
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 68) & 2) == 0 || self->_scheduledArrival != *((double *)v4 + 3))
      goto LABEL_21;
  }
  else if ((*((_BYTE *)v4 + 68) & 2) != 0)
  {
    goto LABEL_21;
  }
  stopFrom = self->_stopFrom;
  if ((unint64_t)stopFrom | *((_QWORD *)v4 + 5)
    && !-[GEONavigationTransitStopSummary isEqual:](stopFrom, "isEqual:"))
  {
    goto LABEL_21;
  }
  stopTo = self->_stopTo;
  if ((unint64_t)stopTo | *((_QWORD *)v4 + 6))
    v7 = -[GEONavigationTransitStopSummary isEqual:](stopTo, "isEqual:");
  else
    v7 = 1;
LABEL_22:

  return v7;
}

- (unint64_t)hash
{
  char flags;
  unint64_t v4;
  double scheduledDeparture;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  double scheduledArrival;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;

  -[GEONavigationScheduledTransitLinkSummary readAll:](self, "readAll:", 1);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    v4 = 2654435761u * self->_lineID;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    goto LABEL_8;
LABEL_3:
  scheduledDeparture = self->_scheduledDeparture;
  v6 = -scheduledDeparture;
  if (scheduledDeparture >= 0.0)
    v6 = self->_scheduledDeparture;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((flags & 2) != 0)
  {
    scheduledArrival = self->_scheduledArrival;
    v12 = -scheduledArrival;
    if (scheduledArrival >= 0.0)
      v12 = self->_scheduledArrival;
    v13 = floor(v12 + 0.5);
    v14 = (v12 - v13) * 1.84467441e19;
    v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  v15 = v9 ^ v4 ^ v10 ^ -[GEONavigationTransitStopSummary hash](self->_stopFrom, "hash");
  return v15 ^ -[GEONavigationTransitStopSummary hash](self->_stopTo, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  GEONavigationTransitStopSummary *stopFrom;
  uint64_t v7;
  GEONavigationTransitStopSummary *stopTo;
  uint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "readAll:", 0);
  v4 = v10;
  v5 = *((_BYTE *)v10 + 68);
  if ((v5 & 1) != 0)
  {
    self->_lineID = *((_QWORD *)v10 + 2);
    *(_BYTE *)&self->_flags |= 1u;
    v5 = *((_BYTE *)v10 + 68);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v10 + 68) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_scheduledDeparture = *((double *)v10 + 4);
  *(_BYTE *)&self->_flags |= 4u;
  if ((*((_BYTE *)v10 + 68) & 2) != 0)
  {
LABEL_4:
    self->_scheduledArrival = *((double *)v10 + 3);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_5:
  stopFrom = self->_stopFrom;
  v7 = *((_QWORD *)v10 + 5);
  if (stopFrom)
  {
    if (!v7)
      goto LABEL_14;
    -[GEONavigationTransitStopSummary mergeFrom:](stopFrom, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_14;
    -[GEONavigationScheduledTransitLinkSummary setStopFrom:](self, "setStopFrom:");
  }
  v4 = v10;
LABEL_14:
  stopTo = self->_stopTo;
  v9 = v4[6];
  if (stopTo)
  {
    if (v9)
    {
      -[GEONavigationTransitStopSummary mergeFrom:](stopTo, "mergeFrom:");
LABEL_19:
      v4 = v10;
    }
  }
  else if (v9)
  {
    -[GEONavigationScheduledTransitLinkSummary setStopTo:](self, "setStopTo:");
    goto LABEL_19;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopTo, 0);
  objc_storeStrong((id *)&self->_stopFrom, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEONavigationScheduledTransitLinkSummary)initWithTransitTripRouteStep:(id)a3 originSummary:(id)a4 destinationSummary:(id)a5
{
  id v8;
  id v9;
  id v10;
  GEONavigationScheduledTransitLinkSummary *v11;
  void *v12;
  void *v13;
  void *v14;
  GEONavigationScheduledTransitLinkSummary *v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[GEONavigationScheduledTransitLinkSummary init](self, "init");
  if (v11)
  {
    objc_msgSend(v8, "transitLine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONavigationScheduledTransitLinkSummary setLineID:](v11, "setLineID:", objc_msgSend(v12, "muid"));

    objc_msgSend(v8, "departureTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    -[GEONavigationScheduledTransitLinkSummary setScheduledDeparture:](v11, "setScheduledDeparture:");

    objc_msgSend(v8, "arrivalTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    -[GEONavigationScheduledTransitLinkSummary setScheduledArrival:](v11, "setScheduledArrival:");

    -[GEONavigationScheduledTransitLinkSummary setStopFrom:](v11, "setStopFrom:", v9);
    -[GEONavigationScheduledTransitLinkSummary setStopTo:](v11, "setStopTo:", v10);
    v15 = v11;
  }

  return v11;
}

@end
