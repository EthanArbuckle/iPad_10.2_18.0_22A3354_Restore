@implementation GEODirectionsFeedbackLogMessage

- (GEODirectionsFeedbackLogMessage)init
{
  GEODirectionsFeedbackLogMessage *v2;
  GEODirectionsFeedbackLogMessage *v3;
  GEODirectionsFeedbackLogMessage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsFeedbackLogMessage;
  v2 = -[GEODirectionsFeedbackLogMessage init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEODirectionsFeedbackLogMessage)initWithData:(id)a3
{
  GEODirectionsFeedbackLogMessage *v3;
  GEODirectionsFeedbackLogMessage *v4;
  GEODirectionsFeedbackLogMessage *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsFeedbackLogMessage;
  v3 = -[GEODirectionsFeedbackLogMessage initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readDirectionsFeedbacks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 104) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackLogMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsFeedbacks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (NSMutableArray)directionsFeedbacks
{
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  return self->_directionsFeedbacks;
}

- (void)setDirectionsFeedbacks:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *directionsFeedbacks;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  directionsFeedbacks = self->_directionsFeedbacks;
  self->_directionsFeedbacks = v4;

}

- (void)clearDirectionsFeedbacks
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  -[NSMutableArray removeAllObjects](self->_directionsFeedbacks, "removeAllObjects");
}

- (void)addDirectionsFeedback:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  -[GEODirectionsFeedbackLogMessage _addNoFlagsDirectionsFeedback:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 8u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (void)_addNoFlagsDirectionsFeedback:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 64);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 64);
      *(_QWORD *)(a1 + 64) = v5;

      v4 = *(void **)(a1 + 64);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)directionsFeedbacksCount
{
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  return -[NSMutableArray count](self->_directionsFeedbacks, "count");
}

- (id)directionsFeedbackAtIndex:(unint64_t)a3
{
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_directionsFeedbacks, "objectAtIndex:", a3);
}

+ (Class)directionsFeedbackType
{
  return (Class)objc_opt_class();
}

- (void)_readFinalLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_BYTE *)(a1 + 104) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsFeedbackLogMessageReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFinalLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

- (BOOL)hasFinalLocation
{
  -[GEODirectionsFeedbackLogMessage _readFinalLocation]((uint64_t)self);
  return self->_finalLocation != 0;
}

- (GEOLocation)finalLocation
{
  -[GEODirectionsFeedbackLogMessage _readFinalLocation]((uint64_t)self);
  return self->_finalLocation;
}

- (void)setFinalLocation:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_finalLocation, a3);
}

- (BOOL)arrivedAtDestination
{
  return self->_arrivedAtDestination;
}

- (void)setArrivedAtDestination:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x24u;
  self->_arrivedAtDestination = a3;
}

- (void)setHasArrivedAtDestination:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 36;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasArrivedAtDestination
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (GEONavigationAudioFeedback)navigationAudioFeedback
{
  __int128 v3;

  v3 = *(_OWORD *)&self->_spokenPromptsCount;
  *(_OWORD *)&retstr->_bTHFPAvailableAtEndOfNav = *(_OWORD *)&self->_manuallyChangedRouteCount;
  *(_OWORD *)&retstr->_manuallyChangedRouteCount = v3;
  *(_OWORD *)&retstr->_pauseSpokenAudioEnabled = *(_OWORD *)&self[1]._bTHFPAvailableAtEndOfNav;
  return self;
}

- (void)setNavigationAudioFeedback:(GEONavigationAudioFeedback *)a3
{
  __int128 v3;
  __int128 v4;

  *(_BYTE *)&self->_flags |= 0x21u;
  v4 = *(_OWORD *)&a3->_bTHFPAvailableAtEndOfNav;
  v3 = *(_OWORD *)&a3->_manuallyChangedRouteCount;
  *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = *(_OWORD *)&a3->_pauseSpokenAudioEnabled;
  *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = v4;
  *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v3;
}

- (void)setHasNavigationAudioFeedback:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasNavigationAudioFeedback
{
  return *(_BYTE *)&self->_flags & 1;
}

- (double)durationOfTrip
{
  return self->_durationOfTrip;
}

