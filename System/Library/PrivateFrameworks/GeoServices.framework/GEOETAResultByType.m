@implementation GEOETAResultByType

- (GEOETAResultByType)init
{
  GEOETAResultByType *v2;
  GEOETAResultByType *v3;
  GEOETAResultByType *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETAResultByType;
  v2 = -[GEOETAResultByType init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETAResultByType)initWithData:(id)a3
{
  GEOETAResultByType *v3;
  GEOETAResultByType *v4;
  GEOETAResultByType *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETAResultByType;
  v3 = -[GEOETAResultByType initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)transportType
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_flags |= 0x4040u;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16448;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (id)transportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C21F58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RIDESHARE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)status
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20) != 0)
    return self->_status;
  else
    return 0;
}

- (void)setStatus:(int)a3
{
  *(_WORD *)&self->_flags |= 0x4020u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16416;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasStatus
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (id)statusAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 29)
  {
    if (a3 > 49)
    {
      if (a3 == 50)
        return CFSTR("STATUS_DEDUPED");
      if (a3 == 60)
        return CFSTR("VERSION_MISMATCH");
    }
    else
    {
      if (a3 == 30)
        return CFSTR("NEEDS_REFINEMENT");
      if (a3 == 40)
        return CFSTR("FAILED_NOT_AUTHORIZED");
    }
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  else
  {
    v3 = CFSTR("STATUS_SUCCESS");
    switch(a3)
    {
      case 0:
        return v3;
      case 1:
        v3 = CFSTR("STATUS_FAILED");
        return v3;
      case 2:
        result = CFSTR("STATUS_INCOMPLETE");
        break;
      case 3:
      case 4:
        goto LABEL_15;
      case 5:
        result = CFSTR("INVALID_REQUEST");
        break;
      default:
        if (a3 != 20)
          goto LABEL_15;
        result = CFSTR("FAILED_NO_RESULT");
        break;
    }
  }
  return result;
}

- (int)StringAsStatus:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)travelTimeBestEstimate
{
  return self->_travelTimeBestEstimate;
}

- (void)setTravelTimeBestEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4080u;
  self->_travelTimeBestEstimate = a3;
}

- (void)setHasTravelTimeBestEstimate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16512;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFF7F | v3;
}

- (BOOL)hasTravelTimeBestEstimate
{
  return (*(_WORD *)&self->_flags >> 7) & 1;
}

- (unsigned)historicTravelTime
{
  return self->_historicTravelTime;
}

- (void)setHistoricTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4004u;
  self->_historicTravelTime = a3;
}

- (void)setHasHistoricTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16388;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasHistoricTravelTime
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unsigned)distance
{
  return self->_distance;
}

- (void)setDistance:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4002u;
  self->_distance = a3;
}

- (void)setHasDistance:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16386;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasDistance
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (double)expectedTimeOfDeparture
{
  return self->_expectedTimeOfDeparture;
}

- (void)setExpectedTimeOfDeparture:(double)a3
{
  *(_WORD *)&self->_flags |= 0x4001u;
  self->_expectedTimeOfDeparture = a3;
}

- (void)setHasExpectedTimeOfDeparture:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x4000;
}

- (BOOL)hasExpectedTimeOfDeparture
{
  return *(_WORD *)&self->_flags & 1;
}

- (unsigned)travelTimeConservativeEstimate
{
  return self->_travelTimeConservativeEstimate;
}

- (void)setTravelTimeConservativeEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4200u;
  self->_travelTimeConservativeEstimate = a3;
}

- (void)setHasTravelTimeConservativeEstimate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16896;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFDFF | v3;
}

- (BOOL)hasTravelTimeConservativeEstimate
{
  return (*(_WORD *)&self->_flags >> 9) & 1;
}

- (unsigned)travelTimeAggressiveEstimate
{
  return self->_travelTimeAggressiveEstimate;
}

- (void)setTravelTimeAggressiveEstimate:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4100u;
  self->_travelTimeAggressiveEstimate = a3;
}

- (void)setHasTravelTimeAggressiveEstimate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16640;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFEFF | v3;
}

- (BOOL)hasTravelTimeAggressiveEstimate
{
  return HIBYTE(*(_WORD *)&self->_flags) & 1;
}

- (unsigned)staticTravelTime
{
  return self->_staticTravelTime;
}

- (void)setStaticTravelTime:(unsigned int)a3
{
  *(_WORD *)&self->_flags |= 0x4010u;
  self->_staticTravelTime = a3;
}

- (void)setHasStaticTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16400;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasStaticTravelTime
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readSummaryForPredictedDestinations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 104) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultByTypeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSummaryForPredictedDestinations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (NSMutableArray)summaryForPredictedDestinations
{
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  return self->_summaryForPredictedDestinations;
}

