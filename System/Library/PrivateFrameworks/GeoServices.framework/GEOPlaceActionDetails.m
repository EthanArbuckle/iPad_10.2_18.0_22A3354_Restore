@implementation GEOPlaceActionDetails

- (GEOPlaceActionDetails)initWithMapItem:(id)a3 relativeTimestamp:(double)a4 resultIndex:(int)a5
{
  return -[GEOPlaceActionDetails initWithMapItem:relativeTimestamp:resultIndex:targetID:](self, "initWithMapItem:relativeTimestamp:resultIndex:targetID:", a3, *(_QWORD *)&a5, 0, a4);
}

- (GEOPlaceActionDetails)initWithMapItem:(id)a3 relativeTimestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6
{
  return -[GEOPlaceActionDetails initWithMapItem:childPlace:relativeTimestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:](self, "initWithMapItem:childPlace:relativeTimestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", a3, 0, *(_QWORD *)&a5, a6, 0, 0, a4, 0, 0);
}

- (GEOPlaceActionDetails)initWithMapItem:(id)a3 childPlace:(id)a4 relativeTimestamp:(double)a5 resultIndex:(int)a6 targetID:(unint64_t)a7 transitCardCategory:(int)a8 transitSystem:(id)a9 transitDepartureSequence:(id)a10 transitIncident:(id)a11
{
  uint64_t v12;
  uint64_t v14;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  GEOPlaceActionDetails *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  GEOPlaceActionDetails *v36;
  objc_super v38;

  v12 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a6;
  v18 = a3;
  v19 = a4;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v38.receiver = self;
  v38.super_class = (Class)GEOPlaceActionDetails;
  v23 = -[GEOPlaceActionDetails init](&v38, sel_init);
  if (v23)
  {
    if (objc_msgSend(v18, "_hasMUID"))
    {
      -[GEOPlaceActionDetails setPlaceID:](v23, "setPlaceID:", objc_msgSend(v18, "_muid"));
      -[GEOPlaceActionDetails setBusinessID:](v23, "setBusinessID:", objc_msgSend(v18, "_muid"));
    }
    if (v19)
    {
      objc_msgSend(v19, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOPlaceActionDetails setBusinessID:](v23, "setBusinessID:", objc_msgSend(v24, "muid"));

    }
    objc_msgSend(v18, "_vendorID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceActionDetails setRichProviderId:](v23, "setRichProviderId:", v25);

    v26 = objc_msgSend(v18, "_resultProviderID");
    if ((_DWORD)v26)
      -[GEOPlaceActionDetails setLocalSearchProviderID:](v23, "setLocalSearchProviderID:", v26);
    if (a5 > 0.0)
      -[GEOPlaceActionDetails setSearchResponseRelativeTimestamp:](v23, "setSearchResponseRelativeTimestamp:", a5);
    if ((v14 & 0x80000000) == 0)
      -[GEOPlaceActionDetails setResultIndex:](v23, "setResultIndex:", v14);
    if (a7)
      -[GEOPlaceActionDetails setTargetID:](v23, "setTargetID:", a7);
    if ((_DWORD)v12 || v20)
    {
      v27 = (void *)objc_opt_new();
      objc_msgSend(v27, "setTransitCategory:", v12);
      if (v20)
      {
        objc_msgSend(v20, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setTransitSystemName:", v28);

        if (v21)
        {
          v29 = (void *)objc_opt_new();
          objc_msgSend(v21, "headsign");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = (void *)objc_msgSend(v30, "copy");
          objc_msgSend(v29, "setHeadsign:", v31);

          objc_msgSend(v21, "direction");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v32, "copy");
          objc_msgSend(v29, "setDirection:", v33);

          objc_msgSend(v21, "line");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "setLineId:", objc_msgSend(v34, "muid"));

          objc_msgSend(v27, "setTransitDepartureSequenceUsage:", v29);
        }
        if (v22)
        {
          objc_msgSend(v22, "title");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setIncidentType:", v35);

        }
      }
      -[GEOPlaceActionDetails setTransitPlaceCard:](v23, "setTransitPlaceCard:", v27);

    }
    v36 = v23;
  }

  return v23;
}

