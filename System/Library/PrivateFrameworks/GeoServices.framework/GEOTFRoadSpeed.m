@implementation GEOTFRoadSpeed

- (GEOTFRoadSpeed)init
{
  GEOTFRoadSpeed *v2;
  GEOTFRoadSpeed *v3;
  GEOTFRoadSpeed *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTFRoadSpeed;
  v2 = -[GEOTFRoadSpeed init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTFRoadSpeed)initWithData:(id)a3
{
  GEOTFRoadSpeed *v3;
  GEOTFRoadSpeed *v4;
  GEOTFRoadSpeed *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTFRoadSpeed;
  v3 = -[GEOTFRoadSpeed initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedFloatClear();
  PBRepeatedFloatClear();
  PBRepeatedInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTFRoadSpeed;
  -[GEOTFRoadSpeed dealloc](&v3, sel_dealloc);
}

- (void)addPredictedSpeed:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    if ((*(_WORD *)(a1 + 160) & 0x800) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOTFRoadSpeedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPredictedSpeeds_tags_235);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    -[GEOTFRoadSpeed _addNoFlagsPredictedSpeed:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 160) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
    *(_WORD *)(a1 + 160) |= 0x2000u;
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
    v4 = *(void **)(a1 + 104);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 104);
      *(_QWORD *)(a1 + 104) = v5;

      v4 = *(void **)(a1 + 104);
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
  v8.super_class = (Class)GEOTFRoadSpeed;
  -[GEOTFRoadSpeed description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTFRoadSpeed dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTFRoadSpeed _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  double v6;
  __int16 v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  __int16 v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  double v31;
  __int16 v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOTFRoadSpeed readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 88));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("geoid"));

  v7 = *(_WORD *)(a1 + 160);
  if ((v7 & 0x20) != 0)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 152);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v9 = CFSTR("startOffset");
    else
      v9 = CFSTR("start_offset");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

    v7 = *(_WORD *)(a1 + 160);
  }
  if ((v7 & 8) != 0)
  {
    LODWORD(v6) = *(_DWORD *)(a1 + 144);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("endOffset");
    else
      v11 = CFSTR("end_offset");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v7 = *(_WORD *)(a1 + 160);
  }
  if ((v7 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 156));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("hidden"));

  }
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v14 = *(id *)(a1 + 104);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v49 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "addObject:", v19);

        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("predictedSpeed");
    else
      v20 = CFSTR("predicted_speed");
    objc_msgSend(v4, "setObject:forKey:", v13, v20);

  }
  v21 = *(_WORD *)(a1 + 160);
  if ((v21 & 1) != 0)
  {
    v22 = *(int *)(a1 + 132);
    if (v22 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = off_1E1C023B8[v22];
    }
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("color"));

    v21 = *(_WORD *)(a1 + 160);
  }
  if ((v21 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 148));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v25 = CFSTR("speedKph");
    else
      v25 = CFSTR("speed_kph");
    objc_msgSend(v4, "setObject:forKey:", v24, v25);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 160) & 0x1000) == 0)
  {
    v26 = *(void **)(a1 + 8);
    if (v26)
    {
      v27 = v26;
      objc_sync_enter(v27);
      GEOTFRoadSpeedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readZilch_tags_237);
      objc_sync_exit(v27);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v28 = *(id *)(a1 + 112);
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v28, "base64EncodedStringWithOptions:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("zilch"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("zilch"));
    }
  }

  v32 = *(_WORD *)(a1 + 160);
  if ((v32 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v34 = CFSTR("decayTimeWindowInMinutes");
    else
      v34 = CFSTR("decay_time_window_in_minutes");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v32 = *(_WORD *)(a1 + 160);
  }
  if ((v32 & 2) != 0)
  {
    LODWORD(v31) = *(_DWORD *)(a1 + 136);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("confidence"));

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedFloatNSArray();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v37 = CFSTR("latitudeCoordinates");
    else
      v37 = CFSTR("latitude_coordinates");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  if (*(_QWORD *)(a1 + 72))
  {
    PBRepeatedFloatNSArray();
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("longitudeCoordinates");
    else
      v39 = CFSTR("longitude_coordinates");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedInt64NSArray();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("geoIds");
    else
      v41 = CFSTR("geo_ids");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
  if ((*(_WORD *)(a1 + 160) & 0x400) == 0)
  {
    v42 = *(void **)(a1 + 8);
    if (v42)
    {
      v43 = v42;
      objc_sync_enter(v43);
      GEOTFRoadSpeedReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOpenlr_tags_239);
      objc_sync_exit(v43);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  v44 = *(id *)(a1 + 96);
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "base64EncodedStringWithOptions:", 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v46, CFSTR("openlr"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v44, CFSTR("openlr"));
    }
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTFRoadSpeed _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 128));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_248;
      else
        v6 = (int *)&readAll__nonRecursiveTag_249;
      GEOTFRoadSpeedReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOTFRoadSpeedCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 128));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOTFRoadSpeedReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int16 v11;
  __int16 v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x3F80) == 0)
    {
      v16 = self->_reader;
      objc_sync_enter(v16);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v17);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v16);
      goto LABEL_43;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 0);
  PBDataWriterWriteSint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
    if ((flags & 8) == 0)
      goto LABEL_5;
