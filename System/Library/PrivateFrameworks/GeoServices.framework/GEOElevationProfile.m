@implementation GEOElevationProfile

- (GEOElevationProfile)init
{
  GEOElevationProfile *v2;
  GEOElevationProfile *v3;
  GEOElevationProfile *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOElevationProfile;
  v2 = -[GEOElevationProfile init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOElevationProfile)initWithData:(id)a3
{
  GEOElevationProfile *v3;
  GEOElevationProfile *v4;
  GEOElevationProfile *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOElevationProfile;
  v3 = -[GEOElevationProfile initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)points
{
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  return self->_points;
}

- (void)setPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *points;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  points = self->_points;
  self->_points = v4;

}

- (void)clearPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_points, "removeAllObjects");
}

- (void)addPoint:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  -[GEOElevationProfile _addNoFlagsPoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsPoint:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)pointsCount
{
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_points, "count");
}

- (id)pointAtIndex:(unint64_t)a3
{
  -[GEOElevationProfile _readPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_points, "objectAtIndex:", a3);
}

+ (Class)pointType
{
  return (Class)objc_opt_class();
}

- (unsigned)sumElevationGainCm
{
  return self->_sumElevationGainCm;
}

- (void)setSumElevationGainCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_sumElevationGainCm = a3;
}

- (void)setHasSumElevationGainCm:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasSumElevationGainCm
{
  return *(_BYTE *)&self->_flags & 1;
}

- (unsigned)sumElevationLossCm
{
  return self->_sumElevationLossCm;
}

- (void)setSumElevationLossCm:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_sumElevationLossCm = a3;
}

- (void)setHasSumElevationLossCm:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasSumElevationLossCm
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readMinimumVisibleElevationRange
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMinimumVisibleElevationRange_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasMinimumVisibleElevationRange
{
  -[GEOElevationProfile _readMinimumVisibleElevationRange]((uint64_t)self);
  return self->_minimumVisibleElevationRange != 0;
}

- (GEOMinimumVisibleElevationRange)minimumVisibleElevationRange
{
  -[GEOElevationProfile _readMinimumVisibleElevationRange]((uint64_t)self);
  return self->_minimumVisibleElevationRange;
}

- (void)setMinimumVisibleElevationRange:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_minimumVisibleElevationRange, a3);
}

- (void)_readSegmentDescriptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSegmentDescriptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)segmentDescriptions
{
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  return self->_segmentDescriptions;
}

- (void)setSegmentDescriptions:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *segmentDescriptions;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  segmentDescriptions = self->_segmentDescriptions;
  self->_segmentDescriptions = v4;

}

- (void)clearSegmentDescriptions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_segmentDescriptions, "removeAllObjects");
}

- (void)addSegmentDescription:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  -[GEOElevationProfile _addNoFlagsSegmentDescription:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsSegmentDescription:(uint64_t)a1
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

- (unint64_t)segmentDescriptionsCount
{
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  return -[NSMutableArray count](self->_segmentDescriptions, "count");
}

- (id)segmentDescriptionAtIndex:(unint64_t)a3
{
  -[GEOElevationProfile _readSegmentDescriptions]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_segmentDescriptions, "objectAtIndex:", a3);
}

+ (Class)segmentDescriptionType
{
  return (Class)objc_opt_class();
}

- (void)_readElevationDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOElevationProfileReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readElevationDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasElevationDescription
{
  -[GEOElevationProfile _readElevationDescription]((uint64_t)self);
  return self->_elevationDescription != 0;
}

- (GEOFormattedString)elevationDescription
{
  -[GEOElevationProfile _readElevationDescription]((uint64_t)self);
  return self->_elevationDescription;
}

