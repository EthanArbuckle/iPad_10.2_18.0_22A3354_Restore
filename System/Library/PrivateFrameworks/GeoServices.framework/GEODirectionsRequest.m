@implementation GEODirectionsRequest

- (GEODirectionsRequest)initWithFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  GEODirectionsRequest *v9;

  v4 = a3;
  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapsUserSessionEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sessionID");
  v9 = -[GEODirectionsRequest initWithFeedback:sessionID:](self, "initWithFeedback:sessionID:", v4, v7, v8);

  return v9;
}

- (GEODirectionsRequest)initWithFeedback:(id)a3 sessionID:(GEOSessionID)a4
{
  unint64_t low;
  unint64_t high;
  id v7;
  GEODirectionsRequest *v8;
  GEODirectionsRequest *v9;
  void *v10;
  void *v11;

  low = a4._low;
  high = a4._high;
  v7 = a3;
  v8 = -[GEODirectionsRequest init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[GEODirectionsRequest setSessionID:](v8, "setSessionID:", high, low);
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mapsUserSessionEntity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sessionRelativeTimestamp");
    -[GEODirectionsRequest setSessionRelativeTimestamp:](v9, "setSessionRelativeTimestamp:");

    -[GEODirectionsRequest setFeedback:](v9, "setFeedback:", v7);
  }

  return v9;
}

- (void)initDefaultFeedbackInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (!-[GEODirectionsRequest hasSessionID](self, "hasSessionID"))
  {
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mapsUserSessionEntity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "sessionID");
    -[GEODirectionsRequest setSessionID:](self, "setSessionID:", v5, v6);

  }
  if (!-[GEODirectionsRequest hasSessionRelativeTimestamp](self, "hasSessionRelativeTimestamp"))
  {
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mapsUserSessionEntity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sessionRelativeTimestamp");
    -[GEODirectionsRequest setSessionRelativeTimestamp:](self, "setSessionRelativeTimestamp:");

  }
}

- (GEODirectionsRequest)initWithQuickETARequest:(id)a3 withFeedback:(id)a4
{
  id v6;
  GEODirectionsRequest *v7;
  void *v8;
  GEODirectionsRequest *v9;
  void *v10;
  GEORouteAttributes *v11;
  GEOAutomobileOptions *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  GEODirectionsRequest *v26;
  uint64_t v28;
  __int16 v29;
  char v30;
  uint64_t v31;
  __int16 v32;
  char v33;
  _QWORD v34[4];
  GEODirectionsRequest *v35;

  v6 = a3;
  v7 = -[GEODirectionsRequest initWithFeedback:](self, "initWithFeedback:", a4);
  if (v7)
  {
    +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __83__GEODirectionsRequest_GEOQuickETARequester__initWithQuickETARequest_withFeedback___block_invoke;
    v34[3] = &unk_1E1C04548;
    v9 = v7;
    v35 = v9;
    objc_msgSend(v8, "shortSessionValues:", v34);

    +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEODirectionsRequest setAdditionalEnabledMarkets:](v9, "setAdditionalEnabledMarkets:", v10);

    v11 = objc_alloc_init(GEORouteAttributes);
    -[GEORouteAttributes setMainTransportType:](v11, "setMainTransportType:", objc_msgSend(v6, "transportType"));
    if (!objc_msgSend(v6, "transportType"))
    {
      v12 = objc_alloc_init(GEOAutomobileOptions);
      -[GEORouteAttributes setAutomobileOptions:](v11, "setAutomobileOptions:", v12);

      -[GEORouteAttributes automobileOptions](v11, "automobileOptions");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setIncludeHistoricTravelTime:", 1);

      -[GEORouteAttributes automobileOptions](v11, "automobileOptions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTrafficType:", 3);

      -[GEORouteAttributes setIncludeHistoricTravelTime:](v11, "setIncludeHistoricTravelTime:", 1);
      -[GEORouteAttributes setTrafficType:](v11, "setTrafficType:", 3);
    }
    -[GEODirectionsRequest setMainTransportTypeMaxRouteCount:](v9, "setMainTransportTypeMaxRouteCount:", 1);
    objc_msgSend(v6, "arrivalDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "departureDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v15 == 0) != (v16 != 0))
      goto LABEL_10;
    if (v15)
    {
      v33 = 0;
      v32 = 0;
      objc_msgSend(v15, "timeIntervalSinceReferenceDate");
      v31 = 0;
      v19 = 1;
      v20 = &v31;
    }
    else
    {
      if (!v16)
      {
LABEL_10:
        -[GEODirectionsRequest setRouteAttributes:](v9, "setRouteAttributes:", v11);
        objc_msgSend(v6, "currentLocation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEODirectionsRequest setCurrentUserLocation:](v9, "setCurrentUserLocation:", v21);

        objc_msgSend(v6, "sourceWaypoint");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "geoWaypointTyped");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEODirectionsRequest addWaypointTyped:](v9, "addWaypointTyped:", v23);

        objc_msgSend(v6, "destinationWaypoint");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "geoWaypointTyped");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEODirectionsRequest addWaypointTyped:](v9, "addWaypointTyped:", v25);

        v26 = v9;
        goto LABEL_11;
      }
      v30 = 0;
      v29 = 0;
      objc_msgSend(v16, "timeIntervalSinceReferenceDate");
      v19 = 0;
      v28 = 0;
      v20 = &v28;
    }
    v20[1] = v18;
    *((_DWORD *)v20 + 4) = v19;
    *((_BYTE *)v20 + 20) = 6;
    -[GEORouteAttributes setTimepoint:](v11, "setTimepoint:");
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

void __83__GEODirectionsRequest_GEOQuickETARequester__initWithQuickETARequest_withFeedback___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10)
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

- (GEODirectionsRequest)init
{
  GEODirectionsRequest *v2;
  GEODirectionsRequest *v3;
  GEODirectionsRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsRequest;
  v2 = -[GEODirectionsRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    -[GEODirectionsRequest initDefaultFeedbackInfo](v2, "initDefaultFeedbackInfo");
    v4 = v3;
  }

  return v3;
}

- (GEODirectionsRequest)initWithData:(id)a3
{
  GEODirectionsRequest *v3;
  GEODirectionsRequest *v4;
  GEODirectionsRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEODirectionsRequest;
  v3 = -[GEODirectionsRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    -[GEODirectionsRequest initDefaultFeedbackInfo](v3, "initDefaultFeedbackInfo");
    v5 = v4;
  }

  return v4;
}

- (void)_readRouteAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteAttributes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasRouteAttributes
{
  -[GEODirectionsRequest _readRouteAttributes]((uint64_t)self);
  return self->_routeAttributes != 0;
}

- (GEORouteAttributes)routeAttributes
{
  -[GEODirectionsRequest _readRouteAttributes]((uint64_t)self);
  return self->_routeAttributes;
}

- (void)setRouteAttributes:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40800000000uLL;
  objc_storeStrong((id *)&self->_routeAttributes, a3);
}

- (void)_readWaypointTypeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 333) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWaypointTypeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)waypointTypeds
{
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  return self->_waypointTypeds;
}

- (void)setWaypointTypeds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *waypointTypeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  waypointTypeds = self->_waypointTypeds;
  self->_waypointTypeds = v4;

}

- (void)clearWaypointTypeds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_waypointTypeds, "removeAllObjects");
}

- (void)addWaypointTyped:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsWaypointTyped:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsWaypointTyped:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 272);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 272);
      *(_QWORD *)(a1 + 272) = v5;

      v4 = *(void **)(a1 + 272);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)waypointTypedsCount
{
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  return -[NSMutableArray count](self->_waypointTypeds, "count");
}

- (id)waypointTypedAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_waypointTypeds, "objectAtIndex:", a3);
}

+ (Class)waypointTypedType
{
  return (Class)objc_opt_class();
}

- (void)_readDisplayedBannerIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayedBannerIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)displayedBannerIds
{
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  return self->_displayedBannerIds;
}

- (void)setDisplayedBannerIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *displayedBannerIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  displayedBannerIds = self->_displayedBannerIds;
  self->_displayedBannerIds = v4;

}

- (void)clearDisplayedBannerIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_displayedBannerIds, "removeAllObjects");
}

- (void)addDisplayedBannerId:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsDisplayedBannerId:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsDisplayedBannerId:(uint64_t)a1
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

- (unint64_t)displayedBannerIdsCount
{
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  return -[NSMutableArray count](self->_displayedBannerIds, "count");
}

- (id)displayedBannerIdAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readDisplayedBannerIds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_displayedBannerIds, "objectAtIndex:", a3);
}

+ (Class)displayedBannerIdType
{
  return (Class)objc_opt_class();
}

- (void)_readClientFeedbackInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientFeedbackInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasClientFeedbackInfo
{
  -[GEODirectionsRequest _readClientFeedbackInfo]((uint64_t)self);
  return self->_clientFeedbackInfo != 0;
}

- (GEOClientFeedbackInfo)clientFeedbackInfo
{
  -[GEODirectionsRequest _readClientFeedbackInfo]((uint64_t)self);
  return self->_clientFeedbackInfo;
}

- (void)setClientFeedbackInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000020000uLL;
  objc_storeStrong((id *)&self->_clientFeedbackInfo, a3);
}

- (unsigned)mainTransportTypeMaxRouteCount
{
  os_unfair_lock_s *p_readerLock;
  $1FEE565F87D5293053496F1336AD4F5E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x20) != 0)
    return self->_mainTransportTypeMaxRouteCount;
  else
    return 1;
}

- (void)setMainTransportTypeMaxRouteCount:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000020uLL;
  self->_mainTransportTypeMaxRouteCount = a3;
}

- (void)setHasMainTransportTypeMaxRouteCount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000020;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasMainTransportTypeMaxRouteCount
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readCurrentUserLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentUserLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasCurrentUserLocation
{
  -[GEODirectionsRequest _readCurrentUserLocation]((uint64_t)self);
  return self->_currentUserLocation != 0;
}

- (GEOLocation)currentUserLocation
{
  -[GEODirectionsRequest _readCurrentUserLocation]((uint64_t)self);
  return self->_currentUserLocation;
}

- (void)setCurrentUserLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000100000uLL;
  objc_storeStrong((id *)&self->_currentUserLocation, a3);
}

- (void)_readCurrentMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentMapRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasCurrentMapRegion
{
  -[GEODirectionsRequest _readCurrentMapRegion]((uint64_t)self);
  return self->_currentMapRegion != 0;
}

- (GEOMapRegion)currentMapRegion
{
  -[GEODirectionsRequest _readCurrentMapRegion]((uint64_t)self);
  return self->_currentMapRegion;
}

- (void)setCurrentMapRegion:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000080000uLL;
  objc_storeStrong((id *)&self->_currentMapRegion, a3);
}

- (void)_readOriginalRouteID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteID_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalRouteID
{
  -[GEODirectionsRequest _readOriginalRouteID]((uint64_t)self);
  return self->_originalRouteID != 0;
}

- (NSData)originalRouteID
{
  -[GEODirectionsRequest _readOriginalRouteID]((uint64_t)self);
  return self->_originalRouteID;
}

- (void)setOriginalRouteID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40010000000uLL;
  objc_storeStrong((id *)&self->_originalRouteID, a3);
}

- (void)_readOriginalRouteZilchPoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteZilchPoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)originalRouteZilchPoints
{
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  return self->_originalRouteZilchPoints;
}

- (void)setOriginalRouteZilchPoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *originalRouteZilchPoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  self->_originalRouteZilchPoints = v4;

}

- (void)clearOriginalRouteZilchPoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_originalRouteZilchPoints, "removeAllObjects");
}

- (void)addOriginalRouteZilchPoints:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsOriginalRouteZilchPoints:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
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
    v4 = *(void **)(a1 + 160);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 160);
      *(_QWORD *)(a1 + 160) = v5;

      v4 = *(void **)(a1 + 160);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)originalRouteZilchPointsCount
{
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  return -[NSMutableArray count](self->_originalRouteZilchPoints, "count");
}

- (id)originalRouteZilchPointsAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readOriginalRouteZilchPoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_originalRouteZilchPoints, "objectAtIndex:", a3);
}

+ (Class)originalRouteZilchPointsType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalDirectionsResponseID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalDirectionsResponseID_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalDirectionsResponseID
{
  -[GEODirectionsRequest _readOriginalDirectionsResponseID]((uint64_t)self);
  return self->_originalDirectionsResponseID != 0;
}

- (NSData)originalDirectionsResponseID
{
  -[GEODirectionsRequest _readOriginalDirectionsResponseID]((uint64_t)self);
  return self->_originalDirectionsResponseID;
}

- (void)setOriginalDirectionsResponseID:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40008000000uLL;
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, a3);
}

- (void)_readOriginalRouteEvInfos
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteEvInfos_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)originalRouteEvInfos
{
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  return self->_originalRouteEvInfos;
}

- (void)setOriginalRouteEvInfos:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *originalRouteEvInfos;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  originalRouteEvInfos = self->_originalRouteEvInfos;
  self->_originalRouteEvInfos = v4;

}

- (void)clearOriginalRouteEvInfos
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_originalRouteEvInfos, "removeAllObjects");
}

- (void)addOriginalRouteEvInfo:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsOriginalRouteEvInfo:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
}

- (void)_addNoFlagsOriginalRouteEvInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 176);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = v5;

      v4 = *(void **)(a1 + 176);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)originalRouteEvInfosCount
{
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  return -[NSMutableArray count](self->_originalRouteEvInfos, "count");
}

- (id)originalRouteEvInfoAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readOriginalRouteEvInfos]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_originalRouteEvInfos, "objectAtIndex:", a3);
}

+ (Class)originalRouteEvInfoType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalRoute
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRoute_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalRoute
{
  -[GEODirectionsRequest _readOriginalRoute]((uint64_t)self);
  return self->_originalRoute != 0;
}

- (GEOOriginalRoute)originalRoute
{
  -[GEODirectionsRequest _readOriginalRoute]((uint64_t)self);
  return self->_originalRoute;
}

- (void)setOriginalRoute:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40040000000uLL;
  objc_storeStrong((id *)&self->_originalRoute, a3);
}

- (void)_readOriginalWaypointRoute
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalWaypointRoute_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasOriginalWaypointRoute
{
  -[GEODirectionsRequest _readOriginalWaypointRoute]((uint64_t)self);
  return self->_originalWaypointRoute != 0;
}

- (GEOOriginalWaypointRoute)originalWaypointRoute
{
  -[GEODirectionsRequest _readOriginalWaypointRoute]((uint64_t)self);
  return self->_originalWaypointRoute;
}

- (void)setOriginalWaypointRoute:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40100000000uLL;
  objc_storeStrong((id *)&self->_originalWaypointRoute, a3);
}

- (unsigned)timeSinceLastRerouteRequest
{
  return self->_timeSinceLastRerouteRequest;
}

- (void)setTimeSinceLastRerouteRequest:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000200uLL;
  self->_timeSinceLastRerouteRequest = a3;
}