LABEL_40:
    PBDataWriterWriteFloatField();
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  PBDataWriterWriteFloatField();
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_40;
LABEL_5:
  if ((flags & 0x40) != 0)
LABEL_6:
    PBDataWriterWriteBOOLField();
LABEL_7:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_predictedSpeeds;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v11 = (__int16)self->_flags;
  if ((v11 & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x10) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_zilch)
    PBDataWriterWriteDataField();
  v12 = (__int16)self->_flags;
  if ((v12 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v12 = (__int16)self->_flags;
  }
  if ((v12 & 2) != 0)
    PBDataWriterWriteFloatField();
  if (self->_latitudeCoordinates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_latitudeCoordinates.count)
    {
      v13 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v13;
      }
      while (v13 < self->_latitudeCoordinates.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_longitudeCoordinates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_longitudeCoordinates.count)
    {
      v14 = 0;
      do
      {
        PBDataWriterWriteFloatField();
        ++v14;
      }
      while (v14 < self->_longitudeCoordinates.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_geoIds.count)
  {
    v15 = 0;
    do
    {
      PBDataWriterWriteSint64Field();
      ++v15;
    }
    while (v15 < self->_geoIds.count);
  }
  if (self->_openlr)
    PBDataWriterWriteDataField();
LABEL_43:

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
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x2000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOTFRoadSpeedReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_25;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 0);
  *(_QWORD *)(v5 + 88) = self->_geoid;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
    if ((flags & 8) == 0)
      goto LABEL_7;
LABEL_27:
    *(float *)(v5 + 144) = self->_endOffset;
    *(_WORD *)(v5 + 160) |= 8u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  *(float *)(v5 + 152) = self->_startOffset;
  *(_WORD *)(v5 + 160) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
    goto LABEL_27;
LABEL_7:
  if ((flags & 0x40) != 0)
  {
LABEL_8:
    *(_BYTE *)(v5 + 156) = self->_hidden;
    *(_WORD *)(v5 + 160) |= 0x40u;
  }
LABEL_9:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_predictedSpeeds;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v10);
        v14 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        -[GEOTFRoadSpeed addPredictedSpeed:](v5, v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = (__int16)self->_flags;
  if ((v15 & 1) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_color;
    *(_WORD *)(v5 + 160) |= 1u;
    v15 = (__int16)self->_flags;
  }
  if ((v15 & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_speedKph;
    *(_WORD *)(v5 + 160) |= 0x10u;
  }
  v16 = -[NSData copyWithZone:](self->_zilch, "copyWithZone:", a3, (_QWORD)v21);
  v17 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v16;

  v18 = (__int16)self->_flags;
  if ((v18 & 4) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_decayTimeWindowInMinutes;
    *(_WORD *)(v5 + 160) |= 4u;
    v18 = (__int16)self->_flags;
  }
  if ((v18 & 2) != 0)
  {
    *(float *)(v5 + 136) = self->_confidence;
    *(_WORD *)(v5 + 160) |= 2u;
  }
  PBRepeatedFloatCopy();
  PBRepeatedFloatCopy();
  PBRepeatedInt64Copy();
  v19 = -[NSData copyWithZone:](self->_openlr, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v19;
LABEL_25:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *predictedSpeeds;
  NSData *zilch;
  NSData *openlr;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_52;
  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 1);
  -[GEOTFRoadSpeed readAll:]((uint64_t)v4, 1);
  if (self->_geoid != *((_QWORD *)v4 + 11))
    goto LABEL_52;
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 80);
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_startOffset != *((float *)v4 + 38))
      goto LABEL_52;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_endOffset != *((float *)v4 + 36))
      goto LABEL_52;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0)
      goto LABEL_52;
    if (self->_hidden)
    {
      if (!*((_BYTE *)v4 + 156))
        goto LABEL_52;
    }
    else if (*((_BYTE *)v4 + 156))
    {
      goto LABEL_52;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_52;
  }
  predictedSpeeds = self->_predictedSpeeds;
  if ((unint64_t)predictedSpeeds | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](predictedSpeeds, "isEqual:"))
      goto LABEL_52;
    flags = (__int16)self->_flags;
    v6 = *((_WORD *)v4 + 80);
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_color != *((_DWORD *)v4 + 33))
      goto LABEL_52;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_speedKph != *((_DWORD *)v4 + 37))
      goto LABEL_52;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_52;
  }
  zilch = self->_zilch;
  if ((unint64_t)zilch | *((_QWORD *)v4 + 14))
  {
    if (-[NSData isEqual:](zilch, "isEqual:"))
    {
      flags = (__int16)self->_flags;
      v6 = *((_WORD *)v4 + 80);
      goto LABEL_37;
    }
LABEL_52:
    v10 = 0;
    goto LABEL_53;
  }
