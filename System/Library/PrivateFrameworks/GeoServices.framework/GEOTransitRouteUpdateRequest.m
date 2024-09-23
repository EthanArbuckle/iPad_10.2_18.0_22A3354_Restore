@implementation GEOTransitRouteUpdateRequest

- (GEOTransitRouteUpdateRequest)init
{
  GEOTransitRouteUpdateRequest *v2;
  GEOTransitRouteUpdateRequest *v3;
  GEOTransitRouteUpdateRequest *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOTransitRouteUpdateRequest;
  v2 = -[GEOTransitRouteUpdateRequest init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOTransitRouteUpdateRequest)initWithData:(id)a3
{
  GEOTransitRouteUpdateRequest *v3;
  GEOTransitRouteUpdateRequest *v4;
  GEOTransitRouteUpdateRequest *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateRequest;
  v3 = -[GEOTransitRouteUpdateRequest initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readRouteIdentifiers
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRouteIdentifiers_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)routeIdentifiers
{
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  return self->_routeIdentifiers;
}

- (void)setRouteIdentifiers:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *routeIdentifiers;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  routeIdentifiers = self->_routeIdentifiers;
  self->_routeIdentifiers = v4;

}

- (void)clearRouteIdentifiers
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_routeIdentifiers, "removeAllObjects");
}

- (void)addRouteIdentifier:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  -[GEOTransitRouteUpdateRequest _addNoFlagsRouteIdentifier:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsRouteIdentifier:(uint64_t)a1
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

- (unint64_t)routeIdentifiersCount
{
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  return -[NSMutableArray count](self->_routeIdentifiers, "count");
}

- (id)routeIdentifierAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateRequest _readRouteIdentifiers]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_routeIdentifiers, "objectAtIndex:", a3);
}

+ (Class)routeIdentifierType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalClientCapabilities
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalClientCapabilities_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasOriginalClientCapabilities
{
  -[GEOTransitRouteUpdateRequest _readOriginalClientCapabilities]((uint64_t)self);
  return self->_originalClientCapabilities != 0;
}

- (GEOClientCapabilities)originalClientCapabilities
{
  -[GEOTransitRouteUpdateRequest _readOriginalClientCapabilities]((uint64_t)self);
  return self->_originalClientCapabilities;
}

- (void)setOriginalClientCapabilities:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2040u;
  objc_storeStrong((id *)&self->_originalClientCapabilities, a3);
}

- (void)_readAbClientMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAbClientMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasAbClientMetadata
{
  -[GEOTransitRouteUpdateRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata != 0;
}

- (GEOPDABClientDatasetMetadata)abClientMetadata
{
  -[GEOTransitRouteUpdateRequest _readAbClientMetadata]((uint64_t)self);
  return self->_abClientMetadata;
}

- (void)setAbClientMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2008u;
  objc_storeStrong((id *)&self->_abClientMetadata, a3);
}

- (void)_readOriginalWaypoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalWaypoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)originalWaypoints
{
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  return self->_originalWaypoints;
}

- (void)setOriginalWaypoints:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *originalWaypoints;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  originalWaypoints = self->_originalWaypoints;
  self->_originalWaypoints = v4;

}

- (void)clearOriginalWaypoints
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_originalWaypoints, "removeAllObjects");
}

- (void)addOriginalWaypoint:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  -[GEOTransitRouteUpdateRequest _addNoFlagsOriginalWaypoint:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x100u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
}

- (void)_addNoFlagsOriginalWaypoint:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)originalWaypointsCount
{
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  return -[NSMutableArray count](self->_originalWaypoints, "count");
}

- (id)originalWaypointAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_originalWaypoints, "objectAtIndex:", a3);
}

+ (Class)originalWaypointType
{
  return (Class)objc_opt_class();
}

- (void)_readOriginalRouteAttributes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalRouteAttributes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasOriginalRouteAttributes
{
  -[GEOTransitRouteUpdateRequest _readOriginalRouteAttributes]((uint64_t)self);
  return self->_originalRouteAttributes != 0;
}

- (GEORouteAttributes)originalRouteAttributes
{
  -[GEOTransitRouteUpdateRequest _readOriginalRouteAttributes]((uint64_t)self);
  return self->_originalRouteAttributes;
}

- (void)setOriginalRouteAttributes:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2080u;
  objc_storeStrong((id *)&self->_originalRouteAttributes, a3);
}

- (void)_readOriginalAdditionalEnabledMarkets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalAdditionalEnabledMarkets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasOriginalAdditionalEnabledMarkets
{
  -[GEOTransitRouteUpdateRequest _readOriginalAdditionalEnabledMarkets]((uint64_t)self);
  return self->_originalAdditionalEnabledMarkets != 0;
}

- (GEOAdditionalEnabledMarkets)originalAdditionalEnabledMarkets
{
  -[GEOTransitRouteUpdateRequest _readOriginalAdditionalEnabledMarkets]((uint64_t)self);
  return self->_originalAdditionalEnabledMarkets;
}

- (void)setOriginalAdditionalEnabledMarkets:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2020u;
  objc_storeStrong((id *)&self->_originalAdditionalEnabledMarkets, a3);
}

- (void)_readDirectionsResponseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsResponseId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasDirectionsResponseId
{
  -[GEOTransitRouteUpdateRequest _readDirectionsResponseId]((uint64_t)self);
  return self->_directionsResponseId != 0;
}