- (void)setDurationOfTrip:(double)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_durationOfTrip = a3;
}

- (void)setHasDurationOfTrip:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasDurationOfTrip
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
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
  v8.super_class = (Class)GEODirectionsFeedbackLogMessage;
  -[GEODirectionsFeedbackLogMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsFeedbackLogMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsFeedbackLogMessage _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  char v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 64), "count"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 64), "count"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v6 = *(id *)(a1 + 64);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v27 != v9)
              objc_enumerationMutation(v6);
            v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if ((a2 & 1) != 0)
              objc_msgSend(v11, "jsonRepresentation");
            else
              objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v26);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12, (_QWORD)v26);

          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v8);
      }

      if (a2)
        v13 = CFSTR("directionsFeedback");
      else
        v13 = CFSTR("directions_feedback");
      objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v26);

    }
    objc_msgSend((id)a1, "finalLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v14, "jsonRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("finalLocation");
      }
      else
      {
        objc_msgSend(v14, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("final_location");
      }
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    v18 = *(_BYTE *)(a1 + 104);
    if ((v18 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 100));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v20 = CFSTR("arrivedAtDestination");
      else
        v20 = CFSTR("arrived_at_destination");
      objc_msgSend(v4, "setObject:forKey:", v19, v20);

      v18 = *(_BYTE *)(a1 + 104);
      if ((v18 & 1) == 0)
      {
LABEL_24:
        if ((v18 & 2) == 0)
          return v4;
LABEL_34:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (a2)
          v24 = CFSTR("durationOfTrip");
        else
          v24 = CFSTR("duration_of_trip");
        objc_msgSend(v4, "setObject:forKey:", v23, v24);

        return v4;
      }
    }
    else if ((*(_BYTE *)(a1 + 104) & 1) == 0)
    {
      goto LABEL_24;
    }
    if (a2)
      v21 = CFSTR("navigationAudioFeedback");
    else
      v21 = CFSTR("navigation_audio_feedback");
    _GEONavigationAudioFeedbackDictionaryRepresentation((unsigned __int8 *)(a1 + 16), a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, v21);

    if ((*(_BYTE *)(a1 + 104) & 2) == 0)
      return v4;
    goto LABEL_34;
  }
  return 0;
}

- (id)jsonRepresentation
{
  return -[GEODirectionsFeedbackLogMessage _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEODirectionsFeedbackLogMessage)initWithDictionary:(id)a3
{
  return (GEODirectionsFeedbackLogMessage *)-[GEODirectionsFeedbackLogMessage _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEODirectionsFeedback *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOLocation *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v29;
  __int128 v30;
  _OWORD v31[2];
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("directionsFeedback");
      else
        v6 = CFSTR("directions_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = v5;
        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v34;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v34 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEODirectionsFeedback alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEODirectionsFeedback initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEODirectionsFeedback initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addDirectionsFeedback:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
          }
          while (v10);
        }

        v5 = v29;
      }

      if (a3)
        v17 = CFSTR("finalLocation");
      else
        v17 = CFSTR("final_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOLocation alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOLocation initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOLocation initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setFinalLocation:", v20);

      }
      if (a3)
        v22 = CFSTR("arrivedAtDestination");
      else
        v22 = CFSTR("arrived_at_destination");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setArrivedAtDestination:", objc_msgSend(v23, "BOOLValue"));

      if (a3)
        v24 = CFSTR("navigationAudioFeedback");
      else
        v24 = CFSTR("navigation_audio_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        memset(v32, 0, 44);
        _GEONavigationAudioFeedbackFromDictionaryRepresentation(v25, (uint64_t)v32, a3);
        v30 = v32[0];
        v31[0] = v32[1];
        *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)((char *)&v32[1] + 12);
        objc_msgSend(a1, "setNavigationAudioFeedback:", &v30);
      }

      if (a3)
        v26 = CFSTR("durationOfTrip");
      else
        v26 = CFSTR("duration_of_trip");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v27, "doubleValue");
        objc_msgSend(a1, "setDurationOfTrip:");
      }

    }
  }

  return a1;
}