- (void)setHasTimeSinceLastRerouteRequest:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000200;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasTimeSinceLastRerouteRequest
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (void)_readClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientCapabilities_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasClientCapabilities
{
  -[GEODirectionsRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities != 0;
}

- (GEOClientCapabilities)clientCapabilities
{
  -[GEODirectionsRequest _readClientCapabilities]((uint64_t)self);
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000010000uLL;
  objc_storeStrong((id *)&self->_clientCapabilities, a3);
}

- (int)departureTime
{
  return self->_departureTime;
}

- (void)setDepartureTime:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000008uLL;
  self->_departureTime = a3;
}

- (void)setHasDepartureTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000008;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasDepartureTime
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (BOOL)getRouteForZilchPoints
{
  os_unfair_lock_s *p_readerLock;
  $1FEE565F87D5293053496F1336AD4F5E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (*(_WORD *)&flags & 0x800) != 0 && self->_getRouteForZilchPoints;
}

- (void)setGetRouteForZilchPoints:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000800uLL;
  self->_getRouteForZilchPoints = a3;
}

- (void)setHasGetRouteForZilchPoints:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000800;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasGetRouteForZilchPoints
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
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
  *(_QWORD *)&self->_flags |= 0x40000000001uLL;
  self->_sessionID = a3;
}

- (void)setHasSessionID:(BOOL)a3
{
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x40000000000);
}

- (BOOL)hasSessionID
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000004uLL;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000004;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasFeedback
{
  -[GEODirectionsRequest _readFeedback]((uint64_t)self);
  return self->_feedback != 0;
}

- (GEODirectionsRequestFeedback)feedback
{
  -[GEODirectionsRequest _readFeedback]((uint64_t)self);
  return self->_feedback;
}

- (void)setFeedback:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000800000uLL;
  objc_storeStrong((id *)&self->_feedback, a3);
}

- (void)_readAdditionalEnabledMarkets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 329) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAdditionalEnabledMarkets_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasAdditionalEnabledMarkets
{
  -[GEODirectionsRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)additionalEnabledMarkets
{
  -[GEODirectionsRequest _readAdditionalEnabledMarkets]((uint64_t)self);
  return self->_additionalEnabledMarkets;
}

- (void)setAdditionalEnabledMarkets:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000008000uLL;
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, a3);
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000100uLL;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000100;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasSequenceNumber
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (void)_readSessionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSessionState_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasSessionState
{
  -[GEODirectionsRequest _readSessionState]((uint64_t)self);
  return self->_sessionState != 0;
}

- (NSData)sessionState
{
  -[GEODirectionsRequest _readSessionState]((uint64_t)self);
  return self->_sessionState;
}

- (void)setSessionState:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x42000000000uLL;
  objc_storeStrong((id *)&self->_sessionState, a3);
}

- (BOOL)isFromAPI
{
  return self->_isFromAPI;
}

- (void)setIsFromAPI:(BOOL)a3
{
  *(_QWORD *)&self->_flags |= 0x40000001000uLL;
  self->_isFromAPI = a3;
}

- (void)setHasIsFromAPI:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000001000;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v3);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCommonOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasCommonOptions
{
  -[GEODirectionsRequest _readCommonOptions]((uint64_t)self);
  return self->_commonOptions != 0;
}

- (GEOCommonOptions)commonOptions
{
  -[GEODirectionsRequest _readCommonOptions]((uint64_t)self);
  return self->_commonOptions;
}

- (void)setCommonOptions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000040000uLL;
  objc_storeStrong((id *)&self->_commonOptions, a3);
}

- (void)_readLoggedAbExperiment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLoggedAbExperiment_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasLoggedAbExperiment
{
  -[GEODirectionsRequest _readLoggedAbExperiment]((uint64_t)self);
  return self->_loggedAbExperiment != 0;
}

- (NSString)loggedAbExperiment
{
  -[GEODirectionsRequest _readLoggedAbExperiment]((uint64_t)self);
  return self->_loggedAbExperiment;
}

- (void)setLoggedAbExperiment:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40002000000uLL;
  objc_storeStrong((id *)&self->_loggedAbExperiment, a3);
}

- (void)_readLastKnownRoadLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLastKnownRoadLocation_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasLastKnownRoadLocation
{
  -[GEODirectionsRequest _readLastKnownRoadLocation]((uint64_t)self);
  return self->_lastKnownRoadLocation != 0;
}

- (GEOLocation)lastKnownRoadLocation
{
  -[GEODirectionsRequest _readLastKnownRoadLocation]((uint64_t)self);
  return self->_lastKnownRoadLocation;
}

- (void)setLastKnownRoadLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40001000000uLL;
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, a3);
}

- (int)originalRoutePurpose
{
  os_unfair_lock_s *p_readerLock;
  $1FEE565F87D5293053496F1336AD4F5E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_originalRoutePurpose;
  else
    return 1;
}

- (void)setOriginalRoutePurpose:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000080uLL;
  self->_originalRoutePurpose = a3;
}

- (void)setHasOriginalRoutePurpose:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000080;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasOriginalRoutePurpose
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)originalRoutePurposeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C20340[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsOriginalRoutePurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_ORIGINAL_ROUTE_PURPOSE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REROUTING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_FROM_ZILCH_POINTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_TO_POI")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_FROM_POI")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 329) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbClientMetadata_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasAbClientMetadata
{
  -[GEODirectionsRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEODirectionsRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40000004000uLL;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)_readDeviceHistoricalLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 330) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceHistoricalLocations_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)deviceHistoricalLocations
{
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  return self->_deviceHistoricalLocations;
}

- (void)setDeviceHistoricalLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceHistoricalLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  self->_deviceHistoricalLocations = v4;

}

- (void)clearDeviceHistoricalLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_deviceHistoricalLocations, "removeAllObjects");
}

- (void)addDeviceHistoricalLocation:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsDeviceHistoricalLocation:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
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
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)deviceHistoricalLocationsCount
{
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceHistoricalLocations, "count");
}

- (id)deviceHistoricalLocationAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceHistoricalLocations, "objectAtIndex:", a3);
}

+ (Class)deviceHistoricalLocationType
{
  return (Class)objc_opt_class();
}

- (int)nonRecommendedRoutesOption
{
  os_unfair_lock_s *p_readerLock;
  $1FEE565F87D5293053496F1336AD4F5E flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x40) != 0)
    return self->_nonRecommendedRoutesOption;
  else
    return 0;
}

- (void)setNonRecommendedRoutesOption:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000040uLL;
  self->_nonRecommendedRoutesOption = a3;
}

- (void)setHasNonRecommendedRoutesOption:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000040;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasNonRecommendedRoutesOption
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)nonRecommendedRoutesOptionAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20368[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNonRecommendedRoutesOption:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON_RECOMMENDED_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON_RECOMMENDED_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NON_RECOMMENDED_PREPARING_TO_LEAVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NON_RECOMMENDED_WHILE_TRAVELING")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readNonRecommendedRoutesCache
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 331) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNonRecommendedRoutesCache_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasNonRecommendedRoutesCache
{
  -[GEODirectionsRequest _readNonRecommendedRoutesCache]((uint64_t)self);
  return self->_nonRecommendedRoutesCache != 0;
}

- (NSData)nonRecommendedRoutesCache
{
  -[GEODirectionsRequest _readNonRecommendedRoutesCache]((uint64_t)self);
  return self->_nonRecommendedRoutesCache;
}

- (void)setNonRecommendedRoutesCache:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40004000000uLL;
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, a3);
}

- (unsigned)lastEtaDisplayed
{
  return self->_lastEtaDisplayed;
}

- (void)setLastEtaDisplayed:(unsigned int)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000010uLL;
  self->_lastEtaDisplayed = a3;
}

- (void)setHasLastEtaDisplayed:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000010;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasLastEtaDisplayed
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readRecentLocationHistory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentLocationHistory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasRecentLocationHistory
{
  -[GEODirectionsRequest _readRecentLocationHistory]((uint64_t)self);
  return self->_recentLocationHistory != 0;
}

- (GEORecentLocationHistory)recentLocationHistory
{
  -[GEODirectionsRequest _readRecentLocationHistory]((uint64_t)self);
  return self->_recentLocationHistory;
}

- (void)setRecentLocationHistory:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40400000000uLL;
  objc_storeStrong((id *)&self->_recentLocationHistory, a3);
}

- (void)_readPrivacyMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasPrivacyMetadata
{
  -[GEODirectionsRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEODirectionsRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x40200000000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (void)_readTripInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 333) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTripInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (BOOL)hasTripInfo
{
  -[GEODirectionsRequest _readTripInfo]((uint64_t)self);
  return self->_tripInfo != 0;
}

- (GEOTripInfo)tripInfo
{
  -[GEODirectionsRequest _readTripInfo]((uint64_t)self);
  return self->_tripInfo;
}

- (void)setTripInfo:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x50000000000uLL;
  objc_storeStrong((id *)&self->_tripInfo, a3);
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceTags_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (void)addServiceTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
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
    v4 = *(void **)(a1 + 224);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 224);
      *(_QWORD *)(a1 + 224) = v5;

      v4 = *(void **)(a1 + 224);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)serviceTagsCount
{
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readServiceTags]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficApiResponses_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)trafficApiResponses
{
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  return self->_trafficApiResponses;
}

- (void)setTrafficApiResponses:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficApiResponses;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  trafficApiResponses = self->_trafficApiResponses;
  self->_trafficApiResponses = v4;

}

- (void)clearTrafficApiResponses
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficApiResponses, "removeAllObjects");
}

- (void)addTrafficApiResponses:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsTrafficApiResponses:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
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
    v4 = *(void **)(a1 + 248);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 248);
      *(_QWORD *)(a1 + 248) = v5;

      v4 = *(void **)(a1 + 248);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)trafficApiResponsesCount
{
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficApiResponses, "count");
}

- (id)trafficApiResponsesAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readTrafficApiResponses]((uint64_t)self);
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
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 288));
    if ((*(_BYTE *)(a1 + 332) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEODirectionsRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTrafficSnapshotIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 288));
  }
}

- (NSMutableArray)trafficSnapshotIds
{
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  return self->_trafficSnapshotIds;
}

- (void)setTrafficSnapshotIds:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *trafficSnapshotIds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  trafficSnapshotIds = self->_trafficSnapshotIds;
  self->_trafficSnapshotIds = v4;

}

- (void)clearTrafficSnapshotIds
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  -[NSMutableArray removeAllObjects](self->_trafficSnapshotIds, "removeAllObjects");
}

- (void)addTrafficSnapshotIds:(id)a3
{
  id v4;

  v4 = a3;
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  -[GEODirectionsRequest _addNoFlagsTrafficSnapshotIds:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
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

- (unint64_t)trafficSnapshotIdsCount
{
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
  return -[NSMutableArray count](self->_trafficSnapshotIds, "count");
}

- (id)trafficSnapshotIdsAtIndex:(unint64_t)a3
{
  -[GEODirectionsRequest _readTrafficSnapshotIds]((uint64_t)self);
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
  *(_QWORD *)&self->_flags |= 0x40000000400uLL;
  self->_trafficSnapshotUnixTime = a3;
}

- (void)setHasTrafficSnapshotUnixTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000400;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFBFFLL | v3);
}

- (BOOL)hasTrafficSnapshotUnixTime
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
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
  v8.super_class = (Class)GEODirectionsRequest;
  -[GEODirectionsRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEODirectionsRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  int *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t k;
  void *v52;
  id v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  const __CFString *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  const __CFString *v87;
  id v88;
  void *v89;
  const __CFString *v90;
  void *v91;
  void *v92;
  void *v93;
  const __CFString *v94;
  id v95;
  uint64_t v96;
  __CFString *v97;
  void *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  id v102;
  void *v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t m;
  void *v109;
  id v110;
  const __CFString *v111;
  uint64_t v112;
  __CFString *v113;
  const __CFString *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  void *v121;
  void *v122;
  const __CFString *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  const __CFString *v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  const __CFString *v133;
  id v134;
  void *v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t n;
  void *v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t ii;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  const __CFString *v155;
  void *v156;
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
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  uint64_t v197;

  v197 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "routeAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v5, "jsonRepresentation");
    else
      objc_msgSend(v5, "dictionaryRepresentation");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("routeAttributes"));
  }

  if (objc_msgSend(*(id *)(a1 + 272), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 272), "count"));
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v9 = *(id *)(a1 + 272);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v187, v196, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v188;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v188 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "addObject:", v15);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v187, v196, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("waypointTyped"));
  }
  if (*(_QWORD *)(a1 + 104))
  {
    objc_msgSend((id)a1, "displayedBannerIds");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("displayedBannerId");
    else
      v17 = CFSTR("displayed_banner_id");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "clientFeedbackInfo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("clientFeedbackInfo");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("client_feedback_info");
    }
    v22 = v20;

    objc_msgSend(v4, "setObject:forKey:", v22, v21);
  }

  v23 = &OBJC_IVAR___GEOTileCoordinate__x;
  if ((*(_BYTE *)(a1 + 328) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 300));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("mainTransportTypeMaxRouteCount"));

  }
  objc_msgSend((id)a1, "currentUserLocation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v25, "jsonRepresentation");
    else
      objc_msgSend(v25, "dictionaryRepresentation");
    v27 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("currentUserLocation"));
  }

  objc_msgSend((id)a1, "currentMapRegion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v28, "jsonRepresentation");
    else
      objc_msgSend(v28, "dictionaryRepresentation");
    v30 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("currentMapRegion"));
  }

  objc_msgSend((id)a1, "originalRouteID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
    if (!*(_QWORD *)(a1 + 160))
      goto LABEL_58;
    if (a2)
      goto LABEL_47;
LABEL_56:
    objc_msgSend((id)a1, "originalRouteZilchPoints");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("originalRouteZilchPoints"));

    goto LABEL_58;
  }
  v32 = v31;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v4, "setObject:forKey:", v31, CFSTR("originalRouteID"));

    if (!*(_QWORD *)(a1 + 160))
      goto LABEL_58;
    goto LABEL_56;
  }
  objc_msgSend(v31, "base64EncodedStringWithOptions:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("originalRouteID"));

  if (*(_QWORD *)(a1 + 160))
  {
LABEL_47:
    v34 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend((id)a1, "originalRouteZilchPoints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "arrayWithCapacity:", objc_msgSend(v35, "count"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    objc_msgSend((id)a1, "originalRouteZilchPoints");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v183, v195, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v184;
      do
      {
        for (j = 0; j != v39; ++j)
        {
          if (*(_QWORD *)v184 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v183 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObject:", v42);

        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v183, v195, 16);
      }
      while (v39);
    }

    v23 = &OBJC_IVAR___GEOTileCoordinate__x;
    goto LABEL_57;
  }
LABEL_58:
  objc_msgSend((id)a1, "originalDirectionsResponseID");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "base64EncodedStringWithOptions:", 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v45, CFSTR("originalDirectionsResponseID"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v43, CFSTR("originalDirectionsResponseID"));
    }
  }

  if (objc_msgSend(*(id *)(a1 + 176), "count"))
  {
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 176), "count"));
    v179 = 0u;
    v180 = 0u;
    v181 = 0u;
    v182 = 0u;
    v47 = *(id *)(a1 + 176);
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v180;
      do
      {
        for (k = 0; k != v49; ++k)
        {
          if (*(_QWORD *)v180 != v50)
            objc_enumerationMutation(v47);
          v52 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v52, "jsonRepresentation");
          else
            objc_msgSend(v52, "dictionaryRepresentation");
          v53 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v46, "addObject:", v53);
        }
        v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v179, v194, 16);
      }
      while (v49);
    }

    if (a2)
      v54 = CFSTR("originalRouteEvInfo");
    else
      v54 = CFSTR("original_route_ev_info");
    objc_msgSend(v4, "setObject:forKey:", v46, v54);

    v23 = &OBJC_IVAR___GEOTileCoordinate__x;
  }
  objc_msgSend((id)a1, "originalRoute");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v55, "jsonRepresentation");
    else
      objc_msgSend(v55, "dictionaryRepresentation");
    v57 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("originalRoute"));
  }

  objc_msgSend((id)a1, "originalWaypointRoute");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v58;
  if (v58)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v58, "jsonRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("originalWaypointRoute");
    }
    else
    {
      objc_msgSend(v58, "dictionaryRepresentation");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = CFSTR("original_waypoint_route");
    }
    v62 = v60;

    objc_msgSend(v4, "setObject:forKey:", v62, v61);
  }

  if ((*(_BYTE *)(a1 + v23[626] + 1) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 316));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("timeSinceLastRerouteRequest"));

  }
  objc_msgSend((id)a1, "clientCapabilities");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v64;
  if (v64)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v64, "jsonRepresentation");
    else
      objc_msgSend(v64, "dictionaryRepresentation");
    v66 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("clientCapabilities"));
  }

  v67 = *(_QWORD *)(a1 + v23[626]);
  if ((v67 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 292));
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v72, CFSTR("departureTime"));

    v67 = *(_QWORD *)(a1 + 328);
    if ((v67 & 0x800) == 0)
    {
LABEL_96:
      if ((v67 & 1) == 0)
        goto LABEL_97;
LABEL_107:
      _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 24));
      v74 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v74, CFSTR("sessionID"));
      if ((*(_QWORD *)(a1 + 328) & 4) != 0)
        goto LABEL_98;
      goto LABEL_102;
    }
  }
  else if ((v67 & 0x800) == 0)
  {
    goto LABEL_96;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 324));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v73, CFSTR("getRouteForZilchPoints"));

  v67 = *(_QWORD *)(a1 + 328);
  if ((v67 & 1) != 0)
    goto LABEL_107;