- (void)setElevationDescription:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_elevationDescription, a3);
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
  v8.super_class = (Class)GEOElevationProfile;
  -[GEOElevationProfile description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOElevationProfile dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOElevationProfile _dictionaryRepresentation:]((uint64_t)self, 0);
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
  char v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v42[4];
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v49 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("point"));
  }
  v13 = *(_BYTE *)(a1 + 76);
  if ((v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("sumElevationGainCm");
    else
      v15 = CFSTR("sum_elevation_gain_cm");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v13 = *(_BYTE *)(a1 + 76);
  }
  if ((v13 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("sumElevationLossCm");
    else
      v17 = CFSTR("sum_elevation_loss_cm");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "minimumVisibleElevationRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("minimumVisibleElevationRange");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("minimum_visible_elevation_range");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v23 = *(id *)(a1 + 48);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v45;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v45 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("segmentDescription");
    else
      v30 = CFSTR("segment_description");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  objc_msgSend((id)a1, "elevationDescription");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("elevationDescription");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("elevation_description");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  v35 = *(void **)(a1 + 16);
  if (v35)
  {
    objc_msgSend(v35, "dictionaryRepresentation");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __49__GEOElevationProfile__dictionaryRepresentation___block_invoke;
      v42[3] = &unk_1E1C00600;
      v39 = v38;
      v43 = v39;
      objc_msgSend(v37, "enumerateKeysAndObjectsUsingBlock:", v42);
      v40 = v39;

      v37 = v40;
    }
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOElevationProfile _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOElevationProfile__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOElevationProfile)initWithDictionary:(id)a3
{
  return (GEOElevationProfile *)-[GEOElevationProfile _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOPoint *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  GEOMinimumVisibleElevationRange *v22;
  uint64_t v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  GEOElevationSegmentDescription *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOFormattedString *v38;
  uint64_t v39;
  void *v40;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("point"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v42 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v48 != v10)
                objc_enumerationMutation(v7);
              v12 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v13 = [GEOPoint alloc];
                if ((a3 & 1) != 0)
                  v14 = -[GEOPoint initWithJSON:](v13, "initWithJSON:", v12);
                else
                  v14 = -[GEOPoint initWithDictionary:](v13, "initWithDictionary:", v12);
                v15 = (void *)v14;
                objc_msgSend(a1, "addPoint:", v14);

              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          }
          while (v9);
        }

        v5 = v42;
      }

      if (a3)
        v16 = CFSTR("sumElevationGainCm");
      else
        v16 = CFSTR("sum_elevation_gain_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSumElevationGainCm:", objc_msgSend(v17, "unsignedIntValue"));

      if (a3)
        v18 = CFSTR("sumElevationLossCm");
      else
        v18 = CFSTR("sum_elevation_loss_cm");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSumElevationLossCm:", objc_msgSend(v19, "unsignedIntValue"));

      if (a3)
        v20 = CFSTR("minimumVisibleElevationRange");
      else
        v20 = CFSTR("minimum_visible_elevation_range");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = [GEOMinimumVisibleElevationRange alloc];
        if ((a3 & 1) != 0)
          v23 = -[GEOMinimumVisibleElevationRange initWithJSON:](v22, "initWithJSON:", v21);
        else
          v23 = -[GEOMinimumVisibleElevationRange initWithDictionary:](v22, "initWithDictionary:", v21);
        v24 = (void *)v23;
        objc_msgSend(a1, "setMinimumVisibleElevationRange:", v23);

      }
      if (a3)
        v25 = CFSTR("segmentDescription");
      else
        v25 = CFSTR("segment_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v27 = v26;
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
        if (v28)
        {
          v29 = v28;
          v30 = *(_QWORD *)v44;
          do
          {
            for (j = 0; j != v29; ++j)
            {
              if (*(_QWORD *)v44 != v30)
                objc_enumerationMutation(v27);
              v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEOElevationSegmentDescription alloc];
                if ((a3 & 1) != 0)
                  v34 = -[GEOElevationSegmentDescription initWithJSON:](v33, "initWithJSON:", v32);
                else
                  v34 = -[GEOElevationSegmentDescription initWithDictionary:](v33, "initWithDictionary:", v32);
                v35 = (void *)v34;
                objc_msgSend(a1, "addSegmentDescription:", v34);

              }
            }
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          }
          while (v29);
        }

        v5 = v42;
      }

      if (a3)
        v36 = CFSTR("elevationDescription");
      else
        v36 = CFSTR("elevation_description");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = [GEOFormattedString alloc];
        if ((a3 & 1) != 0)
          v39 = -[GEOFormattedString initWithJSON:](v38, "initWithJSON:", v37);
        else
          v39 = -[GEOFormattedString initWithDictionary:](v38, "initWithDictionary:", v37);
        v40 = (void *)v39;
        objc_msgSend(a1, "setElevationDescription:", v39);

      }
    }
  }

  return a1;
}

