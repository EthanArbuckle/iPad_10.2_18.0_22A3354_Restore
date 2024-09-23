@implementation GEOETARequest

- (GEOETARequest)initWithQuickETARequest:(id)a3
{
  id v4;
  GEOETARequest *v5;
  void *v6;
  GEOETARequest *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GEOTransitOptions *v23;
  void *v24;
  GEOAutomobileOptions *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  GEOAutomobileOptions *v34;
  void *v35;
  GEOTransitOptions *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _BYTE *v43;
  uint64_t v44;
  int v45;
  uint64_t *v46;
  GEOETARequest *v47;
  id v49;
  uint64_t v50;
  _BYTE v51[3];
  uint64_t v52;
  _BYTE v53[3];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD v58[4];
  GEOETARequest *v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v60.receiver = self;
  v60.super_class = (Class)GEOETARequest;
  v5 = -[GEOETARequest init](&v60, sel_init);
  if (v5)
  {
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __63__GEOETARequest_GEOQuickETARequester__initWithQuickETARequest___block_invoke;
    v58[3] = &unk_1E1C04548;
    v7 = v5;
    v59 = v7;
    objc_msgSend(v6, "shortSessionValues:", v58);

    +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOETARequest setAdditionalEnabledMarkets:](v7, "setAdditionalEnabledMarkets:", v8);

    -[GEOETARequest setWalkingLimitMeters:](v7, "setWalkingLimitMeters:", 0);
    objc_msgSend(v4, "sourceWaypoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "geoWaypointTyped");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOETARequest setOriginWaypointTyped:](v7, "setOriginWaypointTyped:", v10);

    objc_msgSend(v4, "destinationWaypoint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "geoWaypointTyped");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOETARequest addDestinationWaypointTyped:](v7, "addDestinationWaypointTyped:", v12);

    -[GEOETARequest setIncludeHistoricTravelTime:](v7, "setIncludeHistoricTravelTime:", 1);
    -[GEOETARequest setTransportType:](v7, "setTransportType:", objc_msgSend(v4, "transportType"));
    objc_msgSend(v4, "automobileOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[GEOETARequest setAutomobileOptions:](v7, "setAutomobileOptions:", v14);

    objc_msgSend(v4, "transitOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    -[GEOETARequest setTransitOptions:](v7, "setTransitOptions:", v16);

    objc_msgSend(v4, "walkingOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "copy");
    -[GEOETARequest setWalkingOptions:](v7, "setWalkingOptions:", v18);

    objc_msgSend(v4, "cyclingOptions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");
    -[GEOETARequest setCyclingOptions:](v7, "setCyclingOptions:", v20);

    -[GEOETARequest automobileOptions](v7, "automobileOptions");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {

    }
    else if (!-[GEOETARequest transportType](v7, "transportType"))
    {
      v25 = objc_alloc_init(GEOAutomobileOptions);
      -[GEOETARequest setAutomobileOptions:](v7, "setAutomobileOptions:", v25);

      -[GEOETARequest automobileOptions](v7, "automobileOptions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setIncludeHistoricTravelTime:", 1);

      -[GEOETARequest automobileOptions](v7, "automobileOptions");
      v23 = (GEOTransitOptions *)objc_claimAutoreleasedReturnValue();
      -[GEOTransitOptions setTrafficType:](v23, "setTrafficType:", 3);
      goto LABEL_17;
    }
    -[GEOETARequest transitOptions](v7, "transitOptions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else if (-[GEOETARequest transportType](v7, "transportType") == 1)
    {
      v23 = objc_alloc_init(GEOTransitOptions);
      -[GEOETARequest setTransitOptions:](v7, "setTransitOptions:", v23);
      goto LABEL_17;
    }
    -[GEOETARequest walkingOptions](v7, "walkingOptions");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {

    }
    else if (-[GEOETARequest transportType](v7, "transportType") == 2)
    {
      v23 = objc_alloc_init(GEOWalkingOptions);
      -[GEOETARequest setWalkingOptions:](v7, "setWalkingOptions:", v23);
      goto LABEL_17;
    }
    -[GEOETARequest cyclingOptions](v7, "cyclingOptions");
    v23 = (GEOTransitOptions *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      if (-[GEOETARequest transportType](v7, "transportType") != 3)
        goto LABEL_18;
      v23 = objc_alloc_init(GEOCyclingOptions);
      -[GEOETARequest setCyclingOptions:](v7, "setCyclingOptions:", v23);
    }
LABEL_17:

LABEL_18:
    objc_msgSend(v4, "additionalTransportTypesRequested");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v49 = v4;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v4, "additionalTransportTypesRequested");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v55 != v31)
              objc_enumerationMutation(v28);
            switch(objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * i), "integerValue"))
            {
              case 0:
                -[GEOETARequest automobileOptions](v7, "automobileOptions");
                v33 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v33)
                {
                  v34 = objc_alloc_init(GEOAutomobileOptions);
                  -[GEOETARequest setAutomobileOptions:](v7, "setAutomobileOptions:", v34);

                  -[GEOETARequest automobileOptions](v7, "automobileOptions");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "setIncludeHistoricTravelTime:", 1);

                  -[GEOETARequest automobileOptions](v7, "automobileOptions");
                  v36 = (GEOTransitOptions *)objc_claimAutoreleasedReturnValue();
                  -[GEOTransitOptions setTrafficType:](v36, "setTrafficType:", 3);
                  goto LABEL_33;
                }
                break;
              case 1:
                -[GEOETARequest transitOptions](v7, "transitOptions");
                v37 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v37)
                {
                  v36 = objc_alloc_init(GEOTransitOptions);
                  -[GEOETARequest setTransitOptions:](v7, "setTransitOptions:", v36);
                  goto LABEL_33;
                }
                break;
              case 2:
                -[GEOETARequest walkingOptions](v7, "walkingOptions");
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v38)
                {
                  v36 = objc_alloc_init(GEOWalkingOptions);
                  -[GEOETARequest setWalkingOptions:](v7, "setWalkingOptions:", v36);
                  goto LABEL_33;
                }
                break;
              case 3:
                -[GEOETARequest cyclingOptions](v7, "cyclingOptions");
                v39 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v39)
                {
                  v36 = objc_alloc_init(GEOCyclingOptions);
                  -[GEOETARequest setCyclingOptions:](v7, "setCyclingOptions:", v36);
LABEL_33:

                }
                break;
              default:
                continue;
            }
          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v54, v61, 16);
        }
        while (v30);
      }

      v4 = v49;
    }
    -[GEOETARequest setIncludeDistance:](v7, "setIncludeDistance:", objc_msgSend(v4, "includeDistance"));
    objc_msgSend(v4, "arrivalDate");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "departureDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if ((v40 == 0) != (v41 != 0))
      goto LABEL_43;
    if (v40)
    {
      v43 = v53;
      objc_msgSend(v40, "timeIntervalSinceReferenceDate");
      v52 = 0;
      v45 = 1;
      v46 = &v52;
    }
    else
    {
      if (!v41)
      {
LABEL_43:
        v47 = v7;

        goto LABEL_44;
      }
      v43 = v51;
      objc_msgSend(v41, "timeIntervalSinceReferenceDate");
      v45 = 0;
      v50 = 0;
      v46 = &v50;
    }
    v46[1] = v44;
    *((_DWORD *)v46 + 4) = v45;
    *((_BYTE *)v46 + 20) = 6;
    v43[2] = 0;
    *(_WORD *)v43 = 0;
    -[GEOETARequest setTimepoint:](v7, "setTimepoint:");
    goto LABEL_43;
  }
LABEL_44:

  return v5;
}

void __63__GEOETARequest_GEOQuickETARequester__initWithQuickETARequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
{
  GEOPrivacyMetadata *v15;
  void *v16;
  id v17;

  objc_msgSend(*(id *)(a1 + 32), "setSessionID:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setSessionRelativeTimestamp:", a6);
  if (a10)
  {
    v15 = objc_alloc_init(GEOPrivacyMetadata);
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyMetadata:", v15);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIsUnderageAccount:", a8);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsManagedAccount:", a9);

  }
}

- (GEOETARequest)init
{
  GEOETARequest *v2;
  GEOETARequest *v3;
  GEOETARequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOETARequest;
  v2 = -[GEOETARequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOETARequest)initWithData:(id)a3
{
  GEOETARequest *v3;
  GEOETARequest *v4;
  GEOETARequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOETARequest;
  v3 = -[GEOETARequest initWithData:](&v7, sel_initWithData_, a3);
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
  $D0E8D0B55C880D94E0AADD8662313484 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x10) != 0)
    return self->_transportType;
  else
    return 0;
}

- (void)setTransportType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000010uLL;
  self->_transportType = a3;
}

- (void)setHasTransportType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000010;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasTransportType
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
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

- (GEOTimepoint)timepoint
{
  *retstr = self[1];
  return self;
}

- (void)setTimepoint:(GEOTimepoint *)a3
{
  uint64_t v3;

  *(_QWORD *)&self->_flags |= 0x20000000001uLL;
  v3 = *(_QWORD *)&a3->_type;
  *(_OWORD *)&self->_timepoint._currentUserTime = *(_OWORD *)&a3->_currentUserTime;
  *(_QWORD *)&self->_timepoint._type = v3;
}

- (void)setHasTimepoint:(BOOL)a3
{
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x20000000000);
}

- (BOOL)hasTimepoint
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOrigin_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOrigin
{
  -[GEOETARequest _readOrigin]((uint64_t)self);
  return self->_origin != 0;
}

- (GEOWaypoint)origin
{
  -[GEOETARequest _readOrigin]((uint64_t)self);
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20020000000uLL;
  objc_storeStrong((id *)&self->_origin, a3);
}

- (void)_readDestinations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)destinations
{
  -[GEOETARequest _readDestinations]((uint64_t)self);
  return self->_destinations;
}

- (void)setDestinations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *destinations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  destinations = self->_destinations;
  self->_destinations = v4;

}

- (void)clearDestinations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_destinations, "removeAllObjects");
}

- (void)addDestination:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readDestinations]((uint64_t)self);
  -[GEOETARequest _addNoFlagsDestination:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsDestination:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 120);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 120);
      *(_QWORD *)(a1 + 120) = v5;

      v4 = *(void **)(a1 + 120);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)destinationsCount
{
  -[GEOETARequest _readDestinations]((uint64_t)self);
  return -[NSMutableArray count](self->_destinations, "count");
}

- (id)destinationAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readDestinations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_destinations, "objectAtIndex:", a3);
}

+ (Class)destinationType
{
  return (Class)objc_opt_class();
}

- (BOOL)includeHistoricTravelTime
{
  return self->_includeHistoricTravelTime;
}

- (void)setIncludeHistoricTravelTime:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000100uLL;
  self->_includeHistoricTravelTime = a3;
}

- (void)setHasIncludeHistoricTravelTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000100;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasIncludeHistoricTravelTime
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (BOOL)allowPartialResults
{
  return self->_allowPartialResults;
}

- (void)setAllowPartialResults:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000040uLL;
  self->_allowPartialResults = a3;
}

- (void)setHasAllowPartialResults:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000040;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAllowPartialResults
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (BOOL)includeDistance
{
  return self->_includeDistance;
}

- (void)setIncludeDistance:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000080uLL;
  self->_includeDistance = a3;
}

- (void)setHasIncludeDistance:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000080;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasIncludeDistance
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (GEOSessionID)sessionID
{
  GEOSessionID *p_sessionID;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionID = &self->_sessionID;
  high = self->_sessionID._high;
  low = p_sessionID->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (void)setSessionID:(GEOSessionID)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000002uLL;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000002;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSessionID
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000004uLL;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000004;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (unsigned)walkingLimitMeters
{
  os_unfair_lock_s *p_readerLock;
  $D0E8D0B55C880D94E0AADD8662313484 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_walkingLimitMeters;
  else
    return 800000;
}

- (void)setWalkingLimitMeters:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000020uLL;
  self->_walkingLimitMeters = a3;
}

- (void)setHasWalkingLimitMeters:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000020;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasWalkingLimitMeters
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readAdditionalEnabledMarkets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 321) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  -[GEOETARequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEOETARequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20000008000uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (void)_readOriginWaypointTyped
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginWaypointTyped_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOriginWaypointTyped
{
  -[GEOETARequest _readOriginWaypointTyped]((uint64_t)self);
  return self->_originWaypointTyped != 0;
}

- (GEOWaypointTyped)originWaypointTyped
{
  -[GEOETARequest _readOriginWaypointTyped]((uint64_t)self);
  return self->_originWaypointTyped;
}

- (void)setOriginWaypointTyped:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20002000000uLL;
  objc_storeStrong((id *)&self->_originWaypointTyped, a3);
}

- (void)_readDestinationWaypointTypeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationWaypointTypeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)destinationWaypointTypeds
{
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  return self->_destinationWaypointTypeds;
}

- (void)setDestinationWaypointTypeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *destinationWaypointTypeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  self->_destinationWaypointTypeds = v4;

}

- (void)clearDestinationWaypointTypeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_destinationWaypointTypeds, "removeAllObjects");
}

- (void)addDestinationWaypointTyped:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  -[GEOETARequest _addNoFlagsDestinationWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsDestinationWaypointTyped:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 112);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 112);
      *(_QWORD *)(a1 + 112) = v5;

      v4 = *(void **)(a1 + 112);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)destinationWaypointTypedsCount
{
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  return -[NSMutableArray count](self->_destinationWaypointTypeds, "count");
}

- (id)destinationWaypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_destinationWaypointTypeds, "objectAtIndex:", a3);
}

+ (Class)destinationWaypointTypedType
{
  return (Class)objc_opt_class();
}

- (void)_readIntermediateWaypointTypeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIntermediateWaypointTypeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)intermediateWaypointTypeds
{
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  return self->_intermediateWaypointTypeds;
}

- (void)setIntermediateWaypointTypeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *intermediateWaypointTypeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;
  self->_intermediateWaypointTypeds = v4;

}

- (void)clearIntermediateWaypointTypeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_intermediateWaypointTypeds, "removeAllObjects");
}

- (void)addIntermediateWaypointTyped:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  -[GEOETARequest _addNoFlagsIntermediateWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsIntermediateWaypointTyped:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 136);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 136);
      *(_QWORD *)(a1 + 136) = v5;

      v4 = *(void **)(a1 + 136);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)intermediateWaypointTypedsCount
{
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  return -[NSMutableArray count](self->_intermediateWaypointTypeds, "count");
}

- (id)intermediateWaypointTypedAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_intermediateWaypointTypeds, "objectAtIndex:", a3);
}

+ (Class)intermediateWaypointTypedType
{
  return (Class)objc_opt_class();
}

