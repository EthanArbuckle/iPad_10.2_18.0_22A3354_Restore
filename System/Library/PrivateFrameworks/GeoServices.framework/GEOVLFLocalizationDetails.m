@implementation GEOVLFLocalizationDetails

- (GEOVLFLocalizationDetails)init
{
  GEOVLFLocalizationDetails *v2;
  GEOVLFLocalizationDetails *v3;
  GEOVLFLocalizationDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOVLFLocalizationDetails;
  v2 = -[GEOVLFLocalizationDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOVLFLocalizationDetails)initWithData:(id)a3
{
  GEOVLFLocalizationDetails *v3;
  GEOVLFLocalizationDetails *v4;
  GEOVLFLocalizationDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOVLFLocalizationDetails;
  v3 = -[GEOVLFLocalizationDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readTileDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasTileDetails
{
  -[GEOVLFLocalizationDetails _readTileDetails]((uint64_t)self);
  return self->_tileDetails != 0;
}

- (GEOVLFTileDetails)tileDetails
{
  -[GEOVLFLocalizationDetails _readTileDetails]((uint64_t)self);
  return self->_tileDetails;
}

- (void)setTileDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_tileDetails, a3);
}

- (unsigned)relativeTimestampMs
{
  return self->_relativeTimestampMs;
}

- (void)setRelativeTimestampMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_relativeTimestampMs = a3;
}

- (void)setHasRelativeTimestampMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasRelativeTimestampMs
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)runTimeMs
{
  return self->_runTimeMs;
}

- (void)setRunTimeMs:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_runTimeMs = a3;
}

- (void)setHasRunTimeMs:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1032;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasRunTimeMs
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (void)_readAlgorithmDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlgorithmDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasAlgorithmDetails
{
  -[GEOVLFLocalizationDetails _readAlgorithmDetails]((uint64_t)self);
  return self->_algorithmDetails != 0;
}

- (GEOVLFLocalizationAlgorithmDetails)algorithmDetails
{
  -[GEOVLFLocalizationDetails _readAlgorithmDetails]((uint64_t)self);
  return self->_algorithmDetails;
}

- (void)setAlgorithmDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  objc_storeStrong((id *)&self->_algorithmDetails, a3);
}

- (void)_readSuccessDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuccessDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasSuccessDetails
{
  -[GEOVLFLocalizationDetails _readSuccessDetails]((uint64_t)self);
  return self->_successDetails != 0;
}

- (GEOVLFSuccessDetails)successDetails
{
  -[GEOVLFLocalizationDetails _readSuccessDetails]((uint64_t)self);
  return self->_successDetails;
}

- (void)setSuccessDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_successDetails, a3);
}

- (void)_readFailureDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFailureDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasFailureDetails
{
  -[GEOVLFLocalizationDetails _readFailureDetails]((uint64_t)self);
  return self->_failureDetails != 0;
}

- (GEOVLFFailureDetails)failureDetails
{
  -[GEOVLFLocalizationDetails _readFailureDetails]((uint64_t)self);
  return self->_failureDetails;
}

- (void)setFailureDetails:(id)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  objc_storeStrong((id *)&self->_failureDetails, a3);
}

- (void)_readGravityVector
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGravityVector_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasGravityVector
{
  -[GEOVLFLocalizationDetails _readGravityVector]((uint64_t)self);
  return self->_gravityVector != 0;
}

- (GEOVLFGravityVector)gravityVector
{
  -[GEOVLFLocalizationDetails _readGravityVector]((uint64_t)self);
  return self->_gravityVector;
}

- (void)setGravityVector:(id)a3
{
  *(_WORD *)&self->_flags |= 0x440u;
  objc_storeStrong((id *)&self->_gravityVector, a3);
}

- (void)_readLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 116) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOVLFLocalizationDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocation_tags_9924);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasLocation
{
  -[GEOVLFLocalizationDetails _readLocation]((uint64_t)self);
  return self->_location != 0;
}

- (GEOVLFLocation)location
{
  -[GEOVLFLocalizationDetails _readLocation]((uint64_t)self);
  return self->_location;
}

- (void)setLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x480u;
  objc_storeStrong((id *)&self->_location, a3);
}