- (GEOElevationProfile)initWithJSON:(id)a3
{
  return (GEOElevationProfile *)-[GEOElevationProfile _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1683;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1684;
    GEOElevationProfileReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOElevationProfileCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOElevationProfileIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOElevationProfileReadAllFrom((uint64_t)self, a3, 0);
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  PBDataReader *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOElevationProfileIsDirty((uint64_t)self) & 1) == 0)
  {
    v15 = self->_reader;
    objc_sync_enter(v15);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v16);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v15);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOElevationProfile readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v6 = self->_points;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

    flags = (char)self->_flags;
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_minimumVisibleElevationRange)
      PBDataWriterWriteSubmessage();
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v11 = self->_segmentDescriptions;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v12);
    }

    if (self->_elevationDescription)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v17);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  char flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  void *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEOElevationProfile readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 14) = self->_readerMarkPos;
  *((_DWORD *)v13 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOElevationProfile pointsCount](self, "pointsCount"))
  {
    objc_msgSend(v13, "clearPoints");
    v4 = -[GEOElevationProfile pointsCount](self, "pointsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOElevationProfile pointAtIndex:](self, "pointAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addPoint:", v7);

      }
    }
  }
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v13 + 17) = self->_sumElevationGainCm;
    *((_BYTE *)v13 + 76) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 18) = self->_sumElevationLossCm;
    *((_BYTE *)v13 + 76) |= 2u;
  }
  if (self->_minimumVisibleElevationRange)
    objc_msgSend(v13, "setMinimumVisibleElevationRange:");
  if (-[GEOElevationProfile segmentDescriptionsCount](self, "segmentDescriptionsCount"))
  {
    objc_msgSend(v13, "clearSegmentDescriptions");
    v9 = -[GEOElevationProfile segmentDescriptionsCount](self, "segmentDescriptionsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
      {
        -[GEOElevationProfile segmentDescriptionAtIndex:](self, "segmentDescriptionAtIndex:", j);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSegmentDescription:", v12);

      }
    }
  }
  if (self->_elevationDescription)
    objc_msgSend(v13, "setElevationDescription:");

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
  char flags;
  id v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  void *v23;
  PBUnknownFields *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOElevationProfileReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_24;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOElevationProfile readAll:](self, "readAll:", 0);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = self->_points;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPoint:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v10);
  }

  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_sumElevationGainCm;
    *(_BYTE *)(v5 + 76) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_sumElevationLossCm;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  v15 = -[GEOMinimumVisibleElevationRange copyWithZone:](self->_minimumVisibleElevationRange, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v17 = self->_segmentDescriptions;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v27 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v26);
        objc_msgSend((id)v5, "addSegmentDescription:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v18);
  }

  v22 = -[GEOFormattedString copyWithZone:](self->_elevationDescription, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v22;

  v24 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v24;
LABEL_24:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *points;
  GEOMinimumVisibleElevationRange *minimumVisibleElevationRange;
  NSMutableArray *segmentDescriptions;
  GEOFormattedString *elevationDescription;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_20;
  -[GEOElevationProfile readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  points = self->_points;
  if ((unint64_t)points | *((_QWORD *)v4 + 5))
  {
    if (!-[NSMutableArray isEqual:](points, "isEqual:"))
      goto LABEL_20;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_sumElevationGainCm != *((_DWORD *)v4 + 17))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
LABEL_20:
    v9 = 0;
    goto LABEL_21;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_sumElevationLossCm != *((_DWORD *)v4 + 18))
      goto LABEL_20;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_20;
  }
  minimumVisibleElevationRange = self->_minimumVisibleElevationRange;
  if ((unint64_t)minimumVisibleElevationRange | *((_QWORD *)v4 + 4)
    && !-[GEOMinimumVisibleElevationRange isEqual:](minimumVisibleElevationRange, "isEqual:"))
  {
    goto LABEL_20;
  }
  segmentDescriptions = self->_segmentDescriptions;
  if ((unint64_t)segmentDescriptions | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](segmentDescriptions, "isEqual:"))
      goto LABEL_20;
  }
  elevationDescription = self->_elevationDescription;
  if ((unint64_t)elevationDescription | *((_QWORD *)v4 + 3))
    v9 = -[GEOFormattedString isEqual:](elevationDescription, "isEqual:");
  else
    v9 = 1;
