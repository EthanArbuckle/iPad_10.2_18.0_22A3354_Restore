@implementation GEOPDDeparture

- (GEOPDDeparture)init
{
  GEOPDDeparture *v2;
  GEOPDDeparture *v3;
  GEOPDDeparture *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDDeparture;
  v2 = -[GEOPDDeparture init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDDeparture)initWithData:(id)a3
{
  GEOPDDeparture *v3;
  GEOPDDeparture *v4;
  GEOPDDeparture *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDDeparture;
  v3 = -[GEOPDDeparture initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)absDepartureTime
{
  return self->_absDepartureTime;
}

- (void)setAbsDepartureTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x201u;
  self->_absDepartureTime = a3;
}

- (void)setHasAbsDepartureTime:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x200;
}

- (BOOL)hasAbsDepartureTime
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readVehicleNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleNumber_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasVehicleNumber
{
  -[GEOPDDeparture _readVehicleNumber]((uint64_t)self);
  return self->_vehicleNumber != 0;
}

- (NSString)vehicleNumber
{
  -[GEOPDDeparture _readVehicleNumber]((uint64_t)self);
  return self->_vehicleNumber;
}

- (void)setVehicleNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0x300u;
  objc_storeStrong((id *)&self->_vehicleNumber, a3);
}

- (double)absLiveDepartureTime
{
  return self->_absLiveDepartureTime;
}

- (void)setAbsLiveDepartureTime:(double)a3
{
  *(_WORD *)&self->_flags |= 0x202u;
  self->_absLiveDepartureTime = a3;
}

- (void)setHasAbsLiveDepartureTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 514;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasAbsLiveDepartureTime
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (BOOL)isCanceled
{
  return self->_isCanceled;
}

- (void)setIsCanceled:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x210u;
  self->_isCanceled = a3;
}

- (void)setHasIsCanceled:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 528;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasIsCanceled
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (unint64_t)referenceTripId
{
  return self->_referenceTripId;
}

- (void)setReferenceTripId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x204u;
  self->_referenceTripId = a3;
}

- (void)setHasReferenceTripId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 516;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasReferenceTripId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readRealTimeStatus
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealTimeStatus_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasRealTimeStatus
{
  -[GEOPDDeparture _readRealTimeStatus]((uint64_t)self);
  return self->_realTimeStatus != 0;
}

- (GEOFormattedString)realTimeStatus
{
  -[GEOPDDeparture _readRealTimeStatus]((uint64_t)self);
  return self->_realTimeStatus;
}

- (void)setRealTimeStatus:(id)a3
{
  *(_WORD *)&self->_flags |= 0x280u;
  objc_storeStrong((id *)&self->_realTimeStatus, a3);
}

- (int)realTimeStatusInfo
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_realTimeStatusInfo;
  else
    return 0;
}

- (void)setRealTimeStatusInfo:(int)a3
{
  *(_WORD *)&self->_flags |= 0x208u;
  self->_realTimeStatusInfo = a3;
}

- (void)setHasRealTimeStatusInfo:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 520;
  else
    v3 = 512;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRealTimeStatusInfo
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)realTimeStatusInfoAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0B8C0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRealTimeStatusInfo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCHEDULED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ON_TIME")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DELAYS")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDisplayNameOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 92) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDDepartureReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayNameOverride_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (BOOL)hasDisplayNameOverride
{
  -[GEOPDDeparture _readDisplayNameOverride]((uint64_t)self);
  return self->_displayNameOverride != 0;
}

- (NSString)displayNameOverride
{
  -[GEOPDDeparture _readDisplayNameOverride]((uint64_t)self);
  return self->_displayNameOverride;
}