- (NSData)directionsResponseId
{
  -[GEOTransitRouteUpdateRequest _readDirectionsResponseId]((uint64_t)self);
  return self->_directionsResponseId;
}

- (void)setDirectionsResponseId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2010u;
  objc_storeStrong((id *)&self->_directionsResponseId, a3);
}

- (void)_readRequestingAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRequestingAppId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasRequestingAppId
{
  -[GEOTransitRouteUpdateRequest _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId != 0;
}

- (NSString)requestingAppId
{
  -[GEOTransitRouteUpdateRequest _readRequestingAppId]((uint64_t)self);
  return self->_requestingAppId;
}

- (void)setRequestingAppId:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2400u;
  objc_storeStrong((id *)&self->_requestingAppId, a3);
}

- (void)_readPrivacyMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrivacyMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (BOOL)hasPrivacyMetadata
{
  -[GEOTransitRouteUpdateRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata != 0;
}

- (GEOPrivacyMetadata)privacyMetadata
{
  -[GEOTransitRouteUpdateRequest _readPrivacyMetadata]((uint64_t)self);
  return self->_privacyMetadata;
}

- (void)setPrivacyMetadata:(id)a3
{
  *(_WORD *)&self->_flags |= 0x2200u;
  objc_storeStrong((id *)&self->_privacyMetadata, a3);
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

- (void)setSessionId:(GEOSessionID)a3
{
  *(_WORD *)&self->_flags |= 0x2001u;
  self->_sessionId = a3;
}

- (void)setHasSessionId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x2000;
}

- (BOOL)hasSessionId
{
  return *(_WORD *)&self->_flags & 1;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (void)setSessionRelativeTimestamp:(double)a3
{
  *(_WORD *)&self->_flags |= 0x2002u;
  self->_sessionRelativeTimestamp = a3;
}

- (void)setHasSessionRelativeTimestamp:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8194;
  else
    v3 = 0x2000;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasSessionRelativeTimestamp
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (void)_readServiceTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_WORD *)(a1 + 140) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOTransitRouteUpdateRequestReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServiceTags_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (NSMutableArray)serviceTags
{
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  return self->_serviceTags;
}

- (void)setServiceTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *serviceTags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  serviceTags = self->_serviceTags;
  self->_serviceTags = v4;

}

- (void)clearServiceTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
  -[NSMutableArray removeAllObjects](self->_serviceTags, "removeAllObjects");
}