- (double)exposureTargetOffset
{
  return self->_exposureTargetOffset;
}

- (void)setExposureTargetOffset:(double)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_exposureTargetOffset = a3;
}

- (void)setHasExposureTargetOffset:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasExposureTargetOffset
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (GEOVLFPositionContextClassification)positionContextClassification
{
  *retstr = *(GEOVLFPositionContextClassification *)&self->_type;
  return self;
}

- (void)setPositionContextClassification:(GEOVLFPositionContextClassification *)a3
{
  uint64_t v3;

  *(_WORD *)&self->_flags |= 0x401u;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_positionContextClassification._indoorProbability = *(_OWORD *)&a3->_indoorProbability;
  *(_QWORD *)&self->_positionContextClassification._type = v3;
}

- (void)setHasPositionContextClassification:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasPositionContextClassification
{
  return *(_WORD *)&self->_flags & 1;
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
  v8.super_class = (Class)GEOVLFLocalizationDetails;
  -[GEOVLFLocalizationDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOVLFLocalizationDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOVLFLocalizationDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  __int16 v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  __int16 v33;
  void *v34;
  void *v35;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "tileDetails");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v5, "jsonRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("tileDetails");
      }
      else
      {
        objc_msgSend(v5, "dictionaryRepresentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = CFSTR("tile_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v7, v8);

    }
    v9 = *(_WORD *)(a1 + 116);
    if ((v9 & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v11 = CFSTR("relativeTimestampMs");
      else
        v11 = CFSTR("relative_timestamp_ms");
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

      v9 = *(_WORD *)(a1 + 116);
    }
    if ((v9 & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 112));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v13 = CFSTR("runTimeMs");
      else
        v13 = CFSTR("run_time_ms");
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    objc_msgSend((id)a1, "algorithmDetails");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v14, "jsonRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("algorithmDetails");
      }
      else
      {
        objc_msgSend(v14, "dictionaryRepresentation");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = CFSTR("algorithm_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v16, v17);

    }
    objc_msgSend((id)a1, "successDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v18, "jsonRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("successDetails");
      }
      else
      {
        objc_msgSend(v18, "dictionaryRepresentation");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = CFSTR("success_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

    }
    objc_msgSend((id)a1, "failureDetails");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v22, "jsonRepresentation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = CFSTR("failureDetails");
      }
      else
      {
        objc_msgSend(v22, "dictionaryRepresentation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = CFSTR("failure_details");
      }
      objc_msgSend(v4, "setObject:forKey:", v24, v25);

    }
    objc_msgSend((id)a1, "gravityVector");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v26, "jsonRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("gravityVector");
      }
      else
      {
        objc_msgSend(v26, "dictionaryRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("gravity_vector");
      }
      objc_msgSend(v4, "setObject:forKey:", v28, v29);

    }
    objc_msgSend((id)a1, "location");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v30, "jsonRepresentation");
      else
        objc_msgSend(v30, "dictionaryRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("location"));

    }
    v33 = *(_WORD *)(a1 + 116);
    if ((v33 & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("exposureTargetOffset"));

      v33 = *(_WORD *)(a1 + 116);
    }
    if ((v33 & 1) != 0)
    {
      _GEOVLFPositionContextClassificationDictionaryRepresentation(a1 + 16);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("positionContextClassification"));

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
  return -[GEOVLFLocalizationDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOVLFLocalizationDetails)initWithDictionary:(id)a3
{
  return (GEOVLFLocalizationDetails *)-[GEOVLFLocalizationDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOVLFTileDetails *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  GEOVLFLocalizationAlgorithmDetails *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOVLFSuccessDetails *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOVLFFailureDetails *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  GEOVLFGravityVector *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  GEOVLFLocation *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("tileDetails");
      else
        v6 = CFSTR("tile_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOVLFTileDetails alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOVLFTileDetails initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOVLFTileDetails initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setTileDetails:", v9);

      }
      if (a3)
        v11 = CFSTR("relativeTimestampMs");
      else
        v11 = CFSTR("relative_timestamp_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRelativeTimestampMs:", objc_msgSend(v12, "unsignedIntValue"));

      if (a3)
        v13 = CFSTR("runTimeMs");
      else
        v13 = CFSTR("run_time_ms");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setRunTimeMs:", objc_msgSend(v14, "unsignedIntValue"));

      if (a3)
        v15 = CFSTR("algorithmDetails");
      else
        v15 = CFSTR("algorithm_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v17 = [GEOVLFLocalizationAlgorithmDetails alloc];
        if ((a3 & 1) != 0)
          v18 = -[GEOVLFLocalizationAlgorithmDetails initWithJSON:](v17, "initWithJSON:", v16);
        else
          v18 = -[GEOVLFLocalizationAlgorithmDetails initWithDictionary:](v17, "initWithDictionary:", v16);
        v19 = (void *)v18;
        objc_msgSend(a1, "setAlgorithmDetails:", v18);

      }
      if (a3)
        v20 = CFSTR("successDetails");
      else
        v20 = CFSTR("success_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOVLFSuccessDetails alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOVLFSuccessDetails initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOVLFSuccessDetails initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setSuccessDetails:", v23);

      }
      if (a3)
        v25 = CFSTR("failureDetails");
      else
        v25 = CFSTR("failure_details");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v27 = [GEOVLFFailureDetails alloc];
        if ((a3 & 1) != 0)
          v28 = -[GEOVLFFailureDetails initWithJSON:](v27, "initWithJSON:", v26);
        else
          v28 = -[GEOVLFFailureDetails initWithDictionary:](v27, "initWithDictionary:", v26);
        v29 = (void *)v28;
        objc_msgSend(a1, "setFailureDetails:", v28);

      }
      if (a3)
        v30 = CFSTR("gravityVector");
      else
        v30 = CFSTR("gravity_vector");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = [GEOVLFGravityVector alloc];
        if ((a3 & 1) != 0)
          v33 = -[GEOVLFGravityVector initWithJSON:](v32, "initWithJSON:", v31);
        else
          v33 = -[GEOVLFGravityVector initWithDictionary:](v32, "initWithDictionary:", v31);
        v34 = (void *)v33;
        objc_msgSend(a1, "setGravityVector:", v33);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("location"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = [GEOVLFLocation alloc];
        if ((a3 & 1) != 0)
          v37 = -[GEOVLFLocation initWithJSON:](v36, "initWithJSON:", v35);
        else
          v37 = -[GEOVLFLocation initWithDictionary:](v36, "initWithDictionary:", v35);
        v38 = (void *)v37;
        objc_msgSend(a1, "setLocation:", v37);

      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("exposureTargetOffset"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v39, "doubleValue");
        objc_msgSend(a1, "setExposureTargetOffset:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("positionContextClassification"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v44 = 0uLL;
        v45 = 0;
        _GEOVLFPositionContextClassificationFromDictionaryRepresentation(v40, (uint64_t)&v44);
        v42 = v44;
        v43 = v45;
        objc_msgSend(a1, "setPositionContextClassification:", &v42);
      }

    }
  }

  return a1;
}