- (void)_readAutomobileOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutomobileOptions_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasAutomobileOptions
{
  -[GEOETARequest _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions != 0;
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEOETARequest _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20000010000uLL;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void)_readCyclingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingOptions_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasCyclingOptions
{
  -[GEOETARequest _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEOETARequest _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20000080000uLL;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)_readTransitOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitOptions_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasTransitOptions
{
  -[GEOETARequest _readTransitOptions]((uint64_t)self);
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEOETARequest _readTransitOptions]((uint64_t)self);
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x28000000000uLL;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)_readWalkingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 325) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingOptions_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasWalkingOptions
{
  -[GEOETARequest _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEOETARequest _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x30000000000uLL;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (BOOL)isFromAPI
{
  return self->_isFromAPI;
}

- (void)setIsFromAPI:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000001000uLL;
  self->_isFromAPI = a3;
}

- (void)setHasIsFromAPI:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000001000;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasIsFromAPI
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (void)_readCommonOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommonOptions_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasCommonOptions
{
  -[GEOETARequest _readCommonOptions]((uint64_t)self);
  return self->_commonOptions != 0;
}

- (GEOCommonOptions)commonOptions
{
  -[GEOETARequest _readCommonOptions]((uint64_t)self);
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20000040000uLL;
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (void)_readSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasSessionState
{
  -[GEOETARequest _readSessionState]((uint64_t)self);
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEOETARequest _readSessionState]((uint64_t)self);
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x21000000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (void)_readOriginalRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteID_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOriginalRouteID
{
  -[GEOETARequest _readOriginalRouteID]((uint64_t)self);
  return self->_originalRouteID != 0;
}

- (NSData)originalRouteID
{
  -[GEOETARequest _readOriginalRouteID]((uint64_t)self);
  return self->_originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20004000000uLL;
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- (void)_readOriginalRouteZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteZilchPoints_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)originalRouteZilchPoints
{
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  return self->_originalRouteZilchPoints;
}

- (void)setOriginalRouteZilchPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *originalRouteZilchPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  self->_originalRouteZilchPoints = v4;

}

- (void)clearOriginalRouteZilchPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_originalRouteZilchPoints, "removeAllObjects");
}

- (void)addOriginalRouteZilchPoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  -[GEOETARequest _addNoFlagsOriginalRouteZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsOriginalRouteZilchPoints:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 168);
      *(_QWORD *)(a1 + 168) = v5;

      v4 = *(void **)(a1 + 168);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)originalRouteZilchPointsCount
{
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_originalRouteZilchPoints, "count");
}

- (id)originalRouteZilchPointsAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readOriginalRouteZilchPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_originalRouteZilchPoints, "objectAtIndex:", a3);
}

+ (Class)originalRouteZilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalWaypointRoute
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalWaypointRoute_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasOriginalWaypointRoute
{
  -[GEOETARequest _readOriginalWaypointRoute]((uint64_t)self);
  return self->_originalWaypointRoute != 0;
}

- (GEOOriginalWaypointRoute)originalWaypointRoute
{
  -[GEOETARequest _readOriginalWaypointRoute]((uint64_t)self);
  return self->_originalWaypointRoute;
}

- (void)setOriginalWaypointRoute:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20010000000uLL;
  objc_storeStrong((id *)&self->_originalWaypointRoute, a3);
}

- (void)_readDeviceHistoricalLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  return self->_deviceHistoricalLocations;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceHistoricalLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;

}

- (void)clearDeviceHistoricalLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_deviceHistoricalLocations, "removeAllObjects");
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEOETARequest _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsDeviceHistoricalLocation:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceHistoricalLocations, "count");
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceHistoricalLocations, "objectAtIndex:", a3);
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 322) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEOETARequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEOETARequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20000020000uLL;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (void)_readLastKnownRoadLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastKnownRoadLocation_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasLastKnownRoadLocation
{
  -[GEOETARequest _readLastKnownRoadLocation]((uint64_t)self);
  return self->_lastKnownRoadLocation != 0;
}

- (GEOLocation)lastKnownRoadLocation
{
  -[GEOETARequest _readLastKnownRoadLocation]((uint64_t)self);
  return self->_lastKnownRoadLocation;
}

- (void)setLastKnownRoadLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20001000000uLL;
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, a3);
}

- (void)_readAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 321) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbClientMetadata_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasAbClientMetadata
{
  -[GEOETARequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEOETARequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20000004000uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (BOOL)includeRouteTrafficDetail
{
  os_unfair_lock_s *p_readerLock;
  $D0E8D0B55C880D94E0AADD8662313484 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x400) != 0 && self->_includeRouteTrafficDetail;
}

- (void)setIncludeRouteTrafficDetail:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000400uLL;
  self->_includeRouteTrafficDetail = a3;
}

- (void)setHasIncludeRouteTrafficDetail:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000400;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasIncludeRouteTrafficDetail
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (BOOL)includeShortTrafficSummary
{
  return self->_includeShortTrafficSummary;
}

- (void)setIncludeShortTrafficSummary:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000800uLL;
  self->_includeShortTrafficSummary = a3;
}

- (void)setHasIncludeShortTrafficSummary:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000800;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasIncludeShortTrafficSummary
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (void)_readPhoneticLocaleIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneticLocaleIdentifier_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasPhoneticLocaleIdentifier
{
  -[GEOETARequest _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier != 0;
}

- (NSString)phoneticLocaleIdentifier
{
  -[GEOETARequest _readPhoneticLocaleIdentifier]((uint64_t)self);
  return self->_phoneticLocaleIdentifier;
}

- (void)setPhoneticLocaleIdentifier:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20080000000uLL;
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, a3);
}

- (void)_readRequestingAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppId_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasRequestingAppId
{
  -[GEOETARequest _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEOETARequest _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20400000000uLL;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (BOOL)includeEtaRouteIncidents
{
  return self->_includeEtaRouteIncidents;
}

- (void)setIncludeEtaRouteIncidents:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000200uLL;
  self->_includeEtaRouteIncidents = a3;
}

- (void)setHasIncludeEtaRouteIncidents:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000200;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFDFFLL | v3);
}

- (BOOL)hasIncludeEtaRouteIncidents
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readRecentLocationHistory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentLocationHistory_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasRecentLocationHistory
{
  -[GEOETARequest _readRecentLocationHistory]((uint64_t)self);
  return self->_recentLocationHistory != 0;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  -[GEOETARequest _readRecentLocationHistory]((uint64_t)self);
  return self->_recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20200000000uLL;
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (void)_readPrivacyMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasPrivacyMetadata
{
  -[GEOETARequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOETARequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20100000000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (void)_readPathComputationOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 323) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPathComputationOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (BOOL)hasPathComputationOptions
{
  -[GEOETARequest _readPathComputationOptions]((uint64_t)self);
  return self->_pathComputationOptions != 0;
}

- (GEOPathComputationOptions)pathComputationOptions
{
  -[GEOETARequest _readPathComputationOptions]((uint64_t)self);
  return self->_pathComputationOptions;
}

- (void)setPathComputationOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x20040000000uLL;
  objc_storeStrong((id *)&self->_pathComputationOptions, a3);
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceTags_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (void)addServiceTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  -[GEOETARequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsServiceTag:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 232);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 232);
      *(_QWORD *)(a1 + 232) = v5;

      v4 = *(void **)(a1 + 232);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)serviceTagsCount
{
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readServiceTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceTags, "objectAtIndex:", a3);
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficApiResponses
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficApiResponses_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)trafficApiResponses
{
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  return self->_trafficApiResponses;
}

- (void)setTrafficApiResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficApiResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  trafficApiResponses = self->_trafficApiResponses;
  self->_trafficApiResponses = v4;

}

- (void)clearTrafficApiResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficApiResponses, "removeAllObjects");
}

- (void)addTrafficApiResponses:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  -[GEOETARequest _addNoFlagsTrafficApiResponses:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsTrafficApiResponses:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 256);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 256);
      *(_QWORD *)(a1 + 256) = v5;

      v4 = *(void **)(a1 + 256);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficApiResponsesCount
{
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficApiResponses, "count");
}

- (id)trafficApiResponsesAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readTrafficApiResponses]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficApiResponses, "objectAtIndex:", a3);
}

+ (Class)trafficApiResponsesType
{
  return (Class)objc_opt_class();
}

- (void)_readTrafficSnapshotIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 324) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOETARequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficSnapshotIds_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (NSMutableArray)trafficSnapshotIds
{
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  return self->_trafficSnapshotIds;
}

- (void)setTrafficSnapshotIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficSnapshotIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;
  self->_trafficSnapshotIds = v4;

}

- (void)clearTrafficSnapshotIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficSnapshotIds, "removeAllObjects");
}

- (void)addTrafficSnapshotIds:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  -[GEOETARequest _addNoFlagsTrafficSnapshotIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
}

- (void)_addNoFlagsTrafficSnapshotIds:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 264);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 264);
      *(_QWORD *)(a1 + 264) = v5;

      v4 = *(void **)(a1 + 264);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficSnapshotIdsCount
{
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficSnapshotIds, "count");
}

- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3
{
  -[GEOETARequest _readTrafficSnapshotIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_trafficSnapshotIds, "objectAtIndex:", a3);
}

+ (Class)trafficSnapshotIdsType
{
  return (Class)objc_opt_class();
}

- (unsigned)trafficSnapshotUnixTime
{
  return self->_trafficSnapshotUnixTime;
}

- (void)setTrafficSnapshotUnixTime:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x20000000008uLL;
  self->_trafficSnapshotUnixTime = a3;
}

- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (a3)
    v3 = 0x20000000008;
  self->_flags = ($D0E8D0B55C880D94E0AADD8662313484)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasTrafficSnapshotUnixTime
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
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
  v8.super_class = (Class)GEOETARequest;
  -[GEOETARequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETARequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOETARequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  const __CFString *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  id v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  id v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t m;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  const __CFString *v88;
  id v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  const __CFString *v104;
  id v105;
  void *v106;
  void *v107;
  void *v108;
  const __CFString *v109;
  id v110;
  uint64_t v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  const __CFString *v121;
  void *v122;
  void *v123;
  void *v124;
  const __CFString *v125;
  id v126;
  void *v127;
  void *v128;
  void *v129;
  const __CFString *v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  const __CFString *v135;
  id v136;
  void *v137;
  id v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t ii;
  void *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t jj;
  void *v153;
  void *v154;
  void *v155;
  const __CFString *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  id v161;
  id v162;
  id v163;
  _QWORD v165[4];
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE v200[128];
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  v6 = *(_QWORD *)(a1 + 320);
  if ((v6 & 0x10) != 0)
  {
    v7 = *(int *)(a1 + 304);
    if (v7 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 304));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C21F58[v7];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("transportType"));

    v6 = *(_QWORD *)(a1 + 320);
  }
  if ((v6 & 1) != 0)
  {
    _GEOTimepointDictionaryRepresentation(a1 + 24, a2);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("timepoint"));
  }
  objc_msgSend((id)a1, "origin");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("origin"));
  }

  if (objc_msgSend(*(id *)(a1 + 120), "count"))
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 120), "count"));
    v191 = 0u;
    v192 = 0u;
    v193 = 0u;
    v194 = 0u;
    v14 = *(id *)(a1 + 120);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v191, v201, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v192;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v192 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v191 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v19, "jsonRepresentation");
          else
            objc_msgSend(v19, "dictionaryRepresentation");
          v20 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "addObject:", v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v191, v201, 16);
      }
      while (v16);
    }

    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("destination"));
    v5 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  v21 = *(_QWORD *)(a1 + 320);
  if ((v21 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 314));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("includeHistoricTravelTime"));

    v21 = *(_QWORD *)(a1 + 320);
    if ((v21 & 0x40) == 0)
    {
LABEL_28:
      if ((v21 & 0x80) == 0)
        goto LABEL_29;
      goto LABEL_38;
    }
  }
  else if ((v21 & 0x40) == 0)
  {
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 312));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("allowPartialResults"));

  v21 = *(_QWORD *)(a1 + 320);
  if ((v21 & 0x80) == 0)
  {
LABEL_29:
    if ((v21 & 2) == 0)
      goto LABEL_30;
    goto LABEL_39;
  }
LABEL_38:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 313));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("includeDistance"));

  v21 = *(_QWORD *)(a1 + 320);
  if ((v21 & 2) == 0)
  {
LABEL_30:
    if ((v21 & 4) == 0)
      goto LABEL_31;
    goto LABEL_40;
  }
LABEL_39:
  _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 48));
  v28 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setObject:forKey:", v28, CFSTR("sessionID"));
  v21 = *(_QWORD *)(a1 + 320);
  if ((v21 & 4) == 0)
  {
LABEL_31:
    if ((v21 & 0x20) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
LABEL_40:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 240));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("sessionRelativeTimestamp");
  else
    v30 = CFSTR("session_relative_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  if ((*(_QWORD *)(a1 + 320) & 0x20) != 0)
  {
LABEL_32:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 308));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("walkingLimitMeters"));

  }