LABEL_37:
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_decayTimeWindowInMinutes != *((_DWORD *)v4 + 35))
      goto LABEL_52;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_52;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_confidence != *((float *)v4 + 34))
      goto LABEL_52;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_52;
  }
  if (!PBRepeatedFloatIsEqual()
    || !PBRepeatedFloatIsEqual()
    || !PBRepeatedInt64IsEqual())
  {
    goto LABEL_52;
  }
  openlr = self->_openlr;
  if ((unint64_t)openlr | *((_QWORD *)v4 + 12))
    v10 = -[NSData isEqual:](openlr, "isEqual:");
  else
    v10 = 1;
LABEL_53:

  return v10;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  float startOffset;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  float endOffset;
  double v11;
  long double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  float confidence;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t geoid;

  -[GEOTFRoadSpeed readAll:]((uint64_t)self, 1);
  geoid = self->_geoid;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) != 0)
  {
    startOffset = self->_startOffset;
    v6 = startOffset;
    if (startOffset < 0.0)
      v6 = -startOffset;
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
  if ((flags & 8) != 0)
  {
    endOffset = self->_endOffset;
    v11 = endOffset;
    if (endOffset < 0.0)
      v11 = -endOffset;
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
  if ((flags & 0x40) != 0)
    v14 = 2654435761 * self->_hidden;
  else
    v14 = 0;
  v15 = -[NSMutableArray hash](self->_predictedSpeeds, "hash");
  v16 = (__int16)self->_flags;
  if ((v16 & 1) != 0)
  {
    v17 = 2654435761 * self->_color;
    if ((v16 & 0x10) != 0)
      goto LABEL_22;
  }
  else
  {
    v17 = 0;
    if ((v16 & 0x10) != 0)
    {
LABEL_22:
      v18 = 2654435761 * self->_speedKph;
      goto LABEL_25;
    }
  }
  v18 = 0;
LABEL_25:
  v19 = -[NSData hash](self->_zilch, "hash");
  v20 = (__int16)self->_flags;
  if ((v20 & 4) != 0)
  {
    v21 = 2654435761 * self->_decayTimeWindowInMinutes;
    if ((v20 & 2) != 0)
      goto LABEL_27;
LABEL_32:
    v26 = 0;
    goto LABEL_35;
  }
  v21 = 0;
  if ((v20 & 2) == 0)
    goto LABEL_32;
LABEL_27:
  confidence = self->_confidence;
  v23 = confidence;
  if (confidence < 0.0)
    v23 = -confidence;
  v24 = floor(v23 + 0.5);
  v25 = (v23 - v24) * 1.84467441e19;
  v26 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0)
      v26 += (unint64_t)v25;
  }
  else
  {
    v26 -= (unint64_t)fabs(v25);
  }
LABEL_35:
  v27 = v26 ^ PBRepeatedFloatHash();
  v28 = v27 ^ PBRepeatedFloatHash();
  v29 = v28 ^ PBRepeatedInt64Hash();
  return v4 ^ v9 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v21 ^ (2654435761 * geoid) ^ v29 ^ -[NSData hash](self->_openlr, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zilch, 0);
  objc_storeStrong((id *)&self->_predictedSpeeds, 0);
  objc_storeStrong((id *)&self->_openlr, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