LABEL_97:
  if ((v67 & 4) != 0)
  {
LABEL_98:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 232));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v69 = CFSTR("sessionRelativeTimestamp");
    else
      v69 = CFSTR("session_relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v68, v69);

  }
LABEL_102:
  objc_msgSend((id)a1, "feedback");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v70;
  if (v70)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v70, "jsonRepresentation");
    else
      objc_msgSend(v70, "dictionaryRepresentation");
    v75 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v75, CFSTR("feedback"));
  }

  objc_msgSend((id)a1, "additionalEnabledMarkets");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = v76;
  if (v76)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v76, "jsonRepresentation");
    else
      objc_msgSend(v76, "dictionaryRepresentation");
    v78 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v78, CFSTR("additionalEnabledMarkets"));
  }

  if ((*(_BYTE *)(a1 + v23[626] + 1) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 312));
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v79, CFSTR("sequenceNumber"));

  }
  objc_msgSend((id)a1, "sessionState");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v80)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v80, "base64EncodedStringWithOptions:", 0);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v82, CFSTR("sessionState"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v80, CFSTR("session_state"));
    }
  }

  if ((*(_BYTE *)(a1 + v23[626] + 1) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 325));
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v83, CFSTR("isFromAPI"));

  }
  objc_msgSend((id)a1, "commonOptions");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v84;
  if (v84)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v84, "jsonRepresentation");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = CFSTR("commonOptions");
    }
    else
    {
      objc_msgSend(v84, "dictionaryRepresentation");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = CFSTR("common_options");
    }
    v88 = v86;

    objc_msgSend(v4, "setObject:forKey:", v88, v87);
  }

  objc_msgSend((id)a1, "loggedAbExperiment");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (v89)
  {
    if (a2)
      v90 = CFSTR("loggedAbExperiment");
    else
      v90 = CFSTR("logged_ab_experiment");
    objc_msgSend(v4, "setObject:forKey:", v89, v90);
  }

  objc_msgSend((id)a1, "lastKnownRoadLocation");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = v91;
  if (v91)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v91, "jsonRepresentation");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = CFSTR("lastKnownRoadLocation");
    }
    else
    {
      objc_msgSend(v91, "dictionaryRepresentation");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      v94 = CFSTR("last_known_road_location");
    }
    v95 = v93;

    objc_msgSend(v4, "setObject:forKey:", v95, v94);
  }

  if ((*(_BYTE *)(a1 + v23[626]) & 0x80) != 0)
  {
    v96 = *(int *)(a1 + 308);
    if (v96 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 308));
      v97 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v97 = off_1E1C20340[v96];
    }
    objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("originalRoutePurpose"));

  }
  objc_msgSend((id)a1, "abClientMetadata");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = v98;
  if (v98)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v98, "jsonRepresentation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = CFSTR("abClientMetadata");
    }
    else
    {
      objc_msgSend(v98, "dictionaryRepresentation");
      v100 = (void *)objc_claimAutoreleasedReturnValue();
      v101 = CFSTR("ab_client_metadata");
    }
    v102 = v100;

    objc_msgSend(v4, "setObject:forKey:", v102, v101);
  }

  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v103 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v175 = 0u;
    v176 = 0u;
    v177 = 0u;
    v178 = 0u;
    v104 = *(id *)(a1 + 96);
    v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
    if (v105)
    {
      v106 = v105;
      v107 = *(_QWORD *)v176;
      do
      {
        for (m = 0; m != v106; ++m)
        {
          if (*(_QWORD *)v176 != v107)
            objc_enumerationMutation(v104);
          v109 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v109, "jsonRepresentation");
          else
            objc_msgSend(v109, "dictionaryRepresentation");
          v110 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v103, "addObject:", v110);
        }
        v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v175, v193, 16);
      }
      while (v106);
    }

    if (a2)
      v111 = CFSTR("deviceHistoricalLocation");
    else
      v111 = CFSTR("device_historical_location");
    objc_msgSend(v4, "setObject:forKey:", v103, v111);

    v23 = &OBJC_IVAR___GEOTileCoordinate__x;
  }
  if ((*(_BYTE *)(a1 + v23[626]) & 0x40) != 0)
  {
    v112 = *(int *)(a1 + 304);
    if (v112 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 304));
      v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v113 = off_1E1C20368[v112];
    }
    if (a2)
      v114 = CFSTR("nonRecommendedRoutesOption");
    else
      v114 = CFSTR("non_recommended_routes_option");
    objc_msgSend(v4, "setObject:forKey:", v113, v114);

  }
  objc_msgSend((id)a1, "nonRecommendedRoutesCache");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v115;
  if (v115)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v115, "base64EncodedStringWithOptions:", 0);
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v117, CFSTR("nonRecommendedRoutesCache"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v115, CFSTR("non_recommended_routes_cache"));
    }
  }

  if ((*(_BYTE *)(a1 + v23[626]) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 296));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v119 = CFSTR("lastEtaDisplayed");
    else
      v119 = CFSTR("last_eta_displayed");
    objc_msgSend(v4, "setObject:forKey:", v118, v119);

  }
  objc_msgSend((id)a1, "recentLocationHistory");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v120;
  if (v120)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v120, "jsonRepresentation");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = CFSTR("recentLocationHistory");
    }
    else
    {
      objc_msgSend(v120, "dictionaryRepresentation");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = CFSTR("recent_location_history");
    }
    v124 = v122;

    objc_msgSend(v4, "setObject:forKey:", v124, v123);
  }

  objc_msgSend((id)a1, "privacyMetadata");
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  v126 = v125;
  if (v125)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v125, "jsonRepresentation");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = CFSTR("privacyMetadata");
    }
    else
    {
      objc_msgSend(v125, "dictionaryRepresentation");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = CFSTR("privacy_metadata");
    }
    v129 = v127;

    objc_msgSend(v4, "setObject:forKey:", v129, v128);
  }

  objc_msgSend((id)a1, "tripInfo");
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = v130;
  if (v130)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v130, "jsonRepresentation");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = CFSTR("tripInfo");
    }
    else
    {
      objc_msgSend(v130, "dictionaryRepresentation");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = CFSTR("trip_info");
    }
    v134 = v132;

    objc_msgSend(v4, "setObject:forKey:", v134, v133);
  }

  if (objc_msgSend(*(id *)(a1 + 224), "count"))
  {
    v135 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 224), "count"));
    v171 = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    v136 = *(id *)(a1 + 224);
    v137 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v171, v192, 16);
    if (v137)
    {
      v138 = v137;
      v139 = *(_QWORD *)v172;
      do
      {
        for (n = 0; n != v138; ++n)
        {
          if (*(_QWORD *)v172 != v139)
            objc_enumerationMutation(v136);
          v141 = *(void **)(*((_QWORD *)&v171 + 1) + 8 * n);
          if ((a2 & 1) != 0)
            objc_msgSend(v141, "jsonRepresentation");
          else
            objc_msgSend(v141, "dictionaryRepresentation");
          v142 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v135, "addObject:", v142);
        }
        v138 = objc_msgSend(v136, "countByEnumeratingWithState:objects:count:", &v171, v192, 16);
      }
      while (v138);
    }

    objc_msgSend(v4, "setObject:forKey:", v135, CFSTR("serviceTag"));
    v23 = &OBJC_IVAR___GEOTileCoordinate__x;
  }
  if (*(_QWORD *)(a1 + 248))
  {
    if (a2)
    {
      v143 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend((id)a1, "trafficApiResponses");
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "arrayWithCapacity:", objc_msgSend(v144, "count"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();

      v169 = 0u;
      v170 = 0u;
      v167 = 0u;
      v168 = 0u;
      objc_msgSend((id)a1, "trafficApiResponses");
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v167, v191, 16);
      if (v147)
      {
        v148 = v147;
        v149 = *(_QWORD *)v168;
        do
        {
          for (ii = 0; ii != v148; ++ii)
          {
            if (*(_QWORD *)v168 != v149)
              objc_enumerationMutation(v146);
            objc_msgSend(*(id *)(*((_QWORD *)&v167 + 1) + 8 * ii), "base64EncodedStringWithOptions:", 0);
            v151 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v145, "addObject:", v151);

          }
          v148 = objc_msgSend(v146, "countByEnumeratingWithState:objects:count:", &v167, v191, 16);
        }
        while (v148);
      }

      v23 = &OBJC_IVAR___GEOTileCoordinate__x;
    }
    else
    {
      objc_msgSend((id)a1, "trafficApiResponses");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v4, "setObject:forKey:", v145, CFSTR("trafficApiResponses"));

  }
  if (*(_QWORD *)(a1 + 256))
  {
    objc_msgSend((id)a1, "trafficSnapshotIds");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v152, CFSTR("trafficSnapshotIds"));

  }
  v153 = *(_QWORD *)(a1 + v23[626]);
  if ((v153 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 320));
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v155 = CFSTR("trafficSnapshotUnixTime");
    else
      v155 = CFSTR("traffic_snapshot_unix_time");
    objc_msgSend(v4, "setObject:forKey:", v154, v155);

    v153 = *(_QWORD *)(a1 + 328);
  }
  if ((v153 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 208));
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v156, CFSTR("requestTime"));

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
      v165[2] = __50__GEODirectionsRequest__dictionaryRepresentation___block_invoke;
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
  return -[GEODirectionsRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __50__GEODirectionsRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEODirectionsRequest)initWithDictionary:(id)a3
{
  return (GEODirectionsRequest *)-[GEODirectionsRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  GEORouteAttributes *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  GEOWaypointTyped *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  GEOClientFeedbackInfo *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  GEOLocation *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  GEOMapRegion *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  const __CFString *v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  uint64_t v62;
  GEOStopStepEVInfo *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  GEOOriginalRoute *v67;
  uint64_t v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  GEOOriginalWaypointRoute *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  GEOClientCapabilities *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  void *v85;
  GEODirectionsRequestFeedback *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  GEOAdditionalEnabledMarkets *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  void *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  GEOCommonOptions *v100;
  uint64_t v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  void *v107;
  GEOLocation *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  uint64_t v113;
  const __CFString *v114;
  void *v115;
  GEOPDABClientDatasetMetadata *v116;
  uint64_t v117;
  void *v118;
  const __CFString *v119;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t n;
  uint64_t v126;
  GEOLocation *v127;
  uint64_t v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  id v132;
  uint64_t v133;
  const __CFString *v134;
  void *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  GEORecentLocationHistory *v141;
  uint64_t v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  GEOPrivacyMetadata *v146;
  uint64_t v147;
  void *v148;
  const __CFString *v149;
  void *v150;
  GEOTripInfo *v151;
  uint64_t v152;
  void *v153;
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
  void *v182;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  id v188;
  __int128 v189;
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
  uint64_t v205;
  uint64_t v206;
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
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];
  uint64_t v231;

  v231 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_295;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_295;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routeAttributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = [GEORouteAttributes alloc];
    if ((a3 & 1) != 0)
      v8 = -[GEORouteAttributes initWithJSON:](v7, "initWithJSON:", v6);
    else
      v8 = -[GEORouteAttributes initWithDictionary:](v7, "initWithDictionary:", v6);
    v9 = (void *)v8;
    objc_msgSend(a1, "setRouteAttributes:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("waypointTyped"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v188 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v221 = 0u;
    v222 = 0u;
    v219 = 0u;
    v220 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v219, v230, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v220;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v220 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v219 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = [GEOWaypointTyped alloc];
            if ((a3 & 1) != 0)
              v18 = -[GEOWaypointTyped initWithJSON:](v17, "initWithJSON:", v16);
            else
              v18 = -[GEOWaypointTyped initWithDictionary:](v17, "initWithDictionary:", v16);
            v19 = (void *)v18;
            objc_msgSend(a1, "addWaypointTyped:", v18);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v219, v230, 16);
      }
      while (v13);
    }

    v5 = v188;
  }

  if (a3)
    v20 = CFSTR("displayedBannerId");
  else
    v20 = CFSTR("displayed_banner_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v217 = 0u;
    v218 = 0u;
    v215 = 0u;
    v216 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v215, v229, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v216;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v216 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v28 = (void *)objc_msgSend(v27, "copy");
            objc_msgSend(a1, "addDisplayedBannerId:", v28);

          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v215, v229, 16);
      }
      while (v24);
    }

    v5 = v188;
  }

  if (a3)
    v29 = CFSTR("clientFeedbackInfo");
  else
    v29 = CFSTR("client_feedback_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEOClientFeedbackInfo alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEOClientFeedbackInfo initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEOClientFeedbackInfo initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setClientFeedbackInfo:", v32);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mainTransportTypeMaxRouteCount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMainTransportTypeMaxRouteCount:", objc_msgSend(v34, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentUserLocation"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v36 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v37 = -[GEOLocation initWithJSON:](v36, "initWithJSON:", v35);
    else
      v37 = -[GEOLocation initWithDictionary:](v36, "initWithDictionary:", v35);
    v38 = (void *)v37;
    objc_msgSend(a1, "setCurrentUserLocation:", v37);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("currentMapRegion"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v40 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v41 = -[GEOMapRegion initWithJSON:](v40, "initWithJSON:", v39);
    else
      v41 = -[GEOMapRegion initWithDictionary:](v40, "initWithDictionary:", v39);
    v42 = (void *)v41;
    objc_msgSend(a1, "setCurrentMapRegion:", v41);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRouteID"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v43, 0);
    objc_msgSend(a1, "setOriginalRouteID:", v44);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRouteZilchPoints"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v213 = 0u;
    v214 = 0u;
    v211 = 0u;
    v212 = 0u;
    v184 = v45;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v211, v228, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v212;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v212 != v49)
            objc_enumerationMutation(v46);
          v51 = *(_QWORD *)(*((_QWORD *)&v211 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v51, 0);
            objc_msgSend(a1, "addOriginalRouteZilchPoints:", v52);

          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v211, v228, 16);
      }
      while (v48);
    }

    v45 = v184;
    v5 = v188;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalDirectionsResponseID"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v53, 0);
    objc_msgSend(a1, "setOriginalDirectionsResponseID:", v54);

  }
  if (a3)
    v55 = CFSTR("originalRouteEvInfo");
  else
    v55 = CFSTR("original_route_ev_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v55, v184);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v209 = 0u;
    v210 = 0u;
    v207 = 0u;
    v208 = 0u;
    v185 = v56;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v207, v227, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v208;
      do
      {
        for (m = 0; m != v59; ++m)
        {
          if (*(_QWORD *)v208 != v60)
            objc_enumerationMutation(v57);
          v62 = *(_QWORD *)(*((_QWORD *)&v207 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = [GEOStopStepEVInfo alloc];
            if ((a3 & 1) != 0)
              v64 = -[GEOStopStepEVInfo initWithJSON:](v63, "initWithJSON:", v62);
            else
              v64 = -[GEOStopStepEVInfo initWithDictionary:](v63, "initWithDictionary:", v62);
            v65 = (void *)v64;
            objc_msgSend(a1, "addOriginalRouteEvInfo:", v64, v185);

          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v207, v227, 16);
      }
      while (v59);
    }

    v56 = v185;
    v5 = v188;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRoute"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = [GEOOriginalRoute alloc];
    if ((a3 & 1) != 0)
      v68 = -[GEOOriginalRoute initWithJSON:](v67, "initWithJSON:", v66);
    else
      v68 = -[GEOOriginalRoute initWithDictionary:](v67, "initWithDictionary:", v66);
    v69 = (void *)v68;
    objc_msgSend(a1, "setOriginalRoute:", v68, v185);

  }
  if (a3)
    v70 = CFSTR("originalWaypointRoute");
  else
    v70 = CFSTR("original_waypoint_route");
  objc_msgSend(v5, "objectForKeyedSubscript:", v70, v185);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = [GEOOriginalWaypointRoute alloc];
    if ((a3 & 1) != 0)
      v73 = -[GEOOriginalWaypointRoute initWithJSON:](v72, "initWithJSON:", v71);
    else
      v73 = -[GEOOriginalWaypointRoute initWithDictionary:](v72, "initWithDictionary:", v71);
    v74 = (void *)v73;
    objc_msgSend(a1, "setOriginalWaypointRoute:", v73);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("timeSinceLastRerouteRequest"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTimeSinceLastRerouteRequest:", objc_msgSend(v75, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("clientCapabilities"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v77 = [GEOClientCapabilities alloc];
    if ((a3 & 1) != 0)
      v78 = -[GEOClientCapabilities initWithJSON:](v77, "initWithJSON:", v76);
    else
      v78 = -[GEOClientCapabilities initWithDictionary:](v77, "initWithDictionary:", v76);
    v79 = (void *)v78;
    objc_msgSend(a1, "setClientCapabilities:", v78);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("departureTime"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDepartureTime:", objc_msgSend(v80, "intValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("getRouteForZilchPoints"));
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setGetRouteForZilchPoints:", objc_msgSend(v81, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sessionID"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v205 = 0;
    v206 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v82, &v205);
    objc_msgSend(a1, "setSessionID:", v205, v206);
  }

  if (a3)
    v83 = CFSTR("sessionRelativeTimestamp");
  else
    v83 = CFSTR("session_relative_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v84, "doubleValue");
    objc_msgSend(a1, "setSessionRelativeTimestamp:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("feedback"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = [GEODirectionsRequestFeedback alloc];
    if ((a3 & 1) != 0)
      v87 = -[GEODirectionsRequestFeedback initWithJSON:](v86, "initWithJSON:", v85);
    else
      v87 = -[GEODirectionsRequestFeedback initWithDictionary:](v86, "initWithDictionary:", v85);
    v88 = (void *)v87;
    objc_msgSend(a1, "setFeedback:", v87);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("additionalEnabledMarkets"));
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = [GEOAdditionalEnabledMarkets alloc];
    if ((a3 & 1) != 0)
      v91 = -[GEOAdditionalEnabledMarkets initWithJSON:](v90, "initWithJSON:", v89);
    else
      v91 = -[GEOAdditionalEnabledMarkets initWithDictionary:](v90, "initWithDictionary:", v89);
    v92 = (void *)v91;
    objc_msgSend(a1, "setAdditionalEnabledMarkets:", v91);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("sequenceNumber"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSequenceNumber:", objc_msgSend(v93, "unsignedIntValue"));

  if (a3)
    v94 = CFSTR("sessionState");
  else
    v94 = CFSTR("session_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v96 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v95, 0);
    objc_msgSend(a1, "setSessionState:", v96);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isFromAPI"));
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsFromAPI:", objc_msgSend(v97, "BOOLValue"));

  if (a3)
    v98 = CFSTR("commonOptions");
  else
    v98 = CFSTR("common_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = [GEOCommonOptions alloc];
    if ((a3 & 1) != 0)
      v101 = -[GEOCommonOptions initWithJSON:](v100, "initWithJSON:", v99);
    else
      v101 = -[GEOCommonOptions initWithDictionary:](v100, "initWithDictionary:", v99);
    v102 = (void *)v101;
    objc_msgSend(a1, "setCommonOptions:", v101);

  }
  if (a3)
    v103 = CFSTR("loggedAbExperiment");
  else
    v103 = CFSTR("logged_ab_experiment");
  objc_msgSend(v5, "objectForKeyedSubscript:", v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v105 = (void *)objc_msgSend(v104, "copy");
    objc_msgSend(a1, "setLoggedAbExperiment:", v105);

  }
  if (a3)
    v106 = CFSTR("lastKnownRoadLocation");
  else
    v106 = CFSTR("last_known_road_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v108 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v109 = -[GEOLocation initWithJSON:](v108, "initWithJSON:", v107);
    else
      v109 = -[GEOLocation initWithDictionary:](v108, "initWithDictionary:", v107);
    v110 = (void *)v109;
    objc_msgSend(a1, "setLastKnownRoadLocation:", v109);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("originalRoutePurpose"));
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = v111;
    if ((objc_msgSend(v112, "isEqualToString:", CFSTR("UNKNOWN_ORIGINAL_ROUTE_PURPOSE")) & 1) != 0)
    {
      v113 = 0;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("REROUTING")) & 1) != 0)
    {
      v113 = 1;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("ROUTE_FROM_ZILCH_POINTS")) & 1) != 0)
    {
      v113 = 2;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_TO_POI")) & 1) != 0)
    {
      v113 = 3;
    }
    else if (objc_msgSend(v112, "isEqualToString:", CFSTR("BIASED_DIRECTIONS_FROM_POI")))
    {
      v113 = 4;
    }
    else
    {
      v113 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_175;
    v113 = objc_msgSend(v111, "intValue");
  }
  objc_msgSend(a1, "setOriginalRoutePurpose:", v113);
LABEL_175:

  if (a3)
    v114 = CFSTR("abClientMetadata");
  else
    v114 = CFSTR("ab_client_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = [GEOPDABClientDatasetMetadata alloc];
    if ((a3 & 1) != 0)
      v117 = -[GEOPDABClientDatasetMetadata initWithJSON:](v116, "initWithJSON:", v115);
    else
      v117 = -[GEOPDABClientDatasetMetadata initWithDictionary:](v116, "initWithDictionary:", v115);
    v118 = (void *)v117;
    objc_msgSend(a1, "setAbClientMetadata:", v117);

  }
  if (a3)
    v119 = CFSTR("deviceHistoricalLocation");
  else
    v119 = CFSTR("device_historical_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v119);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v203 = 0u;
    v204 = 0u;
    v201 = 0u;
    v202 = 0u;
    v186 = v120;
    v121 = v120;
    v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v201, v226, 16);
    if (v122)
    {
      v123 = v122;
      v124 = *(_QWORD *)v202;
      do
      {
        for (n = 0; n != v123; ++n)
        {
          if (*(_QWORD *)v202 != v124)
            objc_enumerationMutation(v121);
          v126 = *(_QWORD *)(*((_QWORD *)&v201 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v127 = [GEOLocation alloc];
            if ((a3 & 1) != 0)
              v128 = -[GEOLocation initWithJSON:](v127, "initWithJSON:", v126);
            else
              v128 = -[GEOLocation initWithDictionary:](v127, "initWithDictionary:", v126);
            v129 = (void *)v128;
            objc_msgSend(a1, "addDeviceHistoricalLocation:", v128, v186);

          }
        }
        v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v201, v226, 16);
      }
      while (v123);
    }

    v120 = v186;
    v5 = v188;
  }

  if (a3)
    v130 = CFSTR("nonRecommendedRoutesOption");
  else
    v130 = CFSTR("non_recommended_routes_option");
  objc_msgSend(v5, "objectForKeyedSubscript:", v130, v186);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v132 = v131;
    if ((objc_msgSend(v132, "isEqualToString:", CFSTR("NON_RECOMMENDED_UNKNOWN")) & 1) != 0)
    {
      v133 = 0;
    }
    else if ((objc_msgSend(v132, "isEqualToString:", CFSTR("NON_RECOMMENDED_NONE")) & 1) != 0)
    {
      v133 = 1;
    }
    else if ((objc_msgSend(v132, "isEqualToString:", CFSTR("NON_RECOMMENDED_PREPARING_TO_LEAVE")) & 1) != 0)
    {
      v133 = 2;
    }
    else if (objc_msgSend(v132, "isEqualToString:", CFSTR("NON_RECOMMENDED_WHILE_TRAVELING")))
    {
      v133 = 3;
    }
    else
    {
      v133 = 0;
    }

    goto LABEL_216;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = objc_msgSend(v131, "intValue");