LABEL_33:
  objc_msgSend((id)a1, "additionalEnabledMarkets");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v23, "jsonRepresentation");
    else
      objc_msgSend(v23, "dictionaryRepresentation");
    v31 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("additionalEnabledMarkets"));
  }

  objc_msgSend((id)a1, "originWaypointTyped");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v32, "jsonRepresentation");
    else
      objc_msgSend(v32, "dictionaryRepresentation");
    v34 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v34, CFSTR("originWaypointTyped"));
  }

  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v36 = *(id *)(a1 + 112);
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v187, v200, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v188;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v188 != v39)
            objc_enumerationMutation(v36);
          v41 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v41, "jsonRepresentation");
          else
            objc_msgSend(v41, "dictionaryRepresentation");
          v42 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v35, "addObject:", v42);
        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v187, v200, 16);
      }
      while (v38);
    }

    objc_msgSend(v4, "setObject:forKey:", v35, CFSTR("destinationWaypointTyped"));
    v5 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  if (objc_msgSend(*(id *)(a1 + 136), "count"))
  {
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 136), "count"));
    v183 = 0u;
    v184 = 0u;
    v185 = 0u;
    v186 = 0u;
    v44 = *(id *)(a1 + 136);
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v183, v199, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v184;
      do
      {
        for (k = 0; k != v46; ++k)
        {
          if (*(_QWORD *)v184 != v47)
            objc_enumerationMutation(v44);
          v49 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v49, "jsonRepresentation");
          else
            objc_msgSend(v49, "dictionaryRepresentation");
          v50 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v43, "addObject:", v50);
        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v183, v199, 16);
      }
      while (v46);
    }

    if (a2)
      v51 = CFSTR("intermediateWaypointTyped");
    else
      v51 = CFSTR("intermediate_waypoint_typed");
    objc_msgSend(v4, "setObject:forKey:", v43, v51);

    v5 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  objc_msgSend((id)a1, "automobileOptions");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v52)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v52, "jsonRepresentation");
    else
      objc_msgSend(v52, "dictionaryRepresentation");
    v54 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("automobileOptions"));
  }

  objc_msgSend((id)a1, "cyclingOptions");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v55, "jsonRepresentation");
    else
      objc_msgSend(v55, "dictionaryRepresentation");
    v57 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("cyclingOptions"));
  }

  objc_msgSend((id)a1, "transitOptions");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v58, "jsonRepresentation");
    else
      objc_msgSend(v58, "dictionaryRepresentation");
    v60 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v60, CFSTR("transitOptions"));
  }

  objc_msgSend((id)a1, "walkingOptions");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v61, "jsonRepresentation");
    else
      objc_msgSend(v61, "dictionaryRepresentation");
    v63 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("walkingOptions"));
  }

  if ((*(_BYTE *)(a1 + v5[140] + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 318));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("isFromAPI"));

  }
  objc_msgSend((id)a1, "commonOptions");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v65, "jsonRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("commonOptions");
    }
    else
    {
      objc_msgSend(v65, "dictionaryRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("common_options");
    }
    v69 = v67;

    objc_msgSend(v4, "setObject:forKey:", v69, v68);
  }

  objc_msgSend((id)a1, "sessionState");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v70)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v70, "base64EncodedStringWithOptions:", 0);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v70, CFSTR("session_state"));
    }
  }

  objc_msgSend((id)a1, "originalRouteID");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (v73)
  {
    v74 = v73;
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "base64EncodedStringWithOptions:", 0);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("originalRouteID"));

      if (!*(_QWORD *)(a1 + 168))
        goto LABEL_127;
      goto LABEL_116;
    }
    objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("originalRouteID"));

    if (*(_QWORD *)(a1 + 168))
      goto LABEL_125;
  }
  else if (*(_QWORD *)(a1 + 168))
  {
    if (a2)
    {
LABEL_116:
      v76 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "originalRouteZilchPoints");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "arrayWithCapacity:", objc_msgSend(v77, "count"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v181 = 0u;
      v182 = 0u;
      v179 = 0u;
      v180 = 0u;
      objc_msgSend((id)a1, "originalRouteZilchPoints");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v179, v198, 16);
      if (v80)
      {
        v81 = v80;
        v82 = *(_QWORD *)v180;
        do
        {
          for (m = 0; m != v81; ++m)
          {
            if (*(_QWORD *)v180 != v82)
              objc_enumerationMutation(v79);
            objc_msgSend(*(id *)(*((_QWORD *)&v179 + 1) + 8 * m), "base64EncodedStringWithOptions:", 0);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "addObject:", v84);

          }
          v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v179, v198, 16);
        }
        while (v81);
      }

      v5 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
      goto LABEL_126;
    }
LABEL_125:
    objc_msgSend((id)a1, "originalRouteZilchPoints");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_126:
    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("originalRouteZilchPoints"));

  }
LABEL_127:
  objc_msgSend((id)a1, "originalWaypointRoute");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v85;
  if (v85)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v85, "jsonRepresentation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("originalWaypointRoute");
    }
    else
    {
      objc_msgSend(v85, "dictionaryRepresentation");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = CFSTR("original_waypoint_route");
    }
    v89 = v87;

    objc_msgSend(v4, "setObject:forKey:", v89, v88);
  }

  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v90 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v91 = *(id *)(a1 + 128);
    v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v175, v197, 16);
    if (v92)
    {
      v93 = v92;
      v94 = *(_QWORD *)v176;
      do
      {
        for (n = 0; n != v93; ++n)
        {
          if (*(_QWORD *)v176 != v94)
            objc_enumerationMutation(v91);
          v96 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v96, "jsonRepresentation");
          else
            objc_msgSend(v96, "dictionaryRepresentation");
          v97 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v90, "addObject:", v97);
        }
        v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v175, v197, 16);
      }
      while (v93);
    }

    objc_msgSend(v4, "setObject:forKey:", v90, CFSTR("deviceHistoricalLocation"));
    v5 = &OBJC_IVAR___GEORPRapResponse__displayDetails;
  }
  objc_msgSend((id)a1, "clientCapabilities");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98;
  if (v98)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v98, "jsonRepresentation");
    else
      objc_msgSend(v98, "dictionaryRepresentation");
    v100 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v100, CFSTR("clientCapabilities"));
  }

  objc_msgSend((id)a1, "lastKnownRoadLocation");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v101;
  if (v101)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v101, "jsonRepresentation");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CFSTR("lastKnownRoadLocation");
    }
    else
    {
      objc_msgSend(v101, "dictionaryRepresentation");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v104 = CFSTR("last_known_road_location");
    }
    v105 = v103;

    objc_msgSend(v4, "setObject:forKey:", v105, v104);
  }

  objc_msgSend((id)a1, "abClientMetadata");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v107 = v106;
  if (v106)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v106, "jsonRepresentation");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = CFSTR("abClientMetadata");
    }
    else
    {
      objc_msgSend(v106, "dictionaryRepresentation");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v109 = CFSTR("ab_client_metadata");
    }
    v110 = v108;

    objc_msgSend(v4, "setObject:forKey:", v110, v109);
  }

  v111 = *(_QWORD *)(a1 + v5[140]);
  if ((v111 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 316));
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v113 = CFSTR("includeRouteTrafficDetail");
    else
      v113 = CFSTR("include_route_traffic_detail");
    objc_msgSend(v4, "setObject:forKey:", v112, v113);

    v111 = *(_QWORD *)(a1 + 320);
  }
  if ((v111 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 317));
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v115 = CFSTR("includeShortTrafficSummary");
    else
      v115 = CFSTR("include_short_traffic_summary");
    objc_msgSend(v4, "setObject:forKey:", v114, v115);

  }
  objc_msgSend((id)a1, "phoneticLocaleIdentifier");
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (v116)
  {
    if (a2)
      v117 = CFSTR("phoneticLocaleIdentifier");
    else
      v117 = CFSTR("phonetic_locale_identifier");
    objc_msgSend(v4, "setObject:forKey:", v116, v117);
  }

  objc_msgSend((id)a1, "requestingAppId");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (v118)
  {
    if (a2)
      v119 = CFSTR("requestingAppId");
    else
      v119 = CFSTR("requesting_app_id");
    objc_msgSend(v4, "setObject:forKey:", v118, v119);
  }

  if ((*(_BYTE *)(a1 + v5[140] + 1) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 315));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v121 = CFSTR("includeEtaRouteIncidents");
    else
      v121 = CFSTR("include_eta_route_incidents");
    objc_msgSend(v4, "setObject:forKey:", v120, v121);

  }
  objc_msgSend((id)a1, "recentLocationHistory");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  v123 = v122;
  if (v122)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v122, "jsonRepresentation");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = CFSTR("recentLocationHistory");
    }
    else
    {
      objc_msgSend(v122, "dictionaryRepresentation");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = CFSTR("recent_location_history");
    }
    v126 = v124;

    objc_msgSend(v4, "setObject:forKey:", v126, v125);
  }

  objc_msgSend((id)a1, "privacyMetadata");
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  v128 = v127;
  if (v127)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v127, "jsonRepresentation");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = CFSTR("privacyMetadata");
    }
    else
    {
      objc_msgSend(v127, "dictionaryRepresentation");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = CFSTR("privacy_metadata");
    }
    v131 = v129;

    objc_msgSend(v4, "setObject:forKey:", v131, v130);
  }

  objc_msgSend((id)a1, "pathComputationOptions");
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  v133 = v132;
  if (v132)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v132, "jsonRepresentation");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = CFSTR("pathComputationOptions");
    }
    else
    {
      objc_msgSend(v132, "dictionaryRepresentation");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v135 = CFSTR("path_computation_options");
    }
    v136 = v134;

    objc_msgSend(v4, "setObject:forKey:", v136, v135);
  }

  if (objc_msgSend(*(id *)(a1 + 232), "count"))
  {
    v137 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 232), "count"));
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v138 = *(id *)(a1 + 232);
    v139 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v171, v196, 16);
    if (v139)
    {
      v140 = v139;
      v141 = *(_QWORD *)v172;
      do
      {
        for (ii = 0; ii != v140; ++ii)
        {
          if (*(_QWORD *)v172 != v141)
            objc_enumerationMutation(v138);
          v143 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * ii);
          if ((a2 & 1) != 0)
            objc_msgSend(v143, "jsonRepresentation");
          else
            objc_msgSend(v143, "dictionaryRepresentation");
          v144 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v137, "addObject:", v144);
        }
        v140 = objc_msgSend(v138, "countByEnumeratingWithState:objects:count:", &v171, v196, 16);
      }
      while (v140);
    }

    objc_msgSend(v4, "setObject:forKey:", v137, CFSTR("serviceTag"));
  }
  if (*(_QWORD *)(a1 + 256))
  {
    if (a2)
    {
      v145 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "trafficApiResponses");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v145, "arrayWithCapacity:", objc_msgSend(v146, "count"));
      v147 = (void *)objc_claimAutoreleasedReturnValue();

      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      objc_msgSend((id)a1, "trafficApiResponses");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v167, v195, 16);
      if (v149)
      {
        v150 = v149;
        v151 = *(_QWORD *)v168;
        do
        {
          for (jj = 0; jj != v150; ++jj)
          {
            if (*(_QWORD *)v168 != v151)
              objc_enumerationMutation(v148);
            objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * jj), "base64EncodedStringWithOptions:", 0);
            v153 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v147, "addObject:", v153);

          }
          v150 = objc_msgSend(v148, "countByEnumeratingWithState:objects:count:", &v167, v195, 16);
        }
        while (v150);
      }

    }
    else
    {
      objc_msgSend((id)a1, "trafficApiResponses");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v147, CFSTR("trafficApiResponses"));

  }
  if (*(_QWORD *)(a1 + 264))
  {
    objc_msgSend((id)a1, "trafficSnapshotIds");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v154, CFSTR("trafficSnapshotIds"));

  }
  if ((*(_BYTE *)(a1 + v5[140]) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 300));
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v156 = CFSTR("trafficSnapshotUnixTime");
    else
      v156 = CFSTR("traffic_snapshot_unix_time");
    objc_msgSend(v4, "setObject:forKey:", v155, v156);

  }
  v157 = *(void **)(a1 + 16);
  if (v157)
  {
    objc_msgSend(v157, "dictionaryRepresentation");
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v159 = v158;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v158, "count"));
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v165[0] = MEMORY[0x1E0C809B0];
      v165[1] = 3221225472;
      v165[2] = __43__GEOETARequest__dictionaryRepresentation___block_invoke;
      v165[3] = &unk_1E1C00600;
      v161 = v160;
      v166 = v161;
      objc_msgSend(v159, "enumerateKeysAndObjectsUsingBlock:", v165);
      v162 = v161;

      v159 = v162;
    }
    objc_msgSend(v4, "setObject:forKey:", v159, CFSTR("Unknown Fields"));

  }
  v163 = v4;

  return v163;
}

