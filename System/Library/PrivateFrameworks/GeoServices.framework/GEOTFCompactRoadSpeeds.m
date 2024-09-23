@implementation GEOTFCompactRoadSpeeds

- (GEOTFCompactRoadSpeeds)init
{
  GEOTFCompactRoadSpeeds *v2;
  GEOTFCompactRoadSpeeds *v3;
  GEOTFCompactRoadSpeeds *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTFCompactRoadSpeeds;
  v2 = -[GEOTFCompactRoadSpeeds init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFCompactRoadSpeeds)initWithData:(id)a3
{
  GEOTFCompactRoadSpeeds *v3;
  GEOTFCompactRoadSpeeds *v4;
  GEOTFCompactRoadSpeeds *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTFCompactRoadSpeeds;
  v3 = -[GEOTFCompactRoadSpeeds initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTFCompactRoadSpeeds;
  -[GEOTFCompactRoadSpeeds dealloc](&v3, sel_dealloc);
}

- (void)addPredictedSpeed:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 96) & 0x200) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOTFCompactRoadSpeedsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPredictedSpeeds_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    -[GEOTFCompactRoadSpeeds _addNoFlagsPredictedSpeed:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 96) |= 0x200u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
    *(_WORD *)(a1 + 96) |= 0x400u;
  }
}