LABEL_21:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  -[GEOElevationProfile readAll:](self, "readAll:", 1);
  v3 = -[NSMutableArray hash](self->_points, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v4 = 2654435761 * self->_sumElevationGainCm;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_sumElevationLossCm;
LABEL_6:
  v6 = v4 ^ v3 ^ v5 ^ -[GEOMinimumVisibleElevationRange hash](self->_minimumVisibleElevationRange, "hash");
  v7 = -[NSMutableArray hash](self->_segmentDescriptions, "hash");
  return v6 ^ v7 ^ -[GEOFormattedString hash](self->_elevationDescription, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  char v10;
  GEOMinimumVisibleElevationRange *minimumVisibleElevationRange;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  GEOFormattedString *elevationDescription;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = *((id *)v4 + 5);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        -[GEOElevationProfile addPoint:](self, "addPoint:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v7);
  }

  v10 = *((_BYTE *)v4 + 76);
  if ((v10 & 1) != 0)
  {
    self->_sumElevationGainCm = *((_DWORD *)v4 + 17);
    *(_BYTE *)&self->_flags |= 1u;
    v10 = *((_BYTE *)v4 + 76);
  }
  if ((v10 & 2) != 0)
  {
    self->_sumElevationLossCm = *((_DWORD *)v4 + 18);
    *(_BYTE *)&self->_flags |= 2u;
  }
  minimumVisibleElevationRange = self->_minimumVisibleElevationRange;
  v12 = *((_QWORD *)v4 + 4);
  if (minimumVisibleElevationRange)
  {
    if (v12)
      -[GEOMinimumVisibleElevationRange mergeFrom:](minimumVisibleElevationRange, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOElevationProfile setMinimumVisibleElevationRange:](self, "setMinimumVisibleElevationRange:");
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = *((id *)v4 + 6);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        -[GEOElevationProfile addSegmentDescription:](self, "addSegmentDescription:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), (_QWORD)v20);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v15);
  }

  elevationDescription = self->_elevationDescription;
  v19 = *((_QWORD *)v4 + 3);
  if (elevationDescription)
  {
    if (v19)
      -[GEOFormattedString mergeFrom:](elevationDescription, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEOElevationProfile setElevationDescription:](self, "setElevationDescription:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOElevationProfileReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1687);
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
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x84u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOElevationProfile readAll:](self, "readAll:", 0);
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v7 = self->_points;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v9);
    }

    -[GEOMinimumVisibleElevationRange clearUnknownFields:](self->_minimumVisibleElevationRange, "clearUnknownFields:", 1);
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_segmentDescriptions;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v16++), "clearUnknownFields:", 1, (_QWORD)v17);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v14);
    }

    -[GEOFormattedString clearUnknownFields:](self->_elevationDescription, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentDescriptions, 0);
  objc_storeStrong((id *)&self->_points, 0);
  objc_storeStrong((id *)&self->_minimumVisibleElevationRange, 0);
  objc_storeStrong((id *)&self->_elevationDescription, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