+ (GEOPlaceActionDetails)actionDetailsWithTargetID:(unint64_t)a3
{
  return (GEOPlaceActionDetails *)objc_msgSend(a1, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:", 0, 0xFFFFFFFFLL, a3, 0.0);
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  return (GEOPlaceActionDetails *)objc_msgSend(a1, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:", a3, *(_QWORD *)&a5, 0, a4);
}

+ (GEOPlaceActionDetails)actionDetailsWithChildPlace:(id)a3 timestamp:(double)a4 resultIndex:(int)a5
{
  return (GEOPlaceActionDetails *)objc_msgSend(a1, "actionDetailsWithMapItem:childPlace:timestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", 0, a3, *(_QWORD *)&a5, 0, 0, 0, a4, 0, 0);
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6
{
  return (GEOPlaceActionDetails *)objc_msgSend(a1, "actionDetailsWithMapItem:timestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", a3, *(_QWORD *)&a5, a6, 0, 0, 0, a4, 0);
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 timestamp:(double)a4 resultIndex:(int)a5 targetID:(unint64_t)a6 transitCardCategory:(int)a7 transitSystem:(id)a8 transitDepartureSequence:(id)a9 transitIncident:(id)a10
{
  return (GEOPlaceActionDetails *)objc_msgSend(a1, "actionDetailsWithMapItem:childPlace:timestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", a3, 0, *(_QWORD *)&a5, a6, *(_QWORD *)&a7, a8, a4, a9, a10);
}

+ (GEOPlaceActionDetails)actionDetailsWithMapItem:(id)a3 childPlace:(id)a4 timestamp:(double)a5 resultIndex:(int)a6 targetID:(unint64_t)a7 transitCardCategory:(int)a8 transitSystem:(id)a9 transitDepartureSequence:(id)a10 transitIncident:(id)a11
{
  uint64_t v12;
  uint64_t v14;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;
  GEOPlaceActionDetails *v23;

  v12 = *(_QWORD *)&a8;
  v14 = *(_QWORD *)&a6;
  v17 = a3;
  v18 = a4;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if ((v17 || v18 || a5 != 0.0 || (v14 & 0x80000000) == 0 || a7)
    && ((v22 = 0.0, a5 <= 0.0)
     || (v22 = CFAbsoluteTimeGetCurrent() - a5,
         (double)GEOConfigGetInteger(GeoServicesConfig_MaximumSearchLifetimeInMinutes, (uint64_t)off_1EDF4CDA8) * 60.0 >= v22)))
  {
    v23 = -[GEOPlaceActionDetails initWithMapItem:childPlace:relativeTimestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:]([GEOPlaceActionDetails alloc], "initWithMapItem:childPlace:relativeTimestamp:resultIndex:targetID:transitCardCategory:transitSystem:transitDepartureSequence:transitIncident:", v17, v18, v14, a7, v12, v19, v22, v20, v21);
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (GEOPlaceActionDetails)actionDetailsWithDetails:(id)a3 timestamp:(double)a4
{
  id v5;
  double v6;
  void *v7;

  v5 = a3;
  v6 = 0.0;
  if (a4 <= 0.0
    || (v6 = CFAbsoluteTimeGetCurrent() - a4,
        (double)GEOConfigGetInteger(GeoServicesConfig_MaximumSearchLifetimeInMinutes, (uint64_t)off_1EDF4CDA8) * 60.0 >= v6))
  {
    v7 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v7, "setSearchResponseRelativeTimestamp:", v6);
    if (v6 == 0.0)
      objc_msgSend(v7, "setHasSearchResponseRelativeTimestamp:", 0);
  }
  else
  {
    v7 = 0;
  }

  return (GEOPlaceActionDetails *)v7;
}

- (GEOPlaceActionDetails)init
{
  GEOPlaceActionDetails *v2;
  GEOPlaceActionDetails *v3;
  GEOPlaceActionDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceActionDetails;
  v2 = -[GEOPlaceActionDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceActionDetails)initWithData:(id)a3
{
  GEOPlaceActionDetails *v3;
  GEOPlaceActionDetails *v4;
  GEOPlaceActionDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceActionDetails;
  v3 = -[GEOPlaceActionDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unint64_t)businessID
{
  return self->_businessID;
}

- (void)setBusinessID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_businessID = a3;
}

- (void)setHasBusinessID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasBusinessID
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (int64_t)placeID
{
  return self->_placeID;
}

- (void)setPlaceID:(int64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2004u;
  self->_placeID = a3;
}

- (void)setHasPlaceID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8196;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasPlaceID
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (int)localSearchProviderID
{
  return self->_localSearchProviderID;
}

- (void)setLocalSearchProviderID:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  self->_localSearchProviderID = a3;
}

- (void)setHasLocalSearchProviderID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8224;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasLocalSearchProviderID
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (double)searchResponseRelativeTimestamp
{
  return self->_searchResponseRelativeTimestamp;
}

- (void)setSearchResponseRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  self->_searchResponseRelativeTimestamp = a3;
}

- (void)setHasSearchResponseRelativeTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8200;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasSearchResponseRelativeTimestamp
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (int)resultIndex
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_resultIndex;
  else
    return -1;
}

- (void)setResultIndex:(int)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  self->_resultIndex = a3;
}

- (void)setHasResultIndex:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8256;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFBF | v3;
}

- (BOOL)hasResultIndex
{
  return (*(_WORD *)&self->_flags >> 6) & 1;
}

- (unint64_t)animationID
{
  return self->_animationID;
}

- (void)setAnimationID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_animationID = a3;
}