- (id)jsonRepresentation
{
  return -[GEOETARequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __43__GEOETARequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOETARequest)initWithDictionary:(id)a3
{
  return (GEOETARequest *)-[GEOETARequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  GEOWaypoint *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  GEOWaypoint *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  GEOAdditionalEnabledMarkets *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  GEOWaypointTyped *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  GEOWaypointTyped *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t k;
  uint64_t v56;
  GEOWaypointTyped *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  GEOAutomobileOptions *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  GEOCyclingOptions *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  GEOTransitOptions *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  GEOWalkingOptions *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  GEOCommonOptions *v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t m;
  uint64_t v93;
  void *v94;
  const __CFString *v95;
  void *v96;
  GEOOriginalWaypointRoute *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t n;
  uint64_t v106;
  GEOLocation *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  GEOClientCapabilities *v111;
  uint64_t v112;
  void *v113;
  const __CFString *v114;
  void *v115;
  GEOLocation *v116;
  uint64_t v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  GEOPDABClientDatasetMetadata *v121;
  uint64_t v122;
  void *v123;
  const __CFString *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  void *v133;
  const __CFString *v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  GEORecentLocationHistory *v138;
  uint64_t v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  GEOPrivacyMetadata *v143;
  uint64_t v144;
  void *v145;
  const __CFString *v146;
  void *v147;
  GEOPathComputationOptions *v148;
  id v149;
  const __CFString *v150;
  void *v151;
  id v152;
  int v153;
  void *v154;
  id v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t ii;
  uint64_t v160;
  GEOGeoServiceTag *v161;
  uint64_t v162;
  void *v163;
  void *v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t jj;
  uint64_t v170;
  void *v171;
  void *v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t kk;
  void *v178;
  void *v179;
  const __CFString *v180;
  void *v181;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  uint64_t v223;
  __int128 v224;
  uint64_t v225;
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  _BYTE v231[128];
  _BYTE v232[128];
  _BYTE v233[128];
  uint64_t v234;

  v234 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_298;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_298;
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

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timepoint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v224 = 0uLL;
    v225 = 0;
    _GEOTimepointFromDictionaryRepresentation(v9, (uint64_t)&v224, a3);
    v222 = v224;
    v223 = v225;
    objc_msgSend(a1, "setTimepoint:", &v222);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("origin"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOWaypoint alloc];
    if ((a3 & 1) != 0)
      v12 = -[GEOWaypoint initWithJSON:](v11, "initWithJSON:", v10);
    else
      v12 = -[GEOWaypoint initWithDictionary:](v11, "initWithDictionary:", v10);
    v13 = (void *)v12;
    objc_msgSend(a1, "setOrigin:", v12);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destination"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v189 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v220 = 0u;
    v221 = 0u;
    v218 = 0u;
    v219 = 0u;
    v183 = v14;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v218, v233, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v219;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v219 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v21 = [GEOWaypoint alloc];
            if ((a3 & 1) != 0)
              v22 = -[GEOWaypoint initWithJSON:](v21, "initWithJSON:", v20);
            else
              v22 = -[GEOWaypoint initWithDictionary:](v21, "initWithDictionary:", v20);
            v23 = (void *)v22;
            objc_msgSend(a1, "addDestination:", v22, v183);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v218, v233, 16);
      }
      while (v17);
    }

    v14 = v183;
    v5 = v189;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeHistoricTravelTime"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeHistoricTravelTime:", objc_msgSend(v24, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("allowPartialResults"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setAllowPartialResults:", objc_msgSend(v25, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("includeDistance"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeDistance:", objc_msgSend(v26, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v224 = 0uLL;
    _GEOSessionIDFromDictionaryRepresentation(v27, &v224);
    objc_msgSend(a1, "setSessionID:", v224);
  }

  if (a3)
    v28 = CFSTR("sessionRelativeTimestamp");
  else
    v28 = CFSTR("session_relative_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v28, v183);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v29, "doubleValue");
    objc_msgSend(a1, "setSessionRelativeTimestamp:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingLimitMeters"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setWalkingLimitMeters:", objc_msgSend(v30, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalEnabledMarkets"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v32 = [GEOAdditionalEnabledMarkets alloc];
    if ((a3 & 1) != 0)
      v33 = -[GEOAdditionalEnabledMarkets initWithJSON:](v32, "initWithJSON:", v31);
    else
      v33 = -[GEOAdditionalEnabledMarkets initWithDictionary:](v32, "initWithDictionary:", v31);
    v34 = (void *)v33;
    objc_msgSend(a1, "setAdditionalEnabledMarkets:", v33);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originWaypointTyped"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOWaypointTyped alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOWaypointTyped initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOWaypointTyped initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = (void *)v37;
    objc_msgSend(a1, "setOriginWaypointTyped:", v37);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("destinationWaypointTyped"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v216 = 0u;
    v217 = 0u;
    v214 = 0u;
    v215 = 0u;
    v184 = v39;
    v40 = v39;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v215;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v215 != v43)
            objc_enumerationMutation(v40);
          v45 = *(_QWORD *)(*((_QWORD *)&v214 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = [GEOWaypointTyped alloc];
            if ((a3 & 1) != 0)
              v47 = -[GEOWaypointTyped initWithJSON:](v46, "initWithJSON:", v45);
            else
              v47 = -[GEOWaypointTyped initWithDictionary:](v46, "initWithDictionary:", v45);
            v48 = (void *)v47;
            objc_msgSend(a1, "addDestinationWaypointTyped:", v47, v184);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v214, v232, 16);
      }
      while (v42);
    }

    v39 = v184;
    v5 = v189;
  }

  if (a3)
    v49 = CFSTR("intermediateWaypointTyped");
  else
    v49 = CFSTR("intermediate_waypoint_typed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49, v184);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v212 = 0u;
    v213 = 0u;
    v210 = 0u;
    v211 = 0u;
    v185 = v50;
    v51 = v50;
    v52 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v210, v231, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v211;
      do
      {
        for (k = 0; k != v53; ++k)
        {
          if (*(_QWORD *)v211 != v54)
            objc_enumerationMutation(v51);
          v56 = *(_QWORD *)(*((_QWORD *)&v210 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v57 = [GEOWaypointTyped alloc];
            if ((a3 & 1) != 0)
              v58 = -[GEOWaypointTyped initWithJSON:](v57, "initWithJSON:", v56);
            else
              v58 = -[GEOWaypointTyped initWithDictionary:](v57, "initWithDictionary:", v56);
            v59 = (void *)v58;
            objc_msgSend(a1, "addIntermediateWaypointTyped:", v58, v185);

          }
        }
        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v210, v231, 16);
      }
      while (v53);
    }

    v50 = v185;
    v5 = v189;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("automobileOptions"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = [GEOAutomobileOptions alloc];
    if ((a3 & 1) != 0)
      v62 = -[GEOAutomobileOptions initWithJSON:](v61, "initWithJSON:", v60);
    else
      v62 = -[GEOAutomobileOptions initWithDictionary:](v61, "initWithDictionary:", v60);
    v63 = (void *)v62;
    objc_msgSend(a1, "setAutomobileOptions:", v62, v185);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cyclingOptions"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v65 = [GEOCyclingOptions alloc];
    if ((a3 & 1) != 0)
      v66 = -[GEOCyclingOptions initWithJSON:](v65, "initWithJSON:", v64);
    else
      v66 = -[GEOCyclingOptions initWithDictionary:](v65, "initWithDictionary:", v64);
    v67 = (void *)v66;
    objc_msgSend(a1, "setCyclingOptions:", v66, v185);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transitOptions"));
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v69 = [GEOTransitOptions alloc];
    if ((a3 & 1) != 0)
      v70 = -[GEOTransitOptions initWithJSON:](v69, "initWithJSON:", v68);
    else
      v70 = -[GEOTransitOptions initWithDictionary:](v69, "initWithDictionary:", v68);
    v71 = (void *)v70;
    objc_msgSend(a1, "setTransitOptions:", v70, v185);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("walkingOptions"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v73 = [GEOWalkingOptions alloc];
    if ((a3 & 1) != 0)
      v74 = -[GEOWalkingOptions initWithJSON:](v73, "initWithJSON:", v72);
    else
      v74 = -[GEOWalkingOptions initWithDictionary:](v73, "initWithDictionary:", v72);
    v75 = (void *)v74;
    objc_msgSend(a1, "setWalkingOptions:", v74, v185);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFromAPI"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFromAPI:", objc_msgSend(v76, "BOOLValue"));

  if (a3)
    v77 = CFSTR("commonOptions");
  else
    v77 = CFSTR("common_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v77, v185);
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v79 = [GEOCommonOptions alloc];
    if ((a3 & 1) != 0)
      v80 = -[GEOCommonOptions initWithJSON:](v79, "initWithJSON:", v78);
    else
      v80 = -[GEOCommonOptions initWithDictionary:](v79, "initWithDictionary:", v78);
    v81 = (void *)v80;
    objc_msgSend(a1, "setCommonOptions:", v80);

  }
  if (a3)
    v82 = CFSTR("sessionState");
  else
    v82 = CFSTR("session_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v83, 0);
    objc_msgSend(a1, "setSessionState:", v84);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRouteID"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v85, 0);
    objc_msgSend(a1, "setOriginalRouteID:", v86);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRouteZilchPoints"));
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v208 = 0u;
    v209 = 0u;
    v206 = 0u;
    v207 = 0u;
    v186 = v87;
    v88 = v87;
    v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v206, v230, 16);
    if (v89)
    {
      v90 = v89;
      v91 = *(_QWORD *)v207;
      do
      {
        for (m = 0; m != v90; ++m)
        {
          if (*(_QWORD *)v207 != v91)
            objc_enumerationMutation(v88);
          v93 = *(_QWORD *)(*((_QWORD *)&v206 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v94 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v93, 0);
            objc_msgSend(a1, "addOriginalRouteZilchPoints:", v94);

          }
        }
        v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v206, v230, 16);
      }
      while (v90);
    }

    v87 = v186;
    v5 = v189;
  }

  if (a3)
    v95 = CFSTR("originalWaypointRoute");
  else
    v95 = CFSTR("original_waypoint_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v95, v186);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v97 = [GEOOriginalWaypointRoute alloc];
    if ((a3 & 1) != 0)
      v98 = -[GEOOriginalWaypointRoute initWithJSON:](v97, "initWithJSON:", v96);
    else
      v98 = -[GEOOriginalWaypointRoute initWithDictionary:](v97, "initWithDictionary:", v96);
    v99 = (void *)v98;
    objc_msgSend(a1, "setOriginalWaypointRoute:", v98);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceHistoricalLocation"));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v204 = 0u;
    v205 = 0u;
    v202 = 0u;
    v203 = 0u;
    v187 = v100;
    v101 = v100;
    v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v202, v229, 16);
    if (v102)
    {
      v103 = v102;
      v104 = *(_QWORD *)v203;
      do
      {
        for (n = 0; n != v103; ++n)
        {
          if (*(_QWORD *)v203 != v104)
            objc_enumerationMutation(v101);
          v106 = *(_QWORD *)(*((_QWORD *)&v202 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v107 = [GEOLocation alloc];
            if ((a3 & 1) != 0)
              v108 = -[GEOLocation initWithJSON:](v107, "initWithJSON:", v106);
            else
              v108 = -[GEOLocation initWithDictionary:](v107, "initWithDictionary:", v106);
            v109 = (void *)v108;
            objc_msgSend(a1, "addDeviceHistoricalLocation:", v108, v187);

          }
        }
        v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v202, v229, 16);
      }
      while (v103);
    }

    v100 = v187;
    v5 = v189;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientCapabilities"));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v111 = [GEOClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v112 = -[GEOClientCapabilities initWithJSON:](v111, "initWithJSON:", v110);
    else
      v112 = -[GEOClientCapabilities initWithDictionary:](v111, "initWithDictionary:", v110);
    v113 = (void *)v112;
    objc_msgSend(a1, "setClientCapabilities:", v112, v187);

  }
  if (a3)
    v114 = CFSTR("lastKnownRoadLocation");
  else
    v114 = CFSTR("last_known_road_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114, v187);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v117 = -[GEOLocation initWithJSON:](v116, "initWithJSON:", v115);
    else
      v117 = -[GEOLocation initWithDictionary:](v116, "initWithDictionary:", v115);
    v118 = (void *)v117;
    objc_msgSend(a1, "setLastKnownRoadLocation:", v117);

  }
  if (a3)
    v119 = CFSTR("abClientMetadata");
  else
    v119 = CFSTR("ab_client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v121 = [GEOPDABClientDatasetMetadata alloc];
    if ((a3 & 1) != 0)
      v122 = -[GEOPDABClientDatasetMetadata initWithJSON:](v121, "initWithJSON:", v120);
    else
      v122 = -[GEOPDABClientDatasetMetadata initWithDictionary:](v121, "initWithDictionary:", v120);
    v123 = (void *)v122;
    objc_msgSend(a1, "setAbClientMetadata:", v122);

  }
  if (a3)
    v124 = CFSTR("includeRouteTrafficDetail");
  else
    v124 = CFSTR("include_route_traffic_detail");
  objc_msgSend(v5, "objectForKeyedSubscript:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeRouteTrafficDetail:", objc_msgSend(v125, "BOOLValue"));

  if (a3)
    v126 = CFSTR("includeShortTrafficSummary");
  else
    v126 = CFSTR("include_short_traffic_summary");
  objc_msgSend(v5, "objectForKeyedSubscript:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeShortTrafficSummary:", objc_msgSend(v127, "BOOLValue"));

  if (a3)
    v128 = CFSTR("phoneticLocaleIdentifier");
  else
    v128 = CFSTR("phonetic_locale_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = (void *)objc_msgSend(v129, "copy");
    objc_msgSend(a1, "setPhoneticLocaleIdentifier:", v130);

  }
  if (a3)
    v131 = CFSTR("requestingAppId");
  else
    v131 = CFSTR("requesting_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = (void *)objc_msgSend(v132, "copy");
    objc_msgSend(a1, "setRequestingAppId:", v133);

  }
  if (a3)
    v134 = CFSTR("includeEtaRouteIncidents");
  else
    v134 = CFSTR("include_eta_route_incidents");
  objc_msgSend(v5, "objectForKeyedSubscript:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIncludeEtaRouteIncidents:", objc_msgSend(v135, "BOOLValue"));

  if (a3)
    v136 = CFSTR("recentLocationHistory");
  else
    v136 = CFSTR("recent_location_history");
  objc_msgSend(v5, "objectForKeyedSubscript:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v138 = [GEORecentLocationHistory alloc];
    if ((a3 & 1) != 0)
      v139 = -[GEORecentLocationHistory initWithJSON:](v138, "initWithJSON:", v137);
    else
      v139 = -[GEORecentLocationHistory initWithDictionary:](v138, "initWithDictionary:", v137);
    v140 = (void *)v139;
    objc_msgSend(a1, "setRecentLocationHistory:", v139);

  }
  if (a3)
    v141 = CFSTR("privacyMetadata");
  else
    v141 = CFSTR("privacy_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v143 = [GEOPrivacyMetadata alloc];
    if ((a3 & 1) != 0)
      v144 = -[GEOPrivacyMetadata initWithJSON:](v143, "initWithJSON:", v142);
    else
      v144 = -[GEOPrivacyMetadata initWithDictionary:](v143, "initWithDictionary:", v142);
    v145 = (void *)v144;
    objc_msgSend(a1, "setPrivacyMetadata:", v144);

  }
  if (a3)
    v146 = CFSTR("pathComputationOptions");
  else
    v146 = CFSTR("path_computation_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v146);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_256;
  v148 = [GEOPathComputationOptions alloc];
  if (v148)
  {
    v149 = v147;
    v148 = -[GEOPathComputationOptions init](v148, "init");
    if (!v148)
    {
LABEL_254:

      goto LABEL_255;
    }
    if (a3)
      v150 = CFSTR("pathComputationMethod");
    else
      v150 = CFSTR("path_computation_method");
    objc_msgSend(v149, "objectForKeyedSubscript:", v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v152 = v151;
      v188 = v152;
      if ((objc_msgSend(v152, "isEqualToString:", CFSTR("BEST_EFFORT")) & 1) != 0)
      {
        v153 = 0;
      }
      else if ((objc_msgSend(v152, "isEqualToString:", CFSTR("ECONOMIC"), v152) & 1) != 0)
      {
        v153 = 1;
      }
      else if (objc_msgSend(v152, "isEqualToString:", CFSTR("QUALITATIVE")))
      {
        v153 = 2;
      }
      else
      {
        v153 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_253:

        goto LABEL_254;
      }
      v153 = objc_msgSend(v151, "intValue");
    }
    *(_BYTE *)&v148->_flags |= 1u;
    v148->_pathComputationMethod = v153;
    v5 = v189;
    goto LABEL_253;
  }
LABEL_255:
  objc_msgSend(a1, "setPathComputationOptions:", v148, v188);

LABEL_256:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serviceTag"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v200 = 0u;
    v201 = 0u;
    v198 = 0u;
    v199 = 0u;
    v188 = v154;
    v155 = v154;
    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v198, v228, 16);
    if (v156)
    {
      v157 = v156;
      v158 = *(_QWORD *)v199;
      do
      {
        for (ii = 0; ii != v157; ++ii)
        {
          if (*(_QWORD *)v199 != v158)
            objc_enumerationMutation(v155);
          v160 = *(_QWORD *)(*((_QWORD *)&v198 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v161 = [GEOGeoServiceTag alloc];
            if ((a3 & 1) != 0)
              v162 = -[GEOGeoServiceTag initWithJSON:](v161, "initWithJSON:", v160);
            else
              v162 = -[GEOGeoServiceTag initWithDictionary:](v161, "initWithDictionary:", v160);
            v163 = (void *)v162;
            objc_msgSend(a1, "addServiceTag:", v162, v188);

          }
        }
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v198, v228, 16);
      }
      while (v157);
    }

    v154 = v188;
    v5 = v189;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficApiResponses"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v196 = 0u;
    v197 = 0u;
    v194 = 0u;
    v195 = 0u;
    v165 = v164;
    v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v194, v227, 16);
    if (v166)
    {
      v167 = v166;
      v168 = *(_QWORD *)v195;
      do
      {
        for (jj = 0; jj != v167; ++jj)
        {
          if (*(_QWORD *)v195 != v168)
            objc_enumerationMutation(v165);
          v170 = *(_QWORD *)(*((_QWORD *)&v194 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v171 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v170, 0);
            objc_msgSend(a1, "addTrafficApiResponses:", v171);

          }
        }
        v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v194, v227, 16);
      }
      while (v167);
    }

    v5 = v189;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficSnapshotIds"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v192 = 0u;
    v193 = 0u;
    v190 = 0u;
    v191 = 0u;
    v173 = v172;
    v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v190, v226, 16);
    if (v174)
    {
      v175 = v174;
      v176 = *(_QWORD *)v191;
      do
      {
        for (kk = 0; kk != v175; ++kk)
        {
          if (*(_QWORD *)v191 != v176)
            objc_enumerationMutation(v173);
          v178 = *(void **)(*((_QWORD *)&v190 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v179 = (void *)objc_msgSend(v178, "copy");
            objc_msgSend(a1, "addTrafficSnapshotIds:", v179);

          }
        }
        v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v190, v226, 16);
      }
      while (v175);
    }

  }
  if (a3)
    v180 = CFSTR("trafficSnapshotUnixTime");
  else
    v180 = CFSTR("traffic_snapshot_unix_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v180, v188);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTrafficSnapshotUnixTime:", objc_msgSend(v181, "unsignedIntValue"));

  a1 = a1;
