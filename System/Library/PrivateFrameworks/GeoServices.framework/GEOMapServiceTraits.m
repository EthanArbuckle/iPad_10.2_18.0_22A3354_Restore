@implementation GEOMapServiceTraits

- (BOOL)readFrom:(id)a3
{
  return GEOMapServiceTraitsReadAllFrom((uint64_t)self, a3, 0);
}

- (GEOMapServiceTraits)initWithData:(id)a3
{
  GEOMapServiceTraits *v3;
  GEOMapServiceTraits *v4;
  GEOMapServiceTraits *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOMapServiceTraits;
  v3 = -[GEOMapServiceTraits initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (unsigned)photosCount
{
  return self->_photosCount;
}

- (unsigned)reviewUserPhotosCount
{
  return self->_reviewUserPhotosCount;
}

- (unsigned)relatedPlaceItemCount
{
  return self->_relatedPlaceItemCount;
}

- (unsigned)ratingsCount
{
  return self->_ratingsCount;
}

- (unsigned)photoAlbumCount
{
  return self->_photoAlbumCount;
}

- (BOOL)hasDeviceSpokenLocale
{
  -[GEOMapServiceTraits _readDeviceSpokenLocale]((uint64_t)self);
  return self->_deviceSpokenLocale != 0;
}

- (void)_readDeviceSpokenLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSpokenLocale_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)displayRegion
{
  -[GEOMapServiceTraits _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion;
}

- (BOOL)hasDisplayRegion
{
  -[GEOMapServiceTraits _readDisplayRegion]((uint64_t)self);
  return self->_displayRegion != 0;
}

- (void)_readDisplayRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDisplayRegion_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)deviceDisplayLanguagesCount
{
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  return -[NSMutableArray count](self->_deviceDisplayLanguages, "count");
}

- (NSMutableArray)deviceDisplayLanguages
{
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  return self->_deviceDisplayLanguages;
}

- (void)_readDeviceDisplayLanguages
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceDisplayLanguages_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasDeviceKeyboardLocale
{
  -[GEOMapServiceTraits _readDeviceKeyboardLocale]((uint64_t)self);
  return self->_deviceKeyboardLocale != 0;
}

- (BOOL)hasTimeSinceMapEnteredForeground
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 6) & 1;
}

- (BOOL)hasTransitScheduleFilter
{
  -[GEOMapServiceTraits _readTransitScheduleFilter]((uint64_t)self);
  return self->_transitScheduleFilter != 0;
}

- (GEOTraitsTransitScheduleFilter)transitScheduleFilter
{
  -[GEOMapServiceTraits _readTransitScheduleFilter]((uint64_t)self);
  return self->_transitScheduleFilter;
}

- (void)_readTransitScheduleFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 769) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitScheduleFilter_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setDisplayRegion:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200001000000uLL;
  objc_storeStrong((id *)&self->_displayRegion, a3);
}

- (BOOL)navigating
{
  return self->_navigating;
}

- (BOOL)hasCurrentLocaleCurrencySymbol
{
  -[GEOMapServiceTraits _readCurrentLocaleCurrencySymbol]((uint64_t)self);
  return self->_currentLocaleCurrencySymbol != 0;
}

- (GEOLocation)deviceLocation
{
  -[GEOMapServiceTraits _readDeviceLocation]((uint64_t)self);
  return self->_deviceLocation;
}

- (void)_readDeviceLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceLocation_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_readDeviceKeyboardLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceKeyboardLocale_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_readCurrentLocaleCurrencySymbol
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentLocaleCurrencySymbol_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasIsTourist
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (NSMutableArray)historicalLocations
{
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  return self->_historicalLocations;
}

- (void)_readHistoricalLocations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHistoricalLocations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setAnalyticsAppIdentifier:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000000400uLL;
  objc_storeStrong((id *)&self->_analyticsAppIdentifier, a3);
}

- (unint64_t)knownClientResolvedTypesCount
{
  -[GEOMapServiceTraits _readKnownClientResolvedTypes]((uint64_t)self);
  return self->_knownClientResolvedTypes.count;
}

- (int)knownClientResolvedTypes
{
  -[GEOMapServiceTraits _readKnownClientResolvedTypes]((uint64_t)self);
  return self->_knownClientResolvedTypes.list;
}

- (void)_readKnownClientResolvedTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownClientResolvedTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)appMinorVersion
{
  -[GEOMapServiceTraits _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion;
}

- (void)_readAppMinorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMinorVersion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)appMajorVersion
{
  -[GEOMapServiceTraits _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion;
}

- (void)_readAppMajorVersion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppMajorVersion_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSString)appIdentifier
{
  -[GEOMapServiceTraits _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier;
}

- (void)_readAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAppIdentifier_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSource
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 5) & 1;
}

- (BOOL)hasAppIdentifier
{
  -[GEOMapServiceTraits _readAppIdentifier]((uint64_t)self);
  return self->_appIdentifier != 0;
}

- (BOOL)isAPICall
{
  return self->_isAPICall;
}

- (BOOL)hasSequenceNumber
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 4) & 1;
}

- (BOOL)hasRouteStopCount
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 1) & 1;
}

- (BOOL)hasAppMinorVersion
{
  -[GEOMapServiceTraits _readAppMinorVersion]((uint64_t)self);
  return self->_appMinorVersion != 0;
}

- (BOOL)hasAppMajorVersion
{
  -[GEOMapServiceTraits _readAppMajorVersion]((uint64_t)self);
  return self->_appMajorVersion != 0;
}

- (BOOL)analyticsOptOut
{
  return self->_analyticsOptOut;
}

void __66__GEOMapServiceTraits_GEOUserSession__updateAnalyticsShortSession__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, double a8, double a9, double a10)
{
  GEOPrivacyMetadata *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "setSessionId:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setSessionRelativeTimestamp:", a10);
  objc_msgSend(*(id *)(a1 + 32), "setSequenceNumber:", a4);
  if (a7)
  {
    v16 = objc_alloc_init(GEOPrivacyMetadata);
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyMetadata:", v16);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsUnderageAccount:", a5);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIsManagedAccount:", a6);

  }
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setSessionId:(GEOSessionID)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_sessionId = a3;
}

- (void)setSequenceNumber:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_sequenceNumber = a3;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (GEOSessionID)sessionId
{
  GEOSessionID *p_sessionId;
  unint64_t high;
  unint64_t low;
  GEOSessionID result;

  p_sessionId = &self->_sessionId;
  high = self->_sessionId._high;
  low = p_sessionId->_low;
  result._low = low;
  result._high = high;
  return result;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (BOOL)hasSessionId
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)setIsAPICall:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isAPICall = a3;
}

- (void)setAnalyticsOptOut:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_analyticsOptOut = a3;
}

- (BOOL)hasMapRegion
{
  -[GEOMapServiceTraits _readMapRegion]((uint64_t)self);
  return self->_mapRegion != 0;
}

- (void)_readMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRegion_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)clearDeviceDisplayLanguages
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x200000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_deviceDisplayLanguages, "removeAllObjects");
}

- (unint64_t)supportedChildActionsCount
{
  -[GEOMapServiceTraits _readSupportedChildActions]((uint64_t)self);
  return self->_supportedChildActions.count;
}

- (BOOL)hasSupportChildItems
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 3) & 1;
}

- (void)_readSupportedChildActions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedChildActions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setSupportsBrandFallback:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportsBrandFallback = a3;
}

- (void)setHttpRequestPriority:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_httpRequestPriority = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t flags;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  NSMutableArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSMutableArray *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  NSMutableArray *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t k;
  void *v39;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  $DCA03DC0A7F5305716C671105EBE6326 *v54;
  uint64_t v55;
  NSMutableArray *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t m;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  $DCA03DC0A7F5305716C671105EBE6326 *v67;
  uint64_t v68;
  id v69;
  void *v70;
  $DCA03DC0A7F5305716C671105EBE6326 *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  $DCA03DC0A7F5305716C671105EBE6326 *v75;
  uint64_t v76;
  id v77;
  void *v78;
  $DCA03DC0A7F5305716C671105EBE6326 *v79;
  uint64_t v80;
  id v81;
  void *v82;
  NSMutableArray *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  void *v87;
  $DCA03DC0A7F5305716C671105EBE6326 *v88;
  uint64_t v89;
  uint64_t v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  id v102;
  void *v103;
  $DCA03DC0A7F5305716C671105EBE6326 *v104;
  uint64_t v105;
  id v106;
  void *v107;
  $DCA03DC0A7F5305716C671105EBE6326 *v108;
  uint64_t v109;
  uint64_t v110;
  id v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  void *v117;
  id v118;
  void *v119;
  uint64_t v120;
  void *v121;
  id v122;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;

  v149 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 13) & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOMapServiceTraitsReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_141;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOMapServiceTraits readAll:](self, "readAll:", 0);
  flags = (uint64_t)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 264) = self->_sessionId;
    *(_QWORD *)(v5 + 756) |= 1uLL;
    flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x10000000) != 0)
  {
    *(_DWORD *)(v5 + 708) = self->_sequenceNumber;
    *(_QWORD *)(v5 + 756) |= 0x10000000uLL;
  }
  v10 = -[NSString copyWithZone:](self->_appIdentifier, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v10;

  v12 = -[NSString copyWithZone:](self->_appMajorVersion, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v12;

  v14 = -[NSString copyWithZone:](self->_appMinorVersion, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v14;

  v16 = -[GEOLocation copyWithZone:](self->_deviceLocation, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v16;

  PBRepeatedInt32Copy();
  v18 = -[GEOMapRegion copyWithZone:](self->_mapRegion, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v18;

  v142 = 0u;
  v143 = 0u;
  v140 = 0u;
  v141 = 0u;
  v20 = self->_deviceDisplayLanguages;
  v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v140, v148, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v141;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v141 != v22)
          objc_enumerationMutation(v20);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addDeviceDisplayLanguage:", v24);

      }
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v140, v148, 16);
    }
    while (v21);
  }

  v25 = -[NSString copyWithZone:](self->_deviceKeyboardLocale, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v25;

  v27 = -[NSString copyWithZone:](self->_deviceSpokenLocale, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v27;

  v29 = (uint64_t)self->_flags;
  if ((v29 & 0x8000000000) != 0)
  {
    *(_BYTE *)(v5 + 731) = self->_isAPICall;
    *(_QWORD *)(v5 + 756) |= 0x8000000000uLL;
    v29 = (uint64_t)self->_flags;
  }
  if ((v29 & 0x20000000) != 0)
  {
    *(_DWORD *)(v5 + 712) = self->_source;
    *(_QWORD *)(v5 + 756) |= 0x20000000uLL;
  }
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v30 = self->_photoSizes;
  v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v136, v147, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v137;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v137 != v32)
          objc_enumerationMutation(v30);
        v34 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPhotoSizes:", v34);

      }
      v31 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v136, v147, 16);
    }
    while (v31);
  }

  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    *(_DWORD *)(v5 + 664) = self->_photosCount;
    *(_QWORD *)(v5 + 756) |= 0x20000uLL;
  }
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v35 = self->_reviewUserPhotoSizes;
  v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
  if (v36)
  {
    v37 = *(_QWORD *)v133;
    do
    {
      for (k = 0; k != v36; ++k)
      {
        if (*(_QWORD *)v133 != v37)
          objc_enumerationMutation(v35);
        v39 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v132 + 1) + 8 * k), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addReviewUserPhotoSizes:", v39);

      }
      v36 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v35, "countByEnumeratingWithState:objects:count:", &v132, v146, 16);
    }
    while (v36);
  }

  p_flags = &self->_flags;
  v41 = (uint64_t)self->_flags;
  if ((v41 & 0x1000000) != 0)
  {
    *(_DWORD *)(v5 + 692) = self->_reviewUserPhotosCount;
    *(_QWORD *)(v5 + 756) |= 0x1000000uLL;
    v41 = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x40000000) == 0)
    {
LABEL_38:
      if ((v41 & 0x80000000) == 0)
        goto LABEL_39;
      goto LABEL_144;
    }
  }
  else if ((v41 & 0x40000000) == 0)
  {
    goto LABEL_38;
  }
  *(_DWORD *)(v5 + 716) = self->_timeSinceMapEnteredForeground;
  *(_QWORD *)(v5 + 756) |= 0x40000000uLL;
  v41 = (uint64_t)self->_flags;
  if ((v41 & 0x80000000) == 0)
  {
LABEL_39:
    if ((v41 & 0x200) == 0)
      goto LABEL_41;
    goto LABEL_40;
  }
LABEL_144:
  *(_DWORD *)(v5 + 720) = self->_timeSinceMapViewportChanged;
  *(_QWORD *)(v5 + 756) |= 0x80000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_40:
    *(_DWORD *)(v5 + 632) = self->_carHeadunitInteractionModel;
    *(_QWORD *)(v5 + 756) |= 0x200uLL;
  }
LABEL_41:
  v42 = -[NSString copyWithZone:](self->_carHeadunitManufacturer, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v42;

  v44 = -[NSString copyWithZone:](self->_carHeadunitModel, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v44;

  v46 = (uint64_t)self->_flags;
  if ((v46 & 4) != 0)
  {
    *(double *)(v5 + 360) = self->_carHeadunitPixelWidth;
    *(_QWORD *)(v5 + 756) |= 4uLL;
    v46 = (uint64_t)self->_flags;
  }
  if ((v46 & 2) != 0)
  {
    *(double *)(v5 + 352) = self->_carHeadunitPixelHeight;
    *(_QWORD *)(v5 + 756) |= 2uLL;
  }
  v47 = -[GEOTraitsTransitScheduleFilter copyWithZone:](self->_transitScheduleFilter, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 568);
  *(_QWORD *)(v5 + 568) = v47;

  v49 = (uint64_t)self->_flags;
  if ((v49 & 0x10) != 0)
  {
    *(double *)(v5 + 464) = self->_mapZoomLevel;
    *(_QWORD *)(v5 + 756) |= 0x10uLL;
    v49 = (uint64_t)self->_flags;
  }
  if ((v49 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 652) = self->_mode;
    *(_QWORD *)(v5 + 756) |= 0x4000uLL;
  }
  v50 = -[NSString copyWithZone:](self->_displayRegion, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 416);
  *(_QWORD *)(v5 + 416) = v50;

  v52 = -[NSString copyWithZone:](self->_providerID, "copyWithZone:", a3);
  v53 = *(void **)(v5 + 496);
  *(_QWORD *)(v5 + 496) = v52;

  v54 = &self->_flags;
  v55 = (uint64_t)self->_flags;
  if ((v55 & 0x800) != 0)
  {
    *(_DWORD *)(v5 + 640) = self->_deviceInterfaceOrientation;
    *(_QWORD *)(v5 + 756) |= 0x800uLL;
    v55 = *(_QWORD *)v54;
    if ((*(_QWORD *)v54 & 0x400) == 0)
    {
LABEL_51:
      if ((v55 & 0x100) == 0)
        goto LABEL_52;
      goto LABEL_148;
    }
  }
  else if ((v55 & 0x400) == 0)
  {
    goto LABEL_51;
  }
  *(_DWORD *)(v5 + 636) = self->_deviceBatteryState;
  *(_QWORD *)(v5 + 756) |= 0x400uLL;
  v55 = (uint64_t)self->_flags;
  if ((v55 & 0x100) == 0)
  {
LABEL_52:
    if ((v55 & 0x400000000000) == 0)
      goto LABEL_54;
    goto LABEL_53;
  }
LABEL_148:
  *(_DWORD *)(v5 + 628) = self->_carHeadunitConnectionType;
  *(_QWORD *)(v5 + 756) |= 0x100uLL;
  if ((*(_QWORD *)&self->_flags & 0x400000000000) != 0)
  {
LABEL_53:
    *(_BYTE *)(v5 + 738) = self->_navigating;
    *(_QWORD *)(v5 + 756) |= 0x400000000000uLL;
  }
LABEL_54:
  v130 = 0u;
  v131 = 0u;
  v128 = 0u;
  v129 = 0u;
  v56 = self->_historicalLocations;
  v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
  if (v57)
  {
    v58 = *(_QWORD *)v129;
    do
    {
      for (m = 0; m != v57; ++m)
      {
        if (*(_QWORD *)v129 != v58)
          objc_enumerationMutation(v56);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v128 + 1) + 8 * m), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addHistoricalLocations:", v60);

      }
      v57 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v56, "countByEnumeratingWithState:objects:count:", &v128, v145, 16);
    }
    while (v57);
  }

  v61 = -[GEOAutomobileOptions copyWithZone:](self->_automobileOptions, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v61;

  v63 = -[GEOTransitOptions copyWithZone:](self->_transitOptions, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 560);
  *(_QWORD *)(v5 + 560) = v63;

  v65 = -[GEOWalkingOptions copyWithZone:](self->_walkingOptions, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 600);
  *(_QWORD *)(v5 + 600) = v65;

  PBRepeatedInt32Copy();
  v67 = &self->_flags;
  v68 = (uint64_t)self->_flags;
  if ((v68 & 0x200000) != 0)
  {
    *(_DWORD *)(v5 + 680) = self->_requestMode;
    *(_QWORD *)(v5 + 756) |= 0x200000uLL;
    v68 = *(_QWORD *)v67;
    if ((*(_QWORD *)v67 & 0x80000000000000) == 0)
    {
LABEL_63:
      if ((v68 & 0x100000000000000) == 0)
        goto LABEL_65;
      goto LABEL_64;
    }
  }
  else if ((v68 & 0x80000000000000) == 0)
  {
    goto LABEL_63;
  }
  *(_BYTE *)(v5 + 747) = self->_supportDirectionIntentSearch;
  *(_QWORD *)(v5 + 756) |= 0x80000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x100000000000000) != 0)
  {
LABEL_64:
    *(_BYTE *)(v5 + 748) = self->_supportDymSuggestion;
    *(_QWORD *)(v5 + 756) |= 0x100000000000000uLL;
  }
LABEL_65:
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_flags + 7) & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 752) = self->_wantsBrandIcon;
    *(_QWORD *)(v5 + 756) |= 0x1000000000000000uLL;
  }
  v69 = -[GEOPDVenueIdentifier copyWithZone:](self->_venueIdentifier, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 592);
  *(_QWORD *)(v5 + 592) = v69;

  v71 = &self->_flags;
  v72 = (uint64_t)self->_flags;
  if ((v72 & 0x4000000000) != 0)
  {
    *(_BYTE *)(v5 + 730) = self->_deviceInVehicle;
    *(_QWORD *)(v5 + 756) |= 0x4000000000uLL;
    v72 = *(_QWORD *)v71;
    if ((*(_QWORD *)v71 & 0x400000) == 0)
    {
LABEL_69:
      if ((v72 & 0x2000) == 0)
        goto LABEL_71;
      goto LABEL_70;
    }
  }
  else if ((v72 & 0x400000) == 0)
  {
    goto LABEL_69;
  }
  *(_DWORD *)(v5 + 684) = self->_requestPriority;
  *(_QWORD *)(v5 + 756) |= 0x400000uLL;
  if ((*(_QWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_70:
    *(_DWORD *)(v5 + 648) = self->_httpRequestPriority;
    *(_QWORD *)(v5 + 756) |= 0x2000uLL;
  }
LABEL_71:
  v73 = -[NSString copyWithZone:](self->_analyticsAppIdentifier, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v73;

  v75 = &self->_flags;
  v76 = (uint64_t)self->_flags;
  if ((v76 & 0x20) != 0)
  {
    *(double *)(v5 + 544) = self->_sessionRelativeTimestamp;
    *(_QWORD *)(v5 + 756) |= 0x20uLL;
    v76 = *(_QWORD *)v75;
    if ((*(_QWORD *)v75 & 0x40000000000000) == 0)
    {
LABEL_73:
      if ((v76 & 0x400000000000000) == 0)
        goto LABEL_74;
      goto LABEL_158;
    }
  }
  else if ((v76 & 0x40000000000000) == 0)
  {
    goto LABEL_73;
  }
  *(_BYTE *)(v5 + 746) = self->_supportDirectionIntentAutocomplete;
  *(_QWORD *)(v5 + 756) |= 0x40000000000000uLL;
  v76 = (uint64_t)self->_flags;
  if ((v76 & 0x400000000000000) == 0)
  {
LABEL_74:
    if ((v76 & 0x2000000000) == 0)
      goto LABEL_75;
    goto LABEL_159;
  }
LABEL_158:
  *(_BYTE *)(v5 + 750) = self->_supportUnresolvedDirectionIntent;
  *(_QWORD *)(v5 + 756) |= 0x400000000000000uLL;
  v76 = (uint64_t)self->_flags;
  if ((v76 & 0x2000000000) == 0)
  {
LABEL_75:
    if ((v76 & 0x200000000) == 0)
      goto LABEL_76;
    goto LABEL_160;
  }
LABEL_159:
  *(_BYTE *)(v5 + 729) = self->_deviceDarkMode;
  *(_QWORD *)(v5 + 756) |= 0x2000000000uLL;
  v76 = (uint64_t)self->_flags;
  if ((v76 & 0x200000000) == 0)
  {
LABEL_76:
    if ((v76 & 0x800000000000000) == 0)
      goto LABEL_77;
    goto LABEL_161;
  }
LABEL_160:
  *(_BYTE *)(v5 + 725) = self->_appDarkMode;
  *(_QWORD *)(v5 + 756) |= 0x200000000uLL;
  v76 = (uint64_t)self->_flags;
  if ((v76 & 0x800000000000000) == 0)
  {
LABEL_77:
    if ((v76 & 0x800000) == 0)
      goto LABEL_79;
    goto LABEL_78;
  }
LABEL_161:
  *(_BYTE *)(v5 + 751) = self->_supportsBrandFallback;
  *(_QWORD *)(v5 + 756) |= 0x800000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x800000) != 0)
  {
LABEL_78:
    *(_DWORD *)(v5 + 688) = self->_requestPurpose;
    *(_QWORD *)(v5 + 756) |= 0x800000uLL;
  }
LABEL_79:
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_flags + 5) & 4) != 0)
  {
    *(_BYTE *)(v5 + 734) = self->_isSettlement;
    *(_QWORD *)(v5 + 756) |= 0x40000000000uLL;
  }
  v77 = -[GEOTraitsTransitScheduleFilter copyWithZone:](self->_transitTripStopTimeFilter, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 576);
  *(_QWORD *)(v5 + 576) = v77;

  if ((*((_BYTE *)&self->_flags + 6) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 745) = self->_supportClientRankingFeatureMetadata;
    *(_QWORD *)(v5 + 756) |= 0x20000000000000uLL;
  }
  PBRepeatedInt32Copy();
  v79 = &self->_flags;
  v80 = (uint64_t)self->_flags;
  if ((v80 & 0x8000000000000) != 0)
  {
    *(_BYTE *)(v5 + 743) = self->_supportChildItems;
    *(_QWORD *)(v5 + 756) |= 0x8000000000000uLL;
    v80 = *(_QWORD *)v79;
    if ((*(_QWORD *)v79 & 0x10000000000) == 0)
    {
LABEL_85:
      if ((v80 & 0x800000000) == 0)
        goto LABEL_87;
      goto LABEL_86;
    }
  }
  else if ((v80 & 0x10000000000) == 0)
  {
    goto LABEL_85;
  }
  *(_BYTE *)(v5 + 732) = self->_isRefund;
  *(_QWORD *)(v5 + 756) |= 0x10000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x800000000) != 0)
  {
LABEL_86:
    *(_BYTE *)(v5 + 727) = self->_autocompleteRequestSupportsSectionHeader;
    *(_QWORD *)(v5 + 756) |= 0x800000000uLL;
  }
LABEL_87:
  PBRepeatedInt32Copy();
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 656) = self->_navigationTransportType;
    *(_QWORD *)(v5 + 756) |= 0x8000uLL;
  }
  v81 = -[GEOCyclingOptions copyWithZone:](self->_cyclingOptions, "copyWithZone:", a3);
  v82 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v81;

  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
  {
    *(_DWORD *)(v5 + 672) = self->_ratingsCount;
    *(_QWORD *)(v5 + 756) |= 0x80000uLL;
  }
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v83 = self->_evChargingPorts;
  v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
  if (v84)
  {
    v85 = *(_QWORD *)v125;
    do
    {
      for (n = 0; n != v84; ++n)
      {
        if (*(_QWORD *)v125 != v85)
          objc_enumerationMutation(v83);
        v87 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v124 + 1) + 8 * n), "copyWithZone:", a3, (_QWORD)v124);
        objc_msgSend((id)v5, "addEvChargingPort:", v87);

      }
      v84 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v83, "countByEnumeratingWithState:objects:count:", &v124, v144, 16);
    }
    while (v84);
  }

  if ((*((_BYTE *)&self->_flags + 5) & 8) != 0)
  {
    *(_BYTE *)(v5 + 735) = self->_isWidgetRequest;
    *(_QWORD *)(v5 + 756) |= 0x80000000000uLL;
  }
  PBRepeatedInt32Copy();
  v88 = &self->_flags;
  v89 = (uint64_t)self->_flags;
  if ((v89 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 624) = self->_auxiliaryTierNumResults;
    *(_QWORD *)(v5 + 756) |= 0x80uLL;
    v89 = *(_QWORD *)v88;
    if ((*(_QWORD *)v88 & 0x40000) == 0)
    {
LABEL_102:
      if ((v89 & 8) == 0)
        goto LABEL_104;
      goto LABEL_103;
    }
  }
  else if ((v89 & 0x40000) == 0)
  {
    goto LABEL_102;
  }
  *(_DWORD *)(v5 + 668) = self->_placeSummaryRevision;
  *(_QWORD *)(v5 + 756) |= 0x40000uLL;
  if ((*(_QWORD *)&self->_flags & 8) != 0)
  {
LABEL_103:
    *(double *)(v5 + 448) = self->_isTourist;
    *(_QWORD *)(v5 + 756) |= 8uLL;
  }
LABEL_104:
  PBRepeatedInt32Copy();
  v90 = (uint64_t)self->_flags;
  if ((v90 & 0x4000000000000) != 0)
  {
    *(_BYTE *)(v5 + 742) = self->_supportAutocompletePublisherResults;
    *(_QWORD *)(v5 + 756) |= 0x4000000000000uLL;
    v90 = (uint64_t)self->_flags;
  }
  if ((v90 & 0x2000000000000) != 0)
  {
    *(_BYTE *)(v5 + 741) = self->_supportAutocompleteGuideResults;
    *(_QWORD *)(v5 + 756) |= 0x2000000000000uLL;
  }
  v91 = -[GEOPDViewportInfo copyWithZone:](self->_previousSearchViewport, "copyWithZone:", a3, (_QWORD)v124);
  v92 = *(void **)(v5 + 480);
  *(_QWORD *)(v5 + 480) = v91;

  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    *(_DWORD *)(v5 + 660) = self->_photoAlbumCount;
    *(_QWORD *)(v5 + 756) |= 0x10000uLL;
  }
  v93 = -[GEOPDResultRefinementQuery copyWithZone:](self->_resultRefinementQuery, "copyWithZone:", a3);
  v94 = *(void **)(v5 + 512);
  *(_QWORD *)(v5 + 512) = v93;

  v95 = (uint64_t)self->_flags;
  if ((v95 & 0x100000) != 0)
  {
    *(_DWORD *)(v5 + 676) = self->_relatedPlaceItemCount;
    *(_QWORD *)(v5 + 756) |= 0x100000uLL;
    v95 = (uint64_t)self->_flags;
  }
  if ((v95 & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 700) = self->_searchRequestType;
    *(_QWORD *)(v5 + 756) |= 0x4000000uLL;
  }
  v96 = -[NSString copyWithZone:](self->_currentLocaleCurrencySymbol, "copyWithZone:", a3);
  v97 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v96;

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 620) = self->_autocompleteOriginationType;
    *(_QWORD *)(v5 + 756) |= 0x40uLL;
  }
  v98 = -[GEOLatLng copyWithZone:](self->_autocompleteOriginationPreviousLatlng, "copyWithZone:", a3);
  v99 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v98;

  if ((*((_BYTE *)&self->_flags + 3) & 8) != 0)
  {
    *(_DWORD *)(v5 + 704) = self->_searchOriginationType;
    *(_QWORD *)(v5 + 756) |= 0x8000000uLL;
  }
  v100 = -[GEOLatLng copyWithZone:](self->_searchOriginationPreviousLatlng, "copyWithZone:", a3);
  v101 = *(void **)(v5 + 536);
  *(_QWORD *)(v5 + 536) = v100;

  v102 = -[GEOAddStopRouteInfo copyWithZone:](self->_addStopRouteInfo, "copyWithZone:", a3);
  v103 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v102;

  v104 = &self->_flags;
  v105 = (uint64_t)self->_flags;
  if ((v105 & 0x400000000) != 0)
  {
    *(_BYTE *)(v5 + 726) = self->_autocompleteOriginationEditingServerWaypoints;
    *(_QWORD *)(v5 + 756) |= 0x400000000uLL;
    v105 = *(_QWORD *)v104;
    if ((*(_QWORD *)v104 & 0x1000000000000) == 0)
    {
LABEL_120:
      if ((v105 & 0x10000000000000) == 0)
        goto LABEL_122;
      goto LABEL_121;
    }
  }
  else if ((v105 & 0x1000000000000) == 0)
  {
    goto LABEL_120;
  }
  *(_BYTE *)(v5 + 740) = self->_searchOriginationEditingServerWaypoints;
  *(_QWORD *)(v5 + 756) |= 0x1000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x10000000000000) != 0)
  {
LABEL_121:
    *(_BYTE *)(v5 + 744) = self->_supportClientRankingCompositeFeatures;
    *(_QWORD *)(v5 + 756) |= 0x10000000000000uLL;
  }
LABEL_122:
  v106 = -[GEOPrivacyMetadata copyWithZone:](self->_privacyMetadata, "copyWithZone:", a3);
  v107 = *(void **)(v5 + 488);
  *(_QWORD *)(v5 + 488) = v106;

  v108 = &self->_flags;
  v109 = (uint64_t)self->_flags;
  if ((v109 & 0x2000000) == 0)
  {
    if ((v109 & 0x200000000000000) == 0)
      goto LABEL_124;
LABEL_173:
    *(_BYTE *)(v5 + 749) = self->_supportStructuredRapAffordance;
    *(_QWORD *)(v5 + 756) |= 0x200000000000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x20000000000) == 0)
      goto LABEL_126;
    goto LABEL_125;
  }
  *(_DWORD *)(v5 + 696) = self->_routeStopCount;
  *(_QWORD *)(v5 + 756) |= 0x2000000uLL;
  v109 = *(_QWORD *)v108;
  if ((*(_QWORD *)v108 & 0x200000000000000) != 0)
    goto LABEL_173;
LABEL_124:
  if ((v109 & 0x20000000000) != 0)
  {
LABEL_125:
    *(_BYTE *)(v5 + 733) = self->_isRoutePlanningEditStopFillRequest;
    *(_QWORD *)(v5 + 756) |= 0x20000000000uLL;
  }
LABEL_126:
  PBRepeatedUInt64Copy();
  v110 = (uint64_t)self->_flags;
  if ((v110 & 0x100000000000) != 0)
  {
    *(_BYTE *)(v5 + 736) = self->_isWithinHikingBoundary;
    *(_QWORD *)(v5 + 756) |= 0x100000000000uLL;
    v110 = (uint64_t)self->_flags;
  }
  if ((v110 & 0x200000000000) != 0)
  {
    *(_BYTE *)(v5 + 737) = self->_isWithinHikingBufferRegion;
    *(_QWORD *)(v5 + 756) |= 0x200000000000uLL;
  }
  v111 = -[GEOSearchImplicitFilterInfo copyWithZone:](self->_searchImplicitFilterInfo, "copyWithZone:", a3);
  v112 = *(void **)(v5 + 528);
  *(_QWORD *)(v5 + 528) = v111;

  v113 = (uint64_t)self->_flags;
  if ((v113 & 0x1000) != 0)
  {
    *(_DWORD *)(v5 + 644) = self->_devicePlatform;
    *(_QWORD *)(v5 + 756) |= 0x1000uLL;
    v113 = (uint64_t)self->_flags;
  }
  if ((v113 & 0x1000000000) != 0)
  {
    *(_BYTE *)(v5 + 728) = self->_containsSensitiveData;
    *(_QWORD *)(v5 + 756) |= 0x1000000000uLL;
  }
  v114 = -[NSString copyWithZone:](self->_spotlightSearchPunchinEncodedString, "copyWithZone:", a3);
  v115 = *(void **)(v5 + 552);
  *(_QWORD *)(v5 + 552) = v114;

  if ((*((_BYTE *)&self->_flags + 5) & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 739) = self->_optimizeSearchRequestComponents;
    *(_QWORD *)(v5 + 756) |= 0x800000000000uLL;
  }
  v116 = -[GEOPDAutocompleteSessionData copyWithZone:](self->_recentAutocompleteSessionData, "copyWithZone:", a3);
  v117 = *(void **)(v5 + 504);
  *(_QWORD *)(v5 + 504) = v116;

  if ((*((_BYTE *)&self->_flags + 4) & 1) != 0)
  {
    *(_BYTE *)(v5 + 724) = self->_analyticsOptOut;
    *(_QWORD *)(v5 + 756) |= 0x100000000uLL;
  }
  v118 = -[GEOPDSSessionUserActionMetadata copyWithZone:](self->_userActionMetadata, "copyWithZone:", a3);
  v119 = *(void **)(v5 + 584);
  *(_QWORD *)(v5 + 584) = v118;

  if ((*((_BYTE *)&self->_flags + 7) & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 753) = self->_wantsRouteCreationTip;
    *(_QWORD *)(v5 + 756) |= 0x2000000000000000uLL;
  }
  v120 = -[NSString copyWithZone:](self->_hardwareIdentifier, "copyWithZone:", a3);
  v121 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v120;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  v122 = (id)v5;
LABEL_141:

  return (id)v5;
}

- (NSMutableArray)photoSizes
{
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  return self->_photoSizes;
}

- (void)addPhotoSizes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsPhotoSizes:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x20000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_readPhotoSizes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoSizes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_addNoFlagsPhotoSizes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 472);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 472);
      *(_QWORD *)(a1 + 472) = v5;

      v4 = *(void **)(a1 + 472);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addDeviceDisplayLanguage:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsDeviceDisplayLanguage:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_addNoFlagsDeviceDisplayLanguage:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 392);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 392);
      *(_QWORD *)(a1 + 392) = v5;

      v4 = *(void **)(a1 + 392);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (GEOMapServiceTraits)init
{
  GEOMapServiceTraits *v2;
  GEOMapServiceTraits *v3;
  GEOMapServiceTraits *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOMapServiceTraits;
  v2 = -[GEOMapServiceTraits init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)addReviewUserPhotoSizes:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsReviewUserPhotoSizes:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x800000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (NSMutableArray)reviewUserPhotoSizes
{
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  return self->_reviewUserPhotoSizes;
}

- (void)_readReviewUserPhotoSizes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReviewUserPhotoSizes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)_addNoFlagsReviewUserPhotoSizes:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 520);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 520);
      *(_QWORD *)(a1 + 520) = v5;

      v4 = *(void **)(a1 + 520);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)setAppIdentifier:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000000800uLL;
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (void)setTransitScheduleFilter:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x210000000000uLL;
  objc_storeStrong((id *)&self->_transitScheduleFilter, a3);
}

- (void)setReviewUserPhotosCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_reviewUserPhotosCount = a3;
}

- (void)setRelatedPlaceItemCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_relatedPlaceItemCount = a3;
}

- (void)setRatingsCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_ratingsCount = a3;
}

- (void)setPhotosCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_photosCount = a3;
}

- (void)setPhotoAlbumCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_photoAlbumCount = a3;
}

- (void)setDeviceDisplayLanguages:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *deviceDisplayLanguages;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x200000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  deviceDisplayLanguages = self->_deviceDisplayLanguages;
  self->_deviceDisplayLanguages = v4;

}

- (BOOL)hasReviewUserPhotosCount
{
  return *((_BYTE *)&self->_flags + 3) & 1;
}

- (BOOL)hasRelatedPlaceItemCount
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 4) & 1;
}

- (BOOL)hasRatingsCount
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 3) & 1;
}

- (BOOL)hasPhotosCount
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 1) & 1;
}

- (BOOL)hasPhotoAlbumCount
{
  return *((_BYTE *)&self->_flags + 2) & 1;
}

- (void)addSupportedAutocompleteListType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readSupportedAutocompleteListTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (void)_readSupportedAutocompleteListTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedAutocompleteListTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void)setAppMinorVersion:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000002000uLL;
  objc_storeStrong((id *)&self->_appMinorVersion, a3);
}

- (void)setAppMajorVersion:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000001000uLL;
  objc_storeStrong((id *)&self->_appMajorVersion, a3);
}

- (int)requestMode
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000) != 0)
    return self->_requestMode;
  else
    return 0;
}

- (void)updateAnalyticsShortSession
{
  void *v3;
  _QWORD v4[5];

  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__GEOMapServiceTraits_GEOUserSession__updateAnalyticsShortSession__block_invoke;
  v4[3] = &unk_1E1C04548;
  v4[4] = self;
  objc_msgSend(v3, "shortSessionValues:", v4);

}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOMapServiceTraits;
  -[GEOMapServiceTraits dealloc](&v3, sel_dealloc);
}

- (int)requestPurpose
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800000) != 0)
    return self->_requestPurpose;
  else
    return 0;
}

- (unsigned)httpRequestPriority
{
  return self->_httpRequestPriority;
}

- (BOOL)hasHttpRequestPriority
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 5) & 1;
}

- (NSString)analyticsAppIdentifier
{
  -[GEOMapServiceTraits _readAnalyticsAppIdentifier]((uint64_t)self);
  return self->_analyticsAppIdentifier;
}

- (void)_readAnalyticsAppIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnalyticsAppIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingOptions, 0);
  objc_storeStrong((id *)&self->_venueIdentifier, 0);
  objc_storeStrong((id *)&self->_userActionMetadata, 0);
  objc_storeStrong((id *)&self->_transitTripStopTimeFilter, 0);
  objc_storeStrong((id *)&self->_transitScheduleFilter, 0);
  objc_storeStrong((id *)&self->_transitOptions, 0);
  objc_storeStrong((id *)&self->_spotlightSearchPunchinEncodedString, 0);
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, 0);
  objc_storeStrong((id *)&self->_searchImplicitFilterInfo, 0);
  objc_storeStrong((id *)&self->_reviewUserPhotoSizes, 0);
  objc_storeStrong((id *)&self->_resultRefinementQuery, 0);
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_previousSearchViewport, 0);
  objc_storeStrong((id *)&self->_photoSizes, 0);
  objc_storeStrong((id *)&self->_mapRegion, 0);
  objc_storeStrong((id *)&self->_historicalLocations, 0);
  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_evChargingPorts, 0);
  objc_storeStrong((id *)&self->_displayRegion, 0);
  objc_storeStrong((id *)&self->_deviceSpokenLocale, 0);
  objc_storeStrong((id *)&self->_deviceKeyboardLocale, 0);
  objc_storeStrong((id *)&self->_deviceDisplayLanguages, 0);
  objc_storeStrong((id *)&self->_deviceLocation, 0);
  objc_storeStrong((id *)&self->_cyclingOptions, 0);
  objc_storeStrong((id *)&self->_currentLocaleCurrencySymbol, 0);
  objc_storeStrong((id *)&self->_carHeadunitModel, 0);
  objc_storeStrong((id *)&self->_carHeadunitManufacturer, 0);
  objc_storeStrong((id *)&self->_automobileOptions, 0);
  objc_storeStrong((id *)&self->_autocompleteOriginationPreviousLatlng, 0);
  objc_storeStrong((id *)&self->_appMinorVersion, 0);
  objc_storeStrong((id *)&self->_appMajorVersion, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_analyticsAppIdentifier, 0);
  objc_storeStrong((id *)&self->_addStopRouteInfo, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;
  unint64_t v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  NSMutableArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  PBDataReader *v53;
  void *v54;
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
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOMapServiceTraitsIsDirty((uint64_t)self) & 1) == 0)
  {
    v53 = self->_reader;
    objc_sync_enter(v53);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v54);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v53);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOMapServiceTraits readAll:](self, "readAll:", 0);
    flags = (uint64_t)self->_flags;
    if ((flags & 1) != 0)
    {
      v75 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      flags = (uint64_t)self->_flags;
    }
    if ((flags & 0x10000000) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_appIdentifier)
      PBDataWriterWriteStringField();
    if (self->_appMajorVersion)
      PBDataWriterWriteStringField();
    if (self->_appMinorVersion)
      PBDataWriterWriteStringField();
    if (self->_deviceLocation)
      PBDataWriterWriteSubmessage();
    if (self->_transportTypes.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_transportTypes.count);
    }
    if (self->_mapRegion)
      PBDataWriterWriteSubmessage();
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v8 = self->_deviceDisplayLanguages;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v72;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v72 != v10)
            objc_enumerationMutation(v8);
          PBDataWriterWriteStringField();
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v71, v80, 16);
      }
      while (v9);
    }

    if (self->_deviceKeyboardLocale)
      PBDataWriterWriteStringField();
    if (self->_deviceSpokenLocale)
      PBDataWriterWriteStringField();
    v12 = (uint64_t)self->_flags;
    if ((v12 & 0x8000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v12 = (uint64_t)self->_flags;
    }
    if ((v12 & 0x20000000) != 0)
      PBDataWriterWriteInt32Field();
    v69 = 0u;
    v70 = 0u;
    v67 = 0u;
    v68 = 0u;
    v13 = self->_photoSizes;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v68;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v68 != v15)
            objc_enumerationMutation(v13);
          PBDataWriterWriteSubmessage();
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v67, v79, 16);
      }
      while (v14);
    }

    if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
      PBDataWriterWriteUint32Field();
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v17 = self->_reviewUserPhotoSizes;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v64;
      do
      {
        for (k = 0; k != v18; ++k)
        {
          if (*(_QWORD *)v64 != v19)
            objc_enumerationMutation(v17);
          PBDataWriterWriteSubmessage();
        }
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v63, v78, 16);
      }
      while (v18);
    }

    v21 = (uint64_t)self->_flags;
    if ((v21 & 0x1000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v21 = (uint64_t)self->_flags;
    }
    if ((v21 & 0x40000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v21 = (uint64_t)self->_flags;
    }
    if ((v21 & 0x80000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v21 = (uint64_t)self->_flags;
    }
    if ((v21 & 0x200) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_carHeadunitManufacturer)
      PBDataWriterWriteStringField();
    if (self->_carHeadunitModel)
      PBDataWriterWriteStringField();
    v22 = (uint64_t)self->_flags;
    if ((v22 & 4) != 0)
    {
      PBDataWriterWriteDoubleField();
      v22 = (uint64_t)self->_flags;
    }
    if ((v22 & 2) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_transitScheduleFilter)
      PBDataWriterWriteSubmessage();
    v23 = (uint64_t)self->_flags;
    if ((v23 & 0x10) != 0)
    {
      PBDataWriterWriteDoubleField();
      v23 = (uint64_t)self->_flags;
    }
    if ((v23 & 0x4000) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_displayRegion)
      PBDataWriterWriteStringField();
    if (self->_providerID)
      PBDataWriterWriteStringField();
    v24 = (uint64_t)self->_flags;
    if ((v24 & 0x800) != 0)
    {
      PBDataWriterWriteInt32Field();
      v24 = (uint64_t)self->_flags;
    }
    if ((v24 & 0x400) != 0)
    {
      PBDataWriterWriteInt32Field();
      v24 = (uint64_t)self->_flags;
    }
    if ((v24 & 0x100) != 0)
    {
      PBDataWriterWriteInt32Field();
      v24 = (uint64_t)self->_flags;
    }
    if ((v24 & 0x400000000000) != 0)
      PBDataWriterWriteBOOLField();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v25 = self->_historicalLocations;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v60;
      do
      {
        for (m = 0; m != v26; ++m)
        {
          if (*(_QWORD *)v60 != v27)
            objc_enumerationMutation(v25);
          PBDataWriterWriteSubmessage();
        }
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v59, v77, 16);
      }
      while (v26);
    }

    if (self->_automobileOptions)
      PBDataWriterWriteSubmessage();
    if (self->_transitOptions)
      PBDataWriterWriteSubmessage();
    if (self->_walkingOptions)
      PBDataWriterWriteSubmessage();
    if (self->_engineTypes.count)
    {
      v29 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v29;
      }
      while (v29 < self->_engineTypes.count);
    }
    v30 = (uint64_t)self->_flags;
    if ((v30 & 0x200000) != 0)
    {
      PBDataWriterWriteInt32Field();
      v30 = (uint64_t)self->_flags;
    }
    if ((v30 & 0x80000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v30 = (uint64_t)self->_flags;
    }
    if ((v30 & 0x100000000000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_knownClientResolvedTypes.count)
    {
      v31 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v31;
      }
      while (v31 < self->_knownClientResolvedTypes.count);
    }
    if ((*((_BYTE *)&self->_flags + 7) & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_venueIdentifier)
      PBDataWriterWriteSubmessage();
    v32 = (uint64_t)self->_flags;
    if ((v32 & 0x4000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v32 = (uint64_t)self->_flags;
    }
    if ((v32 & 0x400000) != 0)
    {
      PBDataWriterWriteInt32Field();
      v32 = (uint64_t)self->_flags;
    }
    if ((v32 & 0x2000) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_analyticsAppIdentifier)
      PBDataWriterWriteStringField();
    v33 = (uint64_t)self->_flags;
    if ((v33 & 0x20) != 0)
    {
      PBDataWriterWriteDoubleField();
      v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x40000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x400000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x2000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x200000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x800000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v33 = (uint64_t)self->_flags;
    }
    if ((v33 & 0x800000) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_supportedAutocompleteListTypes.count)
    {
      v34 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v34;
      }
      while (v34 < self->_supportedAutocompleteListTypes.count);
    }
    if ((*((_BYTE *)&self->_flags + 5) & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_transitTripStopTimeFilter)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 6) & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_supportedChildActions.count)
    {
      v35 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v35;
      }
      while (v35 < self->_supportedChildActions.count);
    }
    v36 = (uint64_t)self->_flags;
    if ((v36 & 0x8000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v36 = (uint64_t)self->_flags;
    }
    if ((v36 & 0x10000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v36 = (uint64_t)self->_flags;
    }
    if ((v36 & 0x800000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_supportedAutocompleteResultCellTypes.count)
    {
      v37 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v37;
      }
      while (v37 < self->_supportedAutocompleteResultCellTypes.count);
    }
    if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_cyclingOptions)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
      PBDataWriterWriteUint32Field();
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v38 = self->_evChargingPorts;
    v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
    if (v39)
    {
      v40 = *(_QWORD *)v56;
      do
      {
        for (n = 0; n != v39; ++n)
        {
          if (*(_QWORD *)v56 != v40)
            objc_enumerationMutation(v38);
          PBDataWriterWriteSubmessage();
        }
        v39 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v55, v76, 16);
      }
      while (v39);
    }

    if ((*((_BYTE *)&self->_flags + 5) & 8) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_supportedSearchTierTypes.count)
    {
      v42 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v42;
      }
      while (v42 < self->_supportedSearchTierTypes.count);
    }
    v43 = (uint64_t)self->_flags;
    if ((v43 & 0x80) != 0)
    {
      PBDataWriterWriteUint32Field();
      v43 = (uint64_t)self->_flags;
    }
    if ((v43 & 0x40000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v43 = (uint64_t)self->_flags;
    }
    if ((v43 & 8) != 0)
      PBDataWriterWriteDoubleField();
    if (self->_knownRefinementTypes.count)
    {
      v44 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v44;
      }
      while (v44 < self->_knownRefinementTypes.count);
    }
    v45 = (uint64_t)self->_flags;
    if ((v45 & 0x4000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v45 = (uint64_t)self->_flags;
    }
    if ((v45 & 0x2000000000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_previousSearchViewport)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_resultRefinementQuery)
      PBDataWriterWriteSubmessage();
    v46 = (uint64_t)self->_flags;
    if ((v46 & 0x100000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v46 = (uint64_t)self->_flags;
    }
    if ((v46 & 0x4000000) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_currentLocaleCurrencySymbol)
      PBDataWriterWriteStringField();
    if (self->_supportedPlaceSummaryFormatTypes.count)
    {
      v47 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v47;
      }
      while (v47 < self->_supportedPlaceSummaryFormatTypes.count);
    }
    if ((*(_BYTE *)&self->_flags & 0x40) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_autocompleteOriginationPreviousLatlng)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 3) & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_searchOriginationPreviousLatlng)
      PBDataWriterWriteSubmessage();
    if (self->_addStopRouteInfo)
      PBDataWriterWriteSubmessage();
    v48 = (uint64_t)self->_flags;
    if ((v48 & 0x400000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v48 = (uint64_t)self->_flags;
    }
    if ((v48 & 0x1000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v48 = (uint64_t)self->_flags;
    }
    if ((v48 & 0x10000000000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_privacyMetadata)
      PBDataWriterWriteSubmessage();
    v49 = (uint64_t)self->_flags;
    if ((v49 & 0x2000000) != 0)
    {
      PBDataWriterWriteUint32Field();
      v49 = (uint64_t)self->_flags;
    }
    if ((v49 & 0x200000000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v49 = (uint64_t)self->_flags;
    }
    if ((v49 & 0x20000000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_preferredBrands.count)
    {
      v50 = 0;
      do
      {
        PBDataWriterWriteUint64Field();
        ++v50;
      }
      while (v50 < self->_preferredBrands.count);
    }
    v51 = (uint64_t)self->_flags;
    if ((v51 & 0x100000000000) != 0)
    {
      PBDataWriterWriteBOOLField();
      v51 = (uint64_t)self->_flags;
    }
    if ((v51 & 0x200000000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_searchImplicitFilterInfo)
      PBDataWriterWriteSubmessage();
    v52 = (uint64_t)self->_flags;
    if ((v52 & 0x1000) != 0)
    {
      PBDataWriterWriteInt32Field();
      v52 = (uint64_t)self->_flags;
    }
    if ((v52 & 0x1000000000) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_spotlightSearchPunchinEncodedString)
      PBDataWriterWriteStringField();
    if ((*((_BYTE *)&self->_flags + 5) & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_recentAutocompleteSessionData)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 4) & 1) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_userActionMetadata)
      PBDataWriterWriteSubmessage();
    if ((*((_BYTE *)&self->_flags + 7) & 0x20) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_hardwareIdentifier)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v55);
  }

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
      v8 = (int *)&readAll__recursiveTag_1504;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1505;
    GEOMapServiceTraitsReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOMapServiceTraitsCallReadAllRecursiveWithoutSynchronized((uint64_t)self);
  os_unfair_lock_unlock(p_readerLock);
}

- (BOOL)useBackgroundUrl
{
  return -[GEOMapServiceTraits requestPriority](self, "requestPriority") == 1;
}

- (void)useOnlineToOfflineFailoverRequestModeIfAllowed
{
  BOOL v3;
  void *v4;
  char v5;
  int v6;
  void *v7;

  +[GEOOfflineService sharedNoCreate](GEOOfflineService, "sharedNoCreate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[GEOMapServiceTraits hasRequestMode](self, "hasRequestMode");
  v4 = v7;
  if (!v3)
  {
    if (v7)
    {
      v5 = objc_msgSend(v7, "isUsingOffline");
      v4 = v7;
      if ((v5 & 1) == 0)
      {
        v6 = objc_msgSend(+[GEOOfflineService stateManagerClass](), "isOfflineAvailable");
        v4 = v7;
        if (v6)
        {
          -[GEOMapServiceTraits setRequestMode:](self, "setRequestMode:", 1);
          v4 = v7;
        }
      }
    }
  }

}

- (void)setHasSessionId:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_QWORD *)&self->_flags + 1) = v3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x10000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceLocation
{
  -[GEOMapServiceTraits _readDeviceLocation]((uint64_t)self);
  return self->_deviceLocation != 0;
}

- (void)setDeviceLocation:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000100000uLL;
  objc_storeStrong((id *)&self->_deviceLocation, a3);
}

- (void)_readTransportTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransportTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)transportTypesCount
{
  -[GEOMapServiceTraits _readTransportTypes]((uint64_t)self);
  return self->_transportTypes.count;
}

- (int)transportTypes
{
  -[GEOMapServiceTraits _readTransportTypes]((uint64_t)self);
  return self->_transportTypes.list;
}

- (void)clearTransportTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x100uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addTransportType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readTransportTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x100uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)transportTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_transportTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readTransportTypes]((uint64_t)self);
  p_transportTypes = &self->_transportTypes;
  count = self->_transportTypes.count;
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
  return p_transportTypes->list[a3];
}

- (void)setTransportTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x100uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)transportTypesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0FCA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTransportTypes:(id)a3
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

- (GEOMapRegion)mapRegion
{
  -[GEOMapServiceTraits _readMapRegion]((uint64_t)self);
  return self->_mapRegion;
}

- (void)setMapRegion:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200010000000uLL;
  objc_storeStrong((id *)&self->_mapRegion, a3);
}

- (id)deviceDisplayLanguageAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readDeviceDisplayLanguages]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_deviceDisplayLanguages, "objectAtIndex:", a3);
}

+ (Class)deviceDisplayLanguageType
{
  return (Class)objc_opt_class();
}

- (NSString)deviceKeyboardLocale
{
  -[GEOMapServiceTraits _readDeviceKeyboardLocale]((uint64_t)self);
  return self->_deviceKeyboardLocale;
}

- (void)setDeviceKeyboardLocale:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000400000uLL;
  objc_storeStrong((id *)&self->_deviceKeyboardLocale, a3);
}

- (NSString)deviceSpokenLocale
{
  -[GEOMapServiceTraits _readDeviceSpokenLocale]((uint64_t)self);
  return self->_deviceSpokenLocale;
}

- (void)setDeviceSpokenLocale:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000800000uLL;
  objc_storeStrong((id *)&self->_deviceSpokenLocale, a3);
}

- (void)setHasIsAPICall:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x8000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsAPICall
{
  return *((unsigned __int8 *)&self->_flags + 4) >> 7;
}

- (int)source
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20000000) != 0)
    return self->_source;
  else
    return 0;
}

- (void)setSource:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_source = a3;
}

- (void)setHasSource:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (id)sourceAsString:(int)a3
{
  if (a3 < 0x18)
    return off_1E1C0FA18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSource:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_SOURCE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFINEMENT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPELLING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_CONTACTS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_USER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_COMPLETION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_HINT_COMPLETION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HINT_HISTORY")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_HINT_HISTORY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STARK_AUTOCOMPLETE_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_FROM")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_TO")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_FROM")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TO")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOKMARK_REFRESH")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRELOADER")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NO_TYPING")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_TO_COLLECTION")) & 1) != 0)
  {
    v4 = 22;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_HINT_COMPLETION")))
  {
    v4 = 23;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setPhotoSizes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *photoSizes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x20000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  photoSizes = self->_photoSizes;
  self->_photoSizes = v4;

}

- (void)clearPhotoSizes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x20000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_photoSizes, "removeAllObjects");
}

- (unint64_t)photoSizesCount
{
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  return -[NSMutableArray count](self->_photoSizes, "count");
}

- (id)photoSizesAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readPhotoSizes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_photoSizes, "objectAtIndex:", a3);
}

+ (Class)photoSizesType
{
  return (Class)objc_opt_class();
}

- (void)setHasPhotosCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)setReviewUserPhotoSizes:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *reviewUserPhotoSizes;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x800000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;
  self->_reviewUserPhotoSizes = v4;

}

- (void)clearReviewUserPhotoSizes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x800000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_reviewUserPhotoSizes, "removeAllObjects");
}

- (unint64_t)reviewUserPhotoSizesCount
{
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  return -[NSMutableArray count](self->_reviewUserPhotoSizes, "count");
}

- (id)reviewUserPhotoSizesAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readReviewUserPhotoSizes]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_reviewUserPhotoSizes, "objectAtIndex:", a3);
}

+ (Class)reviewUserPhotoSizesType
{
  return (Class)objc_opt_class();
}

- (void)setHasReviewUserPhotosCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x1000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (unsigned)timeSinceMapEnteredForeground
{
  return self->_timeSinceMapEnteredForeground;
}

- (void)setTimeSinceMapEnteredForeground:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_timeSinceMapEnteredForeground = a3;
}

- (void)setHasTimeSinceMapEnteredForeground:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x40000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (unsigned)timeSinceMapViewportChanged
{
  return self->_timeSinceMapViewportChanged;
}

- (void)setTimeSinceMapViewportChanged:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_timeSinceMapViewportChanged = a3;
}

- (void)setHasTimeSinceMapViewportChanged:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x80000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasTimeSinceMapViewportChanged
{
  return *((unsigned __int8 *)&self->_flags + 3) >> 7;
}

- (int)carHeadunitInteractionModel
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200) != 0)
    return self->_carHeadunitInteractionModel;
  else
    return 1;
}

- (void)setCarHeadunitInteractionModel:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_carHeadunitInteractionModel = a3;
}

- (void)setHasCarHeadunitInteractionModel:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 512;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitInteractionModel
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)carHeadunitInteractionModelAsString:(int)a3
{
  if ((a3 - 1) < 3)
    return off_1E1C0FAD8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCarHeadunitInteractionModel:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_HIFI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_LOFI")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_PHYSICAL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)_readCarHeadunitManufacturer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCarHeadunitManufacturer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasCarHeadunitManufacturer
{
  -[GEOMapServiceTraits _readCarHeadunitManufacturer]((uint64_t)self);
  return self->_carHeadunitManufacturer != 0;
}

- (NSString)carHeadunitManufacturer
{
  -[GEOMapServiceTraits _readCarHeadunitManufacturer]((uint64_t)self);
  return self->_carHeadunitManufacturer;
}

- (void)setCarHeadunitManufacturer:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000010000uLL;
  objc_storeStrong((id *)&self->_carHeadunitManufacturer, a3);
}

- (void)_readCarHeadunitModel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCarHeadunitModel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasCarHeadunitModel
{
  -[GEOMapServiceTraits _readCarHeadunitModel]((uint64_t)self);
  return self->_carHeadunitModel != 0;
}

- (NSString)carHeadunitModel
{
  -[GEOMapServiceTraits _readCarHeadunitModel]((uint64_t)self);
  return self->_carHeadunitModel;
}

- (void)setCarHeadunitModel:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000020000uLL;
  objc_storeStrong((id *)&self->_carHeadunitModel, a3);
}

- (double)carHeadunitPixelWidth
{
  return self->_carHeadunitPixelWidth;
}

- (void)setCarHeadunitPixelWidth:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_carHeadunitPixelWidth = a3;
}

- (void)setHasCarHeadunitPixelWidth:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 4;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitPixelWidth
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (double)carHeadunitPixelHeight
{
  return self->_carHeadunitPixelHeight;
}

- (void)setCarHeadunitPixelHeight:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_carHeadunitPixelHeight = a3;
}

- (void)setHasCarHeadunitPixelHeight:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 2;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitPixelHeight
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (double)mapZoomLevel
{
  return self->_mapZoomLevel;
}

- (void)setMapZoomLevel:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_mapZoomLevel = a3;
}

- (void)setHasMapZoomLevel:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 16;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasMapZoomLevel
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (int)mode
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000) != 0)
    return self->_mode;
  else
    return 0;
}

- (void)setMode:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasMode
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 6) & 1;
}

- (id)modeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FAF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readProviderID
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProviderID_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasProviderID
{
  -[GEOMapServiceTraits _readProviderID]((uint64_t)self);
  return self->_providerID != 0;
}

- (NSString)providerID
{
  -[GEOMapServiceTraits _readProviderID]((uint64_t)self);
  return self->_providerID;
}

- (void)setProviderID:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200100000000uLL;
  objc_storeStrong((id *)&self->_providerID, a3);
}

- (int)deviceInterfaceOrientation
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800) != 0)
    return self->_deviceInterfaceOrientation;
  else
    return 0;
}

- (void)setDeviceInterfaceOrientation:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_deviceInterfaceOrientation = a3;
}

- (void)setHasDeviceInterfaceOrientation:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 2048;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceInterfaceOrientation
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
}

- (id)deviceInterfaceOrientationAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FB18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceInterfaceOrientation:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_PORTRAIT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_LANDSCAPE_LEFT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_LANDSCAPE_RIGHT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)deviceBatteryState
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400) != 0)
    return self->_deviceBatteryState;
  else
    return 0;
}

- (void)setDeviceBatteryState:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_deviceBatteryState = a3;
}

- (void)setHasDeviceBatteryState:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 1024;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceBatteryState
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (id)deviceBatteryStateAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0FB40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDeviceBatteryState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_UNPLUGGED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_CHARGING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)carHeadunitConnectionType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100) != 0)
    return self->_carHeadunitConnectionType;
  else
    return 0;
}

- (void)setCarHeadunitConnectionType:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_carHeadunitConnectionType = a3;
}

- (void)setHasCarHeadunitConnectionType:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 256;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasCarHeadunitConnectionType
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (id)carHeadunitConnectionTypeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0FB60[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCarHeadunitConnectionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTION_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTION_CABLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTION_WIRELESS")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setNavigating:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_navigating = a3;
}

- (void)setHasNavigating:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x400000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasNavigating
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 6) & 1;
}

- (void)setHistoricalLocations:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *historicalLocations;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x8000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  historicalLocations = self->_historicalLocations;
  self->_historicalLocations = v4;

}

- (void)clearHistoricalLocations
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x8000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_historicalLocations, "removeAllObjects");
}

- (void)addHistoricalLocations:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsHistoricalLocations:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x8000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_addNoFlagsHistoricalLocations:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 440);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 440);
      *(_QWORD *)(a1 + 440) = v5;

      v4 = *(void **)(a1 + 440);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)historicalLocationsCount
{
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  return -[NSMutableArray count](self->_historicalLocations, "count");
}

- (id)historicalLocationsAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_historicalLocations, "objectAtIndex:", a3);
}

+ (Class)historicalLocationsType
{
  return (Class)objc_opt_class();
}

- (void)_readAutomobileOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutomobileOptions_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAutomobileOptions
{
  -[GEOMapServiceTraits _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions != 0;
}

- (GEOAutomobileOptions)automobileOptions
{
  -[GEOMapServiceTraits _readAutomobileOptions]((uint64_t)self);
  return self->_automobileOptions;
}

- (void)setAutomobileOptions:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000008000uLL;
  objc_storeStrong((id *)&self->_automobileOptions, a3);
}

- (void)_readTransitOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitOptions_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasTransitOptions
{
  -[GEOMapServiceTraits _readTransitOptions]((uint64_t)self);
  return self->_transitOptions != 0;
}

- (GEOTransitOptions)transitOptions
{
  -[GEOMapServiceTraits _readTransitOptions]((uint64_t)self);
  return self->_transitOptions;
}

- (void)setTransitOptions:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x208000000000uLL;
  objc_storeStrong((id *)&self->_transitOptions, a3);
}

- (void)_readWalkingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 769) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWalkingOptions_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasWalkingOptions
{
  -[GEOMapServiceTraits _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions != 0;
}

- (GEOWalkingOptions)walkingOptions
{
  -[GEOMapServiceTraits _readWalkingOptions]((uint64_t)self);
  return self->_walkingOptions;
}

- (void)setWalkingOptions:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x300000000000uLL;
  objc_storeStrong((id *)&self->_walkingOptions, a3);
}

- (void)_readEngineTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 763) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEngineTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)engineTypesCount
{
  -[GEOMapServiceTraits _readEngineTypes]((uint64_t)self);
  return self->_engineTypes.count;
}

- (int)engineTypes
{
  -[GEOMapServiceTraits _readEngineTypes]((uint64_t)self);
  return self->_engineTypes.list;
}

- (void)clearEngineTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addEngineType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readEngineTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *(_QWORD *)p_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)engineTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_engineTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readEngineTypes]((uint64_t)self);
  p_engineTypes = &self->_engineTypes;
  count = self->_engineTypes.count;
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
  return p_engineTypes->list[a3];
}

- (void)setEngineTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)engineTypesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FB78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEngineTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_GASOLINE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_DIESEL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_ELECTRIC")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_CNG")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRequestMode:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_requestMode = a3;
}

- (void)setHasRequestMode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x200000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasRequestMode
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 5) & 1;
}

- (id)requestModeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FBA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONLINE_OFFLINE_FAILOVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONLINE_FAST_FAIL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ONLINE_ONLY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_ONLY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportDirectionIntentSearch
{
  return self->_supportDirectionIntentSearch;
}

- (void)setSupportDirectionIntentSearch:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportDirectionIntentSearch = a3;
}

- (void)setHasSupportDirectionIntentSearch:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x80000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFF7FFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportDirectionIntentSearch
{
  return *((unsigned __int8 *)&self->_flags + 6) >> 7;
}

- (BOOL)supportDymSuggestion
{
  return self->_supportDymSuggestion;
}

- (void)setSupportDymSuggestion:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportDymSuggestion = a3;
}

- (void)setHasSupportDymSuggestion:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x100000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFEFFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportDymSuggestion
{
  return *((_BYTE *)&self->_flags + 7) & 1;
}

- (void)clearKnownClientResolvedTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 1uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addKnownClientResolvedType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readKnownClientResolvedTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 1uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)knownClientResolvedTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_knownClientResolvedTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readKnownClientResolvedTypes]((uint64_t)self);
  p_knownClientResolvedTypes = &self->_knownClientResolvedTypes;
  count = self->_knownClientResolvedTypes.count;
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
  return p_knownClientResolvedTypes->list[a3];
}

- (void)setKnownClientResolvedTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 1uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)knownClientResolvedTypesAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0FBC8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKnownClientResolvedTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)wantsBrandIcon
{
  return self->_wantsBrandIcon;
}

- (void)setWantsBrandIcon:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_wantsBrandIcon = a3;
}

- (void)setHasWantsBrandIcon:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x1000000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xEFFFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasWantsBrandIcon
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 4) & 1;
}

- (void)_readVenueIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 769) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVenueIdentifier_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasVenueIdentifier
{
  -[GEOMapServiceTraits _readVenueIdentifier]((uint64_t)self);
  return self->_venueIdentifier != 0;
}

- (GEOPDVenueIdentifier)venueIdentifier
{
  -[GEOMapServiceTraits _readVenueIdentifier]((uint64_t)self);
  return self->_venueIdentifier;
}

- (void)setVenueIdentifier:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x280000000000uLL;
  objc_storeStrong((id *)&self->_venueIdentifier, a3);
}

- (BOOL)deviceInVehicle
{
  return self->_deviceInVehicle;
}

- (void)setDeviceInVehicle:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_deviceInVehicle = a3;
}

- (void)setHasDeviceInVehicle:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x4000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceInVehicle
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 6) & 1;
}

- (int)requestPriority
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400000) != 0)
    return self->_requestPriority;
  else
    return 0;
}

- (void)setRequestPriority:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_requestPriority = a3;
}

- (void)setHasRequestPriority:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x400000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasRequestPriority
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 6) & 1;
}

- (id)requestPriorityAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0FC00[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRequestPriority:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BACKGROUND")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("USER_INITIATED")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setHasHttpRequestPriority:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAnalyticsAppIdentifier
{
  -[GEOMapServiceTraits _readAnalyticsAppIdentifier]((uint64_t)self);
  return self->_analyticsAppIdentifier != 0;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 32;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)supportDirectionIntentAutocomplete
{
  return self->_supportDirectionIntentAutocomplete;
}

- (void)setSupportDirectionIntentAutocomplete:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportDirectionIntentAutocomplete = a3;
}

- (void)setHasSupportDirectionIntentAutocomplete:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x40000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFBFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportDirectionIntentAutocomplete
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 6) & 1;
}

- (BOOL)supportUnresolvedDirectionIntent
{
  return self->_supportUnresolvedDirectionIntent;
}

- (void)setSupportUnresolvedDirectionIntent:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportUnresolvedDirectionIntent = a3;
}

- (void)setHasSupportUnresolvedDirectionIntent:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x400000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportUnresolvedDirectionIntent
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 2) & 1;
}

- (BOOL)deviceDarkMode
{
  return self->_deviceDarkMode;
}

- (void)setDeviceDarkMode:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_deviceDarkMode = a3;
}

- (void)setHasDeviceDarkMode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x2000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDeviceDarkMode
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 5) & 1;
}

- (BOOL)appDarkMode
{
  return self->_appDarkMode;
}

- (void)setAppDarkMode:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_appDarkMode = a3;
}

- (void)setHasAppDarkMode:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAppDarkMode
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 1) & 1;
}

- (BOOL)supportsBrandFallback
{
  return self->_supportsBrandFallback;
}

- (void)setHasSupportsBrandFallback:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x800000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xF7FFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportsBrandFallback
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 3) & 1;
}

- (void)setRequestPurpose:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_requestPurpose = a3;
}

- (void)setHasRequestPurpose:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasRequestPurpose
{
  return *((unsigned __int8 *)&self->_flags + 2) >> 7;
}

- (id)requestPurposeAsString:(int)a3
{
  __CFString *v3;

  if (!a3)
    return CFSTR("UNKNOWN");
  if (a3 == 1)
  {
    v3 = CFSTR("ROUTE_WAYPOINT_RESOLUTION");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsRequestPurpose:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    v4 = 0;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_WAYPOINT_RESOLUTION"));

  return v4;
}

- (unint64_t)supportedAutocompleteListTypesCount
{
  -[GEOMapServiceTraits _readSupportedAutocompleteListTypes]((uint64_t)self);
  return self->_supportedAutocompleteListTypes.count;
}

- (int)supportedAutocompleteListTypes
{
  -[GEOMapServiceTraits _readSupportedAutocompleteListTypes]((uint64_t)self);
  return self->_supportedAutocompleteListTypes.list;
}

- (void)clearSupportedAutocompleteListTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (int)supportedAutocompleteListTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedAutocompleteListTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readSupportedAutocompleteListTypes]((uint64_t)self);
  p_supportedAutocompleteListTypes = &self->_supportedAutocompleteListTypes;
  count = self->_supportedAutocompleteListTypes.count;
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
  return p_supportedAutocompleteListTypes->list[a3];
}

- (void)setSupportedAutocompleteListTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 8uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedAutocompleteListTypesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0FC18[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedAutocompleteListTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERLEAVED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SECTION_ONLY_FOR_QUERY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isSettlement
{
  return self->_isSettlement;
}

- (void)setIsSettlement:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isSettlement = a3;
}

- (void)setHasIsSettlement:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x40000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsSettlement
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 2) & 1;
}

- (void)_readTransitTripStopTimeFilter
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 769) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitTripStopTimeFilter_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasTransitTripStopTimeFilter
{
  -[GEOMapServiceTraits _readTransitTripStopTimeFilter]((uint64_t)self);
  return self->_transitTripStopTimeFilter != 0;
}

- (GEOTraitsTransitScheduleFilter)transitTripStopTimeFilter
{
  -[GEOMapServiceTraits _readTransitTripStopTimeFilter]((uint64_t)self);
  return self->_transitTripStopTimeFilter;
}

- (void)setTransitTripStopTimeFilter:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x220000000000uLL;
  objc_storeStrong((id *)&self->_transitTripStopTimeFilter, a3);
}

- (BOOL)supportClientRankingFeatureMetadata
{
  return self->_supportClientRankingFeatureMetadata;
}

- (void)setSupportClientRankingFeatureMetadata:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportClientRankingFeatureMetadata = a3;
}

- (void)setHasSupportClientRankingFeatureMetadata:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x20000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportClientRankingFeatureMetadata
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 5) & 1;
}

- (int)supportedChildActions
{
  -[GEOMapServiceTraits _readSupportedChildActions]((uint64_t)self);
  return self->_supportedChildActions.list;
}

- (void)clearSupportedChildActions
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addSupportedChildAction:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readSupportedChildActions]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedChildActionAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedChildActions;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readSupportedChildActions]((uint64_t)self);
  p_supportedChildActions = &self->_supportedChildActions;
  count = self->_supportedChildActions.count;
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
  return p_supportedChildActions->list[a3];
}

- (void)setSupportedChildActions:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x20uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedChildActionsAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C0FC30[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedChildActions:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GUIDES")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DOWNLOAD_OFFLINE_MAP")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportChildItems
{
  return self->_supportChildItems;
}

- (void)setSupportChildItems:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportChildItems = a3;
}

- (void)setHasSupportChildItems:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x8000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)isRefund
{
  return self->_isRefund;
}

- (void)setIsRefund:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isRefund = a3;
}

- (void)setHasIsRefund:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x10000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsRefund
{
  return *((_BYTE *)&self->_flags + 5) & 1;
}

- (BOOL)autocompleteRequestSupportsSectionHeader
{
  return self->_autocompleteRequestSupportsSectionHeader;
}

- (void)setAutocompleteRequestSupportsSectionHeader:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_autocompleteRequestSupportsSectionHeader = a3;
}

- (void)setHasAutocompleteRequestSupportsSectionHeader:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAutocompleteRequestSupportsSectionHeader
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 3) & 1;
}

- (void)_readSupportedAutocompleteResultCellTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedAutocompleteResultCellTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)supportedAutocompleteResultCellTypesCount
{
  -[GEOMapServiceTraits _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  return self->_supportedAutocompleteResultCellTypes.count;
}

- (int)supportedAutocompleteResultCellTypes
{
  -[GEOMapServiceTraits _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  return self->_supportedAutocompleteResultCellTypes.list;
}

- (void)clearSupportedAutocompleteResultCellTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addSupportedAutocompleteResultCellType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedAutocompleteResultCellTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedAutocompleteResultCellTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readSupportedAutocompleteResultCellTypes]((uint64_t)self);
  p_supportedAutocompleteResultCellTypes = &self->_supportedAutocompleteResultCellTypes;
  count = self->_supportedAutocompleteResultCellTypes.count;
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
  return p_supportedAutocompleteResultCellTypes->list[a3];
}

- (void)setSupportedAutocompleteResultCellTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x10uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedAutocompleteResultCellTypesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FC78[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedAutocompleteResultCellTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROMINENT_QUERY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROMINENT_RESULT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TWO_LINE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PROMINENT_RESULT_TWO_LINE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)navigationTransportType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000) != 0)
    return self->_navigationTransportType;
  else
    return 0;
}

- (void)setNavigationTransportType:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_navigationTransportType = a3;
}

- (void)setHasNavigationTransportType:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasNavigationTransportType
{
  return *((unsigned __int8 *)&self->_flags + 1) >> 7;
}

- (id)navigationTransportTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C0FCA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsNavigationTransportType:(id)a3
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

- (void)_readCyclingOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 766) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCyclingOptions_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasCyclingOptions
{
  -[GEOMapServiceTraits _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions != 0;
}

- (GEOCyclingOptions)cyclingOptions
{
  -[GEOMapServiceTraits _readCyclingOptions]((uint64_t)self);
  return self->_cyclingOptions;
}

- (void)setCyclingOptions:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000080000uLL;
  objc_storeStrong((id *)&self->_cyclingOptions, a3);
}

- (void)setHasRatingsCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x80000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)_readEvChargingPorts
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargingPorts_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (NSMutableArray)evChargingPorts
{
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  return self->_evChargingPorts;
}

- (void)setEvChargingPorts:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *evChargingPorts;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x2000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  evChargingPorts = self->_evChargingPorts;
  self->_evChargingPorts = v4;

}

- (void)clearEvChargingPorts
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x2000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  -[NSMutableArray removeAllObjects](self->_evChargingPorts, "removeAllObjects");
}

- (void)addEvChargingPort:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;

  v4 = a3;
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  -[GEOMapServiceTraits _addNoFlagsEvChargingPort:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOMapServiceTraits *)((char *)self + 756);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x2000000);
  os_unfair_lock_unlock(p_readerLock);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x200000000000);
}

- (void)_addNoFlagsEvChargingPort:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 424);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 424);
      *(_QWORD *)(a1 + 424) = v5;

      v4 = *(void **)(a1 + 424);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)evChargingPortsCount
{
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  return -[NSMutableArray count](self->_evChargingPorts, "count");
}

- (id)evChargingPortAtIndex:(unint64_t)a3
{
  -[GEOMapServiceTraits _readEvChargingPorts]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_evChargingPorts, "objectAtIndex:", a3);
}

+ (Class)evChargingPortType
{
  return (Class)objc_opt_class();
}

- (BOOL)isWidgetRequest
{
  return self->_isWidgetRequest;
}

- (void)setIsWidgetRequest:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isWidgetRequest = a3;
}

- (void)setHasIsWidgetRequest:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x80000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsWidgetRequest
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 3) & 1;
}

- (void)_readSupportedSearchTierTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedSearchTierTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)supportedSearchTierTypesCount
{
  -[GEOMapServiceTraits _readSupportedSearchTierTypes]((uint64_t)self);
  return self->_supportedSearchTierTypes.count;
}

- (int)supportedSearchTierTypes
{
  -[GEOMapServiceTraits _readSupportedSearchTierTypes]((uint64_t)self);
  return self->_supportedSearchTierTypes.list;
}

- (void)clearSupportedSearchTierTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addSupportedSearchTierType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readSupportedSearchTierTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedSearchTierTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedSearchTierTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readSupportedSearchTierTypes]((uint64_t)self);
  p_supportedSearchTierTypes = &self->_supportedSearchTierTypes;
  count = self->_supportedSearchTierTypes.count;
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
  return p_supportedSearchTierTypes->list[a3];
}

- (void)setSupportedSearchTierTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x80uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedSearchTierTypesAsString:(int)a3
{
  if (a3 < 3)
    return off_1E1C0FCD8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedSearchTierTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRIMARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AUXILIARY")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)auxiliaryTierNumResults
{
  return self->_auxiliaryTierNumResults;
}

- (void)setAuxiliaryTierNumResults:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_auxiliaryTierNumResults = a3;
}

- (void)setHasAuxiliaryTierNumResults:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 128;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAuxiliaryTierNumResults
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (unsigned)placeSummaryRevision
{
  return self->_placeSummaryRevision;
}

- (void)setPlaceSummaryRevision:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_placeSummaryRevision = a3;
}

- (void)setHasPlaceSummaryRevision:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x40000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasPlaceSummaryRevision
{
  return (*((unsigned __int8 *)&self->_flags + 2) >> 2) & 1;
}

- (double)isTourist
{
  return self->_isTourist;
}

- (void)setIsTourist:(double)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isTourist = a3;
}

- (void)setHasIsTourist:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 8;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)_readKnownRefinementTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKnownRefinementTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)knownRefinementTypesCount
{
  -[GEOMapServiceTraits _readKnownRefinementTypes]((uint64_t)self);
  return self->_knownRefinementTypes.count;
}

- (int)knownRefinementTypes
{
  -[GEOMapServiceTraits _readKnownRefinementTypes]((uint64_t)self);
  return self->_knownRefinementTypes.list;
}

- (void)clearKnownRefinementTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 2uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addKnownRefinementType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readKnownRefinementTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 2uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)knownRefinementTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_knownRefinementTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readKnownRefinementTypes]((uint64_t)self);
  p_knownRefinementTypes = &self->_knownRefinementTypes;
  count = self->_knownRefinementTypes.count;
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
  return p_knownRefinementTypes->list[a3];
}

- (void)setKnownRefinementTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 2uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)knownRefinementTypesAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C0FCF0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsKnownRefinementTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TOGGLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RANGE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MULTI_SELECT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SORT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OPEN_OPTIONS")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)supportAutocompletePublisherResults
{
  return self->_supportAutocompletePublisherResults;
}

- (void)setSupportAutocompletePublisherResults:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportAutocompletePublisherResults = a3;
}

- (void)setHasSupportAutocompletePublisherResults:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x4000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportAutocompletePublisherResults
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 2) & 1;
}

- (BOOL)supportAutocompleteGuideResults
{
  return self->_supportAutocompleteGuideResults;
}

- (void)setSupportAutocompleteGuideResults:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportAutocompleteGuideResults = a3;
}

- (void)setHasSupportAutocompleteGuideResults:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x2000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportAutocompleteGuideResults
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 1) & 1;
}

- (void)_readPreviousSearchViewport
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreviousSearchViewport_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasPreviousSearchViewport
{
  -[GEOMapServiceTraits _readPreviousSearchViewport]((uint64_t)self);
  return self->_previousSearchViewport != 0;
}

- (GEOPDViewportInfo)previousSearchViewport
{
  -[GEOMapServiceTraits _readPreviousSearchViewport]((uint64_t)self);
  return self->_previousSearchViewport;
}

- (void)setPreviousSearchViewport:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200040000000uLL;
  objc_storeStrong((id *)&self->_previousSearchViewport, a3);
}

- (void)setHasPhotoAlbumCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (void)_readResultRefinementQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readResultRefinementQuery_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasResultRefinementQuery
{
  -[GEOMapServiceTraits _readResultRefinementQuery]((uint64_t)self);
  return self->_resultRefinementQuery != 0;
}

- (GEOPDResultRefinementQuery)resultRefinementQuery
{
  -[GEOMapServiceTraits _readResultRefinementQuery]((uint64_t)self);
  return self->_resultRefinementQuery;
}

- (void)setResultRefinementQuery:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200400000000uLL;
  objc_storeStrong((id *)&self->_resultRefinementQuery, a3);
}

- (void)setHasRelatedPlaceItemCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x100000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (int)searchRequestType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000000) != 0)
    return self->_searchRequestType;
  else
    return 0;
}

- (void)setSearchRequestType:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_searchRequestType = a3;
}

- (void)setHasSearchRequestType:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x4000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSearchRequestType
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 2) & 1;
}

- (id)searchRequestTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0FD20[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REDO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AUTO_REDO")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BEACHES")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSString)currentLocaleCurrencySymbol
{
  -[GEOMapServiceTraits _readCurrentLocaleCurrencySymbol]((uint64_t)self);
  return self->_currentLocaleCurrencySymbol;
}

- (void)setCurrentLocaleCurrencySymbol:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000040000uLL;
  objc_storeStrong((id *)&self->_currentLocaleCurrencySymbol, a3);
}

- (void)_readSupportedPlaceSummaryFormatTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSupportedPlaceSummaryFormatTypes_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)supportedPlaceSummaryFormatTypesCount
{
  -[GEOMapServiceTraits _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  return self->_supportedPlaceSummaryFormatTypes.count;
}

- (int)supportedPlaceSummaryFormatTypes
{
  -[GEOMapServiceTraits _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  return self->_supportedPlaceSummaryFormatTypes.list;
}

- (void)clearSupportedPlaceSummaryFormatTypes
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Clear();
}

- (void)addSupportedPlaceSummaryFormatType:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (int)supportedPlaceSummaryFormatTypeAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_supportedPlaceSummaryFormatTypes;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readSupportedPlaceSummaryFormatTypes]((uint64_t)self);
  p_supportedPlaceSummaryFormatTypes = &self->_supportedPlaceSummaryFormatTypes;
  count = self->_supportedPlaceSummaryFormatTypes.count;
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
  return p_supportedPlaceSummaryFormatTypes->list[a3];
}

- (void)setSupportedPlaceSummaryFormatTypes:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x40uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedInt32Set();
}

- (id)supportedPlaceSummaryFormatTypesAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FD40[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSupportedPlaceSummaryFormatTypes:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOLD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ITALICS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRIKETHROUGH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TAPPABLE_ENTITY")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)autocompleteOriginationType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40) != 0)
    return self->_autocompleteOriginationType;
  else
    return 0;
}

- (void)setAutocompleteOriginationType:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_autocompleteOriginationType = a3;
}

- (void)setHasAutocompleteOriginationType:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 64;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAutocompleteOriginationType
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (id)autocompleteOriginationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0FD68[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAutocompleteOriginationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_FAVORITES")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAutocompleteOriginationPreviousLatlng
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompleteOriginationPreviousLatlng_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAutocompleteOriginationPreviousLatlng
{
  -[GEOMapServiceTraits _readAutocompleteOriginationPreviousLatlng]((uint64_t)self);
  return self->_autocompleteOriginationPreviousLatlng != 0;
}

- (GEOLatLng)autocompleteOriginationPreviousLatlng
{
  -[GEOMapServiceTraits _readAutocompleteOriginationPreviousLatlng]((uint64_t)self);
  return self->_autocompleteOriginationPreviousLatlng;
}

- (void)setAutocompleteOriginationPreviousLatlng:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000004000uLL;
  objc_storeStrong((id *)&self->_autocompleteOriginationPreviousLatlng, a3);
}

- (int)searchOriginationType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000) != 0)
    return self->_searchOriginationType;
  else
    return 0;
}

- (void)setSearchOriginationType:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_searchOriginationType = a3;
}

- (void)setHasSearchOriginationType:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x8000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSearchOriginationType
{
  return (*((unsigned __int8 *)&self->_flags + 3) >> 3) & 1;
}

- (id)searchOriginationTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C0FD88[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSearchOriginationType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("IMPLICIT")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readSearchOriginationPreviousLatlng
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchOriginationPreviousLatlng_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSearchOriginationPreviousLatlng
{
  -[GEOMapServiceTraits _readSearchOriginationPreviousLatlng]((uint64_t)self);
  return self->_searchOriginationPreviousLatlng != 0;
}

- (GEOLatLng)searchOriginationPreviousLatlng
{
  -[GEOMapServiceTraits _readSearchOriginationPreviousLatlng]((uint64_t)self);
  return self->_searchOriginationPreviousLatlng;
}

- (void)setSearchOriginationPreviousLatlng:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x202000000000uLL;
  objc_storeStrong((id *)&self->_searchOriginationPreviousLatlng, a3);
}

- (void)_readAddStopRouteInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 765) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddStopRouteInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasAddStopRouteInfo
{
  -[GEOMapServiceTraits _readAddStopRouteInfo]((uint64_t)self);
  return self->_addStopRouteInfo != 0;
}

- (GEOAddStopRouteInfo)addStopRouteInfo
{
  -[GEOMapServiceTraits _readAddStopRouteInfo]((uint64_t)self);
  return self->_addStopRouteInfo;
}

- (void)setAddStopRouteInfo:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200000000200uLL;
  objc_storeStrong((id *)&self->_addStopRouteInfo, a3);
}

- (BOOL)autocompleteOriginationEditingServerWaypoints
{
  return self->_autocompleteOriginationEditingServerWaypoints;
}

- (void)setAutocompleteOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_autocompleteOriginationEditingServerWaypoints = a3;
}

- (void)setHasAutocompleteOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAutocompleteOriginationEditingServerWaypoints
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 2) & 1;
}

- (BOOL)searchOriginationEditingServerWaypoints
{
  return self->_searchOriginationEditingServerWaypoints;
}

- (void)setSearchOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_searchOriginationEditingServerWaypoints = a3;
}

- (void)setHasSearchOriginationEditingServerWaypoints:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x1000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSearchOriginationEditingServerWaypoints
{
  return *((_BYTE *)&self->_flags + 6) & 1;
}

- (BOOL)supportClientRankingCompositeFeatures
{
  return self->_supportClientRankingCompositeFeatures;
}

- (void)setSupportClientRankingCompositeFeatures:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportClientRankingCompositeFeatures = a3;
}

- (void)setHasSupportClientRankingCompositeFeatures:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x10000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFEFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportClientRankingCompositeFeatures
{
  return (*((unsigned __int8 *)&self->_flags + 6) >> 4) & 1;
}

- (void)_readPrivacyMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrivacyMetadata_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasPrivacyMetadata
{
  -[GEOMapServiceTraits _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOMapServiceTraits _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200080000000uLL;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
}

- (unsigned)routeStopCount
{
  return self->_routeStopCount;
}

- (void)setRouteStopCount:(unsigned int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_routeStopCount = a3;
}

- (void)setHasRouteStopCount:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x2000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)supportStructuredRapAffordance
{
  return self->_supportStructuredRapAffordance;
}

- (void)setSupportStructuredRapAffordance:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_supportStructuredRapAffordance = a3;
}

- (void)setHasSupportStructuredRapAffordance:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x200000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFDFFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasSupportStructuredRapAffordance
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 1) & 1;
}

- (BOOL)isRoutePlanningEditStopFillRequest
{
  return self->_isRoutePlanningEditStopFillRequest;
}

- (void)setIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isRoutePlanningEditStopFillRequest = a3;
}

- (void)setHasIsRoutePlanningEditStopFillRequest:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x20000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsRoutePlanningEditStopFillRequest
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 1) & 1;
}

- (void)_readPreferredBrands
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 764) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPreferredBrands_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (unint64_t)preferredBrandsCount
{
  -[GEOMapServiceTraits _readPreferredBrands]((uint64_t)self);
  return self->_preferredBrands.count;
}

- (unint64_t)preferredBrands
{
  -[GEOMapServiceTraits _readPreferredBrands]((uint64_t)self);
  return self->_preferredBrands.list;
}

- (void)clearPreferredBrands
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 4uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedUInt64Clear();
}

- (void)addPreferredBrand:(unint64_t)a3
{
  os_unfair_lock_s *p_readerLock;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;

  -[GEOMapServiceTraits _readPreferredBrands]((uint64_t)self);
  if (self)
    PBRepeatedUInt64Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 4uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)p_flags + 1) |= 0x200000000000uLL;
}

- (unint64_t)preferredBrandAtIndex:(unint64_t)a3
{
  $D9041E0417540B7714261C3B5E8BB314 *p_preferredBrands;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOMapServiceTraits _readPreferredBrands]((uint64_t)self);
  p_preferredBrands = &self->_preferredBrands;
  count = self->_preferredBrands.count;
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
  return p_preferredBrands->list[a3];
}

- (void)setPreferredBrands:(unint64_t *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 4uLL;
  os_unfair_lock_unlock(p_readerLock);
  *((_QWORD *)&self->_flags + 1) |= 0x200000000000uLL;
  PBRepeatedUInt64Set();
}

- (BOOL)isWithinHikingBoundary
{
  return self->_isWithinHikingBoundary;
}

- (void)setIsWithinHikingBoundary:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isWithinHikingBoundary = a3;
}

- (void)setHasIsWithinHikingBoundary:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x100000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsWithinHikingBoundary
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 4) & 1;
}

- (BOOL)isWithinHikingBufferRegion
{
  return self->_isWithinHikingBufferRegion;
}

- (void)setIsWithinHikingBufferRegion:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_isWithinHikingBufferRegion = a3;
}

- (void)setHasIsWithinHikingBufferRegion:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x200000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasIsWithinHikingBufferRegion
{
  return (*((unsigned __int8 *)&self->_flags + 5) >> 5) & 1;
}

- (void)_readSearchImplicitFilterInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchImplicitFilterInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSearchImplicitFilterInfo
{
  -[GEOMapServiceTraits _readSearchImplicitFilterInfo]((uint64_t)self);
  return self->_searchImplicitFilterInfo != 0;
}

- (GEOSearchImplicitFilterInfo)searchImplicitFilterInfo
{
  -[GEOMapServiceTraits _readSearchImplicitFilterInfo]((uint64_t)self);
  return self->_searchImplicitFilterInfo;
}

- (void)setSearchImplicitFilterInfo:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x201000000000uLL;
  objc_storeStrong((id *)&self->_searchImplicitFilterInfo, a3);
}

- (int)devicePlatform
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x1000) != 0)
    return self->_devicePlatform;
  else
    return 0;
}

- (void)setDevicePlatform:(int)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_devicePlatform = a3;
}

- (void)setHasDevicePlatform:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 4096;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasDevicePlatform
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 4) & 1;
}

- (id)devicePlatformAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C0FDA8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsDevicePlatform:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IOS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MACOS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TVOS")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("WATCHOS")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)containsSensitiveData
{
  return self->_containsSensitiveData;
}

- (void)setContainsSensitiveData:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_containsSensitiveData = a3;
}

- (void)setHasContainsSensitiveData:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasContainsSensitiveData
{
  return (*((unsigned __int8 *)&self->_flags + 4) >> 4) & 1;
}

- (void)_readSpotlightSearchPunchinEncodedString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpotlightSearchPunchinEncodedString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasSpotlightSearchPunchinEncodedString
{
  -[GEOMapServiceTraits _readSpotlightSearchPunchinEncodedString]((uint64_t)self);
  return self->_spotlightSearchPunchinEncodedString != 0;
}

- (NSString)spotlightSearchPunchinEncodedString
{
  -[GEOMapServiceTraits _readSpotlightSearchPunchinEncodedString]((uint64_t)self);
  return self->_spotlightSearchPunchinEncodedString;
}

- (void)setSpotlightSearchPunchinEncodedString:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x204000000000uLL;
  objc_storeStrong((id *)&self->_spotlightSearchPunchinEncodedString, a3);
}

- (BOOL)optimizeSearchRequestComponents
{
  return self->_optimizeSearchRequestComponents;
}

- (void)setOptimizeSearchRequestComponents:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_optimizeSearchRequestComponents = a3;
}

- (void)setHasOptimizeSearchRequestComponents:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x800000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasOptimizeSearchRequestComponents
{
  return *((unsigned __int8 *)&self->_flags + 5) >> 7;
}

- (void)_readRecentAutocompleteSessionData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 768) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecentAutocompleteSessionData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasRecentAutocompleteSessionData
{
  -[GEOMapServiceTraits _readRecentAutocompleteSessionData]((uint64_t)self);
  return self->_recentAutocompleteSessionData != 0;
}

- (GEOPDAutocompleteSessionData)recentAutocompleteSessionData
{
  -[GEOMapServiceTraits _readRecentAutocompleteSessionData]((uint64_t)self);
  return self->_recentAutocompleteSessionData;
}

- (void)setRecentAutocompleteSessionData:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200200000000uLL;
  objc_storeStrong((id *)&self->_recentAutocompleteSessionData, a3);
}

- (void)setHasAnalyticsOptOut:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasAnalyticsOptOut
{
  return *((_BYTE *)&self->_flags + 4) & 1;
}

- (void)_readUserActionMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 769) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserActionMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasUserActionMetadata
{
  -[GEOMapServiceTraits _readUserActionMetadata]((uint64_t)self);
  return self->_userActionMetadata != 0;
}

- (GEOPDSSessionUserActionMetadata)userActionMetadata
{
  -[GEOMapServiceTraits _readUserActionMetadata]((uint64_t)self);
  return self->_userActionMetadata;
}

- (void)setUserActionMetadata:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x240000000000uLL;
  objc_storeStrong((id *)&self->_userActionMetadata, a3);
}

- (BOOL)wantsRouteCreationTip
{
  return self->_wantsRouteCreationTip;
}

- (void)setWantsRouteCreationTip:(BOOL)a3
{
  uint64_t v3;

  v3 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v3;
  self->_wantsRouteCreationTip = a3;
}

- (void)setHasWantsRouteCreationTip:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = *((_QWORD *)&self->_flags + 1);
  v4 = 0x2000000000000000;
  if (!a3)
    v4 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xDFFFFFFFFFFFFFFFLL | v4;
  *((_QWORD *)&self->_flags + 1) = v3 | 0x200000000000;
}

- (BOOL)hasWantsRouteCreationTip
{
  return (*((unsigned __int8 *)&self->_flags + 7) >> 5) & 1;
}

- (void)_readHardwareIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 616));
    if ((*(_BYTE *)(a1 + 767) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOMapServiceTraitsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHardwareIdentifier_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 616));
  }
}

- (BOOL)hasHardwareIdentifier
{
  -[GEOMapServiceTraits _readHardwareIdentifier]((uint64_t)self);
  return self->_hardwareIdentifier != 0;
}

- (NSString)hardwareIdentifier
{
  -[GEOMapServiceTraits _readHardwareIdentifier]((uint64_t)self);
  return self->_hardwareIdentifier;
}

- (void)setHardwareIdentifier:(id)a3
{
  *((_QWORD *)&self->_flags + 1) |= 0x200004000000uLL;
  objc_storeStrong((id *)&self->_hardwareIdentifier, a3);
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
  v8.super_class = (Class)GEOMapServiceTraits;
  -[GEOMapServiceTraits description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapServiceTraits dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapServiceTraits _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  id v9;
  unint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  void *v55;
  id v56;
  uint64_t v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  unsigned int v63;
  __CFString *v64;
  const __CFString *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  const __CFString *v69;
  uint64_t v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  id v79;
  uint64_t v80;
  void *v81;
  const __CFString *v82;
  uint64_t v83;
  __CFString *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t k;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  const __CFString *v100;
  uint64_t v101;
  __CFString *v102;
  id v103;
  void *v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  id v108;
  void *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  id v113;
  void *v114;
  _QWORD *v115;
  unint64_t v116;
  uint64_t v117;
  __CFString *v118;
  const __CFString *v119;
  uint64_t v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  _QWORD *v124;
  unint64_t v125;
  uint64_t v126;
  __CFString *v127;
  const __CFString *v128;
  void *v129;
  const __CFString *v130;
  void *v131;
  void *v132;
  void *v133;
  const __CFString *v134;
  uint64_t v135;
  __CFString *v136;
  id v137;
  uint64_t v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  const __CFString *v142;
  uint64_t v143;
  void *v144;
  const __CFString *v145;
  uint64_t v146;
  __CFString *v147;
  void *v148;
  const __CFString *v149;
  void *v150;
  const __CFString *v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  const __CFString *v155;
  void *v156;
  const __CFString *v157;
  void *v158;
  const __CFString *v159;
  int v160;
  __CFString *v161;
  const __CFString *v162;
  uint64_t v163;
  __CFString *v164;
  const __CFString *v165;
  void *v166;
  const __CFString *v167;
  const __CFString *v168;
  const __CFString *v169;
  uint64_t v170;
  __CFString *v171;
  const __CFString *v172;
  const __CFString *v173;
  void *v174;
  _QWORD *v175;
  unint64_t v176;
  uint64_t v177;
  __CFString *v178;
  const __CFString *v179;
  void *v180;
  const __CFString *v181;
  void *v182;
  void *v183;
  void *v184;
  const __CFString *v185;
  id v186;
  void *v187;
  const __CFString *v188;
  void *v189;
  _QWORD *v190;
  unint64_t v191;
  uint64_t v192;
  __CFString *v193;
  const __CFString *v194;
  uint64_t v195;
  void *v196;
  const __CFString *v197;
  void *v198;
  _QWORD *v199;
  unint64_t v200;
  uint64_t v201;
  __CFString *v202;
  const __CFString *v203;
  uint64_t v204;
  __CFString *v205;
  void *v206;
  const __CFString *v207;
  void *v208;
  const __CFString *v209;
  const __CFString *v210;
  void *v211;
  void *v212;
  void *v213;
  const __CFString *v214;
  id v215;
  void *v216;
  const __CFString *v217;
  void *v218;
  id v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t m;
  void *v224;
  id v225;
  const __CFString *v226;
  void *v227;
  const __CFString *v228;
  void *v229;
  _QWORD *v230;
  unint64_t v231;
  uint64_t v232;
  __CFString *v233;
  const __CFString *v234;
  uint64_t v235;
  void *v236;
  const __CFString *v237;
  void *v238;
  _QWORD *v239;
  unint64_t v240;
  uint64_t v241;
  __CFString *v242;
  const __CFString *v243;
  uint64_t v244;
  void *v245;
  const __CFString *v246;
  void *v247;
  const __CFString *v248;
  void *v249;
  void *v250;
  void *v251;
  const __CFString *v252;
  void *v253;
  const __CFString *v254;
  void *v255;
  const __CFString *v256;
  id v257;
  void *v258;
  const __CFString *v259;
  void *v260;
  void *v261;
  void *v262;
  const __CFString *v263;
  id v264;
  uint64_t v265;
  void *v266;
  const __CFString *v267;
  uint64_t v268;
  __CFString *v269;
  void *v270;
  const __CFString *v271;
  void *v272;
  _QWORD *v273;
  unint64_t v274;
  uint64_t v275;
  __CFString *v276;
  const __CFString *v277;
  uint64_t v278;
  __CFString *v279;
  const __CFString *v280;
  void *v281;
  void *v282;
  void *v283;
  const __CFString *v284;
  id v285;
  uint64_t v286;
  __CFString *v287;
  const __CFString *v288;
  void *v289;
  void *v290;
  void *v291;
  const __CFString *v292;
  id v293;
  void *v294;
  void *v295;
  void *v296;
  const __CFString *v297;
  id v298;
  uint64_t v299;
  void *v300;
  const __CFString *v301;
  void *v302;
  void *v303;
  void *v304;
  const __CFString *v305;
  void *v306;
  const __CFString *v307;
  void *v308;
  const __CFString *v309;
  id v310;
  uint64_t v311;
  void *v312;
  const __CFString *v313;
  void *v314;
  const __CFString *v315;
  uint64_t v316;
  void *v317;
  const __CFString *v318;
  void *v319;
  const __CFString *v320;
  void *v321;
  void *v322;
  void *v323;
  const __CFString *v324;
  void *v325;
  const __CFString *v326;
  void *v327;
  const __CFString *v328;
  id v329;
  uint64_t v330;
  uint64_t v331;
  __CFString *v332;
  const __CFString *v333;
  void *v334;
  const __CFString *v335;
  void *v336;
  const __CFString *v337;
  void *v338;
  const __CFString *v339;
  void *v340;
  void *v341;
  void *v342;
  const __CFString *v343;
  id v344;
  void *v345;
  const __CFString *v346;
  void *v347;
  void *v348;
  void *v349;
  const __CFString *v350;
  id v351;
  void *v352;
  const __CFString *v353;
  void *v354;
  const __CFString *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  id v360;
  id v361;
  id v362;
  _QWORD v364[4];
  id v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  _BYTE v382[128];
  _BYTE v383[128];
  _BYTE v384[128];
  _BYTE v385[128];
  uint64_t v386;

  v386 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
  v6 = *(_QWORD *)(a1 + 756);
  if ((v6 & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 264));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("sessionId");
    else
      v8 = CFSTR("session_id");
    v9 = v7;

    objc_msgSend(v4, "setObject:forKey:", v9, v8);
    v6 = *(_QWORD *)(a1 + 756);
  }
  v10 = 0x1E0CB3000uLL;
  if ((v6 & 0x10000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 708));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("sequenceNumber");
    else
      v12 = CFSTR("sequence_number");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend((id)a1, "appIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("appIdentifier");
    else
      v14 = CFSTR("app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  objc_msgSend((id)a1, "appMajorVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (a2)
      v16 = CFSTR("appMajorVersion");
    else
      v16 = CFSTR("app_major_version");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);
  }

  objc_msgSend((id)a1, "appMinorVersion");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (a2)
      v18 = CFSTR("appMinorVersion");
    else
      v18 = CFSTR("app_minor_version");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  objc_msgSend((id)a1, "deviceLocation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v19, "jsonRepresentation");
    else
      objc_msgSend(v19, "dictionaryRepresentation");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("deviceLocation"));
  }

  if (*(_QWORD *)(a1 + 248))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (_QWORD *)(a1 + 240);
    if (*(_QWORD *)(a1 + 248))
    {
      v24 = 0;
      do
      {
        v25 = *(int *)(*v23 + 4 * v24);
        if (v25 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = off_1E1C0FCA0[v25];
        }
        objc_msgSend(v22, "addObject:", v26);

        ++v24;
        v23 = (_QWORD *)(a1 + 240);
      }
      while (v24 < *(_QWORD *)(a1 + 248));
    }
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("transportType"));

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  objc_msgSend((id)a1, "mapRegion");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v27, "jsonRepresentation");
    else
      objc_msgSend(v27, "dictionaryRepresentation");
    v29 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v29, CFSTR("mapRegion"));
  }

  if (*(_QWORD *)(a1 + 392))
  {
    objc_msgSend((id)a1, "deviceDisplayLanguages");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("deviceDisplayLanguage");
    else
      v31 = CFSTR("device_display_language");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

  }
  objc_msgSend((id)a1, "deviceKeyboardLocale");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    if (a2)
      v33 = CFSTR("deviceKeyboardLocale");
    else
      v33 = CFSTR("device_keyboard_locale");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);
  }

  objc_msgSend((id)a1, "deviceSpokenLocale");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    if (a2)
      v35 = CFSTR("deviceSpokenLocale");
    else
      v35 = CFSTR("device_spoken_locale");
    objc_msgSend(v4, "setObject:forKey:", v34, v35);
  }

  v36 = *(_QWORD *)(a1 + 756);
  if ((v36 & 0x8000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 731));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v37, CFSTR("isAPICall"));

    v36 = *(_QWORD *)(a1 + 756);
  }
  if ((v36 & 0x20000000) != 0)
  {
    v38 = *(int *)(a1 + 712);
    if (v38 >= 0x18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 712));
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39 = off_1E1C0FA18[v38];
    }
    objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("source"));

  }
  if (objc_msgSend(*(id *)(a1 + 472), "count"))
  {
    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 472), "count"));
    v378 = 0u;
    v379 = 0u;
    v380 = 0u;
    v381 = 0u;
    v41 = *(id *)(a1 + 472);
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v378, v385, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v379;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v379 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v378 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v46, "jsonRepresentation");
          else
            objc_msgSend(v46, "dictionaryRepresentation");
          v47 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v40, "addObject:", v47);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v378, v385, 16);
      }
      while (v43);
    }

    objc_msgSend(v4, "setObject:forKey:", v40, CFSTR("photoSizes"));
    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + 758) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 664));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v48, CFSTR("photosCount"));

  }
  if (objc_msgSend(*(id *)(a1 + 520), "count"))
  {
    v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 520), "count"));
    v374 = 0u;
    v375 = 0u;
    v376 = 0u;
    v377 = 0u;
    v50 = *(id *)(a1 + 520);
    v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v374, v384, 16);
    if (v51)
    {
      v52 = v51;
      v53 = *(_QWORD *)v375;
      do
      {
        for (j = 0; j != v52; ++j)
        {
          if (*(_QWORD *)v375 != v53)
            objc_enumerationMutation(v50);
          v55 = *(void **)(*((_QWORD *)&v374 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v55, "jsonRepresentation");
          else
            objc_msgSend(v55, "dictionaryRepresentation");
          v56 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v49, "addObject:", v56);
        }
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v374, v384, 16);
      }
      while (v52);
    }

    objc_msgSend(v4, "setObject:forKey:", v49, CFSTR("reviewUserPhotoSizes"));
    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  v57 = *(_QWORD *)(a1 + 756);
  if ((v57 & 0x1000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 692));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v58, CFSTR("reviewUserPhotosCount"));

    v57 = *(_QWORD *)(a1 + 756);
    if ((v57 & 0x40000000) == 0)
    {
LABEL_95:
      if ((v57 & 0x80000000) == 0)
        goto LABEL_96;
      goto LABEL_103;
    }
  }
  else if ((v57 & 0x40000000) == 0)
  {
    goto LABEL_95;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 716));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v60 = CFSTR("timeSinceMapEnteredForeground");
  else
    v60 = CFSTR("time_since_map_entered_foreground");
  objc_msgSend(v4, "setObject:forKey:", v59, v60);

  v57 = *(_QWORD *)(a1 + 756);
  if ((v57 & 0x80000000) == 0)
  {
LABEL_96:
    if ((v57 & 0x200) == 0)
      goto LABEL_114;
    goto LABEL_107;
  }
LABEL_103:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 720));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v62 = CFSTR("timeSinceMapViewportChanged");
  else
    v62 = CFSTR("time_since_map_viewport_changed");
  objc_msgSend(v4, "setObject:forKey:", v61, v62);

  if ((*(_QWORD *)(a1 + 756) & 0x200) != 0)
  {
LABEL_107:
    v63 = *(_DWORD *)(a1 + 632) - 1;
    if (v63 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 632));
      v64 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v64 = off_1E1C0FAD8[v63];
    }
    if (a2)
      v65 = CFSTR("carHeadunitInteractionModel");
    else
      v65 = CFSTR("car_headunit_interaction_model");
    objc_msgSend(v4, "setObject:forKey:", v64, v65);

  }
LABEL_114:
  objc_msgSend((id)a1, "carHeadunitManufacturer");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v66)
  {
    if (a2)
      v67 = CFSTR("carHeadunitManufacturer");
    else
      v67 = CFSTR("car_headunit_manufacturer");
    objc_msgSend(v4, "setObject:forKey:", v66, v67);
  }

  objc_msgSend((id)a1, "carHeadunitModel");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  if (v68)
  {
    if (a2)
      v69 = CFSTR("carHeadunitModel");
    else
      v69 = CFSTR("car_headunit_model");
    objc_msgSend(v4, "setObject:forKey:", v68, v69);
  }

  v70 = *(_QWORD *)(a1 + 756);
  if ((v70 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 360));
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v72 = CFSTR("carHeadunitPixelWidth");
    else
      v72 = CFSTR("car_headunit_pixel_width");
    objc_msgSend(v4, "setObject:forKey:", v71, v72);

    v70 = *(_QWORD *)(a1 + 756);
  }
  if ((v70 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 352));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v74 = CFSTR("carHeadunitPixelHeight");
    else
      v74 = CFSTR("car_headunit_pixel_height");
    objc_msgSend(v4, "setObject:forKey:", v73, v74);

  }
  objc_msgSend((id)a1, "transitScheduleFilter");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v75;
  if (v75)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v75, "jsonRepresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = CFSTR("transitScheduleFilter");
    }
    else
    {
      objc_msgSend(v75, "dictionaryRepresentation");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = CFSTR("transit_schedule_filter");
    }
    v79 = v77;

    objc_msgSend(v4, "setObject:forKey:", v79, v78);
  }

  v80 = *(_QWORD *)(a1 + 756);
  if ((v80 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 464));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v82 = CFSTR("mapZoomLevel");
    else
      v82 = CFSTR("map_zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v81, v82);

    v80 = *(_QWORD *)(a1 + 756);
  }
  if ((v80 & 0x4000) != 0)
  {
    v83 = *(int *)(a1 + 652);
    if (v83 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 652));
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v84 = off_1E1C0FAF0[v83];
    }
    objc_msgSend(v4, "setObject:forKey:", v84, CFSTR("mode"));

  }
  objc_msgSend((id)a1, "displayRegion");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85)
    objc_msgSend(v4, "setObject:forKey:", v85, CFSTR("displayRegion"));

  objc_msgSend((id)a1, "providerID");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (v86)
    objc_msgSend(v4, "setObject:forKey:", v86, CFSTR("providerID"));

  v87 = *(_QWORD *)(a1 + 756);
  if ((v87 & 0x800) != 0)
  {
    v101 = *(int *)(a1 + 640);
    if (v101 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 640));
      v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v102 = off_1E1C0FB18[v101];
    }
    if (a2)
      v162 = CFSTR("deviceInterfaceOrientation");
    else
      v162 = CFSTR("device_interface_orientation");
    objc_msgSend(v4, "setObject:forKey:", v102, v162);

    v87 = *(_QWORD *)(a1 + 756);
    if ((v87 & 0x400) == 0)
    {
LABEL_155:
      if ((v87 & 0x100) == 0)
        goto LABEL_156;
      goto LABEL_309;
    }
  }
  else if ((v87 & 0x400) == 0)
  {
    goto LABEL_155;
  }
  v163 = *(int *)(a1 + 636);
  if (v163 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 636));
    v164 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v164 = off_1E1C0FB40[v163];
  }
  if (a2)
    v169 = CFSTR("deviceBatteryState");
  else
    v169 = CFSTR("device_battery_state");
  objc_msgSend(v4, "setObject:forKey:", v164, v169);

  v87 = *(_QWORD *)(a1 + 756);
  if ((v87 & 0x100) == 0)
  {
LABEL_156:
    if ((v87 & 0x400000000000) == 0)
      goto LABEL_158;
    goto LABEL_157;
  }
LABEL_309:
  v170 = *(int *)(a1 + 628);
  if (v170 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 628));
    v171 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v171 = off_1E1C0FB60[v170];
  }
  if (a2)
    v172 = CFSTR("carHeadunitConnectionType");
  else
    v172 = CFSTR("car_headunit_connection_type");
  objc_msgSend(v4, "setObject:forKey:", v171, v172);

  if ((*(_QWORD *)(a1 + 756) & 0x400000000000) != 0)
  {
LABEL_157:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 738));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v88, CFSTR("navigating"));

  }
LABEL_158:
  if (objc_msgSend(*(id *)(a1 + 440), "count"))
  {
    v89 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 440), "count"));
    v370 = 0u;
    v371 = 0u;
    v372 = 0u;
    v373 = 0u;
    v90 = *(id *)(a1 + 440);
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v370, v383, 16);
    if (v91)
    {
      v92 = v91;
      v93 = *(_QWORD *)v371;
      do
      {
        for (k = 0; k != v92; ++k)
        {
          if (*(_QWORD *)v371 != v93)
            objc_enumerationMutation(v90);
          v95 = *(void **)(*((_QWORD *)&v370 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v95, "jsonRepresentation");
          else
            objc_msgSend(v95, "dictionaryRepresentation");
          v96 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v89, "addObject:", v96);
        }
        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v370, v383, 16);
      }
      while (v92);
    }

    objc_msgSend(v4, "setObject:forKey:", v89, CFSTR("historicalLocations"));
    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000;
  }
  objc_msgSend((id)a1, "automobileOptions");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v97;
  if (v97)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v97, "jsonRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("automobileOptions");
    }
    else
    {
      objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = CFSTR("automobile_options");
    }
    v103 = v99;

    objc_msgSend(v4, "setObject:forKey:", v103, v100);
  }

  objc_msgSend((id)a1, "transitOptions");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v104;
  if (v104)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v104, "jsonRepresentation");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CFSTR("transitOptions");
    }
    else
    {
      objc_msgSend(v104, "dictionaryRepresentation");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      v107 = CFSTR("transit_options");
    }
    v108 = v106;

    objc_msgSend(v4, "setObject:forKey:", v108, v107);
  }

  objc_msgSend((id)a1, "walkingOptions");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  v110 = v109;
  if (v109)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v109, "jsonRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("walkingOptions");
    }
    else
    {
      objc_msgSend(v109, "dictionaryRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("walking_options");
    }
    v113 = v111;

    objc_msgSend(v4, "setObject:forKey:", v113, v112);
  }

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v116 = 0;
      do
      {
        v117 = *(int *)(*v115 + 4 * v116);
        if (v117 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v117);
          v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v118 = off_1E1C0FB78[v117];
        }
        objc_msgSend(v114, "addObject:", v118);

        ++v116;
        v115 = (_QWORD *)(a1 + 24);
      }
      while (v116 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v119 = CFSTR("engineType");
    else
      v119 = CFSTR("engine_type");
    objc_msgSend(v4, "setObject:forKey:", v114, v119);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  v120 = *(_QWORD *)(a1 + v5[928]);
  if ((v120 & 0x200000) != 0)
  {
    v135 = *(int *)(a1 + 680);
    if (v135 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 680));
      v136 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v136 = off_1E1C0FBA0[v135];
    }
    if (a2)
      v165 = CFSTR("requestMode");
    else
      v165 = CFSTR("request_mode");
    objc_msgSend(v4, "setObject:forKey:", v136, v165);

    v120 = *(_QWORD *)(a1 + v5[928]);
    if ((v120 & 0x80000000000000) == 0)
    {
LABEL_200:
      if ((v120 & 0x100000000000000) == 0)
        goto LABEL_205;
      goto LABEL_201;
    }
  }
  else if ((v120 & 0x80000000000000) == 0)
  {
    goto LABEL_200;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 747));
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v167 = CFSTR("supportDirectionIntentSearch");
  else
    v167 = CFSTR("support_direction_intent_search");
  objc_msgSend(v4, "setObject:forKey:", v166, v167);

  if ((*(_QWORD *)(a1 + 756) & 0x100000000000000) != 0)
  {
LABEL_201:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 748));
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v122 = CFSTR("supportDymSuggestion");
    else
      v122 = CFSTR("support_dym_suggestion");
    objc_msgSend(v4, "setObject:forKey:", v121, v122);

  }
LABEL_205:
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v125 = 0;
      do
      {
        v126 = *(int *)(*v124 + 4 * v125);
        if (v126 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v126);
          v127 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v127 = off_1E1C0FBC8[v126];
        }
        objc_msgSend(v123, "addObject:", v127);

        ++v125;
        v124 = (_QWORD *)(a1 + 48);
      }
      while (v125 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v128 = CFSTR("knownClientResolvedType");
    else
      v128 = CFSTR("known_client_resolved_type");
    objc_msgSend(v4, "setObject:forKey:", v123, v128);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + v5[928] + 7) & 0x10) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 752));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v130 = CFSTR("wantsBrandIcon");
    else
      v130 = CFSTR("wants_brand_icon");
    objc_msgSend(v4, "setObject:forKey:", v129, v130);

  }
  objc_msgSend((id)a1, "venueIdentifier");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  v132 = v131;
  if (v131)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v131, "jsonRepresentation");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CFSTR("venueIdentifier");
    }
    else
    {
      objc_msgSend(v131, "dictionaryRepresentation");
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = CFSTR("venue_identifier");
    }
    v137 = v133;

    objc_msgSend(v4, "setObject:forKey:", v137, v134);
  }

  v138 = *(_QWORD *)(a1 + v5[928]);
  if ((v138 & 0x4000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 730));
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v145 = CFSTR("deviceInVehicle");
    else
      v145 = CFSTR("device_in_vehicle");
    objc_msgSend(v4, "setObject:forKey:", v144, v145);

    v138 = *(_QWORD *)(a1 + 756);
    if ((v138 & 0x400000) == 0)
    {
LABEL_230:
      if ((v138 & 0x2000) == 0)
        goto LABEL_235;
      goto LABEL_231;
    }
  }
  else if ((v138 & 0x400000) == 0)
  {
    goto LABEL_230;
  }
  v146 = *(int *)(a1 + 684);
  if (v146 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 684));
    v147 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v147 = off_1E1C0FC00[v146];
  }
  if (a2)
    v168 = CFSTR("requestPriority");
  else
    v168 = CFSTR("request_priority");
  objc_msgSend(v4, "setObject:forKey:", v147, v168);

  if ((*(_QWORD *)(a1 + v5[928]) & 0x2000) != 0)
  {
LABEL_231:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 648));
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v140 = CFSTR("httpRequestPriority");
    else
      v140 = CFSTR("http_request_priority");
    objc_msgSend(v4, "setObject:forKey:", v139, v140);

  }
LABEL_235:
  objc_msgSend((id)a1, "analyticsAppIdentifier");
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (v141)
  {
    if (a2)
      v142 = CFSTR("analyticsAppIdentifier");
    else
      v142 = CFSTR("analytics_app_identifier");
    objc_msgSend(v4, "setObject:forKey:", v141, v142);
  }

  v143 = *(_QWORD *)(a1 + v5[928]);
  if ((v143 & 0x20) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithDouble:", *(double *)(a1 + 544));
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v149 = CFSTR("sessionRelativeTimestamp");
    else
      v149 = CFSTR("session_relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v148, v149);

    v143 = *(_QWORD *)(a1 + 756);
    if ((v143 & 0x40000000000000) == 0)
    {
LABEL_242:
      if ((v143 & 0x400000000000000) == 0)
        goto LABEL_243;
      goto LABEL_262;
    }
  }
  else if ((v143 & 0x40000000000000) == 0)
  {
    goto LABEL_242;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 746));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v151 = CFSTR("supportDirectionIntentAutocomplete");
  else
    v151 = CFSTR("support_direction_intent_autocomplete");
  objc_msgSend(v4, "setObject:forKey:", v150, v151);

  v143 = *(_QWORD *)(a1 + 756);
  if ((v143 & 0x400000000000000) == 0)
  {
LABEL_243:
    if ((v143 & 0x2000000000) == 0)
      goto LABEL_244;
    goto LABEL_266;
  }
LABEL_262:
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 750));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v153 = CFSTR("supportUnresolvedDirectionIntent");
  else
    v153 = CFSTR("support_unresolved_direction_intent");
  objc_msgSend(v4, "setObject:forKey:", v152, v153);

  v143 = *(_QWORD *)(a1 + 756);
  if ((v143 & 0x2000000000) == 0)
  {
LABEL_244:
    if ((v143 & 0x200000000) == 0)
      goto LABEL_245;
    goto LABEL_270;
  }
LABEL_266:
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 729));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v155 = CFSTR("deviceDarkMode");
  else
    v155 = CFSTR("device_dark_mode");
  objc_msgSend(v4, "setObject:forKey:", v154, v155);

  v143 = *(_QWORD *)(a1 + 756);
  if ((v143 & 0x200000000) == 0)
  {
LABEL_245:
    if ((v143 & 0x800000000000000) == 0)
      goto LABEL_246;
    goto LABEL_274;
  }
LABEL_270:
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 725));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v157 = CFSTR("appDarkMode");
  else
    v157 = CFSTR("app_dark_mode");
  objc_msgSend(v4, "setObject:forKey:", v156, v157);

  v143 = *(_QWORD *)(a1 + 756);
  if ((v143 & 0x800000000000000) == 0)
  {
LABEL_246:
    if ((v143 & 0x800000) == 0)
      goto LABEL_323;
    goto LABEL_278;
  }
LABEL_274:
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 751));
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v159 = CFSTR("supportsBrandFallback");
  else
    v159 = CFSTR("supports_brand_fallback");
  objc_msgSend(v4, "setObject:forKey:", v158, v159);

  if ((*(_QWORD *)(a1 + 756) & 0x800000) != 0)
  {
LABEL_278:
    v160 = *(_DWORD *)(a1 + 688);
    if (v160)
    {
      if (v160 == 1)
      {
        v161 = CFSTR("ROUTE_WAYPOINT_RESOLUTION");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 688));
        v161 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v161 = CFSTR("UNKNOWN");
    }
    if (a2)
      v173 = CFSTR("requestPurpose");
    else
      v173 = CFSTR("request_purpose");
    objc_msgSend(v4, "setObject:forKey:", v161, v173);

  }
LABEL_323:
  if (*(_QWORD *)(a1 + 128))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = (_QWORD *)(a1 + 120);
    if (*(_QWORD *)(a1 + 128))
    {
      v176 = 0;
      do
      {
        v177 = *(int *)(*v175 + 4 * v176);
        if (v177 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v177);
          v178 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v178 = off_1E1C0FC18[v177];
        }
        objc_msgSend(v174, "addObject:", v178);

        ++v176;
        v175 = (_QWORD *)(a1 + 120);
      }
      while (v176 < *(_QWORD *)(a1 + 128));
    }
    if (a2)
      v179 = CFSTR("supportedAutocompleteListType");
    else
      v179 = CFSTR("supported_autocomplete_list_type");
    objc_msgSend(v4, "setObject:forKey:", v174, v179);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + v5[928] + 5) & 4) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 734));
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v181 = CFSTR("isSettlement");
    else
      v181 = CFSTR("is_settlement");
    objc_msgSend(v4, "setObject:forKey:", v180, v181);

  }
  objc_msgSend((id)a1, "transitTripStopTimeFilter");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v183 = v182;
  if (v182)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v182, "jsonRepresentation");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = CFSTR("transitTripStopTimeFilter");
    }
    else
    {
      objc_msgSend(v182, "dictionaryRepresentation");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      v185 = CFSTR("transit_trip_stop_time_filter");
    }
    v186 = v184;

    objc_msgSend(v4, "setObject:forKey:", v186, v185);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 6) & 0x20) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 745));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v188 = CFSTR("supportClientRankingFeatureMetadata");
    else
      v188 = CFSTR("support_client_ranking_feature_metadata");
    objc_msgSend(v4, "setObject:forKey:", v187, v188);

  }
  if (*(_QWORD *)(a1 + 176))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = (_QWORD *)(a1 + 168);
    if (*(_QWORD *)(a1 + 176))
    {
      v191 = 0;
      do
      {
        v192 = *(int *)(*v190 + 4 * v191);
        if (v192 >= 9)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v192);
          v193 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v193 = off_1E1C0FC30[v192];
        }
        objc_msgSend(v189, "addObject:", v193);

        ++v191;
        v190 = (_QWORD *)(a1 + 168);
      }
      while (v191 < *(_QWORD *)(a1 + 176));
    }
    if (a2)
      v194 = CFSTR("supportedChildAction");
    else
      v194 = CFSTR("supported_child_action");
    objc_msgSend(v4, "setObject:forKey:", v189, v194);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  v195 = *(_QWORD *)(a1 + v5[928]);
  if ((v195 & 0x8000000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 743));
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v207 = CFSTR("supportChildItems");
    else
      v207 = CFSTR("support_child_items");
    objc_msgSend(v4, "setObject:forKey:", v206, v207);

    v195 = *(_QWORD *)(a1 + 756);
    if ((v195 & 0x10000000000) == 0)
    {
LABEL_362:
      if ((v195 & 0x800000000) == 0)
        goto LABEL_367;
      goto LABEL_363;
    }
  }
  else if ((v195 & 0x10000000000) == 0)
  {
    goto LABEL_362;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 732));
  v208 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v209 = CFSTR("isRefund");
  else
    v209 = CFSTR("is_refund");
  objc_msgSend(v4, "setObject:forKey:", v208, v209);

  if ((*(_QWORD *)(a1 + 756) & 0x800000000) != 0)
  {
LABEL_363:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 727));
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v197 = CFSTR("autocompleteRequestSupportsSectionHeader");
    else
      v197 = CFSTR("autocomplete_request_supports_section_header");
    objc_msgSend(v4, "setObject:forKey:", v196, v197);

  }
LABEL_367:
  if (*(_QWORD *)(a1 + 152))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = (_QWORD *)(a1 + 144);
    if (*(_QWORD *)(a1 + 152))
    {
      v200 = 0;
      do
      {
        v201 = *(int *)(*v199 + 4 * v200);
        if (v201 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v201);
          v202 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v202 = off_1E1C0FC78[v201];
        }
        objc_msgSend(v198, "addObject:", v202);

        ++v200;
        v199 = (_QWORD *)(a1 + 144);
      }
      while (v200 < *(_QWORD *)(a1 + 152));
    }
    if (a2)
      v203 = CFSTR("supportedAutocompleteResultCellType");
    else
      v203 = CFSTR("supported_autocomplete_result_cell_type");
    objc_msgSend(v4, "setObject:forKey:", v198, v203);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + v5[928] + 1) & 0x80) != 0)
  {
    v204 = *(int *)(a1 + 656);
    if (v204 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 656));
      v205 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v205 = off_1E1C0FCA0[v204];
    }
    if (a2)
      v210 = CFSTR("navigationTransportType");
    else
      v210 = CFSTR("navigation_transport_type");
    objc_msgSend(v4, "setObject:forKey:", v205, v210);

  }
  objc_msgSend((id)a1, "cyclingOptions");
  v211 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = v211;
  if (v211)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v211, "jsonRepresentation");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = CFSTR("cyclingOptions");
    }
    else
    {
      objc_msgSend(v211, "dictionaryRepresentation");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      v214 = CFSTR("cycling_options");
    }
    v215 = v213;

    objc_msgSend(v4, "setObject:forKey:", v215, v214);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 2) & 8) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 672));
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v217 = CFSTR("ratingsCount");
    else
      v217 = CFSTR("ratings_count");
    objc_msgSend(v4, "setObject:forKey:", v216, v217);

  }
  if (objc_msgSend(*(id *)(a1 + 424), "count"))
  {
    v218 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 424), "count"));
    v366 = 0u;
    v367 = 0u;
    v368 = 0u;
    v369 = 0u;
    v219 = *(id *)(a1 + 424);
    v220 = objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v366, v382, 16);
    if (v220)
    {
      v221 = v220;
      v222 = *(_QWORD *)v367;
      do
      {
        for (m = 0; m != v221; ++m)
        {
          if (*(_QWORD *)v367 != v222)
            objc_enumerationMutation(v219);
          v224 = *(void **)(*((_QWORD *)&v366 + 1) + 8 * m);
          if ((a2 & 1) != 0)
            objc_msgSend(v224, "jsonRepresentation");
          else
            objc_msgSend(v224, "dictionaryRepresentation");
          v225 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v218, "addObject:", v225);
        }
        v221 = objc_msgSend(v219, "countByEnumeratingWithState:objects:count:", &v366, v382, 16);
      }
      while (v221);
    }

    if (a2)
      v226 = CFSTR("evChargingPort");
    else
      v226 = CFSTR("ev_charging_port");
    objc_msgSend(v4, "setObject:forKey:", v218, v226);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + v5[928] + 5) & 8) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 735));
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v228 = CFSTR("isWidgetRequest");
    else
      v228 = CFSTR("is_widget_request");
    objc_msgSend(v4, "setObject:forKey:", v227, v228);

  }
  if (*(_QWORD *)(a1 + 224))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = (_QWORD *)(a1 + 216);
    if (*(_QWORD *)(a1 + 224))
    {
      v231 = 0;
      do
      {
        v232 = *(int *)(*v230 + 4 * v231);
        if (v232 >= 3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v232);
          v233 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v233 = off_1E1C0FCD8[v232];
        }
        objc_msgSend(v229, "addObject:", v233);

        ++v231;
        v230 = (_QWORD *)(a1 + 216);
      }
      while (v231 < *(_QWORD *)(a1 + 224));
    }
    if (a2)
      v234 = CFSTR("supportedSearchTierType");
    else
      v234 = CFSTR("supported_search_tier_type");
    objc_msgSend(v4, "setObject:forKey:", v229, v234);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  v235 = *(_QWORD *)(a1 + v5[928]);
  if ((v235 & 0x80) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 624));
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v254 = CFSTR("auxiliaryTierNumResults");
    else
      v254 = CFSTR("auxiliary_tier_num_results");
    objc_msgSend(v4, "setObject:forKey:", v253, v254);

    v235 = *(_QWORD *)(a1 + 756);
    if ((v235 & 0x40000) == 0)
    {
LABEL_438:
      if ((v235 & 8) == 0)
        goto LABEL_443;
      goto LABEL_439;
    }
  }
  else if ((v235 & 0x40000) == 0)
  {
    goto LABEL_438;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 668));
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v256 = CFSTR("placeSummaryRevision");
  else
    v256 = CFSTR("place_summary_revision");
  objc_msgSend(v4, "setObject:forKey:", v255, v256);

  if ((*(_QWORD *)(a1 + 756) & 8) != 0)
  {
LABEL_439:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithDouble:", *(double *)(a1 + 448));
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v237 = CFSTR("isTourist");
    else
      v237 = CFSTR("is_tourist");
    objc_msgSend(v4, "setObject:forKey:", v236, v237);

  }
LABEL_443:
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v239 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v240 = 0;
      do
      {
        v241 = *(int *)(*v239 + 4 * v240);
        if (v241 >= 6)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v241);
          v242 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v242 = off_1E1C0FCF0[v241];
        }
        objc_msgSend(v238, "addObject:", v242);

        ++v240;
        v239 = (_QWORD *)(a1 + 72);
      }
      while (v240 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v243 = CFSTR("knownRefinementType");
    else
      v243 = CFSTR("known_refinement_type");
    objc_msgSend(v4, "setObject:forKey:", v238, v243);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  v244 = *(_QWORD *)(a1 + v5[928]);
  if ((v244 & 0x4000000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 742));
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v246 = CFSTR("supportAutocompletePublisherResults");
    else
      v246 = CFSTR("support_autocomplete_publisher_results");
    objc_msgSend(v4, "setObject:forKey:", v245, v246);

    v244 = *(_QWORD *)(a1 + 756);
  }
  if ((v244 & 0x2000000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 741));
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v248 = CFSTR("supportAutocompleteGuideResults");
    else
      v248 = CFSTR("support_autocomplete_guide_results");
    objc_msgSend(v4, "setObject:forKey:", v247, v248);

  }
  objc_msgSend((id)a1, "previousSearchViewport");
  v249 = (void *)objc_claimAutoreleasedReturnValue();
  v250 = v249;
  if (v249)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v249, "jsonRepresentation");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = CFSTR("previousSearchViewport");
    }
    else
    {
      objc_msgSend(v249, "dictionaryRepresentation");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = CFSTR("previous_search_viewport");
    }
    v257 = v251;

    objc_msgSend(v4, "setObject:forKey:", v257, v252);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 2) & 1) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 660));
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v259 = CFSTR("photoAlbumCount");
    else
      v259 = CFSTR("photo_album_count");
    objc_msgSend(v4, "setObject:forKey:", v258, v259);

  }
  objc_msgSend((id)a1, "resultRefinementQuery");
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  v261 = v260;
  if (v260)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v260, "jsonRepresentation");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      v263 = CFSTR("resultRefinementQuery");
    }
    else
    {
      objc_msgSend(v260, "dictionaryRepresentation");
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      v263 = CFSTR("result_refinement_query");
    }
    v264 = v262;

    objc_msgSend(v4, "setObject:forKey:", v264, v263);
  }

  v265 = *(_QWORD *)(a1 + v5[928]);
  if ((v265 & 0x100000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 676));
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v267 = CFSTR("relatedPlaceItemCount");
    else
      v267 = CFSTR("related_place_item_count");
    objc_msgSend(v4, "setObject:forKey:", v266, v267);

    v265 = *(_QWORD *)(a1 + 756);
  }
  if ((v265 & 0x4000000) != 0)
  {
    v268 = *(int *)(a1 + 700);
    if (v268 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 700));
      v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v269 = off_1E1C0FD20[v268];
    }
    objc_msgSend(v4, "setObject:forKey:", v269, CFSTR("searchRequestType"));

  }
  objc_msgSend((id)a1, "currentLocaleCurrencySymbol");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  if (v270)
  {
    if (a2)
      v271 = CFSTR("currentLocaleCurrencySymbol");
    else
      v271 = CFSTR("current_locale_currency_symbol");
    objc_msgSend(v4, "setObject:forKey:", v270, v271);
  }

  if (*(_QWORD *)(a1 + 200))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    v273 = (_QWORD *)(a1 + 192);
    if (*(_QWORD *)(a1 + 200))
    {
      v274 = 0;
      do
      {
        v275 = *(int *)(*v273 + 4 * v274);
        if (v275 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v275);
          v276 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v276 = off_1E1C0FD40[v275];
        }
        objc_msgSend(v272, "addObject:", v276);

        ++v274;
        v273 = (_QWORD *)(a1 + 192);
      }
      while (v274 < *(_QWORD *)(a1 + 200));
    }
    if (a2)
      v277 = CFSTR("supportedPlaceSummaryFormatType");
    else
      v277 = CFSTR("supported_place_summary_format_type");
    objc_msgSend(v4, "setObject:forKey:", v272, v277);

    v5 = &OBJC_IVAR___GEORPMerchantLookupContext__readerMarkLength;
    v10 = 0x1E0CB3000uLL;
  }
  if ((*(_BYTE *)(a1 + v5[928]) & 0x40) != 0)
  {
    v278 = *(int *)(a1 + 620);
    if (v278 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 620));
      v279 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v279 = off_1E1C0FD68[v278];
    }
    if (a2)
      v280 = CFSTR("autocompleteOriginationType");
    else
      v280 = CFSTR("autocomplete_origination_type");
    objc_msgSend(v4, "setObject:forKey:", v279, v280);

  }
  objc_msgSend((id)a1, "autocompleteOriginationPreviousLatlng");
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  v282 = v281;
  if (v281)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v281, "jsonRepresentation");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = CFSTR("autocompleteOriginationPreviousLatlng");
    }
    else
    {
      objc_msgSend(v281, "dictionaryRepresentation");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = CFSTR("autocomplete_origination_previous_latlng");
    }
    v285 = v283;

    objc_msgSend(v4, "setObject:forKey:", v285, v284);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 3) & 8) != 0)
  {
    v286 = *(int *)(a1 + 704);
    if (v286 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 704));
      v287 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v287 = off_1E1C0FD88[v286];
    }
    if (a2)
      v288 = CFSTR("searchOriginationType");
    else
      v288 = CFSTR("search_origination_type");
    objc_msgSend(v4, "setObject:forKey:", v287, v288);

  }
  objc_msgSend((id)a1, "searchOriginationPreviousLatlng");
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  v290 = v289;
  if (v289)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v289, "jsonRepresentation");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      v292 = CFSTR("searchOriginationPreviousLatlng");
    }
    else
    {
      objc_msgSend(v289, "dictionaryRepresentation");
      v291 = (void *)objc_claimAutoreleasedReturnValue();
      v292 = CFSTR("search_origination_previous_latlng");
    }
    v293 = v291;

    objc_msgSend(v4, "setObject:forKey:", v293, v292);
  }

  objc_msgSend((id)a1, "addStopRouteInfo");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  v295 = v294;
  if (v294)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v294, "jsonRepresentation");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v297 = CFSTR("addStopRouteInfo");
    }
    else
    {
      objc_msgSend(v294, "dictionaryRepresentation");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v297 = CFSTR("add_stop_route_info");
    }
    v298 = v296;

    objc_msgSend(v4, "setObject:forKey:", v298, v297);
  }

  v299 = *(_QWORD *)(a1 + v5[928]);
  if ((v299 & 0x400000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 726));
    v306 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v307 = CFSTR("autocompleteOriginationEditingServerWaypoints");
    else
      v307 = CFSTR("autocomplete_origination_editing_server_waypoints");
    objc_msgSend(v4, "setObject:forKey:", v306, v307);

    v299 = *(_QWORD *)(a1 + 756);
    if ((v299 & 0x1000000000000) == 0)
    {
LABEL_547:
      if ((v299 & 0x10000000000000) == 0)
        goto LABEL_552;
      goto LABEL_548;
    }
  }
  else if ((v299 & 0x1000000000000) == 0)
  {
    goto LABEL_547;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 740));
  v308 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v309 = CFSTR("searchOriginationEditingServerWaypoints");
  else
    v309 = CFSTR("search_origination_editing_server_waypoints");
  objc_msgSend(v4, "setObject:forKey:", v308, v309);

  if ((*(_QWORD *)(a1 + 756) & 0x10000000000000) != 0)
  {
LABEL_548:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 744));
    v300 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v301 = CFSTR("supportClientRankingCompositeFeatures");
    else
      v301 = CFSTR("support_client_ranking_composite_features");
    objc_msgSend(v4, "setObject:forKey:", v300, v301);

  }
LABEL_552:
  objc_msgSend((id)a1, "privacyMetadata");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v303 = v302;
  if (v302)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v302, "jsonRepresentation");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      v305 = CFSTR("privacyMetadata");
    }
    else
    {
      objc_msgSend(v302, "dictionaryRepresentation");
      v304 = (void *)objc_claimAutoreleasedReturnValue();
      v305 = CFSTR("privacy_metadata");
    }
    v310 = v304;

    objc_msgSend(v4, "setObject:forKey:", v310, v305);
  }

  v311 = *(_QWORD *)(a1 + v5[928]);
  if ((v311 & 0x2000000) == 0)
  {
    if ((v311 & 0x200000000000000) == 0)
      goto LABEL_568;
LABEL_595:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 749));
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v328 = CFSTR("supportStructuredRapAffordance");
    else
      v328 = CFSTR("support_structured_rap_affordance");
    objc_msgSend(v4, "setObject:forKey:", v327, v328);

    if ((*(_QWORD *)(a1 + 756) & 0x20000000000) == 0)
      goto LABEL_573;
    goto LABEL_569;
  }
  objc_msgSend(*(id *)(v10 + 2024), "numberWithUnsignedInt:", *(unsigned int *)(a1 + 696));
  v325 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v326 = CFSTR("routeStopCount");
  else
    v326 = CFSTR("route_stop_count");
  objc_msgSend(v4, "setObject:forKey:", v325, v326);

  v311 = *(_QWORD *)(a1 + 756);
  if ((v311 & 0x200000000000000) != 0)
    goto LABEL_595;
LABEL_568:
  if ((v311 & 0x20000000000) != 0)
  {
LABEL_569:
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 733));
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v313 = CFSTR("isRoutePlanningEditStopFillRequest");
    else
      v313 = CFSTR("is_route_planning_edit_stop_fill_request");
    objc_msgSend(v4, "setObject:forKey:", v312, v313);

  }
LABEL_573:
  if (*(_QWORD *)(a1 + 104))
  {
    PBRepeatedUInt64NSArray();
    v314 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v315 = CFSTR("preferredBrand");
    else
      v315 = CFSTR("preferred_brand");
    objc_msgSend(v4, "setObject:forKey:", v314, v315);

  }
  v316 = *(_QWORD *)(a1 + v5[928]);
  if ((v316 & 0x100000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 736));
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v318 = CFSTR("isWithinHikingBoundary");
    else
      v318 = CFSTR("is_within_hiking_boundary");
    objc_msgSend(v4, "setObject:forKey:", v317, v318);

    v316 = *(_QWORD *)(a1 + 756);
  }
  if ((v316 & 0x200000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 737));
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v320 = CFSTR("isWithinHikingBufferRegion");
    else
      v320 = CFSTR("is_within_hiking_buffer_region");
    objc_msgSend(v4, "setObject:forKey:", v319, v320);

  }
  objc_msgSend((id)a1, "searchImplicitFilterInfo");
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = v321;
  if (v321)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v321, "jsonRepresentation");
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      v324 = CFSTR("searchImplicitFilterInfo");
    }
    else
    {
      objc_msgSend(v321, "dictionaryRepresentation");
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      v324 = CFSTR("search_implicit_filter_info");
    }
    v329 = v323;

    objc_msgSend(v4, "setObject:forKey:", v329, v324);
  }

  v330 = *(_QWORD *)(a1 + v5[928]);
  if ((v330 & 0x1000) != 0)
  {
    v331 = *(int *)(a1 + 644);
    if (v331 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 644));
      v332 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v332 = off_1E1C0FDA8[v331];
    }
    if (a2)
      v333 = CFSTR("devicePlatform");
    else
      v333 = CFSTR("device_platform");
    objc_msgSend(v4, "setObject:forKey:", v332, v333);

    v330 = *(_QWORD *)(a1 + v5[928]);
  }
  if ((v330 & 0x1000000000) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 728));
    v334 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v335 = CFSTR("containsSensitiveData");
    else
      v335 = CFSTR("contains_sensitive_data");
    objc_msgSend(v4, "setObject:forKey:", v334, v335);

  }
  objc_msgSend((id)a1, "spotlightSearchPunchinEncodedString");
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  if (v336)
  {
    if (a2)
      v337 = CFSTR("spotlightSearchPunchinEncodedString");
    else
      v337 = CFSTR("spotlight_search_punchin_encoded_string");
    objc_msgSend(v4, "setObject:forKey:", v336, v337);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 5) & 0x80) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 739));
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v339 = CFSTR("optimizeSearchRequestComponents");
    else
      v339 = CFSTR("optimize_search_request_components");
    objc_msgSend(v4, "setObject:forKey:", v338, v339);

  }
  objc_msgSend((id)a1, "recentAutocompleteSessionData");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  v341 = v340;
  if (v340)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v340, "jsonRepresentation");
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      v343 = CFSTR("recentAutocompleteSessionData");
    }
    else
    {
      objc_msgSend(v340, "dictionaryRepresentation");
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      v343 = CFSTR("recent_autocomplete_session_data");
    }
    v344 = v342;

    objc_msgSend(v4, "setObject:forKey:", v344, v343);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 4) & 1) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 724));
    v345 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v346 = CFSTR("analyticsOptOut");
    else
      v346 = CFSTR("analytics_opt_out");
    objc_msgSend(v4, "setObject:forKey:", v345, v346);

  }
  objc_msgSend((id)a1, "userActionMetadata");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = v347;
  if (v347)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v347, "jsonRepresentation");
      v349 = (void *)objc_claimAutoreleasedReturnValue();
      v350 = CFSTR("userActionMetadata");
    }
    else
    {
      objc_msgSend(v347, "dictionaryRepresentation");
      v349 = (void *)objc_claimAutoreleasedReturnValue();
      v350 = CFSTR("user_action_metadata");
    }
    v351 = v349;

    objc_msgSend(v4, "setObject:forKey:", v351, v350);
  }

  if ((*(_BYTE *)(a1 + v5[928] + 7) & 0x20) != 0)
  {
    objc_msgSend(*(id *)(v10 + 2024), "numberWithBool:", *(unsigned __int8 *)(a1 + 753));
    v352 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v353 = CFSTR("wantsRouteCreationTip");
    else
      v353 = CFSTR("wants_route_creation_tip");
    objc_msgSend(v4, "setObject:forKey:", v352, v353);

  }
  objc_msgSend((id)a1, "hardwareIdentifier");
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  if (v354)
  {
    if (a2)
      v355 = CFSTR("hardwareIdentifier");
    else
      v355 = CFSTR("hardware_identifier");
    objc_msgSend(v4, "setObject:forKey:", v354, v355);
  }

  v356 = *(void **)(a1 + 16);
  if (v356)
  {
    objc_msgSend(v356, "dictionaryRepresentation");
    v357 = (void *)objc_claimAutoreleasedReturnValue();
    v358 = v357;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v357, "count"));
      v359 = (void *)objc_claimAutoreleasedReturnValue();
      v364[0] = MEMORY[0x1E0C809B0];
      v364[1] = 3221225472;
      v364[2] = __49__GEOMapServiceTraits__dictionaryRepresentation___block_invoke;
      v364[3] = &unk_1E1C00600;
      v360 = v359;
      v365 = v360;
      objc_msgSend(v358, "enumerateKeysAndObjectsUsingBlock:", v364);
      v361 = v360;

      v358 = v361;
    }
    objc_msgSend(v4, "setObject:forKey:", v358, CFSTR("Unknown Fields"));

  }
  v362 = v4;

  return v362;
}

- (id)jsonRepresentation
{
  return -[GEOMapServiceTraits _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOMapServiceTraits__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOMapServiceTraits)initWithDictionary:(id)a3
{
  return (GEOMapServiceTraits *)-[GEOMapServiceTraits _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  GEOLocation *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  id v31;
  uint64_t v32;
  void *v33;
  GEOMapRegion *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  uint64_t v62;
  GEOTraitsPhotoSize *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t m;
  uint64_t v73;
  GEOTraitsPhotoSize *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  id v84;
  uint64_t v85;
  const __CFString *v86;
  void *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  void *v91;
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  GEOTraitsTransitScheduleFilter *v98;
  uint64_t v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  void *v103;
  id v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  id v112;
  uint64_t v113;
  const __CFString *v114;
  void *v115;
  id v116;
  uint64_t v117;
  const __CFString *v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t n;
  uint64_t v129;
  GEOLocation *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  GEOAutomobileOptions *v135;
  uint64_t v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  GEOTransitOptions *v140;
  uint64_t v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  GEOWalkingOptions *v145;
  uint64_t v146;
  void *v147;
  const __CFString *v148;
  void *v149;
  id v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t ii;
  void *v155;
  id v156;
  uint64_t v157;
  const __CFString *v158;
  void *v159;
  id v160;
  uint64_t v161;
  const __CFString *v162;
  void *v163;
  const __CFString *v164;
  void *v165;
  const __CFString *v166;
  void *v167;
  id v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t jj;
  void *v173;
  id v174;
  uint64_t v175;
  const __CFString *v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  GEOPDVenueIdentifier *v180;
  void *v181;
  const __CFString *v182;
  void *v183;
  const __CFString *v184;
  void *v185;
  id v186;
  uint64_t v187;
  const __CFString *v188;
  void *v189;
  const __CFString *v190;
  void *v191;
  void *v192;
  const __CFString *v193;
  void *v194;
  const __CFString *v195;
  void *v196;
  const __CFString *v197;
  void *v198;
  const __CFString *v199;
  void *v200;
  const __CFString *v201;
  void *v202;
  const __CFString *v203;
  void *v204;
  const __CFString *v205;
  void *v206;
  id v207;
  uint64_t v208;
  const __CFString *v209;
  void *v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t kk;
  void *v216;
  id v217;
  uint64_t v218;
  const __CFString *v219;
  void *v220;
  const __CFString *v221;
  void *v222;
  GEOTraitsTransitScheduleFilter *v223;
  uint64_t v224;
  void *v225;
  const __CFString *v226;
  void *v227;
  const __CFString *v228;
  void *v229;
  id v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t mm;
  void *v235;
  id v236;
  uint64_t v237;
  const __CFString *v238;
  void *v239;
  const __CFString *v240;
  void *v241;
  const __CFString *v242;
  void *v243;
  const __CFString *v244;
  void *v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t nn;
  void *v251;
  id v252;
  uint64_t v253;
  const __CFString *v254;
  void *v255;
  id v256;
  uint64_t v257;
  const __CFString *v258;
  void *v259;
  GEOCyclingOptions *v260;
  uint64_t v261;
  void *v262;
  const __CFString *v263;
  void *v264;
  const __CFString *v265;
  void *v266;
  id v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t i1;
  uint64_t v272;
  GEOPDEvChargingPort *v273;
  uint64_t v274;
  void *v275;
  const __CFString *v276;
  void *v277;
  const __CFString *v278;
  void *v279;
  id v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t i2;
  void *v285;
  id v286;
  uint64_t v287;
  const __CFString *v288;
  void *v289;
  const __CFString *v290;
  void *v291;
  const __CFString *v292;
  void *v293;
  const __CFString *v294;
  void *v295;
  id v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t i3;
  void *v301;
  id v302;
  uint64_t v303;
  const __CFString *v304;
  void *v305;
  const __CFString *v306;
  void *v307;
  const __CFString *v308;
  void *v309;
  GEOPDViewportInfo *v310;
  uint64_t v311;
  void *v312;
  const __CFString *v313;
  void *v314;
  const __CFString *v315;
  void *v316;
  GEOPDResultRefinementQuery *v317;
  uint64_t v318;
  void *v319;
  const __CFString *v320;
  void *v321;
  void *v322;
  id v323;
  uint64_t v324;
  const __CFString *v325;
  void *v326;
  void *v327;
  const __CFString *v328;
  void *v329;
  id v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t i4;
  void *v335;
  id v336;
  uint64_t v337;
  const __CFString *v338;
  void *v339;
  id v340;
  uint64_t v341;
  const __CFString *v342;
  void *v343;
  GEOLatLng *v344;
  uint64_t v345;
  void *v346;
  const __CFString *v347;
  void *v348;
  id v349;
  uint64_t v350;
  const __CFString *v351;
  void *v352;
  GEOLatLng *v353;
  uint64_t v354;
  void *v355;
  const __CFString *v356;
  void *v357;
  GEOAddStopRouteInfo *v358;
  uint64_t v359;
  void *v360;
  const __CFString *v361;
  void *v362;
  const __CFString *v363;
  void *v364;
  const __CFString *v365;
  void *v366;
  const __CFString *v367;
  void *v368;
  GEOPrivacyMetadata *v369;
  uint64_t v370;
  void *v371;
  const __CFString *v372;
  void *v373;
  const __CFString *v374;
  void *v375;
  const __CFString *v376;
  void *v377;
  const __CFString *v378;
  void *v379;
  id v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t i5;
  void *v385;
  const __CFString *v386;
  void *v387;
  const __CFString *v388;
  void *v389;
  const __CFString *v390;
  void *v391;
  GEOSearchImplicitFilterInfo *v392;
  uint64_t v393;
  void *v394;
  const __CFString *v395;
  void *v396;
  id v397;
  uint64_t v398;
  const __CFString *v399;
  void *v400;
  const __CFString *v401;
  void *v402;
  void *v403;
  const __CFString *v404;
  void *v405;
  const __CFString *v406;
  void *v407;
  GEOPDAutocompleteSessionData *v408;
  uint64_t v409;
  void *v410;
  const __CFString *v411;
  void *v412;
  const __CFString *v413;
  void *v414;
  GEOPDSSessionUserActionMetadata *v415;
  uint64_t v416;
  void *v417;
  const __CFString *v418;
  void *v419;
  const __CFString *v420;
  void *v421;
  void *v422;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  id v432;
  int v433;
  __int128 v434;
  __int128 v435;
  __int128 v436;
  __int128 v437;
  __int128 v438;
  __int128 v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  __int128 v492;
  __int128 v493;
  uint64_t v494;
  uint64_t v495;
  _BYTE v496[128];
  _BYTE v497[128];
  _BYTE v498[128];
  _BYTE v499[128];
  _BYTE v500[128];
  _BYTE v501[128];
  _BYTE v502[128];
  _BYTE v503[128];
  _BYTE v504[128];
  _BYTE v505[128];
  _BYTE v506[128];
  _BYTE v507[128];
  _BYTE v508[128];
  _BYTE v509[128];
  _BYTE v510[128];
  uint64_t v511;

  v511 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_1047;
  v6 = (id)objc_msgSend(a1, "init");

  if (!v6)
  {
    a1 = 0;
    goto LABEL_1047;
  }
  if (a3)
    v7 = CFSTR("sessionId");
  else
    v7 = CFSTR("session_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v495 = 0;
    v494 = 0;
    _GEOSessionIDFromDictionaryRepresentation(v8, &v494);
    objc_msgSend(v6, "setSessionId:", v494, v495);
  }

  if (a3)
    v9 = CFSTR("sequenceNumber");
  else
    v9 = CFSTR("sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSequenceNumber:", objc_msgSend(v10, "unsignedIntValue"));

  if (a3)
    v11 = CFSTR("appIdentifier");
  else
    v11 = CFSTR("app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(v6, "setAppIdentifier:", v13);

  }
  if (a3)
    v14 = CFSTR("appMajorVersion");
  else
    v14 = CFSTR("app_major_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v6, "setAppMajorVersion:", v16);

  }
  if (a3)
    v17 = CFSTR("appMinorVersion");
  else
    v17 = CFSTR("app_minor_version");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v6, "setAppMinorVersion:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("deviceLocation"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v22 = -[GEOLocation initWithJSON:](v21, "initWithJSON:", v20);
    else
      v22 = -[GEOLocation initWithDictionary:](v21, "initWithDictionary:", v20);
    v23 = (void *)v22;
    objc_msgSend(v6, "setDeviceLocation:", v22);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transportType"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v432 = v5;
  v433 = a3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v492 = 0u;
    v493 = 0u;
    v490 = 0u;
    v491 = 0u;
    v424 = v24;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v490, v510, 16);
    if (!v26)
      goto LABEL_62;
    v27 = v26;
    v28 = *(_QWORD *)v491;
    while (1)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v491 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v490 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v31 = v30;
          if ((objc_msgSend(v31, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
          {
            v32 = 0;
          }
          else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
          {
            v32 = 1;
          }
          else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
          {
            v32 = 2;
          }
          else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
          {
            v32 = 3;
          }
          else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
          {
            v32 = 4;
          }
          else if ((objc_msgSend(v31, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
          {
            v32 = 5;
          }
          else if (objc_msgSend(v31, "isEqualToString:", CFSTR("RIDESHARE")))
          {
            v32 = 6;
          }
          else
          {
            v32 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v32 = objc_msgSend(v30, "intValue");
        }
        objc_msgSend(v6, "addTransportType:", v32);
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v490, v510, 16);
      if (!v27)
      {
LABEL_62:

        v24 = v424;
        v5 = v432;
        break;
      }
    }
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mapRegion"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v35 = -[GEOMapRegion initWithJSON:](v34, "initWithJSON:", v33);
    else
      v35 = -[GEOMapRegion initWithDictionary:](v34, "initWithDictionary:", v33);
    v36 = (void *)v35;
    objc_msgSend(v6, "setMapRegion:", v35);

  }
  if (a3)
    v37 = CFSTR("deviceDisplayLanguage");
  else
    v37 = CFSTR("device_display_language");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v488 = 0u;
    v489 = 0u;
    v486 = 0u;
    v487 = 0u;
    v39 = v38;
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v486, v509, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v487;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v487 != v42)
            objc_enumerationMutation(v39);
          v44 = *(void **)(*((_QWORD *)&v486 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v45 = (void *)objc_msgSend(v44, "copy");
            objc_msgSend(v6, "addDeviceDisplayLanguage:", v45);

          }
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v486, v509, 16);
      }
      while (v41);
    }

    a3 = v433;
  }

  if (a3)
    v46 = CFSTR("deviceKeyboardLocale");
  else
    v46 = CFSTR("device_keyboard_locale");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v6, "setDeviceKeyboardLocale:", v48);

  }
  if (a3)
    v49 = CFSTR("deviceSpokenLocale");
  else
    v49 = CFSTR("device_spoken_locale");
  objc_msgSend(v5, "objectForKeyedSubscript:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v51 = (void *)objc_msgSend(v50, "copy");
    objc_msgSend(v6, "setDeviceSpokenLocale:", v51);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isAPICall"));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsAPICall:", objc_msgSend(v52, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("source"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = v53;
    if ((objc_msgSend(v54, "isEqualToString:", CFSTR("UNKNOWN_SOURCE")) & 1) != 0)
    {
      v55 = 0;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v55 = 1;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("USER")) & 1) != 0)
    {
      v55 = 2;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("REFINEMENT")) & 1) != 0)
    {
      v55 = 3;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("SPELLING")) & 1) != 0)
    {
      v55 = 4;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("HINT_CONTACTS")) & 1) != 0)
    {
      v55 = 5;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("STARK_USER")) & 1) != 0)
    {
      v55 = 6;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("HINT_COMPLETION")) & 1) != 0)
    {
      v55 = 7;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("STARK_HINT_COMPLETION")) & 1) != 0)
    {
      v55 = 8;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("HINT_HISTORY")) & 1) != 0)
    {
      v55 = 9;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("STARK_HINT_HISTORY")) & 1) != 0)
    {
      v55 = 10;
    }
    else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("AUTOCOMPLETE_SEARCH")) & 1) != 0)
    {
      v55 = 11;
    }
    else
    {
      if ((objc_msgSend(v54, "isEqualToString:", CFSTR("STARK_AUTOCOMPLETE_SEARCH")) & 1) != 0)
      {
        v55 = 12;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_FROM")) & 1) != 0)
      {
        v55 = 13;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("AUTOCOMPLETE_NAV_TO")) & 1) != 0)
      {
        v55 = 14;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("NAV_FROM")) & 1) != 0)
      {
        v55 = 15;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("NAV_TO")) & 1) != 0)
      {
        v55 = 16;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("BOOKMARK_REFRESH")) & 1) != 0)
      {
        v55 = 17;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("ROUTING")) & 1) != 0)
      {
        v55 = 18;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("PRELOADER")) & 1) != 0)
      {
        v55 = 19;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("USER_NO_TYPING")) & 1) != 0)
      {
        v55 = 20;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("ADD_TO_FAVORITES")) & 1) != 0)
      {
        v55 = 21;
      }
      else if ((objc_msgSend(v54, "isEqualToString:", CFSTR("ADD_TO_COLLECTION")) & 1) != 0)
      {
        v55 = 22;
      }
      else if (objc_msgSend(v54, "isEqualToString:", CFSTR("RAP_HINT_COMPLETION")))
      {
        v55 = 23;
      }
      else
      {
        v55 = 0;
      }
      v5 = v432;
      a3 = v433;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_149;
    v55 = objc_msgSend(v53, "intValue");
  }
  objc_msgSend(v6, "setSource:", v55);
LABEL_149:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photoSizes"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v484 = 0u;
    v485 = 0u;
    v482 = 0u;
    v483 = 0u;
    v57 = v56;
    v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v482, v508, 16);
    if (v58)
    {
      v59 = v58;
      v60 = *(_QWORD *)v483;
      do
      {
        for (k = 0; k != v59; ++k)
        {
          if (*(_QWORD *)v483 != v60)
            objc_enumerationMutation(v57);
          v62 = *(_QWORD *)(*((_QWORD *)&v482 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v63 = [GEOTraitsPhotoSize alloc];
            if ((v433 & 1) != 0)
              v64 = -[GEOTraitsPhotoSize initWithJSON:](v63, "initWithJSON:", v62);
            else
              v64 = -[GEOTraitsPhotoSize initWithDictionary:](v63, "initWithDictionary:", v62);
            v65 = (void *)v64;
            objc_msgSend(v6, "addPhotoSizes:", v64);

          }
        }
        v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v482, v508, 16);
      }
      while (v59);
    }

    v5 = v432;
    a3 = v433;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photosCount"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPhotosCount:", objc_msgSend(v66, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reviewUserPhotoSizes"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v480 = 0u;
    v481 = 0u;
    v478 = 0u;
    v479 = 0u;
    v68 = v67;
    v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v478, v507, 16);
    if (v69)
    {
      v70 = v69;
      v71 = *(_QWORD *)v479;
      do
      {
        for (m = 0; m != v70; ++m)
        {
          if (*(_QWORD *)v479 != v71)
            objc_enumerationMutation(v68);
          v73 = *(_QWORD *)(*((_QWORD *)&v478 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v74 = [GEOTraitsPhotoSize alloc];
            if ((v433 & 1) != 0)
              v75 = -[GEOTraitsPhotoSize initWithJSON:](v74, "initWithJSON:", v73);
            else
              v75 = -[GEOTraitsPhotoSize initWithDictionary:](v74, "initWithDictionary:", v73);
            v76 = (void *)v75;
            objc_msgSend(v6, "addReviewUserPhotoSizes:", v75);

          }
        }
        v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v478, v507, 16);
      }
      while (v70);
    }

    v5 = v432;
    a3 = v433;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("reviewUserPhotosCount"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setReviewUserPhotosCount:", objc_msgSend(v77, "unsignedIntValue"));

  if (a3)
    v78 = CFSTR("timeSinceMapEnteredForeground");
  else
    v78 = CFSTR("time_since_map_entered_foreground");
  objc_msgSend(v5, "objectForKeyedSubscript:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTimeSinceMapEnteredForeground:", objc_msgSend(v79, "unsignedIntValue"));

  if (a3)
    v80 = CFSTR("timeSinceMapViewportChanged");
  else
    v80 = CFSTR("time_since_map_viewport_changed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setTimeSinceMapViewportChanged:", objc_msgSend(v81, "unsignedIntValue"));

  if (a3)
    v82 = CFSTR("carHeadunitInteractionModel");
  else
    v82 = CFSTR("car_headunit_interaction_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v84 = v83;
    if ((objc_msgSend(v84, "isEqualToString:", CFSTR("CAR_HIFI")) & 1) != 0)
    {
      v85 = 1;
    }
    else if ((objc_msgSend(v84, "isEqualToString:", CFSTR("CAR_LOFI")) & 1) != 0)
    {
      v85 = 2;
    }
    else if (objc_msgSend(v84, "isEqualToString:", CFSTR("CAR_PHYSICAL")))
    {
      v85 = 3;
    }
    else
    {
      v85 = 1;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_206;
    v85 = objc_msgSend(v83, "intValue");
  }
  objc_msgSend(v6, "setCarHeadunitInteractionModel:", v85);
LABEL_206:

  if (a3)
    v86 = CFSTR("carHeadunitManufacturer");
  else
    v86 = CFSTR("car_headunit_manufacturer");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v88 = (void *)objc_msgSend(v87, "copy");
    objc_msgSend(v6, "setCarHeadunitManufacturer:", v88);

  }
  if (a3)
    v89 = CFSTR("carHeadunitModel");
  else
    v89 = CFSTR("car_headunit_model");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = (void *)objc_msgSend(v90, "copy");
    objc_msgSend(v6, "setCarHeadunitModel:", v91);

  }
  if (a3)
    v92 = CFSTR("carHeadunitPixelWidth");
  else
    v92 = CFSTR("car_headunit_pixel_width");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v93, "doubleValue");
    objc_msgSend(v6, "setCarHeadunitPixelWidth:");
  }

  if (a3)
    v94 = CFSTR("carHeadunitPixelHeight");
  else
    v94 = CFSTR("car_headunit_pixel_height");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v95, "doubleValue");
    objc_msgSend(v6, "setCarHeadunitPixelHeight:");
  }

  if (a3)
    v96 = CFSTR("transitScheduleFilter");
  else
    v96 = CFSTR("transit_schedule_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v98 = [GEOTraitsTransitScheduleFilter alloc];
    if ((a3 & 1) != 0)
      v99 = -[GEOTraitsTransitScheduleFilter initWithJSON:](v98, "initWithJSON:", v97);
    else
      v99 = -[GEOTraitsTransitScheduleFilter initWithDictionary:](v98, "initWithDictionary:", v97);
    v100 = (void *)v99;
    objc_msgSend(v6, "setTransitScheduleFilter:", v99);

  }
  if (a3)
    v101 = CFSTR("mapZoomLevel");
  else
    v101 = CFSTR("map_zoom_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v101);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v102, "doubleValue");
    objc_msgSend(v6, "setMapZoomLevel:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("mode"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v104 = v103;
    if ((objc_msgSend(v104, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
    {
      v105 = 0;
    }
    else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("STANDARD")) & 1) != 0)
    {
      v105 = 1;
    }
    else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("SATELLITE")) & 1) != 0)
    {
      v105 = 2;
    }
    else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("HYBRID")) & 1) != 0)
    {
      v105 = 3;
    }
    else if (objc_msgSend(v104, "isEqualToString:", CFSTR("TRANSIT")))
    {
      v105 = 4;
    }
    else
    {
      v105 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_255;
    v105 = objc_msgSend(v103, "intValue");
  }
  objc_msgSend(v6, "setMode:", v105);
LABEL_255:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("displayRegion"));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v107 = (void *)objc_msgSend(v106, "copy");
    objc_msgSend(v6, "setDisplayRegion:", v107);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("providerID"));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v109 = (void *)objc_msgSend(v108, "copy");
    objc_msgSend(v6, "setProviderID:", v109);

  }
  if (a3)
    v110 = CFSTR("deviceInterfaceOrientation");
  else
    v110 = CFSTR("device_interface_orientation");
  objc_msgSend(v5, "objectForKeyedSubscript:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = v111;
    if ((objc_msgSend(v112, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_UNKNOWN")) & 1) != 0)
    {
      v113 = 0;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_PORTRAIT")) & 1) != 0)
    {
      v113 = 1;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN")) & 1) != 0)
    {
      v113 = 2;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_LANDSCAPE_LEFT")) & 1) != 0)
    {
      v113 = 3;
    }
    else if (objc_msgSend(v112, "isEqualToString:", CFSTR("DEVICE_ORIENTATION_LANDSCAPE_RIGHT")))
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
      goto LABEL_278;
    v113 = objc_msgSend(v111, "intValue");
  }
  objc_msgSend(v6, "setDeviceInterfaceOrientation:", v113);
LABEL_278:

  if (a3)
    v114 = CFSTR("deviceBatteryState");
  else
    v114 = CFSTR("device_battery_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v116 = v115;
    if ((objc_msgSend(v116, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_UNKNOWN")) & 1) != 0)
    {
      v117 = 0;
    }
    else if ((objc_msgSend(v116, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_UNPLUGGED")) & 1) != 0)
    {
      v117 = 1;
    }
    else if ((objc_msgSend(v116, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_CHARGING")) & 1) != 0)
    {
      v117 = 2;
    }
    else if (objc_msgSend(v116, "isEqualToString:", CFSTR("DEVICE_BATTERY_STATE_FULL")))
    {
      v117 = 3;
    }
    else
    {
      v117 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_295;
    v117 = objc_msgSend(v115, "intValue");
  }
  objc_msgSend(v6, "setDeviceBatteryState:", v117);
LABEL_295:

  if (a3)
    v118 = CFSTR("carHeadunitConnectionType");
  else
    v118 = CFSTR("car_headunit_connection_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = v119;
    if ((objc_msgSend(v120, "isEqualToString:", CFSTR("CONNECTION_UNKNOWN")) & 1) != 0)
    {
      v121 = 0;
    }
    else if ((objc_msgSend(v120, "isEqualToString:", CFSTR("CONNECTION_CABLE")) & 1) != 0)
    {
      v121 = 1;
    }
    else if (objc_msgSend(v120, "isEqualToString:", CFSTR("CONNECTION_WIRELESS")))
    {
      v121 = 2;
    }
    else
    {
      v121 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_310;
    v121 = objc_msgSend(v119, "intValue");
  }
  objc_msgSend(v6, "setCarHeadunitConnectionType:", v121);
LABEL_310:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("navigating"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setNavigating:", objc_msgSend(v122, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("historicalLocations"));
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v476 = 0u;
    v477 = 0u;
    v474 = 0u;
    v475 = 0u;
    v124 = v123;
    v125 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v474, v506, 16);
    if (v125)
    {
      v126 = v125;
      v127 = *(_QWORD *)v475;
      do
      {
        for (n = 0; n != v126; ++n)
        {
          if (*(_QWORD *)v475 != v127)
            objc_enumerationMutation(v124);
          v129 = *(_QWORD *)(*((_QWORD *)&v474 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v130 = [GEOLocation alloc];
            if ((v433 & 1) != 0)
              v131 = -[GEOLocation initWithJSON:](v130, "initWithJSON:", v129);
            else
              v131 = -[GEOLocation initWithDictionary:](v130, "initWithDictionary:", v129);
            v132 = (void *)v131;
            objc_msgSend(v6, "addHistoricalLocations:", v131);

          }
        }
        v126 = objc_msgSend(v124, "countByEnumeratingWithState:objects:count:", &v474, v506, 16);
      }
      while (v126);
    }

    v5 = v432;
    a3 = v433;
  }

  if (a3)
    v133 = CFSTR("automobileOptions");
  else
    v133 = CFSTR("automobile_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v135 = [GEOAutomobileOptions alloc];
    if ((a3 & 1) != 0)
      v136 = -[GEOAutomobileOptions initWithJSON:](v135, "initWithJSON:", v134);
    else
      v136 = -[GEOAutomobileOptions initWithDictionary:](v135, "initWithDictionary:", v134);
    v137 = (void *)v136;
    objc_msgSend(v6, "setAutomobileOptions:", v136);

  }
  if (a3)
    v138 = CFSTR("transitOptions");
  else
    v138 = CFSTR("transit_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v140 = [GEOTransitOptions alloc];
    if ((a3 & 1) != 0)
      v141 = -[GEOTransitOptions initWithJSON:](v140, "initWithJSON:", v139);
    else
      v141 = -[GEOTransitOptions initWithDictionary:](v140, "initWithDictionary:", v139);
    v142 = (void *)v141;
    objc_msgSend(v6, "setTransitOptions:", v141);

  }
  if (a3)
    v143 = CFSTR("walkingOptions");
  else
    v143 = CFSTR("walking_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = [GEOWalkingOptions alloc];
    if ((a3 & 1) != 0)
      v146 = -[GEOWalkingOptions initWithJSON:](v145, "initWithJSON:", v144);
    else
      v146 = -[GEOWalkingOptions initWithDictionary:](v145, "initWithDictionary:", v144);
    v147 = (void *)v146;
    objc_msgSend(v6, "setWalkingOptions:", v146);

  }
  if (a3)
    v148 = CFSTR("engineType");
  else
    v148 = CFSTR("engine_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v472 = 0u;
    v473 = 0u;
    v470 = 0u;
    v471 = 0u;
    v425 = v149;
    v150 = v149;
    v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v470, v505, 16);
    if (!v151)
      goto LABEL_377;
    v152 = v151;
    v153 = *(_QWORD *)v471;
    while (1)
    {
      for (ii = 0; ii != v152; ++ii)
      {
        if (*(_QWORD *)v471 != v153)
          objc_enumerationMutation(v150);
        v155 = *(void **)(*((_QWORD *)&v470 + 1) + 8 * ii);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v156 = v155;
          if ((objc_msgSend(v156, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_UNKNOWN")) & 1) != 0)
          {
            v157 = 0;
          }
          else if ((objc_msgSend(v156, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_GASOLINE")) & 1) != 0)
          {
            v157 = 1;
          }
          else if ((objc_msgSend(v156, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_DIESEL")) & 1) != 0)
          {
            v157 = 2;
          }
          else if ((objc_msgSend(v156, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_ELECTRIC")) & 1) != 0)
          {
            v157 = 3;
          }
          else if (objc_msgSend(v156, "isEqualToString:", CFSTR("CAR_ENGINE_TYPE_CNG")))
          {
            v157 = 4;
          }
          else
          {
            v157 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v157 = objc_msgSend(v155, "intValue");
        }
        objc_msgSend(v6, "addEngineType:", v157);
      }
      v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v470, v505, 16);
      if (!v152)
      {
LABEL_377:

        v149 = v425;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v158 = CFSTR("requestMode");
  else
    v158 = CFSTR("request_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v160 = v159;
    if ((objc_msgSend(v160, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v161 = 0;
    }
    else if ((objc_msgSend(v160, "isEqualToString:", CFSTR("ONLINE_OFFLINE_FAILOVER")) & 1) != 0)
    {
      v161 = 1;
    }
    else if ((objc_msgSend(v160, "isEqualToString:", CFSTR("ONLINE_FAST_FAIL")) & 1) != 0)
    {
      v161 = 2;
    }
    else if ((objc_msgSend(v160, "isEqualToString:", CFSTR("ONLINE_ONLY")) & 1) != 0)
    {
      v161 = 3;
    }
    else if (objc_msgSend(v160, "isEqualToString:", CFSTR("OFFLINE_ONLY")))
    {
      v161 = 4;
    }
    else
    {
      v161 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_397;
    v161 = objc_msgSend(v159, "intValue");
  }
  objc_msgSend(v6, "setRequestMode:", v161);
LABEL_397:

  if (a3)
    v162 = CFSTR("supportDirectionIntentSearch");
  else
    v162 = CFSTR("support_direction_intent_search");
  objc_msgSend(v5, "objectForKeyedSubscript:", v162);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportDirectionIntentSearch:", objc_msgSend(v163, "BOOLValue"));

  if (a3)
    v164 = CFSTR("supportDymSuggestion");
  else
    v164 = CFSTR("support_dym_suggestion");
  objc_msgSend(v5, "objectForKeyedSubscript:", v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportDymSuggestion:", objc_msgSend(v165, "BOOLValue"));

  if (a3)
    v166 = CFSTR("knownClientResolvedType");
  else
    v166 = CFSTR("known_client_resolved_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v468 = 0u;
    v469 = 0u;
    v466 = 0u;
    v467 = 0u;
    v426 = v167;
    v168 = v167;
    v169 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v466, v504, 16);
    if (!v169)
      goto LABEL_438;
    v170 = v169;
    v171 = *(_QWORD *)v467;
    while (1)
    {
      for (jj = 0; jj != v170; ++jj)
      {
        if (*(_QWORD *)v467 != v171)
          objc_enumerationMutation(v168);
        v173 = *(void **)(*((_QWORD *)&v466 + 1) + 8 * jj);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v174 = v173;
          if ((objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
          {
            v175 = 0;
          }
          else if ((objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
          {
            v175 = 1;
          }
          else if ((objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
          {
            v175 = 2;
          }
          else if ((objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
          {
            v175 = 3;
          }
          else if ((objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
          {
            v175 = 4;
          }
          else if ((objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
          {
            v175 = 5;
          }
          else if (objc_msgSend(v174, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
          {
            v175 = 6;
          }
          else
          {
            v175 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v175 = objc_msgSend(v173, "intValue");
        }
        objc_msgSend(v6, "addKnownClientResolvedType:", v175);
      }
      v170 = objc_msgSend(v168, "countByEnumeratingWithState:objects:count:", &v466, v504, 16);
      if (!v170)
      {
LABEL_438:

        v167 = v426;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v176 = CFSTR("wantsBrandIcon");
  else
    v176 = CFSTR("wants_brand_icon");
  objc_msgSend(v5, "objectForKeyedSubscript:", v176);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setWantsBrandIcon:", objc_msgSend(v177, "BOOLValue"));

  if (a3)
    v178 = CFSTR("venueIdentifier");
  else
    v178 = CFSTR("venue_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = [GEOPDVenueIdentifier alloc];
    if (v180)
      v181 = (void *)-[GEOPDVenueIdentifier _initWithDictionary:isJSON:]((uint64_t)v180, v179, a3);
    else
      v181 = 0;
    objc_msgSend(v6, "setVenueIdentifier:", v181);

  }
  if (a3)
    v182 = CFSTR("deviceInVehicle");
  else
    v182 = CFSTR("device_in_vehicle");
  objc_msgSend(v5, "objectForKeyedSubscript:", v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDeviceInVehicle:", objc_msgSend(v183, "BOOLValue"));

  if (a3)
    v184 = CFSTR("requestPriority");
  else
    v184 = CFSTR("request_priority");
  objc_msgSend(v5, "objectForKeyedSubscript:", v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v186 = v185;
    if ((objc_msgSend(v186, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v187 = 0;
    }
    else if ((objc_msgSend(v186, "isEqualToString:", CFSTR("BACKGROUND")) & 1) != 0)
    {
      v187 = 1;
    }
    else if (objc_msgSend(v186, "isEqualToString:", CFSTR("USER_INITIATED")))
    {
      v187 = 2;
    }
    else
    {
      v187 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_471;
    v187 = objc_msgSend(v185, "intValue");
  }
  objc_msgSend(v6, "setRequestPriority:", v187);
LABEL_471:

  if (a3)
    v188 = CFSTR("httpRequestPriority");
  else
    v188 = CFSTR("http_request_priority");
  objc_msgSend(v5, "objectForKeyedSubscript:", v188);
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setHttpRequestPriority:", objc_msgSend(v189, "unsignedIntValue"));

  if (a3)
    v190 = CFSTR("analyticsAppIdentifier");
  else
    v190 = CFSTR("analytics_app_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v192 = (void *)objc_msgSend(v191, "copy");
    objc_msgSend(v6, "setAnalyticsAppIdentifier:", v192);

  }
  if (a3)
    v193 = CFSTR("sessionRelativeTimestamp");
  else
    v193 = CFSTR("session_relative_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v193);
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v194, "doubleValue");
    objc_msgSend(v6, "setSessionRelativeTimestamp:");
  }

  if (a3)
    v195 = CFSTR("supportDirectionIntentAutocomplete");
  else
    v195 = CFSTR("support_direction_intent_autocomplete");
  objc_msgSend(v5, "objectForKeyedSubscript:", v195);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportDirectionIntentAutocomplete:", objc_msgSend(v196, "BOOLValue"));

  if (a3)
    v197 = CFSTR("supportUnresolvedDirectionIntent");
  else
    v197 = CFSTR("support_unresolved_direction_intent");
  objc_msgSend(v5, "objectForKeyedSubscript:", v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportUnresolvedDirectionIntent:", objc_msgSend(v198, "BOOLValue"));

  if (a3)
    v199 = CFSTR("deviceDarkMode");
  else
    v199 = CFSTR("device_dark_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setDeviceDarkMode:", objc_msgSend(v200, "BOOLValue"));

  if (a3)
    v201 = CFSTR("appDarkMode");
  else
    v201 = CFSTR("app_dark_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAppDarkMode:", objc_msgSend(v202, "BOOLValue"));

  if (a3)
    v203 = CFSTR("supportsBrandFallback");
  else
    v203 = CFSTR("supports_brand_fallback");
  objc_msgSend(v5, "objectForKeyedSubscript:", v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportsBrandFallback:", objc_msgSend(v204, "BOOLValue"));

  if (a3)
    v205 = CFSTR("requestPurpose");
  else
    v205 = CFSTR("request_purpose");
  objc_msgSend(v5, "objectForKeyedSubscript:", v205);
  v206 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v207 = v206;
    if ((objc_msgSend(v207, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      v208 = 0;
    else
      v208 = objc_msgSend(v207, "isEqualToString:", CFSTR("ROUTE_WAYPOINT_RESOLUTION"));

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_522;
    v208 = objc_msgSend(v206, "intValue");
  }
  objc_msgSend(v6, "setRequestPurpose:", v208);
LABEL_522:

  if (a3)
    v209 = CFSTR("supportedAutocompleteListType");
  else
    v209 = CFSTR("supported_autocomplete_list_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v464 = 0u;
    v465 = 0u;
    v462 = 0u;
    v463 = 0u;
    v427 = v210;
    v211 = v210;
    v212 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v462, v503, 16);
    if (!v212)
      goto LABEL_545;
    v213 = v212;
    v214 = *(_QWORD *)v463;
    while (1)
    {
      for (kk = 0; kk != v213; ++kk)
      {
        if (*(_QWORD *)v463 != v214)
          objc_enumerationMutation(v211);
        v216 = *(void **)(*((_QWORD *)&v462 + 1) + 8 * kk);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v217 = v216;
          if ((objc_msgSend(v217, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v218 = 0;
          }
          else if ((objc_msgSend(v217, "isEqualToString:", CFSTR("INTERLEAVED")) & 1) != 0)
          {
            v218 = 1;
          }
          else if (objc_msgSend(v217, "isEqualToString:", CFSTR("SECTION_ONLY_FOR_QUERY")))
          {
            v218 = 2;
          }
          else
          {
            v218 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v218 = objc_msgSend(v216, "intValue");
        }
        objc_msgSend(v6, "addSupportedAutocompleteListType:", v218);
      }
      v213 = objc_msgSend(v211, "countByEnumeratingWithState:objects:count:", &v462, v503, 16);
      if (!v213)
      {
LABEL_545:

        v210 = v427;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v219 = CFSTR("isSettlement");
  else
    v219 = CFSTR("is_settlement");
  objc_msgSend(v5, "objectForKeyedSubscript:", v219);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsSettlement:", objc_msgSend(v220, "BOOLValue"));

  if (a3)
    v221 = CFSTR("transitTripStopTimeFilter");
  else
    v221 = CFSTR("transit_trip_stop_time_filter");
  objc_msgSend(v5, "objectForKeyedSubscript:", v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v223 = [GEOTraitsTransitScheduleFilter alloc];
    if ((a3 & 1) != 0)
      v224 = -[GEOTraitsTransitScheduleFilter initWithJSON:](v223, "initWithJSON:", v222);
    else
      v224 = -[GEOTraitsTransitScheduleFilter initWithDictionary:](v223, "initWithDictionary:", v222);
    v225 = (void *)v224;
    objc_msgSend(v6, "setTransitTripStopTimeFilter:", v224);

  }
  if (a3)
    v226 = CFSTR("supportClientRankingFeatureMetadata");
  else
    v226 = CFSTR("support_client_ranking_feature_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportClientRankingFeatureMetadata:", objc_msgSend(v227, "BOOLValue"));

  if (a3)
    v228 = CFSTR("supportedChildAction");
  else
    v228 = CFSTR("supported_child_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v228);
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v460 = 0u;
    v461 = 0u;
    v458 = 0u;
    v459 = 0u;
    v428 = v229;
    v230 = v229;
    v231 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v458, v502, 16);
    if (!v231)
      goto LABEL_599;
    v232 = v231;
    v233 = *(_QWORD *)v459;
    while (1)
    {
      for (mm = 0; mm != v232; ++mm)
      {
        if (*(_QWORD *)v459 != v233)
          objc_enumerationMutation(v230);
        v235 = *(void **)(*((_QWORD *)&v458 + 1) + 8 * mm);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v236 = v235;
          if ((objc_msgSend(v236, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v237 = 0;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
          {
            v237 = 1;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
          {
            v237 = 2;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("SEARCH")) & 1) != 0)
          {
            v237 = 3;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("LOOK_AROUND")) & 1) != 0)
          {
            v237 = 4;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("CALL")) & 1) != 0)
          {
            v237 = 5;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("WEBSITE")) & 1) != 0)
          {
            v237 = 6;
          }
          else if ((objc_msgSend(v236, "isEqualToString:", CFSTR("GUIDES")) & 1) != 0)
          {
            v237 = 7;
          }
          else if (objc_msgSend(v236, "isEqualToString:", CFSTR("DOWNLOAD_OFFLINE_MAP")))
          {
            v237 = 8;
          }
          else
          {
            v237 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v237 = objc_msgSend(v235, "intValue");
        }
        objc_msgSend(v6, "addSupportedChildAction:", v237);
      }
      v232 = objc_msgSend(v230, "countByEnumeratingWithState:objects:count:", &v458, v502, 16);
      if (!v232)
      {
LABEL_599:

        v229 = v428;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v238 = CFSTR("supportChildItems");
  else
    v238 = CFSTR("support_child_items");
  objc_msgSend(v5, "objectForKeyedSubscript:", v238);
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportChildItems:", objc_msgSend(v239, "BOOLValue"));

  if (a3)
    v240 = CFSTR("isRefund");
  else
    v240 = CFSTR("is_refund");
  objc_msgSend(v5, "objectForKeyedSubscript:", v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsRefund:", objc_msgSend(v241, "BOOLValue"));

  if (a3)
    v242 = CFSTR("autocompleteRequestSupportsSectionHeader");
  else
    v242 = CFSTR("autocomplete_request_supports_section_header");
  objc_msgSend(v5, "objectForKeyedSubscript:", v242);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAutocompleteRequestSupportsSectionHeader:", objc_msgSend(v243, "BOOLValue"));

  if (a3)
    v244 = CFSTR("supportedAutocompleteResultCellType");
  else
    v244 = CFSTR("supported_autocomplete_result_cell_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v244);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v456 = 0u;
    v457 = 0u;
    v454 = 0u;
    v455 = 0u;
    v429 = v245;
    v246 = v245;
    v247 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v454, v501, 16);
    if (!v247)
      goto LABEL_642;
    v248 = v247;
    v249 = *(_QWORD *)v455;
    while (1)
    {
      for (nn = 0; nn != v248; ++nn)
      {
        if (*(_QWORD *)v455 != v249)
          objc_enumerationMutation(v246);
        v251 = *(void **)(*((_QWORD *)&v454 + 1) + 8 * nn);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v252 = v251;
          if ((objc_msgSend(v252, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
          {
            v253 = 0;
          }
          else if ((objc_msgSend(v252, "isEqualToString:", CFSTR("PROMINENT_QUERY")) & 1) != 0)
          {
            v253 = 1;
          }
          else if ((objc_msgSend(v252, "isEqualToString:", CFSTR("PROMINENT_RESULT")) & 1) != 0)
          {
            v253 = 2;
          }
          else if ((objc_msgSend(v252, "isEqualToString:", CFSTR("TWO_LINE")) & 1) != 0)
          {
            v253 = 3;
          }
          else if (objc_msgSend(v252, "isEqualToString:", CFSTR("PROMINENT_RESULT_TWO_LINE")))
          {
            v253 = 4;
          }
          else
          {
            v253 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v253 = objc_msgSend(v251, "intValue");
        }
        objc_msgSend(v6, "addSupportedAutocompleteResultCellType:", v253);
      }
      v248 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v454, v501, 16);
      if (!v248)
      {
LABEL_642:

        v245 = v429;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v254 = CFSTR("navigationTransportType");
  else
    v254 = CFSTR("navigation_transport_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v254);
  v255 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v256 = v255;
    if ((objc_msgSend(v256, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v257 = 0;
    }
    else if ((objc_msgSend(v256, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v257 = 1;
    }
    else if ((objc_msgSend(v256, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v257 = 2;
    }
    else if ((objc_msgSend(v256, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v257 = 3;
    }
    else if ((objc_msgSend(v256, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v257 = 4;
    }
    else if ((objc_msgSend(v256, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v257 = 5;
    }
    else if (objc_msgSend(v256, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v257 = 6;
    }
    else
    {
      v257 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_666;
    v257 = objc_msgSend(v255, "intValue");
  }
  objc_msgSend(v6, "setNavigationTransportType:", v257);
LABEL_666:

  if (a3)
    v258 = CFSTR("cyclingOptions");
  else
    v258 = CFSTR("cycling_options");
  objc_msgSend(v5, "objectForKeyedSubscript:", v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v260 = [GEOCyclingOptions alloc];
    if ((a3 & 1) != 0)
      v261 = -[GEOCyclingOptions initWithJSON:](v260, "initWithJSON:", v259);
    else
      v261 = -[GEOCyclingOptions initWithDictionary:](v260, "initWithDictionary:", v259);
    v262 = (void *)v261;
    objc_msgSend(v6, "setCyclingOptions:", v261);

  }
  if (a3)
    v263 = CFSTR("ratingsCount");
  else
    v263 = CFSTR("ratings_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v263);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setRatingsCount:", objc_msgSend(v264, "unsignedIntValue"));

  if (a3)
    v265 = CFSTR("evChargingPort");
  else
    v265 = CFSTR("ev_charging_port");
  objc_msgSend(v5, "objectForKeyedSubscript:", v265);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v452 = 0u;
    v453 = 0u;
    v450 = 0u;
    v451 = 0u;
    v267 = v266;
    v268 = objc_msgSend(v267, "countByEnumeratingWithState:objects:count:", &v450, v500, 16);
    if (v268)
    {
      v269 = v268;
      v270 = *(_QWORD *)v451;
      do
      {
        for (i1 = 0; i1 != v269; ++i1)
        {
          if (*(_QWORD *)v451 != v270)
            objc_enumerationMutation(v267);
          v272 = *(_QWORD *)(*((_QWORD *)&v450 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v273 = [GEOPDEvChargingPort alloc];
            if ((v433 & 1) != 0)
              v274 = -[GEOPDEvChargingPort initWithJSON:](v273, "initWithJSON:", v272);
            else
              v274 = -[GEOPDEvChargingPort initWithDictionary:](v273, "initWithDictionary:", v272);
            v275 = (void *)v274;
            objc_msgSend(v6, "addEvChargingPort:", v274);

          }
        }
        v269 = objc_msgSend(v267, "countByEnumeratingWithState:objects:count:", &v450, v500, 16);
      }
      while (v269);
    }

    v5 = v432;
    a3 = v433;
  }

  if (a3)
    v276 = CFSTR("isWidgetRequest");
  else
    v276 = CFSTR("is_widget_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v276);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsWidgetRequest:", objc_msgSend(v277, "BOOLValue"));

  if (a3)
    v278 = CFSTR("supportedSearchTierType");
  else
    v278 = CFSTR("supported_search_tier_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v278);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v448 = 0u;
    v449 = 0u;
    v446 = 0u;
    v447 = 0u;
    v430 = v279;
    v280 = v279;
    v281 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v446, v499, 16);
    if (!v281)
      goto LABEL_724;
    v282 = v281;
    v283 = *(_QWORD *)v447;
    while (1)
    {
      for (i2 = 0; i2 != v282; ++i2)
      {
        if (*(_QWORD *)v447 != v283)
          objc_enumerationMutation(v280);
        v285 = *(void **)(*((_QWORD *)&v446 + 1) + 8 * i2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v286 = v285;
          if ((objc_msgSend(v286, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v287 = 0;
          }
          else if ((objc_msgSend(v286, "isEqualToString:", CFSTR("PRIMARY")) & 1) != 0)
          {
            v287 = 1;
          }
          else if (objc_msgSend(v286, "isEqualToString:", CFSTR("AUXILIARY")))
          {
            v287 = 2;
          }
          else
          {
            v287 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v287 = objc_msgSend(v285, "intValue");
        }
        objc_msgSend(v6, "addSupportedSearchTierType:", v287);
      }
      v282 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v446, v499, 16);
      if (!v282)
      {
LABEL_724:

        v279 = v430;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v288 = CFSTR("auxiliaryTierNumResults");
  else
    v288 = CFSTR("auxiliary_tier_num_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v288);
  v289 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAuxiliaryTierNumResults:", objc_msgSend(v289, "unsignedIntValue"));

  if (a3)
    v290 = CFSTR("placeSummaryRevision");
  else
    v290 = CFSTR("place_summary_revision");
  objc_msgSend(v5, "objectForKeyedSubscript:", v290);
  v291 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPlaceSummaryRevision:", objc_msgSend(v291, "unsignedIntValue"));

  if (a3)
    v292 = CFSTR("isTourist");
  else
    v292 = CFSTR("is_tourist");
  objc_msgSend(v5, "objectForKeyedSubscript:", v292);
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v293, "doubleValue");
    objc_msgSend(v6, "setIsTourist:");
  }

  if (a3)
    v294 = CFSTR("knownRefinementType");
  else
    v294 = CFSTR("known_refinement_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v294);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v444 = 0u;
    v445 = 0u;
    v442 = 0u;
    v443 = 0u;
    v296 = v295;
    v297 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v442, v498, 16);
    if (!v297)
      goto LABEL_769;
    v298 = v297;
    v299 = *(_QWORD *)v443;
    while (1)
    {
      for (i3 = 0; i3 != v298; ++i3)
      {
        if (*(_QWORD *)v443 != v299)
          objc_enumerationMutation(v296);
        v301 = *(void **)(*((_QWORD *)&v442 + 1) + 8 * i3);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v302 = v301;
          if ((objc_msgSend(v302, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v303 = 0;
          }
          else if ((objc_msgSend(v302, "isEqualToString:", CFSTR("TOGGLE")) & 1) != 0)
          {
            v303 = 1;
          }
          else if ((objc_msgSend(v302, "isEqualToString:", CFSTR("RANGE")) & 1) != 0)
          {
            v303 = 2;
          }
          else if ((objc_msgSend(v302, "isEqualToString:", CFSTR("MULTI_SELECT")) & 1) != 0)
          {
            v303 = 3;
          }
          else if ((objc_msgSend(v302, "isEqualToString:", CFSTR("SORT")) & 1) != 0)
          {
            v303 = 4;
          }
          else if (objc_msgSend(v302, "isEqualToString:", CFSTR("OPEN_OPTIONS")))
          {
            v303 = 5;
          }
          else
          {
            v303 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v303 = objc_msgSend(v301, "intValue");
        }
        objc_msgSend(v6, "addKnownRefinementType:", v303);
      }
      v298 = objc_msgSend(v296, "countByEnumeratingWithState:objects:count:", &v442, v498, 16);
      if (!v298)
      {
LABEL_769:

        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v304 = CFSTR("supportAutocompletePublisherResults");
  else
    v304 = CFSTR("support_autocomplete_publisher_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v304);
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportAutocompletePublisherResults:", objc_msgSend(v305, "BOOLValue"));

  if (a3)
    v306 = CFSTR("supportAutocompleteGuideResults");
  else
    v306 = CFSTR("support_autocomplete_guide_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v306);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportAutocompleteGuideResults:", objc_msgSend(v307, "BOOLValue"));

  if (a3)
    v308 = CFSTR("previousSearchViewport");
  else
    v308 = CFSTR("previous_search_viewport");
  objc_msgSend(v5, "objectForKeyedSubscript:", v308);
  v309 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v310 = [GEOPDViewportInfo alloc];
    if ((a3 & 1) != 0)
      v311 = -[GEOPDViewportInfo initWithJSON:](v310, "initWithJSON:", v309);
    else
      v311 = -[GEOPDViewportInfo initWithDictionary:](v310, "initWithDictionary:", v309);
    v312 = (void *)v311;
    objc_msgSend(v6, "setPreviousSearchViewport:", v311);

  }
  if (a3)
    v313 = CFSTR("photoAlbumCount");
  else
    v313 = CFSTR("photo_album_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v313);
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setPhotoAlbumCount:", objc_msgSend(v314, "unsignedIntValue"));

  if (a3)
    v315 = CFSTR("resultRefinementQuery");
  else
    v315 = CFSTR("result_refinement_query");
  objc_msgSend(v5, "objectForKeyedSubscript:", v315);
  v316 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v317 = [GEOPDResultRefinementQuery alloc];
    if ((a3 & 1) != 0)
      v318 = -[GEOPDResultRefinementQuery initWithJSON:](v317, "initWithJSON:", v316);
    else
      v318 = -[GEOPDResultRefinementQuery initWithDictionary:](v317, "initWithDictionary:", v316);
    v319 = (void *)v318;
    objc_msgSend(v6, "setResultRefinementQuery:", v318);

  }
  if (a3)
    v320 = CFSTR("relatedPlaceItemCount");
  else
    v320 = CFSTR("related_place_item_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v320);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setRelatedPlaceItemCount:", objc_msgSend(v321, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("searchRequestType"));
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v323 = v322;
    if ((objc_msgSend(v323, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v324 = 0;
    }
    else if ((objc_msgSend(v323, "isEqualToString:", CFSTR("REDO")) & 1) != 0)
    {
      v324 = 1;
    }
    else if ((objc_msgSend(v323, "isEqualToString:", CFSTR("AUTO_REDO")) & 1) != 0)
    {
      v324 = 2;
    }
    else if (objc_msgSend(v323, "isEqualToString:", CFSTR("BEACHES")))
    {
      v324 = 3;
    }
    else
    {
      v324 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_820;
    v324 = objc_msgSend(v322, "intValue");
  }
  objc_msgSend(v6, "setSearchRequestType:", v324);
LABEL_820:

  if (a3)
    v325 = CFSTR("currentLocaleCurrencySymbol");
  else
    v325 = CFSTR("current_locale_currency_symbol");
  objc_msgSend(v5, "objectForKeyedSubscript:", v325);
  v326 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v327 = (void *)objc_msgSend(v326, "copy");
    objc_msgSend(v6, "setCurrentLocaleCurrencySymbol:", v327);

  }
  if (a3)
    v328 = CFSTR("supportedPlaceSummaryFormatType");
  else
    v328 = CFSTR("supported_place_summary_format_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v328);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v440 = 0u;
    v441 = 0u;
    v438 = 0u;
    v439 = 0u;
    v431 = v329;
    v330 = v329;
    v331 = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v438, v497, 16);
    if (!v331)
      goto LABEL_852;
    v332 = v331;
    v333 = *(_QWORD *)v439;
    while (1)
    {
      for (i4 = 0; i4 != v332; ++i4)
      {
        if (*(_QWORD *)v439 != v333)
          objc_enumerationMutation(v330);
        v335 = *(void **)(*((_QWORD *)&v438 + 1) + 8 * i4);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v336 = v335;
          if ((objc_msgSend(v336, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
          {
            v337 = 0;
          }
          else if ((objc_msgSend(v336, "isEqualToString:", CFSTR("BOLD")) & 1) != 0)
          {
            v337 = 1;
          }
          else if ((objc_msgSend(v336, "isEqualToString:", CFSTR("ITALICS")) & 1) != 0)
          {
            v337 = 2;
          }
          else if ((objc_msgSend(v336, "isEqualToString:", CFSTR("STRIKETHROUGH")) & 1) != 0)
          {
            v337 = 3;
          }
          else if (objc_msgSend(v336, "isEqualToString:", CFSTR("TAPPABLE_ENTITY")))
          {
            v337 = 4;
          }
          else
          {
            v337 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          v337 = objc_msgSend(v335, "intValue");
        }
        objc_msgSend(v6, "addSupportedPlaceSummaryFormatType:", v337);
      }
      v332 = objc_msgSend(v330, "countByEnumeratingWithState:objects:count:", &v438, v497, 16);
      if (!v332)
      {
LABEL_852:

        v329 = v431;
        v5 = v432;
        a3 = v433;
        break;
      }
    }
  }

  if (a3)
    v338 = CFSTR("autocompleteOriginationType");
  else
    v338 = CFSTR("autocomplete_origination_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v338);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v340 = v339;
    if ((objc_msgSend(v340, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v341 = 0;
    }
    else if ((objc_msgSend(v340, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
    {
      v341 = 1;
    }
    else if ((objc_msgSend(v340, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE")) & 1) != 0)
    {
      v341 = 2;
    }
    else if (objc_msgSend(v340, "isEqualToString:", CFSTR("ADD_FAVORITES")))
    {
      v341 = 3;
    }
    else
    {
      v341 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_870;
    v341 = objc_msgSend(v339, "intValue");
  }
  objc_msgSend(v6, "setAutocompleteOriginationType:", v341);
LABEL_870:

  if (a3)
    v342 = CFSTR("autocompleteOriginationPreviousLatlng");
  else
    v342 = CFSTR("autocomplete_origination_previous_latlng");
  objc_msgSend(v5, "objectForKeyedSubscript:", v342);
  v343 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v344 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v345 = -[GEOLatLng initWithJSON:](v344, "initWithJSON:", v343);
    else
      v345 = -[GEOLatLng initWithDictionary:](v344, "initWithDictionary:", v343);
    v346 = (void *)v345;
    objc_msgSend(v6, "setAutocompleteOriginationPreviousLatlng:", v345);

  }
  if (a3)
    v347 = CFSTR("searchOriginationType");
  else
    v347 = CFSTR("search_origination_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v347);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v349 = v348;
    if ((objc_msgSend(v349, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
    {
      v350 = 0;
    }
    else if ((objc_msgSend(v349, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
    {
      v350 = 1;
    }
    else if ((objc_msgSend(v349, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE")) & 1) != 0)
    {
      v350 = 2;
    }
    else if (objc_msgSend(v349, "isEqualToString:", CFSTR("IMPLICIT")))
    {
      v350 = 3;
    }
    else
    {
      v350 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_895;
    v350 = objc_msgSend(v348, "intValue");
  }
  objc_msgSend(v6, "setSearchOriginationType:", v350);
LABEL_895:

  if (a3)
    v351 = CFSTR("searchOriginationPreviousLatlng");
  else
    v351 = CFSTR("search_origination_previous_latlng");
  objc_msgSend(v5, "objectForKeyedSubscript:", v351);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v353 = [GEOLatLng alloc];
    if ((a3 & 1) != 0)
      v354 = -[GEOLatLng initWithJSON:](v353, "initWithJSON:", v352);
    else
      v354 = -[GEOLatLng initWithDictionary:](v353, "initWithDictionary:", v352);
    v355 = (void *)v354;
    objc_msgSend(v6, "setSearchOriginationPreviousLatlng:", v354);

  }
  if (a3)
    v356 = CFSTR("addStopRouteInfo");
  else
    v356 = CFSTR("add_stop_route_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v356);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v358 = [GEOAddStopRouteInfo alloc];
    if ((a3 & 1) != 0)
      v359 = -[GEOAddStopRouteInfo initWithJSON:](v358, "initWithJSON:", v357);
    else
      v359 = -[GEOAddStopRouteInfo initWithDictionary:](v358, "initWithDictionary:", v357);
    v360 = (void *)v359;
    objc_msgSend(v6, "setAddStopRouteInfo:", v359);

  }
  if (a3)
    v361 = CFSTR("autocompleteOriginationEditingServerWaypoints");
  else
    v361 = CFSTR("autocomplete_origination_editing_server_waypoints");
  objc_msgSend(v5, "objectForKeyedSubscript:", v361);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAutocompleteOriginationEditingServerWaypoints:", objc_msgSend(v362, "BOOLValue"));

  if (a3)
    v363 = CFSTR("searchOriginationEditingServerWaypoints");
  else
    v363 = CFSTR("search_origination_editing_server_waypoints");
  objc_msgSend(v5, "objectForKeyedSubscript:", v363);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSearchOriginationEditingServerWaypoints:", objc_msgSend(v364, "BOOLValue"));

  if (a3)
    v365 = CFSTR("supportClientRankingCompositeFeatures");
  else
    v365 = CFSTR("support_client_ranking_composite_features");
  objc_msgSend(v5, "objectForKeyedSubscript:", v365);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportClientRankingCompositeFeatures:", objc_msgSend(v366, "BOOLValue"));

  if (a3)
    v367 = CFSTR("privacyMetadata");
  else
    v367 = CFSTR("privacy_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v367);
  v368 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v369 = [GEOPrivacyMetadata alloc];
    if ((a3 & 1) != 0)
      v370 = -[GEOPrivacyMetadata initWithJSON:](v369, "initWithJSON:", v368);
    else
      v370 = -[GEOPrivacyMetadata initWithDictionary:](v369, "initWithDictionary:", v368);
    v371 = (void *)v370;
    objc_msgSend(v6, "setPrivacyMetadata:", v370);

  }
  if (a3)
    v372 = CFSTR("routeStopCount");
  else
    v372 = CFSTR("route_stop_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v372);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setRouteStopCount:", objc_msgSend(v373, "unsignedIntValue"));

  if (a3)
    v374 = CFSTR("supportStructuredRapAffordance");
  else
    v374 = CFSTR("support_structured_rap_affordance");
  objc_msgSend(v5, "objectForKeyedSubscript:", v374);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setSupportStructuredRapAffordance:", objc_msgSend(v375, "BOOLValue"));

  if (a3)
    v376 = CFSTR("isRoutePlanningEditStopFillRequest");
  else
    v376 = CFSTR("is_route_planning_edit_stop_fill_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v376);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsRoutePlanningEditStopFillRequest:", objc_msgSend(v377, "BOOLValue"));

  if (a3)
    v378 = CFSTR("preferredBrand");
  else
    v378 = CFSTR("preferred_brand");
  objc_msgSend(v5, "objectForKeyedSubscript:", v378);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v436 = 0u;
    v437 = 0u;
    v434 = 0u;
    v435 = 0u;
    v380 = v379;
    v381 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v434, v496, 16);
    if (v381)
    {
      v382 = v381;
      v383 = *(_QWORD *)v435;
      do
      {
        for (i5 = 0; i5 != v382; ++i5)
        {
          if (*(_QWORD *)v435 != v383)
            objc_enumerationMutation(v380);
          v385 = *(void **)(*((_QWORD *)&v434 + 1) + 8 * i5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v6, "addPreferredBrand:", objc_msgSend(v385, "unsignedLongLongValue"));
        }
        v382 = objc_msgSend(v380, "countByEnumeratingWithState:objects:count:", &v434, v496, 16);
      }
      while (v382);
    }

    a3 = v433;
  }

  if (a3)
    v386 = CFSTR("isWithinHikingBoundary");
  else
    v386 = CFSTR("is_within_hiking_boundary");
  objc_msgSend(v5, "objectForKeyedSubscript:", v386);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsWithinHikingBoundary:", objc_msgSend(v387, "BOOLValue"));

  if (a3)
    v388 = CFSTR("isWithinHikingBufferRegion");
  else
    v388 = CFSTR("is_within_hiking_buffer_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v388);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setIsWithinHikingBufferRegion:", objc_msgSend(v389, "BOOLValue"));

  if (a3)
    v390 = CFSTR("searchImplicitFilterInfo");
  else
    v390 = CFSTR("search_implicit_filter_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v390);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v392 = [GEOSearchImplicitFilterInfo alloc];
    if ((a3 & 1) != 0)
      v393 = -[GEOSearchImplicitFilterInfo initWithJSON:](v392, "initWithJSON:", v391);
    else
      v393 = -[GEOSearchImplicitFilterInfo initWithDictionary:](v392, "initWithDictionary:", v391);
    v394 = (void *)v393;
    objc_msgSend(v6, "setSearchImplicitFilterInfo:", v393);

  }
  if (a3)
    v395 = CFSTR("devicePlatform");
  else
    v395 = CFSTR("device_platform");
  objc_msgSend(v5, "objectForKeyedSubscript:", v395);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v397 = v396;
    if ((objc_msgSend(v397, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v398 = 0;
    }
    else if ((objc_msgSend(v397, "isEqualToString:", CFSTR("IOS")) & 1) != 0)
    {
      v398 = 1;
    }
    else if ((objc_msgSend(v397, "isEqualToString:", CFSTR("MACOS")) & 1) != 0)
    {
      v398 = 2;
    }
    else if ((objc_msgSend(v397, "isEqualToString:", CFSTR("TVOS")) & 1) != 0)
    {
      v398 = 3;
    }
    else if (objc_msgSend(v397, "isEqualToString:", CFSTR("WATCHOS")))
    {
      v398 = 4;
    }
    else
    {
      v398 = 0;
    }

    goto LABEL_999;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v398 = objc_msgSend(v396, "intValue");
LABEL_999:
    objc_msgSend(v6, "setDevicePlatform:", v398);
  }

  if (a3)
    v399 = CFSTR("containsSensitiveData");
  else
    v399 = CFSTR("contains_sensitive_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v399);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setContainsSensitiveData:", objc_msgSend(v400, "BOOLValue"));

  if (a3)
    v401 = CFSTR("spotlightSearchPunchinEncodedString");
  else
    v401 = CFSTR("spotlight_search_punchin_encoded_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v401);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v403 = (void *)objc_msgSend(v402, "copy");
    objc_msgSend(v6, "setSpotlightSearchPunchinEncodedString:", v403);

  }
  if (a3)
    v404 = CFSTR("optimizeSearchRequestComponents");
  else
    v404 = CFSTR("optimize_search_request_components");
  objc_msgSend(v5, "objectForKeyedSubscript:", v404);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setOptimizeSearchRequestComponents:", objc_msgSend(v405, "BOOLValue"));

  if (a3)
    v406 = CFSTR("recentAutocompleteSessionData");
  else
    v406 = CFSTR("recent_autocomplete_session_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v406);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v408 = [GEOPDAutocompleteSessionData alloc];
    if ((a3 & 1) != 0)
      v409 = -[GEOPDAutocompleteSessionData initWithJSON:](v408, "initWithJSON:", v407);
    else
      v409 = -[GEOPDAutocompleteSessionData initWithDictionary:](v408, "initWithDictionary:", v407);
    v410 = (void *)v409;
    objc_msgSend(v6, "setRecentAutocompleteSessionData:", v409);

  }
  if (a3)
    v411 = CFSTR("analyticsOptOut");
  else
    v411 = CFSTR("analytics_opt_out");
  objc_msgSend(v5, "objectForKeyedSubscript:", v411);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setAnalyticsOptOut:", objc_msgSend(v412, "BOOLValue"));

  if (a3)
    v413 = CFSTR("userActionMetadata");
  else
    v413 = CFSTR("user_action_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v413);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v415 = [GEOPDSSessionUserActionMetadata alloc];
    if ((a3 & 1) != 0)
      v416 = -[GEOPDSSessionUserActionMetadata initWithJSON:](v415, "initWithJSON:", v414);
    else
      v416 = -[GEOPDSSessionUserActionMetadata initWithDictionary:](v415, "initWithDictionary:", v414);
    v417 = (void *)v416;
    objc_msgSend(v6, "setUserActionMetadata:", v416);

  }
  if (a3)
    v418 = CFSTR("wantsRouteCreationTip");
  else
    v418 = CFSTR("wants_route_creation_tip");
  objc_msgSend(v5, "objectForKeyedSubscript:", v418);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v6, "setWantsRouteCreationTip:", objc_msgSend(v419, "BOOLValue"));

  if (a3)
    v420 = CFSTR("hardwareIdentifier");
  else
    v420 = CFSTR("hardware_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v420);
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v422 = (void *)objc_msgSend(v421, "copy");
    objc_msgSend(v6, "setHardwareIdentifier:", v422);

  }
  a1 = v6;

LABEL_1047:
  return a1;
}

- (GEOMapServiceTraits)initWithJSON:(id)a3
{
  return (GEOMapServiceTraits *)-[GEOMapServiceTraits _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOMapServiceTraitsIsValid((char *)a3);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOMapServiceTraitsClearSensitiveFields((id *)&self->super.super.isa, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
  -[GEOMapServiceTraits _readAutocompleteOriginationPreviousLatlng]((uint64_t)self);
  if (-[GEOLatLng hasGreenTeaWithValue:](self->_autocompleteOriginationPreviousLatlng, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapServiceTraits _readDeviceLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_deviceLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapServiceTraits _readHistoricalLocations]((uint64_t)self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = self->_historicalLocations;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "hasGreenTeaWithValue:", v3, (_QWORD)v11) & 1) != 0)
        {

          return 1;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[GEOMapServiceTraits _readMapRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_mapRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapServiceTraits _readPreviousSearchViewport]((uint64_t)self);
  if (-[GEOPDViewportInfo hasGreenTeaWithValue:](self->_previousSearchViewport, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapServiceTraits _readResultRefinementQuery]((uint64_t)self);
  if (-[GEOPDResultRefinementQuery hasGreenTeaWithValue:](self->_resultRefinementQuery, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOMapServiceTraits _readSearchOriginationPreviousLatlng]((uint64_t)self);
  return -[GEOLatLng hasGreenTeaWithValue:](self->_searchOriginationPreviousLatlng, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  uint64_t flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  unint64_t v8;
  unint64_t v9;
  uint64_t j;
  void *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t m;
  void *v21;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  $DCA03DC0A7F5305716C671105EBE6326 *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t n;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t ii;
  $DCA03DC0A7F5305716C671105EBE6326 *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t jj;
  char *v41;
  $DCA03DC0A7F5305716C671105EBE6326 *v42;
  uint64_t v43;
  $DCA03DC0A7F5305716C671105EBE6326 *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t kk;
  char *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t mm;
  $DCA03DC0A7F5305716C671105EBE6326 *v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t nn;
  char *v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t i1;
  void *v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t i2;
  $DCA03DC0A7F5305716C671105EBE6326 *v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  uint64_t i3;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t i4;
  char *v77;
  $DCA03DC0A7F5305716C671105EBE6326 *v78;
  uint64_t v79;
  $DCA03DC0A7F5305716C671105EBE6326 *v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t i5;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  char *v88;

  v88 = (char *)a3;
  -[GEOMapServiceTraits readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v88 + 1, self->_reader);
  *((_DWORD *)v88 + 152) = self->_readerMarkPos;
  *((_DWORD *)v88 + 153) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = (uint64_t)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v88 + 264) = self->_sessionId;
    *(_QWORD *)(v88 + 756) |= 1uLL;
    flags = (uint64_t)self->_flags;
  }
  if ((flags & 0x10000000) != 0)
  {
    *((_DWORD *)v88 + 177) = self->_sequenceNumber;
    *(_QWORD *)(v88 + 756) |= 0x10000000uLL;
  }
  if (self->_appIdentifier)
    objc_msgSend(v88, "setAppIdentifier:");
  if (self->_appMajorVersion)
    objc_msgSend(v88, "setAppMajorVersion:");
  if (self->_appMinorVersion)
    objc_msgSend(v88, "setAppMinorVersion:");
  if (self->_deviceLocation)
    objc_msgSend(v88, "setDeviceLocation:");
  if (-[GEOMapServiceTraits transportTypesCount](self, "transportTypesCount"))
  {
    objc_msgSend(v88, "clearTransportTypes");
    v5 = -[GEOMapServiceTraits transportTypesCount](self, "transportTypesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v88, "addTransportType:", -[GEOMapServiceTraits transportTypeAtIndex:](self, "transportTypeAtIndex:", i));
    }
  }
  if (self->_mapRegion)
    objc_msgSend(v88, "setMapRegion:");
  if (-[GEOMapServiceTraits deviceDisplayLanguagesCount](self, "deviceDisplayLanguagesCount"))
  {
    objc_msgSend(v88, "clearDeviceDisplayLanguages");
    v8 = -[GEOMapServiceTraits deviceDisplayLanguagesCount](self, "deviceDisplayLanguagesCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOMapServiceTraits deviceDisplayLanguageAtIndex:](self, "deviceDisplayLanguageAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addDeviceDisplayLanguage:", v11);

      }
    }
  }
  if (self->_deviceKeyboardLocale)
    objc_msgSend(v88, "setDeviceKeyboardLocale:");
  v12 = v88;
  if (self->_deviceSpokenLocale)
  {
    objc_msgSend(v88, "setDeviceSpokenLocale:");
    v12 = v88;
  }
  v13 = (uint64_t)self->_flags;
  if ((v13 & 0x8000000000) != 0)
  {
    v12[731] = self->_isAPICall;
    *(_QWORD *)(v12 + 756) |= 0x8000000000uLL;
    v13 = (uint64_t)self->_flags;
  }
  if ((v13 & 0x20000000) != 0)
  {
    *((_DWORD *)v12 + 178) = self->_source;
    *(_QWORD *)(v12 + 756) |= 0x20000000uLL;
  }
  if (-[GEOMapServiceTraits photoSizesCount](self, "photoSizesCount"))
  {
    objc_msgSend(v88, "clearPhotoSizes");
    v14 = -[GEOMapServiceTraits photoSizesCount](self, "photoSizesCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEOMapServiceTraits photoSizesAtIndex:](self, "photoSizesAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addPhotoSizes:", v17);

      }
    }
  }
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
  {
    *((_DWORD *)v88 + 166) = self->_photosCount;
    *(_QWORD *)(v88 + 756) |= 0x20000uLL;
  }
  if (-[GEOMapServiceTraits reviewUserPhotoSizesCount](self, "reviewUserPhotoSizesCount"))
  {
    objc_msgSend(v88, "clearReviewUserPhotoSizes");
    v18 = -[GEOMapServiceTraits reviewUserPhotoSizesCount](self, "reviewUserPhotoSizesCount");
    if (v18)
    {
      v19 = v18;
      for (m = 0; m != v19; ++m)
      {
        -[GEOMapServiceTraits reviewUserPhotoSizesAtIndex:](self, "reviewUserPhotoSizesAtIndex:", m);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addReviewUserPhotoSizes:", v21);

      }
    }
  }
  p_flags = &self->_flags;
  v23 = (uint64_t)self->_flags;
  v24 = v88;
  if ((v23 & 0x1000000) != 0)
  {
    *((_DWORD *)v88 + 173) = self->_reviewUserPhotosCount;
    *(_QWORD *)(v88 + 756) |= 0x1000000uLL;
    v23 = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x40000000) == 0)
    {
LABEL_43:
      if ((v23 & 0x80000000) == 0)
        goto LABEL_44;
      goto LABEL_226;
    }
  }
  else if ((v23 & 0x40000000) == 0)
  {
    goto LABEL_43;
  }
  *((_DWORD *)v88 + 179) = self->_timeSinceMapEnteredForeground;
  *(_QWORD *)(v88 + 756) |= 0x40000000uLL;
  v23 = (uint64_t)self->_flags;
  if ((v23 & 0x80000000) == 0)
  {
LABEL_44:
    if ((v23 & 0x200) == 0)
      goto LABEL_46;
    goto LABEL_45;
  }
LABEL_226:
  *((_DWORD *)v88 + 180) = self->_timeSinceMapViewportChanged;
  *(_QWORD *)(v88 + 756) |= 0x80000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
LABEL_45:
    *((_DWORD *)v88 + 158) = self->_carHeadunitInteractionModel;
    *(_QWORD *)(v88 + 756) |= 0x200uLL;
  }
LABEL_46:
  if (self->_carHeadunitManufacturer)
  {
    objc_msgSend(v88, "setCarHeadunitManufacturer:");
    v24 = v88;
  }
  if (self->_carHeadunitModel)
  {
    objc_msgSend(v88, "setCarHeadunitModel:");
    v24 = v88;
  }
  v25 = (uint64_t)self->_flags;
  if ((v25 & 4) != 0)
  {
    *((_QWORD *)v24 + 45) = *(_QWORD *)&self->_carHeadunitPixelWidth;
    *(_QWORD *)(v24 + 756) |= 4uLL;
    v25 = (uint64_t)self->_flags;
  }
  if ((v25 & 2) != 0)
  {
    *((_QWORD *)v24 + 44) = *(_QWORD *)&self->_carHeadunitPixelHeight;
    *(_QWORD *)(v24 + 756) |= 2uLL;
  }
  if (self->_transitScheduleFilter)
  {
    objc_msgSend(v88, "setTransitScheduleFilter:");
    v24 = v88;
  }
  v26 = (uint64_t)self->_flags;
  if ((v26 & 0x10) != 0)
  {
    *((_QWORD *)v24 + 58) = *(_QWORD *)&self->_mapZoomLevel;
    *(_QWORD *)(v24 + 756) |= 0x10uLL;
    v26 = (uint64_t)self->_flags;
  }
  if ((v26 & 0x4000) != 0)
  {
    *((_DWORD *)v24 + 163) = self->_mode;
    *(_QWORD *)(v24 + 756) |= 0x4000uLL;
  }
  if (self->_displayRegion)
  {
    objc_msgSend(v88, "setDisplayRegion:");
    v24 = v88;
  }
  if (self->_providerID)
  {
    objc_msgSend(v88, "setProviderID:");
    v24 = v88;
  }
  v27 = &self->_flags;
  v28 = (uint64_t)self->_flags;
  if ((v28 & 0x800) != 0)
  {
    *((_DWORD *)v24 + 160) = self->_deviceInterfaceOrientation;
    *(_QWORD *)(v24 + 756) |= 0x800uLL;
    v28 = *(_QWORD *)v27;
    if ((*(_QWORD *)v27 & 0x400) == 0)
    {
LABEL_66:
      if ((v28 & 0x100) == 0)
        goto LABEL_67;
LABEL_230:
      *((_DWORD *)v24 + 157) = self->_carHeadunitConnectionType;
      *(_QWORD *)(v24 + 756) |= 0x100uLL;
      if ((*(_QWORD *)&self->_flags & 0x400000000000) == 0)
        goto LABEL_69;
      goto LABEL_68;
    }
  }
  else if ((v28 & 0x400) == 0)
  {
    goto LABEL_66;
  }
  *((_DWORD *)v24 + 159) = self->_deviceBatteryState;
  *(_QWORD *)(v24 + 756) |= 0x400uLL;
  v28 = (uint64_t)self->_flags;
  if ((v28 & 0x100) != 0)
    goto LABEL_230;
LABEL_67:
  if ((v28 & 0x400000000000) != 0)
  {
LABEL_68:
    v24[738] = self->_navigating;
    *(_QWORD *)(v24 + 756) |= 0x400000000000uLL;
  }
LABEL_69:
  if (-[GEOMapServiceTraits historicalLocationsCount](self, "historicalLocationsCount"))
  {
    objc_msgSend(v88, "clearHistoricalLocations");
    v29 = -[GEOMapServiceTraits historicalLocationsCount](self, "historicalLocationsCount");
    if (v29)
    {
      v30 = v29;
      for (n = 0; n != v30; ++n)
      {
        -[GEOMapServiceTraits historicalLocationsAtIndex:](self, "historicalLocationsAtIndex:", n);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addHistoricalLocations:", v32);

      }
    }
  }
  if (self->_automobileOptions)
    objc_msgSend(v88, "setAutomobileOptions:");
  if (self->_transitOptions)
    objc_msgSend(v88, "setTransitOptions:");
  if (self->_walkingOptions)
    objc_msgSend(v88, "setWalkingOptions:");
  if (-[GEOMapServiceTraits engineTypesCount](self, "engineTypesCount"))
  {
    objc_msgSend(v88, "clearEngineTypes");
    v33 = -[GEOMapServiceTraits engineTypesCount](self, "engineTypesCount");
    if (v33)
    {
      v34 = v33;
      for (ii = 0; ii != v34; ++ii)
        objc_msgSend(v88, "addEngineType:", -[GEOMapServiceTraits engineTypeAtIndex:](self, "engineTypeAtIndex:", ii));
    }
  }
  v36 = &self->_flags;
  v37 = (uint64_t)self->_flags;
  if ((v37 & 0x200000) == 0)
  {
    if ((v37 & 0x80000000000000) == 0)
      goto LABEL_85;
LABEL_233:
    v88[747] = self->_supportDirectionIntentSearch;
    *(_QWORD *)(v88 + 756) |= 0x80000000000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x100000000000000) == 0)
      goto LABEL_87;
    goto LABEL_86;
  }
  *((_DWORD *)v88 + 170) = self->_requestMode;
  *(_QWORD *)(v88 + 756) |= 0x200000uLL;
  v37 = *(_QWORD *)v36;
  if ((*(_QWORD *)v36 & 0x80000000000000) != 0)
    goto LABEL_233;
LABEL_85:
  if ((v37 & 0x100000000000000) != 0)
  {
LABEL_86:
    v88[748] = self->_supportDymSuggestion;
    *(_QWORD *)(v88 + 756) |= 0x100000000000000uLL;
  }
LABEL_87:
  if (-[GEOMapServiceTraits knownClientResolvedTypesCount](self, "knownClientResolvedTypesCount"))
  {
    objc_msgSend(v88, "clearKnownClientResolvedTypes");
    v38 = -[GEOMapServiceTraits knownClientResolvedTypesCount](self, "knownClientResolvedTypesCount");
    if (v38)
    {
      v39 = v38;
      for (jj = 0; jj != v39; ++jj)
        objc_msgSend(v88, "addKnownClientResolvedType:", -[GEOMapServiceTraits knownClientResolvedTypeAtIndex:](self, "knownClientResolvedTypeAtIndex:", jj));
    }
  }
  v41 = v88;
  if ((*((_BYTE *)&self->_flags + 7) & 0x10) != 0)
  {
    v88[752] = self->_wantsBrandIcon;
    *(_QWORD *)(v88 + 756) |= 0x1000000000000000uLL;
  }
  if (self->_venueIdentifier)
  {
    objc_msgSend(v88, "setVenueIdentifier:");
    v41 = v88;
  }
  v42 = &self->_flags;
  v43 = (uint64_t)self->_flags;
  if ((v43 & 0x4000000000) != 0)
  {
    v41[730] = self->_deviceInVehicle;
    *(_QWORD *)(v41 + 756) |= 0x4000000000uLL;
    v43 = *(_QWORD *)v42;
    if ((*(_QWORD *)v42 & 0x400000) == 0)
    {
LABEL_97:
      if ((v43 & 0x2000) == 0)
        goto LABEL_99;
      goto LABEL_98;
    }
  }
  else if ((v43 & 0x400000) == 0)
  {
    goto LABEL_97;
  }
  *((_DWORD *)v41 + 171) = self->_requestPriority;
  *(_QWORD *)(v41 + 756) |= 0x400000uLL;
  if ((*(_QWORD *)&self->_flags & 0x2000) != 0)
  {
LABEL_98:
    *((_DWORD *)v41 + 162) = self->_httpRequestPriority;
    *(_QWORD *)(v41 + 756) |= 0x2000uLL;
  }
LABEL_99:
  if (self->_analyticsAppIdentifier)
  {
    objc_msgSend(v88, "setAnalyticsAppIdentifier:");
    v41 = v88;
  }
  v44 = &self->_flags;
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x20) != 0)
  {
    *((_QWORD *)v41 + 68) = *(_QWORD *)&self->_sessionRelativeTimestamp;
    *(_QWORD *)(v41 + 756) |= 0x20uLL;
    v45 = *(_QWORD *)v44;
    if ((*(_QWORD *)v44 & 0x40000000000000) == 0)
    {
LABEL_103:
      if ((v45 & 0x400000000000000) == 0)
        goto LABEL_104;
      goto LABEL_240;
    }
  }
  else if ((v45 & 0x40000000000000) == 0)
  {
    goto LABEL_103;
  }
  v41[746] = self->_supportDirectionIntentAutocomplete;
  *(_QWORD *)(v41 + 756) |= 0x40000000000000uLL;
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x400000000000000) == 0)
  {
LABEL_104:
    if ((v45 & 0x2000000000) == 0)
      goto LABEL_105;
    goto LABEL_241;
  }
LABEL_240:
  v41[750] = self->_supportUnresolvedDirectionIntent;
  *(_QWORD *)(v41 + 756) |= 0x400000000000000uLL;
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x2000000000) == 0)
  {
LABEL_105:
    if ((v45 & 0x200000000) == 0)
      goto LABEL_106;
    goto LABEL_242;
  }
LABEL_241:
  v41[729] = self->_deviceDarkMode;
  *(_QWORD *)(v41 + 756) |= 0x2000000000uLL;
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x200000000) == 0)
  {
LABEL_106:
    if ((v45 & 0x800000000000000) == 0)
      goto LABEL_107;
LABEL_243:
    v41[751] = self->_supportsBrandFallback;
    *(_QWORD *)(v41 + 756) |= 0x800000000000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x800000) == 0)
      goto LABEL_109;
    goto LABEL_108;
  }
LABEL_242:
  v41[725] = self->_appDarkMode;
  *(_QWORD *)(v41 + 756) |= 0x200000000uLL;
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x800000000000000) != 0)
    goto LABEL_243;
LABEL_107:
  if ((v45 & 0x800000) != 0)
  {
LABEL_108:
    *((_DWORD *)v41 + 172) = self->_requestPurpose;
    *(_QWORD *)(v41 + 756) |= 0x800000uLL;
  }
LABEL_109:
  if (-[GEOMapServiceTraits supportedAutocompleteListTypesCount](self, "supportedAutocompleteListTypesCount"))
  {
    objc_msgSend(v88, "clearSupportedAutocompleteListTypes");
    v46 = -[GEOMapServiceTraits supportedAutocompleteListTypesCount](self, "supportedAutocompleteListTypesCount");
    if (v46)
    {
      v47 = v46;
      for (kk = 0; kk != v47; ++kk)
        objc_msgSend(v88, "addSupportedAutocompleteListType:", -[GEOMapServiceTraits supportedAutocompleteListTypeAtIndex:](self, "supportedAutocompleteListTypeAtIndex:", kk));
    }
  }
  v49 = v88;
  if ((*((_BYTE *)&self->_flags + 5) & 4) != 0)
  {
    v88[734] = self->_isSettlement;
    *(_QWORD *)(v88 + 756) |= 0x40000000000uLL;
  }
  if (self->_transitTripStopTimeFilter)
  {
    objc_msgSend(v88, "setTransitTripStopTimeFilter:");
    v49 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 6) & 0x20) != 0)
  {
    v49[745] = self->_supportClientRankingFeatureMetadata;
    *(_QWORD *)(v49 + 756) |= 0x20000000000000uLL;
  }
  if (-[GEOMapServiceTraits supportedChildActionsCount](self, "supportedChildActionsCount"))
  {
    objc_msgSend(v88, "clearSupportedChildActions");
    v50 = -[GEOMapServiceTraits supportedChildActionsCount](self, "supportedChildActionsCount");
    if (v50)
    {
      v51 = v50;
      for (mm = 0; mm != v51; ++mm)
        objc_msgSend(v88, "addSupportedChildAction:", -[GEOMapServiceTraits supportedChildActionAtIndex:](self, "supportedChildActionAtIndex:", mm));
    }
  }
  v53 = &self->_flags;
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x8000000000000) == 0)
  {
    if ((v54 & 0x10000000000) == 0)
      goto LABEL_125;
LABEL_246:
    v88[732] = self->_isRefund;
    *(_QWORD *)(v88 + 756) |= 0x10000000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x800000000) == 0)
      goto LABEL_127;
    goto LABEL_126;
  }
  v88[743] = self->_supportChildItems;
  *(_QWORD *)(v88 + 756) |= 0x8000000000000uLL;
  v54 = *(_QWORD *)v53;
  if ((*(_QWORD *)v53 & 0x10000000000) != 0)
    goto LABEL_246;
LABEL_125:
  if ((v54 & 0x800000000) != 0)
  {
LABEL_126:
    v88[727] = self->_autocompleteRequestSupportsSectionHeader;
    *(_QWORD *)(v88 + 756) |= 0x800000000uLL;
  }
LABEL_127:
  if (-[GEOMapServiceTraits supportedAutocompleteResultCellTypesCount](self, "supportedAutocompleteResultCellTypesCount"))
  {
    objc_msgSend(v88, "clearSupportedAutocompleteResultCellTypes");
    v55 = -[GEOMapServiceTraits supportedAutocompleteResultCellTypesCount](self, "supportedAutocompleteResultCellTypesCount");
    if (v55)
    {
      v56 = v55;
      for (nn = 0; nn != v56; ++nn)
        objc_msgSend(v88, "addSupportedAutocompleteResultCellType:", -[GEOMapServiceTraits supportedAutocompleteResultCellTypeAtIndex:](self, "supportedAutocompleteResultCellTypeAtIndex:", nn));
    }
  }
  v58 = v88;
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
  {
    *((_DWORD *)v88 + 164) = self->_navigationTransportType;
    *(_QWORD *)(v88 + 756) |= 0x8000uLL;
  }
  if (self->_cyclingOptions)
  {
    objc_msgSend(v88, "setCyclingOptions:");
    v58 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
  {
    *((_DWORD *)v58 + 168) = self->_ratingsCount;
    *(_QWORD *)(v58 + 756) |= 0x80000uLL;
  }
  if (-[GEOMapServiceTraits evChargingPortsCount](self, "evChargingPortsCount"))
  {
    objc_msgSend(v88, "clearEvChargingPorts");
    v59 = -[GEOMapServiceTraits evChargingPortsCount](self, "evChargingPortsCount");
    if (v59)
    {
      v60 = v59;
      for (i1 = 0; i1 != v60; ++i1)
      {
        -[GEOMapServiceTraits evChargingPortAtIndex:](self, "evChargingPortAtIndex:", i1);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "addEvChargingPort:", v62);

      }
    }
  }
  if ((*((_BYTE *)&self->_flags + 5) & 8) != 0)
  {
    v88[735] = self->_isWidgetRequest;
    *(_QWORD *)(v88 + 756) |= 0x80000000000uLL;
  }
  if (-[GEOMapServiceTraits supportedSearchTierTypesCount](self, "supportedSearchTierTypesCount"))
  {
    objc_msgSend(v88, "clearSupportedSearchTierTypes");
    v63 = -[GEOMapServiceTraits supportedSearchTierTypesCount](self, "supportedSearchTierTypesCount");
    if (v63)
    {
      v64 = v63;
      for (i2 = 0; i2 != v64; ++i2)
        objc_msgSend(v88, "addSupportedSearchTierType:", -[GEOMapServiceTraits supportedSearchTierTypeAtIndex:](self, "supportedSearchTierTypeAtIndex:", i2));
    }
  }
  v66 = &self->_flags;
  v67 = (uint64_t)self->_flags;
  if ((v67 & 0x80) == 0)
  {
    if ((v67 & 0x40000) == 0)
      goto LABEL_149;
LABEL_249:
    *((_DWORD *)v88 + 167) = self->_placeSummaryRevision;
    *(_QWORD *)(v88 + 756) |= 0x40000uLL;
    if ((*(_QWORD *)&self->_flags & 8) == 0)
      goto LABEL_151;
    goto LABEL_150;
  }
  *((_DWORD *)v88 + 156) = self->_auxiliaryTierNumResults;
  *(_QWORD *)(v88 + 756) |= 0x80uLL;
  v67 = *(_QWORD *)v66;
  if ((*(_QWORD *)v66 & 0x40000) != 0)
    goto LABEL_249;
LABEL_149:
  if ((v67 & 8) != 0)
  {
LABEL_150:
    *((_QWORD *)v88 + 56) = *(_QWORD *)&self->_isTourist;
    *(_QWORD *)(v88 + 756) |= 8uLL;
  }
LABEL_151:
  if (-[GEOMapServiceTraits knownRefinementTypesCount](self, "knownRefinementTypesCount"))
  {
    objc_msgSend(v88, "clearKnownRefinementTypes");
    v68 = -[GEOMapServiceTraits knownRefinementTypesCount](self, "knownRefinementTypesCount");
    if (v68)
    {
      v69 = v68;
      for (i3 = 0; i3 != v69; ++i3)
        objc_msgSend(v88, "addKnownRefinementType:", -[GEOMapServiceTraits knownRefinementTypeAtIndex:](self, "knownRefinementTypeAtIndex:", i3));
    }
  }
  v71 = (uint64_t)self->_flags;
  v72 = v88;
  if ((v71 & 0x4000000000000) != 0)
  {
    v88[742] = self->_supportAutocompletePublisherResults;
    *(_QWORD *)(v88 + 756) |= 0x4000000000000uLL;
    v71 = (uint64_t)self->_flags;
  }
  if ((v71 & 0x2000000000000) != 0)
  {
    v88[741] = self->_supportAutocompleteGuideResults;
    *(_QWORD *)(v88 + 756) |= 0x2000000000000uLL;
  }
  if (self->_previousSearchViewport)
  {
    objc_msgSend(v88, "setPreviousSearchViewport:");
    v72 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
  {
    *((_DWORD *)v72 + 165) = self->_photoAlbumCount;
    *(_QWORD *)(v72 + 756) |= 0x10000uLL;
  }
  if (self->_resultRefinementQuery)
  {
    objc_msgSend(v88, "setResultRefinementQuery:");
    v72 = v88;
  }
  v73 = (uint64_t)self->_flags;
  if ((v73 & 0x100000) != 0)
  {
    *((_DWORD *)v72 + 169) = self->_relatedPlaceItemCount;
    *(_QWORD *)(v72 + 756) |= 0x100000uLL;
    v73 = (uint64_t)self->_flags;
  }
  if ((v73 & 0x4000000) != 0)
  {
    *((_DWORD *)v72 + 175) = self->_searchRequestType;
    *(_QWORD *)(v72 + 756) |= 0x4000000uLL;
  }
  if (self->_currentLocaleCurrencySymbol)
    objc_msgSend(v88, "setCurrentLocaleCurrencySymbol:");
  if (-[GEOMapServiceTraits supportedPlaceSummaryFormatTypesCount](self, "supportedPlaceSummaryFormatTypesCount"))
  {
    objc_msgSend(v88, "clearSupportedPlaceSummaryFormatTypes");
    v74 = -[GEOMapServiceTraits supportedPlaceSummaryFormatTypesCount](self, "supportedPlaceSummaryFormatTypesCount");
    if (v74)
    {
      v75 = v74;
      for (i4 = 0; i4 != v75; ++i4)
        objc_msgSend(v88, "addSupportedPlaceSummaryFormatType:", -[GEOMapServiceTraits supportedPlaceSummaryFormatTypeAtIndex:](self, "supportedPlaceSummaryFormatTypeAtIndex:", i4));
    }
  }
  v77 = v88;
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
  {
    *((_DWORD *)v88 + 155) = self->_autocompleteOriginationType;
    *(_QWORD *)(v88 + 756) |= 0x40uLL;
  }
  if (self->_autocompleteOriginationPreviousLatlng)
  {
    objc_msgSend(v88, "setAutocompleteOriginationPreviousLatlng:");
    v77 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 3) & 8) != 0)
  {
    *((_DWORD *)v77 + 176) = self->_searchOriginationType;
    *(_QWORD *)(v77 + 756) |= 0x8000000uLL;
  }
  if (self->_searchOriginationPreviousLatlng)
  {
    objc_msgSend(v88, "setSearchOriginationPreviousLatlng:");
    v77 = v88;
  }
  if (self->_addStopRouteInfo)
  {
    objc_msgSend(v88, "setAddStopRouteInfo:");
    v77 = v88;
  }
  v78 = &self->_flags;
  v79 = (uint64_t)self->_flags;
  if ((v79 & 0x400000000) != 0)
  {
    v77[726] = self->_autocompleteOriginationEditingServerWaypoints;
    *(_QWORD *)(v77 + 756) |= 0x400000000uLL;
    v79 = *(_QWORD *)v78;
    if ((*(_QWORD *)v78 & 0x1000000000000) == 0)
    {
LABEL_187:
      if ((v79 & 0x10000000000000) == 0)
        goto LABEL_189;
      goto LABEL_188;
    }
  }
  else if ((v79 & 0x1000000000000) == 0)
  {
    goto LABEL_187;
  }
  v77[740] = self->_searchOriginationEditingServerWaypoints;
  *(_QWORD *)(v77 + 756) |= 0x1000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x10000000000000) != 0)
  {
LABEL_188:
    v77[744] = self->_supportClientRankingCompositeFeatures;
    *(_QWORD *)(v77 + 756) |= 0x10000000000000uLL;
  }
LABEL_189:
  if (self->_privacyMetadata)
  {
    objc_msgSend(v88, "setPrivacyMetadata:");
    v77 = v88;
  }
  v80 = &self->_flags;
  v81 = (uint64_t)self->_flags;
  if ((v81 & 0x2000000) == 0)
  {
    if ((v81 & 0x200000000000000) == 0)
      goto LABEL_193;
LABEL_255:
    v77[749] = self->_supportStructuredRapAffordance;
    *(_QWORD *)(v77 + 756) |= 0x200000000000000uLL;
    if ((*(_QWORD *)&self->_flags & 0x20000000000) == 0)
      goto LABEL_195;
    goto LABEL_194;
  }
  *((_DWORD *)v77 + 174) = self->_routeStopCount;
  *(_QWORD *)(v77 + 756) |= 0x2000000uLL;
  v81 = *(_QWORD *)v80;
  if ((*(_QWORD *)v80 & 0x200000000000000) != 0)
    goto LABEL_255;
LABEL_193:
  if ((v81 & 0x20000000000) != 0)
  {
LABEL_194:
    v77[733] = self->_isRoutePlanningEditStopFillRequest;
    *(_QWORD *)(v77 + 756) |= 0x20000000000uLL;
  }
LABEL_195:
  if (-[GEOMapServiceTraits preferredBrandsCount](self, "preferredBrandsCount"))
  {
    objc_msgSend(v88, "clearPreferredBrands");
    v82 = -[GEOMapServiceTraits preferredBrandsCount](self, "preferredBrandsCount");
    if (v82)
    {
      v83 = v82;
      for (i5 = 0; i5 != v83; ++i5)
        objc_msgSend(v88, "addPreferredBrand:", -[GEOMapServiceTraits preferredBrandAtIndex:](self, "preferredBrandAtIndex:", i5));
    }
  }
  v85 = (uint64_t)self->_flags;
  v86 = v88;
  if ((v85 & 0x100000000000) != 0)
  {
    v88[736] = self->_isWithinHikingBoundary;
    *(_QWORD *)(v88 + 756) |= 0x100000000000uLL;
    v85 = (uint64_t)self->_flags;
  }
  if ((v85 & 0x200000000000) != 0)
  {
    v88[737] = self->_isWithinHikingBufferRegion;
    *(_QWORD *)(v88 + 756) |= 0x200000000000uLL;
  }
  if (self->_searchImplicitFilterInfo)
  {
    objc_msgSend(v88, "setSearchImplicitFilterInfo:");
    v86 = v88;
  }
  v87 = (uint64_t)self->_flags;
  if ((v87 & 0x1000) != 0)
  {
    *((_DWORD *)v86 + 161) = self->_devicePlatform;
    *(_QWORD *)(v86 + 756) |= 0x1000uLL;
    v87 = (uint64_t)self->_flags;
  }
  if ((v87 & 0x1000000000) != 0)
  {
    v86[728] = self->_containsSensitiveData;
    *(_QWORD *)(v86 + 756) |= 0x1000000000uLL;
  }
  if (self->_spotlightSearchPunchinEncodedString)
  {
    objc_msgSend(v88, "setSpotlightSearchPunchinEncodedString:");
    v86 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 5) & 0x80) != 0)
  {
    v86[739] = self->_optimizeSearchRequestComponents;
    *(_QWORD *)(v86 + 756) |= 0x800000000000uLL;
  }
  if (self->_recentAutocompleteSessionData)
  {
    objc_msgSend(v88, "setRecentAutocompleteSessionData:");
    v86 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 4) & 1) != 0)
  {
    v86[724] = self->_analyticsOptOut;
    *(_QWORD *)(v86 + 756) |= 0x100000000uLL;
  }
  if (self->_userActionMetadata)
  {
    objc_msgSend(v88, "setUserActionMetadata:");
    v86 = v88;
  }
  if ((*((_BYTE *)&self->_flags + 7) & 0x20) != 0)
  {
    v86[753] = self->_wantsRouteCreationTip;
    *(_QWORD *)(v86 + 756) |= 0x2000000000000000uLL;
  }
  if (self->_hardwareIdentifier)
  {
    objc_msgSend(v88, "setHardwareIdentifier:");
    v86 = v88;
  }

}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t flags;
  uint64_t v6;
  NSString *appIdentifier;
  NSString *appMajorVersion;
  NSString *appMinorVersion;
  GEOLocation *deviceLocation;
  GEOMapRegion *mapRegion;
  NSMutableArray *deviceDisplayLanguages;
  NSString *deviceKeyboardLocale;
  NSString *deviceSpokenLocale;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *photoSizes;
  NSMutableArray *reviewUserPhotoSizes;
  NSString *carHeadunitManufacturer;
  NSString *carHeadunitModel;
  uint64_t v22;
  uint64_t v23;
  GEOTraitsTransitScheduleFilter *transitScheduleFilter;
  NSString *displayRegion;
  NSString *providerID;
  uint64_t v27;
  uint64_t v28;
  NSMutableArray *historicalLocations;
  GEOAutomobileOptions *automobileOptions;
  GEOTransitOptions *transitOptions;
  GEOWalkingOptions *walkingOptions;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  GEOPDVenueIdentifier *venueIdentifier;
  NSString *analyticsAppIdentifier;
  uint64_t v39;
  uint64_t v40;
  GEOTraitsTransitScheduleFilter *transitTripStopTimeFilter;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  GEOCyclingOptions *cyclingOptions;
  NSMutableArray *evChargingPorts;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  GEOPDViewportInfo *previousSearchViewport;
  GEOPDResultRefinementQuery *resultRefinementQuery;
  NSString *currentLocaleCurrencySymbol;
  uint64_t v55;
  uint64_t v56;
  GEOLatLng *autocompleteOriginationPreviousLatlng;
  GEOLatLng *searchOriginationPreviousLatlng;
  GEOAddStopRouteInfo *addStopRouteInfo;
  uint64_t v60;
  uint64_t v61;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v63;
  uint64_t v64;
  GEOSearchImplicitFilterInfo *searchImplicitFilterInfo;
  NSString *spotlightSearchPunchinEncodedString;
  GEOPDAutocompleteSessionData *recentAutocompleteSessionData;
  GEOPDSSessionUserActionMetadata *userActionMetadata;
  char v69;
  NSString *hardwareIdentifier;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_500;
  -[GEOMapServiceTraits readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = (uint64_t)self->_flags;
  v6 = *(_QWORD *)(v4 + 756);
  if ((flags & 1) != 0)
  {
    if ((v6 & 1) == 0)
      goto LABEL_500;
    if (self->_sessionId._high != *((_QWORD *)v4 + 33) || self->_sessionId._low != *((_QWORD *)v4 + 34))
      goto LABEL_500;
  }
  else if ((v6 & 1) != 0)
  {
    goto LABEL_500;
  }
  if ((flags & 0x10000000) != 0)
  {
    if ((v6 & 0x10000000) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 177))
      goto LABEL_500;
  }
  else if ((v6 & 0x10000000) != 0)
  {
    goto LABEL_500;
  }
  appIdentifier = self->_appIdentifier;
  if ((unint64_t)appIdentifier | *((_QWORD *)v4 + 37)
    && !-[NSString isEqual:](appIdentifier, "isEqual:"))
  {
    goto LABEL_500;
  }
  appMajorVersion = self->_appMajorVersion;
  if ((unint64_t)appMajorVersion | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](appMajorVersion, "isEqual:"))
      goto LABEL_500;
  }
  appMinorVersion = self->_appMinorVersion;
  if ((unint64_t)appMinorVersion | *((_QWORD *)v4 + 39))
  {
    if (!-[NSString isEqual:](appMinorVersion, "isEqual:"))
      goto LABEL_500;
  }
  deviceLocation = self->_deviceLocation;
  if ((unint64_t)deviceLocation | *((_QWORD *)v4 + 48))
  {
    if (!-[GEOLocation isEqual:](deviceLocation, "isEqual:"))
      goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  mapRegion = self->_mapRegion;
  if ((unint64_t)mapRegion | *((_QWORD *)v4 + 57))
  {
    if (!-[GEOMapRegion isEqual:](mapRegion, "isEqual:"))
      goto LABEL_500;
  }
  deviceDisplayLanguages = self->_deviceDisplayLanguages;
  if ((unint64_t)deviceDisplayLanguages | *((_QWORD *)v4 + 49))
  {
    if (!-[NSMutableArray isEqual:](deviceDisplayLanguages, "isEqual:"))
      goto LABEL_500;
  }
  deviceKeyboardLocale = self->_deviceKeyboardLocale;
  if ((unint64_t)deviceKeyboardLocale | *((_QWORD *)v4 + 50))
  {
    if (!-[NSString isEqual:](deviceKeyboardLocale, "isEqual:"))
      goto LABEL_500;
  }
  deviceSpokenLocale = self->_deviceSpokenLocale;
  if ((unint64_t)deviceSpokenLocale | *((_QWORD *)v4 + 51))
  {
    if (!-[NSString isEqual:](deviceSpokenLocale, "isEqual:"))
      goto LABEL_500;
  }
  v16 = (uint64_t)self->_flags;
  v17 = *(_QWORD *)(v4 + 756);
  if ((v16 & 0x8000000000) != 0)
  {
    if ((v17 & 0x8000000000) == 0)
      goto LABEL_500;
    if (self->_isAPICall)
    {
      if (!v4[731])
        goto LABEL_500;
    }
    else if (v4[731])
    {
      goto LABEL_500;
    }
  }
  else if ((v17 & 0x8000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x20000000) != 0)
  {
    if ((v17 & 0x20000000) == 0 || self->_source != *((_DWORD *)v4 + 178))
      goto LABEL_500;
  }
  else if ((v17 & 0x20000000) != 0)
  {
    goto LABEL_500;
  }
  photoSizes = self->_photoSizes;
  if ((unint64_t)photoSizes | *((_QWORD *)v4 + 59))
  {
    if (!-[NSMutableArray isEqual:](photoSizes, "isEqual:"))
      goto LABEL_500;
    v16 = (uint64_t)self->_flags;
    v17 = *(_QWORD *)(v4 + 756);
  }
  if ((v16 & 0x20000) != 0)
  {
    if ((v17 & 0x20000) == 0 || self->_photosCount != *((_DWORD *)v4 + 166))
      goto LABEL_500;
  }
  else if ((v17 & 0x20000) != 0)
  {
    goto LABEL_500;
  }
  reviewUserPhotoSizes = self->_reviewUserPhotoSizes;
  if ((unint64_t)reviewUserPhotoSizes | *((_QWORD *)v4 + 65))
  {
    if (!-[NSMutableArray isEqual:](reviewUserPhotoSizes, "isEqual:"))
      goto LABEL_500;
    v16 = (uint64_t)self->_flags;
    v17 = *(_QWORD *)(v4 + 756);
  }
  if ((v16 & 0x1000000) != 0)
  {
    if ((v17 & 0x1000000) == 0 || self->_reviewUserPhotosCount != *((_DWORD *)v4 + 173))
      goto LABEL_500;
  }
  else if ((v17 & 0x1000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x40000000) != 0)
  {
    if ((v17 & 0x40000000) == 0 || self->_timeSinceMapEnteredForeground != *((_DWORD *)v4 + 179))
      goto LABEL_500;
  }
  else if ((v17 & 0x40000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x80000000) != 0)
  {
    if ((v17 & 0x80000000) == 0 || self->_timeSinceMapViewportChanged != *((_DWORD *)v4 + 180))
      goto LABEL_500;
  }
  else if ((v17 & 0x80000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v16 & 0x200) != 0)
  {
    if ((v17 & 0x200) == 0 || self->_carHeadunitInteractionModel != *((_DWORD *)v4 + 158))
      goto LABEL_500;
  }
  else if ((v17 & 0x200) != 0)
  {
    goto LABEL_500;
  }
  carHeadunitManufacturer = self->_carHeadunitManufacturer;
  if ((unint64_t)carHeadunitManufacturer | *((_QWORD *)v4 + 42)
    && !-[NSString isEqual:](carHeadunitManufacturer, "isEqual:"))
  {
    goto LABEL_500;
  }
  carHeadunitModel = self->_carHeadunitModel;
  if ((unint64_t)carHeadunitModel | *((_QWORD *)v4 + 43))
  {
    if (!-[NSString isEqual:](carHeadunitModel, "isEqual:"))
      goto LABEL_500;
  }
  v22 = (uint64_t)self->_flags;
  v23 = *(_QWORD *)(v4 + 756);
  if ((v22 & 4) != 0)
  {
    if ((v23 & 4) == 0 || self->_carHeadunitPixelWidth != *((double *)v4 + 45))
      goto LABEL_500;
  }
  else if ((v23 & 4) != 0)
  {
    goto LABEL_500;
  }
  if ((v22 & 2) != 0)
  {
    if ((v23 & 2) == 0 || self->_carHeadunitPixelHeight != *((double *)v4 + 44))
      goto LABEL_500;
  }
  else if ((v23 & 2) != 0)
  {
    goto LABEL_500;
  }
  transitScheduleFilter = self->_transitScheduleFilter;
  if ((unint64_t)transitScheduleFilter | *((_QWORD *)v4 + 71))
  {
    if (!-[GEOTraitsTransitScheduleFilter isEqual:](transitScheduleFilter, "isEqual:"))
      goto LABEL_500;
    v22 = (uint64_t)self->_flags;
    v23 = *(_QWORD *)(v4 + 756);
  }
  if ((v22 & 0x10) != 0)
  {
    if ((v23 & 0x10) == 0 || self->_mapZoomLevel != *((double *)v4 + 58))
      goto LABEL_500;
  }
  else if ((v23 & 0x10) != 0)
  {
    goto LABEL_500;
  }
  if ((v22 & 0x4000) != 0)
  {
    if ((v23 & 0x4000) == 0 || self->_mode != *((_DWORD *)v4 + 163))
      goto LABEL_500;
  }
  else if ((v23 & 0x4000) != 0)
  {
    goto LABEL_500;
  }
  displayRegion = self->_displayRegion;
  if ((unint64_t)displayRegion | *((_QWORD *)v4 + 52)
    && !-[NSString isEqual:](displayRegion, "isEqual:"))
  {
    goto LABEL_500;
  }
  providerID = self->_providerID;
  if ((unint64_t)providerID | *((_QWORD *)v4 + 62))
  {
    if (!-[NSString isEqual:](providerID, "isEqual:"))
      goto LABEL_500;
  }
  v27 = (uint64_t)self->_flags;
  v28 = *(_QWORD *)(v4 + 756);
  if ((v27 & 0x800) != 0)
  {
    if ((v28 & 0x800) == 0 || self->_deviceInterfaceOrientation != *((_DWORD *)v4 + 160))
      goto LABEL_500;
  }
  else if ((v28 & 0x800) != 0)
  {
    goto LABEL_500;
  }
  if ((v27 & 0x400) != 0)
  {
    if ((v28 & 0x400) == 0 || self->_deviceBatteryState != *((_DWORD *)v4 + 159))
      goto LABEL_500;
  }
  else if ((v28 & 0x400) != 0)
  {
    goto LABEL_500;
  }
  if ((v27 & 0x100) != 0)
  {
    if ((v28 & 0x100) == 0 || self->_carHeadunitConnectionType != *((_DWORD *)v4 + 157))
      goto LABEL_500;
  }
  else if ((v28 & 0x100) != 0)
  {
    goto LABEL_500;
  }
  if ((v27 & 0x400000000000) != 0)
  {
    if ((v28 & 0x400000000000) == 0)
      goto LABEL_500;
    if (self->_navigating)
    {
      if (!v4[738])
        goto LABEL_500;
    }
    else if (v4[738])
    {
      goto LABEL_500;
    }
  }
  else if ((v28 & 0x400000000000) != 0)
  {
    goto LABEL_500;
  }
  historicalLocations = self->_historicalLocations;
  if ((unint64_t)historicalLocations | *((_QWORD *)v4 + 55)
    && !-[NSMutableArray isEqual:](historicalLocations, "isEqual:"))
  {
    goto LABEL_500;
  }
  automobileOptions = self->_automobileOptions;
  if ((unint64_t)automobileOptions | *((_QWORD *)v4 + 41))
  {
    if (!-[GEOAutomobileOptions isEqual:](automobileOptions, "isEqual:"))
      goto LABEL_500;
  }
  transitOptions = self->_transitOptions;
  if ((unint64_t)transitOptions | *((_QWORD *)v4 + 70))
  {
    if (!-[GEOTransitOptions isEqual:](transitOptions, "isEqual:"))
      goto LABEL_500;
  }
  walkingOptions = self->_walkingOptions;
  if ((unint64_t)walkingOptions | *((_QWORD *)v4 + 75))
  {
    if (!-[GEOWalkingOptions isEqual:](walkingOptions, "isEqual:"))
      goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  v33 = (uint64_t)self->_flags;
  v34 = *(_QWORD *)(v4 + 756);
  if ((v33 & 0x200000) != 0)
  {
    if ((v34 & 0x200000) == 0 || self->_requestMode != *((_DWORD *)v4 + 170))
      goto LABEL_500;
  }
  else if ((v34 & 0x200000) != 0)
  {
    goto LABEL_500;
  }
  if ((v33 & 0x80000000000000) != 0)
  {
    if ((v34 & 0x80000000000000) == 0)
      goto LABEL_500;
    if (self->_supportDirectionIntentSearch)
    {
      if (!v4[747])
        goto LABEL_500;
    }
    else if (v4[747])
    {
      goto LABEL_500;
    }
  }
  else if ((v34 & 0x80000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v33 & 0x100000000000000) != 0)
  {
    if ((v34 & 0x100000000000000) == 0)
      goto LABEL_500;
    if (self->_supportDymSuggestion)
    {
      if (!v4[748])
        goto LABEL_500;
    }
    else if (v4[748])
    {
      goto LABEL_500;
    }
  }
  else if ((v34 & 0x100000000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  v35 = (uint64_t)self->_flags;
  v36 = *(_QWORD *)(v4 + 756);
  if ((v35 & 0x1000000000000000) != 0)
  {
    if ((v36 & 0x1000000000000000) == 0)
      goto LABEL_500;
    if (self->_wantsBrandIcon)
    {
      if (!v4[752])
        goto LABEL_500;
    }
    else if (v4[752])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x1000000000000000) != 0)
  {
    goto LABEL_500;
  }
  venueIdentifier = self->_venueIdentifier;
  if ((unint64_t)venueIdentifier | *((_QWORD *)v4 + 74))
  {
    if (!-[GEOPDVenueIdentifier isEqual:](venueIdentifier, "isEqual:"))
      goto LABEL_500;
    v35 = (uint64_t)self->_flags;
    v36 = *(_QWORD *)(v4 + 756);
  }
  if ((v35 & 0x4000000000) != 0)
  {
    if ((v36 & 0x4000000000) == 0)
      goto LABEL_500;
    if (self->_deviceInVehicle)
    {
      if (!v4[730])
        goto LABEL_500;
    }
    else if (v4[730])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x4000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x400000) != 0)
  {
    if ((v36 & 0x400000) == 0 || self->_requestPriority != *((_DWORD *)v4 + 171))
      goto LABEL_500;
  }
  else if ((v36 & 0x400000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x2000) != 0)
  {
    if ((v36 & 0x2000) == 0 || self->_httpRequestPriority != *((_DWORD *)v4 + 162))
      goto LABEL_500;
  }
  else if ((v36 & 0x2000) != 0)
  {
    goto LABEL_500;
  }
  analyticsAppIdentifier = self->_analyticsAppIdentifier;
  if ((unint64_t)analyticsAppIdentifier | *((_QWORD *)v4 + 36))
  {
    if (!-[NSString isEqual:](analyticsAppIdentifier, "isEqual:"))
      goto LABEL_500;
    v35 = (uint64_t)self->_flags;
    v36 = *(_QWORD *)(v4 + 756);
  }
  if ((v35 & 0x20) != 0)
  {
    if ((v36 & 0x20) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 68))
      goto LABEL_500;
  }
  else if ((v36 & 0x20) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x40000000000000) != 0)
  {
    if ((v36 & 0x40000000000000) == 0)
      goto LABEL_500;
    if (self->_supportDirectionIntentAutocomplete)
    {
      if (!v4[746])
        goto LABEL_500;
    }
    else if (v4[746])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x40000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x400000000000000) != 0)
  {
    if ((v36 & 0x400000000000000) == 0)
      goto LABEL_500;
    if (self->_supportUnresolvedDirectionIntent)
    {
      if (!v4[750])
        goto LABEL_500;
    }
    else if (v4[750])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x400000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x2000000000) != 0)
  {
    if ((v36 & 0x2000000000) == 0)
      goto LABEL_500;
    if (self->_deviceDarkMode)
    {
      if (!v4[729])
        goto LABEL_500;
    }
    else if (v4[729])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x2000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x200000000) != 0)
  {
    if ((v36 & 0x200000000) == 0)
      goto LABEL_500;
    if (self->_appDarkMode)
    {
      if (!v4[725])
        goto LABEL_500;
    }
    else if (v4[725])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x200000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x800000000000000) != 0)
  {
    if ((v36 & 0x800000000000000) == 0)
      goto LABEL_500;
    if (self->_supportsBrandFallback)
    {
      if (!v4[751])
        goto LABEL_500;
    }
    else if (v4[751])
    {
      goto LABEL_500;
    }
  }
  else if ((v36 & 0x800000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v35 & 0x800000) != 0)
  {
    if ((v36 & 0x800000) == 0 || self->_requestPurpose != *((_DWORD *)v4 + 172))
      goto LABEL_500;
  }
  else if ((v36 & 0x800000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_500:
    v69 = 0;
    goto LABEL_501;
  }
  v39 = (uint64_t)self->_flags;
  v40 = *(_QWORD *)(v4 + 756);
  if ((v39 & 0x40000000000) != 0)
  {
    if ((v40 & 0x40000000000) == 0)
      goto LABEL_500;
    if (self->_isSettlement)
    {
      if (!v4[734])
        goto LABEL_500;
    }
    else if (v4[734])
    {
      goto LABEL_500;
    }
  }
  else if ((v40 & 0x40000000000) != 0)
  {
    goto LABEL_500;
  }
  transitTripStopTimeFilter = self->_transitTripStopTimeFilter;
  if ((unint64_t)transitTripStopTimeFilter | *((_QWORD *)v4 + 72))
  {
    if (!-[GEOTraitsTransitScheduleFilter isEqual:](transitTripStopTimeFilter, "isEqual:"))
      goto LABEL_500;
    v39 = (uint64_t)self->_flags;
    v40 = *(_QWORD *)(v4 + 756);
  }
  if ((v39 & 0x20000000000000) != 0)
  {
    if ((v40 & 0x20000000000000) == 0)
      goto LABEL_500;
    if (self->_supportClientRankingFeatureMetadata)
    {
      if (!v4[745])
        goto LABEL_500;
    }
    else if (v4[745])
    {
      goto LABEL_500;
    }
  }
  else if ((v40 & 0x20000000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  v42 = (uint64_t)self->_flags;
  v43 = *(_QWORD *)(v4 + 756);
  if ((v42 & 0x8000000000000) != 0)
  {
    if ((v43 & 0x8000000000000) == 0)
      goto LABEL_500;
    if (self->_supportChildItems)
    {
      if (!v4[743])
        goto LABEL_500;
    }
    else if (v4[743])
    {
      goto LABEL_500;
    }
  }
  else if ((v43 & 0x8000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v42 & 0x10000000000) != 0)
  {
    if ((v43 & 0x10000000000) == 0)
      goto LABEL_500;
    if (self->_isRefund)
    {
      if (!v4[732])
        goto LABEL_500;
    }
    else if (v4[732])
    {
      goto LABEL_500;
    }
  }
  else if ((v43 & 0x10000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v42 & 0x800000000) != 0)
  {
    if ((v43 & 0x800000000) == 0)
      goto LABEL_500;
    if (self->_autocompleteRequestSupportsSectionHeader)
    {
      if (!v4[727])
        goto LABEL_500;
    }
    else if (v4[727])
    {
      goto LABEL_500;
    }
  }
  else if ((v43 & 0x800000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  v44 = (uint64_t)self->_flags;
  v45 = *(_QWORD *)(v4 + 756);
  if ((v44 & 0x8000) != 0)
  {
    if ((v45 & 0x8000) == 0 || self->_navigationTransportType != *((_DWORD *)v4 + 164))
      goto LABEL_500;
  }
  else if ((v45 & 0x8000) != 0)
  {
    goto LABEL_500;
  }
  cyclingOptions = self->_cyclingOptions;
  if ((unint64_t)cyclingOptions | *((_QWORD *)v4 + 47))
  {
    if (!-[GEOCyclingOptions isEqual:](cyclingOptions, "isEqual:"))
      goto LABEL_500;
    v44 = (uint64_t)self->_flags;
    v45 = *(_QWORD *)(v4 + 756);
  }
  if ((v44 & 0x80000) != 0)
  {
    if ((v45 & 0x80000) == 0 || self->_ratingsCount != *((_DWORD *)v4 + 168))
      goto LABEL_500;
  }
  else if ((v45 & 0x80000) != 0)
  {
    goto LABEL_500;
  }
  evChargingPorts = self->_evChargingPorts;
  if ((unint64_t)evChargingPorts | *((_QWORD *)v4 + 53))
  {
    if (!-[NSMutableArray isEqual:](evChargingPorts, "isEqual:"))
      goto LABEL_500;
    v44 = (uint64_t)self->_flags;
    v45 = *(_QWORD *)(v4 + 756);
  }
  if ((v44 & 0x80000000000) != 0)
  {
    if ((v45 & 0x80000000000) == 0)
      goto LABEL_500;
    if (self->_isWidgetRequest)
    {
      if (!v4[735])
        goto LABEL_500;
    }
    else if (v4[735])
    {
      goto LABEL_500;
    }
  }
  else if ((v45 & 0x80000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  v48 = (uint64_t)self->_flags;
  v49 = *(_QWORD *)(v4 + 756);
  if ((v48 & 0x80) != 0)
  {
    if ((v49 & 0x80) == 0 || self->_auxiliaryTierNumResults != *((_DWORD *)v4 + 156))
      goto LABEL_500;
  }
  else if ((v49 & 0x80) != 0)
  {
    goto LABEL_500;
  }
  if ((v48 & 0x40000) != 0)
  {
    if ((v49 & 0x40000) == 0 || self->_placeSummaryRevision != *((_DWORD *)v4 + 167))
      goto LABEL_500;
  }
  else if ((v49 & 0x40000) != 0)
  {
    goto LABEL_500;
  }
  if ((v48 & 8) != 0)
  {
    if ((v49 & 8) == 0 || self->_isTourist != *((double *)v4 + 56))
      goto LABEL_500;
  }
  else if ((v49 & 8) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_500;
  v50 = (uint64_t)self->_flags;
  v51 = *(_QWORD *)(v4 + 756);
  if ((v50 & 0x4000000000000) != 0)
  {
    if ((v51 & 0x4000000000000) == 0)
      goto LABEL_500;
    if (self->_supportAutocompletePublisherResults)
    {
      if (!v4[742])
        goto LABEL_500;
    }
    else if (v4[742])
    {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x4000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v50 & 0x2000000000000) != 0)
  {
    if ((v51 & 0x2000000000000) == 0)
      goto LABEL_500;
    if (self->_supportAutocompleteGuideResults)
    {
      if (!v4[741])
        goto LABEL_500;
    }
    else if (v4[741])
    {
      goto LABEL_500;
    }
  }
  else if ((v51 & 0x2000000000000) != 0)
  {
    goto LABEL_500;
  }
  previousSearchViewport = self->_previousSearchViewport;
  if ((unint64_t)previousSearchViewport | *((_QWORD *)v4 + 60))
  {
    if (!-[GEOPDViewportInfo isEqual:](previousSearchViewport, "isEqual:"))
      goto LABEL_500;
    v50 = (uint64_t)self->_flags;
    v51 = *(_QWORD *)(v4 + 756);
  }
  if ((v50 & 0x10000) != 0)
  {
    if ((v51 & 0x10000) == 0 || self->_photoAlbumCount != *((_DWORD *)v4 + 165))
      goto LABEL_500;
  }
  else if ((v51 & 0x10000) != 0)
  {
    goto LABEL_500;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  if ((unint64_t)resultRefinementQuery | *((_QWORD *)v4 + 64))
  {
    if (!-[GEOPDResultRefinementQuery isEqual:](resultRefinementQuery, "isEqual:"))
      goto LABEL_500;
    v50 = (uint64_t)self->_flags;
    v51 = *(_QWORD *)(v4 + 756);
  }
  if ((v50 & 0x100000) != 0)
  {
    if ((v51 & 0x100000) == 0 || self->_relatedPlaceItemCount != *((_DWORD *)v4 + 169))
      goto LABEL_500;
  }
  else if ((v51 & 0x100000) != 0)
  {
    goto LABEL_500;
  }
  if ((v50 & 0x4000000) != 0)
  {
    if ((v51 & 0x4000000) == 0 || self->_searchRequestType != *((_DWORD *)v4 + 175))
      goto LABEL_500;
  }
  else if ((v51 & 0x4000000) != 0)
  {
    goto LABEL_500;
  }
  currentLocaleCurrencySymbol = self->_currentLocaleCurrencySymbol;
  if ((unint64_t)currentLocaleCurrencySymbol | *((_QWORD *)v4 + 46)
    && !-[NSString isEqual:](currentLocaleCurrencySymbol, "isEqual:")
    || !PBRepeatedInt32IsEqual())
  {
    goto LABEL_500;
  }
  v55 = (uint64_t)self->_flags;
  v56 = *(_QWORD *)(v4 + 756);
  if ((v55 & 0x40) != 0)
  {
    if ((v56 & 0x40) == 0 || self->_autocompleteOriginationType != *((_DWORD *)v4 + 155))
      goto LABEL_500;
  }
  else if ((v56 & 0x40) != 0)
  {
    goto LABEL_500;
  }
  autocompleteOriginationPreviousLatlng = self->_autocompleteOriginationPreviousLatlng;
  if ((unint64_t)autocompleteOriginationPreviousLatlng | *((_QWORD *)v4 + 40))
  {
    if (!-[GEOLatLng isEqual:](autocompleteOriginationPreviousLatlng, "isEqual:"))
      goto LABEL_500;
    v55 = (uint64_t)self->_flags;
    v56 = *(_QWORD *)(v4 + 756);
  }
  if ((v55 & 0x8000000) != 0)
  {
    if ((v56 & 0x8000000) == 0 || self->_searchOriginationType != *((_DWORD *)v4 + 176))
      goto LABEL_500;
  }
  else if ((v56 & 0x8000000) != 0)
  {
    goto LABEL_500;
  }
  searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;
  if ((unint64_t)searchOriginationPreviousLatlng | *((_QWORD *)v4 + 67)
    && !-[GEOLatLng isEqual:](searchOriginationPreviousLatlng, "isEqual:"))
  {
    goto LABEL_500;
  }
  addStopRouteInfo = self->_addStopRouteInfo;
  if ((unint64_t)addStopRouteInfo | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOAddStopRouteInfo isEqual:](addStopRouteInfo, "isEqual:"))
      goto LABEL_500;
  }
  v60 = (uint64_t)self->_flags;
  v61 = *(_QWORD *)(v4 + 756);
  if ((v60 & 0x400000000) != 0)
  {
    if ((v61 & 0x400000000) == 0)
      goto LABEL_500;
    if (self->_autocompleteOriginationEditingServerWaypoints)
    {
      if (!v4[726])
        goto LABEL_500;
    }
    else if (v4[726])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x400000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x1000000000000) != 0)
  {
    if ((v61 & 0x1000000000000) == 0)
      goto LABEL_500;
    if (self->_searchOriginationEditingServerWaypoints)
    {
      if (!v4[740])
        goto LABEL_500;
    }
    else if (v4[740])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x1000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x10000000000000) != 0)
  {
    if ((v61 & 0x10000000000000) == 0)
      goto LABEL_500;
    if (self->_supportClientRankingCompositeFeatures)
    {
      if (!v4[744])
        goto LABEL_500;
    }
    else if (v4[744])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x10000000000000) != 0)
  {
    goto LABEL_500;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((_QWORD *)v4 + 61))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:"))
      goto LABEL_500;
    v60 = (uint64_t)self->_flags;
    v61 = *(_QWORD *)(v4 + 756);
  }
  if ((v60 & 0x2000000) != 0)
  {
    if ((v61 & 0x2000000) == 0 || self->_routeStopCount != *((_DWORD *)v4 + 174))
      goto LABEL_500;
  }
  else if ((v61 & 0x2000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x200000000000000) != 0)
  {
    if ((v61 & 0x200000000000000) == 0)
      goto LABEL_500;
    if (self->_supportStructuredRapAffordance)
    {
      if (!v4[749])
        goto LABEL_500;
    }
    else if (v4[749])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x200000000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v60 & 0x20000000000) != 0)
  {
    if ((v61 & 0x20000000000) == 0)
      goto LABEL_500;
    if (self->_isRoutePlanningEditStopFillRequest)
    {
      if (!v4[733])
        goto LABEL_500;
    }
    else if (v4[733])
    {
      goto LABEL_500;
    }
  }
  else if ((v61 & 0x20000000000) != 0)
  {
    goto LABEL_500;
  }
  if (!PBRepeatedUInt64IsEqual())
    goto LABEL_500;
  v63 = (uint64_t)self->_flags;
  v64 = *(_QWORD *)(v4 + 756);
  if ((v63 & 0x100000000000) != 0)
  {
    if ((v64 & 0x100000000000) == 0)
      goto LABEL_500;
    if (self->_isWithinHikingBoundary)
    {
      if (!v4[736])
        goto LABEL_500;
    }
    else if (v4[736])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x100000000000) != 0)
  {
    goto LABEL_500;
  }
  if ((v63 & 0x200000000000) != 0)
  {
    if ((v64 & 0x200000000000) == 0)
      goto LABEL_500;
    if (self->_isWithinHikingBufferRegion)
    {
      if (!v4[737])
        goto LABEL_500;
    }
    else if (v4[737])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x200000000000) != 0)
  {
    goto LABEL_500;
  }
  searchImplicitFilterInfo = self->_searchImplicitFilterInfo;
  if ((unint64_t)searchImplicitFilterInfo | *((_QWORD *)v4 + 66))
  {
    if (!-[GEOSearchImplicitFilterInfo isEqual:](searchImplicitFilterInfo, "isEqual:"))
      goto LABEL_500;
    v63 = (uint64_t)self->_flags;
    v64 = *(_QWORD *)(v4 + 756);
  }
  if ((v63 & 0x1000) != 0)
  {
    if ((v64 & 0x1000) == 0 || self->_devicePlatform != *((_DWORD *)v4 + 161))
      goto LABEL_500;
  }
  else if ((v64 & 0x1000) != 0)
  {
    goto LABEL_500;
  }
  if ((v63 & 0x1000000000) != 0)
  {
    if ((v64 & 0x1000000000) == 0)
      goto LABEL_500;
    if (self->_containsSensitiveData)
    {
      if (!v4[728])
        goto LABEL_500;
    }
    else if (v4[728])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x1000000000) != 0)
  {
    goto LABEL_500;
  }
  spotlightSearchPunchinEncodedString = self->_spotlightSearchPunchinEncodedString;
  if ((unint64_t)spotlightSearchPunchinEncodedString | *((_QWORD *)v4 + 69))
  {
    if (!-[NSString isEqual:](spotlightSearchPunchinEncodedString, "isEqual:"))
      goto LABEL_500;
    v63 = (uint64_t)self->_flags;
    v64 = *(_QWORD *)(v4 + 756);
  }
  if ((v63 & 0x800000000000) != 0)
  {
    if ((v64 & 0x800000000000) == 0)
      goto LABEL_500;
    if (self->_optimizeSearchRequestComponents)
    {
      if (!v4[739])
        goto LABEL_500;
    }
    else if (v4[739])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x800000000000) != 0)
  {
    goto LABEL_500;
  }
  recentAutocompleteSessionData = self->_recentAutocompleteSessionData;
  if ((unint64_t)recentAutocompleteSessionData | *((_QWORD *)v4 + 63))
  {
    if (!-[GEOPDAutocompleteSessionData isEqual:](recentAutocompleteSessionData, "isEqual:"))
      goto LABEL_500;
    v63 = (uint64_t)self->_flags;
    v64 = *(_QWORD *)(v4 + 756);
  }
  if ((v63 & 0x100000000) != 0)
  {
    if ((v64 & 0x100000000) == 0)
      goto LABEL_500;
    if (self->_analyticsOptOut)
    {
      if (!v4[724])
        goto LABEL_500;
    }
    else if (v4[724])
    {
      goto LABEL_500;
    }
  }
  else if ((v64 & 0x100000000) != 0)
  {
    goto LABEL_500;
  }
  userActionMetadata = self->_userActionMetadata;
  if ((unint64_t)userActionMetadata | *((_QWORD *)v4 + 73))
  {
    if (!-[GEOPDSSessionUserActionMetadata isEqual:](userActionMetadata, "isEqual:"))
      goto LABEL_500;
    v63 = (uint64_t)self->_flags;
    v64 = *(_QWORD *)(v4 + 756);
  }
  if ((v63 & 0x2000000000000000) != 0)
  {
    if ((v64 & 0x2000000000000000) != 0)
    {
      if (self->_wantsRouteCreationTip)
      {
        if (v4[753])
          goto LABEL_503;
      }
      else if (!v4[753])
      {
        goto LABEL_503;
      }
    }
    goto LABEL_500;
  }
  if ((v64 & 0x2000000000000000) != 0)
    goto LABEL_500;
LABEL_503:
  hardwareIdentifier = self->_hardwareIdentifier;
  if ((unint64_t)hardwareIdentifier | *((_QWORD *)v4 + 54))
    v69 = -[NSString isEqual:](hardwareIdentifier, "isEqual:");
  else
    v69 = 1;
LABEL_501:

  return v69;
}

- (unint64_t)hash
{
  uint64_t flags;
  uint64_t v4;
  $DCA03DC0A7F5305716C671105EBE6326 *p_flags;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  double carHeadunitPixelWidth;
  double v10;
  long double v11;
  double v12;
  unint64_t v13;
  double carHeadunitPixelHeight;
  double v15;
  long double v16;
  double v17;
  uint64_t v18;
  unint64_t v19;
  double mapZoomLevel;
  double v21;
  long double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  $DCA03DC0A7F5305716C671105EBE6326 *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  double sessionRelativeTimestamp;
  double v31;
  long double v32;
  double v33;
  uint64_t v34;
  $DCA03DC0A7F5305716C671105EBE6326 *v35;
  uint64_t v36;
  double isTourist;
  double v38;
  long double v39;
  double v40;
  unint64_t v41;
  uint64_t v42;
  $DCA03DC0A7F5305716C671105EBE6326 *v43;
  uint64_t v44;
  $DCA03DC0A7F5305716C671105EBE6326 *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSUInteger v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  NSUInteger v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  NSUInteger v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSUInteger v129;
  NSUInteger v130;
  uint64_t v131;
  unint64_t v132;
  unint64_t v133;
  unint64_t v134;
  unint64_t v135;
  NSUInteger v136;
  NSUInteger v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  NSUInteger v147;
  NSUInteger v148;
  uint64_t v149;
  unint64_t v150;
  uint64_t v151;
  unint64_t v152;
  NSUInteger v153;
  NSUInteger v154;
  NSUInteger v155;
  uint64_t v156;
  uint64_t v157;

  -[GEOMapServiceTraits readAll:](self, "readAll:", 1);
  flags = (uint64_t)self->_flags;
  if ((flags & 1) != 0)
  {
    v157 = PBHashBytes();
    flags = (uint64_t)self->_flags;
  }
  else
  {
    v157 = 0;
  }
  if ((flags & 0x10000000) != 0)
    v156 = 2654435761 * self->_sequenceNumber;
  else
    v156 = 0;
  v155 = -[NSString hash](self->_appIdentifier, "hash");
  v154 = -[NSString hash](self->_appMajorVersion, "hash");
  v153 = -[NSString hash](self->_appMinorVersion, "hash");
  v152 = -[GEOLocation hash](self->_deviceLocation, "hash");
  v151 = PBRepeatedInt32Hash();
  v150 = -[GEOMapRegion hash](self->_mapRegion, "hash");
  v149 = -[NSMutableArray hash](self->_deviceDisplayLanguages, "hash");
  v148 = -[NSString hash](self->_deviceKeyboardLocale, "hash");
  v147 = -[NSString hash](self->_deviceSpokenLocale, "hash");
  v4 = (uint64_t)self->_flags;
  if ((v4 & 0x8000000000) != 0)
  {
    v146 = 2654435761 * self->_isAPICall;
    if ((v4 & 0x20000000) != 0)
      goto LABEL_9;
  }
  else
  {
    v146 = 0;
    if ((v4 & 0x20000000) != 0)
    {
LABEL_9:
      v145 = 2654435761 * self->_source;
      goto LABEL_12;
    }
  }
  v145 = 0;
LABEL_12:
  v144 = -[NSMutableArray hash](self->_photoSizes, "hash");
  p_flags = &self->_flags;
  if ((*((_BYTE *)&self->_flags + 2) & 2) != 0)
    v143 = 2654435761 * self->_photosCount;
  else
    v143 = 0;
  v142 = -[NSMutableArray hash](self->_reviewUserPhotoSizes, "hash");
  v6 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x1000000) != 0)
  {
    v141 = 2654435761 * self->_reviewUserPhotosCount;
    if ((v6 & 0x40000000) != 0)
    {
LABEL_17:
      v140 = 2654435761 * self->_timeSinceMapEnteredForeground;
      if ((v6 & 0x80000000) != 0)
        goto LABEL_18;
LABEL_22:
      v139 = 0;
      if ((v6 & 0x200) != 0)
        goto LABEL_19;
      goto LABEL_23;
    }
  }
  else
  {
    v141 = 0;
    if ((v6 & 0x40000000) != 0)
      goto LABEL_17;
  }
  v140 = 0;
  if ((v6 & 0x80000000) == 0)
    goto LABEL_22;
LABEL_18:
  v139 = 2654435761 * self->_timeSinceMapViewportChanged;
  if ((v6 & 0x200) != 0)
  {
LABEL_19:
    v138 = 2654435761 * self->_carHeadunitInteractionModel;
    goto LABEL_24;
  }
LABEL_23:
  v138 = 0;
LABEL_24:
  v137 = -[NSString hash](self->_carHeadunitManufacturer, "hash");
  v136 = -[NSString hash](self->_carHeadunitModel, "hash");
  v7 = (uint64_t)self->_flags;
  if ((v7 & 4) != 0)
  {
    carHeadunitPixelWidth = self->_carHeadunitPixelWidth;
    v10 = -carHeadunitPixelWidth;
    if (carHeadunitPixelWidth >= 0.0)
      v10 = self->_carHeadunitPixelWidth;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  v135 = v8;
  if ((v7 & 2) != 0)
  {
    carHeadunitPixelHeight = self->_carHeadunitPixelHeight;
    v15 = -carHeadunitPixelHeight;
    if (carHeadunitPixelHeight >= 0.0)
      v15 = self->_carHeadunitPixelHeight;
    v16 = floor(v15 + 0.5);
    v17 = (v15 - v16) * 1.84467441e19;
    v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0)
        v13 += (unint64_t)v17;
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    v13 = 0;
  }
  v134 = v13;
  v133 = -[GEOTraitsTransitScheduleFilter hash](self->_transitScheduleFilter, "hash");
  v18 = (uint64_t)self->_flags;
  if ((v18 & 0x10) != 0)
  {
    mapZoomLevel = self->_mapZoomLevel;
    v21 = -mapZoomLevel;
    if (mapZoomLevel >= 0.0)
      v21 = self->_mapZoomLevel;
    v22 = floor(v21 + 0.5);
    v23 = (v21 - v22) * 1.84467441e19;
    v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0)
        v19 += (unint64_t)v23;
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    v19 = 0;
  }
  v132 = v19;
  if ((v18 & 0x4000) != 0)
    v131 = 2654435761 * self->_mode;
  else
    v131 = 0;
  v130 = -[NSString hash](self->_displayRegion, "hash");
  v129 = -[NSString hash](self->_providerID, "hash");
  v24 = (uint64_t)self->_flags;
  if ((v24 & 0x800) != 0)
  {
    v128 = 2654435761 * self->_deviceInterfaceOrientation;
    if ((v24 & 0x400) != 0)
    {
LABEL_53:
      v127 = 2654435761 * self->_deviceBatteryState;
      if ((v24 & 0x100) != 0)
        goto LABEL_54;
LABEL_58:
      v126 = 0;
      if ((v24 & 0x400000000000) != 0)
        goto LABEL_55;
      goto LABEL_59;
    }
  }
  else
  {
    v128 = 0;
    if ((v24 & 0x400) != 0)
      goto LABEL_53;
  }
  v127 = 0;
  if ((v24 & 0x100) == 0)
    goto LABEL_58;
LABEL_54:
  v126 = 2654435761 * self->_carHeadunitConnectionType;
  if ((v24 & 0x400000000000) != 0)
  {
LABEL_55:
    v125 = 2654435761 * self->_navigating;
    goto LABEL_60;
  }
LABEL_59:
  v125 = 0;
LABEL_60:
  v124 = -[NSMutableArray hash](self->_historicalLocations, "hash");
  v123 = -[GEOAutomobileOptions hash](self->_automobileOptions, "hash");
  v122 = -[GEOTransitOptions hash](self->_transitOptions, "hash");
  v121 = -[GEOWalkingOptions hash](self->_walkingOptions, "hash");
  v120 = PBRepeatedInt32Hash();
  v25 = (uint64_t)self->_flags;
  if ((v25 & 0x200000) == 0)
  {
    v119 = 0;
    if ((v25 & 0x80000000000000) != 0)
      goto LABEL_62;
LABEL_65:
    v118 = 0;
    if ((v25 & 0x100000000000000) != 0)
      goto LABEL_63;
    goto LABEL_66;
  }
  v119 = 2654435761 * self->_requestMode;
  if ((v25 & 0x80000000000000) == 0)
    goto LABEL_65;
LABEL_62:
  v118 = 2654435761 * self->_supportDirectionIntentSearch;
  if ((v25 & 0x100000000000000) != 0)
  {
LABEL_63:
    v117 = 2654435761 * self->_supportDymSuggestion;
    goto LABEL_67;
  }
LABEL_66:
  v117 = 0;
LABEL_67:
  v116 = PBRepeatedInt32Hash();
  v26 = &self->_flags;
  if ((*((_BYTE *)&self->_flags + 7) & 0x10) != 0)
    v115 = 2654435761 * self->_wantsBrandIcon;
  else
    v115 = 0;
  v114 = -[GEOPDVenueIdentifier hash](self->_venueIdentifier, "hash");
  v27 = *(_QWORD *)v26;
  if ((*(_QWORD *)v26 & 0x4000000000) == 0)
  {
    v113 = 0;
    if ((v27 & 0x400000) != 0)
      goto LABEL_72;
LABEL_75:
    v112 = 0;
    if ((v27 & 0x2000) != 0)
      goto LABEL_73;
    goto LABEL_76;
  }
  v113 = 2654435761 * self->_deviceInVehicle;
  if ((v27 & 0x400000) == 0)
    goto LABEL_75;
LABEL_72:
  v112 = 2654435761 * self->_requestPriority;
  if ((v27 & 0x2000) != 0)
  {
LABEL_73:
    v111 = 2654435761 * self->_httpRequestPriority;
    goto LABEL_77;
  }
LABEL_76:
  v111 = 0;
LABEL_77:
  v110 = -[NSString hash](self->_analyticsAppIdentifier, "hash");
  v28 = (uint64_t)self->_flags;
  if ((v28 & 0x20) != 0)
  {
    sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
    v31 = -sessionRelativeTimestamp;
    if (sessionRelativeTimestamp >= 0.0)
      v31 = self->_sessionRelativeTimestamp;
    v32 = floor(v31 + 0.5);
    v33 = (v31 - v32) * 1.84467441e19;
    v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0)
        v29 += (unint64_t)v33;
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    v29 = 0;
  }
  if ((v28 & 0x40000000000000) != 0)
  {
    v108 = 2654435761 * self->_supportDirectionIntentAutocomplete;
    if ((v28 & 0x400000000000000) != 0)
    {
LABEL_87:
      v107 = 2654435761 * self->_supportUnresolvedDirectionIntent;
      if ((v28 & 0x2000000000) != 0)
        goto LABEL_88;
      goto LABEL_93;
    }
  }
  else
  {
    v108 = 0;
    if ((v28 & 0x400000000000000) != 0)
      goto LABEL_87;
  }
  v107 = 0;
  if ((v28 & 0x2000000000) != 0)
  {
LABEL_88:
    v106 = 2654435761 * self->_deviceDarkMode;
    if ((v28 & 0x200000000) != 0)
      goto LABEL_89;
LABEL_94:
    v105 = 0;
    if ((v28 & 0x800000000000000) != 0)
      goto LABEL_90;
    goto LABEL_95;
  }
LABEL_93:
  v106 = 0;
  if ((v28 & 0x200000000) == 0)
    goto LABEL_94;
LABEL_89:
  v105 = 2654435761 * self->_appDarkMode;
  if ((v28 & 0x800000000000000) != 0)
  {
LABEL_90:
    v104 = 2654435761 * self->_supportsBrandFallback;
    goto LABEL_96;
  }
LABEL_95:
  v104 = 0;
LABEL_96:
  v109 = v29;
  if ((v28 & 0x800000) != 0)
    v103 = 2654435761 * self->_requestPurpose;
  else
    v103 = 0;
  v102 = PBRepeatedInt32Hash();
  if ((*((_BYTE *)&self->_flags + 5) & 4) != 0)
    v101 = 2654435761 * self->_isSettlement;
  else
    v101 = 0;
  v100 = -[GEOTraitsTransitScheduleFilter hash](self->_transitTripStopTimeFilter, "hash");
  if ((*((_BYTE *)&self->_flags + 6) & 0x20) != 0)
    v99 = 2654435761 * self->_supportClientRankingFeatureMetadata;
  else
    v99 = 0;
  v98 = PBRepeatedInt32Hash();
  v34 = (uint64_t)self->_flags;
  if ((v34 & 0x8000000000000) == 0)
  {
    v97 = 0;
    if ((v34 & 0x10000000000) != 0)
      goto LABEL_107;
LABEL_110:
    v96 = 0;
    if ((v34 & 0x800000000) != 0)
      goto LABEL_108;
    goto LABEL_111;
  }
  v97 = 2654435761 * self->_supportChildItems;
  if ((v34 & 0x10000000000) == 0)
    goto LABEL_110;
LABEL_107:
  v96 = 2654435761 * self->_isRefund;
  if ((v34 & 0x800000000) != 0)
  {
LABEL_108:
    v95 = 2654435761 * self->_autocompleteRequestSupportsSectionHeader;
    goto LABEL_112;
  }
LABEL_111:
  v95 = 0;
LABEL_112:
  v94 = PBRepeatedInt32Hash();
  if ((*((_BYTE *)&self->_flags + 1) & 0x80) != 0)
    v93 = 2654435761 * self->_navigationTransportType;
  else
    v93 = 0;
  v92 = -[GEOCyclingOptions hash](self->_cyclingOptions, "hash");
  if ((*((_BYTE *)&self->_flags + 2) & 8) != 0)
    v91 = 2654435761 * self->_ratingsCount;
  else
    v91 = 0;
  v90 = -[NSMutableArray hash](self->_evChargingPorts, "hash");
  v35 = &self->_flags;
  if ((*((_BYTE *)&self->_flags + 5) & 8) != 0)
    v89 = 2654435761 * self->_isWidgetRequest;
  else
    v89 = 0;
  v88 = PBRepeatedInt32Hash();
  v36 = *(_QWORD *)v35;
  if ((*(_QWORD *)v35 & 0x80) == 0)
  {
    v87 = 0;
    if ((v36 & 0x40000) != 0)
      goto LABEL_123;
LABEL_129:
    v86 = 0;
    if ((v36 & 8) != 0)
      goto LABEL_124;
LABEL_130:
    v41 = 0;
    goto LABEL_133;
  }
  v87 = 2654435761 * self->_auxiliaryTierNumResults;
  if ((v36 & 0x40000) == 0)
    goto LABEL_129;
LABEL_123:
  v86 = 2654435761 * self->_placeSummaryRevision;
  if ((v36 & 8) == 0)
    goto LABEL_130;
LABEL_124:
  isTourist = self->_isTourist;
  v38 = -isTourist;
  if (isTourist >= 0.0)
    v38 = self->_isTourist;
  v39 = floor(v38 + 0.5);
  v40 = (v38 - v39) * 1.84467441e19;
  v41 = 2654435761u * (unint64_t)fmod(v39, 1.84467441e19);
  if (v40 >= 0.0)
  {
    if (v40 > 0.0)
      v41 += (unint64_t)v40;
  }
  else
  {
    v41 -= (unint64_t)fabs(v40);
  }
LABEL_133:
  v85 = v41;
  v84 = PBRepeatedInt32Hash();
  v42 = (uint64_t)self->_flags;
  if ((v42 & 0x4000000000000) != 0)
  {
    v83 = 2654435761 * self->_supportAutocompletePublisherResults;
    if ((v42 & 0x2000000000000) != 0)
      goto LABEL_135;
  }
  else
  {
    v83 = 0;
    if ((v42 & 0x2000000000000) != 0)
    {
LABEL_135:
      v82 = 2654435761 * self->_supportAutocompleteGuideResults;
      goto LABEL_138;
    }
  }
  v82 = 0;
LABEL_138:
  v81 = -[GEOPDViewportInfo hash](self->_previousSearchViewport, "hash");
  v43 = &self->_flags;
  if ((*((_BYTE *)&self->_flags + 2) & 1) != 0)
    v80 = 2654435761 * self->_photoAlbumCount;
  else
    v80 = 0;
  v79 = -[GEOPDResultRefinementQuery hash](self->_resultRefinementQuery, "hash");
  v44 = *(_QWORD *)v43;
  if ((*(_QWORD *)v43 & 0x100000) != 0)
  {
    v78 = 2654435761 * self->_relatedPlaceItemCount;
    if ((v44 & 0x4000000) != 0)
      goto LABEL_143;
  }
  else
  {
    v78 = 0;
    if ((v44 & 0x4000000) != 0)
    {
LABEL_143:
      v77 = 2654435761 * self->_searchRequestType;
      goto LABEL_146;
    }
  }
  v77 = 0;
LABEL_146:
  v76 = -[NSString hash](self->_currentLocaleCurrencySymbol, "hash");
  v75 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 0x40) != 0)
    v74 = 2654435761 * self->_autocompleteOriginationType;
  else
    v74 = 0;
  v73 = -[GEOLatLng hash](self->_autocompleteOriginationPreviousLatlng, "hash");
  v45 = &self->_flags;
  if ((*((_BYTE *)&self->_flags + 3) & 8) != 0)
    v72 = 2654435761 * self->_searchOriginationType;
  else
    v72 = 0;
  v71 = -[GEOLatLng hash](self->_searchOriginationPreviousLatlng, "hash");
  v70 = -[GEOAddStopRouteInfo hash](self->_addStopRouteInfo, "hash");
  v46 = *(_QWORD *)v45;
  if ((*(_QWORD *)v45 & 0x400000000) == 0)
  {
    v69 = 0;
    if ((v46 & 0x1000000000000) != 0)
      goto LABEL_154;
LABEL_157:
    v68 = 0;
    if ((v46 & 0x10000000000000) != 0)
      goto LABEL_155;
    goto LABEL_158;
  }
  v69 = 2654435761 * self->_autocompleteOriginationEditingServerWaypoints;
  if ((v46 & 0x1000000000000) == 0)
    goto LABEL_157;
LABEL_154:
  v68 = 2654435761 * self->_searchOriginationEditingServerWaypoints;
  if ((v46 & 0x10000000000000) != 0)
  {
LABEL_155:
    v67 = 2654435761 * self->_supportClientRankingCompositeFeatures;
    goto LABEL_159;
  }
LABEL_158:
  v67 = 0;
LABEL_159:
  v66 = -[GEOPrivacyMetadata hash](self->_privacyMetadata, "hash");
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x2000000) == 0)
  {
    v65 = 0;
    if ((v47 & 0x200000000000000) != 0)
      goto LABEL_161;
LABEL_164:
    v64 = 0;
    if ((v47 & 0x20000000000) != 0)
      goto LABEL_162;
    goto LABEL_165;
  }
  v65 = 2654435761 * self->_routeStopCount;
  if ((v47 & 0x200000000000000) == 0)
    goto LABEL_164;
LABEL_161:
  v64 = 2654435761 * self->_supportStructuredRapAffordance;
  if ((v47 & 0x20000000000) != 0)
  {
LABEL_162:
    v63 = 2654435761 * self->_isRoutePlanningEditStopFillRequest;
    goto LABEL_166;
  }
LABEL_165:
  v63 = 0;
LABEL_166:
  v62 = PBRepeatedUInt64Hash();
  v48 = (uint64_t)self->_flags;
  if ((v48 & 0x100000000000) != 0)
  {
    v61 = 2654435761 * self->_isWithinHikingBoundary;
    if ((v48 & 0x200000000000) != 0)
      goto LABEL_168;
  }
  else
  {
    v61 = 0;
    if ((v48 & 0x200000000000) != 0)
    {
LABEL_168:
      v60 = 2654435761 * self->_isWithinHikingBufferRegion;
      goto LABEL_171;
    }
  }
  v60 = 0;
LABEL_171:
  v49 = -[GEOSearchImplicitFilterInfo hash](self->_searchImplicitFilterInfo, "hash");
  v50 = (uint64_t)self->_flags;
  if ((v50 & 0x1000) != 0)
  {
    v51 = 2654435761 * self->_devicePlatform;
    if ((v50 & 0x1000000000) != 0)
      goto LABEL_173;
  }
  else
  {
    v51 = 0;
    if ((v50 & 0x1000000000) != 0)
    {
LABEL_173:
      v52 = 2654435761 * self->_containsSensitiveData;
      goto LABEL_176;
    }
  }
  v52 = 0;
LABEL_176:
  v53 = -[NSString hash](self->_spotlightSearchPunchinEncodedString, "hash");
  if ((*((_BYTE *)&self->_flags + 5) & 0x80) != 0)
    v54 = 2654435761 * self->_optimizeSearchRequestComponents;
  else
    v54 = 0;
  v55 = -[GEOPDAutocompleteSessionData hash](self->_recentAutocompleteSessionData, "hash");
  if ((*((_BYTE *)&self->_flags + 4) & 1) != 0)
    v56 = 2654435761 * self->_analyticsOptOut;
  else
    v56 = 0;
  v57 = -[GEOPDSSessionUserActionMetadata hash](self->_userActionMetadata, "hash");
  if ((*((_BYTE *)&self->_flags + 7) & 0x20) != 0)
    v58 = 2654435761 * self->_wantsRouteCreationTip;
  else
    v58 = 0;
  return v156 ^ v157 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v49 ^ v51 ^ v52 ^ v53 ^ v54 ^ v55 ^ v56 ^ v57 ^ v58 ^ -[NSString hash](self->_hardwareIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  uint64_t v5;
  GEOLocation *deviceLocation;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  GEOMapRegion *mapRegion;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t m;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  GEOTraitsTransitScheduleFilter *transitScheduleFilter;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t n;
  GEOAutomobileOptions *automobileOptions;
  uint64_t v43;
  GEOTransitOptions *transitOptions;
  uint64_t v45;
  GEOWalkingOptions *walkingOptions;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t ii;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t jj;
  GEOPDVenueIdentifier *venueIdentifier;
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t kk;
  GEOTraitsTransitScheduleFilter *transitTripStopTimeFilter;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t mm;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t nn;
  GEOCyclingOptions *cyclingOptions;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t i1;
  uint64_t v82;
  uint64_t v83;
  uint64_t i2;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i3;
  uint64_t v90;
  GEOPDViewportInfo *previousSearchViewport;
  uint64_t v92;
  GEOPDResultRefinementQuery *resultRefinementQuery;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t i4;
  GEOLatLng *autocompleteOriginationPreviousLatlng;
  uint64_t v100;
  GEOLatLng *searchOriginationPreviousLatlng;
  uint64_t v102;
  GEOAddStopRouteInfo *addStopRouteInfo;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v108;
  uint64_t *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t i5;
  uint64_t v114;
  GEOSearchImplicitFilterInfo *searchImplicitFilterInfo;
  uint64_t v116;
  uint64_t v117;
  GEOPDAutocompleteSessionData *recentAutocompleteSessionData;
  uint64_t v119;
  GEOPDSSessionUserActionMetadata *userActionMetadata;
  uint64_t v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _BYTE v142[128];
  _BYTE v143[128];
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v147 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v5 = *(_QWORD *)(v4 + 756);
  if ((v5 & 1) != 0)
  {
    self->_sessionId = *(GEOSessionID *)(v4 + 264);
    *(_QWORD *)&self->_flags |= 1uLL;
    v5 = *(_QWORD *)(v4 + 756);
  }
  if ((v5 & 0x10000000) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 177);
    *(_QWORD *)&self->_flags |= 0x10000000uLL;
  }
  if (*((_QWORD *)v4 + 37))
    -[GEOMapServiceTraits setAppIdentifier:](self, "setAppIdentifier:");
  if (*((_QWORD *)v4 + 38))
    -[GEOMapServiceTraits setAppMajorVersion:](self, "setAppMajorVersion:");
  if (*((_QWORD *)v4 + 39))
    -[GEOMapServiceTraits setAppMinorVersion:](self, "setAppMinorVersion:");
  deviceLocation = self->_deviceLocation;
  v7 = *((_QWORD *)v4 + 48);
  if (deviceLocation)
  {
    if (v7)
      -[GEOLocation mergeFrom:](deviceLocation, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEOMapServiceTraits setDeviceLocation:](self, "setDeviceLocation:");
  }
  v8 = objc_msgSend(v4, "transportTypesCount");
  if (v8)
  {
    v9 = v8;
    for (i = 0; i != v9; ++i)
      -[GEOMapServiceTraits addTransportType:](self, "addTransportType:", objc_msgSend(v4, "transportTypeAtIndex:", i));
  }
  mapRegion = self->_mapRegion;
  v12 = *((_QWORD *)v4 + 57);
  if (mapRegion)
  {
    if (v12)
      -[GEOMapRegion mergeFrom:](mapRegion, "mergeFrom:");
  }
  else if (v12)
  {
    -[GEOMapServiceTraits setMapRegion:](self, "setMapRegion:");
  }
  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  v13 = *((id *)v4 + 49);
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v138, v146, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v139;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v139 != v16)
          objc_enumerationMutation(v13);
        -[GEOMapServiceTraits addDeviceDisplayLanguage:](self, "addDeviceDisplayLanguage:", *(_QWORD *)(*((_QWORD *)&v138 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v138, v146, 16);
    }
    while (v15);
  }

  if (*((_QWORD *)v4 + 50))
    -[GEOMapServiceTraits setDeviceKeyboardLocale:](self, "setDeviceKeyboardLocale:");
  if (*((_QWORD *)v4 + 51))
    -[GEOMapServiceTraits setDeviceSpokenLocale:](self, "setDeviceSpokenLocale:");
  v18 = *(_QWORD *)(v4 + 756);
  if ((v18 & 0x8000000000) != 0)
  {
    self->_isAPICall = v4[731];
    *(_QWORD *)&self->_flags |= 0x8000000000uLL;
    v18 = *(_QWORD *)(v4 + 756);
  }
  if ((v18 & 0x20000000) != 0)
  {
    self->_source = *((_DWORD *)v4 + 178);
    *(_QWORD *)&self->_flags |= 0x20000000uLL;
  }
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v19 = *((id *)v4 + 59);
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v134, v145, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v135;
    do
    {
      for (k = 0; k != v21; ++k)
      {
        if (*(_QWORD *)v135 != v22)
          objc_enumerationMutation(v19);
        -[GEOMapServiceTraits addPhotoSizes:](self, "addPhotoSizes:", *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * k));
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v134, v145, 16);
    }
    while (v21);
  }

  if ((v4[758] & 2) != 0)
  {
    self->_photosCount = *((_DWORD *)v4 + 166);
    *(_QWORD *)&self->_flags |= 0x20000uLL;
  }
  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  v24 = *((id *)v4 + 65);
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v131;
    do
    {
      for (m = 0; m != v26; ++m)
      {
        if (*(_QWORD *)v131 != v27)
          objc_enumerationMutation(v24);
        -[GEOMapServiceTraits addReviewUserPhotoSizes:](self, "addReviewUserPhotoSizes:", *(_QWORD *)(*((_QWORD *)&v130 + 1) + 8 * m));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v130, v144, 16);
    }
    while (v26);
  }

  v29 = (uint64_t *)(v4 + 756);
  v30 = *(_QWORD *)(v4 + 756);
  if ((v30 & 0x1000000) != 0)
  {
    self->_reviewUserPhotosCount = *((_DWORD *)v4 + 173);
    *(_QWORD *)&self->_flags |= 0x1000000uLL;
    v30 = *v29;
    if ((*v29 & 0x40000000) == 0)
    {
LABEL_57:
      if ((v30 & 0x80000000) == 0)
        goto LABEL_58;
      goto LABEL_73;
    }
  }
  else if ((v30 & 0x40000000) == 0)
  {
    goto LABEL_57;
  }
  self->_timeSinceMapEnteredForeground = *((_DWORD *)v4 + 179);
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  v30 = *(_QWORD *)(v4 + 756);
  if ((v30 & 0x80000000) == 0)
  {
LABEL_58:
    if ((v30 & 0x200) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_73:
  self->_timeSinceMapViewportChanged = *((_DWORD *)v4 + 180);
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x200) != 0)
  {
LABEL_59:
    self->_carHeadunitInteractionModel = *((_DWORD *)v4 + 158);
    *(_QWORD *)&self->_flags |= 0x200uLL;
  }
LABEL_60:
  if (*((_QWORD *)v4 + 42))
    -[GEOMapServiceTraits setCarHeadunitManufacturer:](self, "setCarHeadunitManufacturer:");
  if (*((_QWORD *)v4 + 43))
    -[GEOMapServiceTraits setCarHeadunitModel:](self, "setCarHeadunitModel:");
  v31 = *(_QWORD *)(v4 + 756);
  if ((v31 & 4) != 0)
  {
    self->_carHeadunitPixelWidth = *((double *)v4 + 45);
    *(_QWORD *)&self->_flags |= 4uLL;
    v31 = *(_QWORD *)(v4 + 756);
  }
  if ((v31 & 2) != 0)
  {
    self->_carHeadunitPixelHeight = *((double *)v4 + 44);
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  transitScheduleFilter = self->_transitScheduleFilter;
  v33 = *((_QWORD *)v4 + 71);
  if (transitScheduleFilter)
  {
    if (v33)
      -[GEOTraitsTransitScheduleFilter mergeFrom:](transitScheduleFilter, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEOMapServiceTraits setTransitScheduleFilter:](self, "setTransitScheduleFilter:");
  }
  v34 = *(_QWORD *)(v4 + 756);
  if ((v34 & 0x10) != 0)
  {
    self->_mapZoomLevel = *((double *)v4 + 58);
    *(_QWORD *)&self->_flags |= 0x10uLL;
    v34 = *(_QWORD *)(v4 + 756);
  }
  if ((v34 & 0x4000) != 0)
  {
    self->_mode = *((_DWORD *)v4 + 163);
    *(_QWORD *)&self->_flags |= 0x4000uLL;
  }
  if (*((_QWORD *)v4 + 52))
    -[GEOMapServiceTraits setDisplayRegion:](self, "setDisplayRegion:");
  if (*((_QWORD *)v4 + 62))
    -[GEOMapServiceTraits setProviderID:](self, "setProviderID:");
  v35 = (uint64_t *)(v4 + 756);
  v36 = *(_QWORD *)(v4 + 756);
  if ((v36 & 0x800) != 0)
  {
    self->_deviceInterfaceOrientation = *((_DWORD *)v4 + 160);
    *(_QWORD *)&self->_flags |= 0x800uLL;
    v36 = *v35;
    if ((*v35 & 0x400) == 0)
    {
LABEL_87:
      if ((v36 & 0x100) == 0)
        goto LABEL_88;
      goto LABEL_102;
    }
  }
  else if ((v36 & 0x400) == 0)
  {
    goto LABEL_87;
  }
  self->_deviceBatteryState = *((_DWORD *)v4 + 159);
  *(_QWORD *)&self->_flags |= 0x400uLL;
  v36 = *(_QWORD *)(v4 + 756);
  if ((v36 & 0x100) == 0)
  {
LABEL_88:
    if ((v36 & 0x400000000000) == 0)
      goto LABEL_90;
    goto LABEL_89;
  }
LABEL_102:
  self->_carHeadunitConnectionType = *((_DWORD *)v4 + 157);
  *(_QWORD *)&self->_flags |= 0x100uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x400000000000) != 0)
  {
LABEL_89:
    self->_navigating = v4[738];
    *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  }
LABEL_90:
  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  v37 = *((id *)v4 + 55);
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v127;
    do
    {
      for (n = 0; n != v39; ++n)
      {
        if (*(_QWORD *)v127 != v40)
          objc_enumerationMutation(v37);
        -[GEOMapServiceTraits addHistoricalLocations:](self, "addHistoricalLocations:", *(_QWORD *)(*((_QWORD *)&v126 + 1) + 8 * n));
      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v126, v143, 16);
    }
    while (v39);
  }

  automobileOptions = self->_automobileOptions;
  v43 = *((_QWORD *)v4 + 41);
  if (automobileOptions)
  {
    if (v43)
      -[GEOAutomobileOptions mergeFrom:](automobileOptions, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEOMapServiceTraits setAutomobileOptions:](self, "setAutomobileOptions:");
  }
  transitOptions = self->_transitOptions;
  v45 = *((_QWORD *)v4 + 70);
  if (transitOptions)
  {
    if (v45)
      -[GEOTransitOptions mergeFrom:](transitOptions, "mergeFrom:");
  }
  else if (v45)
  {
    -[GEOMapServiceTraits setTransitOptions:](self, "setTransitOptions:");
  }
  walkingOptions = self->_walkingOptions;
  v47 = *((_QWORD *)v4 + 75);
  if (walkingOptions)
  {
    if (v47)
      -[GEOWalkingOptions mergeFrom:](walkingOptions, "mergeFrom:");
  }
  else if (v47)
  {
    -[GEOMapServiceTraits setWalkingOptions:](self, "setWalkingOptions:");
  }
  v48 = objc_msgSend(v4, "engineTypesCount");
  if (v48)
  {
    v49 = v48;
    for (ii = 0; ii != v49; ++ii)
      -[GEOMapServiceTraits addEngineType:](self, "addEngineType:", objc_msgSend(v4, "engineTypeAtIndex:", ii));
  }
  v51 = (uint64_t *)(v4 + 756);
  v52 = *(_QWORD *)(v4 + 756);
  if ((v52 & 0x200000) != 0)
  {
    self->_requestMode = *((_DWORD *)v4 + 170);
    *(_QWORD *)&self->_flags |= 0x200000uLL;
    v52 = *v51;
    if ((*v51 & 0x80000000000000) == 0)
    {
LABEL_121:
      if ((v52 & 0x100000000000000) == 0)
        goto LABEL_123;
      goto LABEL_122;
    }
  }
  else if ((v52 & 0x80000000000000) == 0)
  {
    goto LABEL_121;
  }
  self->_supportDirectionIntentSearch = v4[747];
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x100000000000000) != 0)
  {
LABEL_122:
    self->_supportDymSuggestion = v4[748];
    *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  }
LABEL_123:
  v53 = objc_msgSend(v4, "knownClientResolvedTypesCount");
  if (v53)
  {
    v54 = v53;
    for (jj = 0; jj != v54; ++jj)
      -[GEOMapServiceTraits addKnownClientResolvedType:](self, "addKnownClientResolvedType:", objc_msgSend(v4, "knownClientResolvedTypeAtIndex:", jj));
  }
  if ((v4[763] & 0x10) != 0)
  {
    self->_wantsBrandIcon = v4[752];
    *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  }
  venueIdentifier = self->_venueIdentifier;
  v57 = (void *)*((_QWORD *)v4 + 74);
  if (venueIdentifier)
  {
    if (v57)
      -[GEOPDVenueIdentifier mergeFrom:]((uint64_t)venueIdentifier, v57);
  }
  else if (v57)
  {
    -[GEOMapServiceTraits setVenueIdentifier:](self, "setVenueIdentifier:", *((_QWORD *)v4 + 74));
  }
  v58 = (uint64_t *)(v4 + 756);
  v59 = *(_QWORD *)(v4 + 756);
  if ((v59 & 0x4000000000) != 0)
  {
    self->_deviceInVehicle = v4[730];
    *(_QWORD *)&self->_flags |= 0x4000000000uLL;
    v59 = *v58;
    if ((*v58 & 0x400000) == 0)
    {
LABEL_138:
      if ((v59 & 0x2000) == 0)
        goto LABEL_140;
      goto LABEL_139;
    }
  }
  else if ((v59 & 0x400000) == 0)
  {
    goto LABEL_138;
  }
  self->_requestPriority = *((_DWORD *)v4 + 171);
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x2000) != 0)
  {
LABEL_139:
    self->_httpRequestPriority = *((_DWORD *)v4 + 162);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
  }
LABEL_140:
  if (*((_QWORD *)v4 + 36))
    -[GEOMapServiceTraits setAnalyticsAppIdentifier:](self, "setAnalyticsAppIdentifier:");
  v60 = (uint64_t *)(v4 + 756);
  v61 = *(_QWORD *)(v4 + 756);
  if ((v61 & 0x20) != 0)
  {
    self->_sessionRelativeTimestamp = *((double *)v4 + 68);
    *(_QWORD *)&self->_flags |= 0x20uLL;
    v61 = *v60;
    if ((*v60 & 0x40000000000000) == 0)
    {
LABEL_144:
      if ((v61 & 0x400000000000000) == 0)
        goto LABEL_145;
      goto LABEL_163;
    }
  }
  else if ((v61 & 0x40000000000000) == 0)
  {
    goto LABEL_144;
  }
  self->_supportDirectionIntentAutocomplete = v4[746];
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  v61 = *(_QWORD *)(v4 + 756);
  if ((v61 & 0x400000000000000) == 0)
  {
LABEL_145:
    if ((v61 & 0x2000000000) == 0)
      goto LABEL_146;
    goto LABEL_164;
  }
LABEL_163:
  self->_supportUnresolvedDirectionIntent = v4[750];
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  v61 = *(_QWORD *)(v4 + 756);
  if ((v61 & 0x2000000000) == 0)
  {
LABEL_146:
    if ((v61 & 0x200000000) == 0)
      goto LABEL_147;
    goto LABEL_165;
  }
LABEL_164:
  self->_deviceDarkMode = v4[729];
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  v61 = *(_QWORD *)(v4 + 756);
  if ((v61 & 0x200000000) == 0)
  {
LABEL_147:
    if ((v61 & 0x800000000000000) == 0)
      goto LABEL_148;
    goto LABEL_166;
  }
LABEL_165:
  self->_appDarkMode = v4[725];
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  v61 = *(_QWORD *)(v4 + 756);
  if ((v61 & 0x800000000000000) == 0)
  {
LABEL_148:
    if ((v61 & 0x800000) == 0)
      goto LABEL_150;
    goto LABEL_149;
  }
LABEL_166:
  self->_supportsBrandFallback = v4[751];
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x800000) != 0)
  {
LABEL_149:
    self->_requestPurpose = *((_DWORD *)v4 + 172);
    *(_QWORD *)&self->_flags |= 0x800000uLL;
  }
LABEL_150:
  v62 = objc_msgSend(v4, "supportedAutocompleteListTypesCount");
  if (v62)
  {
    v63 = v62;
    for (kk = 0; kk != v63; ++kk)
      -[GEOMapServiceTraits addSupportedAutocompleteListType:](self, "addSupportedAutocompleteListType:", objc_msgSend(v4, "supportedAutocompleteListTypeAtIndex:", kk));
  }
  if ((v4[761] & 4) != 0)
  {
    self->_isSettlement = v4[734];
    *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  }
  transitTripStopTimeFilter = self->_transitTripStopTimeFilter;
  v66 = *((_QWORD *)v4 + 72);
  if (transitTripStopTimeFilter)
  {
    if (v66)
      -[GEOTraitsTransitScheduleFilter mergeFrom:](transitTripStopTimeFilter, "mergeFrom:");
  }
  else if (v66)
  {
    -[GEOMapServiceTraits setTransitTripStopTimeFilter:](self, "setTransitTripStopTimeFilter:");
  }
  if ((v4[762] & 0x20) != 0)
  {
    self->_supportClientRankingFeatureMetadata = v4[745];
    *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  }
  v67 = objc_msgSend(v4, "supportedChildActionsCount");
  if (v67)
  {
    v68 = v67;
    for (mm = 0; mm != v68; ++mm)
      -[GEOMapServiceTraits addSupportedChildAction:](self, "addSupportedChildAction:", objc_msgSend(v4, "supportedChildActionAtIndex:", mm));
  }
  v70 = (uint64_t *)(v4 + 756);
  v71 = *(_QWORD *)(v4 + 756);
  if ((v71 & 0x8000000000000) != 0)
  {
    self->_supportChildItems = v4[743];
    *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
    v71 = *v70;
    if ((*v70 & 0x10000000000) == 0)
    {
LABEL_177:
      if ((v71 & 0x800000000) == 0)
        goto LABEL_179;
      goto LABEL_178;
    }
  }
  else if ((v71 & 0x10000000000) == 0)
  {
    goto LABEL_177;
  }
  self->_isRefund = v4[732];
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x800000000) != 0)
  {
LABEL_178:
    self->_autocompleteRequestSupportsSectionHeader = v4[727];
    *(_QWORD *)&self->_flags |= 0x800000000uLL;
  }
LABEL_179:
  v72 = objc_msgSend(v4, "supportedAutocompleteResultCellTypesCount");
  if (v72)
  {
    v73 = v72;
    for (nn = 0; nn != v73; ++nn)
      -[GEOMapServiceTraits addSupportedAutocompleteResultCellType:](self, "addSupportedAutocompleteResultCellType:", objc_msgSend(v4, "supportedAutocompleteResultCellTypeAtIndex:", nn));
  }
  if (v4[757] < 0)
  {
    self->_navigationTransportType = *((_DWORD *)v4 + 164);
    *(_QWORD *)&self->_flags |= 0x8000uLL;
  }
  cyclingOptions = self->_cyclingOptions;
  v76 = *((_QWORD *)v4 + 47);
  if (cyclingOptions)
  {
    if (v76)
      -[GEOCyclingOptions mergeFrom:](cyclingOptions, "mergeFrom:");
  }
  else if (v76)
  {
    -[GEOMapServiceTraits setCyclingOptions:](self, "setCyclingOptions:");
  }
  if ((v4[758] & 8) != 0)
  {
    self->_ratingsCount = *((_DWORD *)v4 + 168);
    *(_QWORD *)&self->_flags |= 0x80000uLL;
  }
  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  v77 = *((id *)v4 + 53);
  v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
  if (v78)
  {
    v79 = v78;
    v80 = *(_QWORD *)v123;
    do
    {
      for (i1 = 0; i1 != v79; ++i1)
      {
        if (*(_QWORD *)v123 != v80)
          objc_enumerationMutation(v77);
        -[GEOMapServiceTraits addEvChargingPort:](self, "addEvChargingPort:", *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i1), (_QWORD)v122);
      }
      v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v122, v142, 16);
    }
    while (v79);
  }

  if ((v4[761] & 8) != 0)
  {
    self->_isWidgetRequest = v4[735];
    *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  }
  v82 = objc_msgSend(v4, "supportedSearchTierTypesCount", (_QWORD)v122);
  if (v82)
  {
    v83 = v82;
    for (i2 = 0; i2 != v83; ++i2)
      -[GEOMapServiceTraits addSupportedSearchTierType:](self, "addSupportedSearchTierType:", objc_msgSend(v4, "supportedSearchTierTypeAtIndex:", i2));
  }
  v85 = (uint64_t *)(v4 + 756);
  v86 = *(_QWORD *)(v4 + 756);
  if ((v86 & 0x80) != 0)
  {
    self->_auxiliaryTierNumResults = *((_DWORD *)v4 + 156);
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v86 = *v85;
    if ((*v85 & 0x40000) == 0)
    {
LABEL_208:
      if ((v86 & 8) == 0)
        goto LABEL_210;
      goto LABEL_209;
    }
  }
  else if ((v86 & 0x40000) == 0)
  {
    goto LABEL_208;
  }
  self->_placeSummaryRevision = *((_DWORD *)v4 + 167);
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  if ((*(_QWORD *)(v4 + 756) & 8) != 0)
  {
LABEL_209:
    self->_isTourist = *((double *)v4 + 56);
    *(_QWORD *)&self->_flags |= 8uLL;
  }
LABEL_210:
  v87 = objc_msgSend(v4, "knownRefinementTypesCount");
  if (v87)
  {
    v88 = v87;
    for (i3 = 0; i3 != v88; ++i3)
      -[GEOMapServiceTraits addKnownRefinementType:](self, "addKnownRefinementType:", objc_msgSend(v4, "knownRefinementTypeAtIndex:", i3));
  }
  v90 = *(_QWORD *)(v4 + 756);
  if ((v90 & 0x4000000000000) != 0)
  {
    self->_supportAutocompletePublisherResults = v4[742];
    *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
    v90 = *(_QWORD *)(v4 + 756);
  }
  if ((v90 & 0x2000000000000) != 0)
  {
    self->_supportAutocompleteGuideResults = v4[741];
    *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  }
  previousSearchViewport = self->_previousSearchViewport;
  v92 = *((_QWORD *)v4 + 60);
  if (previousSearchViewport)
  {
    if (v92)
      -[GEOPDViewportInfo mergeFrom:](previousSearchViewport, "mergeFrom:");
  }
  else if (v92)
  {
    -[GEOMapServiceTraits setPreviousSearchViewport:](self, "setPreviousSearchViewport:");
  }
  if ((v4[758] & 1) != 0)
  {
    self->_photoAlbumCount = *((_DWORD *)v4 + 165);
    *(_QWORD *)&self->_flags |= 0x10000uLL;
  }
  resultRefinementQuery = self->_resultRefinementQuery;
  v94 = *((_QWORD *)v4 + 64);
  if (resultRefinementQuery)
  {
    if (v94)
      -[GEOPDResultRefinementQuery mergeFrom:](resultRefinementQuery, "mergeFrom:");
  }
  else if (v94)
  {
    -[GEOMapServiceTraits setResultRefinementQuery:](self, "setResultRefinementQuery:");
  }
  v95 = *(_QWORD *)(v4 + 756);
  if ((v95 & 0x100000) != 0)
  {
    self->_relatedPlaceItemCount = *((_DWORD *)v4 + 169);
    *(_QWORD *)&self->_flags |= 0x100000uLL;
    v95 = *(_QWORD *)(v4 + 756);
  }
  if ((v95 & 0x4000000) != 0)
  {
    self->_searchRequestType = *((_DWORD *)v4 + 175);
    *(_QWORD *)&self->_flags |= 0x4000000uLL;
  }
  if (*((_QWORD *)v4 + 46))
    -[GEOMapServiceTraits setCurrentLocaleCurrencySymbol:](self, "setCurrentLocaleCurrencySymbol:");
  v96 = objc_msgSend(v4, "supportedPlaceSummaryFormatTypesCount");
  if (v96)
  {
    v97 = v96;
    for (i4 = 0; i4 != v97; ++i4)
      -[GEOMapServiceTraits addSupportedPlaceSummaryFormatType:](self, "addSupportedPlaceSummaryFormatType:", objc_msgSend(v4, "supportedPlaceSummaryFormatTypeAtIndex:", i4));
  }
  if ((v4[756] & 0x40) != 0)
  {
    self->_autocompleteOriginationType = *((_DWORD *)v4 + 155);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
  autocompleteOriginationPreviousLatlng = self->_autocompleteOriginationPreviousLatlng;
  v100 = *((_QWORD *)v4 + 40);
  if (autocompleteOriginationPreviousLatlng)
  {
    if (v100)
      -[GEOLatLng mergeFrom:](autocompleteOriginationPreviousLatlng, "mergeFrom:");
  }
  else if (v100)
  {
    -[GEOMapServiceTraits setAutocompleteOriginationPreviousLatlng:](self, "setAutocompleteOriginationPreviousLatlng:");
  }
  if ((v4[759] & 8) != 0)
  {
    self->_searchOriginationType = *((_DWORD *)v4 + 176);
    *(_QWORD *)&self->_flags |= 0x8000000uLL;
  }
  searchOriginationPreviousLatlng = self->_searchOriginationPreviousLatlng;
  v102 = *((_QWORD *)v4 + 67);
  if (searchOriginationPreviousLatlng)
  {
    if (v102)
      -[GEOLatLng mergeFrom:](searchOriginationPreviousLatlng, "mergeFrom:");
  }
  else if (v102)
  {
    -[GEOMapServiceTraits setSearchOriginationPreviousLatlng:](self, "setSearchOriginationPreviousLatlng:");
  }
  addStopRouteInfo = self->_addStopRouteInfo;
  v104 = *((_QWORD *)v4 + 35);
  if (addStopRouteInfo)
  {
    if (v104)
      -[GEOAddStopRouteInfo mergeFrom:](addStopRouteInfo, "mergeFrom:");
  }
  else if (v104)
  {
    -[GEOMapServiceTraits setAddStopRouteInfo:](self, "setAddStopRouteInfo:");
  }
  v105 = (uint64_t *)(v4 + 756);
  v106 = *(_QWORD *)(v4 + 756);
  if ((v106 & 0x400000000) != 0)
  {
    self->_autocompleteOriginationEditingServerWaypoints = v4[726];
    *(_QWORD *)&self->_flags |= 0x400000000uLL;
    v106 = *v105;
    if ((*v105 & 0x1000000000000) == 0)
    {
LABEL_262:
      if ((v106 & 0x10000000000000) == 0)
        goto LABEL_264;
      goto LABEL_263;
    }
  }
  else if ((v106 & 0x1000000000000) == 0)
  {
    goto LABEL_262;
  }
  self->_searchOriginationEditingServerWaypoints = v4[740];
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x10000000000000) != 0)
  {
LABEL_263:
    self->_supportClientRankingCompositeFeatures = v4[744];
    *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  }
LABEL_264:
  privacyMetadata = self->_privacyMetadata;
  v108 = *((_QWORD *)v4 + 61);
  if (privacyMetadata)
  {
    if (v108)
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
  }
  else if (v108)
  {
    -[GEOMapServiceTraits setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  v109 = (uint64_t *)(v4 + 756);
  v110 = *(_QWORD *)(v4 + 756);
  if ((v110 & 0x2000000) != 0)
  {
    self->_routeStopCount = *((_DWORD *)v4 + 174);
    *(_QWORD *)&self->_flags |= 0x2000000uLL;
    v110 = *v109;
    if ((*v109 & 0x200000000000000) == 0)
    {
LABEL_274:
      if ((v110 & 0x20000000000) == 0)
        goto LABEL_276;
      goto LABEL_275;
    }
  }
  else if ((v110 & 0x200000000000000) == 0)
  {
    goto LABEL_274;
  }
  self->_supportStructuredRapAffordance = v4[749];
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  if ((*(_QWORD *)(v4 + 756) & 0x20000000000) != 0)
  {
LABEL_275:
    self->_isRoutePlanningEditStopFillRequest = v4[733];
    *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  }
LABEL_276:
  v111 = objc_msgSend(v4, "preferredBrandsCount");
  if (v111)
  {
    v112 = v111;
    for (i5 = 0; i5 != v112; ++i5)
      -[GEOMapServiceTraits addPreferredBrand:](self, "addPreferredBrand:", objc_msgSend(v4, "preferredBrandAtIndex:", i5));
  }
  v114 = *(_QWORD *)(v4 + 756);
  if ((v114 & 0x100000000000) != 0)
  {
    self->_isWithinHikingBoundary = v4[736];
    *(_QWORD *)&self->_flags |= 0x100000000000uLL;
    v114 = *(_QWORD *)(v4 + 756);
  }
  if ((v114 & 0x200000000000) != 0)
  {
    self->_isWithinHikingBufferRegion = v4[737];
    *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  }
  searchImplicitFilterInfo = self->_searchImplicitFilterInfo;
  v116 = *((_QWORD *)v4 + 66);
  if (searchImplicitFilterInfo)
  {
    if (v116)
      -[GEOSearchImplicitFilterInfo mergeFrom:](searchImplicitFilterInfo, "mergeFrom:");
  }
  else if (v116)
  {
    -[GEOMapServiceTraits setSearchImplicitFilterInfo:](self, "setSearchImplicitFilterInfo:");
  }
  v117 = *(_QWORD *)(v4 + 756);
  if ((v117 & 0x1000) != 0)
  {
    self->_devicePlatform = *((_DWORD *)v4 + 161);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
    v117 = *(_QWORD *)(v4 + 756);
  }
  if ((v117 & 0x1000000000) != 0)
  {
    self->_containsSensitiveData = v4[728];
    *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  }
  if (*((_QWORD *)v4 + 69))
    -[GEOMapServiceTraits setSpotlightSearchPunchinEncodedString:](self, "setSpotlightSearchPunchinEncodedString:");
  if (v4[761] < 0)
  {
    self->_optimizeSearchRequestComponents = v4[739];
    *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  }
  recentAutocompleteSessionData = self->_recentAutocompleteSessionData;
  v119 = *((_QWORD *)v4 + 63);
  if (recentAutocompleteSessionData)
  {
    if (v119)
      -[GEOPDAutocompleteSessionData mergeFrom:](recentAutocompleteSessionData, "mergeFrom:");
  }
  else if (v119)
  {
    -[GEOMapServiceTraits setRecentAutocompleteSessionData:](self, "setRecentAutocompleteSessionData:");
  }
  if ((v4[760] & 1) != 0)
  {
    self->_analyticsOptOut = v4[724];
    *(_QWORD *)&self->_flags |= 0x100000000uLL;
  }
  userActionMetadata = self->_userActionMetadata;
  v121 = *((_QWORD *)v4 + 73);
  if (userActionMetadata)
  {
    if (v121)
      -[GEOPDSSessionUserActionMetadata mergeFrom:](userActionMetadata, "mergeFrom:");
  }
  else if (v121)
  {
    -[GEOMapServiceTraits setUserActionMetadata:](self, "setUserActionMetadata:");
  }
  if ((v4[763] & 0x20) != 0)
  {
    self->_wantsRouteCreationTip = v4[753];
    *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  }
  if (*((_QWORD *)v4 + 54))
    -[GEOMapServiceTraits setHardwareIdentifier:](self, "setHardwareIdentifier:");

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*((_BYTE *)&self->_flags + 7) & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOMapServiceTraitsReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_1508);
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
  uint64_t v6;
  PBUnknownFields *unknownFields;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v3 = a3;
  v48 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v6 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  *((_QWORD *)&self->_flags + 1) = v6;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOMapServiceTraits readAll:](self, "readAll:", 0);
    -[GEOLocation clearUnknownFields:](self->_deviceLocation, "clearUnknownFields:", 1);
    -[GEOMapRegion clearUnknownFields:](self->_mapRegion, "clearUnknownFields:", 1);
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v8 = self->_photoSizes;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v41;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v12++), "clearUnknownFields:", 1);
        }
        while (v10 != v12);
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v10);
    }

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = self->_reviewUserPhotoSizes;
    v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v37;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v37 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v17++), "clearUnknownFields:", 1);
        }
        while (v15 != v17);
        v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      }
      while (v15);
    }

    -[GEOTraitsTransitScheduleFilter clearUnknownFields:](self->_transitScheduleFilter, "clearUnknownFields:", 1);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = self->_historicalLocations;
    v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v33;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v33 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v22++), "clearUnknownFields:", 1);
        }
        while (v20 != v22);
        v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      }
      while (v20);
    }

    -[GEOAutomobileOptions clearUnknownFields:](self->_automobileOptions, "clearUnknownFields:", 1);
    -[GEOTransitOptions clearUnknownFields:](self->_transitOptions, "clearUnknownFields:", 1);
    -[GEOWalkingOptions clearUnknownFields:](self->_walkingOptions, "clearUnknownFields:", 1);
    -[GEOPDVenueIdentifier clearUnknownFields:]((uint64_t)self->_venueIdentifier, 1);
    -[GEOTraitsTransitScheduleFilter clearUnknownFields:](self->_transitTripStopTimeFilter, "clearUnknownFields:", 1);
    -[GEOCyclingOptions clearUnknownFields:](self->_cyclingOptions, "clearUnknownFields:", 1);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v23 = self->_evChargingPorts;
    v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v29;
      do
      {
        v27 = 0;
        do
        {
          if (*(_QWORD *)v29 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v27++), "clearUnknownFields:", 1, (_QWORD)v28);
        }
        while (v25 != v27);
        v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v28, v44, 16);
      }
      while (v25);
    }

    -[GEOPDViewportInfo clearUnknownFields:](self->_previousSearchViewport, "clearUnknownFields:", 1);
    -[GEOPDResultRefinementQuery clearUnknownFields:](self->_resultRefinementQuery, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_autocompleteOriginationPreviousLatlng, "clearUnknownFields:", 1);
    -[GEOLatLng clearUnknownFields:](self->_searchOriginationPreviousLatlng, "clearUnknownFields:", 1);
    -[GEOAddStopRouteInfo clearUnknownFields:](self->_addStopRouteInfo, "clearUnknownFields:", 1);
    -[GEOPrivacyMetadata clearUnknownFields:](self->_privacyMetadata, "clearUnknownFields:", 1);
    -[GEOSearchImplicitFilterInfo clearUnknownFields:](self->_searchImplicitFilterInfo, "clearUnknownFields:", 1);
    -[GEOPDAutocompleteSessionData clearUnknownFields:](self->_recentAutocompleteSessionData, "clearUnknownFields:", 1);
    -[GEOPDSSessionUserActionMetadata clearUnknownFields:](self->_userActionMetadata, "clearUnknownFields:", 1);
  }
}

- (id)copyByIncrementingSessionCounters
{
  void *v2;

  v2 = (void *)-[GEOMapServiceTraits copy](self, "copy");
  objc_msgSend(v2, "_internal_incrementSessionCounters");
  return v2;
}

- (void)_internal_incrementSessionCounters
{
  void *v3;
  _QWORD v4[5];

  +[GEOUserSession sharedInstance](GEOUserSession, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__GEOMapServiceTraits_AnalyticsSessionExtra___internal_incrementSessionCounters__block_invoke;
  v4[3] = &unk_1E1C04548;
  v4[4] = self;
  objc_msgSend(v3, "shortSessionValues:", v4);

}

void __80__GEOMapServiceTraits_AnalyticsSessionExtra___internal_incrementSessionCounters__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, double a8, double a9, double a10)
{
  GEOPrivacyMetadata *v16;
  void *v17;
  id v18;

  objc_msgSend(*(id *)(a1 + 32), "setSessionId:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "setSessionRelativeTimestamp:", a10);
  objc_msgSend(*(id *)(a1 + 32), "setSequenceNumber:", a4);
  if (a7)
  {
    v16 = objc_alloc_init(GEOPrivacyMetadata);
    objc_msgSend(*(id *)(a1 + 32), "setPrivacyMetadata:", v16);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIsUnderageAccount:", a5);

    objc_msgSend(*(id *)(a1 + 32), "privacyMetadata");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setIsManagedAccount:", a6);

  }
}

- (void)clearSessionId
{
  if (-[GEOMapServiceTraits hasSessionId](self, "hasSessionId"))
  {
    -[GEOMapServiceTraits setSessionId:](self, "setSessionId:", 0, 0);
    -[GEOMapServiceTraits setHasSessionId:](self, "setHasSessionId:", 0);
  }
}

- (void)clearLocations
{
  -[GEOMapServiceTraits setDeviceLocation:](self, "setDeviceLocation:", 0);
  -[GEOMapServiceTraits setHistoricalLocations:](self, "setHistoricalLocations:", 0);
  -[GEOMapServiceTraits clearKnownClientResolvedTypes](self, "clearKnownClientResolvedTypes");
  -[GEOMapServiceTraits addKnownClientResolvedType:](self, "addKnownClientResolvedType:", 0);
}

@end