- (void)setHasAnimationID:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasAnimationID
{
  return *(_WORD *)&self->_flags & 1;
}

- (unint64_t)targetID
{
  return self->_targetID;
}

- (void)setTargetID:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  self->_targetID = a3;
}

- (void)setHasTargetID:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8208;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasTargetID
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (void)_readPhotoId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasPhotoId
{
  -[GEOPlaceActionDetails _readPhotoId]((uint64_t)self);
  return self->_photoId != 0;
}

- (NSString)photoId
{
  -[GEOPlaceActionDetails _readPhotoId]((uint64_t)self);
  return self->_photoId;
}

- (void)setPhotoId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_photoId, a3);
}

- (void)_readActionUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasActionUrl
{
  -[GEOPlaceActionDetails _readActionUrl]((uint64_t)self);
  return self->_actionUrl != 0;
}

- (NSString)actionUrl
{
  -[GEOPlaceActionDetails _readActionUrl]((uint64_t)self);
  return self->_actionUrl;
}

- (void)setActionUrl:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_actionUrl, a3);
}

- (void)_readTransitPlaceCard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitPlaceCard_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasTransitPlaceCard
{
  -[GEOPlaceActionDetails _readTransitPlaceCard]((uint64_t)self);
  return self->_transitPlaceCard != 0;
}

- (GEOTransitPlaceCard)transitPlaceCard
{
  -[GEOPlaceActionDetails _readTransitPlaceCard]((uint64_t)self);
  return self->_transitPlaceCard;
}

- (void)setTransitPlaceCard:(id)a3
{
  *(_WORD *)&self->_flags |= 0x3000u;
  objc_storeStrong((id *)&self->_transitPlaceCard, a3);
}

- (void)_readRichProviderId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRichProviderId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasRichProviderId
{
  -[GEOPlaceActionDetails _readRichProviderId]((uint64_t)self);
  return self->_richProviderId != 0;
}

- (NSString)richProviderId
{
  -[GEOPlaceActionDetails _readRichProviderId]((uint64_t)self);
  return self->_richProviderId;
}

- (void)setRichProviderId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_richProviderId, a3);
}

- (void)_readDestinationApp
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDestinationApp_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasDestinationApp
{
  -[GEOPlaceActionDetails _readDestinationApp]((uint64_t)self);
  return self->_destinationApp != 0;
}

- (NSString)destinationApp
{
  -[GEOPlaceActionDetails _readDestinationApp]((uint64_t)self);
  return self->_destinationApp;
}