- (void)_addNoFlagsPredictedSpeed:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
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
  v8.super_class = (Class)GEOTFCompactRoadSpeeds;
  -[GEOTFCompactRoadSpeeds description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTFCompactRoadSpeeds dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFCompactRoadSpeeds _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  double v5;
  void *v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOTFCompactRoadSpeeds readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedInt64NSArray();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v7 = CFSTR("geoIds");
    else
      v7 = CFSTR("geo_ids");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  v8 = *(_WORD *)(a1 + 96);
  if ((v8 & 0x20) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 88);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("startOffset");
    else
      v10 = CFSTR("start_offset");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

    v8 = *(_WORD *)(a1 + 96);
  }
  if ((v8 & 8) != 0)
  {
    LODWORD(v5) = *(_DWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("endOffset");
    else
      v12 = CFSTR("end_offset");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

    v8 = *(_WORD *)(a1 + 96);
  }
  if ((v8 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("hidden"));

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v16 = *(id *)(a1 + 48);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v38 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("predictedSpeed");
    else
      v22 = CFSTR("predicted_speed");
    objc_msgSend(v4, "setObject:forKey:", v15, v22);

  }
  v23 = *(_WORD *)(a1 + 96);
  if ((v23 & 1) != 0)
  {
    v24 = *(int *)(a1 + 68);
    if (v24 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 68));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = off_1E1C023B8[v24];
    }
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("color"));

    v23 = *(_WORD *)(a1 + 96);
  }
  if ((v23 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 84));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("speedKph");
    else
      v27 = CFSTR("speed_kph");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v23 = *(_WORD *)(a1 + 96);
  }
  if ((v23 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v29 = CFSTR("decayTimeWindowInMinutes");
    else
      v29 = CFSTR("decay_time_window_in_minutes");
    objc_msgSend(v4, "setObject:forKey:", v28, v29);

    v23 = *(_WORD *)(a1 + 96);
  }
  if ((v23 & 2) != 0)
  {
    LODWORD(v14) = *(_DWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("confidence"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  if ((*(_WORD *)(a1 + 96) & 0x100) == 0)
  {
    v31 = *(void **)(a1 + 8);
    if (v31)
    {
      v32 = v31;
      objc_sync_enter(v32);
      GEOTFCompactRoadSpeedsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOpenlr_tags);
      objc_sync_exit(v32);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  v33 = *(id *)(a1 + 40);
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "base64EncodedStringWithOptions:", 0);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("openlr"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("openlr"));
    }
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTFCompactRoadSpeeds _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1;
      GEOTFCompactRoadSpeedsReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOTFCompactRoadSpeedsCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFCompactRoadSpeedsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  unint64_t v6;
  __int16 flags;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int16 v12;
  PBDataReader *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x780) == 0))
  {
    v13 = self->_reader;
    objc_sync_enter(v13);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v14);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v13);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 0);
    if (self->_geoIds.count)
    {
      v19 = 0;
      PBDataWriterPlaceMark();
      if (self->_geoIds.count)
      {
        v6 = 0;
        do
        {
          PBDataWriterWriteSint64Field();
          ++v6;
        }
        while (v6 < self->_geoIds.count);
      }
      PBDataWriterRecallMark();
    }
    flags = (__int16)self->_flags;
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteFloatField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteFloatField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
      PBDataWriterWriteBOOLField();
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = self->_predictedSpeeds;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteSubmessage();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v9);
    }

    v12 = (__int16)self->_flags;
    if ((v12 & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      v12 = (__int16)self->_flags;
    }
    if ((v12 & 0x10) != 0)
    {
      PBDataWriterWriteUint32Field();
      v12 = (__int16)self->_flags;
    }
    if ((v12 & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      v12 = (__int16)self->_flags;
    }
    if ((v12 & 2) != 0)
      PBDataWriterWriteFloatField();
    if (self->_openlr)
      PBDataWriterWriteDataField();
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 0);
    PBRepeatedInt64Copy();
    flags = (__int16)self->_flags;
    if ((flags & 0x20) != 0)
    {
      *(float *)(v5 + 88) = self->_startOffset;
      *(_WORD *)(v5 + 96) |= 0x20u;
      flags = (__int16)self->_flags;
      if ((flags & 8) == 0)
      {
LABEL_7:
        if ((flags & 0x40) == 0)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else if ((flags & 8) == 0)
    {
      goto LABEL_7;
    }
    *(float *)(v5 + 80) = self->_endOffset;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
    {
LABEL_9:
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = self->_predictedSpeeds;
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v19 != v12)
              objc_enumerationMutation(v10);
            v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v18);
            -[GEOTFCompactRoadSpeeds addPredictedSpeed:](v5, v14);

          }
          v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v11);
      }

      v15 = (__int16)self->_flags;
      if ((v15 & 1) != 0)
      {
        *(_DWORD *)(v5 + 68) = self->_color;
        *(_WORD *)(v5 + 96) |= 1u;
        v15 = (__int16)self->_flags;
        if ((v15 & 0x10) == 0)
        {
LABEL_18:
          if ((v15 & 4) == 0)
            goto LABEL_19;
          goto LABEL_28;
        }
      }
      else if ((v15 & 0x10) == 0)
      {
        goto LABEL_18;
      }
      *(_DWORD *)(v5 + 84) = self->_speedKph;
      *(_WORD *)(v5 + 96) |= 0x10u;
      v15 = (__int16)self->_flags;
      if ((v15 & 4) == 0)
      {
LABEL_19:
        if ((v15 & 2) == 0)
        {
LABEL_21:
          v16 = -[NSData copyWithZone:](self->_openlr, "copyWithZone:", a3, (_QWORD)v18);
          v8 = *(id *)(v5 + 40);
          *(_QWORD *)(v5 + 40) = v16;
          goto LABEL_22;
        }
LABEL_20:
        *(float *)(v5 + 72) = self->_confidence;
        *(_WORD *)(v5 + 96) |= 2u;
        goto LABEL_21;
      }
