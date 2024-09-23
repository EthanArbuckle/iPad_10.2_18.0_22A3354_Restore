@implementation GEOTransitVehicleInfo

- (GEOTransitVehicleInfo)init
{
  GEOTransitVehicleInfo *v2;
  GEOTransitVehicleInfo *v3;
  GEOTransitVehicleInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitVehicleInfo;
  v2 = -[GEOTransitVehicleInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitVehicleInfo)initWithData:(id)a3
{
  GEOTransitVehicleInfo *v3;
  GEOTransitVehicleInfo *v4;
  GEOTransitVehicleInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitVehicleInfo;
  v3 = -[GEOTransitVehicleInfo initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOTransitVehicleInfo;
  -[GEOTransitVehicleInfo dealloc](&v3, sel_dealloc);
}

- (void)_readArrivalTime
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArrivalTime_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasArrivalTime
{
  -[GEOTransitVehicleInfo _readArrivalTime]((uint64_t)self);
  return self->_arrivalTime != 0;
}

- (GEOTransitVehicleTime)arrivalTime
{
  -[GEOTransitVehicleInfo _readArrivalTime]((uint64_t)self);
  return self->_arrivalTime;
}

- (void)setArrivalTime:(id)a3
{
  *(_WORD *)&self->_flags |= 0x900u;
  objc_storeStrong((id *)&self->_arrivalTime, a3);
}

- (void)_readDepartureTime
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDepartureTime_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasDepartureTime
{
  -[GEOTransitVehicleInfo _readDepartureTime]((uint64_t)self);
  return self->_departureTime != 0;
}

- (GEOTransitVehicleTime)departureTime
{
  -[GEOTransitVehicleInfo _readDepartureTime]((uint64_t)self);
  return self->_departureTime;
}

- (void)setDepartureTime:(id)a3
{
  *(_WORD *)&self->_flags |= 0xA00u;
  objc_storeStrong((id *)&self->_departureTime, a3);
}

- (unsigned)lineIndex
{
  return self->_lineIndex;
}

- (void)setLineIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x808u;
  self->_lineIndex = a3;
}

- (void)setHasLineIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2056;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLineIndex
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unsigned)routeLineArtworkIndex
{
  return self->_routeLineArtworkIndex;
}

- (void)setRouteLineArtworkIndex:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x820u;
  self->_routeLineArtworkIndex = a3;
}

- (void)setHasRouteLineArtworkIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2080;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasRouteLineArtworkIndex
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (void)_readClusteredRouteLineArtworkIndexs
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClusteredRouteLineArtworkIndexs_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (unint64_t)clusteredRouteLineArtworkIndexsCount
{
  -[GEOTransitVehicleInfo _readClusteredRouteLineArtworkIndexs]((uint64_t)self);
  return self->_clusteredRouteLineArtworkIndexs.count;
}

- (unsigned)clusteredRouteLineArtworkIndexs
{
  -[GEOTransitVehicleInfo _readClusteredRouteLineArtworkIndexs]((uint64_t)self);
  return self->_clusteredRouteLineArtworkIndexs.list;
}

- (void)clearClusteredRouteLineArtworkIndexs
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedUInt32Clear();
}

- (void)addClusteredRouteLineArtworkIndex:(unsigned int)a3
{
  -[GEOTransitVehicleInfo _readClusteredRouteLineArtworkIndexs]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
}

- (unsigned)clusteredRouteLineArtworkIndexAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_clusteredRouteLineArtworkIndexs;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOTransitVehicleInfo _readClusteredRouteLineArtworkIndexs]((uint64_t)self);
  p_clusteredRouteLineArtworkIndexs = &self->_clusteredRouteLineArtworkIndexs;
  count = self->_clusteredRouteLineArtworkIndexs.count;
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
  return p_clusteredRouteLineArtworkIndexs->list[a3];
}

- (void)setClusteredRouteLineArtworkIndexs:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x800u;
  PBRepeatedUInt32Set();
}