- (void)setDestinationApp:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2100u;
  objc_storeStrong((id *)&self->_destinationApp, a3);
}

- (void)_readShowcaseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 112));
    if ((*(_WORD *)(a1 + 124) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceActionDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcaseId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 112));
  }
}

- (BOOL)hasShowcaseId
{
  -[GEOPlaceActionDetails _readShowcaseId]((uint64_t)self);
  return self->_showcaseId != 0;
}

- (NSString)showcaseId
{
  -[GEOPlaceActionDetails _readShowcaseId]((uint64_t)self);
  return self->_showcaseId;
}

- (void)setShowcaseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2800u;
  objc_storeStrong((id *)&self->_showcaseId, a3);
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
  v8.super_class = (Class)GEOPlaceActionDetails;
  -[GEOPlaceActionDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceActionDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPlaceActionDetails _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __int16 v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("businessID"));

    v5 = *(_WORD *)(a1 + 124);
    if ((v5 & 4) == 0)
    {
LABEL_4:
      if ((v5 & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_25;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 56));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("placeID"));

  v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 116));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("localSearchProviderID"));

  v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 72));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("searchResponseRelativeTimestamp"));

  v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0)
      goto LABEL_8;
LABEL_28:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("animationID"));

    if ((*(_WORD *)(a1 + 124) & 0x10) == 0)
      goto LABEL_10;
    goto LABEL_9;
  }
LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 120));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("resultIndex"));

  v5 = *(_WORD *)(a1 + 124);
  if ((v5 & 1) != 0)
    goto LABEL_28;
LABEL_8:
  if ((v5 & 0x10) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("targetID"));

  }
LABEL_10:
  objc_msgSend((id)a1, "photoId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("photoId");
    else
      v8 = CFSTR("photo_id");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "actionUrl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    if (a2)
      v10 = CFSTR("actionUrl");
    else
      v10 = CFSTR("action_url");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);
  }

  objc_msgSend((id)a1, "transitPlaceCard");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v11, "jsonRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("transitPlaceCard");
    }
    else
    {
      objc_msgSend(v11, "dictionaryRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("transit_place_card");
    }
    objc_msgSend(v4, "setObject:forKey:", v13, v14);

  }
  objc_msgSend((id)a1, "richProviderId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    if (a2)
      v22 = CFSTR("richProviderId");
    else
      v22 = CFSTR("rich_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  objc_msgSend((id)a1, "destinationApp");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("destinationApp");
    else
      v24 = CFSTR("destination_app");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);
  }

  objc_msgSend((id)a1, "showcaseId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (a2)
      v26 = CFSTR("showcaseId");
    else
      v26 = CFSTR("showcase_id");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);
  }

  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPlaceActionDetails _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPlaceActionDetails)initWithDictionary:(id)a3
{
  return (GEOPlaceActionDetails *)-[GEOPlaceActionDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  GEOTransitPlaceCard *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("businessID"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBusinessID:", objc_msgSend(v6, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("placeID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setPlaceID:", objc_msgSend(v7, "longLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localSearchProviderID"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLocalSearchProviderID:", objc_msgSend(v8, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchResponseRelativeTimestamp"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        objc_msgSend(a1, "setSearchResponseRelativeTimestamp:");
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("resultIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setResultIndex:", objc_msgSend(v10, "intValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("animationID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setAnimationID:", objc_msgSend(v11, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("targetID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setTargetID:", objc_msgSend(v12, "unsignedLongLongValue"));

      if (a3)
        v13 = CFSTR("photoId");
      else
        v13 = CFSTR("photo_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(a1, "setPhotoId:", v15);

      }
      if (a3)
        v16 = CFSTR("actionUrl");
      else
        v16 = CFSTR("action_url");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(a1, "setActionUrl:", v18);

      }
      if (a3)
        v19 = CFSTR("transitPlaceCard");
      else
        v19 = CFSTR("transit_place_card");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = [GEOTransitPlaceCard alloc];
        if ((a3 & 1) != 0)
          v22 = -[GEOTransitPlaceCard initWithJSON:](v21, "initWithJSON:", v20);
        else
          v22 = -[GEOTransitPlaceCard initWithDictionary:](v21, "initWithDictionary:", v20);
        v23 = (void *)v22;
        objc_msgSend(a1, "setTransitPlaceCard:", v22);

      }
      if (a3)
        v24 = CFSTR("richProviderId");
      else
        v24 = CFSTR("rich_provider_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = (void *)objc_msgSend(v25, "copy");
        objc_msgSend(a1, "setRichProviderId:", v26);

      }
      if (a3)
        v27 = CFSTR("destinationApp");
      else
        v27 = CFSTR("destination_app");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = (void *)objc_msgSend(v28, "copy");
        objc_msgSend(a1, "setDestinationApp:", v29);

      }
      if (a3)
        v30 = CFSTR("showcaseId");
      else
        v30 = CFSTR("showcase_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v32 = (void *)objc_msgSend(v31, "copy");
        objc_msgSend(a1, "setShowcaseId:", v32);

      }
    }
  }

  return a1;
}