- (void)addServiceTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  -[GEOTransitRouteUpdateRequest _addNoFlagsServiceTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x2000u;
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

- (unint64_t)serviceTagsCount
{
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  return -[NSMutableArray count](self->_serviceTags, "count");
}

- (id)serviceTagAtIndex:(unint64_t)a3
{
  -[GEOTransitRouteUpdateRequest _readServiceTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_serviceTags, "objectAtIndex:", a3);
}

+ (Class)serviceTagType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOTransitRouteUpdateRequest;
  -[GEOTransitRouteUpdateRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOTransitRouteUpdateRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOTransitRouteUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  __int16 v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  _QWORD v69[4];
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 104), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 104), "count"));
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v6 = *(id *)(a1 + 104);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v80 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("routeIdentifier");
    else
      v13 = CFSTR("route_identifier");
    objc_msgSend(v4, "setObject:forKey:", v5, v13);

  }
  objc_msgSend((id)a1, "originalClientCapabilities");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v14, "jsonRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("originalClientCapabilities");
    }
    else
    {
      objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = CFSTR("original_client_capabilities");
    }
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  objc_msgSend((id)a1, "abClientMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("abClientMetadata");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("ab_client_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  if (objc_msgSend(*(id *)(a1 + 80), "count"))
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 80), "count"));
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v23 = *(id *)(a1 + 80);
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v76 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObject:", v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("originalWaypoint");
    else
      v30 = CFSTR("original_waypoint");
    objc_msgSend(v4, "setObject:forKey:", v22, v30);

  }
  objc_msgSend((id)a1, "originalRouteAttributes");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v31, "jsonRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("originalRouteAttributes");
    }
    else
    {
      objc_msgSend(v31, "dictionaryRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = CFSTR("original_route_attributes");
    }
    objc_msgSend(v4, "setObject:forKey:", v33, v34);

  }
  objc_msgSend((id)a1, "originalAdditionalEnabledMarkets");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v35, "jsonRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("originalAdditionalEnabledMarkets");
    }
    else
    {
      objc_msgSend(v35, "dictionaryRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = CFSTR("original_additional_enabled_markets");
    }
    objc_msgSend(v4, "setObject:forKey:", v37, v38);

  }
  objc_msgSend((id)a1, "directionsResponseId");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v39)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v39, "base64EncodedStringWithOptions:", 0);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v41, CFSTR("directionsResponseId"));

    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v39, CFSTR("directions_response_id"));
    }
  }

  objc_msgSend((id)a1, "requestingAppId");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (v42)
  {
    if (a2)
      v43 = CFSTR("requestingAppId");
    else
      v43 = CFSTR("requesting_app_id");
    objc_msgSend(v4, "setObject:forKey:", v42, v43);
  }

  objc_msgSend((id)a1, "privacyMetadata");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v44, "jsonRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("privacyMetadata");
    }
    else
    {
      objc_msgSend(v44, "dictionaryRepresentation");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = CFSTR("privacy_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

  }
  v48 = *(_WORD *)(a1 + 140);
  if ((v48 & 1) != 0)
  {
    _GEOSessionIDDictionaryRepresentation((_QWORD *)(a1 + 24));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v50 = CFSTR("sessionId");
    else
      v50 = CFSTR("session_id");
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

    v48 = *(_WORD *)(a1 + 140);
  }
  if ((v48 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 120));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v52 = CFSTR("sessionRelativeTimestamp");
    else
      v52 = CFSTR("session_relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

  }
  if (objc_msgSend(*(id *)(a1 + 112), "count"))
  {
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 112), "count"));
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v54 = *(id *)(a1 + 112);
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v72;
      do
      {
        for (k = 0; k != v56; ++k)
        {
          if (*(_QWORD *)v72 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v59, "jsonRepresentation");
          else
            objc_msgSend(v59, "dictionaryRepresentation");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v60);

        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
      }
      while (v56);
    }

    if (a2)
      v61 = CFSTR("serviceTag");
    else
      v61 = CFSTR("service_tag");
    objc_msgSend(v4, "setObject:forKey:", v53, v61);

  }
  v62 = *(void **)(a1 + 16);
  if (v62)
  {
    objc_msgSend(v62, "dictionaryRepresentation");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v63;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v63, "count"));
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __58__GEOTransitRouteUpdateRequest__dictionaryRepresentation___block_invoke;
      v69[3] = &unk_1E1C00600;
      v66 = v65;
      v70 = v66;
      objc_msgSend(v64, "enumerateKeysAndObjectsUsingBlock:", v69);
      v67 = v66;

      v64 = v67;
    }
    objc_msgSend(v4, "setObject:forKey:", v64, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOTransitRouteUpdateRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __58__GEOTransitRouteUpdateRequest__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOTransitRouteUpdateRequest)initWithDictionary:(id)a3
{
  return (GEOTransitRouteUpdateRequest *)-[GEOTransitRouteUpdateRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GEOTransitRouteIdentifier *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  GEOClientCapabilities *v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  GEOPDABClientDatasetMetadata *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  uint64_t v34;
  GEOWaypointTyped *v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  GEORouteAttributes *v40;
  uint64_t v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  GEOAdditionalEnabledMarkets *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  GEOPrivacyMetadata *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  const __CFString *v63;
  void *v64;
  id v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t k;
  uint64_t v70;
  GEOGeoServiceTag *v71;
  uint64_t v72;
  void *v73;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("routeIdentifier");
      else
        v6 = CFSTR("route_identifier");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v75 = v5;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v88 = 0u;
        v89 = 0u;
        v86 = 0u;
        v87 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v87;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v87 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v14 = [GEOTransitRouteIdentifier alloc];
                if ((a3 & 1) != 0)
                  v15 = -[GEOTransitRouteIdentifier initWithJSON:](v14, "initWithJSON:", v13);
                else
                  v15 = -[GEOTransitRouteIdentifier initWithDictionary:](v14, "initWithDictionary:", v13);
                v16 = (void *)v15;
                objc_msgSend(a1, "addRouteIdentifier:", v15);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v86, v92, 16);
          }
          while (v10);
        }

        v5 = v75;
      }

      if (a3)
        v17 = CFSTR("originalClientCapabilities");
      else
        v17 = CFSTR("original_client_capabilities");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = [GEOClientCapabilities alloc];
        if ((a3 & 1) != 0)
          v20 = -[GEOClientCapabilities initWithJSON:](v19, "initWithJSON:", v18);
        else
          v20 = -[GEOClientCapabilities initWithDictionary:](v19, "initWithDictionary:", v18);
        v21 = (void *)v20;
        objc_msgSend(a1, "setOriginalClientCapabilities:", v20);

      }
      if (a3)
        v22 = CFSTR("abClientMetadata");
      else
        v22 = CFSTR("ab_client_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v24 = [GEOPDABClientDatasetMetadata alloc];
        if ((a3 & 1) != 0)
          v25 = -[GEOPDABClientDatasetMetadata initWithJSON:](v24, "initWithJSON:", v23);
        else
          v25 = -[GEOPDABClientDatasetMetadata initWithDictionary:](v24, "initWithDictionary:", v23);
        v26 = (void *)v25;
        objc_msgSend(a1, "setAbClientMetadata:", v25);

      }
      if (a3)
        v27 = CFSTR("originalWaypoint");
      else
        v27 = CFSTR("original_waypoint");
      objc_msgSend(v5, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v29 = v28;
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v83 != v32)
                objc_enumerationMutation(v29);
              v34 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = [GEOWaypointTyped alloc];
                if ((a3 & 1) != 0)
                  v36 = -[GEOWaypointTyped initWithJSON:](v35, "initWithJSON:", v34);
                else
                  v36 = -[GEOWaypointTyped initWithDictionary:](v35, "initWithDictionary:", v34);
                v37 = (void *)v36;
                objc_msgSend(a1, "addOriginalWaypoint:", v36);

              }
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v82, v91, 16);
          }
          while (v31);
        }

        v5 = v75;
      }

      if (a3)
        v38 = CFSTR("originalRouteAttributes");
      else
        v38 = CFSTR("original_route_attributes");
      objc_msgSend(v5, "objectForKeyedSubscript:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40 = [GEORouteAttributes alloc];
        if ((a3 & 1) != 0)
          v41 = -[GEORouteAttributes initWithJSON:](v40, "initWithJSON:", v39);
        else
          v41 = -[GEORouteAttributes initWithDictionary:](v40, "initWithDictionary:", v39);
        v42 = (void *)v41;
        objc_msgSend(a1, "setOriginalRouteAttributes:", v41);

      }
      if (a3)
        v43 = CFSTR("originalAdditionalEnabledMarkets");
      else
        v43 = CFSTR("original_additional_enabled_markets");
      objc_msgSend(v5, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = [GEOAdditionalEnabledMarkets alloc];
        if ((a3 & 1) != 0)
          v46 = -[GEOAdditionalEnabledMarkets initWithJSON:](v45, "initWithJSON:", v44);
        else
          v46 = -[GEOAdditionalEnabledMarkets initWithDictionary:](v45, "initWithDictionary:", v44);
        v47 = (void *)v46;
        objc_msgSend(a1, "setOriginalAdditionalEnabledMarkets:", v46);

      }
      if (a3)
        v48 = CFSTR("directionsResponseId");
      else
        v48 = CFSTR("directions_response_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v49, 0);
        objc_msgSend(a1, "setDirectionsResponseId:", v50);

      }
      if (a3)
        v51 = CFSTR("requestingAppId");
      else
        v51 = CFSTR("requesting_app_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = (void *)objc_msgSend(v52, "copy");
        objc_msgSend(a1, "setRequestingAppId:", v53);

      }
      if (a3)
        v54 = CFSTR("privacyMetadata");
      else
        v54 = CFSTR("privacy_metadata");
      objc_msgSend(v5, "objectForKeyedSubscript:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v56 = [GEOPrivacyMetadata alloc];
        if ((a3 & 1) != 0)
          v57 = -[GEOPrivacyMetadata initWithJSON:](v56, "initWithJSON:", v55);
        else
          v57 = -[GEOPrivacyMetadata initWithDictionary:](v56, "initWithDictionary:", v55);
        v58 = (void *)v57;
        objc_msgSend(a1, "setPrivacyMetadata:", v57);

      }
      if (a3)
        v59 = CFSTR("sessionId");
      else
        v59 = CFSTR("session_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v80 = 0;
        v81 = 0;
        _GEOSessionIDFromDictionaryRepresentation(v60, &v80);
        objc_msgSend(a1, "setSessionId:", v80, v81);
      }

      if (a3)
        v61 = CFSTR("sessionRelativeTimestamp");
      else
        v61 = CFSTR("session_relative_timestamp");
      objc_msgSend(v5, "objectForKeyedSubscript:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v62, "doubleValue");
        objc_msgSend(a1, "setSessionRelativeTimestamp:");
      }

      if (a3)
        v63 = CFSTR("serviceTag");
      else
        v63 = CFSTR("service_tag");
      objc_msgSend(v5, "objectForKeyedSubscript:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v65 = v64;
        v66 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
        if (v66)
        {
          v67 = v66;
          v68 = *(_QWORD *)v77;
          do
          {
            for (k = 0; k != v67; ++k)
            {
              if (*(_QWORD *)v77 != v68)
                objc_enumerationMutation(v65);
              v70 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v71 = [GEOGeoServiceTag alloc];
                if ((a3 & 1) != 0)
                  v72 = -[GEOGeoServiceTag initWithJSON:](v71, "initWithJSON:", v70);
                else
                  v72 = -[GEOGeoServiceTag initWithDictionary:](v71, "initWithDictionary:", v70);
                v73 = (void *)v72;
                objc_msgSend(a1, "addServiceTag:", v72);

              }
            }
            v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v76, v90, 16);
          }
          while (v67);
        }

        v5 = v75;
      }

    }
  }

  return a1;
}