- (int)pickupDropoffType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_pickupDropoffType;
  else
    return 0;
}

- (void)setPickupDropoffType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x810u;
  self->_pickupDropoffType = a3;
}

- (void)setHasPickupDropoffType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2064;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasPickupDropoffType
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (id)pickupDropoffTypeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("REGULAR");
  switch(a3)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("NOT_AVAILABLE");
      return v3;
    case 2:
      return CFSTR("PHONE_AGENCY");
    case 3:
      return CFSTR("COORDINATE_WITH_DRIVER");
    default:
      if (a3 == 100)
        return CFSTR("STOP_SKIPPED");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsPickupDropoffType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGULAR")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_AVAILABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHONE_AGENCY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COORDINATE_WITH_DRIVER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("STOP_SKIPPED")))
  {
    v4 = 100;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)departureFrequencyMin
{
  return self->_departureFrequencyMin;
}

- (void)setDepartureFrequencyMin:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x804u;
  self->_departureFrequencyMin = a3;
}

- (void)setHasDepartureFrequencyMin:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2052;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasDepartureFrequencyMin
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)departureFrequencyMax
{
  return self->_departureFrequencyMax;
}

- (void)setDepartureFrequencyMax:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x802u;
  self->_departureFrequencyMax = a3;
}

- (void)setHasDepartureFrequencyMax:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2050;
  else
    v3 = 2048;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDepartureFrequencyMax
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)tripMuid
{
  return self->_tripMuid;
}

- (void)setTripMuid:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x801u;
  self->_tripMuid = a3;
}

- (void)setHasTripMuid:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x800;
}

- (BOOL)hasTripMuid
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readVehicleNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 112) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitVehicleInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVehicleNumber_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasVehicleNumber
{
  -[GEOTransitVehicleInfo _readVehicleNumber]((uint64_t)self);
  return self->_vehicleNumber != 0;
}

- (NSString)vehicleNumber
{
  -[GEOTransitVehicleInfo _readVehicleNumber]((uint64_t)self);
  return self->_vehicleNumber;
}