- (GEOPlaceActionDetails)initWithJSON:(id)a3
{
  return (GEOPlaceActionDetails *)-[GEOPlaceActionDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_713;
    else
      v8 = (int *)&readAll__nonRecursiveTag_714;
    GEOPlaceActionDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOTransitPlaceCard readAll:](self->_transitPlaceCard, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceActionDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceActionDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPlaceActionDetailsIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
    goto LABEL_31;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceActionDetails readAll:](self, "readAll:", 0);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_5:
      if ((flags & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_25;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_6:
    if ((flags & 8) == 0)
      goto LABEL_7;
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_7:
    if ((flags & 0x40) == 0)
      goto LABEL_8;
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_8:
    if ((flags & 1) == 0)
      goto LABEL_9;
LABEL_28:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_11;
    goto LABEL_10;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_28;
LABEL_9:
  if ((flags & 0x10) != 0)
LABEL_10:
    PBDataWriterWriteUint64Field();
LABEL_11:
  if (self->_photoId)
    PBDataWriterWriteStringField();
  if (self->_actionUrl)
    PBDataWriterWriteStringField();
  if (self->_transitPlaceCard)
    PBDataWriterWriteSubmessage();
  if (self->_richProviderId)
    PBDataWriterWriteStringField();
  if (self->_destinationApp)
    PBDataWriterWriteStringField();
  if (self->_showcaseId)
    PBDataWriterWriteStringField();
LABEL_31:

}

- (void)copyTo:(id)a3
{
  id *v4;
  __int16 flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOPlaceActionDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 26) = self->_readerMarkPos;
  *((_DWORD *)v6 + 27) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v6;
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v6[4] = (id)self->_businessID;
    *((_WORD *)v6 + 62) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 4) == 0)
    {
LABEL_3:
      if ((flags & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_24;
    }
  }
  else if ((flags & 4) == 0)
  {
    goto LABEL_3;
  }
  v6[7] = (id)self->_placeID;
  *((_WORD *)v6 + 62) |= 4u;
  flags = (__int16)self->_flags;
  if ((flags & 0x20) == 0)
  {
LABEL_4:
    if ((flags & 8) == 0)
      goto LABEL_5;
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v6 + 29) = self->_localSearchProviderID;
  *((_WORD *)v6 + 62) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_5:
    if ((flags & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_26;
  }
LABEL_25:
  v6[9] = *(id *)&self->_searchResponseRelativeTimestamp;
  *((_WORD *)v6 + 62) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 0x40) == 0)
  {
LABEL_6:
    if ((flags & 1) == 0)
      goto LABEL_7;
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v6 + 30) = self->_resultIndex;
  *((_WORD *)v6 + 62) |= 0x40u;
  flags = (__int16)self->_flags;
  if ((flags & 1) == 0)
  {
LABEL_7:
    if ((flags & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_27:
  v6[3] = (id)self->_animationID;
  *((_WORD *)v6 + 62) |= 1u;
  if ((*(_WORD *)&self->_flags & 0x10) != 0)
  {
LABEL_8:
    v6[11] = (id)self->_targetID;
    *((_WORD *)v6 + 62) |= 0x10u;
  }
LABEL_9:
  if (self->_photoId)
  {
    objc_msgSend(v6, "setPhotoId:");
    v4 = v6;
  }
  if (self->_actionUrl)
  {
    objc_msgSend(v6, "setActionUrl:");
    v4 = v6;
  }
  if (self->_transitPlaceCard)
  {
    objc_msgSend(v6, "setTransitPlaceCard:");
    v4 = v6;
  }
  if (self->_richProviderId)
  {
    objc_msgSend(v6, "setRichProviderId:");
    v4 = v6;
  }
  if (self->_destinationApp)
  {
    objc_msgSend(v6, "setDestinationApp:");
    v4 = v6;
  }
  if (self->_showcaseId)
  {
    objc_msgSend(v6, "setShowcaseId:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  __int16 flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPlaceActionDetails readAll:](self, "readAll:", 0);
    flags = (__int16)self->_flags;
    if ((flags & 2) != 0)
    {
      *(_QWORD *)(v5 + 32) = self->_businessID;
      *(_WORD *)(v5 + 124) |= 2u;
      flags = (__int16)self->_flags;
      if ((flags & 4) == 0)
      {
LABEL_7:
        if ((flags & 0x20) == 0)
          goto LABEL_8;
        goto LABEL_17;
      }
    }
    else if ((flags & 4) == 0)
    {
      goto LABEL_7;
    }
    *(_QWORD *)(v5 + 56) = self->_placeID;
    *(_WORD *)(v5 + 124) |= 4u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_8:
      if ((flags & 8) == 0)
        goto LABEL_9;
      goto LABEL_18;
    }
LABEL_17:
    *(_DWORD *)(v5 + 116) = self->_localSearchProviderID;
    *(_WORD *)(v5 + 124) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 8) == 0)
    {
LABEL_9:
      if ((flags & 0x40) == 0)
        goto LABEL_10;
      goto LABEL_19;
    }
LABEL_18:
    *(double *)(v5 + 72) = self->_searchResponseRelativeTimestamp;
    *(_WORD *)(v5 + 124) |= 8u;
    flags = (__int16)self->_flags;
    if ((flags & 0x40) == 0)
    {
LABEL_10:
      if ((flags & 1) == 0)
        goto LABEL_11;
      goto LABEL_20;
    }
LABEL_19:
    *(_DWORD *)(v5 + 120) = self->_resultIndex;
    *(_WORD *)(v5 + 124) |= 0x40u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_11:
      if ((flags & 0x10) == 0)
      {
LABEL_13:
        v10 = -[NSString copyWithZone:](self->_photoId, "copyWithZone:", a3);
        v11 = *(void **)(v5 + 48);
        *(_QWORD *)(v5 + 48) = v10;

        v12 = -[NSString copyWithZone:](self->_actionUrl, "copyWithZone:", a3);
        v13 = *(void **)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v12;

        v14 = -[GEOTransitPlaceCard copyWithZone:](self->_transitPlaceCard, "copyWithZone:", a3);
        v15 = *(void **)(v5 + 96);
        *(_QWORD *)(v5 + 96) = v14;

        v16 = -[NSString copyWithZone:](self->_richProviderId, "copyWithZone:", a3);
        v17 = *(void **)(v5 + 64);
        *(_QWORD *)(v5 + 64) = v16;

        v18 = -[NSString copyWithZone:](self->_destinationApp, "copyWithZone:", a3);
        v19 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v18;

        v20 = -[NSString copyWithZone:](self->_showcaseId, "copyWithZone:", a3);
        v8 = *(id *)(v5 + 80);
        *(_QWORD *)(v5 + 80) = v20;
        goto LABEL_14;
      }
LABEL_12:
      *(_QWORD *)(v5 + 88) = self->_targetID;
      *(_WORD *)(v5 + 124) |= 0x10u;
      goto LABEL_13;
    }
LABEL_20:
    *(_QWORD *)(v5 + 24) = self->_animationID;
    *(_WORD *)(v5 + 124) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x10) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x2000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPlaceActionDetailsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_14:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 flags;
  __int16 v6;
  NSString *photoId;
  NSString *actionUrl;
  GEOTransitPlaceCard *transitPlaceCard;
  NSString *richProviderId;
  NSString *destinationApp;
  NSString *showcaseId;
  char v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_49;
  -[GEOPlaceActionDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (__int16)self->_flags;
  v6 = *((_WORD *)v4 + 62);
  if ((flags & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_businessID != *((_QWORD *)v4 + 4))
      goto LABEL_49;
  }
  else if ((v6 & 2) != 0)
  {
LABEL_49:
    v13 = 0;
    goto LABEL_50;
  }
  if ((flags & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_placeID != *((_QWORD *)v4 + 7))
      goto LABEL_49;
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_localSearchProviderID != *((_DWORD *)v4 + 29))
      goto LABEL_49;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_searchResponseRelativeTimestamp != *((double *)v4 + 9))
      goto LABEL_49;
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_resultIndex != *((_DWORD *)v4 + 30))
      goto LABEL_49;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_animationID != *((_QWORD *)v4 + 3))
      goto LABEL_49;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_49;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_targetID != *((_QWORD *)v4 + 11))
      goto LABEL_49;
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  photoId = self->_photoId;
  if ((unint64_t)photoId | *((_QWORD *)v4 + 6) && !-[NSString isEqual:](photoId, "isEqual:"))
    goto LABEL_49;
  actionUrl = self->_actionUrl;
  if ((unint64_t)actionUrl | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](actionUrl, "isEqual:"))
      goto LABEL_49;
  }
  transitPlaceCard = self->_transitPlaceCard;
  if ((unint64_t)transitPlaceCard | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOTransitPlaceCard isEqual:](transitPlaceCard, "isEqual:"))
      goto LABEL_49;
  }
  richProviderId = self->_richProviderId;
  if ((unint64_t)richProviderId | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](richProviderId, "isEqual:"))
      goto LABEL_49;
  }
  destinationApp = self->_destinationApp;
  if ((unint64_t)destinationApp | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](destinationApp, "isEqual:"))
      goto LABEL_49;
  }
  showcaseId = self->_showcaseId;
  if ((unint64_t)showcaseId | *((_QWORD *)v4 + 10))
    v13 = -[NSString isEqual:](showcaseId, "isEqual:");
  else
    v13 = 1;