- (void)setSummaryForPredictedDestinations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *summaryForPredictedDestinations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;
  self->_summaryForPredictedDestinations = v4;

}

- (void)clearSummaryForPredictedDestinations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
  -[NSMutableArray removeAllObjects](self->_summaryForPredictedDestinations, "removeAllObjects");
}

- (void)addSummaryForPredictedDestination:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  -[GEOETAResultByType _addNoFlagsSummaryForPredictedDestination:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x4000u;
}

- (void)_addNoFlagsSummaryForPredictedDestination:(uint64_t)a1
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

- (unint64_t)summaryForPredictedDestinationsCount
{
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  return -[NSMutableArray count](self->_summaryForPredictedDestinations, "count");
}

- (id)summaryForPredictedDestinationAtIndex:(unint64_t)a3
{
  -[GEOETAResultByType _readSummaryForPredictedDestinations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_summaryForPredictedDestinations, "objectAtIndex:", a3);
}

+ (Class)summaryForPredictedDestinationType
{
  return (Class)objc_opt_class();
}

- (void)_readRouteTrafficDetail
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 104) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultByTypeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteTrafficDetail_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasRouteTrafficDetail
{
  -[GEOETAResultByType _readRouteTrafficDetail]((uint64_t)self);
  return self->_routeTrafficDetail != 0;
}

- (GEORouteTrafficDetail)routeTrafficDetail
{
  -[GEOETAResultByType _readRouteTrafficDetail]((uint64_t)self);
  return self->_routeTrafficDetail;
}

- (void)setRouteTrafficDetail:(id)a3
{
  *(_WORD *)&self->_flags |= 0x4800u;
  objc_storeStrong((id *)&self->_routeTrafficDetail, a3);
}

- (void)_readShortTrafficSummary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_WORD *)(a1 + 104) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETAResultByTypeReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShortTrafficSummary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasShortTrafficSummary
{
  -[GEOETAResultByType _readShortTrafficSummary]((uint64_t)self);
  return self->_shortTrafficSummary != 0;
}

- (GEOShortTrafficSummary)shortTrafficSummary
{
  -[GEOETAResultByType _readShortTrafficSummary]((uint64_t)self);
  return self->_shortTrafficSummary;
}

- (void)setShortTrafficSummary:(id)a3
{
  *(_WORD *)&self->_flags |= 0x5000u;
  objc_storeStrong((id *)&self->_shortTrafficSummary, a3);
}

- (int)licensePlateRestrictionImpact
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 8) != 0)
    return self->_licensePlateRestrictionImpact;
  else
    return 0;
}

- (void)setLicensePlateRestrictionImpact:(int)a3
{
  *(_WORD *)&self->_flags |= 0x4008u;
  self->_licensePlateRestrictionImpact = a3;
}

- (void)setHasLicensePlateRestrictionImpact:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16392;
  else
    v3 = 0x4000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasLicensePlateRestrictionImpact
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (id)licensePlateRestrictionImpactAsString:(int)a3
{
  if (a3 < 8)
    return off_1E1C21F90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLicensePlateRestrictionImpact:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)GEOETAResultByType;
  -[GEOETAResultByType description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETAResultByType dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETAResultByType _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  uint64_t v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  uint64_t v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x40) != 0)
  {
    v6 = *(int *)(a1 + 88);
    if (v6 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1C21F58[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("transportType"));

    v5 = *(_WORD *)(a1 + 104);
  }
  if ((v5 & 0x20) != 0)
  {
    v8 = *(_DWORD *)(a1 + 84);
    if (v8 <= 29)
    {
      v9 = CFSTR("STATUS_SUCCESS");
      switch(v8)
      {
        case 0:
          goto LABEL_25;
        case 1:
          v9 = CFSTR("STATUS_FAILED");
          break;
        case 2:
          v9 = CFSTR("STATUS_INCOMPLETE");
          break;
        case 3:
        case 4:
          goto LABEL_20;
        case 5:
          v9 = CFSTR("INVALID_REQUEST");
          break;
        default:
          if (v8 != 20)
            goto LABEL_20;
          v9 = CFSTR("FAILED_NO_RESULT");
          break;
      }
      goto LABEL_25;
    }
    if (v8 > 49)
    {
      if (v8 == 50)
      {
        v9 = CFSTR("STATUS_DEDUPED");
        goto LABEL_25;
      }
      if (v8 == 60)
      {
        v9 = CFSTR("VERSION_MISMATCH");
        goto LABEL_25;
      }
    }
    else
    {
      if (v8 == 30)
      {
        v9 = CFSTR("NEEDS_REFINEMENT");
        goto LABEL_25;
      }
      if (v8 == 40)
      {
        v9 = CFSTR("FAILED_NOT_AUTHORIZED");
LABEL_25:
        objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("status"));

        v5 = *(_WORD *)(a1 + 104);
        goto LABEL_26;
      }
    }
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 84));
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
LABEL_26:
  if ((v5 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("travelTimeBestEstimate"));

    v5 = *(_WORD *)(a1 + 104);
    if ((v5 & 4) == 0)
    {
LABEL_28:
      if ((v5 & 2) == 0)
        goto LABEL_29;
      goto LABEL_57;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("historicTravelTime"));

  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 2) == 0)
  {
LABEL_29:
    if ((v5 & 1) == 0)
      goto LABEL_30;
    goto LABEL_58;
  }