- (void)setVehicleNumber:(id)a3
{
  *(_WORD *)&self->_flags |= 0xC00u;
  objc_storeStrong((id *)&self->_vehicleNumber, a3);
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
  v8.super_class = (Class)GEOTransitVehicleInfo;
  -[GEOTransitVehicleInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitVehicleInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  int v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  _QWORD v39[4];
  id v40;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "arrivalTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("arrivalTime");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("arrival_time");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend((id)a1, "departureTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("departureTime");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("departure_time");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  v13 = *(_WORD *)(a1 + 112);
  if ((v13 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("lineIndex");
    else
      v15 = CFSTR("line_index");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v13 = *(_WORD *)(a1 + 112);
  }
  if ((v13 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 108));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("routeLineArtworkIndex");
    else
      v17 = CFSTR("route_line_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    PBRepeatedUInt32NSArray();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v19 = CFSTR("clusteredRouteLineArtworkIndex");
    else
      v19 = CFSTR("clustered_route_line_artwork_index");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  v20 = *(_WORD *)(a1 + 112);
  if ((v20 & 0x10) != 0)
  {
    v32 = *(_DWORD *)(a1 + 104);
    v33 = CFSTR("REGULAR");
    switch(v32)
    {
      case 0:
        break;
      case 1:
        v33 = CFSTR("NOT_AVAILABLE");
        break;
      case 2:
        v33 = CFSTR("PHONE_AGENCY");
        break;
      case 3:
        v33 = CFSTR("COORDINATE_WITH_DRIVER");
        break;
      default:
        if (v32 == 100)
        {
          v33 = CFSTR("STOP_SKIPPED");
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 104));
          v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
    }
    if (a2)
      v34 = CFSTR("pickupDropoffType");
    else
      v34 = CFSTR("pickup_dropoff_type");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

    v20 = *(_WORD *)(a1 + 112);
    if ((v20 & 4) == 0)
    {
LABEL_29:
      if ((v20 & 2) == 0)
        goto LABEL_30;
LABEL_61:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v38 = CFSTR("departureFrequencyMax");
      else
        v38 = CFSTR("departure_frequency_max");
      objc_msgSend(v4, "setObject:forKey:", v37, v38);

      if ((*(_WORD *)(a1 + 112) & 1) == 0)
        goto LABEL_35;
      goto LABEL_31;
    }
  }
  else if ((v20 & 4) == 0)
  {
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v36 = CFSTR("departureFrequencyMin");
  else
    v36 = CFSTR("departure_frequency_min");
  objc_msgSend(v4, "setObject:forKey:", v35, v36);

  v20 = *(_WORD *)(a1 + 112);
  if ((v20 & 2) != 0)
    goto LABEL_61;
LABEL_30:
  if ((v20 & 1) != 0)
  {
LABEL_31:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("tripMuid");
    else
      v22 = CFSTR("trip_muid");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

  }
LABEL_35:
  objc_msgSend((id)a1, "vehicleNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("vehicleNumber");
    else
      v24 = CFSTR("vehicle_number");
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
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __51__GEOTransitVehicleInfo__dictionaryRepresentation___block_invoke;
      v39[3] = &unk_1E1C00600;
      v29 = v28;
      v40 = v29;
      objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v39);
      v30 = v29;

      v27 = v30;
    }
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitVehicleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __51__GEOTransitVehicleInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitVehicleInfo)initWithDictionary:(id)a3
{
  return (GEOTransitVehicleInfo *)-[GEOTransitVehicleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEOTransitVehicleTime *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEOTransitVehicleTime *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_83;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_83;
  if (a3)
    v6 = CFSTR("arrivalTime");
  else
    v6 = CFSTR("arrival_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = [GEOTransitVehicleTime alloc];
    if ((a3 & 1) != 0)
      v9 = -[GEOTransitVehicleTime initWithJSON:](v8, "initWithJSON:", v7);
    else
      v9 = -[GEOTransitVehicleTime initWithDictionary:](v8, "initWithDictionary:", v7);
    v10 = (void *)v9;
    objc_msgSend(a1, "setArrivalTime:", v9);

  }
  if (a3)
    v11 = CFSTR("departureTime");
  else
    v11 = CFSTR("departure_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOTransitVehicleTime alloc];
    if ((a3 & 1) != 0)
      v14 = -[GEOTransitVehicleTime initWithJSON:](v13, "initWithJSON:", v12);
    else
      v14 = -[GEOTransitVehicleTime initWithDictionary:](v13, "initWithDictionary:", v12);
    v15 = (void *)v14;
    objc_msgSend(a1, "setDepartureTime:", v14);

  }
  if (a3)
    v16 = CFSTR("lineIndex");
  else
    v16 = CFSTR("line_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLineIndex:", objc_msgSend(v17, "unsignedIntValue"));

  if (a3)
    v18 = CFSTR("routeLineArtworkIndex");
  else
    v18 = CFSTR("route_line_artwork_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRouteLineArtworkIndex:", objc_msgSend(v19, "unsignedIntValue"));

  if (a3)
    v20 = CFSTR("clusteredRouteLineArtworkIndex");
  else
    v20 = CFSTR("clustered_route_line_artwork_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v43 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addClusteredRouteLineArtworkIndex:", objc_msgSend(v27, "unsignedIntValue", (_QWORD)v42));
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      }
      while (v24);
    }

  }
  if (a3)
    v28 = CFSTR("pickupDropoffType");
  else
    v28 = CFSTR("pickup_dropoff_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28, (_QWORD)v42);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = v29;
    if ((objc_msgSend(v30, "isEqualToString:", CFSTR("REGULAR")) & 1) != 0)
    {
      v31 = 0;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("NOT_AVAILABLE")) & 1) != 0)
    {
      v31 = 1;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("PHONE_AGENCY")) & 1) != 0)
    {
      v31 = 2;
    }
    else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("COORDINATE_WITH_DRIVER")) & 1) != 0)
    {
      v31 = 3;
    }
    else if (objc_msgSend(v30, "isEqualToString:", CFSTR("STOP_SKIPPED")))
    {
      v31 = 100;
    }
    else
    {
      v31 = 0;
    }

    goto LABEL_61;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = objc_msgSend(v29, "intValue");