- (void)setDisplayNameOverride:(id)a3
{
  *(_WORD *)&self->_flags |= 0x240u;
  objc_storeStrong((id *)&self->_displayNameOverride, a3);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDDeparture;
  -[GEOPDDeparture description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDDeparture dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDDeparture _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  __CFString *v21;
  const __CFString *v22;
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
  if ((*(_WORD *)(a1 + 92) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v6 = CFSTR("absDepartureTime");
    else
      v6 = CFSTR("abs_departure_time");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  objc_msgSend((id)a1, "vehicleNumber");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("vehicleNumber");
    else
      v8 = CFSTR("vehicle_number");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(_WORD *)(a1 + 92);
  if ((v9 & 2) == 0)
  {
    if ((v9 & 0x10) == 0)
      goto LABEL_14;
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 88));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("isCanceled");
    else
      v19 = CFSTR("is_canceled");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    if ((*(_WORD *)(a1 + 92) & 4) == 0)
      goto LABEL_19;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v17 = CFSTR("absLiveDepartureTime");
  else
    v17 = CFSTR("abs_live_departure_time");
  objc_msgSend(v4, "setObject:forKey:", v16, v17);

  v9 = *(_WORD *)(a1 + 92);
  if ((v9 & 0x10) != 0)
    goto LABEL_26;
LABEL_14:
  if ((v9 & 4) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("referenceTripId");
    else
      v11 = CFSTR("reference_trip_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
LABEL_19:
  objc_msgSend((id)a1, "realTimeStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("realTimeStatus");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("real_time_status");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  if ((*(_WORD *)(a1 + 92) & 8) != 0)
  {
    v20 = *(int *)(a1 + 84);
    if (v20 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = off_1E1C0B8C0[v20];
    }
    if (a2)
      v22 = CFSTR("realTimeStatusInfo");
    else
      v22 = CFSTR("real_time_status_info");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
  objc_msgSend((id)a1, "displayNameOverride");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("displayNameOverride");
    else
      v24 = CFSTR("display_name_override");
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
      v32[2] = __44__GEOPDDeparture__dictionaryRepresentation___block_invoke;
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
  return -[GEOPDDeparture _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __44__GEOPDDeparture__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDDeparture)initWithDictionary:(id)a3
{
  return (GEOPDDeparture *)-[GEOPDDeparture _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOFormattedString *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;

  v5 = a2;
  if (!a1)
    goto LABEL_59;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_59;
  if (a3)
    v6 = CFSTR("absDepartureTime");
  else
    v6 = CFSTR("abs_departure_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(a1, "setAbsDepartureTime:");
  }

  if (a3)
    v8 = CFSTR("vehicleNumber");
  else
    v8 = CFSTR("vehicle_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(a1, "setVehicleNumber:", v10);

  }
  if (a3)
    v11 = CFSTR("absLiveDepartureTime");
  else
    v11 = CFSTR("abs_live_departure_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "doubleValue");
    objc_msgSend(a1, "setAbsLiveDepartureTime:");
  }

  if (a3)
    v13 = CFSTR("isCanceled");
  else
    v13 = CFSTR("is_canceled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsCanceled:", objc_msgSend(v14, "BOOLValue"));

  if (a3)
    v15 = CFSTR("referenceTripId");
  else
    v15 = CFSTR("reference_trip_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setReferenceTripId:", objc_msgSend(v16, "unsignedLongLongValue"));

  if (a3)
    v17 = CFSTR("realTimeStatus");
  else
    v17 = CFSTR("real_time_status");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEOFormattedString alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEOFormattedString initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEOFormattedString initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setRealTimeStatus:", v20);

  }
  if (a3)
    v22 = CFSTR("realTimeStatusInfo");
  else
    v22 = CFSTR("real_time_status_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = v23;
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v25 = 0;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("SCHEDULED")) & 1) != 0)
    {
      v25 = 1;
    }
    else if ((objc_msgSend(v24, "isEqualToString:", CFSTR("ON_TIME")) & 1) != 0)
    {
      v25 = 2;
    }
    else if (objc_msgSend(v24, "isEqualToString:", CFSTR("DELAYS")))
    {
      v25 = 3;
    }
    else
    {
      v25 = 0;
    }

    goto LABEL_52;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v25 = objc_msgSend(v23, "intValue");
LABEL_52:
    objc_msgSend(a1, "setRealTimeStatusInfo:", v25);
  }

  if (a3)
    v26 = CFSTR("displayNameOverride");
  else
    v26 = CFSTR("display_name_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(a1, "setDisplayNameOverride:", v28);

  }
LABEL_59:

  return a1;
}

- (GEOPDDeparture)initWithJSON:(id)a3
{
  return (GEOPDDeparture *)-[GEOPDDeparture _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_2806;
    else
      v8 = (int *)&readAll__nonRecursiveTag_2807;
    GEOPDDepartureReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOFormattedString readAll:](self->_realTimeStatus, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDDepartureIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDDepartureReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  __int16 flags;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDDepartureIsDirty((uint64_t)self) & 1) == 0)
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
    goto LABEL_22;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDeparture readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    PBDataWriterWriteDoubleField();
  v5 = v9;
  if (self->_vehicleNumber)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x10) == 0)
      goto LABEL_9;
LABEL_19:
    PBDataWriterWriteBOOLField();
    v5 = v9;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  PBDataWriterWriteDoubleField();
  v5 = v9;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_19;
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    PBDataWriterWriteUint64Field();
    v5 = v9;
  }
LABEL_11:
  if (self->_realTimeStatus)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v9;
  }
  if (self->_displayNameOverride)
  {
    PBDataWriterWriteStringField();
    v5 = v9;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
LABEL_22:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPDDeparture readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 18) = self->_readerMarkPos;
  *((_DWORD *)v6 + 19) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v6[3] = *(id *)&self->_absDepartureTime;
    *((_WORD *)v6 + 46) |= 1u;
  }
  if (self->_vehicleNumber)
  {
    objc_msgSend(v6, "setVehicleNumber:");
    v4 = v6;
  }
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4[4] = *(id *)&self->_absLiveDepartureTime;
    *((_WORD *)v4 + 46) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v4 + 88) = self->_isCanceled;
  *((_WORD *)v4 + 46) |= 0x10u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_8:
    v4[7] = (id)self->_referenceTripId;
    *((_WORD *)v4 + 46) |= 4u;
  }
