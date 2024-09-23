@implementation GEOLogMsgStateUser

- (GEOLogMsgStateUser)init
{
  GEOLogMsgStateUser *v2;
  GEOLogMsgStateUser *v3;
  GEOLogMsgStateUser *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateUser;
  v2 = -[GEOLogMsgStateUser init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateUser)initWithData:(id)a3
{
  GEOLogMsgStateUser *v3;
  GEOLogMsgStateUser *v4;
  GEOLogMsgStateUser *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateUser;
  v3 = -[GEOLogMsgStateUser initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (double)syncFirstTimestamp
{
  return self->_syncFirstTimestamp;
}

- (void)setSyncFirstTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_syncFirstTimestamp = a3;
}

- (void)setHasSyncFirstTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1040;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasSyncFirstTimestamp
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (double)syncLastTimestamp
{
  return self->_syncLastTimestamp;
}

- (void)setSyncLastTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  self->_syncLastTimestamp = a3;
}

- (void)setHasSyncLastTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1056;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasSyncLastTimestamp
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)mapsUseStartDate
{
  return self->_mapsUseStartDate;
}

- (void)setMapsUseStartDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_mapsUseStartDate = a3;
}

- (void)setHasMapsUseStartDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1032;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasMapsUseStartDate
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (double)mapsUseLastDate
{
  return self->_mapsUseLastDate;
}

- (void)setMapsUseLastDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_mapsUseLastDate = a3;
}

- (void)setHasMapsUseLastDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasMapsUseLastDate
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readHomeCountryCode
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateUserReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHomeCountryCode_tags_8015);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasHomeCountryCode
{
  -[GEOLogMsgStateUser _readHomeCountryCode]((uint64_t)self);
  return self->_homeCountryCode != 0;
}

- (NSString)homeCountryCode
{
  -[GEOLogMsgStateUser _readHomeCountryCode]((uint64_t)self);
  return self->_homeCountryCode;
}

- (void)setHomeCountryCode:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_homeCountryCode, a3);
}

- (void)_readHomeMetroRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 104) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateUserReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHomeMetroRegion_tags_8016);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasHomeMetroRegion
{
  -[GEOLogMsgStateUser _readHomeMetroRegion]((uint64_t)self);
  return self->_homeMetroRegion != 0;
}

- (NSString)homeMetroRegion
{
  -[GEOLogMsgStateUser _readHomeMetroRegion]((uint64_t)self);
  return self->_homeMetroRegion;
}

- (void)setHomeMetroRegion:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_homeMetroRegion, a3);
}

- (BOOL)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1152;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasIsTourist
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (GEOSessionID)preSyncSessionId
{
  GEOSessionID *p_preSyncSessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_preSyncSessionId = &self->_preSyncSessionId;
  high = self->_preSyncSessionId._high;
  low = p_preSyncSessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setPreSyncSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_preSyncSessionId = a3;
}

- (void)setHasPreSyncSessionId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasPreSyncSessionId
{
  return *(_WORD *)&self->_flags & 1;
}

- (BOOL)isSignedInWithDsid
{
  return self->_isSignedInWithDsid;
}

- (void)setIsSignedInWithDsid:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  self->_isSignedInWithDsid = a3;
}

- (void)setHasIsSignedInWithDsid:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1088;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasIsSignedInWithDsid
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (double)bestMapsUseStartDate
{
  return self->_bestMapsUseStartDate;
}

- (void)setBestMapsUseStartDate:(double)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_bestMapsUseStartDate = a3;
}