- (GEOVLFLocalizationDetails)initWithJSON:(id)a3
{
  return (GEOVLFLocalizationDetails *)-[GEOVLFLocalizationDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_9958;
    else
      v8 = (int *)&readAll__nonRecursiveTag_9959;
    GEOVLFLocalizationDetailsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOVLFLocalizationDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOVLFLocalizationDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOVLFLocalizationDetailsReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOVLFLocalizationDetailsIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOVLFLocalizationDetails readAll:](self, "readAll:", 0);
    if (self->_tileDetails)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 8) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_algorithmDetails)
      PBDataWriterWriteSubmessage();
    if (self->_successDetails)
      PBDataWriterWriteSubmessage();
    if (self->_failureDetails)
      PBDataWriterWriteSubmessage();
    if (self->_gravityVector)
      PBDataWriterWriteSubmessage();
    if (self->_location)
      PBDataWriterWriteSubmessage();
    v7 = (__int16)self->_flags;
    if ((v7 & 2) != 0)
    {
      PBDataWriterWriteDoubleField();
      v7 = (__int16)self->_flags;
    }
    if ((v7 & 1) != 0)
    {
      PBDataWriterPlaceMark();
      GEOVLFPositionContextClassificationWriteTo((uint64_t)&self->_positionContextClassification);
      PBDataWriterRecallMark();
    }
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOVLFLocalizationDetails _readLocation]((uint64_t)self);
  return -[GEOVLFLocation hasGreenTeaWithValue:](self->_location, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  id *v5;
  __int16 v6;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEOVLFLocalizationDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 24) = self->_readerMarkPos;
  *((_DWORD *)v8 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_tileDetails)
    objc_msgSend(v8, "setTileDetails:");
  flags = (__int16)self->_flags;
  v5 = v8;
  if ((flags & 4) != 0)
  {
    *((_DWORD *)v8 + 27) = self->_relativeTimestampMs;
    *((_WORD *)v8 + 58) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v8 + 28) = self->_runTimeMs;
    *((_WORD *)v8 + 58) |= 8u;
  }
  if (self->_algorithmDetails)
  {
    objc_msgSend(v8, "setAlgorithmDetails:");
    v5 = v8;
  }
  if (self->_successDetails)
  {
    objc_msgSend(v8, "setSuccessDetails:");
    v5 = v8;
  }
  if (self->_failureDetails)
  {
    objc_msgSend(v8, "setFailureDetails:");
    v5 = v8;
  }
  if (self->_gravityVector)
  {
    objc_msgSend(v8, "setGravityVector:");
    v5 = v8;
  }
  if (self->_location)
  {
    objc_msgSend(v8, "setLocation:");
    v5 = v8;
  }
  v6 = (__int16)self->_flags;
  if ((v6 & 2) != 0)
  {
    v5[6] = *(id *)&self->_exposureTargetOffset;
    *((_WORD *)v5 + 58) |= 2u;
    v6 = (__int16)self->_flags;
  }
  if ((v6 & 1) != 0)
  {
    v7 = *(void **)&self->_positionContextClassification._type;
    *((_OWORD *)v5 + 1) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    v5[4] = v7;
    *((_WORD *)v5 + 58) |= 1u;
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
  __int16 flags;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  __int16 v22;
  uint64_t v23;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOVLFLocalizationDetailsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOVLFLocalizationDetails readAll:](self, "readAll:", 0);
  v9 = -[GEOVLFTileDetails copyWithZone:](self->_tileDetails, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_relativeTimestampMs;
    *(_WORD *)(v5 + 116) |= 4u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_runTimeMs;
    *(_WORD *)(v5 + 116) |= 8u;
  }
  v12 = -[GEOVLFLocalizationAlgorithmDetails copyWithZone:](self->_algorithmDetails, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v12;

  v14 = -[GEOVLFSuccessDetails copyWithZone:](self->_successDetails, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  v16 = -[GEOVLFFailureDetails copyWithZone:](self->_failureDetails, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v16;

  v18 = -[GEOVLFGravityVector copyWithZone:](self->_gravityVector, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v18;

  v20 = -[GEOVLFLocation copyWithZone:](self->_location, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v20;

  v22 = (__int16)self->_flags;
  if ((v22 & 2) != 0)
  {
    *(double *)(v5 + 48) = self->_exposureTargetOffset;
    *(_WORD *)(v5 + 116) |= 2u;
    v22 = (__int16)self->_flags;
  }
  if ((v22 & 1) != 0)
  {
    v23 = *(_QWORD *)&self->_positionContextClassification._type;
    *(_OWORD *)(v5 + 16) = *(_OWORD *)&self->_positionContextClassification._indoorProbability;
    *(_QWORD *)(v5 + 32) = v23;
    *(_WORD *)(v5 + 116) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOVLFTileDetails *tileDetails;
  __int16 flags;
  __int16 v7;
  GEOVLFLocalizationAlgorithmDetails *algorithmDetails;
  GEOVLFSuccessDetails *successDetails;
  GEOVLFFailureDetails *failureDetails;
  GEOVLFGravityVector *gravityVector;
  GEOVLFLocation *location;
  __int16 v13;
  __int16 v14;
  BOOL v15;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_38;
  -[GEOVLFLocalizationDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  tileDetails = self->_tileDetails;
  if ((unint64_t)tileDetails | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOVLFTileDetails isEqual:](tileDetails, "isEqual:"))
      goto LABEL_38;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 58);
  if ((flags & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_relativeTimestampMs != *((_DWORD *)v4 + 27))
      goto LABEL_38;
  }
  else if ((v7 & 4) != 0)
  {
LABEL_38:
    v15 = 0;
    goto LABEL_39;
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_runTimeMs != *((_DWORD *)v4 + 28))
      goto LABEL_38;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_38;
  }
  algorithmDetails = self->_algorithmDetails;
  if ((unint64_t)algorithmDetails | *((_QWORD *)v4 + 5)
    && !-[GEOVLFLocalizationAlgorithmDetails isEqual:](algorithmDetails, "isEqual:"))
  {
    goto LABEL_38;
  }
  successDetails = self->_successDetails;
  if ((unint64_t)successDetails | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOVLFSuccessDetails isEqual:](successDetails, "isEqual:"))
      goto LABEL_38;
  }
  failureDetails = self->_failureDetails;
  if ((unint64_t)failureDetails | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOVLFFailureDetails isEqual:](failureDetails, "isEqual:"))
      goto LABEL_38;
  }
  gravityVector = self->_gravityVector;
  if ((unint64_t)gravityVector | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOVLFGravityVector isEqual:](gravityVector, "isEqual:"))
      goto LABEL_38;
  }
  location = self->_location;
  if ((unint64_t)location | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOVLFLocation isEqual:](location, "isEqual:"))
      goto LABEL_38;
  }
  v13 = (__int16)self->_flags;
  v14 = *((_WORD *)v4 + 58);
  if ((v13 & 2) != 0)
  {
    if ((v14 & 2) == 0 || self->_exposureTargetOffset != *((double *)v4 + 6))
      goto LABEL_38;
  }
  else if ((v14 & 2) != 0)
  {
    goto LABEL_38;
  }
  v15 = (v14 & 1) == 0;
  if ((v13 & 1) != 0)
  {
    if ((v14 & 1) != 0)
    {
      v16 = *(_QWORD *)&self->_positionContextClassification._indoorProbability == *((_QWORD *)v4 + 2)
         && *(_QWORD *)&self->_positionContextClassification._outdoorProbability == *((_QWORD *)v4 + 3);
      if (v16 && *(_QWORD *)&self->_positionContextClassification._type == *((_QWORD *)v4 + 4))
      {
        v15 = 1;
        goto LABEL_39;
      }
    }
    goto LABEL_38;
  }