LABEL_28:
      *(_DWORD *)(v5 + 76) = self->_decayTimeWindowInMinutes;
      *(_WORD *)(v5 + 96) |= 4u;
      if ((*(_WORD *)&self->_flags & 2) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
LABEL_8:
    *(_BYTE *)(v5 + 92) = self->_hidden;
    *(_WORD *)(v5 + 96) |= 0x40u;
    goto LABEL_9;
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
  GEOTFCompactRoadSpeedsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_22:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *predictedSpeeds;
  NSData *openlr;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_46;
  -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 1);
  -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)v4, 1);
  if (!PBRepeatedInt64IsEqual())
    goto LABEL_46;
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 48);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_startOffset != *((float *)v4 + 22))
      goto LABEL_46;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_endOffset != *((float *)v4 + 20))
      goto LABEL_46;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_46;
    if (self->_hidden)
    {
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_46;
    }
    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_46;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_46;
  }
  predictedSpeeds = self->_predictedSpeeds;
  if (!((unint64_t)predictedSpeeds | *((_QWORD *)v4 + 6)))
    goto LABEL_24;
  if (!-[NSMutableArray isEqual:](predictedSpeeds, "isEqual:"))
  {
LABEL_46:
    v9 = 0;
    goto LABEL_47;
  }
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 48);
LABEL_24:
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_color != *((_DWORD *)v4 + 17))
      goto LABEL_46;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_speedKph != *((_DWORD *)v4 + 21))
      goto LABEL_46;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_decayTimeWindowInMinutes != *((_DWORD *)v4 + 19))
      goto LABEL_46;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_46;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_confidence != *((float *)v4 + 18))
      goto LABEL_46;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_46;
  }
  openlr = self->_openlr;
  if ((unint64_t)openlr | *((_QWORD *)v4 + 5))
    v9 = -[NSData isEqual:](openlr, "isEqual:");
  else
    v9 = 1;
LABEL_47:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  __int16 flags;
  unint64_t v5;
  float startOffset;
  double v7;
  long double v8;
  double v9;
  unint64_t v10;
  float endOffset;
  double v12;
  long double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  float confidence;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;

  -[GEOTFCompactRoadSpeeds readAll:]((uint64_t)self, 1);
  v3 = PBRepeatedInt64Hash();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    startOffset = self->_startOffset;
    v7 = startOffset;
    if (startOffset < 0.0)
      v7 = -startOffset;
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
  if ((flags & 8) != 0)
  {
    endOffset = self->_endOffset;
    v12 = endOffset;
    if (endOffset < 0.0)
      v12 = -endOffset;
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
  if ((flags & 0x40) != 0)
    v15 = 2654435761 * self->_hidden;
  else
    v15 = 0;
  v16 = -[NSMutableArray hash](self->_predictedSpeeds, "hash");
  v17 = (__int16)self->_flags;
  if ((v17 & 1) != 0)
  {
    v18 = 2654435761 * self->_color;
    if ((v17 & 0x10) != 0)
    {
LABEL_22:
      v19 = 2654435761 * self->_speedKph;
      if ((v17 & 4) != 0)
        goto LABEL_23;
LABEL_30:
      v20 = 0;
      if ((v17 & 2) != 0)
        goto LABEL_24;
LABEL_31:
      v25 = 0;
      return v5 ^ v3 ^ v10 ^ v15 ^ v18 ^ v16 ^ v19 ^ v20 ^ v25 ^ -[NSData hash](self->_openlr, "hash");
    }
  }
  else
  {
    v18 = 0;
    if ((v17 & 0x10) != 0)
      goto LABEL_22;
  }
  v19 = 0;
  if ((v17 & 4) == 0)
    goto LABEL_30;
LABEL_23:
  v20 = 2654435761 * self->_decayTimeWindowInMinutes;
  if ((v17 & 2) == 0)
    goto LABEL_31;
LABEL_24:
  confidence = self->_confidence;
  v22 = confidence;
  if (confidence < 0.0)
    v22 = -confidence;
  v23 = floor(v22 + 0.5);
  v24 = (v22 - v23) * 1.84467441e19;
  v25 = 2654435761u * (unint64_t)fmod(v23, 1.84467441e19);
  if (v24 >= 0.0)
  {
    if (v24 > 0.0)
      v25 += (unint64_t)v24;
  }
  else
  {
    v25 -= (unint64_t)fabs(v24);
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v18 ^ v16 ^ v19 ^ v20 ^ v25 ^ -[NSData hash](self->_openlr, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictedSpeeds, 0);
  objc_storeStrong((id *)&self->_openlr, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
