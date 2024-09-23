@implementation GEORecentLocationHistory

- (GEORecentLocationHistory)init
{
  GEORecentLocationHistory *v2;
  GEORecentLocationHistory *v3;
  GEORecentLocationHistory *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORecentLocationHistory;
  v2 = -[GEORecentLocationHistory init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORecentLocationHistory)initWithData:(id)a3
{
  GEORecentLocationHistory *v3;
  GEORecentLocationHistory *v4;
  GEORecentLocationHistory *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORecentLocationHistory;
  v3 = -[GEORecentLocationHistory initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEORecentLocationHistory;
  -[GEORecentLocationHistory dealloc](&v3, sel_dealloc);
}

- (void)_readBaseLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBaseLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasBaseLocation
{
  -[GEORecentLocationHistory _readBaseLocation]((uint64_t)self);
  return self->_baseLocation != 0;
}

- (GEOLatLngE7)baseLocation
{
  -[GEORecentLocationHistory _readBaseLocation]((uint64_t)self);
  return self->_baseLocation;
}

- (void)setBaseLocation:(id)a3
{
  *(_WORD *)&self->_flags |= 0x840u;
  objc_storeStrong((id *)&self->_baseLocation, a3);
}

- (unint64_t)baseTimestamp
{
  return self->_baseTimestamp;
}

- (void)setBaseTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_baseTimestamp = a3;
}

- (void)setHasBaseTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasBaseTimestamp
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readRelativeLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelativeLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (NSMutableArray)relativeLocations
{
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  return self->_relativeLocations;
}

- (void)setRelativeLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *relativeLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  relativeLocations = self->_relativeLocations;
  self->_relativeLocations = v4;

}

- (void)clearRelativeLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  -[NSMutableArray removeAllObjects](self->_relativeLocations, "removeAllObjects");
}

- (void)addRelativeLocations:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  -[GEORecentLocationHistory _addNoFlagsRelativeLocations:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x400u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (void)_addNoFlagsRelativeLocations:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)relativeLocationsCount
{
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_relativeLocations, "count");
}

- (id)relativeLocationsAtIndex:(unint64_t)a3
{
  -[GEORecentLocationHistory _readRelativeLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_relativeLocations, "objectAtIndex:", a3);
}

+ (Class)relativeLocationsType
{
  return (Class)objc_opt_class();
}

- (unsigned)timeResolution
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_timeResolution;
  else
    return 1;
}

- (void)setTimeResolution:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_timeResolution = a3;
}

- (void)setHasTimeResolution:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasTimeResolution
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)baseDistanceToDestination
{
  return self->_baseDistanceToDestination;
}

- (void)setBaseDistanceToDestination:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_baseDistanceToDestination = a3;
}

- (void)setHasBaseDistanceToDestination:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBaseDistanceToDestination
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readRelativeDistanceToDestinations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRelativeDistanceToDestinations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (unint64_t)relativeDistanceToDestinationsCount
{
  -[GEORecentLocationHistory _readRelativeDistanceToDestinations]((uint64_t)self);
  return self->_relativeDistanceToDestinations.count;
}

- (int)relativeDistanceToDestinations
{
  -[GEORecentLocationHistory _readRelativeDistanceToDestinations]((uint64_t)self);
  return self->_relativeDistanceToDestinations.list;
}

- (void)clearRelativeDistanceToDestinations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Clear();
}

- (void)addRelativeDistanceToDestination:(int)a3
{
  -[GEORecentLocationHistory _readRelativeDistanceToDestinations]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (int)relativeDistanceToDestinationAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_relativeDistanceToDestinations;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORecentLocationHistory _readRelativeDistanceToDestinations]((uint64_t)self);
  p_relativeDistanceToDestinations = &self->_relativeDistanceToDestinations;
  count = self->_relativeDistanceToDestinations.count;
  if (count <= a3)
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a3, count);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise");

  }
  return p_relativeDistanceToDestinations->list[a3];
}

- (void)setRelativeDistanceToDestinations:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedInt32Set();
}

- (unsigned)latlngCount
{
  return self->_latlngCount;
}

- (void)setLatlngCount:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_latlngCount = a3;
}

- (void)setHasLatlngCount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasLatlngCount
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (void)_readEncodedLats
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEncodedLats_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasEncodedLats
{
  -[GEORecentLocationHistory _readEncodedLats]((uint64_t)self);
  return self->_encodedLats != 0;
}