LABEL_216:
    objc_msgSend(a1, "setNonRecommendedRoutesOption:", v133);
  }

  if (a3)
    v134 = CFSTR("nonRecommendedRoutesCache");
  else
    v134 = CFSTR("non_recommended_routes_cache");
  objc_msgSend(v5, "objectForKeyedSubscript:", v134);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v136 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v135, 0);
    objc_msgSend(a1, "setNonRecommendedRoutesCache:", v136);

  }
  if (a3)
    v137 = CFSTR("lastEtaDisplayed");
  else
    v137 = CFSTR("last_eta_displayed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLastEtaDisplayed:", objc_msgSend(v138, "unsignedIntValue"));

  if (a3)
    v139 = CFSTR("recentLocationHistory");
  else
    v139 = CFSTR("recent_location_history");
  objc_msgSend(v5, "objectForKeyedSubscript:", v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v141 = [GEORecentLocationHistory alloc];
    if ((a3 & 1) != 0)
      v142 = -[GEORecentLocationHistory initWithJSON:](v141, "initWithJSON:", v140);
    else
      v142 = -[GEORecentLocationHistory initWithDictionary:](v141, "initWithDictionary:", v140);
    v143 = (void *)v142;
    objc_msgSend(a1, "setRecentLocationHistory:", v142);

  }
  if (a3)
    v144 = CFSTR("privacyMetadata");
  else
    v144 = CFSTR("privacy_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v144);
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v146 = [GEOPrivacyMetadata alloc];
    if ((a3 & 1) != 0)
      v147 = -[GEOPrivacyMetadata initWithJSON:](v146, "initWithJSON:", v145);
    else
      v147 = -[GEOPrivacyMetadata initWithDictionary:](v146, "initWithDictionary:", v145);
    v148 = (void *)v147;
    objc_msgSend(a1, "setPrivacyMetadata:", v147);

  }
  if (a3)
    v149 = CFSTR("tripInfo");
  else
    v149 = CFSTR("trip_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v149);
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v151 = [GEOTripInfo alloc];
    if ((a3 & 1) != 0)
      v152 = -[GEOTripInfo initWithJSON:](v151, "initWithJSON:", v150);
    else
      v152 = -[GEOTripInfo initWithDictionary:](v151, "initWithDictionary:", v150);
    v153 = (void *)v152;
    objc_msgSend(a1, "setTripInfo:", v152);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("serviceTag"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v199 = 0u;
    v200 = 0u;
    v197 = 0u;
    v198 = 0u;
    v187 = v154;
    v155 = v154;
    v156 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v197, v225, 16);
    if (v156)
    {
      v157 = v156;
      v158 = *(_QWORD *)v198;
      do
      {
        for (ii = 0; ii != v157; ++ii)
        {
          if (*(_QWORD *)v198 != v158)
            objc_enumerationMutation(v155);
          v160 = *(_QWORD *)(*((_QWORD *)&v197 + 1) + 8 * ii);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v161 = [GEOGeoServiceTag alloc];
            if ((a3 & 1) != 0)
              v162 = -[GEOGeoServiceTag initWithJSON:](v161, "initWithJSON:", v160);
            else
              v162 = -[GEOGeoServiceTag initWithDictionary:](v161, "initWithDictionary:", v160);
            v163 = (void *)v162;
            objc_msgSend(a1, "addServiceTag:", v162, v187);

          }
        }
        v157 = objc_msgSend(v155, "countByEnumeratingWithState:objects:count:", &v197, v225, 16);
      }
      while (v157);
    }

    v154 = v187;
    v5 = v188;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficApiResponses"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v195 = 0u;
    v196 = 0u;
    v193 = 0u;
    v194 = 0u;
    v165 = v164;
    v166 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v193, v224, 16);
    if (v166)
    {
      v167 = v166;
      v168 = *(_QWORD *)v194;
      do
      {
        for (jj = 0; jj != v167; ++jj)
        {
          if (*(_QWORD *)v194 != v168)
            objc_enumerationMutation(v165);
          v170 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * jj);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v171 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v170, 0);
            objc_msgSend(a1, "addTrafficApiResponses:", v171);

          }
        }
        v167 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v193, v224, 16);
      }
      while (v167);
    }

    v5 = v188;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("trafficSnapshotIds"));
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v191 = 0u;
    v192 = 0u;
    v189 = 0u;
    v190 = 0u;
    v173 = v172;
    v174 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v189, v223, 16);
    if (v174)
    {
      v175 = v174;
      v176 = *(_QWORD *)v190;
      do
      {
        for (kk = 0; kk != v175; ++kk)
        {
          if (*(_QWORD *)v190 != v176)
            objc_enumerationMutation(v173);
          v178 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * kk);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v179 = (void *)objc_msgSend(v178, "copy");
            objc_msgSend(a1, "addTrafficSnapshotIds:", v179);

          }
        }
        v175 = objc_msgSend(v173, "countByEnumeratingWithState:objects:count:", &v189, v223, 16);
      }
      while (v175);
    }

    v5 = v188;
  }

  if (a3)
    v180 = CFSTR("trafficSnapshotUnixTime");
  else
    v180 = CFSTR("traffic_snapshot_unix_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v180, v187);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTrafficSnapshotUnixTime:", objc_msgSend(v181, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("requestTime"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v182, "doubleValue");
    objc_msgSend(a1, "setRequestTime:");
  }

  a1 = a1;
LABEL_295:

  return a1;
}