LABEL_39:

  return v15;
}

- (unint64_t)hash
{
  __int16 flags;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  double exposureTargetOffset;
  double v13;
  long double v14;
  double v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;

  -[GEOVLFLocalizationDetails readAll:](self, "readAll:", 1);
  v20 = -[GEOVLFTileDetails hash](self->_tileDetails, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v18 = 2654435761 * self->_relativeTimestampMs;
    if ((flags & 8) != 0)
      goto LABEL_3;
  }
  else
  {
    v18 = 0;
    if ((flags & 8) != 0)
    {
LABEL_3:
      v4 = 2654435761 * self->_runTimeMs;
      goto LABEL_6;
    }
  }
  v4 = 0;
LABEL_6:
  v5 = -[GEOVLFLocalizationAlgorithmDetails hash](self->_algorithmDetails, "hash", v18);
  v6 = -[GEOVLFSuccessDetails hash](self->_successDetails, "hash");
  v7 = -[GEOVLFFailureDetails hash](self->_failureDetails, "hash");
  v8 = -[GEOVLFGravityVector hash](self->_gravityVector, "hash");
  v9 = -[GEOVLFLocation hash](self->_location, "hash");
  v10 = (__int16)self->_flags;
  if ((v10 & 2) != 0)
  {
    exposureTargetOffset = self->_exposureTargetOffset;
    v13 = -exposureTargetOffset;
    if (exposureTargetOffset >= 0.0)
      v13 = self->_exposureTargetOffset;
    v14 = floor(v13 + 0.5);
    v15 = (v13 - v14) * 1.84467441e19;
    v11 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabs(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  if ((v10 & 1) != 0)
    v16 = PBHashBytes();
  else
    v16 = 0;
  return v19 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOVLFTileDetails *tileDetails;
  uint64_t v6;
  __int16 v7;
  GEOVLFLocalizationAlgorithmDetails *algorithmDetails;
  uint64_t v9;
  GEOVLFSuccessDetails *successDetails;
  uint64_t v11;
  GEOVLFFailureDetails *failureDetails;
  uint64_t v13;
  GEOVLFGravityVector *gravityVector;
  uint64_t v15;
  GEOVLFLocation *location;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  _QWORD *v20;

  v20 = a3;
  objc_msgSend(v20, "readAll:", 0);
  v4 = v20;
  tileDetails = self->_tileDetails;
  v6 = v20[11];
  if (tileDetails)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOVLFTileDetails mergeFrom:](tileDetails, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOVLFLocalizationDetails setTileDetails:](self, "setTileDetails:");
  }
  v4 = v20;
LABEL_7:
  v7 = *((_WORD *)v4 + 58);
  if ((v7 & 4) != 0)
  {
    self->_relativeTimestampMs = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 4u;
    v7 = *((_WORD *)v4 + 58);
  }
  if ((v7 & 8) != 0)
  {
    self->_runTimeMs = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_flags |= 8u;
  }
  algorithmDetails = self->_algorithmDetails;
  v9 = v4[5];
  if (algorithmDetails)
  {
    if (!v9)
      goto LABEL_17;
    -[GEOVLFLocalizationAlgorithmDetails mergeFrom:](algorithmDetails, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_17;
    -[GEOVLFLocalizationDetails setAlgorithmDetails:](self, "setAlgorithmDetails:");
  }
  v4 = v20;
LABEL_17:
  successDetails = self->_successDetails;
  v11 = v4[10];
  if (successDetails)
  {
    if (!v11)
      goto LABEL_23;
    -[GEOVLFSuccessDetails mergeFrom:](successDetails, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_23;
    -[GEOVLFLocalizationDetails setSuccessDetails:](self, "setSuccessDetails:");
  }
  v4 = v20;
LABEL_23:
  failureDetails = self->_failureDetails;
  v13 = v4[7];
  if (failureDetails)
  {
    if (!v13)
      goto LABEL_29;
    -[GEOVLFFailureDetails mergeFrom:](failureDetails, "mergeFrom:");
  }
  else
  {
    if (!v13)
      goto LABEL_29;
    -[GEOVLFLocalizationDetails setFailureDetails:](self, "setFailureDetails:");
  }
  v4 = v20;
LABEL_29:
  gravityVector = self->_gravityVector;
  v15 = v4[8];
  if (gravityVector)
  {
    if (!v15)
      goto LABEL_35;
    -[GEOVLFGravityVector mergeFrom:](gravityVector, "mergeFrom:");
  }
  else
  {
    if (!v15)
      goto LABEL_35;
    -[GEOVLFLocalizationDetails setGravityVector:](self, "setGravityVector:");
  }
  v4 = v20;
LABEL_35:
  location = self->_location;
  v17 = v4[9];
  if (location)
  {
    if (!v17)
      goto LABEL_41;
    -[GEOVLFLocation mergeFrom:](location, "mergeFrom:");
  }
  else
  {
    if (!v17)
      goto LABEL_41;
    -[GEOVLFLocalizationDetails setLocation:](self, "setLocation:");
  }
  v4 = v20;
LABEL_41:
  v18 = *((_WORD *)v4 + 58);
  if ((v18 & 2) != 0)
  {
    self->_exposureTargetOffset = (double)v4[6];
    *(_WORD *)&self->_flags |= 2u;
    v18 = *((_WORD *)v4 + 58);
  }
  if ((v18 & 1) != 0)
  {
    v19 = v4[4];
    *(_OWORD *)&self->_positionContextClassification._indoorProbability = *((_OWORD *)v4 + 1);
    *(_QWORD *)&self->_positionContextClassification._type = v19;
    *(_WORD *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileDetails, 0);
  objc_storeStrong((id *)&self->_successDetails, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_gravityVector, 0);
  objc_storeStrong((id *)&self->_failureDetails, 0);
  objc_storeStrong((id *)&self->_algorithmDetails, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