- (NSData)encodedLats
{
  -[GEORecentLocationHistory _readEncodedLats]((uint64_t)self);
  return self->_encodedLats;
}

- (void)setEncodedLats:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_encodedLats, a3);
}

- (void)_readEncodedLngs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEncodedLngs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasEncodedLngs
{
  -[GEORecentLocationHistory _readEncodedLngs]((uint64_t)self);
  return self->_encodedLngs != 0;
}

- (NSData)encodedLngs
{
  -[GEORecentLocationHistory _readEncodedLngs]((uint64_t)self);
  return self->_encodedLngs;
}

- (void)setEncodedLngs:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_encodedLngs, a3);
}

- (void)_readEncodedDistancesToDestination
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    if ((*(_WORD *)(a1 + 120) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORecentLocationHistoryReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEncodedDistancesToDestination_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
  }
}

- (BOOL)hasEncodedDistancesToDestination
{
  -[GEORecentLocationHistory _readEncodedDistancesToDestination]((uint64_t)self);
  return self->_encodedDistancesToDestination != 0;
}

- (NSData)encodedDistancesToDestination
{
  -[GEORecentLocationHistory _readEncodedDistancesToDestination]((uint64_t)self);
  return self->_encodedDistancesToDestination;
}

- (void)setEncodedDistancesToDestination:(id)a3
{
  *(_WORD *)&self->_flags |= 0x880u;
  objc_storeStrong((id *)&self->_encodedDistancesToDestination, a3);
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
  v8.super_class = (Class)GEORecentLocationHistory;
  -[GEORecentLocationHistory description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORecentLocationHistory dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORecentLocationHistory _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "baseLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("baseLocation");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("base_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  if ((*(_WORD *)(a1 + 120) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("baseTimestamp");
    else
      v10 = CFSTR("base_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v12 = *(id *)(a1 + 88);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v48 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v17, "jsonRepresentation");
          else
            objc_msgSend(v17, "dictionaryRepresentation");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v14);
    }

    if (a2)
      v19 = CFSTR("relativeLocations");
    else
      v19 = CFSTR("relative_locations");
    objc_msgSend(v4, "setObject:forKey:", v11, v19);

  }
  v20 = *(_WORD *)(a1 + 120);
  if ((v20 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 116));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("timeResolution");
    else
      v22 = CFSTR("time_resolution");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    v20 = *(_WORD *)(a1 + 120);
  }
  if ((v20 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("baseDistanceToDestination");
    else
      v24 = CFSTR("base_distance_to_destination");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedInt32NSArray();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("relativeDistanceToDestination");
    else
      v26 = CFSTR("relative_distance_to_destination");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  if ((*(_WORD *)(a1 + 120) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 112));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("latlngCount");
    else
      v28 = CFSTR("latlng_count");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  objc_msgSend((id)a1, "encodedLats");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "base64EncodedStringWithOptions:", 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("encodedLats"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("encoded_lats"));
    }
  }

  objc_msgSend((id)a1, "encodedLngs");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v32, "base64EncodedStringWithOptions:", 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("encodedLngs"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("encoded_lngs"));
    }
  }

  objc_msgSend((id)a1, "encodedDistancesToDestination");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "base64EncodedStringWithOptions:", 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("encodedDistancesToDestination"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("encoded_distances_to_destination"));
    }
  }

  v38 = *(void **)(a1 + 16);
  if (v38)
  {
    objc_msgSend(v38, "dictionaryRepresentation");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v39, "count"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __54__GEORecentLocationHistory__dictionaryRepresentation___block_invoke;
      v45[3] = &unk_1E1C00600;
      v42 = v41;
      v46 = v42;
      objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v45);
      v43 = v42;

      v40 = v43;
    }
    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORecentLocationHistory _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __54__GEORecentLocationHistory__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORecentLocationHistory)initWithDictionary:(id)a3
{
  return (GEORecentLocationHistory *)-[GEORecentLocationHistory _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOLatLngE7 *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOLatLngE7 *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("baseLocation");
      else
        v6 = CFSTR("base_location");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEOLatLngE7 alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEOLatLngE7 initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEOLatLngE7 initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setBaseLocation:", v9);

      }
      if (a3)
        v11 = CFSTR("baseTimestamp");
      else
        v11 = CFSTR("base_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBaseTimestamp:", objc_msgSend(v12, "unsignedLongLongValue"));

      if (a3)
        v13 = CFSTR("relativeLocations");
      else
        v13 = CFSTR("relative_locations");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = v14;
        v49 = v5;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v15 = v14;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v55;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v55 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = [GEOLatLngE7 alloc];
                if ((a3 & 1) != 0)
                  v22 = -[GEOLatLngE7 initWithJSON:](v21, "initWithJSON:", v20);
                else
                  v22 = -[GEOLatLngE7 initWithDictionary:](v21, "initWithDictionary:", v20);
                v23 = (void *)v22;
                objc_msgSend(a1, "addRelativeLocations:", v22, v48, v49);

              }
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
          }
          while (v17);
        }

        v14 = v48;
        v5 = v49;
      }

      if (a3)
        v24 = CFSTR("timeResolution");
      else
        v24 = CFSTR("time_resolution");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24, v48, v49);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTimeResolution:", objc_msgSend(v25, "unsignedIntValue"));

      if (a3)
        v26 = CFSTR("baseDistanceToDestination");
      else
        v26 = CFSTR("base_distance_to_destination");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBaseDistanceToDestination:", objc_msgSend(v27, "unsignedIntValue"));

      if (a3)
        v28 = CFSTR("relativeDistanceToDestination");
      else
        v28 = CFSTR("relative_distance_to_destination");
      objc_msgSend(v5, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v51;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v51 != v33)
                objc_enumerationMutation(v30);
              v35 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
                objc_msgSend(a1, "addRelativeDistanceToDestination:", objc_msgSend(v35, "intValue"));
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          }
          while (v32);
        }

      }
      if (a3)
        v36 = CFSTR("latlngCount");
      else
        v36 = CFSTR("latlng_count");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLatlngCount:", objc_msgSend(v37, "unsignedIntValue"));

      if (a3)
        v38 = CFSTR("encodedLats");
      else
        v38 = CFSTR("encoded_lats");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v39, 0);
        objc_msgSend(a1, "setEncodedLats:", v40);

      }
      if (a3)
        v41 = CFSTR("encodedLngs");
      else
        v41 = CFSTR("encoded_lngs");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v42, 0);
        objc_msgSend(a1, "setEncodedLngs:", v43);

      }
      if (a3)
        v44 = CFSTR("encodedDistancesToDestination");
      else
        v44 = CFSTR("encoded_distances_to_destination");
      objc_msgSend(v5, "objectForKeyedSubscript:", v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v45, 0);
        objc_msgSend(a1, "setEncodedDistancesToDestination:", v46);

      }
    }
  }

  return a1;
}