- (GEODirectionsRequest)initWithJSON:(id)a3
{
  return (GEODirectionsRequest *)-[GEODirectionsRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_80;
    else
      v8 = (int *)&readAll__nonRecursiveTag_80;
    GEODirectionsRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEODirectionsRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEODirectionsRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEODirectionsRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  $1FEE565F87D5293053496F1336AD4F5E flags;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSMutableArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  $1FEE565F87D5293053496F1336AD4F5E v39;
  PBDataReader *v40;
  void *v41;
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
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
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
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEODirectionsRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v40 = self->_reader;
    objc_sync_enter(v40);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v41);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v40);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEODirectionsRequest readAll:](self, "readAll:", 0);
    if (self->_routeAttributes)
      PBDataWriterWriteSubmessage();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v6 = self->_waypointTypeds;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v72;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v72 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v71, v82, 16);
      }
      while (v7);
    }

    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v10 = self->_displayedBannerIds;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v68;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v68 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteStringField();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v11);
    }

    if (self->_clientFeedbackInfo)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x20) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_currentUserLocation)
      PBDataWriterWriteSubmessage();
    if (self->_currentMapRegion)
      PBDataWriterWriteSubmessage();
    if (self->_originalRouteID)
      PBDataWriterWriteDataField();
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v14 = self->_originalRouteZilchPoints;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v64;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v64 != v16)
            objc_enumerationMutation(v14);
          PBDataWriterWriteDataField();
          ++v17;
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v63, v80, 16);
      }
      while (v15);
    }

    if (self->_originalDirectionsResponseID)
      PBDataWriterWriteDataField();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v18 = self->_originalRouteEvInfos;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v60;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v60 != v20)
            objc_enumerationMutation(v18);
          PBDataWriterWriteSubmessage();
          ++v21;
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v59, v79, 16);
      }
      while (v19);
    }

    if (self->_originalRoute)
      PBDataWriterWriteSubmessage();
    if (self->_originalWaypointRoute)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_clientCapabilities)
      PBDataWriterWriteSubmessage();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
      PBDataWriterWriteSfixed32Field();
      flags = self->_flags;
    }
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 1) != 0)
    {
      v58 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_feedback)
      PBDataWriterWriteSubmessage();
    if (self->_additionalEnabledMarkets)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_sessionState)
      PBDataWriterWriteDataField();
    if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_commonOptions)
      PBDataWriterWriteSubmessage();
    if (self->_loggedAbExperiment)
      PBDataWriterWriteStringField();
    if (self->_lastKnownRoadLocation)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x80) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_abClientMetadata)
      PBDataWriterWriteSubmessage();
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = self->_deviceHistoricalLocations;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v55;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v55 != v25)
            objc_enumerationMutation(v23);
          PBDataWriterWriteSubmessage();
          ++v26;
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v54, v78, 16);
      }
      while (v24);
    }

    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_nonRecommendedRoutesCache)
      PBDataWriterWriteDataField();
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_recentLocationHistory)
      PBDataWriterWriteSubmessage();
    if (self->_privacyMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_tripInfo)
      PBDataWriterWriteSubmessage();
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v27 = self->_serviceTags;
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v77, 16);
    if (v28)
    {
      v29 = *(_QWORD *)v51;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v51 != v29)
            objc_enumerationMutation(v27);
          PBDataWriterWriteSubmessage();
          ++v30;
        }
        while (v28 != v30);
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v50, v77, 16);
      }
      while (v28);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v31 = self->_trafficApiResponses;
    v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v76, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v47;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v47 != v33)
            objc_enumerationMutation(v31);
          PBDataWriterWriteDataField();
          ++v34;
        }
        while (v32 != v34);
        v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v46, v76, 16);
      }
      while (v32);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v35 = self->_trafficSnapshotIds;
    v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v75, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v43;
      do
      {
        v38 = 0;
        do
        {
          if (*(_QWORD *)v43 != v37)
            objc_enumerationMutation(v35);
          PBDataWriterWriteStringField();
          ++v38;
        }
        while (v36 != v38);
        v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v42, v75, 16);
      }
      while (v36);
    }

    v39 = self->_flags;
    if ((*(_WORD *)&v39 & 0x400) != 0)
    {
      PBDataWriterWriteUint32Field();
      v39 = self->_flags;
    }
    if ((*(_BYTE *)&v39 & 2) != 0)
      PBDataWriterWriteDoubleField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v42);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEODirectionsRequestClearSensitiveFields((id *)&self->super.super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  BOOL v5;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsRequest _readCurrentMapRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_currentMapRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEODirectionsRequest _readCurrentUserLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_currentUserLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEODirectionsRequest _readDeviceHistoricalLocations]((uint64_t)self);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = self->_deviceHistoricalLocations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
LABEL_7:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v10)
        objc_enumerationMutation(v7);
      if ((objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11), "hasGreenTeaWithValue:", v3) & 1) != 0)
        goto LABEL_24;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v9)
          goto LABEL_7;
        break;
      }
    }
  }

  -[GEODirectionsRequest _readLastKnownRoadLocation]((uint64_t)self);
  if (!-[GEOLocation hasGreenTeaWithValue:](self->_lastKnownRoadLocation, "hasGreenTeaWithValue:", v3))
  {
    -[GEODirectionsRequest _readOriginalWaypointRoute]((uint64_t)self);
    if (!-[GEOOriginalWaypointRoute hasGreenTeaWithValue:](self->_originalWaypointRoute, "hasGreenTeaWithValue:", v3))
    {
      -[GEODirectionsRequest _readWaypointTypeds]((uint64_t)self);
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v7 = self->_waypointTypeds;
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (!v12)
      {
LABEL_23:
        v5 = 0;
LABEL_25:

        return v5;
      }
      v13 = v12;
      v14 = *(_QWORD *)v17;
LABEL_17:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v7);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15), "hasGreenTeaWithValue:", v3, (_QWORD)v16) & 1) != 0)
          break;
        if (v13 == ++v15)
        {
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
          if (v13)
            goto LABEL_17;
          goto LABEL_23;
        }
      }
LABEL_24:
      v5 = 1;
      goto LABEL_25;
    }
  }
  return 1;
}

- (unsigned)requestTypeCode
{
  return 44;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t k;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t m;
  void *v19;
  id *v20;
  $1FEE565F87D5293053496F1336AD4F5E flags;
  unint64_t v22;
  unint64_t v23;
  uint64_t n;
  void *v25;
  id *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t ii;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t jj;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t kk;
  void *v38;
  $1FEE565F87D5293053496F1336AD4F5E v39;
  id *v40;

  v40 = (id *)a3;
  -[GEODirectionsRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v40 + 1, self->_reader);
  *((_DWORD *)v40 + 70) = self->_readerMarkPos;
  *((_DWORD *)v40 + 71) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_routeAttributes)
    objc_msgSend(v40, "setRouteAttributes:");
  if (-[GEODirectionsRequest waypointTypedsCount](self, "waypointTypedsCount"))
  {
    objc_msgSend(v40, "clearWaypointTypeds");
    v4 = -[GEODirectionsRequest waypointTypedsCount](self, "waypointTypedsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEODirectionsRequest waypointTypedAtIndex:](self, "waypointTypedAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addWaypointTyped:", v7);

      }
    }
  }
  if (-[GEODirectionsRequest displayedBannerIdsCount](self, "displayedBannerIdsCount"))
  {
    objc_msgSend(v40, "clearDisplayedBannerIds");
    v8 = -[GEODirectionsRequest displayedBannerIdsCount](self, "displayedBannerIdsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEODirectionsRequest displayedBannerIdAtIndex:](self, "displayedBannerIdAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addDisplayedBannerId:", v11);

      }
    }
  }
  if (self->_clientFeedbackInfo)
    objc_msgSend(v40, "setClientFeedbackInfo:");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *((_DWORD *)v40 + 75) = self->_mainTransportTypeMaxRouteCount;
    v40[41] = (id)((unint64_t)v40[41] | 0x20);
  }
  if (self->_currentUserLocation)
    objc_msgSend(v40, "setCurrentUserLocation:");
  if (self->_currentMapRegion)
    objc_msgSend(v40, "setCurrentMapRegion:");
  if (self->_originalRouteID)
    objc_msgSend(v40, "setOriginalRouteID:");
  if (-[GEODirectionsRequest originalRouteZilchPointsCount](self, "originalRouteZilchPointsCount"))
  {
    objc_msgSend(v40, "clearOriginalRouteZilchPoints");
    v12 = -[GEODirectionsRequest originalRouteZilchPointsCount](self, "originalRouteZilchPointsCount");
    if (v12)
    {
      v13 = v12;
      for (k = 0; k != v13; ++k)
      {
        -[GEODirectionsRequest originalRouteZilchPointsAtIndex:](self, "originalRouteZilchPointsAtIndex:", k);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addOriginalRouteZilchPoints:", v15);

      }
    }
  }
  if (self->_originalDirectionsResponseID)
    objc_msgSend(v40, "setOriginalDirectionsResponseID:");
  if (-[GEODirectionsRequest originalRouteEvInfosCount](self, "originalRouteEvInfosCount"))
  {
    objc_msgSend(v40, "clearOriginalRouteEvInfos");
    v16 = -[GEODirectionsRequest originalRouteEvInfosCount](self, "originalRouteEvInfosCount");
    if (v16)
    {
      v17 = v16;
      for (m = 0; m != v17; ++m)
      {
        -[GEODirectionsRequest originalRouteEvInfoAtIndex:](self, "originalRouteEvInfoAtIndex:", m);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addOriginalRouteEvInfo:", v19);

      }
    }
  }
  if (self->_originalRoute)
    objc_msgSend(v40, "setOriginalRoute:");
  v20 = v40;
  if (self->_originalWaypointRoute)
  {
    objc_msgSend(v40, "setOriginalWaypointRoute:");
    v20 = v40;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    *((_DWORD *)v20 + 79) = self->_timeSinceLastRerouteRequest;
    v20[41] = (id)((unint64_t)v20[41] | 0x200);
  }
  if (self->_clientCapabilities)
  {
    objc_msgSend(v40, "setClientCapabilities:");
    v20 = v40;
  }
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *((_DWORD *)v20 + 73) = self->_departureTime;
    v20[41] = (id)((unint64_t)v20[41] | 8);
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_41:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_42;
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_41;
  }
  *((_BYTE *)v20 + 324) = self->_getRouteForZilchPoints;
  v20[41] = (id)((unint64_t)v20[41] | 0x800);
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) == 0)
  {
LABEL_42:
    if ((*(_BYTE *)&flags & 4) == 0)
      goto LABEL_44;
    goto LABEL_43;
  }
LABEL_99:
  *(GEOSessionID *)(v20 + 3) = self->_sessionID;
  v20[41] = (id)((unint64_t)v20[41] | 1);
  if ((*(_QWORD *)&self->_flags & 4) != 0)
  {
LABEL_43:
    v20[29] = *(id *)&self->_sessionRelativeTimestamp;
    v20[41] = (id)((unint64_t)v20[41] | 4);
  }