- (GEOTransitRouteUpdateRequest)initWithJSON:(id)a3
{
  return (GEOTransitRouteUpdateRequest *)-[GEOTransitRouteUpdateRequest _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_249;
    else
      v8 = (int *)&readAll__nonRecursiveTag_250;
    GEOTransitRouteUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOTransitRouteUpdateRequestCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOTransitRouteUpdateRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOTransitRouteUpdateRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  __int16 flags;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  PBDataReader *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
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
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOTransitRouteUpdateRequestIsDirty((uint64_t)self) & 1) == 0)
  {
    v19 = self->_reader;
    objc_sync_enter(v19);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v20);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v19);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOTransitRouteUpdateRequest readAll:](self, "readAll:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = self->_routeIdentifiers;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v7);
    }

    if (self->_originalClientCapabilities)
      PBDataWriterWriteSubmessage();
    if (self->_abClientMetadata)
      PBDataWriterWriteSubmessage();
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = self->_originalWaypoints;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v11);
    }

    if (self->_originalRouteAttributes)
      PBDataWriterWriteSubmessage();
    if (self->_originalAdditionalEnabledMarkets)
      PBDataWriterWriteSubmessage();
    if (self->_directionsResponseId)
      PBDataWriterWriteDataField();
    if (self->_requestingAppId)
      PBDataWriterWriteStringField();
    if (self->_privacyMetadata)
      PBDataWriterWriteSubmessage();
    flags = (__int16)self->_flags;
    if ((flags & 1) != 0)
    {
      v25 = 0;
      PBDataWriterPlaceMark();
      PBDataWriterWriteUint64Field();
      PBDataWriterWriteUint64Field();
      PBDataWriterRecallMark();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
      PBDataWriterWriteDoubleField();
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = self->_serviceTags;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v22;
      do
      {
        for (k = 0; k != v16; ++k)
        {
          if (*(_QWORD *)v22 != v17)
            objc_enumerationMutation(v15);
          PBDataWriterWriteSubmessage();
        }
        v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v34, 16);
      }
      while (v16);
    }

    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v21);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOTransitRouteUpdateRequestClearSensitiveFields((uint64_t)self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  -[GEOTransitRouteUpdateRequest _readOriginalWaypoints]((uint64_t)self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_originalWaypoints;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 1026;
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
  id *v12;
  __int16 flags;
  unint64_t v14;
  unint64_t v15;
  uint64_t k;
  void *v17;
  id *v18;

  v18 = (id *)a3;
  -[GEOTransitRouteUpdateRequest readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v18 + 1, self->_reader);
  *((_DWORD *)v18 + 32) = self->_readerMarkPos;
  *((_DWORD *)v18 + 33) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (-[GEOTransitRouteUpdateRequest routeIdentifiersCount](self, "routeIdentifiersCount"))
  {
    objc_msgSend(v18, "clearRouteIdentifiers");
    v4 = -[GEOTransitRouteUpdateRequest routeIdentifiersCount](self, "routeIdentifiersCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOTransitRouteUpdateRequest routeIdentifierAtIndex:](self, "routeIdentifierAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addRouteIdentifier:", v7);

      }
    }
  }
  if (self->_originalClientCapabilities)
    objc_msgSend(v18, "setOriginalClientCapabilities:");
  if (self->_abClientMetadata)
    objc_msgSend(v18, "setAbClientMetadata:");
  if (-[GEOTransitRouteUpdateRequest originalWaypointsCount](self, "originalWaypointsCount"))
  {
    objc_msgSend(v18, "clearOriginalWaypoints");
    v8 = -[GEOTransitRouteUpdateRequest originalWaypointsCount](self, "originalWaypointsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
      {
        -[GEOTransitRouteUpdateRequest originalWaypointAtIndex:](self, "originalWaypointAtIndex:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addOriginalWaypoint:", v11);

      }
    }
  }
  if (self->_originalRouteAttributes)
    objc_msgSend(v18, "setOriginalRouteAttributes:");
  v12 = v18;
  if (self->_originalAdditionalEnabledMarkets)
  {
    objc_msgSend(v18, "setOriginalAdditionalEnabledMarkets:");
    v12 = v18;
  }
  if (self->_directionsResponseId)
  {
    objc_msgSend(v18, "setDirectionsResponseId:");
    v12 = v18;
  }
  if (self->_requestingAppId)
  {
    objc_msgSend(v18, "setRequestingAppId:");
    v12 = v18;
  }
  if (self->_privacyMetadata)
  {
    objc_msgSend(v18, "setPrivacyMetadata:");
    v12 = v18;
  }
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v12 + 3) = self->_sessionId;
    *((_WORD *)v12 + 70) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    v12[15] = *(id *)&self->_sessionRelativeTimestamp;
    *((_WORD *)v12 + 70) |= 2u;
  }
  if (-[GEOTransitRouteUpdateRequest serviceTagsCount](self, "serviceTagsCount"))
  {
    objc_msgSend(v18, "clearServiceTags");
    v14 = -[GEOTransitRouteUpdateRequest serviceTagsCount](self, "serviceTagsCount");
    if (v14)
    {
      v15 = v14;
      for (k = 0; k != v15; ++k)
      {
        -[GEOTransitRouteUpdateRequest serviceTagAtIndex:](self, "serviceTagAtIndex:", k);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addServiceTag:", v17);

      }
    }
  }

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
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  __int16 flags;
  NSMutableArray *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  PBUnknownFields *v39;
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
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
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
      GEOTransitRouteUpdateRequestReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_31;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOTransitRouteUpdateRequest readAll:](self, "readAll:", 0);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v9 = self->_routeIdentifiers;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v50 != v11)
          objc_enumerationMutation(v9);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addRouteIdentifier:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v10);
  }

  v14 = -[GEOClientCapabilities copyWithZone:](self->_originalClientCapabilities, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v14;

  v16 = -[GEOPDABClientDatasetMetadata copyWithZone:](self->_abClientMetadata, "copyWithZone:", a3);
  v17 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v16;

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v18 = self->_originalWaypoints;
  v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v46 != v20)
          objc_enumerationMutation(v18);
        v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addOriginalWaypoint:", v22);

      }
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    }
    while (v19);
  }

  v23 = -[GEORouteAttributes copyWithZone:](self->_originalRouteAttributes, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v23;

  v25 = -[GEOAdditionalEnabledMarkets copyWithZone:](self->_originalAdditionalEnabledMarkets, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v25;

  v27 = -[NSData copyWithZone:](self->_directionsResponseId, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v27;

  v29 = -[NSString copyWithZone:](self->_requestingAppId, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v29;

  v31 = -[GEOPrivacyMetadata copyWithZone:](self->_privacyMetadata, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v31;

  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    *(GEOSessionID *)(v5 + 24) = self->_sessionId;
    *(_WORD *)(v5 + 140) |= 1u;
    flags = (__int16)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(double *)(v5 + 120) = self->_sessionRelativeTimestamp;
    *(_WORD *)(v5 + 140) |= 2u;
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v34 = self->_serviceTags;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v42;
    do
    {
      for (k = 0; k != v35; ++k)
      {
        if (*(_QWORD *)v42 != v36)
          objc_enumerationMutation(v34);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v41);
        objc_msgSend((id)v5, "addServiceTag:", v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v34, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
    }
    while (v35);
  }

  v39 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v39;
LABEL_31:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *routeIdentifiers;
  GEOClientCapabilities *originalClientCapabilities;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  NSMutableArray *originalWaypoints;
  GEORouteAttributes *originalRouteAttributes;
  GEOAdditionalEnabledMarkets *originalAdditionalEnabledMarkets;
  NSData *directionsResponseId;
  NSString *requestingAppId;
  GEOPrivacyMetadata *privacyMetadata;
  __int16 flags;
  __int16 v15;
  NSMutableArray *serviceTags;
  char v18;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  -[GEOTransitRouteUpdateRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  routeIdentifiers = self->_routeIdentifiers;
  if ((unint64_t)routeIdentifiers | *((_QWORD *)v4 + 13))
  {
    if (!-[NSMutableArray isEqual:](routeIdentifiers, "isEqual:"))
      goto LABEL_36;
  }
  originalClientCapabilities = self->_originalClientCapabilities;
  if ((unint64_t)originalClientCapabilities | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOClientCapabilities isEqual:](originalClientCapabilities, "isEqual:"))
      goto LABEL_36;
  }
  abClientMetadata = self->_abClientMetadata;
  if ((unint64_t)abClientMetadata | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDABClientDatasetMetadata isEqual:](abClientMetadata, "isEqual:"))
      goto LABEL_36;
  }
  originalWaypoints = self->_originalWaypoints;
  if ((unint64_t)originalWaypoints | *((_QWORD *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](originalWaypoints, "isEqual:"))
      goto LABEL_36;
  }
  originalRouteAttributes = self->_originalRouteAttributes;
  if ((unint64_t)originalRouteAttributes | *((_QWORD *)v4 + 9))
  {
    if (!-[GEORouteAttributes isEqual:](originalRouteAttributes, "isEqual:"))
      goto LABEL_36;
  }
  originalAdditionalEnabledMarkets = self->_originalAdditionalEnabledMarkets;
  if ((unint64_t)originalAdditionalEnabledMarkets | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOAdditionalEnabledMarkets isEqual:](originalAdditionalEnabledMarkets, "isEqual:"))
      goto LABEL_36;
  }
  directionsResponseId = self->_directionsResponseId;
  if ((unint64_t)directionsResponseId | *((_QWORD *)v4 + 6))
  {
    if (!-[NSData isEqual:](directionsResponseId, "isEqual:"))
      goto LABEL_36;
  }
  requestingAppId = self->_requestingAppId;
  if ((unint64_t)requestingAppId | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](requestingAppId, "isEqual:"))
      goto LABEL_36;
  }
  privacyMetadata = self->_privacyMetadata;
  if ((unint64_t)privacyMetadata | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPrivacyMetadata isEqual:](privacyMetadata, "isEqual:"))
      goto LABEL_36;
  }
  flags = (__int16)self->_flags;
  v15 = *((_WORD *)v4 + 70);
  if ((flags & 1) != 0)
  {
    if ((v15 & 1) == 0)
      goto LABEL_36;
    if (self->_sessionId._high != *((_QWORD *)v4 + 3) || self->_sessionId._low != *((_QWORD *)v4 + 4))
      goto LABEL_36;
  }
  else if ((v15 & 1) != 0)
  {
LABEL_36:
    v18 = 0;
    goto LABEL_37;
  }
  if ((flags & 2) != 0)
  {
    if ((v15 & 2) == 0 || self->_sessionRelativeTimestamp != *((double *)v4 + 15))
      goto LABEL_36;
  }
  else if ((v15 & 2) != 0)
  {
    goto LABEL_36;
  }
  serviceTags = self->_serviceTags;
  if ((unint64_t)serviceTags | *((_QWORD *)v4 + 14))
    v18 = -[NSMutableArray isEqual:](serviceTags, "isEqual:");
  else
    v18 = 1;