- (GEODirectionsFeedbackLogMessage)initWithJSON:(id)a3
{
  return (GEODirectionsFeedbackLogMessage *)-[GEODirectionsFeedbackLogMessage _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3;
    GEODirectionsFeedbackLogMessageReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEODirectionsFeedbackLogMessageCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsFeedbackLogMessageIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsFeedbackLogMessageReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char flags;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODirectionsFeedbackLogMessageIsDirty((uint64_t)self) & 1) == 0)
  {
    v11 = self->_reader;
    objc_sync_enter(v11);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v12);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v11);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODirectionsFeedbackLogMessage readAll:](self, "readAll:", 0);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_directionsFeedbacks;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    if (self->_finalLocation)
      PBDataWriterWriteSubmessage();
    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterPlaceMark();
      GEONavigationAudioFeedbackWriteTo((uint64_t)&self->_navigationAudioFeedback);
      PBDataWriterRecallMark();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteDoubleField();
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEODirectionsFeedbackLogMessageClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsFeedbackLogMessage _readDirectionsFeedbacks]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_directionsFeedbacks;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEODirectionsFeedbackLogMessage _readFinalLocation]((uint64_t)self);
  return -[GEOLocation hasGreenTeaWithValue:](self->_finalLocation, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  __int128 v9;
  __int128 v10;
  char *v11;

  v11 = (char *)a3;
  -[GEODirectionsFeedbackLogMessage readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v11 + 1, self->_reader);
  *((_DWORD *)v11 + 22) = self->_readerMarkPos;
  *((_DWORD *)v11 + 23) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEODirectionsFeedbackLogMessage directionsFeedbacksCount](self, "directionsFeedbacksCount"))
  {
    objc_msgSend(v11, "clearDirectionsFeedbacks");
    v4 = -[GEODirectionsFeedbackLogMessage directionsFeedbacksCount](self, "directionsFeedbacksCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEODirectionsFeedbackLogMessage directionsFeedbackAtIndex:](self, "directionsFeedbackAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addDirectionsFeedback:", v7);

      }
    }
  }
  if (self->_finalLocation)
    objc_msgSend(v11, "setFinalLocation:");
  flags = (char)self->_flags;
  if ((flags & 4) == 0)
  {
    if ((*(_BYTE *)&self->_flags & 1) == 0)
      goto LABEL_9;
LABEL_13:
    v9 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
    v10 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
    *((_OWORD *)v11 + 1) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
    *((_OWORD *)v11 + 2) = v10;
    *(_OWORD *)(v11 + 44) = v9;
    v11[104] |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
  v11[100] = self->_arrivedAtDestination;
  v11[104] |= 4u;
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_13;
LABEL_9:
  if ((flags & 2) != 0)
  {
LABEL_10:
    *((_QWORD *)v11 + 9) = *(_QWORD *)&self->_durationOfTrip;
    v11[104] |= 2u;
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  char flags;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODirectionsFeedbackLogMessage readAll:](self, "readAll:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = self->_directionsFeedbacks;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v21 != v11)
            objc_enumerationMutation(v9);
          v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v20);
          objc_msgSend((id)v5, "addDirectionsFeedback:", v13);

        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v10);
    }

    v14 = -[GEOLocation copyWithZone:](self->_finalLocation, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v14;

    flags = (char)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_BYTE *)(v5 + 100) = self->_arrivedAtDestination;
      *(_BYTE *)(v5 + 104) |= 4u;
      flags = (char)self->_flags;
      if ((flags & 1) == 0)
      {
LABEL_14:
        if ((flags & 2) == 0)
          return (id)v5;
LABEL_15:
        *(double *)(v5 + 72) = self->_durationOfTrip;
        *(_BYTE *)(v5 + 104) |= 2u;
        return (id)v5;
      }
    }
    else if ((*(_BYTE *)&self->_flags & 1) == 0)
    {
      goto LABEL_14;
    }
    v18 = *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled;
    v19 = *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav;
    *(_OWORD *)(v5 + 32) = v19;
    *(_OWORD *)(v5 + 44) = v18;
    *(_BYTE *)(v5 + 104) |= 1u;
    if ((*(_BYTE *)&self->_flags & 2) == 0)
      return (id)v5;
    goto LABEL_15;
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
  GEODirectionsFeedbackLogMessageReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  NSMutableArray *directionsFeedbacks;
  GEOLocation *finalLocation;
  $E433E743BDDBF5A76DA75B10F34169DC flags;
  int v8;
  BOOL v9;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[GEODirectionsFeedbackLogMessage readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  directionsFeedbacks = self->_directionsFeedbacks;
  if ((unint64_t)directionsFeedbacks | *((_QWORD *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](directionsFeedbacks, "isEqual:"))
      goto LABEL_23;
  }
  finalLocation = self->_finalLocation;
  if ((unint64_t)finalLocation | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOLocation isEqual:](finalLocation, "isEqual:"))
      goto LABEL_23;
  }
  flags = self->_flags;
  v8 = v4[104];
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v8 & 4) == 0)
      goto LABEL_23;
    if (self->_arrivedAtDestination)
    {
      if (!v4[100])
        goto LABEL_23;
    }
    else if (v4[100])
    {
      goto LABEL_23;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&flags & 1) == 0 || (v8 & 1) == 0)
  {
    if (((*(_DWORD *)&flags | v8) & 1) == 0)
      goto LABEL_19;
LABEL_23:
    v9 = 0;
    goto LABEL_24;
  }
  if (memcmp(&self->_navigationAudioFeedback, v4 + 16, 0x2CuLL))
    goto LABEL_23;