LABEL_57:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 68));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("distance"));

  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 1) == 0)
  {
LABEL_30:
    if ((v5 & 0x200) == 0)
      goto LABEL_31;
    goto LABEL_59;
  }
LABEL_58:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 24));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("expectedTimeOfDeparture"));

  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x200) == 0)
  {
LABEL_31:
    if ((v5 & 0x100) == 0)
      goto LABEL_32;
LABEL_63:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 96));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v32 = CFSTR("travelTimeAggressiveEstimate");
    else
      v32 = CFSTR("travel_time_aggressive_estimate");
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

    if ((*(_WORD *)(a1 + 104) & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_33;
  }
LABEL_59:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 100));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("travelTimeConservativeEstimate");
  else
    v30 = CFSTR("travel_time_conservative_estimate");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v5 = *(_WORD *)(a1 + 104);
  if ((v5 & 0x100) != 0)
    goto LABEL_63;
LABEL_32:
  if ((v5 & 0x10) != 0)
  {
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("staticTravelTime");
    else
      v11 = CFSTR("static_travel_time");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
LABEL_37:
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v13 = *(id *)(a1 + 48);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v50 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("summaryForPredictedDestination");
    else
      v20 = CFSTR("summary_for_predicted_destination");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  objc_msgSend((id)a1, "routeTrafficDetail");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("routeTrafficDetail");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("route_traffic_detail");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  objc_msgSend((id)a1, "shortTrafficSummary");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("shortTrafficSummary");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("short_traffic_summary");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  if ((*(_WORD *)(a1 + 104) & 8) != 0)
  {
    v37 = *(int *)(a1 + 76);
    if (v37 >= 8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 76));
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v38 = off_1E1C21F90[v37];
    }
    if (a2)
      v39 = CFSTR("licensePlateRestrictionImpact");
    else
      v39 = CFSTR("license_plate_restriction_impact");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __48__GEOETAResultByType__dictionaryRepresentation___block_invoke;
      v47[3] = &unk_1E1C00600;
      v44 = v43;
      v48 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v47);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOETAResultByType _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOETAResultByType__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETAResultByType)initWithDictionary:(id)a3
{
  return (GEOETAResultByType *)-[GEOETAResultByType _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  GEOFormattedString *v30;
  uint64_t v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  GEORouteTrafficDetail *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEOShortTrafficSummary *v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  GEOFormattedString *v49;
  GEOFormattedString *v50;
  GEOFormattedString *v51;
  void *v52;
  id v53;
  GEOFormattedString *v54;
  GEOFormattedString *v55;
  GEOFormattedString *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  void *v62;
  id v63;
  void *v64;
  id v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
        {
          v8 = 0;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
        {
          v8 = 1;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
        {
          v8 = 2;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
        {
          v8 = 3;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
        {
          v8 = 4;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
        {
          v8 = 5;
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("RIDESHARE")))
        {
          v8 = 6;
        }
        else
        {
          v8 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_23;
        v8 = objc_msgSend(v6, "intValue");
      }
      objc_msgSend(a1, "setTransportType:", v8);
LABEL_23:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("status"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = v9;
        if ((objc_msgSend(v10, "isEqualToString:", CFSTR("STATUS_SUCCESS")) & 1) != 0)
        {
          v11 = 0;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("STATUS_FAILED")) & 1) != 0)
        {
          v11 = 1;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("STATUS_INCOMPLETE")) & 1) != 0)
        {
          v11 = 2;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("INVALID_REQUEST")) & 1) != 0)
        {
          v11 = 5;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FAILED_NO_RESULT")) & 1) != 0)
        {
          v11 = 20;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("NEEDS_REFINEMENT")) & 1) != 0)
        {
          v11 = 30;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FAILED_NOT_AUTHORIZED")) & 1) != 0)
        {
          v11 = 40;
        }
        else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("STATUS_DEDUPED")) & 1) != 0)
        {
          v11 = 50;
        }
        else if (objc_msgSend(v10, "isEqualToString:", CFSTR("VERSION_MISMATCH")))
        {
          v11 = 60;
        }
        else
        {
          v11 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_47;
        v11 = objc_msgSend(v9, "intValue");
      }
      objc_msgSend(a1, "setStatus:", v11);