- (void)setHasBestMapsUseStartDate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBestMapsUseStartDate
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEOLogMsgStateUser;
  -[GEOLogMsgStateUser description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateUser dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateUser _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("syncFirstTimestamp");
    else
      v7 = CFSTR("sync_first_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

    v5 = *(_WORD *)(a1 + 104);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 80));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("syncLastTimestamp");
    else
      v16 = CFSTR("sync_last_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v5 = *(_WORD *)(a1 + 104);
    if ((v5 & 8) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
  else if ((v5 & 8) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v18 = CFSTR("mapsUseStartDate");
  else
    v18 = CFSTR("maps_use_start_date");
  objc_msgSend(v4, "setObject:forKey:", v17, v18);

  if ((*(_WORD *)(a1 + 104) & 4) != 0)
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("mapsUseLastDate");
    else
      v9 = CFSTR("maps_use_last_date");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
LABEL_14:
  objc_msgSend((id)a1, "homeCountryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("homeCountryCode");
    else
      v11 = CFSTR("home_country_code");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "homeMetroRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("homeMetroRegion");
    else
      v13 = CFSTR("home_metro_region");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  v14 = *(_WORD *)(a1 + 104);
  if ((v14 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 101));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("isTourist");
    else
      v20 = CFSTR("is_tourist");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

    v14 = *(_WORD *)(a1 + 104);
    if ((v14 & 1) == 0)
    {
LABEL_26:
      if ((v14 & 0x40) == 0)
        goto LABEL_27;
      goto LABEL_46;
    }
  }
  else if ((v14 & 1) == 0)
  {
    goto LABEL_26;
  }
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 16));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v22 = CFSTR("preSyncSessionId");
  else
    v22 = CFSTR("pre_sync_session_id");
  objc_msgSend(v4, "setObject:forKey:", v21, v22);

  v14 = *(_WORD *)(a1 + 104);
  if ((v14 & 0x40) == 0)
  {
LABEL_27:
    if ((v14 & 2) == 0)
      return v4;
    goto LABEL_50;
  }
LABEL_46:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("isSignedInWithDsid");
  else
    v24 = CFSTR("is_signed_in_with_dsid");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  if ((*(_WORD *)(a1 + 104) & 2) != 0)
  {
LABEL_50:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("bestMapsUseStartDate");
    else
      v26 = CFSTR("best_maps_use_start_date");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateUser _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateUser)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateUser *)-[GEOLogMsgStateUser _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("syncFirstTimestamp");
      else
        v6 = CFSTR("sync_first_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(a1, "setSyncFirstTimestamp:");
      }

      if (a3)
        v8 = CFSTR("syncLastTimestamp");
      else
        v8 = CFSTR("sync_last_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setSyncLastTimestamp:");
      }

      if (a3)
        v10 = CFSTR("mapsUseStartDate");
      else
        v10 = CFSTR("maps_use_start_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "doubleValue");
        objc_msgSend(a1, "setMapsUseStartDate:");
      }

      if (a3)
        v12 = CFSTR("mapsUseLastDate");
      else
        v12 = CFSTR("maps_use_last_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v13, "doubleValue");
        objc_msgSend(a1, "setMapsUseLastDate:");
      }

      if (a3)
        v14 = CFSTR("homeCountryCode");
      else
        v14 = CFSTR("home_country_code");
      objc_msgSend(v5, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = (void *)objc_msgSend(v15, "copy");
        objc_msgSend(a1, "setHomeCountryCode:", v16);

      }
      if (a3)
        v17 = CFSTR("homeMetroRegion");
      else
        v17 = CFSTR("home_metro_region");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setHomeMetroRegion:", v19);

      }
      if (a3)
        v20 = CFSTR("isTourist");
      else
        v20 = CFSTR("is_tourist");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsTourist:", objc_msgSend(v21, "BOOLValue"));

      if (a3)
        v22 = CFSTR("preSyncSessionId");
      else
        v22 = CFSTR("pre_sync_session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = 0;
        v30 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v23, &v29);
        objc_msgSend(a1, "setPreSyncSessionId:", v29, v30);
      }

      if (a3)
        v24 = CFSTR("isSignedInWithDsid");
      else
        v24 = CFSTR("is_signed_in_with_dsid");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsSignedInWithDsid:", objc_msgSend(v25, "BOOLValue"));

      if (a3)
        v26 = CFSTR("bestMapsUseStartDate");
      else
        v26 = CFSTR("best_maps_use_start_date");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v27, "doubleValue");
        objc_msgSend(a1, "setBestMapsUseStartDate:");
      }

    }
  }

  return a1;
}

- (GEOLogMsgStateUser)initWithJSON:(id)a3
{
  return (GEOLogMsgStateUser *)-[GEOLogMsgStateUser _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_8045;
    else
      v8 = (int *)&readAll__nonRecursiveTag_8046;
    GEOLogMsgStateUserReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateUserIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateUserReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  __int16 v7;
  PBDataReader *v8;
  void *v9;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x700) == 0)
    {
      v8 = self->_reader;
      objc_sync_enter(v8);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v9);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v8);
      goto LABEL_26;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateUser readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_5:
      if ((flags & 8) == 0)
        goto LABEL_6;
      goto LABEL_19;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_flags & 4) != 0)