LABEL_44:
  if (self->_feedback)
  {
    objc_msgSend(v40, "setFeedback:");
    v20 = v40;
  }
  if (self->_additionalEnabledMarkets)
  {
    objc_msgSend(v40, "setAdditionalEnabledMarkets:");
    v20 = v40;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *((_DWORD *)v20 + 78) = self->_sequenceNumber;
    v20[41] = (id)((unint64_t)v20[41] | 0x100);
  }
  if (self->_sessionState)
  {
    objc_msgSend(v40, "setSessionState:");
    v20 = v40;
  }
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
  {
    *((_BYTE *)v20 + 325) = self->_isFromAPI;
    v20[41] = (id)((unint64_t)v20[41] | 0x1000);
  }
  if (self->_commonOptions)
  {
    objc_msgSend(v40, "setCommonOptions:");
    v20 = v40;
  }
  if (self->_loggedAbExperiment)
  {
    objc_msgSend(v40, "setLoggedAbExperiment:");
    v20 = v40;
  }
  if (self->_lastKnownRoadLocation)
  {
    objc_msgSend(v40, "setLastKnownRoadLocation:");
    v20 = v40;
  }
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *((_DWORD *)v20 + 77) = self->_originalRoutePurpose;
    v20[41] = (id)((unint64_t)v20[41] | 0x80);
  }
  if (self->_abClientMetadata)
    objc_msgSend(v40, "setAbClientMetadata:");
  if (-[GEODirectionsRequest deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount"))
  {
    objc_msgSend(v40, "clearDeviceHistoricalLocations");
    v22 = -[GEODirectionsRequest deviceHistoricalLocationsCount](self, "deviceHistoricalLocationsCount");
    if (v22)
    {
      v23 = v22;
      for (n = 0; n != v23; ++n)
      {
        -[GEODirectionsRequest deviceHistoricalLocationAtIndex:](self, "deviceHistoricalLocationAtIndex:", n);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addDeviceHistoricalLocation:", v25);

      }
    }
  }
  v26 = v40;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v40 + 76) = self->_nonRecommendedRoutesOption;
    v40[41] = (id)((unint64_t)v40[41] | 0x40);
  }
  if (self->_nonRecommendedRoutesCache)
  {
    objc_msgSend(v40, "setNonRecommendedRoutesCache:");
    v26 = v40;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_DWORD *)v26 + 74) = self->_lastEtaDisplayed;
    v26[41] = (id)((unint64_t)v26[41] | 0x10);
  }
  if (self->_recentLocationHistory)
    objc_msgSend(v40, "setRecentLocationHistory:");
  if (self->_privacyMetadata)
    objc_msgSend(v40, "setPrivacyMetadata:");
  if (self->_tripInfo)
    objc_msgSend(v40, "setTripInfo:");
  if (-[GEODirectionsRequest serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v40, "clearServiceTags");
    v27 = -[GEODirectionsRequest serviceTagsCount](self, "serviceTagsCount");
    if (v27)
    {
      v28 = v27;
      for (ii = 0; ii != v28; ++ii)
      {
        -[GEODirectionsRequest serviceTagAtIndex:](self, "serviceTagAtIndex:", ii);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addServiceTag:", v30);

      }
    }
  }
  if (-[GEODirectionsRequest trafficApiResponsesCount](self, "trafficApiResponsesCount"))
  {
    objc_msgSend(v40, "clearTrafficApiResponses");
    v31 = -[GEODirectionsRequest trafficApiResponsesCount](self, "trafficApiResponsesCount");
    if (v31)
    {
      v32 = v31;
      for (jj = 0; jj != v32; ++jj)
      {
        -[GEODirectionsRequest trafficApiResponsesAtIndex:](self, "trafficApiResponsesAtIndex:", jj);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addTrafficApiResponses:", v34);

      }
    }
  }
  if (-[GEODirectionsRequest trafficSnapshotIdsCount](self, "trafficSnapshotIdsCount"))
  {
    objc_msgSend(v40, "clearTrafficSnapshotIds");
    v35 = -[GEODirectionsRequest trafficSnapshotIdsCount](self, "trafficSnapshotIdsCount");
    if (v35)
    {
      v36 = v35;
      for (kk = 0; kk != v36; ++kk)
      {
        -[GEODirectionsRequest trafficSnapshotIdsAtIndex:](self, "trafficSnapshotIdsAtIndex:", kk);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addTrafficSnapshotIds:", v38);

      }
    }
  }
  v39 = self->_flags;
  if ((*(_WORD *)&v39 & 0x400) != 0)
  {
    *((_DWORD *)v40 + 80) = self->_trafficSnapshotUnixTime;
    v40[41] = (id)((unint64_t)v40[41] | 0x400);
    v39 = self->_flags;
  }
  if ((*(_BYTE *)&v39 & 2) != 0)
  {
    v40[26] = *(id *)&self->_requestTime;
    v40[41] = (id)((unint64_t)v40[41] | 2);
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
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSMutableArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  uint64_t v34;
  void *v35;
  NSMutableArray *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  $1FEE565F87D5293053496F1336AD4F5E flags;
  id v48;
  void *v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  NSMutableArray *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t n;
  void *v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t ii;
  void *v79;
  NSMutableArray *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t jj;
  void *v84;
  NSMutableArray *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t kk;
  void *v89;
  $1FEE565F87D5293053496F1336AD4F5E v90;
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
    if ((*((_BYTE *)&self->_flags + 5) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEODirectionsRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_85;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEODirectionsRequest readAll:](self, "readAll:", 0);
  v9 = -[GEORouteAttributes copyWithZone:](self->_routeAttributes, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v9;

  v123 = 0u;
  v124 = 0u;
  v121 = 0u;
  v122 = 0u;
  v11 = self->_waypointTypeds;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v122;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v122 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v121 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addWaypointTyped:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v121, v132, 16);
    }
    while (v12);
  }

  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v16 = self->_displayedBannerIds;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v118;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v118 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v117 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDisplayedBannerId:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v117, v131, 16);
    }
    while (v17);
  }

  v21 = -[GEOClientFeedbackInfo copyWithZone:](self->_clientFeedbackInfo, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v21;

  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_mainTransportTypeMaxRouteCount;
    *(_QWORD *)(v5 + 328) |= 0x20uLL;
  }
  v23 = -[GEOLocation copyWithZone:](self->_currentUserLocation, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v23;

  v25 = -[GEOMapRegion copyWithZone:](self->_currentMapRegion, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v25;

  v27 = -[NSData copyWithZone:](self->_originalRouteID, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v27;

  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v29 = self->_originalRouteZilchPoints;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
  if (v30)
  {
    v31 = *(_QWORD *)v114;
    do
    {
      for (k = 0; k != v30; ++k)
      {
        if (*(_QWORD *)v114 != v31)
          objc_enumerationMutation(v29);
        v33 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v113 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOriginalRouteZilchPoints:", v33);

      }
      v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v113, v130, 16);
    }
    while (v30);
  }

  v34 = -[NSData copyWithZone:](self->_originalDirectionsResponseID, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v34;

  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v36 = self->_originalRouteEvInfos;
  v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v109, v129, 16);
  if (v37)
  {
    v38 = *(_QWORD *)v110;
    do
    {
      for (m = 0; m != v37; ++m)
      {
        if (*(_QWORD *)v110 != v38)
          objc_enumerationMutation(v36);
        v40 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v109 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOriginalRouteEvInfo:", v40);

      }
      v37 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v109, v129, 16);
    }
    while (v37);
  }

  v41 = -[GEOOriginalRoute copyWithZone:](self->_originalRoute, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v41;

  v43 = -[GEOOriginalWaypointRoute copyWithZone:](self->_originalWaypointRoute, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v43;

  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
  {
    *(_DWORD *)(v5 + 316) = self->_timeSinceLastRerouteRequest;
    *(_QWORD *)(v5 + 328) |= 0x200uLL;
  }
  v45 = -[GEOClientCapabilities copyWithZone:](self->_clientCapabilities, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v45;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 292) = self->_departureTime;
    *(_QWORD *)(v5 + 328) |= 8uLL;
    flags = self->_flags;
    if ((*(_WORD *)&flags & 0x800) == 0)
    {
LABEL_39:
      if ((*(_BYTE *)&flags & 1) == 0)
        goto LABEL_40;
LABEL_88:
      *(GEOSessionID *)(v5 + 24) = self->_sessionID;
      *(_QWORD *)(v5 + 328) |= 1uLL;
      if ((*(_QWORD *)&self->_flags & 4) == 0)
        goto LABEL_42;
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&flags & 0x800) == 0)
  {
    goto LABEL_39;
  }
  *(_BYTE *)(v5 + 324) = self->_getRouteForZilchPoints;
  *(_QWORD *)(v5 + 328) |= 0x800uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 1) != 0)
    goto LABEL_88;
LABEL_40:
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_41:
    *(double *)(v5 + 232) = self->_sessionRelativeTimestamp;
    *(_QWORD *)(v5 + 328) |= 4uLL;
  }
LABEL_42:
  v48 = -[GEODirectionsRequestFeedback copyWithZone:](self->_feedback, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v48;

  v50 = -[GEOAdditionalEnabledMarkets copyWithZone:](self->_additionalEnabledMarkets, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v50;

  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
  {
    *(_DWORD *)(v5 + 312) = self->_sequenceNumber;
    *(_QWORD *)(v5 + 328) |= 0x100uLL;
  }
  v52 = -[NSData copyWithZone:](self->_sessionState, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v52;

  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 325) = self->_isFromAPI;
    *(_QWORD *)(v5 + 328) |= 0x1000uLL;
  }
  v54 = -[GEOCommonOptions copyWithZone:](self->_commonOptions, "copyWithZone:", a3);
  v55 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v54;

  v56 = -[NSString copyWithZone:](self->_loggedAbExperiment, "copyWithZone:", a3);
  v57 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v56;

  v58 = -[GEOLocation copyWithZone:](self->_lastKnownRoadLocation, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v58;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 308) = self->_originalRoutePurpose;
    *(_QWORD *)(v5 + 328) |= 0x80uLL;
  }
  v60 = -[GEOPDABClientDatasetMetadata copyWithZone:](self->_abClientMetadata, "copyWithZone:", a3);
  v61 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v60;

  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v62 = self->_deviceHistoricalLocations;
  v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
  if (v63)
  {
    v64 = *(_QWORD *)v106;
    do
    {
      for (n = 0; n != v63; ++n)
      {
        if (*(_QWORD *)v106 != v64)
          objc_enumerationMutation(v62);
        v66 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * n), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDeviceHistoricalLocation:", v66);

      }
      v63 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v62, "countByEnumeratingWithState:objects:count:", &v105, v128, 16);
    }
    while (v63);
  }

  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 304) = self->_nonRecommendedRoutesOption;
    *(_QWORD *)(v5 + 328) |= 0x40uLL;
  }
  v67 = -[NSData copyWithZone:](self->_nonRecommendedRoutesCache, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v67;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 296) = self->_lastEtaDisplayed;
    *(_QWORD *)(v5 + 328) |= 0x10uLL;
  }
  v69 = -[GEORecentLocationHistory copyWithZone:](self->_recentLocationHistory, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v69;

  v71 = -[GEOPrivacyMetadata copyWithZone:](self->_privacyMetadata, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v71;

  v73 = -[GEOTripInfo copyWithZone:](self->_tripInfo, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v73;

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v75 = self->_serviceTags;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v101, v127, 16);
  if (v76)
  {
    v77 = *(_QWORD *)v102;
    do
    {
      for (ii = 0; ii != v76; ++ii)
      {
        if (*(_QWORD *)v102 != v77)
          objc_enumerationMutation(v75);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v101 + 1) + 8 * ii), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addServiceTag:", v79);

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v101, v127, 16);
    }
    while (v76);
  }

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v80 = self->_trafficApiResponses;
  v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
  if (v81)
  {
    v82 = *(_QWORD *)v98;
    do
    {
      for (jj = 0; jj != v81; ++jj)
      {
        if (*(_QWORD *)v98 != v82)
          objc_enumerationMutation(v80);
        v84 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * jj), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addTrafficApiResponses:", v84);

      }
      v81 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v80, "countByEnumeratingWithState:objects:count:", &v97, v126, 16);
    }
    while (v81);
  }

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v85 = self->_trafficSnapshotIds;
  v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
  if (v86)
  {
    v87 = *(_QWORD *)v94;
    do
    {
      for (kk = 0; kk != v86; ++kk)
      {
        if (*(_QWORD *)v94 != v87)
          objc_enumerationMutation(v85);
        v89 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * kk), "copyWithZone:", a3, (_QWORD)v93);
        objc_msgSend((id)v5, "addTrafficSnapshotIds:", v89);

      }
      v86 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v85, "countByEnumeratingWithState:objects:count:", &v93, v125, 16);
    }
    while (v86);
  }

  v90 = self->_flags;
  if ((*(_WORD *)&v90 & 0x400) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_trafficSnapshotUnixTime;
    *(_QWORD *)(v5 + 328) |= 0x400uLL;
    v90 = self->_flags;
  }
  if ((*(_BYTE *)&v90 & 2) != 0)
  {
    *(double *)(v5 + 208) = self->_requestTime;
    *(_QWORD *)(v5 + 328) |= 2uLL;
  }
  v91 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v91;
LABEL_85:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORouteAttributes *routeAttributes;
  NSMutableArray *waypointTypeds;
  NSMutableArray *displayedBannerIds;
  GEOClientFeedbackInfo *clientFeedbackInfo;
  uint64_t v9;
  GEOLocation *currentUserLocation;
  GEOMapRegion *currentMapRegion;
  NSData *originalRouteID;
  NSMutableArray *originalRouteZilchPoints;
  NSData *originalDirectionsResponseID;
  NSMutableArray *originalRouteEvInfos;
  GEOOriginalRoute *originalRoute;
  GEOOriginalWaypointRoute *originalWaypointRoute;
  $1FEE565F87D5293053496F1336AD4F5E flags;
  uint64_t v19;
  GEOClientCapabilities *clientCapabilities;
  GEODirectionsRequestFeedback *feedback;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  $1FEE565F87D5293053496F1336AD4F5E v24;
  uint64_t v25;
  NSData *sessionState;
  GEOCommonOptions *commonOptions;
  NSString *loggedAbExperiment;
  GEOLocation *lastKnownRoadLocation;
  uint64_t v30;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  NSMutableArray *deviceHistoricalLocations;
  $1FEE565F87D5293053496F1336AD4F5E v33;
  uint64_t v34;
  NSData *nonRecommendedRoutesCache;
  GEORecentLocationHistory *recentLocationHistory;
  GEOPrivacyMetadata *privacyMetadata;
  GEOTripInfo *tripInfo;
  NSMutableArray *serviceTags;
  NSMutableArray *trafficApiResponses;
  NSMutableArray *trafficSnapshotIds;
  $1FEE565F87D5293053496F1336AD4F5E v42;
  uint64_t v43;
  BOOL v44;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_136;
  -[GEODirectionsRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeAttributes = self->_routeAttributes;
  if ((unint64_t)routeAttributes | *((_QWORD *)v4 + 27))
  {
    if (!-[GEORouteAttributes isEqual:](routeAttributes, "isEqual:"))
      goto LABEL_136;
  }
  waypointTypeds = self->_waypointTypeds;
  if ((unint64_t)waypointTypeds | *((_QWORD *)v4 + 34))
  {
    if (!-[NSMutableArray isEqual:](waypointTypeds, "isEqual:"))
      goto LABEL_136;
  }
  displayedBannerIds = self->_displayedBannerIds;
  if ((unint64_t)displayedBannerIds | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](displayedBannerIds, "isEqual:"))
      goto LABEL_136;
  }
  clientFeedbackInfo = self->_clientFeedbackInfo;
  if ((unint64_t)clientFeedbackInfo | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOClientFeedbackInfo isEqual:](clientFeedbackInfo, "isEqual:"))
      goto LABEL_136;
  }
  v9 = *((_QWORD *)v4 + 41);
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_mainTransportTypeMaxRouteCount != *((_DWORD *)v4 + 75))
      goto LABEL_136;
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_136;
  }
  currentUserLocation = self->_currentUserLocation;
  if ((unint64_t)currentUserLocation | *((_QWORD *)v4 + 11)
    && !-[GEOLocation isEqual:](currentUserLocation, "isEqual:"))
  {
    goto LABEL_136;
  }
  currentMapRegion = self->_currentMapRegion;
  if ((unint64_t)currentMapRegion | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOMapRegion isEqual:](currentMapRegion, "isEqual:"))
      goto LABEL_136;
  }
  originalRouteID = self->_originalRouteID;
  if ((unint64_t)originalRouteID | *((_QWORD *)v4 + 19))
  {
    if (!-[NSData isEqual:](originalRouteID, "isEqual:"))
      goto LABEL_136;
  }
  originalRouteZilchPoints = self->_originalRouteZilchPoints;
  if ((unint64_t)originalRouteZilchPoints | *((_QWORD *)v4 + 20))
  {
    if (!-[NSMutableArray isEqual:](originalRouteZilchPoints, "isEqual:"))
      goto LABEL_136;
  }
  originalDirectionsResponseID = self->_originalDirectionsResponseID;
  if ((unint64_t)originalDirectionsResponseID | *((_QWORD *)v4 + 18))
  {
    if (!-[NSData isEqual:](originalDirectionsResponseID, "isEqual:"))
      goto LABEL_136;
  }
  originalRouteEvInfos = self->_originalRouteEvInfos;
  if ((unint64_t)originalRouteEvInfos | *((_QWORD *)v4 + 22))
  {
    if (!-[NSMutableArray isEqual:](originalRouteEvInfos, "isEqual:"))
      goto LABEL_136;
  }
  originalRoute = self->_originalRoute;
  if ((unint64_t)originalRoute | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOOriginalRoute isEqual:](originalRoute, "isEqual:"))
      goto LABEL_136;
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  if ((unint64_t)originalWaypointRoute | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOOriginalWaypointRoute isEqual:](originalWaypointRoute, "isEqual:"))
      goto LABEL_136;
  }
  flags = self->_flags;
  v19 = *((_QWORD *)v4 + 41);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v19 & 0x200) == 0 || self->_timeSinceLastRerouteRequest != *((_DWORD *)v4 + 79))
      goto LABEL_136;
  }
  else if ((v19 & 0x200) != 0)
  {
    goto LABEL_136;
  }
  clientCapabilities = self->_clientCapabilities;
  if ((unint64_t)clientCapabilities | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOClientCapabilities isEqual:](clientCapabilities, "isEqual:"))
      goto LABEL_136;
    flags = self->_flags;
    v19 = *((_QWORD *)v4 + 41);
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v19 & 8) == 0 || self->_departureTime != *((_DWORD *)v4 + 73))
      goto LABEL_136;
  }
  else if ((v19 & 8) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v19 & 0x800) == 0)
      goto LABEL_136;
    if (self->_getRouteForZilchPoints)
    {
      if (!*((_BYTE *)v4 + 324))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 324))
    {
      goto LABEL_136;
    }
  }
  else if ((v19 & 0x800) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&flags & 1) != 0 && (v19 & 1) != 0)
  {
    if (self->_sessionID._high != *((_QWORD *)v4 + 3) || self->_sessionID._low != *((_QWORD *)v4 + 4))
      goto LABEL_136;
  }
  else if (((*(_DWORD *)&flags | v19) & 1) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v19 & 4) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 29))
      goto LABEL_136;
  }
  else if ((v19 & 4) != 0)
  {
    goto LABEL_136;
  }
  feedback = self->_feedback;
  if ((unint64_t)feedback | *((_QWORD *)v4 + 14)
    && !-[GEODirectionsRequestFeedback isEqual:](feedback, "isEqual:"))
  {
    goto LABEL_136;
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  if ((unint64_t)additionalEnabledMarkets | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](additionalEnabledMarkets, "isEqual:"))
      goto LABEL_136;
  }
  v24 = self->_flags;
  v25 = *((_QWORD *)v4 + 41);
  if ((*(_WORD *)&v24 & 0x100) != 0)
  {
    if ((v25 & 0x100) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 78))
      goto LABEL_136;
  }
  else if ((v25 & 0x100) != 0)
  {
    goto LABEL_136;
  }
  sessionState = self->_sessionState;
  if ((unint64_t)sessionState | *((_QWORD *)v4 + 30))
  {
    if (!-[NSData isEqual:](sessionState, "isEqual:"))
      goto LABEL_136;
    v24 = self->_flags;
    v25 = *((_QWORD *)v4 + 41);
  }
  if ((*(_WORD *)&v24 & 0x1000) != 0)
  {
    if ((v25 & 0x1000) == 0)
      goto LABEL_136;
    if (self->_isFromAPI)
    {
      if (!*((_BYTE *)v4 + 325))
        goto LABEL_136;
    }
    else if (*((_BYTE *)v4 + 325))
    {
      goto LABEL_136;
    }
  }
  else if ((v25 & 0x1000) != 0)
  {
    goto LABEL_136;
  }
  commonOptions = self->_commonOptions;
  if ((unint64_t)commonOptions | *((_QWORD *)v4 + 9) && !-[GEOCommonOptions isEqual:](commonOptions, "isEqual:"))
    goto LABEL_136;
  loggedAbExperiment = self->_loggedAbExperiment;
  if ((unint64_t)loggedAbExperiment | *((_QWORD *)v4 + 16))
  {
    if (!-[NSString isEqual:](loggedAbExperiment, "isEqual:"))
      goto LABEL_136;
  }
  lastKnownRoadLocation = self->_lastKnownRoadLocation;
  if ((unint64_t)lastKnownRoadLocation | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOLocation isEqual:](lastKnownRoadLocation, "isEqual:"))
      goto LABEL_136;
  }
  v30 = *((_QWORD *)v4 + 41);
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    if ((v30 & 0x80) == 0 || self->_originalRoutePurpose != *((_DWORD *)v4 + 77))
      goto LABEL_136;
  }
  else if ((v30 & 0x80) != 0)
  {
    goto LABEL_136;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((_QWORD *)v4 + 5)
    && !-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:"))
  {
    goto LABEL_136;
  }
  deviceHistoricalLocations = self->_deviceHistoricalLocations;
  if ((unint64_t)deviceHistoricalLocations | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](deviceHistoricalLocations, "isEqual:"))
      goto LABEL_136;
  }
  v33 = self->_flags;
  v34 = *((_QWORD *)v4 + 41);
  if ((*(_BYTE *)&v33 & 0x40) != 0)
  {
    if ((v34 & 0x40) == 0 || self->_nonRecommendedRoutesOption != *((_DWORD *)v4 + 76))
      goto LABEL_136;
  }
  else if ((v34 & 0x40) != 0)
  {
    goto LABEL_136;
  }
  nonRecommendedRoutesCache = self->_nonRecommendedRoutesCache;
  if ((unint64_t)nonRecommendedRoutesCache | *((_QWORD *)v4 + 17))
  {
    if (-[NSData isEqual:](nonRecommendedRoutesCache, "isEqual:"))
    {
      v33 = self->_flags;
      v34 = *((_QWORD *)v4 + 41);
      goto LABEL_109;
    }
LABEL_136:
    v44 = 0;
    goto LABEL_137;
  }