LABEL_47:

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("travelTimeBestEstimate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTravelTimeBestEstimate:", objc_msgSend(v12, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("historicTravelTime"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHistoricTravelTime:", objc_msgSend(v13, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setDistance:", objc_msgSend(v14, "unsignedIntValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expectedTimeOfDeparture"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "doubleValue");
        objc_msgSend(a1, "setExpectedTimeOfDeparture:");
      }

      if (a3)
        v16 = CFSTR("travelTimeConservativeEstimate");
      else
        v16 = CFSTR("travel_time_conservative_estimate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTravelTimeConservativeEstimate:", objc_msgSend(v17, "unsignedIntValue"));

      if (a3)
        v18 = CFSTR("travelTimeAggressiveEstimate");
      else
        v18 = CFSTR("travel_time_aggressive_estimate");
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTravelTimeAggressiveEstimate:", objc_msgSend(v19, "unsignedIntValue"));

      if (a3)
        v20 = CFSTR("staticTravelTime");
      else
        v20 = CFSTR("static_travel_time");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setStaticTravelTime:", objc_msgSend(v21, "unsignedIntValue"));

      if (a3)
        v22 = CFSTR("summaryForPredictedDestination");
      else
        v22 = CFSTR("summary_for_predicted_destination");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v65 = v5;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v24 = v23;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v68;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v68 != v27)
                objc_enumerationMutation(v24);
              v29 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = [GEOFormattedString alloc];
                if ((a3 & 1) != 0)
                  v31 = -[GEOFormattedString initWithJSON:](v30, "initWithJSON:", v29);
                else
                  v31 = -[GEOFormattedString initWithDictionary:](v30, "initWithDictionary:", v29);
                v32 = (void *)v31;
                objc_msgSend(a1, "addSummaryForPredictedDestination:", v31);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
          }
          while (v26);
        }

        v5 = v65;
      }

      if (a3)
        v33 = CFSTR("routeTrafficDetail");
      else
        v33 = CFSTR("route_traffic_detail");
      objc_msgSend(v5, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v35 = [GEORouteTrafficDetail alloc];
        if ((a3 & 1) != 0)
          v36 = -[GEORouteTrafficDetail initWithJSON:](v35, "initWithJSON:", v34);
        else
          v36 = -[GEORouteTrafficDetail initWithDictionary:](v35, "initWithDictionary:", v34);
        v37 = (void *)v36;
        objc_msgSend(a1, "setRouteTrafficDetail:", v36);

      }
      if (a3)
        v38 = CFSTR("shortTrafficSummary");
      else
        v38 = CFSTR("short_traffic_summary");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEOShortTrafficSummary alloc];
        if (v40)
        {
          v41 = v39;
          v40 = -[GEOShortTrafficSummary init](v40, "init");
          if (v40)
          {
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("title"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v63 = v41;
              v64 = v39;
              v66 = v5;
              v73 = 0u;
              v74 = 0u;
              v71 = 0u;
              v72 = 0u;
              v62 = v42;
              v43 = v42;
              v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
              if (v44)
              {
                v45 = v44;
                v46 = *(_QWORD *)v72;
                do
                {
                  for (j = 0; j != v45; ++j)
                  {
                    if (*(_QWORD *)v72 != v46)
                      objc_enumerationMutation(v43);
                    v48 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * j);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v49 = [GEOFormattedString alloc];
                      if ((a3 & 1) != 0)
                        v50 = -[GEOFormattedString initWithJSON:](v49, "initWithJSON:", v48);
                      else
                        v50 = -[GEOFormattedString initWithDictionary:](v49, "initWithDictionary:", v48);
                      v51 = v50;
                      -[GEOShortTrafficSummary addTitle:]((uint64_t)v40, v50);

                    }
                  }
                  v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
                }
                while (v45);
              }

              v39 = v64;
              v5 = v66;
              v41 = v63;
            }

            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("detail"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v53 = v41;
              v54 = [GEOFormattedString alloc];
              if ((a3 & 1) != 0)
                v55 = -[GEOFormattedString initWithJSON:](v54, "initWithJSON:", v52);
              else
                v55 = -[GEOFormattedString initWithDictionary:](v54, "initWithDictionary:", v52);
              v56 = v55;
              -[GEOShortTrafficSummary setDetail:]((uint64_t)v40, v55);

              v41 = v53;
            }

          }
        }
        objc_msgSend(a1, "setShortTrafficSummary:", v40, v62, v63, v64);

      }
      if (a3)
        v57 = CFSTR("licensePlateRestrictionImpact");
      else
        v57 = CFSTR("license_plate_restriction_impact");
      objc_msgSend(v5, "objectForKeyedSubscript:", v57);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v59 = v58;
        if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_UNKNOWN")) & 1) != 0)
        {
          v60 = 0;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_NOT_AFFECTED")) & 1) != 0)
        {
          v60 = 1;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_AVOIDS_RESTRICTION")) & 1) != 0)
        {
          v60 = 2;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_POTENTIALLY_AFFECTED")) & 1) != 0)
        {
          v60 = 3;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_IN")) & 1) != 0)
        {
          v60 = 4;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_DESTINATION_IN")) & 1) != 0)
        {
          v60 = 5;
        }
        else if ((objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_ORIGIN_DESTINATION_IN")) & 1) != 0)
        {
          v60 = 6;
        }
        else if (objc_msgSend(v59, "isEqualToString:", CFSTR("RESTRICTION_ZONE_IMPACT_CUT_THROUGH")))
        {
          v60 = 7;
        }
        else
        {
          v60 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_148:

          goto LABEL_149;
        }
        v60 = objc_msgSend(v58, "intValue");
      }
      objc_msgSend(a1, "setLicensePlateRestrictionImpact:", v60);
      goto LABEL_148;
    }
  }
LABEL_149:

  return a1;
}

- (GEOETAResultByType)initWithJSON:(id)a3
{
  return (GEOETAResultByType *)-[GEOETAResultByType _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_734;
    else
      v8 = (int *)&readAll__nonRecursiveTag_735;
    GEOETAResultByTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETAResultByTypeCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETAResultByTypeIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETAResultByTypeReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOETAResultByTypeIsDirty((uint64_t)self) & 1) == 0)
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
    goto LABEL_37;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResultByType readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_5:
      if ((flags & 0x80) == 0)
        goto LABEL_6;
      goto LABEL_29;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_6:
    if ((flags & 4) == 0)
      goto LABEL_7;
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_7:
    if ((flags & 2) == 0)
      goto LABEL_8;
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_8:
    if ((flags & 1) == 0)
      goto LABEL_9;
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_9:
    if ((flags & 0x200) == 0)
      goto LABEL_10;
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_10:
    if ((flags & 0x100) == 0)
      goto LABEL_11;
LABEL_34:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0)
    goto LABEL_34;
LABEL_11:
  if ((flags & 0x10) != 0)
LABEL_12:
    PBDataWriterWriteUint32Field();
LABEL_13:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_summaryForPredictedDestinations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  if (self->_routeTrafficDetail)
    PBDataWriterWriteSubmessage();
  if (self->_shortTrafficSummary)
    PBDataWriterWriteSubmessage();
  if ((*(_WORD *)&self->_flags & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_37:

}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;
  id *v10;

  v10 = (id *)a3;
  -[GEOETAResultByType readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v10 + 1, self->_reader);
  *((_DWORD *)v10 + 14) = self->_readerMarkPos;
  *((_DWORD *)v10 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *((_DWORD *)v10 + 22) = self->_transportType;
    *((_WORD *)v10 + 52) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_3:
      if ((flags & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v10 + 21) = self->_status;
  *((_WORD *)v10 + 52) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_4:
    if ((flags & 4) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v10 + 23) = self->_travelTimeBestEstimate;
  *((_WORD *)v10 + 52) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_5:
    if ((flags & 2) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v10 + 18) = self->_historicTravelTime;
  *((_WORD *)v10 + 52) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v10 + 17) = self->_distance;
  *((_WORD *)v10 + 52) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_28;
  }
LABEL_27:
  v10[3] = *(id *)&self->_expectedTimeOfDeparture;
  *((_WORD *)v10 + 52) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_8:
    if ((flags & 0x100) == 0)
      goto LABEL_9;
LABEL_29:
    *((_DWORD *)v10 + 24) = self->_travelTimeAggressiveEstimate;
    *((_WORD *)v10 + 52) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  *((_DWORD *)v10 + 25) = self->_travelTimeConservativeEstimate;
  *((_WORD *)v10 + 52) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0)
    goto LABEL_29;
LABEL_9:
  if ((flags & 0x10) != 0)
  {
LABEL_10:
    *((_DWORD *)v10 + 20) = self->_staticTravelTime;
    *((_WORD *)v10 + 52) |= 0x10u;
  }
LABEL_11:
  if (-[GEOETAResultByType summaryForPredictedDestinationsCount](self, "summaryForPredictedDestinationsCount"))
  {
    objc_msgSend(v10, "clearSummaryForPredictedDestinations");
    v5 = -[GEOETAResultByType summaryForPredictedDestinationsCount](self, "summaryForPredictedDestinationsCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOETAResultByType summaryForPredictedDestinationAtIndex:](self, "summaryForPredictedDestinationAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addSummaryForPredictedDestination:", v8);

      }
    }
  }
  if (self->_routeTrafficDetail)
    objc_msgSend(v10, "setRouteTrafficDetail:");
  v9 = v10;
  if (self->_shortTrafficSummary)
  {
    objc_msgSend(v10, "setShortTrafficSummary:");
    v9 = v10;
  }
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v9 + 19) = self->_licensePlateRestrictionImpact;
    *((_WORD *)v9 + 52) |= 8u;
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
  id v15;
  void *v16;
  id v17;
  void *v18;
  PBUnknownFields *v19;
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
    if ((*(_WORD *)&self->_flags & 0x4000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETAResultByTypeReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_25;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETAResultByType readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_transportType;
    *(_WORD *)(v5 + 104) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 0x80) == 0)
        goto LABEL_8;
      goto LABEL_28;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 84) = self->_status;
  *(_WORD *)(v5 + 104) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 0x80) == 0)
  {
LABEL_8:
    if ((flags & 4) == 0)
      goto LABEL_9;
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 92) = self->_travelTimeBestEstimate;
  *(_WORD *)(v5 + 104) |= 0x80u;
  flags = (__int16)self->_flags;
  if ((flags & 4) == 0)
  {
LABEL_9:
    if ((flags & 2) == 0)
      goto LABEL_10;
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 72) = self->_historicTravelTime;
  *(_WORD *)(v5 + 104) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_10:
    if ((flags & 1) == 0)
      goto LABEL_11;
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 68) = self->_distance;
  *(_WORD *)(v5 + 104) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_11:
    if ((flags & 0x200) == 0)
      goto LABEL_12;
    goto LABEL_32;
  }