LABEL_61:
    objc_msgSend(a1, "setPickupDropoffType:", v31);
  }

  if (a3)
    v32 = CFSTR("departureFrequencyMin");
  else
    v32 = CFSTR("departure_frequency_min");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDepartureFrequencyMin:", objc_msgSend(v33, "unsignedIntValue"));

  if (a3)
    v34 = CFSTR("departureFrequencyMax");
  else
    v34 = CFSTR("departure_frequency_max");
  objc_msgSend(v5, "objectForKeyedSubscript:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDepartureFrequencyMax:", objc_msgSend(v35, "unsignedIntValue"));

  if (a3)
    v36 = CFSTR("tripMuid");
  else
    v36 = CFSTR("trip_muid");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTripMuid:", objc_msgSend(v37, "unsignedLongLongValue"));

  if (a3)
    v38 = CFSTR("vehicleNumber");
  else
    v38 = CFSTR("vehicle_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = (void *)objc_msgSend(v39, "copy");
    objc_msgSend(a1, "setVehicleNumber:", v40);

  }
LABEL_83:

  return a1;
}

- (GEOTransitVehicleInfo)initWithJSON:(id)a3
{
  return (GEOTransitVehicleInfo *)-[GEOTransitVehicleInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1878;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1879;
    GEOTransitVehicleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEOTransitVehicleTime readAll:](self->_arrivalTime, "readAll:", 1);
    -[GEOTransitVehicleTime readAll:](self->_departureTime, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitVehicleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitVehicleInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  unint64_t v7;
  __int16 v8;
  PBDataReader *v9;
  void *v10;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0xF80) == 0)
    {
      v9 = self->_reader;
      objc_sync_enter(v9);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v10);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v9);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitVehicleInfo readAll:](self, "readAll:", 0);
  if (self->_arrivalTime)
    PBDataWriterWriteSubmessage();
  if (self->_departureTime)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0)
    PBDataWriterWriteUint32Field();
  if (self->_clusteredRouteLineArtworkIndexs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_clusteredRouteLineArtworkIndexs.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_clusteredRouteLineArtworkIndexs.count);
    }
    PBDataWriterRecallMark();
  }
  v8 = (__int16)self->_flags;
  if ((v8 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    v8 = (__int16)self->_flags;
    if ((v8 & 4) == 0)
    {
LABEL_18:
      if ((v8 & 2) == 0)
        goto LABEL_19;
LABEL_26:
      PBDataWriterWriteUint32Field();
      if ((*(_WORD *)&self->_flags & 1) == 0)
        goto LABEL_21;
      goto LABEL_20;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  v8 = (__int16)self->_flags;
  if ((v8 & 2) != 0)
    goto LABEL_26;
LABEL_19:
  if ((v8 & 1) != 0)
LABEL_20:
    PBDataWriterWriteUint64Field();
LABEL_21:
  if (self->_vehicleNumber)
    PBDataWriterWriteStringField();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);
LABEL_29:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  __int16 v8;
  id *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOTransitVehicleInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 20) = self->_readerMarkPos;
  *((_DWORD *)v10 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_arrivalTime)
    objc_msgSend(v10, "setArrivalTime:");
  if (self->_departureTime)
    objc_msgSend(v10, "setDepartureTime:");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    *((_DWORD *)v10 + 25) = self->_lineIndex;
    *((_WORD *)v10 + 56) |= 8u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 0x20) != 0)
  {
    *((_DWORD *)v10 + 27) = self->_routeLineArtworkIndex;
    *((_WORD *)v10 + 56) |= 0x20u;
  }
  if (-[GEOTransitVehicleInfo clusteredRouteLineArtworkIndexsCount](self, "clusteredRouteLineArtworkIndexsCount"))
  {
    objc_msgSend(v10, "clearClusteredRouteLineArtworkIndexs");
    v5 = -[GEOTransitVehicleInfo clusteredRouteLineArtworkIndexsCount](self, "clusteredRouteLineArtworkIndexsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v10, "addClusteredRouteLineArtworkIndex:", -[GEOTransitVehicleInfo clusteredRouteLineArtworkIndexAtIndex:](self, "clusteredRouteLineArtworkIndexAtIndex:", i));
    }
  }
  v8 = (__int16)self->_flags;
  v9 = v10;
  if ((v8 & 0x10) != 0)
  {
    *((_DWORD *)v10 + 26) = self->_pickupDropoffType;
    *((_WORD *)v10 + 56) |= 0x10u;
    v8 = (__int16)self->_flags;
    if ((v8 & 4) == 0)
    {
LABEL_15:
      if ((v8 & 2) == 0)
        goto LABEL_16;
      goto LABEL_23;
    }
  }
  else if ((v8 & 4) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)v10 + 24) = self->_departureFrequencyMin;
  *((_WORD *)v10 + 56) |= 4u;
  v8 = (__int16)self->_flags;
  if ((v8 & 2) == 0)
  {
LABEL_16:
    if ((v8 & 1) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_23:
  *((_DWORD *)v10 + 23) = self->_departureFrequencyMax;
  *((_WORD *)v10 + 56) |= 2u;
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
LABEL_17:
    v10[8] = (id)self->_tripMuid;
    *((_WORD *)v10 + 56) |= 1u;
  }
LABEL_18:
  if (self->_vehicleNumber)
  {
    objc_msgSend(v10, "setVehicleNumber:");
    v9 = v10;
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
  __int16 flags;
  __int16 v14;
  uint64_t v15;
  void *v16;
  PBUnknownFields *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitVehicleInfo readAll:](self, "readAll:", 0);
    v9 = -[GEOTransitVehicleTime copyWithZone:](self->_arrivalTime, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v9;

    v11 = -[GEOTransitVehicleTime copyWithZone:](self->_departureTime, "copyWithZone:", a3);
    v12 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v11;

    flags = (__int16)self->_flags;
    if ((flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 100) = self->_lineIndex;
      *(_WORD *)(v5 + 112) |= 8u;
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      *(_DWORD *)(v5 + 108) = self->_routeLineArtworkIndex;
      *(_WORD *)(v5 + 112) |= 0x20u;
    }
    PBRepeatedUInt32Copy();
    v14 = (__int16)self->_flags;
    if ((v14 & 0x10) != 0)
    {
      *(_DWORD *)(v5 + 104) = self->_pickupDropoffType;
      *(_WORD *)(v5 + 112) |= 0x10u;
      v14 = (__int16)self->_flags;
      if ((v14 & 4) == 0)
      {
LABEL_11:
        if ((v14 & 2) == 0)
          goto LABEL_12;
        goto LABEL_18;
      }
    }
    else if ((v14 & 4) == 0)
    {
      goto LABEL_11;
    }
    *(_DWORD *)(v5 + 96) = self->_departureFrequencyMin;
    *(_WORD *)(v5 + 112) |= 4u;
    v14 = (__int16)self->_flags;
    if ((v14 & 2) == 0)
    {
LABEL_12:
      if ((v14 & 1) == 0)
      {
LABEL_14:
        v15 = -[NSString copyWithZone:](self->_vehicleNumber, "copyWithZone:", a3);
        v16 = *(void **)(v5 + 72);
        *(_QWORD *)(v5 + 72) = v15;

        v17 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v17;
        goto LABEL_15;
      }
LABEL_13:
      *(_QWORD *)(v5 + 64) = self->_tripMuid;
      *(_WORD *)(v5 + 112) |= 1u;
      goto LABEL_14;
    }
LABEL_18:
    *(_DWORD *)(v5 + 92) = self->_departureFrequencyMax;
    *(_WORD *)(v5 + 112) |= 2u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x800) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOTransitVehicleInfoReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_15:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOTransitVehicleTime *arrivalTime;
  GEOTransitVehicleTime *departureTime;
  __int16 flags;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  NSString *vehicleNumber;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_39;
  -[GEOTransitVehicleInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  arrivalTime = self->_arrivalTime;
  if ((unint64_t)arrivalTime | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOTransitVehicleTime isEqual:](arrivalTime, "isEqual:"))
      goto LABEL_39;
  }
  departureTime = self->_departureTime;
  if ((unint64_t)departureTime | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOTransitVehicleTime isEqual:](departureTime, "isEqual:"))
      goto LABEL_39;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 56);
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_lineIndex != *((_DWORD *)v4 + 25))
      goto LABEL_39;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_39;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v8 & 0x20) == 0 || self->_routeLineArtworkIndex != *((_DWORD *)v4 + 27))
      goto LABEL_39;
  }
  else if ((v8 & 0x20) != 0)
  {
    goto LABEL_39;
  }
  if (!PBRepeatedUInt32IsEqual())
  {
LABEL_39:
    v12 = 0;
    goto LABEL_40;
  }
  v9 = (__int16)self->_flags;
  v10 = *((_WORD *)v4 + 56);
  if ((v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_pickupDropoffType != *((_DWORD *)v4 + 26))
      goto LABEL_39;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_39;
  }
  if ((v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_departureFrequencyMin != *((_DWORD *)v4 + 24))
      goto LABEL_39;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_39;
  }
  if ((v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_departureFrequencyMax != *((_DWORD *)v4 + 23))
      goto LABEL_39;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_39;
  }
  if ((v9 & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_tripMuid != *((_QWORD *)v4 + 8))
      goto LABEL_39;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_39;
  }
  vehicleNumber = self->_vehicleNumber;
  if ((unint64_t)vehicleNumber | *((_QWORD *)v4 + 9))
    v12 = -[NSString isEqual:](vehicleNumber, "isEqual:");
  else
    v12 = 1;