LABEL_298:

  return a1;
}

- (GEOETARequest)initWithJSON:(id)a3
{
  return (GEOETARequest *)-[GEOETARequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_89;
    else
      v8 = (int *)&readAll__nonRecursiveTag_89;
    GEOETARequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOETARequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOETARequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOETARequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $D0E8D0B55C880D94E0AADD8662313484 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  $D0E8D0B55C880D94E0AADD8662313484 v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t m;
  NSMutableArray *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  $D0E8D0B55C880D94E0AADD8662313484 v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t ii;
  NSMutableArray *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t jj;
  NSMutableArray *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t kk;
  PBDataReader *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOETARequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v41 = self->_reader;
    objc_sync_enter(v41);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v42);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v41);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOETARequest readAll:](self, "readAll:", 0);
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x10) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      v75 = 0;
      PBDataWriterPlaceMark();
      GEOTimepointWriteTo((uint64_t)&self->_timepoint);
      PBDataWriterRecallMark();
    }
    if (self->_origin)
      PBDataWriterWriteSubmessage();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v7 = self->_destinations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v72 != v9)
            objc_enumerationMutation(v7);
          PBDataWriterWriteSubmessage();
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      }
      while (v8);
    }

    v11 = self->_flags;
    if ((*(_WORD *)&v11 & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      v11 = self->_flags;
    }
    if ((*(_BYTE *)&v11 & 0x40) != 0)
    {
      PBDataWriterWriteBOOLField();
      v11 = self->_flags;
    }
    if ((*(_BYTE *)&v11 & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      v11 = self->_flags;
    }
    if ((*(_BYTE *)&v11 & 2) != 0)
    {
      v75 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      v11 = self->_flags;
    }
    if ((*(_BYTE *)&v11 & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      v11 = self->_flags;
    }
    if ((*(_BYTE *)&v11 & 0x20) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_additionalEnabledMarkets)
      PBDataWriterWriteSubmessage();
    if (self->_originWaypointTyped)
      PBDataWriterWriteSubmessage();
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v12 = self->_destinationWaypointTypeds;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v68 != v14)
            objc_enumerationMutation(v12);
          PBDataWriterWriteSubmessage();
        }
        v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v67, v82, 16);
      }
      while (v13);
    }

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v16 = self->_intermediateWaypointTypeds;
    v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v17; ++k)
        {
          if (*(_QWORD *)v64 != v18)
            objc_enumerationMutation(v16);
          PBDataWriterWriteSubmessage();
        }
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v63, v81, 16);
      }
      while (v17);
    }

    if (self->_automobileOptions)
      PBDataWriterWriteSubmessage();
    if (self->_cyclingOptions)
      PBDataWriterWriteSubmessage();
    if (self->_transitOptions)
      PBDataWriterWriteSubmessage();
    if (self->_walkingOptions)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_commonOptions)
      PBDataWriterWriteSubmessage();
    if (self->_sessionState)
      PBDataWriterWriteDataField();
    if (self->_originalRouteID)
      PBDataWriterWriteDataField();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v20 = self->_originalRouteZilchPoints;
    v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v60;
      do
      {
        for (m = 0; m != v21; ++m)
        {
          if (*(_QWORD *)v60 != v22)
            objc_enumerationMutation(v20);
          PBDataWriterWriteDataField();
        }
        v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
      }
      while (v21);
    }

    if (self->_originalWaypointRoute)
      PBDataWriterWriteSubmessage();
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v24 = self->_deviceHistoricalLocations;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v56;
      do
      {
        for (n = 0; n != v25; ++n)
        {
          if (*(_QWORD *)v56 != v26)
            objc_enumerationMutation(v24);
          PBDataWriterWriteSubmessage();
        }
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v24, "countByEnumeratingWithState:objects:count:", &v55, v79, 16);
      }
      while (v25);
    }

    if (self->_clientCapabilities)
      PBDataWriterWriteSubmessage();
    if (self->_lastKnownRoadLocation)
      PBDataWriterWriteSubmessage();
    if (self->_abClientMetadata)
      PBDataWriterWriteSubmessage();
    v28 = self->_flags;
    if ((*(_WORD *)&v28 & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      v28 = self->_flags;
    }
    if ((*(_WORD *)&v28 & 0x800) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_phoneticLocaleIdentifier)
      PBDataWriterWriteStringField();
    if (self->_requestingAppId)
      PBDataWriterWriteStringField();
    if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_recentLocationHistory)
      PBDataWriterWriteSubmessage();
    if (self->_privacyMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_pathComputationOptions)
      PBDataWriterWriteSubmessage();
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v29 = self->_serviceTags;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v52;
      do
      {
        for (ii = 0; ii != v30; ++ii)
        {
          if (*(_QWORD *)v52 != v31)
            objc_enumerationMutation(v29);
          PBDataWriterWriteSubmessage();
        }
        v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
      }
      while (v30);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v33 = self->_trafficApiResponses;
    v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v77, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v48;
      do
      {
        for (jj = 0; jj != v34; ++jj)
        {
          if (*(_QWORD *)v48 != v35)
            objc_enumerationMutation(v33);
          PBDataWriterWriteDataField();
        }
        v34 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v47, v77, 16);
      }
      while (v34);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v37 = self->_trafficSnapshotIds;
    v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v43, v76, 16);
    if (v38)
    {
      v39 = *(_QWORD *)v44;
      do
      {
        for (kk = 0; kk != v38; ++kk)
        {
          if (*(_QWORD *)v44 != v39)
            objc_enumerationMutation(v37);
          PBDataWriterWriteStringField();
        }
        v38 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v37, "countByEnumeratingWithState:objects:count:", &v43, v76, 16);
      }
      while (v38);
    }

    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteUint32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v43);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOETARequestClearSensitiveFields((id *)&self->super.super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v3 = a3;
  v43 = *MEMORY[0x1E0C80C00];
  -[GEOETARequest _readDestinations]((uint64_t)self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_destinations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v8)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_37;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  -[GEOETARequest _readDestinationWaypointTypeds]((uint64_t)self);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = self->_destinationWaypointTypeds;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v32;
LABEL_11:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v12)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v13), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_37;
      if (v11 == ++v13)
      {
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v31, v41, 16);
        if (v11)
          goto LABEL_11;
        break;
      }
    }
  }

  -[GEOETARequest _readDeviceHistoricalLocations]((uint64_t)self);
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = self->_deviceHistoricalLocations;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
LABEL_19:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_37;
      if (v15 == ++v17)
      {
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v27, v40, 16);
        if (v15)
          goto LABEL_19;
        break;
      }
    }
  }

  -[GEOETARequest _readIntermediateWaypointTypeds]((uint64_t)self);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_intermediateWaypointTypeds;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v24;
LABEL_27:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v20)
        objc_enumerationMutation(v5);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21), "hasGreenTeaWithValue:", v3, (_QWORD)v23) & 1) != 0)
        break;
      if (v19 == ++v21)
      {
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v39, 16);
        if (v19)
          goto LABEL_27;
        goto LABEL_33;
      }
    }
LABEL_37:

    return 1;
  }
LABEL_33:

  -[GEOETARequest _readLastKnownRoadLocation]((uint64_t)self);
  if (!-[GEOLocation hasGreenTeaWithValue:](self->_lastKnownRoadLocation, "hasGreenTeaWithValue:", v3))
  {
    -[GEOETARequest _readOrigin]((uint64_t)self);
    if (!-[GEOWaypoint hasGreenTeaWithValue:](self->_origin, "hasGreenTeaWithValue:", v3))
    {
      -[GEOETARequest _readOriginWaypointTyped]((uint64_t)self);
      if (!-[GEOWaypointTyped hasGreenTeaWithValue:](self->_originWaypointTyped, "hasGreenTeaWithValue:", v3))
      {
        -[GEOETARequest _readOriginalWaypointRoute]((uint64_t)self);
        return -[GEOOriginalWaypointRoute hasGreenTeaWithValue:](self->_originalWaypointRoute, "hasGreenTeaWithValue:", v3);
      }
    }
  }
  return 1;
}

- (unsigned)requestTypeCode
{
  return 52;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  $D0E8D0B55C880D94E0AADD8662313484 flags;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  $D0E8D0B55C880D94E0AADD8662313484 v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t j;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t k;
  void *v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t m;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t n;
  void *v27;
  char *v28;
  $D0E8D0B55C880D94E0AADD8662313484 v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t ii;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t jj;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t kk;
  void *v41;
  char *v42;

  v42 = (char *)a3;
  -[GEOETARequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v42 + 1, self->_reader);
  *((_DWORD *)v42 + 72) = self->_readerMarkPos;
  *((_DWORD *)v42 + 73) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *((_DWORD *)v42 + 76) = self->_transportType;
    *((_QWORD *)v42 + 40) |= 0x10uLL;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v5 = *(_QWORD *)&self->_timepoint._type;
    *(_OWORD *)(v42 + 24) = *(_OWORD *)&self->_timepoint._currentUserTime;
    *((_QWORD *)v42 + 5) = v5;
    *((_QWORD *)v42 + 40) |= 1uLL;
  }
  if (self->_origin)
    objc_msgSend(v42, "setOrigin:");
  if (-[GEOETARequest destinationsCount](self, "destinationsCount"))
  {
    objc_msgSend(v42, "clearDestinations");
    v6 = -[GEOETARequest destinationsCount](self, "destinationsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[GEOETARequest destinationAtIndex:](self, "destinationAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addDestination:", v9);

      }
    }
  }
  v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x100) != 0)
  {
    v42[314] = self->_includeHistoricTravelTime;
    *((_QWORD *)v42 + 40) |= 0x100uLL;
    v10 = self->_flags;
    if ((*(_BYTE *)&v10 & 0x40) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)&v10 & 0x80) == 0)
        goto LABEL_14;
      goto LABEL_95;
    }
  }
  else if ((*(_BYTE *)&v10 & 0x40) == 0)
  {
    goto LABEL_13;
  }
  v42[312] = self->_allowPartialResults;
  *((_QWORD *)v42 + 40) |= 0x40uLL;
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 0x80) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v10 & 2) == 0)
      goto LABEL_15;
    goto LABEL_96;
  }
LABEL_95:
  v42[313] = self->_includeDistance;
  *((_QWORD *)v42 + 40) |= 0x80uLL;
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 2) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_16;
    goto LABEL_97;
  }