LABEL_31:
  *(double *)(v5 + 24) = self->_expectedTimeOfDeparture;
  *(_WORD *)(v5 + 104) |= 1u;
  flags = (__int16)self->_flags;
  if ((flags & 0x200) == 0)
  {
LABEL_12:
    if ((flags & 0x100) == 0)
      goto LABEL_13;
LABEL_33:
    *(_DWORD *)(v5 + 96) = self->_travelTimeAggressiveEstimate;
    *(_WORD *)(v5 + 104) |= 0x100u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_32:
  *(_DWORD *)(v5 + 100) = self->_travelTimeConservativeEstimate;
  *(_WORD *)(v5 + 104) |= 0x200u;
  flags = (__int16)self->_flags;
  if ((flags & 0x100) != 0)
    goto LABEL_33;
LABEL_13:
  if ((flags & 0x10) != 0)
  {
LABEL_14:
    *(_DWORD *)(v5 + 80) = self->_staticTravelTime;
    *(_WORD *)(v5 + 104) |= 0x10u;
  }
LABEL_15:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = self->_summaryForPredictedDestinations;
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
        objc_msgSend((id)v5, "addSummaryForPredictedDestination:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  v15 = -[GEORouteTrafficDetail copyWithZone:](self->_routeTrafficDetail, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v15;

  v17 = -[GEOShortTrafficSummary copyWithZone:](self->_shortTrafficSummary, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v17;

  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_licensePlateRestrictionImpact;
    *(_WORD *)(v5 + 104) |= 8u;
  }
  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_25:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSMutableArray *summaryForPredictedDestinations;
  GEORouteTrafficDetail *routeTrafficDetail;
  GEOShortTrafficSummary *shortTrafficSummary;
  __int16 v10;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  -[GEOETAResultByType readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 52);
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_transportType != *((_DWORD *)v4 + 22))
      goto LABEL_58;
  }
  else if ((v6 & 0x40) != 0)
  {
LABEL_58:
    v11 = 0;
    goto LABEL_59;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_status != *((_DWORD *)v4 + 21))
      goto LABEL_58;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_travelTimeBestEstimate != *((_DWORD *)v4 + 23))
      goto LABEL_58;
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_historicTravelTime != *((_DWORD *)v4 + 18))
      goto LABEL_58;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_distance != *((_DWORD *)v4 + 17))
      goto LABEL_58;
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_expectedTimeOfDeparture != *((double *)v4 + 3))
      goto LABEL_58;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x200) == 0 || self->_travelTimeConservativeEstimate != *((_DWORD *)v4 + 25))
      goto LABEL_58;
  }
  else if ((*((_WORD *)v4 + 52) & 0x200) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_flags & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 52) & 0x100) == 0 || self->_travelTimeAggressiveEstimate != *((_DWORD *)v4 + 24))
      goto LABEL_58;
  }
  else if ((*((_WORD *)v4 + 52) & 0x100) != 0)
  {
    goto LABEL_58;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_staticTravelTime != *((_DWORD *)v4 + 20))
      goto LABEL_58;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  summaryForPredictedDestinations = self->_summaryForPredictedDestinations;
  if ((unint64_t)summaryForPredictedDestinations | *((_QWORD *)v4 + 6)
    && !-[NSMutableArray isEqual:](summaryForPredictedDestinations, "isEqual:"))
  {
    goto LABEL_58;
  }
  routeTrafficDetail = self->_routeTrafficDetail;
  if ((unint64_t)routeTrafficDetail | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORouteTrafficDetail isEqual:](routeTrafficDetail, "isEqual:"))
      goto LABEL_58;
  }
  shortTrafficSummary = self->_shortTrafficSummary;
  if ((unint64_t)shortTrafficSummary | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOShortTrafficSummary isEqual:](shortTrafficSummary, "isEqual:"))
      goto LABEL_58;
  }
  v10 = *((_WORD *)v4 + 52);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_licensePlateRestrictionImpact != *((_DWORD *)v4 + 19))
      goto LABEL_58;
    v11 = 1;
  }
  else
  {
    v11 = (v10 & 8) == 0;
  }