LABEL_40:

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  __int16 flags;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  -[GEOTransitVehicleInfo readAll:](self, "readAll:", 1);
  v3 = -[GEOTransitVehicleTime hash](self->_arrivalTime, "hash");
  v4 = -[GEOTransitVehicleTime hash](self->_departureTime, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 8) != 0)
  {
    v6 = 2654435761 * self->_lineIndex;
    if ((flags & 0x20) != 0)
      goto LABEL_3;
  }
  else
  {
    v6 = 0;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_routeLineArtworkIndex;
      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:
  v8 = PBRepeatedUInt32Hash();
  v9 = (__int16)self->_flags;
  if ((v9 & 0x10) != 0)
  {
    v10 = 2654435761 * self->_pickupDropoffType;
    if ((v9 & 4) != 0)
    {
LABEL_8:
      v11 = 2654435761 * self->_departureFrequencyMin;
      if ((v9 & 2) != 0)
        goto LABEL_9;
LABEL_13:
      v12 = 0;
      if ((v9 & 1) != 0)
        goto LABEL_10;
LABEL_14:
      v13 = 0;
      return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_vehicleNumber, "hash");
    }
  }
  else
  {
    v10 = 0;
    if ((v9 & 4) != 0)
      goto LABEL_8;
  }
  v11 = 0;
  if ((v9 & 2) == 0)
    goto LABEL_13;