LABEL_109:
  if ((*(_BYTE *)&v33 & 0x10) != 0)
  {
    if ((v34 & 0x10) == 0 || self->_lastEtaDisplayed != *((_DWORD *)v4 + 74))
      goto LABEL_136;
  }
  else if ((v34 & 0x10) != 0)
  {
    goto LABEL_136;
  }
  recentLocationHistory = self->_recentLocationHistory;
  if ((unint64_t)recentLocationHistory | *((_QWORD *)v4 + 25)
    && !-[GEORecentLocationHistory isEqual:](recentLocationHistory, "isEqual:"))
  {
    goto LABEL_136;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:"))
      goto LABEL_136;
  }
  tripInfo = self->_tripInfo;
  if ((unint64_t)tripInfo | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOTripInfo isEqual:](tripInfo, "isEqual:"))
      goto LABEL_136;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((_QWORD *)v4 + 28))
  {
    if (!-[NSMutableArray isEqual:](serviceTags, "isEqual:"))
      goto LABEL_136;
  }
  trafficApiResponses = self->_trafficApiResponses;
  if ((unint64_t)trafficApiResponses | *((_QWORD *)v4 + 31))
  {
    if (!-[NSMutableArray isEqual:](trafficApiResponses, "isEqual:"))
      goto LABEL_136;
  }
  trafficSnapshotIds = self->_trafficSnapshotIds;
  if ((unint64_t)trafficSnapshotIds | *((_QWORD *)v4 + 32))
  {
    if (!-[NSMutableArray isEqual:](trafficSnapshotIds, "isEqual:"))
      goto LABEL_136;
  }
  v42 = self->_flags;
  v43 = *((_QWORD *)v4 + 41);
  if ((*(_WORD *)&v42 & 0x400) != 0)
  {
    if ((v43 & 0x400) == 0 || self->_trafficSnapshotUnixTime != *((_DWORD *)v4 + 80))
      goto LABEL_136;
  }
  else if ((v43 & 0x400) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_BYTE *)&v42 & 2) != 0)
  {
    if ((v43 & 2) == 0 || self->_requestTime != *((double *)v4 + 26))
      goto LABEL_136;
    v44 = 1;
  }
  else
  {
    v44 = (*((_QWORD *)v4 + 41) & 2) == 0;
  }
LABEL_137:

  return v44;
}

- (unint64_t)hash
{
  $1FEE565F87D5293053496F1336AD4F5E flags;
  double sessionRelativeTimestamp;
  double v5;
  long double v6;
  double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  $1FEE565F87D5293053496F1336AD4F5E v19;
  uint64_t v20;
  double requestTime;
  double v22;
  long double v23;
  double v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSUInteger v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;

  -[GEODirectionsRequest readAll:](self, "readAll:", 1);
  v58 = -[GEORouteAttributes hash](self->_routeAttributes, "hash");
  v57 = -[NSMutableArray hash](self->_waypointTypeds, "hash");
  v56 = -[NSMutableArray hash](self->_displayedBannerIds, "hash");
  v55 = -[GEOClientFeedbackInfo hash](self->_clientFeedbackInfo, "hash");
  if ((*(_BYTE *)&self->_flags & 0x20) != 0)
    v54 = 2654435761 * self->_mainTransportTypeMaxRouteCount;
  else
    v54 = 0;
  v53 = -[GEOLocation hash](self->_currentUserLocation, "hash");
  v52 = -[GEOMapRegion hash](self->_currentMapRegion, "hash");
  v51 = -[NSData hash](self->_originalRouteID, "hash");
  v50 = -[NSMutableArray hash](self->_originalRouteZilchPoints, "hash");
  v49 = -[NSData hash](self->_originalDirectionsResponseID, "hash");
  v48 = -[NSMutableArray hash](self->_originalRouteEvInfos, "hash");
  v47 = -[GEOOriginalRoute hash](self->_originalRoute, "hash");
  v46 = -[GEOOriginalWaypointRoute hash](self->_originalWaypointRoute, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 2) != 0)
    v45 = 2654435761 * self->_timeSinceLastRerouteRequest;
  else
    v45 = 0;
  v44 = -[GEOClientCapabilities hash](self->_clientCapabilities, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    v43 = 2654435761 * self->_departureTime;
    if ((*(_WORD *)&flags & 0x800) != 0)
    {
LABEL_9:
      v42 = 2654435761 * self->_getRouteForZilchPoints;
      if ((*(_BYTE *)&flags & 1) != 0)
        goto LABEL_10;
LABEL_20:
      v41 = 0;
      if ((*(_BYTE *)&flags & 4) != 0)
        goto LABEL_11;
LABEL_21:
      v40 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v43 = 0;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_9;
  }
  v42 = 0;
  if ((*(_BYTE *)&flags & 1) == 0)
    goto LABEL_20;
LABEL_10:
  v41 = PBHashBytes();
  if ((*(_QWORD *)&self->_flags & 4) == 0)
    goto LABEL_21;
LABEL_11:
  sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
  v5 = -sessionRelativeTimestamp;
  if (sessionRelativeTimestamp >= 0.0)
    v5 = self->_sessionRelativeTimestamp;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = fmod(v6, 1.84467441e19);
  v9 = 2654435761u * (unint64_t)v8;
  v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0)
    v10 = 2654435761u * (unint64_t)v8;
  v11 = v9 - (unint64_t)fabs(v7);
  if (v7 >= 0.0)
    v11 = v10;
  v40 = v11;
LABEL_22:
  v39 = -[GEODirectionsRequestFeedback hash](self->_feedback, "hash");
  v38 = -[GEOAdditionalEnabledMarkets hash](self->_additionalEnabledMarkets, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 1) != 0)
    v37 = 2654435761 * self->_sequenceNumber;
  else
    v37 = 0;
  v36 = -[NSData hash](self->_sessionState, "hash");
  if ((*((_BYTE *)&self->_flags + 1) & 0x10) != 0)
    v35 = 2654435761 * self->_isFromAPI;
  else
    v35 = 0;
  v34 = -[GEOCommonOptions hash](self->_commonOptions, "hash");
  v33 = -[NSString hash](self->_loggedAbExperiment, "hash");
  v32 = -[GEOLocation hash](self->_lastKnownRoadLocation, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v31 = 2654435761 * self->_originalRoutePurpose;
  else
    v31 = 0;
  v30 = -[GEOPDABClientDatasetMetadata hash](self->_abClientMetadata, "hash");
  v29 = -[NSMutableArray hash](self->_deviceHistoricalLocations, "hash");
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v28 = 2654435761 * self->_nonRecommendedRoutesOption;
  else
    v28 = 0;
  v27 = -[NSData hash](self->_nonRecommendedRoutesCache, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v12 = 2654435761 * self->_lastEtaDisplayed;
  else
    v12 = 0;
  v13 = -[GEORecentLocationHistory hash](self->_recentLocationHistory, "hash");
  v14 = -[GEOPrivacyMetadata hash](self->_privacyMetadata, "hash");
  v15 = -[GEOTripInfo hash](self->_tripInfo, "hash");
  v16 = -[NSMutableArray hash](self->_serviceTags, "hash");
  v17 = -[NSMutableArray hash](self->_trafficApiResponses, "hash");
  v18 = -[NSMutableArray hash](self->_trafficSnapshotIds, "hash");
  v19 = self->_flags;
  if ((*(_WORD *)&v19 & 0x400) != 0)
  {
    v20 = 2654435761 * self->_trafficSnapshotUnixTime;
    if ((*(_BYTE *)&v19 & 2) != 0)
      goto LABEL_39;
LABEL_44:
    v25 = 0;
    return v57 ^ v58 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25;
  }
  v20 = 0;
  if ((*(_BYTE *)&v19 & 2) == 0)
    goto LABEL_44;
LABEL_39:
  requestTime = self->_requestTime;
  v22 = -requestTime;
  if (requestTime >= 0.0)
    v22 = self->_requestTime;
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
  return v57 ^ v58 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v20 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  GEORouteAttributes *routeAttributes;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  GEOClientFeedbackInfo *clientFeedbackInfo;
  uint64_t v18;
  GEOLocation *currentUserLocation;
  uint64_t v20;
  GEOMapRegion *currentMapRegion;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  GEOOriginalRoute *originalRoute;
  uint64_t v34;
  GEOOriginalWaypointRoute *originalWaypointRoute;
  uint64_t v36;
  GEOClientCapabilities *clientCapabilities;
  uint64_t v38;
  uint64_t v39;
  GEODirectionsRequestFeedback *feedback;
  uint64_t v41;
  GEOAdditionalEnabledMarkets *additionalEnabledMarkets;
  uint64_t v43;
  GEOCommonOptions *commonOptions;
  uint64_t v45;
  GEOLocation *lastKnownRoadLocation;
  uint64_t v47;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  GEORecentLocationHistory *recentLocationHistory;
  uint64_t v56;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v58;
  GEOTripInfo *tripInfo;
  uint64_t v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t ii;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t jj;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t kk;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
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
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  routeAttributes = self->_routeAttributes;
  v6 = *((_QWORD *)v4 + 27);
  if (routeAttributes)
  {
    if (v6)
      -[GEORouteAttributes mergeFrom:](routeAttributes, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEODirectionsRequest setRouteAttributes:](self, "setRouteAttributes:");
  }
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v7 = *((id *)v4 + 34);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v106 != v10)
          objc_enumerationMutation(v7);
        -[GEODirectionsRequest addWaypointTyped:](self, "addWaypointTyped:", *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v105, v116, 16);
    }
    while (v9);
  }

  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v12 = *((id *)v4 + 13);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v102 != v15)
          objc_enumerationMutation(v12);
        -[GEODirectionsRequest addDisplayedBannerId:](self, "addDisplayedBannerId:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
    }
    while (v14);
  }

  clientFeedbackInfo = self->_clientFeedbackInfo;
  v18 = *((_QWORD *)v4 + 8);
  if (clientFeedbackInfo)
  {
    if (v18)
      -[GEOClientFeedbackInfo mergeFrom:](clientFeedbackInfo, "mergeFrom:");
  }
  else if (v18)
  {
    -[GEODirectionsRequest setClientFeedbackInfo:](self, "setClientFeedbackInfo:");
  }
  if ((v4[328] & 0x20) != 0)
  {
    self->_mainTransportTypeMaxRouteCount = *((_DWORD *)v4 + 75);
    *(_QWORD *)&self->_flags |= 0x20uLL;
  }
  currentUserLocation = self->_currentUserLocation;
  v20 = *((_QWORD *)v4 + 11);
  if (currentUserLocation)
  {
    if (v20)
      -[GEOLocation mergeFrom:](currentUserLocation, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEODirectionsRequest setCurrentUserLocation:](self, "setCurrentUserLocation:");
  }
  currentMapRegion = self->_currentMapRegion;
  v22 = *((_QWORD *)v4 + 10);
  if (currentMapRegion)
  {
    if (v22)
      -[GEOMapRegion mergeFrom:](currentMapRegion, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEODirectionsRequest setCurrentMapRegion:](self, "setCurrentMapRegion:");
  }
  if (*((_QWORD *)v4 + 19))
    -[GEODirectionsRequest setOriginalRouteID:](self, "setOriginalRouteID:");
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v23 = *((id *)v4 + 20);
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v98;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v98 != v26)
          objc_enumerationMutation(v23);
        -[GEODirectionsRequest addOriginalRouteZilchPoints:](self, "addOriginalRouteZilchPoints:", *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * k));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    }
    while (v25);
  }

  if (*((_QWORD *)v4 + 18))
    -[GEODirectionsRequest setOriginalDirectionsResponseID:](self, "setOriginalDirectionsResponseID:");
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v28 = *((id *)v4 + 22);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v94;
    do
    {
      for (m = 0; m != v30; ++m)
      {
        if (*(_QWORD *)v94 != v31)
          objc_enumerationMutation(v28);
        -[GEODirectionsRequest addOriginalRouteEvInfo:](self, "addOriginalRouteEvInfo:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * m));
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v93, v113, 16);
    }
    while (v30);
  }

  originalRoute = self->_originalRoute;
  v34 = *((_QWORD *)v4 + 21);
  if (originalRoute)
  {
    if (v34)
      -[GEOOriginalRoute mergeFrom:](originalRoute, "mergeFrom:");
  }
  else if (v34)
  {
    -[GEODirectionsRequest setOriginalRoute:](self, "setOriginalRoute:");
  }
  originalWaypointRoute = self->_originalWaypointRoute;
  v36 = *((_QWORD *)v4 + 23);
  if (originalWaypointRoute)
  {
    if (v36)
      -[GEOOriginalWaypointRoute mergeFrom:](originalWaypointRoute, "mergeFrom:");
  }
  else if (v36)
  {
    -[GEODirectionsRequest setOriginalWaypointRoute:](self, "setOriginalWaypointRoute:");
  }
  if ((v4[329] & 2) != 0)
  {
    self->_timeSinceLastRerouteRequest = *((_DWORD *)v4 + 79);
    *(_QWORD *)&self->_flags |= 0x200uLL;
  }
  clientCapabilities = self->_clientCapabilities;
  v38 = *((_QWORD *)v4 + 7);
  if (clientCapabilities)
  {
    if (v38)
      -[GEOClientCapabilities mergeFrom:](clientCapabilities, "mergeFrom:");
  }
  else if (v38)
  {
    -[GEODirectionsRequest setClientCapabilities:](self, "setClientCapabilities:");
  }
  v39 = *((_QWORD *)v4 + 41);
  if ((v39 & 8) != 0)
  {
    self->_departureTime = *((_DWORD *)v4 + 73);
    *(_QWORD *)&self->_flags |= 8uLL;
    v39 = *((_QWORD *)v4 + 41);
    if ((v39 & 0x800) == 0)
    {
LABEL_74:
      if ((v39 & 1) == 0)
        goto LABEL_75;
      goto LABEL_82;
    }
  }
  else if ((v39 & 0x800) == 0)
  {
    goto LABEL_74;
  }
  self->_getRouteForZilchPoints = v4[324];
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v39 = *((_QWORD *)v4 + 41);
  if ((v39 & 1) == 0)
  {
LABEL_75:
    if ((v39 & 4) == 0)
      goto LABEL_77;
    goto LABEL_76;
  }