LABEL_96:
  *((_OWORD *)v42 + 3) = self->_sessionID;
  *((_QWORD *)v42 + 40) |= 2uLL;
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 4) == 0)
  {
LABEL_16:
    if ((*(_BYTE *)&v10 & 0x20) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_97:
  *((_QWORD *)v42 + 30) = *(_QWORD *)&self->_sessionRelativeTimestamp;
  *((_QWORD *)v42 + 40) |= 4uLL;
  if ((*(_QWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_17:
    *((_DWORD *)v42 + 77) = self->_walkingLimitMeters;
    *((_QWORD *)v42 + 40) |= 0x20uLL;
  }
LABEL_18:
  if (self->_additionalEnabledMarkets)
    objc_msgSend(v42, "setAdditionalEnabledMarkets:");
  if (self->_originWaypointTyped)
    objc_msgSend(v42, "setOriginWaypointTyped:");
  if (-[GEOETARequest destinationWaypointTypedsCount](self, "destinationWaypointTypedsCount"))
  {
    objc_msgSend(v42, "clearDestinationWaypointTypeds");
    v11 = -[GEOETARequest destinationWaypointTypedsCount](self, "destinationWaypointTypedsCount");
    if (v11)
    {
      v12 = v11;
      for (j = 0; j != v12; ++j)
      {
        -[GEOETARequest destinationWaypointTypedAtIndex:](self, "destinationWaypointTypedAtIndex:", j);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addDestinationWaypointTyped:", v14);

      }
    }
  }
  if (-[GEOETARequest intermediateWaypointTypedsCount](self, "intermediateWaypointTypedsCount"))
  {
    objc_msgSend(v42, "clearIntermediateWaypointTypeds");
    v15 = -[GEOETARequest intermediateWaypointTypedsCount](self, "intermediateWaypointTypedsCount");
    if (v15)
    {
      v16 = v15;
      for (k = 0; k != v16; ++k)
      {
        -[GEOETARequest intermediateWaypointTypedAtIndex:](self, "intermediateWaypointTypedAtIndex:", k);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addIntermediateWaypointTyped:", v18);

      }
    }
  }
  if (self->_automobileOptions)
    objc_msgSend(v42, "setAutomobileOptions:");
  v19 = v42;
  if (self->_cyclingOptions)
  {
    objc_msgSend(v42, "setCyclingOptions:");
    v19 = v42;
  }
  if (self->_transitOptions)
  {
    objc_msgSend(v42, "setTransitOptions:");
    v19 = v42;
  }
  if (self->_walkingOptions)
  {
    objc_msgSend(v42, "setWalkingOptions:");
    v19 = v42;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
  {
    v19[318] = self->_isFromAPI;
    *((_QWORD *)v19 + 40) |= 0x1000uLL;
  }
  if (self->_commonOptions)
    objc_msgSend(v42, "setCommonOptions:");
  if (self->_sessionState)
    objc_msgSend(v42, "setSessionState:");
  if (self->_originalRouteID)
    objc_msgSend(v42, "setOriginalRouteID:");
  if (-[GEOETARequest originalRouteZilchPointsCount](self, "originalRouteZilchPointsCount"))
  {
    objc_msgSend(v42, "clearOriginalRouteZilchPoints");
    v20 = -[GEOETARequest originalRouteZilchPointsCount](self, "originalRouteZilchPointsCount");
    if (v20)
    {
      v21 = v20;
      for (m = 0; m != v21; ++m)
      {
        -[GEOETARequest originalRouteZilchPointsAtIndex:](self, "originalRouteZilchPointsAtIndex:", m);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addOriginalRouteZilchPoints:", v23);

      }
    }
  }
  if (self->_originalWaypointRoute)
    objc_msgSend(v42, "setOriginalWaypointRoute:");
  if (-[GEOETARequest deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount"))
  {
    objc_msgSend(v42, "clearDeviceHistoricalLocations");
    v24 = -[GEOETARequest deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount");
    if (v24)
    {
      v25 = v24;
      for (n = 0; n != v25; ++n)
      {
        -[GEOETARequest deviceHistoricalLocationAtIndex:](self, "deviceHistoricalLocationAtIndex:", n);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addDeviceHistoricalLocation:", v27);

      }
    }
  }
  if (self->_clientCapabilities)
    objc_msgSend(v42, "setClientCapabilities:");
  v28 = v42;
  if (self->_lastKnownRoadLocation)
  {
    objc_msgSend(v42, "setLastKnownRoadLocation:");
    v28 = v42;
  }
  if (self->_abClientMetadata)
  {
    objc_msgSend(v42, "setAbClientMetadata:");
    v28 = v42;
  }
  v29 = self->_flags;
  if ((*(_WORD *)&v29 & 0x400) != 0)
  {
    v28[316] = self->_includeRouteTrafficDetail;
    *((_QWORD *)v28 + 40) |= 0x400uLL;
    v29 = self->_flags;
  }
  if ((*(_WORD *)&v29 & 0x800) != 0)
  {
    v28[317] = self->_includeShortTrafficSummary;
    *((_QWORD *)v28 + 40) |= 0x800uLL;
  }
  if (self->_phoneticLocaleIdentifier)
  {
    objc_msgSend(v42, "setPhoneticLocaleIdentifier:");
    v28 = v42;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v42, "setRequestingAppId:");
    v28 = v42;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    v28[315] = self->_includeEtaRouteIncidents;
    *((_QWORD *)v28 + 40) |= 0x200uLL;
  }
  if (self->_recentLocationHistory)
    objc_msgSend(v42, "setRecentLocationHistory:");
  if (self->_privacyMetadata)
    objc_msgSend(v42, "setPrivacyMetadata:");
  if (self->_pathComputationOptions)
    objc_msgSend(v42, "setPathComputationOptions:");
  if (-[GEOETARequest serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v42, "clearServiceTags");
    v30 = -[GEOETARequest serviceTagsCount](self, "serviceTagsCount");
    if (v30)
    {
      v31 = v30;
      for (ii = 0; ii != v31; ++ii)
      {
        -[GEOETARequest serviceTagAtIndex:](self, "serviceTagAtIndex:", ii);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addServiceTag:", v33);

      }
    }
  }
  if (-[GEOETARequest trafficApiResponsesCount](self, "trafficApiResponsesCount"))
  {
    objc_msgSend(v42, "clearTrafficApiResponses");
    v34 = -[GEOETARequest trafficApiResponsesCount](self, "trafficApiResponsesCount");
    if (v34)
    {
      v35 = v34;
      for (jj = 0; jj != v35; ++jj)
      {
        -[GEOETARequest trafficApiResponsesAtIndex:](self, "trafficApiResponsesAtIndex:", jj);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addTrafficApiResponses:", v37);

      }
    }
  }
  if (-[GEOETARequest trafficSnapshotIdsCount](self, "trafficSnapshotIdsCount"))
  {
    objc_msgSend(v42, "clearTrafficSnapshotIds");
    v38 = -[GEOETARequest trafficSnapshotIdsCount](self, "trafficSnapshotIdsCount");
    if (v38)
    {
      v39 = v38;
      for (kk = 0; kk != v39; ++kk)
      {
        -[GEOETARequest trafficSnapshotIdsAtIndex:](self, "trafficSnapshotIdsAtIndex:", kk);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addTrafficSnapshotIds:", v41);

      }
    }
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v42 + 75) = self->_trafficSnapshotUnixTime;
    *((_QWORD *)v42 + 40) |= 8uLL;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $D0E8D0B55C880D94E0AADD8662313484 flags;
  uint64_t v10;
  id v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  $D0E8D0B55C880D94E0AADD8662313484 v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  NSMutableArray *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSMutableArray *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  void *v51;
  id v52;
  void *v53;
  NSMutableArray *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t n;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  $D0E8D0B55C880D94E0AADD8662313484 v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  NSMutableArray *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t ii;
  void *v80;
  NSMutableArray *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t jj;
  void *v85;
  NSMutableArray *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t kk;
  void *v90;
  PBUnknownFields *v91;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  _BYTE v125[128];
  _BYTE v126[128];
  _BYTE v127[128];
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 5) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOETARequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_83;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOETARequest readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_transportType;
    *(_QWORD *)(v5 + 320) |= 0x10uLL;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    v10 = *(_QWORD *)&self->_timepoint._type;
    *(_OWORD *)(v5 + 24) = *(_OWORD *)&self->_timepoint._currentUserTime;
    *(_QWORD *)(v5 + 40) = v10;
    *(_QWORD *)(v5 + 320) |= 1uLL;
  }
  v11 = -[GEOWaypoint copyWithZone:](self->_origin, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v11;

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v13 = self->_destinations;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v122 != v15)
          objc_enumerationMutation(v13);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDestination:", v17);

      }
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
    }
    while (v14);
  }

  v18 = self->_flags;
  if ((*(_WORD *)&v18 & 0x100) != 0)
  {
    *(_BYTE *)(v5 + 314) = self->_includeHistoricTravelTime;
    *(_QWORD *)(v5 + 320) |= 0x100uLL;
    v18 = self->_flags;
    if ((*(_BYTE *)&v18 & 0x40) == 0)
    {
LABEL_18:
      if ((*(_BYTE *)&v18 & 0x80) == 0)
        goto LABEL_19;
      goto LABEL_86;
    }
  }
  else if ((*(_BYTE *)&v18 & 0x40) == 0)
  {
    goto LABEL_18;
  }
  *(_BYTE *)(v5 + 312) = self->_allowPartialResults;
  *(_QWORD *)(v5 + 320) |= 0x40uLL;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 0x80) == 0)
  {
LABEL_19:
    if ((*(_BYTE *)&v18 & 2) == 0)
      goto LABEL_20;
    goto LABEL_87;
  }
LABEL_86:
  *(_BYTE *)(v5 + 313) = self->_includeDistance;
  *(_QWORD *)(v5 + 320) |= 0x80uLL;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 2) == 0)
  {
LABEL_20:
    if ((*(_BYTE *)&v18 & 4) == 0)
      goto LABEL_21;
LABEL_88:
    *(double *)(v5 + 240) = self->_sessionRelativeTimestamp;
    *(_QWORD *)(v5 + 320) |= 4uLL;
    if ((*(_QWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_23;
    goto LABEL_22;
  }
LABEL_87:
  *(GEOSessionID *)(v5 + 48) = self->_sessionID;
  *(_QWORD *)(v5 + 320) |= 2uLL;
  v18 = self->_flags;
  if ((*(_BYTE *)&v18 & 4) != 0)
    goto LABEL_88;
LABEL_21:
  if ((*(_BYTE *)&v18 & 0x20) != 0)
  {
LABEL_22:
    *(_DWORD *)(v5 + 308) = self->_walkingLimitMeters;
    *(_QWORD *)(v5 + 320) |= 0x20uLL;
  }
LABEL_23:
  v19 = -[GEOAdditionalEnabledMarkets copyWithZone:](self->_additionalEnabledMarkets, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v19;

  v21 = -[GEOWaypointTyped copyWithZone:](self->_originWaypointTyped, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v21;

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v23 = self->_destinationWaypointTypeds;
  v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v118;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v118 != v25)
          objc_enumerationMutation(v23);
        v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDestinationWaypointTyped:", v27);

      }
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
    }
    while (v24);
  }

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v28 = self->_intermediateWaypointTypeds;
  v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v114;
    do
    {
      for (k = 0; k != v29; ++k)
      {
        if (*(_QWORD *)v114 != v30)
          objc_enumerationMutation(v28);
        v32 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addIntermediateWaypointTyped:", v32);

      }
      v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
    }
    while (v29);
  }

  v33 = -[GEOAutomobileOptions copyWithZone:](self->_automobileOptions, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v33;

  v35 = -[GEOCyclingOptions copyWithZone:](self->_cyclingOptions, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v35;

  v37 = -[GEOTransitOptions copyWithZone:](self->_transitOptions, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v37;

  v39 = -[GEOWalkingOptions copyWithZone:](self->_walkingOptions, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v39;

  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 318) = self->_isFromAPI;
    *(_QWORD *)(v5 + 320) |= 0x1000uLL;
  }
  v41 = -[GEOCommonOptions copyWithZone:](self->_commonOptions, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v41;

  v43 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v43;

  v45 = -[NSData copyWithZone:](self->_originalRouteID, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v45;

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v47 = self->_originalRouteZilchPoints;
  v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v109, v129, 16);
  if (v48)
  {
    v49 = *(_QWORD *)v110;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v110 != v49)
          objc_enumerationMutation(v47);
        v51 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOriginalRouteZilchPoints:", v51);

      }
      v48 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v47, "countByEnumeratingWithState:objects:count:", &v109, v129, 16);
    }
    while (v48);
  }

  v52 = -[GEOOriginalWaypointRoute copyWithZone:](self->_originalWaypointRoute, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v52;

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v54 = self->_deviceHistoricalLocations;
  v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
  if (v55)
  {
    v56 = *(_QWORD *)v106;
    do
    {
      for (n = 0; n != v55; ++n)
      {
        if (*(_QWORD *)v106 != v56)
          objc_enumerationMutation(v54);
        v58 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDeviceHistoricalLocation:", v58);

      }
      v55 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v54, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
    }
    while (v55);
  }

  v59 = -[GEOClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v59;

  v61 = -[GEOLocation copyWithZone:](self->_lastKnownRoadLocation, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v61;

  v63 = -[GEOPDABClientDatasetMetadata copyWithZone:](self->_abClientMetadata, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v63;

  v65 = self->_flags;
  if ((*(_WORD *)&v65 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 316) = self->_includeRouteTrafficDetail;
    *(_QWORD *)(v5 + 320) |= 0x400uLL;
    v65 = self->_flags;
  }
  if ((*(_WORD *)&v65 & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 317) = self->_includeShortTrafficSummary;
    *(_QWORD *)(v5 + 320) |= 0x800uLL;
  }
  v66 = -[NSString copyWithZone:](self->_phoneticLocaleIdentifier, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v66;

  v68 = -[NSString copyWithZone:](self->_requestingAppId, "copyWithZone:", a3);
  v69 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v68;

  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    *(_BYTE *)(v5 + 315) = self->_includeEtaRouteIncidents;
    *(_QWORD *)(v5 + 320) |= 0x200uLL;
  }
  v70 = -[GEORecentLocationHistory copyWithZone:](self->_recentLocationHistory, "copyWithZone:", a3);
  v71 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v70;

  v72 = -[GEOPrivacyMetadata copyWithZone:](self->_privacyMetadata, "copyWithZone:", a3);
  v73 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v72;

  v74 = -[GEOPathComputationOptions copyWithZone:](self->_pathComputationOptions, "copyWithZone:", a3);
  v75 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v74;

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v76 = self->_serviceTags;
  v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v101, v127, 16);
  if (v77)
  {
    v78 = *(_QWORD *)v102;
    do
    {
      for (ii = 0; ii != v77; ++ii)
      {
        if (*(_QWORD *)v102 != v78)
          objc_enumerationMutation(v76);
        v80 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addServiceTag:", v80);

      }
      v77 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v76, "countByEnumeratingWithState:objects:count:", &v101, v127, 16);
    }
    while (v77);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v81 = self->_trafficApiResponses;
  v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
  if (v82)
  {
    v83 = *(_QWORD *)v98;
    do
    {
      for (jj = 0; jj != v82; ++jj)
      {
        if (*(_QWORD *)v98 != v83)
          objc_enumerationMutation(v81);
        v85 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficApiResponses:", v85);

      }
      v82 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
    }
    while (v82);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v86 = self->_trafficSnapshotIds;
  v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
  if (v87)
  {
    v88 = *(_QWORD *)v94;
    do
    {
      for (kk = 0; kk != v87; ++kk)
      {
        if (*(_QWORD *)v94 != v88)
          objc_enumerationMutation(v86);
        v90 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * kk), "copyWithZone:", a3, (_QWORD)v93);
        objc_msgSend((id)v5, "addTrafficSnapshotIds:", v90);

      }
      v87 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v86, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
    }
    while (v87);
  }

  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_trafficSnapshotUnixTime;
    *(_QWORD *)(v5 + 320) |= 8uLL;
  }
  v91 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v91;
LABEL_83:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $D0E8D0B55C880D94E0AADD8662313484 flags;
  uint64_t v6;
  GEOWaypoint *origin;
  NSMutableArray *destinations;
  $D0E8D0B55C880D94E0AADD8662313484 v11;
  uint64_t v12;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  GEOWaypointTyped *originWaypointTyped;
  NSMutableArray *destinationWaypointTypeds;
  NSMutableArray *intermediateWaypointTypeds;
  GEOAutomobileOptions *automobileOptions;
  GEOCyclingOptions *cyclingOptions;
  GEOTransitOptions *transitOptions;
  GEOWalkingOptions *walkingOptions;
  uint64_t v22;
  GEOCommonOptions *commonOptions;
  NSData *sessionState;
  NSData *originalRouteID;
  NSMutableArray *originalRouteZilchPoints;
  GEOOriginalWaypointRoute *originalWaypointRoute;
  NSMutableArray *deviceHistoricalLocations;
  GEOClientCapabilities *clientCapabilities;
  GEOLocation *lastKnownRoadLocation;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  $D0E8D0B55C880D94E0AADD8662313484 v32;
  uint64_t v33;
  NSString *phoneticLocaleIdentifier;
  NSString *requestingAppId;
  uint64_t v36;
  GEORecentLocationHistory *recentLocationHistory;
  GEOPrivacyMetadata *privacyMetadata;
  GEOPathComputationOptions *pathComputationOptions;
  NSMutableArray *serviceTags;
  NSMutableArray *trafficApiResponses;
  NSMutableArray *trafficSnapshotIds;
  BOOL v43;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_153;
  -[GEOETARequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_QWORD *)v4 + 40);
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_transportType != *((_DWORD *)v4 + 76))
      goto LABEL_153;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_BYTE *)&flags & 1) != 0 && (v6 & 1) != 0)
  {
    if (*(_QWORD *)&self->_timepoint._currentUserTime != *((_QWORD *)v4 + 3)
      || *(_QWORD *)&self->_timepoint._time != *((_QWORD *)v4 + 4)
      || *(_QWORD *)&self->_timepoint._type != *((_QWORD *)v4 + 5))
    {
      goto LABEL_153;
    }
  }
  else if (((*(_DWORD *)&flags | v6) & 1) != 0)
  {
    goto LABEL_153;
  }
  origin = self->_origin;
  if ((unint64_t)origin | *((_QWORD *)v4 + 23) && !-[GEOWaypoint isEqual:](origin, "isEqual:"))
    goto LABEL_153;
  destinations = self->_destinations;
  if ((unint64_t)destinations | *((_QWORD *)v4 + 15))
  {
    if (!-[NSMutableArray isEqual:](destinations, "isEqual:"))
      goto LABEL_153;
  }
  v11 = self->_flags;
  v12 = *((_QWORD *)v4 + 40);
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0)
      goto LABEL_153;
    if (self->_includeHistoricTravelTime)
    {
      if (!*((_BYTE *)v4 + 314))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 314))
    {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_BYTE *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0)
      goto LABEL_153;
    if (self->_allowPartialResults)
    {
      if (!*((_BYTE *)v4 + 312))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 312))
    {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_BYTE *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0)
      goto LABEL_153;
    if (self->_includeDistance)
    {
      if (!*((_BYTE *)v4 + 313))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 313))
    {
      goto LABEL_153;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_BYTE *)&v11 & 2) != 0 && (v12 & 2) != 0)
  {
    if (self->_sessionID._high != *((_QWORD *)v4 + 6) || self->_sessionID._low != *((_QWORD *)v4 + 7))
      goto LABEL_153;
  }
  else if (((*(_DWORD *)&v11 | v12) & 2) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_BYTE *)&v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 30))
      goto LABEL_153;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_BYTE *)&v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_walkingLimitMeters != *((_DWORD *)v4 + 77))
      goto LABEL_153;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_153;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((_QWORD *)v4 + 9)
    && !-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
  {
    goto LABEL_153;
  }
  originWaypointTyped = self->_originWaypointTyped;
  if ((unint64_t)originWaypointTyped | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOWaypointTyped isEqual:](originWaypointTyped, "isEqual:"))
      goto LABEL_153;
  }
  destinationWaypointTypeds = self->_destinationWaypointTypeds;
  if ((unint64_t)destinationWaypointTypeds | *((_QWORD *)v4 + 14))
  {
    if (!-[NSMutableArray isEqual:](destinationWaypointTypeds, "isEqual:"))
      goto LABEL_153;
  }
  intermediateWaypointTypeds = self->_intermediateWaypointTypeds;
  if ((unint64_t)intermediateWaypointTypeds | *((_QWORD *)v4 + 17))
  {
    if (!-[NSMutableArray isEqual:](intermediateWaypointTypeds, "isEqual:"))
      goto LABEL_153;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:"))
      goto LABEL_153;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:"))
      goto LABEL_153;
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:"))
      goto LABEL_153;
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:"))
      goto LABEL_153;
  }
  v22 = *((_QWORD *)v4 + 40);
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
  {
    if ((v22 & 0x1000) == 0)
      goto LABEL_153;
    if (self->_isFromAPI)
    {
      if (!*((_BYTE *)v4 + 318))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 318))
    {
      goto LABEL_153;
    }
  }
  else if ((v22 & 0x1000) != 0)
  {
    goto LABEL_153;
  }
  commonOptions = self->_commonOptions;
  if ((unint64_t)commonOptions | *((_QWORD *)v4 + 12)
    && !-[GEOCommonOptions isEqual:](commonOptions, "isEqual:"))
  {
    goto LABEL_153;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((_QWORD *)v4 + 31))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:"))
      goto LABEL_153;
  }
  originalRouteID = self->_originalRouteID;
  if ((unint64_t)originalRouteID | *((_QWORD *)v4 + 20))
  {
    if (!-[NSData isEqual:](originalRouteID, "isEqual:"))
      goto LABEL_153;
  }
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  if ((unint64_t)originalRouteZilchPoints | *((_QWORD *)v4 + 21))
  {
    if (!-[NSMutableArray isEqual:](originalRouteZilchPoints, "isEqual:"))
      goto LABEL_153;
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  if ((unint64_t)originalWaypointRoute | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOOriginalWaypointRoute isEqual:](originalWaypointRoute, "isEqual:"))
      goto LABEL_153;
  }
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  if ((unint64_t)deviceHistoricalLocations | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:"))
      goto LABEL_153;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_153;
  }
  lastKnownRoadLocation = self->_lastKnownRoadLocation;
  if ((unint64_t)lastKnownRoadLocation | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOLocation isEqual:](lastKnownRoadLocation, "isEqual:"))
      goto LABEL_153;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:"))
      goto LABEL_153;
  }
  v32 = self->_flags;
  v33 = *((_QWORD *)v4 + 40);
  if ((*(_WORD *)&v32 & 0x400) != 0)
  {
    if ((v33 & 0x400) == 0)
      goto LABEL_153;
    if (self->_includeRouteTrafficDetail)
    {
      if (!*((_BYTE *)v4 + 316))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 316))
    {
      goto LABEL_153;
    }
  }
  else if ((v33 & 0x400) != 0)
  {
    goto LABEL_153;
  }
  if ((*(_WORD *)&v32 & 0x800) != 0)
  {
    if ((v33 & 0x800) == 0)
      goto LABEL_153;
    if (self->_includeShortTrafficSummary)
    {
      if (!*((_BYTE *)v4 + 317))
        goto LABEL_153;
    }
    else if (*((_BYTE *)v4 + 317))
    {
      goto LABEL_153;
    }
  }
  else if ((v33 & 0x800) != 0)
  {
    goto LABEL_153;
  }
  phoneticLocaleIdentifier = self->_phoneticLocaleIdentifier;
  if ((unint64_t)phoneticLocaleIdentifier | *((_QWORD *)v4 + 25)
    && !-[NSString isEqual:](phoneticLocaleIdentifier, "isEqual:"))
  {
    goto LABEL_153;
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((_QWORD *)v4 + 28))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:"))
      goto LABEL_153;
  }
  v36 = *((_QWORD *)v4 + 40);
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    if ((v36 & 0x200) != 0)
    {
      if (self->_includeEtaRouteIncidents)
      {
        if (!*((_BYTE *)v4 + 315))
          goto LABEL_153;
        goto LABEL_136;
      }
      if (!*((_BYTE *)v4 + 315))
        goto LABEL_136;
    }