LABEL_19:
  v9 = (v8 & 2) == 0;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_durationOfTrip != *((double *)v4 + 9))
      goto LABEL_23;
    v9 = 1;
  }
LABEL_24:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double durationOfTrip;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;

  -[GEODirectionsFeedbackLogMessage readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_directionsFeedbacks, "hash");
  v4 = -[GEOLocation hash](self->_finalLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v6 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_4;
LABEL_10:
    v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11;
  }
  v5 = 2654435761 * self->_arrivedAtDestination;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_9;
LABEL_3:
  v6 = PBHashBytes();
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_10;
LABEL_4:
  durationOfTrip = self->_durationOfTrip;
  v8 = -durationOfTrip;
  if (durationOfTrip >= 0.0)
    v8 = self->_durationOfTrip;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0)
      v11 += (unint64_t)v10;
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOLocation *finalLocation;
  uint64_t v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *((id *)v4 + 8);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        -[GEODirectionsFeedbackLogMessage addDirectionsFeedback:](self, "addDirectionsFeedback:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  finalLocation = self->_finalLocation;
  v11 = *((_QWORD *)v4 + 10);
  if (finalLocation)
  {
    if (v11)
      -[GEOLocation mergeFrom:](finalLocation, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEODirectionsFeedbackLogMessage setFinalLocation:](self, "setFinalLocation:");
  }
  v12 = v4[104];
  if ((v12 & 4) == 0)
  {
    if ((v4[104] & 1) == 0)
      goto LABEL_15;
LABEL_19:
    v13 = *(_OWORD *)(v4 + 44);
    v14 = *((_OWORD *)v4 + 2);
    *(_OWORD *)&self->_navigationAudioFeedback._bTHFPAvailableAtEndOfNav = *((_OWORD *)v4 + 1);
    *(_OWORD *)&self->_navigationAudioFeedback._manuallyChangedRouteCount = v14;
    *(_OWORD *)&self->_navigationAudioFeedback._pauseSpokenAudioEnabled = v13;
    *(_BYTE *)&self->_flags |= 1u;
    if ((v4[104] & 2) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
  self->_arrivedAtDestination = v4[100];
  *(_BYTE *)&self->_flags |= 4u;
  v12 = v4[104];
  if ((v12 & 1) != 0)
    goto LABEL_19;
LABEL_15:
  if ((v12 & 2) != 0)
  {
LABEL_16:
    self->_durationOfTrip = *((double *)v4 + 9);
    *(_BYTE *)&self->_flags |= 2u;
  }
LABEL_17:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalLocation, 0);
  objc_storeStrong((id *)&self->_directionsFeedbacks, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