LABEL_50:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double searchResponseRelativeTimestamp;
  double v8;
  long double v9;
  double v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  NSUInteger v16;
  unint64_t v17;
  NSUInteger v18;
  NSUInteger v19;

  -[GEOPlaceActionDetails readAll:](self, "readAll:", 1);
  flags = (__int16)self->_flags;
  if ((flags & 2) != 0)
  {
    v4 = 2654435761u * self->_businessID;
    if ((flags & 4) != 0)
    {
LABEL_3:
      v5 = 2654435761 * self->_placeID;
      if ((flags & 0x20) != 0)
        goto LABEL_4;
LABEL_11:
      v6 = 0;
      if ((flags & 8) != 0)
        goto LABEL_5;
LABEL_12:
      v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v4 = 0;
    if ((flags & 4) != 0)
      goto LABEL_3;
  }
  v5 = 0;
  if ((flags & 0x20) == 0)
    goto LABEL_11;
LABEL_4:
  v6 = 2654435761 * self->_localSearchProviderID;
  if ((flags & 8) == 0)
    goto LABEL_12;
LABEL_5:
  searchResponseRelativeTimestamp = self->_searchResponseRelativeTimestamp;
  v8 = -searchResponseRelativeTimestamp;
  if (searchResponseRelativeTimestamp >= 0.0)
    v8 = self->_searchResponseRelativeTimestamp;
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
LABEL_15:
  if ((flags & 0x40) == 0)
  {
    v12 = 0;
    if ((flags & 1) != 0)
      goto LABEL_17;
LABEL_20:
    v13 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_18;
LABEL_21:
    v14 = 0;
    goto LABEL_22;
  }
  v12 = 2654435761 * self->_resultIndex;
  if ((flags & 1) == 0)
    goto LABEL_20;
LABEL_17:
  v13 = 2654435761u * self->_animationID;
  if ((flags & 0x10) == 0)
    goto LABEL_21;
LABEL_18:
  v14 = 2654435761u * self->_targetID;
LABEL_22:
  v15 = v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14 ^ -[NSString hash](self->_photoId, "hash");
  v16 = -[NSString hash](self->_actionUrl, "hash");
  v17 = v15 ^ v16 ^ -[GEOTransitPlaceCard hash](self->_transitPlaceCard, "hash");
  v18 = -[NSString hash](self->_richProviderId, "hash");
  v19 = v18 ^ -[NSString hash](self->_destinationApp, "hash");
  return v17 ^ v19 ^ -[NSString hash](self->_showcaseId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  __int16 v5;
  GEOTransitPlaceCard *transitPlaceCard;
  uint64_t v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "readAll:", 0);
  v4 = v8;
  v5 = *((_WORD *)v8 + 62);
  if ((v5 & 2) != 0)
  {
    self->_businessID = *((_QWORD *)v8 + 4);
    *(_WORD *)&self->_flags |= 2u;
    v5 = *((_WORD *)v8 + 62);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_18;
    }
  }
  else if ((v5 & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_placeID = *((_QWORD *)v8 + 7);
  *(_WORD *)&self->_flags |= 4u;
  v5 = *((_WORD *)v8 + 62);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0)
      goto LABEL_5;
    goto LABEL_19;
  }