LABEL_153:
    v43 = 0;
    goto LABEL_154;
  }
  if ((v36 & 0x200) != 0)
    goto LABEL_153;
LABEL_136:
  recentLocationHistory = self->_recentLocationHistory;
  if ((unint64_t)recentLocationHistory | *((_QWORD *)v4 + 27)
    && !-[GEORecentLocationHistory isEqual:](recentLocationHistory, "isEqual:"))
  {
    goto LABEL_153;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:"))
      goto LABEL_153;
  }
  pathComputationOptions = self->_pathComputationOptions;
  if ((unint64_t)pathComputationOptions | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOPathComputationOptions isEqual:](pathComputationOptions, "isEqual:"))
      goto LABEL_153;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
      goto LABEL_153;
  }
  trafficApiResponses = self->_trafficApiResponses;
  if ((unint64_t)trafficApiResponses | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](trafficApiResponses, "isEqual:"))
      goto LABEL_153;
  }
  trafficSnapshotIds = self->_trafficSnapshotIds;
  if ((unint64_t)trafficSnapshotIds | *((_QWORD *)v4 + 33))
  {
    if (!-[NSMutableArray isEqual:](trafficSnapshotIds, "isEqual:"))
      goto LABEL_153;
  }
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((*((_QWORD *)v4 + 40) & 8) == 0 || self->_trafficSnapshotUnixTime != *((_DWORD *)v4 + 75))
      goto LABEL_153;
    v43 = 1;
  }
  else
  {
    v43 = (*((_QWORD *)v4 + 40) & 8) == 0;
  }
LABEL_154:

  return v43;
}

- (unint64_t)hash
{
  $D0E8D0B55C880D94E0AADD8662313484 flags;
  $D0E8D0B55C880D94E0AADD8662313484 v4;
  double sessionRelativeTimestamp;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  $D0E8D0B55C880D94E0AADD8662313484 v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;

  -[GEOETARequest readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    v51 = 2654435761 * self->_transportType;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v51 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
LABEL_3:
      v50 = PBHashBytes();
      goto LABEL_6;
    }
  }
  v50 = 0;
LABEL_6:
  v49 = -[GEOWaypoint hash](self->_origin, "hash");
  v48 = -[NSMutableArray hash](self->_destinations, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    v47 = 2654435761 * self->_includeHistoricTravelTime;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
    {
LABEL_8:
      v46 = 2654435761 * self->_allowPartialResults;
      if ((*(_BYTE *)&v4 & 0x80) != 0)
        goto LABEL_9;
      goto LABEL_17;
    }
  }
  else
  {
    v47 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_8;
  }
  v46 = 0;
  if ((*(_BYTE *)&v4 & 0x80) != 0)
  {
LABEL_9:
    v45 = 2654435761 * self->_includeDistance;
    if ((*(_BYTE *)&v4 & 2) != 0)
      goto LABEL_10;
    goto LABEL_18;
  }
LABEL_17:
  v45 = 0;
  if ((*(_BYTE *)&v4 & 2) != 0)
  {
LABEL_10:
    v44 = PBHashBytes();
    v4 = self->_flags;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_11;
    goto LABEL_19;
  }
LABEL_18:
  v44 = 0;
  if ((*(_BYTE *)&v4 & 4) != 0)
  {
LABEL_11:
    sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
    v6 = -sessionRelativeTimestamp;
    if (sessionRelativeTimestamp >= 0.0)
      v6 = self->_sessionRelativeTimestamp;
    v7 = floor(v6 + 0.5);
    v8 = (v6 - v7) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0)
        v9 += (unint64_t)v8;
    }
    else
    {
      v9 -= (unint64_t)fabs(v8);
    }
    v43 = v9;
    if ((*(_BYTE *)&v4 & 0x20) == 0)
      goto LABEL_24;
LABEL_20:
    v42 = 2654435761 * self->_walkingLimitMeters;
    goto LABEL_25;
  }
LABEL_19:
  v43 = 0;
  if ((*(_BYTE *)&v4 & 0x20) != 0)
    goto LABEL_20;
LABEL_24:
  v42 = 0;
LABEL_25:
  v41 = -[GEOAdditionalEnabledMarkets hash](self->_additionalEnabledMarkets, "hash");
  v40 = -[GEOWaypointTyped hash](self->_originWaypointTyped, "hash");
  v39 = -[NSMutableArray hash](self->_destinationWaypointTypeds, "hash");
  v38 = -[NSMutableArray hash](self->_intermediateWaypointTypeds, "hash");
  v37 = -[GEOAutomobileOptions hash](self->_automobileOptions, "hash");
  v36 = -[GEOCyclingOptions hash](self->_cyclingOptions, "hash");
  v35 = -[GEOTransitOptions hash](self->_transitOptions, "hash");
  v34 = -[GEOWalkingOptions hash](self->_walkingOptions, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
    v33 = 2654435761 * self->_isFromAPI;
  else
    v33 = 0;
  v32 = -[GEOCommonOptions hash](self->_commonOptions, "hash");
  v31 = -[NSData hash](self->_sessionState, "hash");
  v30 = -[NSData hash](self->_originalRouteID, "hash");
  v29 = -[NSMutableArray hash](self->_originalRouteZilchPoints, "hash");
  v28 = -[GEOOriginalWaypointRoute hash](self->_originalWaypointRoute, "hash");
  v27 = -[NSMutableArray hash](self->_deviceHistoricalLocations, "hash");
  v26 = -[GEOClientCapabilities hash](self->_clientCapabilities, "hash");
  v25 = -[GEOLocation hash](self->_lastKnownRoadLocation, "hash");
  v24 = -[GEOPDABClientDatasetMetadata hash](self->_abClientMetadata, "hash");
  v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    v23 = 2654435761 * self->_includeRouteTrafficDetail;
    if ((*(_WORD *)&v10 & 0x800) != 0)
      goto LABEL_30;
  }
  else
  {
    v23 = 0;
    if ((*(_WORD *)&v10 & 0x800) != 0)
    {
LABEL_30:
      v22 = 2654435761 * self->_includeShortTrafficSummary;
      goto LABEL_33;
    }
  }
  v22 = 0;
LABEL_33:
  v21 = -[NSString hash](self->_phoneticLocaleIdentifier, "hash");
  v20 = -[NSString hash](self->_requestingAppId, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
    v11 = 2654435761 * self->_includeEtaRouteIncidents;
  else
    v11 = 0;
  v12 = -[GEORecentLocationHistory hash](self->_recentLocationHistory, "hash");
  v13 = -[GEOPrivacyMetadata hash](self->_privacyMetadata, "hash");
  v14 = -[GEOPathComputationOptions hash](self->_pathComputationOptions, "hash");
  v15 = -[NSMutableArray hash](self->_serviceTags, "hash");
  v16 = -[NSMutableArray hash](self->_trafficApiResponses, "hash");
  v17 = -[NSMutableArray hash](self->_trafficSnapshotIds, "hash");
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v18 = 2654435761 * self->_trafficSnapshotUnixTime;
  else
    v18 = 0;
  return v50 ^ v51 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  GEOWaypoint *origin;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  uint64_t v16;
  GEOWaypointTyped *originWaypointTyped;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  GEOAutomobileOptions *automobileOptions;
  uint64_t v30;
  GEOCyclingOptions *cyclingOptions;
  uint64_t v32;
  GEOTransitOptions *transitOptions;
  uint64_t v34;
  GEOWalkingOptions *walkingOptions;
  uint64_t v36;
  GEOCommonOptions *commonOptions;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  GEOOriginalWaypointRoute *originalWaypointRoute;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  GEOClientCapabilities *clientCapabilities;
  uint64_t v52;
  GEOLocation *lastKnownRoadLocation;
  uint64_t v54;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  uint64_t v56;
  uint64_t v57;
  GEORecentLocationHistory *recentLocationHistory;
  uint64_t v59;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v61;
  GEOPathComputationOptions *pathComputationOptions;
  void *v63;
  _DWORD *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t ii;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t jj;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t kk;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  _BYTE v119[128];
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *((_QWORD *)v4 + 40);
  if ((v5 & 0x10) != 0)
  {
    self->_transportType = *((_DWORD *)v4 + 76);
    *(_QWORD *)&self->_flags |= 0x10uLL;
    v5 = *((_QWORD *)v4 + 40);
  }
  if ((v5 & 1) != 0)
  {
    v6 = *((_QWORD *)v4 + 5);
    *(_OWORD *)&self->_timepoint._currentUserTime = *(_OWORD *)(v4 + 24);
    *(_QWORD *)&self->_timepoint._type = v6;
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  origin = self->_origin;
  v8 = *((_QWORD *)v4 + 23);
  if (origin)
  {
    if (v8)
      -[GEOWaypoint mergeFrom:](origin, "mergeFrom:");
  }
  else if (v8)
  {
    -[GEOETARequest setOrigin:](self, "setOrigin:");
  }
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v9 = *((id *)v4 + 15);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v109;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v109 != v12)
          objc_enumerationMutation(v9);
        -[GEOETARequest addDestination:](self, "addDestination:", *(_QWORD *)(*((_QWORD *)&v108 + 1) + 8 * i));
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v108, v119, 16);
    }
    while (v11);
  }

  v14 = *((_QWORD *)v4 + 40);
  if ((v14 & 0x100) != 0)
  {
    self->_includeHistoricTravelTime = v4[314];
    *(_QWORD *)&self->_flags |= 0x100uLL;
    v14 = *((_QWORD *)v4 + 40);
    if ((v14 & 0x40) == 0)
    {
LABEL_19:
      if ((v14 & 0x80) == 0)
        goto LABEL_20;
      goto LABEL_29;
    }
  }
  else if ((v14 & 0x40) == 0)
  {
    goto LABEL_19;
  }
  self->_allowPartialResults = v4[312];
  *(_QWORD *)&self->_flags |= 0x40uLL;
  v14 = *((_QWORD *)v4 + 40);
  if ((v14 & 0x80) == 0)
  {
LABEL_20:
    if ((v14 & 2) == 0)
      goto LABEL_21;
    goto LABEL_30;
  }