LABEL_59:

  return v11;
}

- (unint64_t)hash
{
  __int16 flags;
  double expectedTimeOfDeparture;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  -[GEOETAResultByType readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 0x40) != 0)
  {
    v21 = 2654435761 * self->_transportType;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_status;
      if ((flags & 0x80) != 0)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  else
  {
    v21 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_3;
  }
  v20 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_4:
    v19 = 2654435761 * self->_travelTimeBestEstimate;
    if ((flags & 4) != 0)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v19 = 0;
  if ((flags & 4) != 0)
  {
LABEL_5:
    v18 = 2654435761 * self->_historicTravelTime;
    if ((flags & 2) != 0)
      goto LABEL_6;
LABEL_15:
    v17 = 0;
    if ((flags & 1) != 0)
      goto LABEL_7;
LABEL_16:
    v8 = 0;
    goto LABEL_19;
  }
LABEL_14:
  v18 = 0;
  if ((flags & 2) == 0)
    goto LABEL_15;
LABEL_6:
  v17 = 2654435761 * self->_distance;
  if ((flags & 1) == 0)
    goto LABEL_16;
LABEL_7:
  expectedTimeOfDeparture = self->_expectedTimeOfDeparture;
  v5 = -expectedTimeOfDeparture;
  if (expectedTimeOfDeparture >= 0.0)
    v5 = self->_expectedTimeOfDeparture;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0)
      v8 += (unint64_t)v7;
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_19:
  if ((flags & 0x200) == 0)
  {
    v9 = 0;
    if ((flags & 0x100) != 0)
      goto LABEL_21;
LABEL_24:
    v10 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_22;
    goto LABEL_25;
  }
  v9 = 2654435761 * self->_travelTimeConservativeEstimate;
  if ((flags & 0x100) == 0)
    goto LABEL_24;