LABEL_9:
  if (self->_realTimeStatus)
  {
    objc_msgSend(v6, "setRealTimeStatus:");
    v4 = v6;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v4 + 21) = self->_realTimeStatusInfo;
    *((_WORD *)v4 + 46) |= 8u;
  }
  if (self->_displayNameOverride)
  {
    objc_msgSend(v6, "setDisplayNameOverride:");
    v4 = v6;
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
  __int16 flags;
  id v12;
  void *v13;
  uint64_t v14;
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
      GEOPDDepartureReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_14;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDDeparture readAll:](self, "readAll:", 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 24) = self->_absDepartureTime;
    *(_WORD *)(v5 + 92) |= 1u;
  }
  v9 = -[NSString copyWithZone:](self->_vehicleNumber, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
    if ((flags & 0x10) == 0)
      goto LABEL_9;
LABEL_16:
    *(_BYTE *)(v5 + 88) = self->_isCanceled;
    *(_WORD *)(v5 + 92) |= 0x10u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  *(double *)(v5 + 32) = self->_absLiveDepartureTime;
  *(_WORD *)(v5 + 92) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
    goto LABEL_16;
LABEL_9:
  if ((flags & 4) != 0)
  {
LABEL_10:
    *(_QWORD *)(v5 + 56) = self->_referenceTripId;
    *(_WORD *)(v5 + 92) |= 4u;
  }
LABEL_11:
  v12 = -[GEOFormattedString copyWithZone:](self->_realTimeStatus, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v12;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_realTimeStatusInfo;
    *(_WORD *)(v5 + 92) |= 8u;
  }
  v14 = -[NSString copyWithZone:](self->_displayNameOverride, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

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
  NSString *vehicleNumber;
  GEOFormattedString *realTimeStatus;
  NSString *displayNameOverride;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[GEOPDDeparture readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 46);
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_absDepartureTime != *((double *)v4 + 3))
      goto LABEL_38;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_38;
  }
  vehicleNumber = self->_vehicleNumber;
  if ((unint64_t)vehicleNumber | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](vehicleNumber, "isEqual:"))
      goto LABEL_38;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 46);
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_absLiveDepartureTime != *((double *)v4 + 4))
      goto LABEL_38;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_38;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0)
      goto LABEL_38;
    if (self->_isCanceled)
    {
      if (!*((_BYTE *)v4 + 88))
        goto LABEL_38;
    }
    else if (*((_BYTE *)v4 + 88))
    {
      goto LABEL_38;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_referenceTripId != *((_QWORD *)v4 + 7))
      goto LABEL_38;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_38;
  }
  realTimeStatus = self->_realTimeStatus;
  if ((unint64_t)realTimeStatus | *((_QWORD *)v4 + 6))
  {
    if (-[GEOFormattedString isEqual:](realTimeStatus, "isEqual:"))
    {
      flags = (__int16)self->_flags;
      v6 = *((_WORD *)v4 + 46);
      goto LABEL_31;
    }
LABEL_38:
    v10 = 0;
    goto LABEL_39;
  }