LABEL_7:
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_homeCountryCode)
    PBDataWriterWriteStringField();
  if (self->_homeMetroRegion)
    PBDataWriterWriteStringField();
  v7 = (__int16)self->_flags;
  if ((v7 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = (__int16)self->_flags;
    if ((v7 & 1) == 0)
    {
LABEL_14:
      if ((v7 & 0x40) == 0)
        goto LABEL_15;
      goto LABEL_23;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterPlaceMark();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterRecallMark();
  v7 = (__int16)self->_flags;
  if ((v7 & 0x40) == 0)
  {
LABEL_15:
    if ((v7 & 2) == 0)
      goto LABEL_26;
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_flags & 2) != 0)
LABEL_24:
    PBDataWriterWriteDoubleField();
LABEL_26:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  __int16 v6;
  id *v7;

  v7 = (id *)a3;
  -[GEOLogMsgStateUser readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 22) = self->_readerMarkPos;
  *((_DWORD *)v7 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v7;
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v7[9] = *(id *)&self->_syncFirstTimestamp;
    *((_WORD *)v7 + 52) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  v7[10] = *(id *)&self->_syncLastTimestamp;
  *((_WORD *)v7 + 52) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  v7[8] = *(id *)&self->_mapsUseStartDate;
  *((_WORD *)v7 + 52) |= 8u;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
LABEL_5:
    v7[7] = *(id *)&self->_mapsUseLastDate;
    *((_WORD *)v7 + 52) |= 4u;
  }
LABEL_6:
  if (self->_homeCountryCode)
  {
    objc_msgSend(v7, "setHomeCountryCode:");
    v4 = v7;
  }
  if (self->_homeMetroRegion)
  {
    objc_msgSend(v7, "setHomeMetroRegion:");
    v4 = v7;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 0x80) != 0)
  {
    *((_BYTE *)v4 + 101) = self->_isTourist;
    *((_WORD *)v4 + 52) |= 0x80u;
    v6 = (__int16)self->_flags;
    if ((v6 & 1) == 0)
    {
LABEL_12:
      if ((v6 & 0x40) == 0)
        goto LABEL_13;
LABEL_22:
      *((_BYTE *)v4 + 100) = self->_isSignedInWithDsid;
      *((_WORD *)v4 + 52) |= 0x40u;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_12;
  }
  *((_OWORD *)v4 + 1) = self->_preSyncSessionId;
  *((_WORD *)v4 + 52) |= 1u;
  v6 = (__int16)self->_flags;
  if ((v6 & 0x40) != 0)
    goto LABEL_22;
LABEL_13:
  if ((v6 & 2) != 0)
  {
LABEL_14:
    v4[4] = *(id *)&self->_bestMapsUseStartDate;
    *((_WORD *)v4 + 52) |= 2u;
  }
LABEL_15:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int16 v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgStateUser readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 0x10) != 0)
    {
      *(double *)(v5 + 72) = self->_syncFirstTimestamp;
      *(_WORD *)(v5 + 104) |= 0x10u;
      flags = (__int16)self->_flags;
      if ((flags & 0x20) == 0)
      {
LABEL_7:
        if ((flags & 8) == 0)
          goto LABEL_8;
        goto LABEL_18;
      }
    }
    else if ((flags & 0x20) == 0)
    {
      goto LABEL_7;
    }
    *(double *)(v5 + 80) = self->_syncLastTimestamp;
    *(_WORD *)(v5 + 104) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_8:
      if ((flags & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
LABEL_18:
    *(double *)(v5 + 64) = self->_mapsUseStartDate;
    *(_WORD *)(v5 + 104) |= 8u;
    if ((*(_WORD *)&self->_flags & 4) == 0)
    {
LABEL_10:
      v10 = -[NSString copyWithZone:](self->_homeCountryCode, "copyWithZone:", a3);
      v11 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v10;

      v12 = -[NSString copyWithZone:](self->_homeMetroRegion, "copyWithZone:", a3);
      v13 = *(void **)(v5 + 48);
      *(_QWORD *)(v5 + 48) = v12;

      v14 = (__int16)self->_flags;
      if ((v14 & 0x80) != 0)
      {
        *(_BYTE *)(v5 + 101) = self->_isTourist;
        *(_WORD *)(v5 + 104) |= 0x80u;
        v14 = (__int16)self->_flags;
        if ((v14 & 1) == 0)
        {
LABEL_12:
          if ((v14 & 0x40) == 0)
            goto LABEL_13;
          goto LABEL_22;
        }
      }
      else if ((v14 & 1) == 0)
      {
        goto LABEL_12;
      }
      *(GEOSessionID *)(v5 + 16) = self->_preSyncSessionId;
      *(_WORD *)(v5 + 104) |= 1u;
      v14 = (__int16)self->_flags;
      if ((v14 & 0x40) == 0)
      {
LABEL_13:
        if ((v14 & 2) == 0)
          return (id)v5;
LABEL_14:
        *(double *)(v5 + 32) = self->_bestMapsUseStartDate;
        *(_WORD *)(v5 + 104) |= 2u;
        return (id)v5;
      }
LABEL_22:
      *(_BYTE *)(v5 + 100) = self->_isSignedInWithDsid;
      *(_WORD *)(v5 + 104) |= 0x40u;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        return (id)v5;
      goto LABEL_14;
    }
LABEL_9:
    *(double *)(v5 + 56) = self->_mapsUseLastDate;
    *(_WORD *)(v5 + 104) |= 4u;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOLogMsgStateUserReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int16 *v4;
  __int16 flags;
  unsigned __int16 v6;
  NSString *homeCountryCode;
  NSString *homeMetroRegion;
  $CCA7DFCF6839FE4DA1B68604F02FABCB v9;
  int v10;
  BOOL v12;

  v4 = (unsigned __int16 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  -[GEOLogMsgStateUser readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = v4[52];
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_syncFirstTimestamp != *((double *)v4 + 9))
      goto LABEL_55;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_55;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_syncLastTimestamp != *((double *)v4 + 10))
      goto LABEL_55;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_55;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_mapsUseStartDate != *((double *)v4 + 8))
      goto LABEL_55;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_55;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_mapsUseLastDate != *((double *)v4 + 7))
      goto LABEL_55;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_55;
  }
  homeCountryCode = self->_homeCountryCode;
  if ((unint64_t)homeCountryCode | *((_QWORD *)v4 + 5)
    && !-[NSString isEqual:](homeCountryCode, "isEqual:"))
  {
    goto LABEL_55;
  }
  homeMetroRegion = self->_homeMetroRegion;
  if ((unint64_t)homeMetroRegion | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](homeMetroRegion, "isEqual:"))
      goto LABEL_55;
  }
  v9 = self->_flags;
  v10 = v4[52];
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0)
      goto LABEL_55;
    if (self->_isTourist)
    {
      if (!*((_BYTE *)v4 + 101))
        goto LABEL_55;
    }
    else if (*((_BYTE *)v4 + 101))
    {
      goto LABEL_55;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&v9 & 1) != 0 && (v10 & 1) != 0)
  {
    if (self->_preSyncSessionId._high != *((_QWORD *)v4 + 2) || self->_preSyncSessionId._low != *((_QWORD *)v4 + 3))
      goto LABEL_55;
  }
  else if (((*(_DWORD *)&v9 | v10) & 1) != 0)
  {
    goto LABEL_55;
  }
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) != 0)
    {
      if (self->_isSignedInWithDsid)
      {
        if (!*((_BYTE *)v4 + 100))
          goto LABEL_55;
        goto LABEL_51;
      }
      if (!*((_BYTE *)v4 + 100))
        goto LABEL_51;
    }