- (GEORecentLocationHistory)initWithJSON:(id)a3
{
  return (GEORecentLocationHistory *)-[GEORecentLocationHistory _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_3875;
    else
      v8 = (int *)&readAll__nonRecursiveTag_3876;
    GEORecentLocationHistoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORecentLocationHistoryCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORecentLocationHistoryIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORecentLocationHistoryReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  unint64_t v11;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0xFE0) == 0))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORecentLocationHistory readAll:](self, "readAll:", 0);
    if (self->_baseLocation)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint64Field();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_relativeLocations;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      PBDataWriterWriteUint32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_relativeDistanceToDestinations.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_relativeDistanceToDestinations.count);
    }
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_encodedLats)
      PBDataWriterWriteDataField();
    if (self->_encodedLngs)
      PBDataWriterWriteDataField();
    if (self->_encodedDistancesToDestination)
      PBDataWriterWriteDataField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v14);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  __int16 flags;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id *v12;
  id *v13;

  v13 = (id *)a3;
  -[GEORecentLocationHistory readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v13 + 1, self->_reader);
  *((_DWORD *)v13 + 24) = self->_readerMarkPos;
  *((_DWORD *)v13 + 25) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_baseLocation)
    objc_msgSend(v13, "setBaseLocation:");
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    v13[7] = (id)self->_baseTimestamp;
    *((_WORD *)v13 + 60) |= 1u;
  }
  if (-[GEORecentLocationHistory relativeLocationsCount](self, "relativeLocationsCount"))
  {
    objc_msgSend(v13, "clearRelativeLocations");
    v4 = -[GEORecentLocationHistory relativeLocationsCount](self, "relativeLocationsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORecentLocationHistory relativeLocationsAtIndex:](self, "relativeLocationsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addRelativeLocations:", v7);

      }
    }
  }
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v13 + 29) = self->_timeResolution;
    *((_WORD *)v13 + 60) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v13 + 27) = self->_baseDistanceToDestination;
    *((_WORD *)v13 + 60) |= 2u;
  }
  if (-[GEORecentLocationHistory relativeDistanceToDestinationsCount](self, "relativeDistanceToDestinationsCount"))
  {
    objc_msgSend(v13, "clearRelativeDistanceToDestinations");
    v9 = -[GEORecentLocationHistory relativeDistanceToDestinationsCount](self, "relativeDistanceToDestinationsCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; j != v10; ++j)
        objc_msgSend(v13, "addRelativeDistanceToDestination:", -[GEORecentLocationHistory relativeDistanceToDestinationAtIndex:](self, "relativeDistanceToDestinationAtIndex:", j));
    }
  }
  v12 = v13;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *((_DWORD *)v13 + 28) = self->_latlngCount;
    *((_WORD *)v13 + 60) |= 4u;
  }
  if (self->_encodedLats)
  {
    objc_msgSend(v13, "setEncodedLats:");
    v12 = v13;
  }
  if (self->_encodedLngs)
  {
    objc_msgSend(v13, "setEncodedLngs:");
    v12 = v13;
  }
  if (self->_encodedDistancesToDestination)
  {
    objc_msgSend(v13, "setEncodedDistancesToDestination:");
    v12 = v13;
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int16 flags;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PBUnknownFields *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x800) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORecentLocationHistoryReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_21;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORecentLocationHistory readAll:](self, "readAll:", 0);
  v9 = -[GEOLatLngE7 copyWithZone:](self->_baseLocation, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 56) = self->_baseTimestamp;
    *(_WORD *)(v5 + 120) |= 1u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = self->_relativeLocations;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        objc_msgSend((id)v5, "addRelativeLocations:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v12);
  }

  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 116) = self->_timeResolution;
    *(_WORD *)(v5 + 120) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 108) = self->_baseDistanceToDestination;
    *(_WORD *)(v5 + 120) |= 2u;
  }
  PBRepeatedInt32Copy();
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 112) = self->_latlngCount;
    *(_WORD *)(v5 + 120) |= 4u;
  }
  v17 = -[NSData copyWithZone:](self->_encodedLats, "copyWithZone:", a3, (_QWORD)v25);
  v18 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v17;

  v19 = -[NSData copyWithZone:](self->_encodedLngs, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v19;

  v21 = -[NSData copyWithZone:](self->_encodedDistancesToDestination, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v21;

  v23 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_21:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOLatLngE7 *baseLocation;
  __int16 flags;
  __int16 v7;
  NSMutableArray *relativeLocations;
  __int16 v9;
  NSData *encodedLats;
  NSData *encodedLngs;
  NSData *encodedDistancesToDestination;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_34;
  -[GEORecentLocationHistory readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  baseLocation = self->_baseLocation;
  if ((unint64_t)baseLocation | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLatLngE7 isEqual:](baseLocation, "isEqual:"))
      goto LABEL_34;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 60);
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_baseTimestamp != *((_QWORD *)v4 + 7))
      goto LABEL_34;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_34;
  }
  relativeLocations = self->_relativeLocations;
  if ((unint64_t)relativeLocations | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](relativeLocations, "isEqual:"))
      goto LABEL_34;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 60);
  }
  if ((flags & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timeResolution != *((_DWORD *)v4 + 29))
      goto LABEL_34;
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_34;
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_baseDistanceToDestination != *((_DWORD *)v4 + 27))
      goto LABEL_34;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_34;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_34:
    v13 = 0;
    goto LABEL_35;
  }
  v9 = *((_WORD *)v4 + 60);
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_latlngCount != *((_DWORD *)v4 + 28))
      goto LABEL_34;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_34;
  }
  encodedLats = self->_encodedLats;
  if ((unint64_t)encodedLats | *((_QWORD *)v4 + 9) && !-[NSData isEqual:](encodedLats, "isEqual:"))
    goto LABEL_34;
  encodedLngs = self->_encodedLngs;
  if ((unint64_t)encodedLngs | *((_QWORD *)v4 + 10))
  {
    if (!-[NSData isEqual:](encodedLngs, "isEqual:"))
      goto LABEL_34;
  }
  encodedDistancesToDestination = self->_encodedDistancesToDestination;
  if ((unint64_t)encodedDistancesToDestination | *((_QWORD *)v4 + 8))
    v13 = -[NSData isEqual:](encodedDistancesToDestination, "isEqual:");
  else
    v13 = 1;