LABEL_37:

  return v18;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  __int16 flags;
  uint64_t v11;
  double sessionRelativeTimestamp;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v18;
  uint64_t v19;

  -[GEOTransitRouteUpdateRequest readAll:](self, "readAll:", 1);
  v19 = -[NSMutableArray hash](self->_routeIdentifiers, "hash");
  v18 = -[GEOClientCapabilities hash](self->_originalClientCapabilities, "hash");
  v3 = -[GEOPDABClientDatasetMetadata hash](self->_abClientMetadata, "hash");
  v4 = -[NSMutableArray hash](self->_originalWaypoints, "hash");
  v5 = -[GEORouteAttributes hash](self->_originalRouteAttributes, "hash");
  v6 = -[GEOAdditionalEnabledMarkets hash](self->_originalAdditionalEnabledMarkets, "hash");
  v7 = -[NSData hash](self->_directionsResponseId, "hash");
  v8 = -[NSString hash](self->_requestingAppId, "hash");
  v9 = -[GEOPrivacyMetadata hash](self->_privacyMetadata, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
  {
    v11 = PBHashBytes();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_8:
    v16 = 0;
    return v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ -[NSMutableArray hash](self->_serviceTags, "hash");
  }
  v11 = 0;
  if ((flags & 2) == 0)
    goto LABEL_8;
LABEL_3:
  sessionRelativeTimestamp = self->_sessionRelativeTimestamp;
  v13 = -sessionRelativeTimestamp;
  if (sessionRelativeTimestamp >= 0.0)
    v13 = self->_sessionRelativeTimestamp;
  v14 = floor(v13 + 0.5);
  v15 = (v13 - v14) * 1.84467441e19;
  v16 = 2654435761u * (unint64_t)fmod(v14, 1.84467441e19);
  if (v15 >= 0.0)
  {
    if (v15 > 0.0)
      v16 += (unint64_t)v15;
  }
  else
  {
    v16 -= (unint64_t)fabs(v15);
  }
  return v18 ^ v19 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v11 ^ v16 ^ -[NSMutableArray hash](self->_serviceTags, "hash");
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  GEOClientCapabilities *originalClientCapabilities;
  uint64_t v11;
  GEOPDABClientDatasetMetadata *abClientMetadata;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  GEORouteAttributes *originalRouteAttributes;
  uint64_t v20;
  GEOAdditionalEnabledMarkets *originalAdditionalEnabledMarkets;
  uint64_t v22;
  GEOPrivacyMetadata *privacyMetadata;
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
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
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = *((id *)v4 + 13);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        -[GEOTransitRouteUpdateRequest addRouteIdentifier:](self, "addRouteIdentifier:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v7);
  }

  originalClientCapabilities = self->_originalClientCapabilities;
  v11 = *((_QWORD *)v4 + 8);
  if (originalClientCapabilities)
  {
    if (v11)
      -[GEOClientCapabilities mergeFrom:](originalClientCapabilities, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEOTransitRouteUpdateRequest setOriginalClientCapabilities:](self, "setOriginalClientCapabilities:");
  }
  abClientMetadata = self->_abClientMetadata;
  v13 = *((_QWORD *)v4 + 5);
  if (abClientMetadata)
  {
    if (v13)
      -[GEOPDABClientDatasetMetadata mergeFrom:](abClientMetadata, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEOTransitRouteUpdateRequest setAbClientMetadata:](self, "setAbClientMetadata:");
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = *((id *)v4 + 10);
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        -[GEOTransitRouteUpdateRequest addOriginalWaypoint:](self, "addOriginalWaypoint:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j));
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v16);
  }

  originalRouteAttributes = self->_originalRouteAttributes;
  v20 = *((_QWORD *)v4 + 9);
  if (originalRouteAttributes)
  {
    if (v20)
      -[GEORouteAttributes mergeFrom:](originalRouteAttributes, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEOTransitRouteUpdateRequest setOriginalRouteAttributes:](self, "setOriginalRouteAttributes:");
  }
  originalAdditionalEnabledMarkets = self->_originalAdditionalEnabledMarkets;
  v22 = *((_QWORD *)v4 + 7);
  if (originalAdditionalEnabledMarkets)
  {
    if (v22)
      -[GEOAdditionalEnabledMarkets mergeFrom:](originalAdditionalEnabledMarkets, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEOTransitRouteUpdateRequest setOriginalAdditionalEnabledMarkets:](self, "setOriginalAdditionalEnabledMarkets:");
  }
  if (*((_QWORD *)v4 + 6))
    -[GEOTransitRouteUpdateRequest setDirectionsResponseId:](self, "setDirectionsResponseId:");
  if (*((_QWORD *)v4 + 12))
    -[GEOTransitRouteUpdateRequest setRequestingAppId:](self, "setRequestingAppId:");
  privacyMetadata = self->_privacyMetadata;
  v24 = *((_QWORD *)v4 + 11);
  if (privacyMetadata)
  {
    if (v24)
      -[GEOPrivacyMetadata mergeFrom:](privacyMetadata, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEOTransitRouteUpdateRequest setPrivacyMetadata:](self, "setPrivacyMetadata:");
  }
  v25 = *((_WORD *)v4 + 70);
  if ((v25 & 1) != 0)
  {
    self->_sessionId = *(GEOSessionID *)(v4 + 24);
    *(_WORD *)&self->_flags |= 1u;
    v25 = *((_WORD *)v4 + 70);
  }
  if ((v25 & 2) != 0)
  {
    self->_sessionRelativeTimestamp = *((double *)v4 + 15);
    *(_WORD *)&self->_flags |= 2u;
  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = *((id *)v4 + 14);
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        -[GEOTransitRouteUpdateRequest addServiceTag:](self, "addServiceTag:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k), (_QWORD)v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v28);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 4) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOTransitRouteUpdateRequestReadSpecified((uint64_t)self, (uint64_t)self->_reader, (int *)&unknownFields_tags_254);
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
  __int128 v22;
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
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v3 = a3;
  v37 = *MEMORY[0x1E0C80C00];
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x2004u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOTransitRouteUpdateRequest readAll:](self, "readAll:", 0);
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v7 = self->_routeIdentifiers;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11++), "clearUnknownFields:", 1);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    -[GEOClientCapabilities clearUnknownFields:](self->_originalClientCapabilities, "clearUnknownFields:", 1);
    -[GEOPDABClientDatasetMetadata clearUnknownFields:](self->_abClientMetadata, "clearUnknownFields:", 1);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v12 = self->_originalWaypoints;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v27;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v16++), "clearUnknownFields:", 1);
        }
        while (v14 != v16);
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
      }
      while (v14);
    }

    -[GEORouteAttributes clearUnknownFields:](self->_originalRouteAttributes, "clearUnknownFields:", 1);
    -[GEOAdditionalEnabledMarkets clearUnknownFields:](self->_originalAdditionalEnabledMarkets, "clearUnknownFields:", 1);
    -[GEOPrivacyMetadata clearUnknownFields:](self->_privacyMetadata, "clearUnknownFields:", 1);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = self->_serviceTags;
    v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v21++), "clearUnknownFields:", 1, (_QWORD)v22);
        }
        while (v19 != v21);
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v19);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceTags, 0);
  objc_storeStrong((id *)&self->_routeIdentifiers, 0);
  objc_storeStrong((id *)&self->_requestingAppId, 0);
  objc_storeStrong((id *)&self->_privacyMetadata, 0);
  objc_storeStrong((id *)&self->_originalWaypoints, 0);
  objc_storeStrong((id *)&self->_originalRouteAttributes, 0);
  objc_storeStrong((id *)&self->_originalClientCapabilities, 0);
  objc_storeStrong((id *)&self->_originalAdditionalEnabledMarkets, 0);
  objc_storeStrong((id *)&self->_directionsResponseId, 0);
  objc_storeStrong((id *)&self->_abClientMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

+ (id)transitRouteUpdateRequestWithDirectionsRequest:(id)a3 directionsResponse:(id)a4
{
  return (id)objc_msgSend(a1, "transitRouteUpdateRequestWithDirectionsRequest:directionsResponse:composedRoutes:", a3, a4, 0);
}

+ (id)transitRouteUpdateRequestWithDirectionsRequest:(id)a3 directionsResponse:(id)a4 composedRoutes:(id)a5
{
  id v7;
  id v8;
  id v9;
  GEOTransitRouteUpdateRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    v10 = objc_alloc_init(GEOTransitRouteUpdateRequest);
    objc_msgSend(v7, "clientCapabilities");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequest setOriginalClientCapabilities:](v10, "setOriginalClientCapabilities:", v11);

    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_mapsAbClientMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientDatasetMetadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequest setAbClientMetadata:](v10, "setAbClientMetadata:", v14);

    objc_msgSend(v7, "waypointTypeds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequest setOriginalWaypoints:](v10, "setOriginalWaypoints:", v15);

    objc_msgSend(v7, "additionalEnabledMarkets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequest setOriginalAdditionalEnabledMarkets:](v10, "setOriginalAdditionalEnabledMarkets:", v16);

    objc_msgSend(v8, "directionsResponseID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOTransitRouteUpdateRequest setDirectionsResponseId:](v10, "setDirectionsResponseId:", v17);

    objc_msgSend(v7, "routeAttributes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");

    v35 = 0uLL;
    v36 = 0;
    objc_msgSend(v8, "timepointUsed");
    BYTE4(v36) &= ~1u;
    v33 = v35;
    v34 = v36;
    objc_msgSend(v19, "setTimepoint:", &v33);
    -[GEOTransitRouteUpdateRequest setOriginalRouteAttributes:](v10, "setOriginalRouteAttributes:", v19);
    if (objc_msgSend(v9, "count"))
    {
      v28 = v19;
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v21 = v9;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v30 != v24)
              objc_enumerationMutation(v21);
            +[GEOTransitRouteIdentifier routeIdentiferForComposedRoute:](GEOTransitRouteIdentifier, "routeIdentiferForComposedRoute:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v28);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "addObject:", v26);

          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v23);
      }

      -[GEOTransitRouteUpdateRequest setRouteIdentifiers:](v10, "setRouteIdentifiers:", v20);
      v19 = v28;
    }

  }
  return v10;
}