LABEL_55:
    v12 = 0;
    goto LABEL_56;
  }
  if ((v10 & 0x40) != 0)
    goto LABEL_55;
LABEL_51:
  v12 = (v10 & 2) == 0;
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_bestMapsUseStartDate != *((double *)v4 + 4))
      goto LABEL_55;
    v12 = 1;
  }
LABEL_56:

  return v12;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  double syncFirstTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  double syncLastTimestamp;
  double v11;
  long double v12;
  double v13;
  unint64_t v14;
  double mapsUseStartDate;
  double v16;
  long double v17;
  double v18;
  unint64_t v19;
  double mapsUseLastDate;
  double v21;
  long double v22;
  double v23;
  NSUInteger v24;
  NSUInteger v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double bestMapsUseStartDate;
  double v31;
  long double v32;
  double v33;
  unint64_t v34;

  -[GEOLogMsgStateUser readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    syncFirstTimestamp = self->_syncFirstTimestamp;
    v6 = -syncFirstTimestamp;
    if (syncFirstTimestamp >= 0.0)
      v6 = self->_syncFirstTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v4 += (unint64_t)v8;
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    v4 = 0;
  }
  if ((flags & 0x20) != 0)
  {
    syncLastTimestamp = self->_syncLastTimestamp;
    v11 = -syncLastTimestamp;
    if (syncLastTimestamp >= 0.0)
      v11 = self->_syncLastTimestamp;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  if ((flags & 8) != 0)
  {
    mapsUseStartDate = self->_mapsUseStartDate;
    v16 = -mapsUseStartDate;
    if (mapsUseStartDate >= 0.0)
      v16 = self->_mapsUseStartDate;
    v17 = floor(v16 + 0.5);
    v18 = (v16 - v17) * 1.84467441e19;
    v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0)
        v14 += (unint64_t)v18;
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    v14 = 0;
  }
  if ((flags & 4) != 0)
  {
    mapsUseLastDate = self->_mapsUseLastDate;
    v21 = -mapsUseLastDate;
    if (mapsUseLastDate >= 0.0)
      v21 = self->_mapsUseLastDate;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v24 = -[NSString hash](self->_homeCountryCode, "hash");
  v25 = -[NSString hash](self->_homeMetroRegion, "hash");
  v26 = (__int16)self->_flags;
  if ((v26 & 0x80) != 0)
  {
    v27 = 2654435761 * self->_isTourist;
    if ((v26 & 1) != 0)
    {
LABEL_35:
      v28 = PBHashBytes();
      v26 = (__int16)self->_flags;
      if ((v26 & 0x40) != 0)
        goto LABEL_36;
LABEL_43:
      v29 = 0;
      if ((v26 & 2) != 0)
        goto LABEL_37;
LABEL_44:
      v34 = 0;
      return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25 ^ v27 ^ v28 ^ v29 ^ v34;
    }
  }
  else
  {
    v27 = 0;
    if ((v26 & 1) != 0)
      goto LABEL_35;
  }
  v28 = 0;
  if ((v26 & 0x40) == 0)
    goto LABEL_43;
LABEL_36:
  v29 = 2654435761 * self->_isSignedInWithDsid;
  if ((v26 & 2) == 0)
    goto LABEL_44;
LABEL_37:
  bestMapsUseStartDate = self->_bestMapsUseStartDate;
  v31 = -bestMapsUseStartDate;
  if (bestMapsUseStartDate >= 0.0)
    v31 = self->_bestMapsUseStartDate;
  v32 = floor(v31 + 0.5);
  v33 = (v31 - v32) * 1.84467441e19;
  v34 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
  if (v33 >= 0.0)
  {
    if (v33 > 0.0)
      v34 += (unint64_t)v33;
  }
  else
  {
    v34 -= (unint64_t)fabs(v33);
  }
  return v9 ^ v4 ^ v14 ^ v19 ^ v24 ^ v25 ^ v27 ^ v28 ^ v29 ^ v34;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  __int16 v5;
  __int16 v6;
  double *v7;

  v7 = (double *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  v5 = *((_WORD *)v7 + 52);
  if ((v5 & 0x10) != 0)
  {
    self->_syncFirstTimestamp = v7[9];
    *(_WORD *)&self->_flags |= 0x10u;
    v5 = *((_WORD *)v7 + 52);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_syncLastTimestamp = v7[10];
  *(_WORD *)&self->_flags |= 0x20u;
  v5 = *((_WORD *)v7 + 52);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_18:
  self->_mapsUseStartDate = v7[8];
  *(_WORD *)&self->_flags |= 8u;
  if (((_WORD)v7[13] & 4) != 0)
  {
LABEL_5:
    self->_mapsUseLastDate = v7[7];
    *(_WORD *)&self->_flags |= 4u;
  }
LABEL_6:
  if (*((_QWORD *)v7 + 5))
  {
    -[GEOLogMsgStateUser setHomeCountryCode:](self, "setHomeCountryCode:");
    v4 = v7;
  }
  if (*((_QWORD *)v4 + 6))
  {
    -[GEOLogMsgStateUser setHomeMetroRegion:](self, "setHomeMetroRegion:");
    v4 = v7;
  }
  v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x80) != 0)
  {
    self->_isTourist = *((_BYTE *)v4 + 101);
    *(_WORD *)&self->_flags |= 0x80u;
    v6 = *((_WORD *)v4 + 52);
    if ((v6 & 1) == 0)
    {
LABEL_12:
      if ((v6 & 0x40) == 0)
        goto LABEL_13;
LABEL_22:
      self->_isSignedInWithDsid = *((_BYTE *)v4 + 100);
      *(_WORD *)&self->_flags |= 0x40u;
      if (((_WORD)v4[13] & 2) == 0)
        goto LABEL_15;
      goto LABEL_14;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_12;
  }
  self->_preSyncSessionId = (GEOSessionID)*((_OWORD *)v4 + 1);
  *(_WORD *)&self->_flags |= 1u;
  v6 = *((_WORD *)v4 + 52);
  if ((v6 & 0x40) != 0)
    goto LABEL_22;
LABEL_13:
  if ((v6 & 2) != 0)
  {
LABEL_14:
    self->_bestMapsUseStartDate = v4[4];
    *(_WORD *)&self->_flags |= 2u;
  }
LABEL_15:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeMetroRegion, 0);
  objc_storeStrong((id *)&self->_homeCountryCode, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