LABEL_82:
  self->_sessionID = *(GEOSessionID *)(v4 + 24);
  *(_QWORD *)&self->_flags |= 1uLL;
  if ((*((_QWORD *)v4 + 41) & 4) != 0)
  {
LABEL_76:
    self->_sessionRelativeTimestamp = *((double *)v4 + 29);
    *(_QWORD *)&self->_flags |= 4uLL;
  }
LABEL_77:
  feedback = self->_feedback;
  v41 = *((_QWORD *)v4 + 14);
  if (feedback)
  {
    if (v41)
      -[GEODirectionsRequestFeedback mergeFrom:](feedback, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEODirectionsRequest setFeedback:](self, "setFeedback:");
  }
  additionalEnabledMarkets = self->_additionalEnabledMarkets;
  v43 = *((_QWORD *)v4 + 6);
  if (additionalEnabledMarkets)
  {
    if (v43)
      -[GEOAdditionalEnabledMarkets mergeFrom:](additionalEnabledMarkets, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEODirectionsRequest setAdditionalEnabledMarkets:](self, "setAdditionalEnabledMarkets:");
  }
  if ((v4[329] & 1) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 78);
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 30))
    -[GEODirectionsRequest setSessionState:](self, "setSessionState:");
  if ((v4[329] & 0x10) != 0)
  {
    self->_isFromAPI = v4[325];
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
  commonOptions = self->_commonOptions;
  v45 = *((_QWORD *)v4 + 9);
  if (commonOptions)
  {
    if (v45)
      -[GEOCommonOptions mergeFrom:](commonOptions, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEODirectionsRequest setCommonOptions:](self, "setCommonOptions:");
  }
  if (*((_QWORD *)v4 + 16))
    -[GEODirectionsRequest setLoggedAbExperiment:](self, "setLoggedAbExperiment:");
  lastKnownRoadLocation = self->_lastKnownRoadLocation;
  v47 = *((_QWORD *)v4 + 15);
  if (lastKnownRoadLocation)
  {
    if (v47)
      -[GEOLocation mergeFrom:](lastKnownRoadLocation, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEODirectionsRequest setLastKnownRoadLocation:](self, "setLastKnownRoadLocation:");
  }
  if (v4[328] < 0)
  {
    self->_originalRoutePurpose = *((_DWORD *)v4 + 77);
    *(_QWORD *)&self->_flags |= 0x80uLL;
  }
  abClientMetadata = self->_abClientMetadata;
  v49 = *((_QWORD *)v4 + 5);
  if (abClientMetadata)
  {
    if (v49)
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
  }
  else if (v49)
  {
    -[GEODirectionsRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v50 = *((id *)v4 + 12);
  v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v89, v112, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v90;
    do
    {
      for (n = 0; n != v52; ++n)
      {
        if (*(_QWORD *)v90 != v53)
          objc_enumerationMutation(v50);
        -[GEODirectionsRequest addDeviceHistoricalLocation:](self, "addDeviceHistoricalLocation:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * n));
      }
      v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v89, v112, 16);
    }
    while (v52);
  }

  if ((v4[328] & 0x40) != 0)
  {
    self->_nonRecommendedRoutesOption = *((_DWORD *)v4 + 76);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  if (*((_QWORD *)v4 + 17))
    -[GEODirectionsRequest setNonRecommendedRoutesCache:](self, "setNonRecommendedRoutesCache:");
  if ((v4[328] & 0x10) != 0)
  {
    self->_lastEtaDisplayed = *((_DWORD *)v4 + 74);
    *(_QWORD *)&self->_flags |= 0x10uLL;
  }
  recentLocationHistory = self->_recentLocationHistory;
  v56 = *((_QWORD *)v4 + 25);
  if (recentLocationHistory)
  {
    if (v56)
      -[GEORecentLocationHistory mergeFrom:](recentLocationHistory, "mergeFrom:");
  }
  else if (v56)
  {
    -[GEODirectionsRequest setRecentLocationHistory:](self, "setRecentLocationHistory:");
  }
  privacyMetadata = self->_privacyMetadata;
  v58 = *((_QWORD *)v4 + 24);
  if (privacyMetadata)
  {
    if (v58)
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
  }
  else if (v58)
  {
    -[GEODirectionsRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  tripInfo = self->_tripInfo;
  v60 = *((_QWORD *)v4 + 33);
  if (tripInfo)
  {
    if (v60)
      -[GEOTripInfo mergeFrom:](tripInfo, "mergeFrom:");
  }
  else if (v60)
  {
    -[GEODirectionsRequest setTripInfo:](self, "setTripInfo:");
  }
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v61 = *((id *)v4 + 28);
  v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
  if (v62)
  {
    v63 = v62;
    v64 = *(_QWORD *)v86;
    do
    {
      for (ii = 0; ii != v63; ++ii)
      {
        if (*(_QWORD *)v86 != v64)
          objc_enumerationMutation(v61);
        -[GEODirectionsRequest addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * ii));
      }
      v63 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v85, v111, 16);
    }
    while (v63);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v66 = *((id *)v4 + 31);
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v81, v110, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v82;
    do
    {
      for (jj = 0; jj != v68; ++jj)
      {
        if (*(_QWORD *)v82 != v69)
          objc_enumerationMutation(v66);
        -[GEODirectionsRequest addTrafficApiResponses:](self, "addTrafficApiResponses:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * jj));
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v81, v110, 16);
    }
    while (v68);
  }

  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v71 = *((id *)v4 + 32);
  v72 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v77, v109, 16);
  if (v72)
  {
    v73 = v72;
    v74 = *(_QWORD *)v78;
    do
    {
      for (kk = 0; kk != v73; ++kk)
      {
        if (*(_QWORD *)v78 != v74)
          objc_enumerationMutation(v71);
        -[GEODirectionsRequest addTrafficSnapshotIds:](self, "addTrafficSnapshotIds:", *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * kk), (_QWORD)v77);
      }
      v73 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v77, v109, 16);
    }
    while (v73);
  }

  v76 = *((_QWORD *)v4 + 41);
  if ((v76 & 0x400) != 0)
  {
    self->_trafficSnapshotUnixTime = *((_DWORD *)v4 + 80);
    *(_QWORD *)&self->_flags |= 0x400uLL;
    v76 = *((_QWORD *)v4 + 41);
  }
  if ((v76 & 2) != 0)
  {
    self->_requestTime = *((double *)v4 + 26);
    *(_QWORD *)&self->_flags |= 2uLL;
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
      GEODirectionsRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_16);
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
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x40000002000uLL;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEODirectionsRequest readAll:](self, "readAll:", 0);
    -[GEORouteAttributes clearUnknownFields:](self->_routeAttributes, "clearUnknownFields:", 1);
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v7 = self->_waypointTypeds;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v40;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v40 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
      }
      while (v9);
    }

    -[GEOClientFeedbackInfo clearUnknownFields:](self->_clientFeedbackInfo, "clearUnknownFields:", 1);
    -[GEOLocation clearUnknownFields:](self->_currentUserLocation, "clearUnknownFields:", 1);
    -[GEOMapRegion clearUnknownFields:](self->_currentMapRegion, "clearUnknownFields:", 1);
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v12 = self->_originalRouteEvInfos;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v14);
    }

    -[GEOOriginalRoute clearUnknownFields:](self->_originalRoute, "clearUnknownFields:", 1);
    -[GEOOriginalWaypointRoute clearUnknownFields:](self->_originalWaypointRoute, "clearUnknownFields:", 1);
    -[GEOClientCapabilities clearUnknownFields:](self->_clientCapabilities, "clearUnknownFields:", 1);
    -[GEODirectionsRequestFeedback clearUnknownFields:](self->_feedback, "clearUnknownFields:", 1);
    -[GEOAdditionalEnabledMarkets clearUnknownFields:](self->_additionalEnabledMarkets, "clearUnknownFields:", 1);
    -[GEOCommonOptions clearUnknownFields:](self->_commonOptions, "clearUnknownFields:", 1);
    -[GEOLocation clearUnknownFields:](self->_lastKnownRoadLocation, "clearUnknownFields:", 1);
    -[GEOPDABClientDatasetMetadata clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1);
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = self->_deviceHistoricalLocations;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v21++), "clearUnknownFields:", 1);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v31, v44, 16);
      }
      while (v19);
    }

    -[GEORecentLocationHistory clearUnknownFields:](self->_recentLocationHistory, "clearUnknownFields:", 1);
    -[GEOPrivacyMetadata clearUnknownFields:](self->_privacyMetadata, "clearUnknownFields:", 1);
    -[GEOTripInfo clearUnknownFields:](self->_tripInfo, "clearUnknownFields:", 1);
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v22 = self->_serviceTags;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v28;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v28 != v25)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v26++), "clearUnknownFields:", 1, (_QWORD)v27);
        }
        while (v24 != v26);
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v27, v43, 16);
      }
      while (v24);
    }

  }
}

- (double)requestTime
{
  return self->_requestTime;
}

- (void)setRequestTime:(double)a3
{
  *(_QWORD *)&self->_flags |= 0x40000000002uLL;
  self->_requestTime = a3;
}

- (void)setHasRequestTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (a3)
    v3 = 0x40000000002;
  self->_flags = ($1FEE565F87D5293053496F1336AD4F5E)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasRequestTime
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointTypeds, 0);
  objc_storeStrong((id *)&self->_tripInfo, 0);
  objc_storeStrong((id *)&self->_trafficSnapshotIds, 0);
  objc_storeStrong((id *)&self->_trafficApiResponses, 0);
  objc_storeStrong((id *)&self->_sessionState, 0);
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_routeAttributes, 0);
  objc_storeStrong((id *)&self->_recentLocationHistory, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_originalWaypointRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteEvInfos, 0);
  objc_storeStrong((id *)&self->_originalRoute, 0);
  objc_storeStrong((id *)&self->_originalRouteZilchPoints, 0);
  objc_storeStrong((id *)&self->_originalRouteID, 0);
  objc_storeStrong((id *)&self->_originalDirectionsResponseID, 0);
  objc_storeStrong((id *)&self->_nonRecommendedRoutesCache, 0);
  objc_storeStrong((id *)&self->_loggedAbExperiment, 0);
  objc_storeStrong((id *)&self->_lastKnownRoadLocation, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong((id *)&self->_displayedBannerIds, 0);
  objc_storeStrong((id *)&self->_deviceHistoricalLocations, 0);
  objc_storeStrong((id *)&self->_currentUserLocation, 0);
  objc_storeStrong((id *)&self->_currentMapRegion, 0);
  objc_storeStrong((id *)&self->_commonOptions, 0);
  objc_storeStrong((id *)&self->_clientFeedbackInfo, 0);
  objc_storeStrong((id *)&self->_clientCapabilities, 0);
  objc_storeStrong((id *)&self->_additionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)clearSessionId
{
  if (-[GEODirectionsRequest hasSessionID](self, "hasSessionID"))
  {
    -[GEODirectionsRequest setSessionID:](self, "setSessionID:", 0, 0);
    -[GEODirectionsRequest setHasSessionID:](self, "setHasSessionID:", 0);
  }
}

- (void)clearLocations
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsRequest setDeviceHistoricalLocations:](self, "setDeviceHistoricalLocations:", 0);
  -[GEODirectionsRequest setCurrentUserLocation:](self, "setCurrentUserLocation:", 0);
  -[GEODirectionsRequest setDeviceHistoricalLocations:](self, "setDeviceHistoricalLocations:", 0);
  -[GEODirectionsRequest waypointTypeds](self, "waypointTypeds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[GEODirectionsRequest waypointTypeds](self, "waypointTypeds", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "copy");
          objc_msgSend(v11, "clearLocations");
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

    -[GEODirectionsRequest setWaypointTypeds:](self, "setWaypointTypeds:", v5);
  }
}

@end