LABEL_21:
  v10 = 2654435761 * self->_travelTimeAggressiveEstimate;
  if ((flags & 0x10) != 0)
  {
LABEL_22:
    v11 = 2654435761 * self->_staticTravelTime;
    goto LABEL_26;
  }
LABEL_25:
  v11 = 0;
LABEL_26:
  v12 = -[NSMutableArray hash](self->_summaryForPredictedDestinations, "hash");
  v13 = -[GEORouteTrafficDetail hash](self->_routeTrafficDetail, "hash");
  v14 = -[GEOShortTrafficSummary hash](self->_shortTrafficSummary, "hash");
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v15 = 2654435761 * self->_licensePlateRestrictionImpact;
  else
    v15 = 0;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  __int16 v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  GEORouteTrafficDetail *routeTrafficDetail;
  uint64_t v12;
  GEOShortTrafficSummary *shortTrafficSummary;
  void *v14;
  void **v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  GEOFormattedString *detail;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x40) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 22);
    *(_WORD *)&self->_flags |= 0x40u;
    v5 = *((_WORD *)v4 + 52);
    if ((v5 & 0x20) == 0)
    {
LABEL_3:
      if ((v5 & 0x80) == 0)
        goto LABEL_4;
      goto LABEL_23;
    }
  }
  else if ((v5 & 0x20) == 0)
  {
    goto LABEL_3;
  }
  self->_status = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_flags |= 0x20u;
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x80) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0)
      goto LABEL_5;
    goto LABEL_24;
  }