LABEL_18:
  self->_localSearchProviderID = *((_DWORD *)v8 + 29);
  *(_WORD *)&self->_flags |= 0x20u;
  v5 = *((_WORD *)v8 + 62);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x40) == 0)
      goto LABEL_6;
    goto LABEL_20;
  }
LABEL_19:
  self->_searchResponseRelativeTimestamp = *((double *)v8 + 9);
  *(_WORD *)&self->_flags |= 8u;
  v5 = *((_WORD *)v8 + 62);
  if ((v5 & 0x40) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_21;
  }
LABEL_20:
  self->_resultIndex = *((_DWORD *)v8 + 30);
  *(_WORD *)&self->_flags |= 0x40u;
  v5 = *((_WORD *)v8 + 62);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
LABEL_21:
  self->_animationID = *((_QWORD *)v8 + 3);
  *(_WORD *)&self->_flags |= 1u;
  if ((*((_WORD *)v8 + 62) & 0x10) != 0)
  {
LABEL_8:
    self->_targetID = *((_QWORD *)v8 + 11);
    *(_WORD *)&self->_flags |= 0x10u;
  }
LABEL_9:
  if (*((_QWORD *)v8 + 6))
  {
    -[GEOPlaceActionDetails setPhotoId:](self, "setPhotoId:");
    v4 = v8;
  }
  if (v4[2])
  {
    -[GEOPlaceActionDetails setActionUrl:](self, "setActionUrl:");
    v4 = v8;
  }
  transitPlaceCard = self->_transitPlaceCard;
  v7 = v4[12];
  if (transitPlaceCard)
  {
    if (!v7)
      goto LABEL_26;
    -[GEOTransitPlaceCard mergeFrom:](transitPlaceCard, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_26;
    -[GEOPlaceActionDetails setTransitPlaceCard:](self, "setTransitPlaceCard:");
  }
  v4 = v8;
LABEL_26:
  if (v4[8])
  {
    -[GEOPlaceActionDetails setRichProviderId:](self, "setRichProviderId:");
    v4 = v8;
  }
  if (v4[5])
  {
    -[GEOPlaceActionDetails setDestinationApp:](self, "setDestinationApp:");
    v4 = v8;
  }
  if (v4[10])
  {
    -[GEOPlaceActionDetails setShowcaseId:](self, "setShowcaseId:");
    v4 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitPlaceCard, 0);
  objc_storeStrong((id *)&self->_showcaseId, 0);
  objc_storeStrong((id *)&self->_richProviderId, 0);
  objc_storeStrong((id *)&self->_photoId, 0);
  objc_storeStrong((id *)&self->_destinationApp, 0);
  objc_storeStrong((id *)&self->_actionUrl, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