LABEL_9:
  v12 = 2654435761 * self->_departureFrequencyMax;
  if ((v9 & 1) == 0)
    goto LABEL_14;
LABEL_10:
  v13 = 2654435761u * self->_tripMuid;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v12 ^ v13 ^ -[NSString hash](self->_vehicleNumber, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOTransitVehicleTime *arrivalTime;
  uint64_t v6;
  GEOTransitVehicleTime *departureTime;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int16 v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "readAll:", 0);
  v4 = v15;
  arrivalTime = self->_arrivalTime;
  v6 = *((_QWORD *)v15 + 6);
  if (arrivalTime)
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTransitVehicleTime mergeFrom:](arrivalTime, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[GEOTransitVehicleInfo setArrivalTime:](self, "setArrivalTime:");
  }
  v4 = v15;
LABEL_7:
  departureTime = self->_departureTime;
  v8 = *((_QWORD *)v4 + 7);
  if (departureTime)
  {
    if (!v8)
      goto LABEL_13;
    -[GEOTransitVehicleTime mergeFrom:](departureTime, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[GEOTransitVehicleInfo setDepartureTime:](self, "setDepartureTime:");
  }
  v4 = v15;
LABEL_13:
  v9 = *((_WORD *)v4 + 56);
  if ((v9 & 8) != 0)
  {
    self->_lineIndex = *((_DWORD *)v4 + 25);
    *(_WORD *)&self->_flags |= 8u;
    v9 = *((_WORD *)v4 + 56);
  }
  if ((v9 & 0x20) != 0)
  {
    self->_routeLineArtworkIndex = *((_DWORD *)v4 + 27);
    *(_WORD *)&self->_flags |= 0x20u;
  }
  v10 = objc_msgSend(v4, "clusteredRouteLineArtworkIndexsCount");
  if (v10)
  {
    v11 = v10;
    for (i = 0; i != v11; ++i)
      -[GEOTransitVehicleInfo addClusteredRouteLineArtworkIndex:](self, "addClusteredRouteLineArtworkIndex:", objc_msgSend(v15, "clusteredRouteLineArtworkIndexAtIndex:", i));
  }
  v13 = v15;
  v14 = *((_WORD *)v15 + 56);
  if ((v14 & 0x10) != 0)
  {
    self->_pickupDropoffType = *((_DWORD *)v15 + 26);
    *(_WORD *)&self->_flags |= 0x10u;
    v14 = *((_WORD *)v15 + 56);
    if ((v14 & 4) == 0)
    {
LABEL_22:
      if ((v14 & 2) == 0)
        goto LABEL_23;
      goto LABEL_30;
    }
  }
  else if ((v14 & 4) == 0)
  {
    goto LABEL_22;
  }
  self->_departureFrequencyMin = *((_DWORD *)v15 + 24);
  *(_WORD *)&self->_flags |= 4u;
  v14 = *((_WORD *)v15 + 56);
  if ((v14 & 2) == 0)
  {
LABEL_23:
    if ((v14 & 1) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_30:
  self->_departureFrequencyMax = *((_DWORD *)v15 + 23);
  *(_WORD *)&self->_flags |= 2u;
  if ((*((_WORD *)v15 + 56) & 1) != 0)
  {
LABEL_24:
    self->_tripMuid = *((_QWORD *)v15 + 8);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_25:
  if (*((_QWORD *)v15 + 9))
  {
    -[GEOTransitVehicleInfo setVehicleNumber:](self, "setVehicleNumber:");
    v13 = v15;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitVehicleInfoReadSpecified((uint64_t)self, (unint64_t)self->_reader, unknownFields_tags_1882);
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
  *(_WORD *)&self->_flags |= 0x840u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitVehicleInfo readAll:](self, "readAll:", 0);
    -[GEOTransitVehicleTime clearUnknownFields:](self->_arrivalTime, "clearUnknownFields:", 1);
    -[GEOTransitVehicleTime clearUnknownFields:](self->_departureTime, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleNumber, 0);
  objc_storeStrong((id *)&self->_departureTime, 0);
  objc_storeStrong((id *)&self->_arrivalTime, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