LABEL_35:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  -[GEORecentLocationHistory readAll:](self, "readAll:", 1);
  v3 = -[GEOLatLngE7 hash](self->_baseLocation, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v4 = 2654435761u * self->_baseTimestamp;
  else
    v4 = 0;
  v5 = -[NSMutableArray hash](self->_relativeLocations, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v7 = 2654435761 * self->_timeResolution;
    if ((flags & 2) != 0)
      goto LABEL_6;
  }
  else
  {
    v7 = 0;
    if ((flags & 2) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_baseDistanceToDestination;
      goto LABEL_9;
    }
  }
  v8 = 0;
LABEL_9:
  v9 = PBRepeatedInt32Hash();
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v10 = 2654435761 * self->_latlngCount;
  else
    v10 = 0;
  v11 = v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ -[NSData hash](self->_encodedLats, "hash");
  v12 = -[NSData hash](self->_encodedLngs, "hash");
  return v11 ^ v12 ^ -[NSData hash](self->_encodedDistancesToDestination, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOLatLngE7 *baseLocation;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  baseLocation = self->_baseLocation;
  v6 = *((_QWORD *)v4 + 6);
  if (baseLocation)
  {
    if (v6)
      -[GEOLatLngE7 mergeFrom:](baseLocation, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORecentLocationHistory setBaseLocation:](self, "setBaseLocation:");
  }
  if ((*((_WORD *)v4 + 60) & 1) != 0)
  {
    self->_baseTimestamp = *((_QWORD *)v4 + 7);
    *(_WORD *)&self->_flags |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = *((id *)v4 + 11);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        -[GEORecentLocationHistory addRelativeLocations:](self, "addRelativeLocations:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v12 = *((_WORD *)v4 + 60);
  if ((v12 & 8) != 0)
  {
    self->_timeResolution = *((_DWORD *)v4 + 29);
    *(_WORD *)&self->_flags |= 8u;
    v12 = *((_WORD *)v4 + 60);
  }
  if ((v12 & 2) != 0)
  {
    self->_baseDistanceToDestination = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 2u;
  }
  v13 = objc_msgSend(v4, "relativeDistanceToDestinationsCount", (_QWORD)v16);
  if (v13)
  {
    v14 = v13;
    for (j = 0; j != v14; ++j)
      -[GEORecentLocationHistory addRelativeDistanceToDestination:](self, "addRelativeDistanceToDestination:", objc_msgSend(v4, "relativeDistanceToDestinationAtIndex:", j));
  }
  if ((*((_WORD *)v4 + 60) & 4) != 0)
  {
    self->_latlngCount = *((_DWORD *)v4 + 28);
    *(_WORD *)&self->_flags |= 4u;
  }
  if (*((_QWORD *)v4 + 9))
    -[GEORecentLocationHistory setEncodedLats:](self, "setEncodedLats:");
  if (*((_QWORD *)v4 + 10))
    -[GEORecentLocationHistory setEncodedLngs:](self, "setEncodedLngs:");
  if (*((_QWORD *)v4 + 8))
    -[GEORecentLocationHistory setEncodedDistancesToDestination:](self, "setEncodedDistancesToDestination:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x10) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORecentLocationHistoryReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_3879);
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
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x810u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORecentLocationHistory readAll:](self, "readAll:", 0);
    -[GEOLatLngE7 clearUnknownFields:](self->_baseLocation, "clearUnknownFields:", 1);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_relativeLocations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativeLocations, 0);
  objc_storeStrong((id *)&self->_encodedLngs, 0);
  objc_storeStrong((id *)&self->_encodedLats, 0);
  objc_storeStrong((id *)&self->_encodedDistancesToDestination, 0);
  objc_storeStrong((id *)&self->_baseLocation, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