LABEL_31:
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_realTimeStatusInfo != *((_DWORD *)v4 + 21))
      goto LABEL_38;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_38;
  }
  displayNameOverride = self->_displayNameOverride;
  if ((unint64_t)displayNameOverride | *((_QWORD *)v4 + 5))
    v10 = -[NSString isEqual:](displayNameOverride, "isEqual:");
  else
    v10 = 1;
LABEL_39:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  double absDepartureTime;
  double v5;
  long double v6;
  double v7;
  NSUInteger v8;
  __int16 flags;
  unint64_t v10;
  double absLiveDepartureTime;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  -[GEOPDDeparture readAll:](self, "readAll:", 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    absDepartureTime = self->_absDepartureTime;
    v5 = -absDepartureTime;
    if (absDepartureTime >= 0.0)
      v5 = self->_absDepartureTime;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_vehicleNumber, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    absLiveDepartureTime = self->_absLiveDepartureTime;
    v12 = -absLiveDepartureTime;
    if (absLiveDepartureTime >= 0.0)
      v12 = self->_absLiveDepartureTime;
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
  if ((flags & 0x10) != 0)
  {
    v15 = 2654435761 * self->_isCanceled;
    if ((flags & 4) != 0)
      goto LABEL_19;
  }
  else
  {
    v15 = 0;
    if ((flags & 4) != 0)
    {
LABEL_19:
      v16 = 2654435761u * self->_referenceTripId;
      goto LABEL_22;
    }
  }
  v16 = 0;
LABEL_22:
  v17 = -[GEOFormattedString hash](self->_realTimeStatus, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v18 = 2654435761 * self->_realTimeStatusInfo;
  else
    v18 = 0;
  return v8 ^ v3 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18 ^ -[NSString hash](self->_displayNameOverride, "hash");
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  __int16 v5;
  GEOFormattedString *realTimeStatus;
  uint64_t v7;
  double *v8;

  v8 = (double *)a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  if ((*((_WORD *)v8 + 46) & 1) != 0)
  {
    self->_absDepartureTime = v8[3];
    *(_WORD *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v8 + 8))
  {
    -[GEOPDDeparture setVehicleNumber:](self, "setVehicleNumber:");
    v4 = v8;
  }
  v5 = *((_WORD *)v4 + 46);
  if ((v5 & 2) != 0)
  {
    self->_absLiveDepartureTime = v4[4];
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v4 + 46);
    if ((v5 & 0x10) == 0)
    {
LABEL_7:
      if ((v5 & 4) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((v5 & 0x10) == 0)
  {
    goto LABEL_7;
  }
  self->_isCanceled = *((_BYTE *)v4 + 88);
  *(_WORD *)&self->_flags |= 0x10u;
  if ((*((_WORD *)v4 + 46) & 4) != 0)
  {
LABEL_8:
    self->_referenceTripId = (unint64_t)v4[7];
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_9:
  realTimeStatus = self->_realTimeStatus;
  v7 = *((_QWORD *)v4 + 6);
  if (realTimeStatus)
  {
    if (!v7)
      goto LABEL_18;
    -[GEOFormattedString mergeFrom:](realTimeStatus, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_18;
    -[GEOPDDeparture setRealTimeStatus:](self, "setRealTimeStatus:");
  }
  v4 = v8;
LABEL_18:
  if ((*((_WORD *)v4 + 46) & 8) != 0)
  {
    self->_realTimeStatusInfo = *((_DWORD *)v4 + 21);
    *(_WORD *)&self->_flags |= 8u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[GEOPDDeparture setDisplayNameOverride:](self, "setDisplayNameOverride:");
    v4 = v8;
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
      GEOPDDepartureReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_2810);
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
    -[GEOPDDeparture readAll:](self, "readAll:", 0);
    -[GEOFormattedString clearUnknownFields:](self->_realTimeStatus, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleNumber, 0);
  objc_storeStrong((id *)&self->_realTimeStatus, 0);
  objc_storeStrong((id *)&self->_displayNameOverride, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (NSString)displayName
{
  void *v3;

  if (-[GEOPDDeparture hasDisplayNameOverride](self, "hasDisplayNameOverride"))
  {
    -[GEOPDDeparture displayNameOverride](self, "displayNameOverride");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (NSDate)departureDate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[GEOPDDeparture liveDepartureDate](self, "liveDepartureDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[GEOPDDeparture scheduledDepartureDate](self, "scheduledDepartureDate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSDate *)v6;
}

- (NSDate)scheduledDepartureDate
{
  void *v3;
  void *v4;

  if (-[GEOPDDeparture hasAbsDepartureTime](self, "hasAbsDepartureTime"))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    -[GEOPDDeparture absDepartureTime](self, "absDepartureTime");
    objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (NSDate)liveDepartureDate
{
  void *v3;
  void *v4;

  if (-[GEOPDDeparture hasAbsLiveDepartureTime](self, "hasAbsLiveDepartureTime"))
  {
    v3 = (void *)MEMORY[0x1E0C99D68];
    -[GEOPDDeparture absLiveDepartureTime](self, "absLiveDepartureTime");
    objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSDate *)v4;
}

- (int64_t)liveStatus
{
  int v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;

  if (-[GEOPDDeparture hasRealTimeStatusInfo](self, "hasRealTimeStatusInfo"))
  {
    v3 = -[GEOPDDeparture realTimeStatusInfo](self, "realTimeStatusInfo");
    if (v3 < 4)
      return qword_189CDF518[v3];
  }
  if (-[GEOPDDeparture isCanceled](self, "isCanceled"))
    return 5;
  if (!-[GEOPDDeparture hasAbsLiveDepartureTime](self, "hasAbsLiveDepartureTime"))
    return 0;
  if (!-[GEOPDDeparture hasAbsDepartureTime](self, "hasAbsDepartureTime"))
    return 1;
  -[GEOPDDeparture absDepartureTime](self, "absDepartureTime");
  v6 = v5;
  -[GEOPDDeparture absLiveDepartureTime](self, "absLiveDepartureTime");
  v8 = v7;
  v9 = v6 - GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1EDF4D5C8);
  if (v6 + 60.0 >= v8 && v9 <= v8)
    return 2;
  -[GEOPDDeparture absLiveDepartureTime](self, "absLiveDepartureTime", v9, v6 + 60.0);
  v12 = v11;
  -[GEOPDDeparture absDepartureTime](self, "absDepartureTime");
  if (v12 <= v13)
    return 3;
  else
    return 4;
}

- (GEOServerFormattedString)liveStatusString
{
  void *v3;

  if (-[GEOPDDeparture hasRealTimeStatus](self, "hasRealTimeStatus"))
  {
    -[GEOPDDeparture realTimeStatus](self, "realTimeStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (GEOServerFormattedString *)v3;
}

- (BOOL)isPastDeparture
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[GEOPDDeparture isPastDepartureRelativeToDate:usingGracePeriod:](self, "isPastDepartureRelativeToDate:usingGracePeriod:", v3, 1);

  return (char)self;
}

- (BOOL)isPastDepartureRelativeToDate:(id)a3 usingGracePeriod:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  -[GEOPDDeparture departureDate](self, "departureDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7
    && (!v4
     || ((objc_msgSend(v7, "timeIntervalSinceNow"),
          v10 = v9,
          v11 = -GEOConfigGetDouble(GeoServicesConfig_DepartureCutoffGracePeriodNetworkDefault, (uint64_t)off_1EDF4D5C8),
          v10 < 60.0)
       ? (v12 = v10 <= v11)
       : (v12 = 1),
         v12)))
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v6);
    v14 = v13 < 0.0;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
