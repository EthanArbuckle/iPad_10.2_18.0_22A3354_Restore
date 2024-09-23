@implementation GEOPDTransitTripStopTimeFilter

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_7238;
      else
        v6 = (int *)&readAll__nonRecursiveTag_7239;
      GEOPDTransitTripStopTimeFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  }
}

- (GEOPDTransitTripStopTimeFilter)init
{
  GEOPDTransitTripStopTimeFilter *v2;
  GEOPDTransitTripStopTimeFilter *v3;
  GEOPDTransitTripStopTimeFilter *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDTransitTripStopTimeFilter;
  v2 = -[GEOPDTransitTripStopTimeFilter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDTransitTripStopTimeFilter)initWithData:(id)a3
{
  GEOPDTransitTripStopTimeFilter *v3;
  GEOPDTransitTripStopTimeFilter *v4;
  GEOPDTransitTripStopTimeFilter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDTransitTripStopTimeFilter;
  v3 = -[GEOPDTransitTripStopTimeFilter initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)setDeparturePredicateCountdown:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 8u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

- (void)setDeparturePredicateStamp:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_BYTE *)(a1 + 68) |= 0x10u;
    *(_BYTE *)(a1 + 68) |= 0x20u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

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
  v8.super_class = (Class)GEOPDTransitTripStopTimeFilter;
  -[GEOPDTransitTripStopTimeFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDTransitTripStopTimeFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDTransitTripStopTimeFilter _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  char v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  -[GEOPDTransitTripStopTimeFilter readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
  if ((*(_BYTE *)(a1 + 68) & 8) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDTransitTripStopTimeFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeparturePredicateCountdown_tags_7236);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  v7 = *(id *)(a1 + 24);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("departurePredicateCountdown");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("departure_predicate_countdown");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
  if ((*(_BYTE *)(a1 + 68) & 0x10) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDTransitTripStopTimeFilterReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeparturePredicateStamp_tags_7237);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  v13 = *(id *)(a1 + 32);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("departurePredicateStamp");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("departure_predicate_stamp");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  v17 = *(_BYTE *)(a1 + 68);
  if ((v17 & 1) != 0)
  {
    if (a2)
      v18 = CFSTR("operatingHoursRange");
    else
      v18 = CFSTR("operating_hours_range");
    _GEOPDTimeRangeDictionaryRepresentation((unsigned int *)(a1 + 40), a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, v18);

    v17 = *(_BYTE *)(a1 + 68);
  }
  if ((v17 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("includeRealTimeDepartures");
    else
      v21 = CFSTR("include_real_time_departures");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __60__GEOPDTransitTripStopTimeFilter__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDTransitTripStopTimeFilter _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __60__GEOPDTransitTripStopTimeFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDTransitTripStopTimeFilterReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v7;
  void *v8;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_BYTE *)&self->_flags & 0x38) == 0))
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 0);
    if (self->_departurePredicateCountdown)
      PBDataWriterWriteSubmessage();
    if (self->_departurePredicateStamp)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterPlaceMark();
      GEOPDTimeRangeWriteTo((uint64_t)&self->_operatingHoursRange);
      PBDataWriterRecallMark();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
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
  char flags;
  $B85216D09A238EDB5177F50F3CAD2EB5 has;
  PBUnknownFields *v15;

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
      GEOPDTransitTripStopTimeFilterReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 0);
  v9 = -[GEOPDDeparturePredicate copyWithZone:](self->_departurePredicateCountdown, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  v11 = -[GEOPDDeparturePredicate copyWithZone:](self->_departurePredicateStamp, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    has = self->_operatingHoursRange._has;
    *(_QWORD *)(v5 + 40) = *(_QWORD *)&self->_operatingHoursRange._duration;
    *($B85216D09A238EDB5177F50F3CAD2EB5 *)(v5 + 48) = has;
    *(_BYTE *)(v5 + 68) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 64) = self->_includeRealTimeDepartures;
    *(_BYTE *)(v5 + 68) |= 2u;
  }
  v15 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v15;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int *v4;
  GEOPDDeparturePredicate *departurePredicateCountdown;
  GEOPDDeparturePredicate *departurePredicateStamp;
  BOOL v8;

  v4 = (unsigned int *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 1);
  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)v4, 1);
  departurePredicateCountdown = self->_departurePredicateCountdown;
  if ((unint64_t)departurePredicateCountdown | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateCountdown, "isEqual:"))
      goto LABEL_17;
  }
  departurePredicateStamp = self->_departurePredicateStamp;
  if ((unint64_t)departurePredicateStamp | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDDeparturePredicate isEqual:](departurePredicateStamp, "isEqual:"))
      goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v4[17] & 1) == 0)
      goto LABEL_17;
    if (*(_QWORD *)&self->_operatingHoursRange._duration != *((_QWORD *)v4 + 5)
      || *(_DWORD *)&self->_operatingHoursRange._has != (unint64_t)v4[12])
    {
      goto LABEL_17;
    }
  }
  else if ((v4[17] & 1) != 0)
  {
    goto LABEL_17;
  }
  v8 = (v4[17] & 2) == 0;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v4[17] & 2) == 0)
    {
LABEL_17:
      v8 = 0;
      goto LABEL_18;
    }
    if (self->_includeRealTimeDepartures)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_17;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_17;
    }
    v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  -[GEOPDTransitTripStopTimeFilter readAll:]((uint64_t)self, 1);
  v3 = -[GEOPDDeparturePredicate hash](self->_departurePredicateCountdown, "hash");
  v4 = -[GEOPDDeparturePredicate hash](self->_departurePredicateStamp, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v5 = PBHashBytes();
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  v5 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v6 = 2654435761 * self->_includeRealTimeDepartures;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_departurePredicateStamp, 0);
  objc_storeStrong((id *)&self->_departurePredicateCountdown, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