LABEL_29:
  self->_includeDistance = v4[313];
  *(_QWORD *)&self->_flags |= 0x80uLL;
  v14 = *((_QWORD *)v4 + 40);
  if ((v14 & 2) == 0)
  {
LABEL_21:
    if ((v14 & 4) == 0)
      goto LABEL_22;
    goto LABEL_31;
  }
LABEL_30:
  self->_sessionID = (GEOSessionID)*((_OWORD *)v4 + 3);
  *(_QWORD *)&self->_flags |= 2uLL;
  v14 = *((_QWORD *)v4 + 40);
  if ((v14 & 4) == 0)
  {
LABEL_22:
    if ((v14 & 0x20) == 0)
      goto LABEL_24;
    goto LABEL_23;
  }
LABEL_31:
  self->_sessionRelativeTimestamp = *((double *)v4 + 30);
  *(_QWORD *)&self->_flags |= 4uLL;
  if ((*((_QWORD *)v4 + 40) & 0x20) != 0)
  {
LABEL_23:
    self->_walkingLimitMeters = *((_DWORD *)v4 + 77);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
LABEL_24:
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  v16 = *((_QWORD *)v4 + 9);
  if (additionalEnabledMarkets)
  {
    if (v16)
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
  }
  else if (v16)
  {
    -[GEOETARequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  originWaypointTyped = self->_originWaypointTyped;
  v18 = *((_QWORD *)v4 + 19);
  if (originWaypointTyped)
  {
    if (v18)
      -[GEOWaypointTyped mergeFrom:](originWaypointTyped, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEOETARequest setOriginWaypointTyped:](self, "setOriginWaypointTyped:");
  }
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v19 = *((id *)v4 + 14);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v105 != v22)
          objc_enumerationMutation(v19);
        -[GEOETARequest addDestinationWaypointTyped:](self, "addDestinationWaypointTyped:", *(_QWORD *)(*((_QWORD *)&v104 + 1) + 8 * j));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
    }
    while (v21);
  }

  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v24 = *((id *)v4 + 17);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v101;
    do
    {
      for (k = 0; k != v26; ++k)
      {
        if (*(_QWORD *)v101 != v27)
          objc_enumerationMutation(v24);
        -[GEOETARequest addIntermediateWaypointTyped:](self, "addIntermediateWaypointTyped:", *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * k));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
    }
    while (v26);
  }

  automobileOptions = self->_automobileOptions;
  v30 = *((_QWORD *)v4 + 10);
  if (automobileOptions)
  {
    if (v30)
      -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEOETARequest setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  cyclingOptions = self->_cyclingOptions;
  v32 = *((_QWORD *)v4 + 13);
  if (cyclingOptions)
  {
    if (v32)
      -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEOETARequest setCyclingOptions:](self, "setCyclingOptions:");
  }
  transitOptions = self->_transitOptions;
  v34 = *((_QWORD *)v4 + 34);
  if (transitOptions)
  {
    if (v34)
      -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
  }
  else if (v34)
  {
    -[GEOETARequest setTransitOptions:](self, "setTransitOptions:");
  }
  walkingOptions = self->_walkingOptions;
  v36 = *((_QWORD *)v4 + 35);
  if (walkingOptions)
  {
    if (v36)
      -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEOETARequest setWalkingOptions:](self, "setWalkingOptions:");
  }
  if ((v4[321] & 0x10) != 0)
  {
    self->_isFromAPI = v4[318];
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
  commonOptions = self->_commonOptions;
  v38 = *((_QWORD *)v4 + 12);
  if (commonOptions)
  {
    if (v38)
      -[GEOCommonOptions mergeFrom:](commonOptions, "mergeFrom:");
  }
  else if (v38)
  {
    -[GEOETARequest setCommonOptions:](self, "setCommonOptions:");
  }
  if (*((_QWORD *)v4 + 31))
    -[GEOETARequest setSessionState:](self, "setSessionState:");
  if (*((_QWORD *)v4 + 20))
    -[GEOETARequest setOriginalRouteID:](self, "setOriginalRouteID:");
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  v39 = *((id *)v4 + 21);
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v97;
    do
    {
      for (m = 0; m != v41; ++m)
      {
        if (*(_QWORD *)v97 != v42)
          objc_enumerationMutation(v39);
        -[GEOETARequest addOriginalRouteZilchPoints:](self, "addOriginalRouteZilchPoints:", *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * m));
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
    }
    while (v41);
  }

  originalWaypointRoute = self->_originalWaypointRoute;
  v45 = *((_QWORD *)v4 + 22);
  if (originalWaypointRoute)
  {
    if (v45)
      -[GEOOriginalWaypointRoute mergeFrom:](originalWaypointRoute, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOETARequest setOriginalWaypointRoute:](self, "setOriginalWaypointRoute:");
  }
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v46 = *((id *)v4 + 16);
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v93;
    do
    {
      for (n = 0; n != v48; ++n)
      {
        if (*(_QWORD *)v93 != v49)
          objc_enumerationMutation(v46);
        -[GEOETARequest addDeviceHistoricalLocation:](self, "addDeviceHistoricalLocation:", *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * n));
      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
    }
    while (v48);
  }

  clientCapabilities = self->_clientCapabilities;
  v52 = *((_QWORD *)v4 + 11);
  if (clientCapabilities)
  {
    if (v52)
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v52)
  {
    -[GEOETARequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  lastKnownRoadLocation = self->_lastKnownRoadLocation;
  v54 = *((_QWORD *)v4 + 18);
  if (lastKnownRoadLocation)
  {
    if (v54)
      -[GEOLocation mergeFrom:](lastKnownRoadLocation, "mergeFrom:");
  }
  else if (v54)
  {
    -[GEOETARequest setLastKnownRoadLocation:](self, "setLastKnownRoadLocation:");
  }
  abClientMetadata = self->_abClientMetadata;
  v56 = *((_QWORD *)v4 + 8);
  if (abClientMetadata)
  {
    if (v56)
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
  }
  else if (v56)
  {
    -[GEOETARequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  v57 = *((_QWORD *)v4 + 40);
  if ((v57 & 0x400) != 0)
  {
    self->_includeRouteTrafficDetail = v4[316];
    *(_QWORD *)&self->_flags |= 0x400uLL;
    v57 = *((_QWORD *)v4 + 40);
  }
  if ((v57 & 0x800) != 0)
  {
    self->_includeShortTrafficSummary = v4[317];
    *(_QWORD *)&self->_flags |= 0x800uLL;
  }
  if (*((_QWORD *)v4 + 25))
    -[GEOETARequest setPhoneticLocaleIdentifier:](self, "setPhoneticLocaleIdentifier:");
  if (*((_QWORD *)v4 + 28))
    -[GEOETARequest setRequestingAppId:](self, "setRequestingAppId:");
  if ((v4[321] & 2) != 0)
  {
    self->_includeEtaRouteIncidents = v4[315];
    *(_QWORD *)&self->_flags |= 0x200uLL;
  }
  recentLocationHistory = self->_recentLocationHistory;
  v59 = *((_QWORD *)v4 + 27);
  if (recentLocationHistory)
  {
    if (v59)
      -[GEORecentLocationHistory mergeFrom:](recentLocationHistory, "mergeFrom:");
  }
  else if (v59)
  {
    -[GEOETARequest setRecentLocationHistory:](self, "setRecentLocationHistory:");
  }
  privacyMetadata = self->_privacyMetadata;
  v61 = *((_QWORD *)v4 + 26);
  if (privacyMetadata)
  {
    if (v61)
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
  }
  else if (v61)
  {
    -[GEOETARequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  pathComputationOptions = self->_pathComputationOptions;
  v63 = (void *)*((_QWORD *)v4 + 24);
  if (pathComputationOptions)
  {
    if (v63)
    {
      v64 = v63;
      if ((v64[5] & 1) != 0)
      {
        pathComputationOptions->_pathComputationMethod = v64[4];
        *(_BYTE *)&pathComputationOptions->_flags |= 1u;
      }

    }
  }
  else if (v63)
  {
    -[GEOETARequest setPathComputationOptions:](self, "setPathComputationOptions:");
  }
  v90 = 0u;
  v91 = 0u;
  v88 = 0u;
  v89 = 0u;
  v65 = *((id *)v4 + 29);
  v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v89;
    do
    {
      for (ii = 0; ii != v67; ++ii)
      {
        if (*(_QWORD *)v89 != v68)
          objc_enumerationMutation(v65);
        -[GEOETARequest addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * ii));
      }
      v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v88, v114, 16);
    }
    while (v67);
  }

  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  v70 = *((id *)v4 + 32);
  v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v84, v113, 16);
  if (v71)
  {
    v72 = v71;
    v73 = *(_QWORD *)v85;
    do
    {
      for (jj = 0; jj != v72; ++jj)
      {
        if (*(_QWORD *)v85 != v73)
          objc_enumerationMutation(v70);
        -[GEOETARequest addTrafficApiResponses:](self, "addTrafficApiResponses:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * jj));
      }
      v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v84, v113, 16);
    }
    while (v72);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v75 = *((id *)v4 + 33);
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v112, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v81;
    do
    {
      for (kk = 0; kk != v77; ++kk)
      {
        if (*(_QWORD *)v81 != v78)
          objc_enumerationMutation(v75);
        -[GEOETARequest addTrafficSnapshotIds:](self, "addTrafficSnapshotIds:", *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * kk), (_QWORD)v80);
      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v80, v112, 16);
    }
    while (v77);
  }

  if ((v4[320] & 8) != 0)
  {
    self->_trafficSnapshotUnixTime = *((_DWORD *)v4 + 75);
    *(_QWORD *)&self->_flags |= 8uLL;
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 1) & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOETARequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_19);
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
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  GEOPathComputationOptions *pathComputationOptions;
  PBUnknownFields *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v3 = a3;
  v59 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000002000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOETARequest readAll:](self, "readAll:", 0);
    -[GEOWaypoint clearUnknownFields:](self->_origin, "clearUnknownFields:", 1);
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v7 = self->_destinations;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v51;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v51 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
      }
      while (v9);
    }

    -[GEOAdditionalEnabledMarkets clearUnknownFields:](self->_additionalEnabledMarkets, "clearUnknownFields:", 1);
    -[GEOWaypointTyped clearUnknownFields:](self->_originWaypointTyped, "clearUnknownFields:", 1);
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v12 = self->_destinationWaypointTypeds;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v47;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v47 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v46, v57, 16);
      }
      while (v14);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = self->_intermediateWaypointTypeds;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v42, v56, 16);
      }
      while (v19);
    }

    -[GEOAutomobileOptions clearUnknownFields:](self->_automobileOptions, "clearUnknownFields:", 1);
    -[GEOCyclingOptions clearUnknownFields:](self->_cyclingOptions, "clearUnknownFields:", 1);
    -[GEOTransitOptions clearUnknownFields:](self->_transitOptions, "clearUnknownFields:", 1);
    -[GEOWalkingOptions clearUnknownFields:](self->_walkingOptions, "clearUnknownFields:", 1);
    -[GEOCommonOptions clearUnknownFields:](self->_commonOptions, "clearUnknownFields:", 1);
    -[GEOOriginalWaypointRoute clearUnknownFields:](self->_originalWaypointRoute, "clearUnknownFields:", 1);
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v22 = self->_deviceHistoricalLocations;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v39;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v39 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v26++), "clearUnknownFields:", 1);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v38, v55, 16);
      }
      while (v24);
    }

    -[GEOClientCapabilities clearUnknownFields:](self->_clientCapabilities, "clearUnknownFields:", 1);
    -[GEOLocation clearUnknownFields:](self->_lastKnownRoadLocation, "clearUnknownFields:", 1);
    -[GEOPDABClientDatasetMetadata clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1);
    -[GEORecentLocationHistory clearUnknownFields:](self->_recentLocationHistory, "clearUnknownFields:", 1);
    -[GEOPrivacyMetadata clearUnknownFields:](self->_privacyMetadata, "clearUnknownFields:", 1);
    pathComputationOptions = self->_pathComputationOptions;
    if (pathComputationOptions)
    {
      v28 = pathComputationOptions->_unknownFields;
      pathComputationOptions->_unknownFields = 0;

    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v29 = self->_serviceTags;
    v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v35;
      do
      {
        v33 = 0;
        do
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v33++), "clearUnknownFields:", 1, (_QWORD)v34);
        }
        while (v31 != v33);
        v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v34, v54, 16);
      }
      while (v31);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_trafficSnapshotIds, 0);
  objc_storeStrong((id *)&self->_trafficApiResponses, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_phoneticLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_pathComputationOptions, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_originalWaypointRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteZilchPoints, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_originWaypointTyped, 0);
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, 0);
  objc_storeStrong((id *)&self->_intermediateWaypointTypeds, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
  objc_storeStrong((id *)&self->_destinationWaypointTypeds, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