+ (id)mergedTransitRouteUpdateRequests:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, objc_msgSend(v3, "count"));
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = (void *)MEMORY[0x18D764E2C]();
        v11 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v11, "clearRouteIdentifiers");
        objc_msgSend(v4, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = (void *)objc_msgSend(v11, "copy");
          objc_msgSend(v4, "setObject:forKey:", v12, v11);
        }
        v13 = (void *)MEMORY[0x1E0C99E20];
        objc_msgSend(v12, "routeIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setWithArray:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v9, "routeIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setWithArray:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "unionSet:", v18);

        v19 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v15, "allObjects");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithArray:", v20);
        objc_msgSend(v12, "setRouteIdentifiers:", v21);

        objc_autoreleasePoolPop(v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "objectEnumerator");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "allObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

+ (id)splitTransitRouteUpdateRequests:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v18;
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
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x18D764E2C]();
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "routeIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v21;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
              v14 = (void *)objc_msgSend(v6, "copy");
              objc_msgSend(v14, "clearRouteIdentifiers");
              objc_msgSend(v14, "addRouteIdentifier:", v13);
              objc_msgSend(v4, "addObject:", v14);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v5 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (NSUUID)clientRouteID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[GEOTransitRouteUpdateRequest routeIdentifiersCount](self, "routeIdentifiersCount"))
  {
    -[GEOTransitRouteUpdateRequest routeIdentifiers](self, "routeIdentifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRouteHandle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3A28], "_maps_UUIDWithData:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (NSUUID *)v6;
}

- (NSArray)allClientRouteIDs
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!-[GEOTransitRouteUpdateRequest routeIdentifiersCount](self, "routeIdentifiersCount"))
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[GEOTransitRouteUpdateRequest routeIdentifiersCount](self, "routeIdentifiersCount"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[GEOTransitRouteUpdateRequest routeIdentifiers](self, "routeIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "clientRouteID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v10;
}

@end