LABEL_23:
  self->_travelTimeBestEstimate = *((_DWORD *)v4 + 23);
  *(_WORD *)&self->_flags |= 0x80u;
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0)
      goto LABEL_6;
    goto LABEL_25;
  }
LABEL_24:
  self->_historicTravelTime = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_flags |= 4u;
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  self->_distance = *((_DWORD *)v4 + 17);
  *(_WORD *)&self->_flags |= 2u;
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x200) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  self->_expectedTimeOfDeparture = *((double *)v4 + 3);
  *(_WORD *)&self->_flags |= 1u;
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x200) == 0)
  {
LABEL_8:
    if ((v5 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_28;
  }
LABEL_27:
  self->_travelTimeConservativeEstimate = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_flags |= 0x200u;
  v5 = *((_WORD *)v4 + 52);
  if ((v5 & 0x100) == 0)
  {
LABEL_9:
    if ((v5 & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_28:
  self->_travelTimeAggressiveEstimate = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_flags |= 0x100u;
  if ((*((_WORD *)v4 + 52) & 0x10) != 0)
  {
LABEL_10:
    self->_staticTravelTime = *((_DWORD *)v4 + 20);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_11:
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = *((id *)v4 + 6);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v6);
        -[GEOETAResultByType addSummaryForPredictedDestination:](self, "addSummaryForPredictedDestination:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v8);
  }

  routeTrafficDetail = self->_routeTrafficDetail;
  v12 = *((_QWORD *)v4 + 4);
  if (routeTrafficDetail)
  {
    if (v12)
      -[GEORouteTrafficDetail mergeFrom:](routeTrafficDetail, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOETAResultByType setRouteTrafficDetail:](self, "setRouteTrafficDetail:");
  }
  shortTrafficSummary = self->_shortTrafficSummary;
  v14 = (void *)*((_QWORD *)v4 + 5);
  if (shortTrafficSummary)
  {
    if (v14)
    {
      v15 = v14;
      -[GEOShortTrafficSummary readAll:]((uint64_t)v15, 0);
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v16 = v15[4];
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v16);
            -[GEOShortTrafficSummary addTitle:]((uint64_t)shortTrafficSummary, *(void **)(*((_QWORD *)&v27 + 1) + 8 * j));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v18);
      }

      detail = shortTrafficSummary->_detail;
      v22 = v15[3];
      if (detail)
      {
        if (v22)
          -[GEOFormattedString mergeFrom:](detail, "mergeFrom:");
      }
      else if (v22)
      {
        -[GEOShortTrafficSummary setDetail:]((uint64_t)shortTrafficSummary, v15[3]);
      }

    }
  }
  else if (v14)
  {
    -[GEOETAResultByType setShortTrafficSummary:](self, "setShortTrafficSummary:");
  }
  if ((*((_WORD *)v4 + 52) & 8) != 0)
  {
    self->_licensePlateRestrictionImpact = *((_DWORD *)v4 + 19);
    *(_WORD *)&self->_flags |= 8u;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x400) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETAResultByTypeReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_738);
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
  GEOShortTrafficSummary *shortTrafficSummary;
  PBUnknownFields *v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x4400u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETAResultByType readAll:](self, "readAll:", 0);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v7 = self->_summaryForPredictedDestinations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v20;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v20 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11++), "clearUnknownFields:", 1, (_QWORD)v19);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v9);
    }

    -[GEORouteTrafficDetail clearUnknownFields:](self->_routeTrafficDetail, "clearUnknownFields:", 1);
    shortTrafficSummary = self->_shortTrafficSummary;
    if (shortTrafficSummary)
    {
      os_unfair_lock_lock_with_options();
      *(_BYTE *)&shortTrafficSummary->_flags |= 1u;
      *(_BYTE *)&shortTrafficSummary->_flags |= 8u;
      os_unfair_lock_unlock(&shortTrafficSummary->_readerLock);
      v13 = shortTrafficSummary->_unknownFields;
      shortTrafficSummary->_unknownFields = 0;

      -[GEOShortTrafficSummary readAll:]((uint64_t)shortTrafficSummary, 0);
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v14 = shortTrafficSummary->_titles;
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v18++), "clearUnknownFields:", 1, (_QWORD)v19);
          }
          while (v16 != v18);
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v16);
      }

      -[GEOFormattedString clearUnknownFields:](shortTrafficSummary->_detail, "clearUnknownFields:", 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryForPredictedDestinations, 0);
  objc_storeStrong((id *)&self->_shortTrafficSummary, 0);
  objc_storeStrong((id *)&self->_routeTrafficDetail, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
