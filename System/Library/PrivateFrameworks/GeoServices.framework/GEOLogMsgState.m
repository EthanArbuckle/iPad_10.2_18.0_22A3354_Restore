@implementation GEOLogMsgState

- (GEOLogMsgState)init
{
  GEOLogMsgState *v2;
  GEOLogMsgState *v3;
  GEOLogMsgState *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgState;
  v2 = -[GEOLogMsgState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (void)setStateType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000001uLL;
  self->_stateType = a3;
}

- (void)setPlaceRequest:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400020000000000uLL;
  objc_storeStrong((id *)&self->_placeRequest, a3);
}

- (GEOLogMsgStatePlaceRequest)placeRequest
{
  -[GEOLogMsgState _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest;
}

- (void)_readPlaceRequest
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceRequest_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_userSession, 0);
  objc_storeStrong((id *)&self->_ugcPhoto, 0);
  objc_storeStrong((id *)&self->_transit, 0);
  objc_storeStrong((id *)&self->_transitStep, 0);
  objc_storeStrong((id *)&self->_tileSet, 0);
  objc_storeStrong((id *)&self->_tapEvent, 0);
  objc_storeStrong((id *)&self->_summaryLookAroundLog, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_stateOrigin, 0);
  objc_storeStrong((id *)&self->_searchResults, 0);
  objc_storeStrong((id *)&self->_routingSettings, 0);
  objc_storeStrong((id *)&self->_routingWaypoints, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_rap, 0);
  objc_storeStrong((id *)&self->_placeSummaryLayout, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
  objc_storeStrong((id *)&self->_placeCard, 0);
  objc_storeStrong((id *)&self->_placeCardRap, 0);
  objc_storeStrong((id *)&self->_pairedDevice, 0);
  objc_storeStrong((id *)&self->_offline, 0);
  objc_storeStrong((id *)&self->_offlineDownload, 0);
  objc_storeStrong((id *)&self->_nearbyTransit, 0);
  objc_storeStrong((id *)&self->_navigation, 0);
  objc_storeStrong((id *)&self->_muninResource, 0);
  objc_storeStrong((id *)&self->_market, 0);
  objc_storeStrong((id *)&self->_mapsUserSettings, 0);
  objc_storeStrong((id *)&self->_mapsServer, 0);
  objc_storeStrong((id *)&self->_mapsPlaceIds, 0);
  objc_storeStrong((id *)&self->_mapsFeatures, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_storeStrong((id *)&self->_mapViewLocation, 0);
  objc_storeStrong((id *)&self->_mapUi, 0);
  objc_storeStrong((id *)&self->_mapUiShown, 0);
  objc_storeStrong((id *)&self->_mapSettings, 0);
  objc_storeStrong((id *)&self->_mapRestore, 0);
  objc_storeStrong((id *)&self->_mapLaunch, 0);
  objc_storeStrong((id *)&self->_lookAroundView, 0);
  objc_storeStrong((id *)&self->_impressionObject, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_experiments, 0);
  objc_storeStrong((id *)&self->_elementImpression, 0);
  objc_storeStrong((id *)&self->_directionsDetail, 0);
  objc_storeStrong((id *)&self->_deviceSettings, 0);
  objc_storeStrong((id *)&self->_deviceLocale, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceConnection, 0);
  objc_storeStrong((id *)&self->_deviceBase, 0);
  objc_storeStrong((id *)&self->_detailLookAroundLog, 0);
  objc_storeStrong((id *)&self->_curatedCollection, 0);
  objc_storeStrong((id *)&self->_carPlay, 0);
  objc_storeStrong((id *)&self->_arpRatingSubmission, 0);
  objc_storeStrong((id *)&self->_arpRatingPhotoSubmission, 0);
  objc_storeStrong((id *)&self->_arpPhotoSubmission, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_actionButtonDetails, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *v5;
  void *v6;
  id v7;

  v7 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOLogMsgStateIsDirty((uint64_t)self) & 1) == 0)
  {
    v5 = self->_reader;
    objc_sync_enter(v5);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "writeData:", v6);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v5);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOLogMsgState readAll:](self, "readAll:", 0);
    if (self->_stateOrigin)
      PBDataWriterWriteStringField();
    if (self->_user)
      PBDataWriterWriteSubmessage();
    if (self->_account)
      PBDataWriterWriteSubmessage();
    if (self->_rap)
      PBDataWriterWriteSubmessage();
    if (self->_placeSummaryLayout)
      PBDataWriterWriteSubmessage();
    if (self->_transitStep)
      PBDataWriterWriteSubmessage();
    if (self->_nearbyTransit)
      PBDataWriterWriteSubmessage();
    if (self->_searchResults)
      PBDataWriterWriteSubmessage();
    if (self->_elementImpression)
      PBDataWriterWriteSubmessage();
    if (self->_impressionObject)
      PBDataWriterWriteSubmessage();
    if (self->_tapEvent)
      PBDataWriterWriteSubmessage();
    if (self->_actionButtonDetails)
      PBDataWriterWriteSubmessage();
    if (self->_routingWaypoints)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_deviceIdentifier)
      PBDataWriterWriteSubmessage();
    if (self->_applicationIdentifier)
      PBDataWriterWriteSubmessage();
    if (self->_deviceBase)
      PBDataWriterWriteSubmessage();
    if (self->_deviceLocale)
      PBDataWriterWriteSubmessage();
    if (self->_deviceConnection)
      PBDataWriterWriteSubmessage();
    if (self->_carPlay)
      PBDataWriterWriteSubmessage();
    if (self->_pairedDevice)
      PBDataWriterWriteSubmessage();
    if (self->_extension)
      PBDataWriterWriteSubmessage();
    if (self->_deviceSettings)
      PBDataWriterWriteSubmessage();
    if (self->_mapView)
      PBDataWriterWriteSubmessage();
    if (self->_mapViewLocation)
      PBDataWriterWriteSubmessage();
    if (self->_transit)
      PBDataWriterWriteSubmessage();
    if (self->_mapSettings)
      PBDataWriterWriteSubmessage();
    if (self->_mapUi)
      PBDataWriterWriteSubmessage();
    if (self->_mapUiShown)
      PBDataWriterWriteSubmessage();
    if (self->_userSession)
      PBDataWriterWriteSubmessage();
    if (self->_experiments)
      PBDataWriterWriteSubmessage();
    if (self->_placeCard)
      PBDataWriterWriteSubmessage();
    if (self->_route)
      PBDataWriterWriteSubmessage();
    if (self->_mapsServer)
      PBDataWriterWriteSubmessage();
    if (self->_tileSet)
      PBDataWriterWriteSubmessage();
    if (self->_placeRequest)
      PBDataWriterWriteSubmessage();
    if (self->_navigation)
      PBDataWriterWriteSubmessage();
    if (self->_mapRestore)
      PBDataWriterWriteSubmessage();
    if (self->_suggestions)
      PBDataWriterWriteSubmessage();
    if (self->_offline)
      PBDataWriterWriteSubmessage();
    if (self->_summaryLookAroundLog)
      PBDataWriterWriteSubmessage();
    if (self->_detailLookAroundLog)
      PBDataWriterWriteSubmessage();
    if (self->_lookAroundView)
      PBDataWriterWriteSubmessage();
    if (self->_muninResource)
      PBDataWriterWriteSubmessage();
    if (self->_mapLaunch)
      PBDataWriterWriteSubmessage();
    if (self->_curatedCollection)
      PBDataWriterWriteSubmessage();
    if (self->_ugcPhoto)
      PBDataWriterWriteSubmessage();
    if (self->_directionsDetail)
      PBDataWriterWriteSubmessage();
    if (self->_market)
      PBDataWriterWriteSubmessage();
    if (self->_routingSettings)
      PBDataWriterWriteSubmessage();
    if (self->_mapsFeatures)
      PBDataWriterWriteSubmessage();
    if (self->_mapsUserSettings)
      PBDataWriterWriteSubmessage();
    if (self->_arpPhotoSubmission)
      PBDataWriterWriteSubmessage();
    if (self->_arpRatingSubmission)
      PBDataWriterWriteSubmessage();
    if (self->_arpRatingPhotoSubmission)
      PBDataWriterWriteSubmessage();
    if (self->_mapsPlaceIds)
      PBDataWriterWriteSubmessage();
    if (self->_placeCardRap)
      PBDataWriterWriteSubmessage();
    if (self->_offlineDownload)
      PBDataWriterWriteSubmessage();
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
      v8 = (int *)&readAll__recursiveTag_4997;
    else
      v8 = (int *)&readAll__nonRecursiveTag_4998;
    GEOLogMsgStateReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOLogMsgStateCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

- (GEOLogMsgState)initWithData:(id)a3
{
  GEOLogMsgState *v3;
  GEOLogMsgState *v4;
  GEOLogMsgState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgState;
  v3 = -[GEOLogMsgState initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readStateOrigin
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStateOrigin_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasStateOrigin
{
  -[GEOLogMsgState _readStateOrigin]((uint64_t)self);
  return self->_stateOrigin != 0;
}

- (NSString)stateOrigin
{
  -[GEOLogMsgState _readStateOrigin]((uint64_t)self);
  return self->_stateOrigin;
}

- (void)setStateOrigin:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x401000000000000uLL;
  objc_storeStrong((id *)&self->_stateOrigin, a3);
}

- (void)_readUser
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 495) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUser_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasUser
{
  -[GEOLogMsgState _readUser]((uint64_t)self);
  return self->_user != 0;
}

- (GEOLogMsgStateUser)user
{
  -[GEOLogMsgState _readUser]((uint64_t)self);
  return self->_user;
}

- (void)setUser:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x600000000000000uLL;
  objc_storeStrong((id *)&self->_user, a3);
}

- (void)_readAccount
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAccount_tags_4765);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasAccount
{
  -[GEOLogMsgState _readAccount]((uint64_t)self);
  return self->_account != 0;
}

- (GEOLogMsgStateAccount)account
{
  -[GEOLogMsgState _readAccount]((uint64_t)self);
  return self->_account;
}

- (void)setAccount:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000002uLL;
  objc_storeStrong((id *)&self->_account, a3);
}

- (void)_readRap
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRap_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRap
{
  -[GEOLogMsgState _readRap]((uint64_t)self);
  return self->_rap != 0;
}

- (GEOLogMsgStateRAP)rap
{
  -[GEOLogMsgState _readRap]((uint64_t)self);
  return self->_rap;
}

- (void)setRap:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400080000000000uLL;
  objc_storeStrong((id *)&self->_rap, a3);
}

- (void)_readPlaceSummaryLayout
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceSummaryLayout_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceSummaryLayout
{
  -[GEOLogMsgState _readPlaceSummaryLayout]((uint64_t)self);
  return self->_placeSummaryLayout != 0;
}

- (GEOLogMsgStatePlaceSummaryLayout)placeSummaryLayout
{
  -[GEOLogMsgState _readPlaceSummaryLayout]((uint64_t)self);
  return self->_placeSummaryLayout;
}

- (void)setPlaceSummaryLayout:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400040000000000uLL;
  objc_storeStrong((id *)&self->_placeSummaryLayout, a3);
}

- (void)_readTransitStep
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitStep_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTransitStep
{
  -[GEOLogMsgState _readTransitStep]((uint64_t)self);
  return self->_transitStep != 0;
}

- (GEOLogMsgStateTransitStep)transitStep
{
  -[GEOLogMsgState _readTransitStep]((uint64_t)self);
  return self->_transitStep;
}

- (void)setTransitStep:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x420000000000000uLL;
  objc_storeStrong((id *)&self->_transitStep, a3);
}

- (void)_readNearbyTransit
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearbyTransit_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasNearbyTransit
{
  -[GEOLogMsgState _readNearbyTransit]((uint64_t)self);
  return self->_nearbyTransit != 0;
}

- (GEOLogMsgStateNearbyTransit)nearbyTransit
{
  -[GEOLogMsgState _readNearbyTransit]((uint64_t)self);
  return self->_nearbyTransit;
}

- (void)setNearbyTransit:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000800000000uLL;
  objc_storeStrong((id *)&self->_nearbyTransit, a3);
}

- (void)_readSearchResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSearchResults
{
  -[GEOLogMsgState _readSearchResults]((uint64_t)self);
  return self->_searchResults != 0;
}

- (GEOLogMsgStateSearchResults)searchResults
{
  -[GEOLogMsgState _readSearchResults]((uint64_t)self);
  return self->_searchResults;
}

- (void)setSearchResults:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400800000000000uLL;
  objc_storeStrong((id *)&self->_searchResults, a3);
}

- (void)_readElementImpression
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readElementImpression_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasElementImpression
{
  -[GEOLogMsgState _readElementImpression]((uint64_t)self);
  return self->_elementImpression != 0;
}

- (GEOLogMsgStateElementImpression)elementImpression
{
  -[GEOLogMsgState _readElementImpression]((uint64_t)self);
  return self->_elementImpression;
}

- (void)setElementImpression:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000010000uLL;
  objc_storeStrong((id *)&self->_elementImpression, a3);
}

- (void)_readImpressionObject
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readImpressionObject_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasImpressionObject
{
  -[GEOLogMsgState _readImpressionObject]((uint64_t)self);
  return self->_impressionObject != 0;
}

- (GEOLogMsgStateImpressionObject)impressionObject
{
  -[GEOLogMsgState _readImpressionObject]((uint64_t)self);
  return self->_impressionObject;
}

- (void)setImpressionObject:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000080000uLL;
  objc_storeStrong((id *)&self->_impressionObject, a3);
}

- (void)_readTapEvent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTapEvent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTapEvent
{
  -[GEOLogMsgState _readTapEvent]((uint64_t)self);
  return self->_tapEvent != 0;
}

- (GEOLogMsgStateTapEvent)tapEvent
{
  -[GEOLogMsgState _readTapEvent]((uint64_t)self);
  return self->_tapEvent;
}

- (void)setTapEvent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x408000000000000uLL;
  objc_storeStrong((id *)&self->_tapEvent, a3);
}

- (void)_readActionButtonDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionButtonDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasActionButtonDetails
{
  -[GEOLogMsgState _readActionButtonDetails]((uint64_t)self);
  return self->_actionButtonDetails != 0;
}

- (GEOLogMsgStateActionButtonDetails)actionButtonDetails
{
  -[GEOLogMsgState _readActionButtonDetails]((uint64_t)self);
  return self->_actionButtonDetails;
}

- (void)setActionButtonDetails:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000004uLL;
  objc_storeStrong((id *)&self->_actionButtonDetails, a3);
}

- (void)_readRoutingWaypoints
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutingWaypoints_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRoutingWaypoints
{
  -[GEOLogMsgState _readRoutingWaypoints]((uint64_t)self);
  return self->_routingWaypoints != 0;
}

- (GEOLogMsgStateRoutingWaypoints)routingWaypoints
{
  -[GEOLogMsgState _readRoutingWaypoints]((uint64_t)self);
  return self->_routingWaypoints;
}

- (void)setRoutingWaypoints:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400200000000000uLL;
  objc_storeStrong((id *)&self->_routingWaypoints, a3);
}

- (int)stateType
{
  os_unfair_lock_s *p_readerLock;
  $4616208CC255E1CA823F391899A05A96 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 1) != 0)
    return self->_stateType;
  else
    return 0;
}

- (void)setHasStateType:(BOOL)a3
{
  self->_flags = ($4616208CC255E1CA823F391899A05A96)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x400000000000000);
}

- (BOOL)hasStateType
{
  return *(_DWORD *)&self->_flags & 1;
}

- (id)stateTypeAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 600)
  {
    switch(a3)
    {
      case 702:
        result = CFSTR("PLACE_CARD");
        break;
      case 703:
        result = CFSTR("ROUTE");
        break;
      case 704:
        result = CFSTR("FLYOVER");
        break;
      case 705:
        result = CFSTR("MAPS_SERVER");
        break;
      case 706:
        result = CFSTR("TILE_SET");
        break;
      case 707:
        result = CFSTR("PLACE_REQUEST");
        break;
      case 708:
        result = CFSTR("NAVIGATION");
        break;
      case 709:
        result = CFSTR("MAP_RESTORE");
        break;
      case 710:
        result = CFSTR("SUGGESTIONS");
        break;
      case 711:
        result = CFSTR("REPORT_AN_ISSUE");
        break;
      case 712:
        result = CFSTR("REALTIME_TRAFFIC");
        break;
      case 713:
        result = CFSTR("OFFLINE");
        break;
      case 714:
        result = CFSTR("SUMMARY_LOOK_AROUND_LOG");
        break;
      case 715:
        result = CFSTR("DETAIL_LOOK_AROUND_LOG");
        break;
      case 716:
        result = CFSTR("LOOK_AROUND_VIEW");
        break;
      case 717:
        result = CFSTR("MUNIN_RESOURCE_LOG");
        break;
      case 718:
        result = CFSTR("MAPS_LAUNCH");
        break;
      case 719:
        result = CFSTR("CURATED_COLLECTION");
        break;
      case 720:
        result = CFSTR("UGC_PHOTO");
        break;
      case 721:
        result = CFSTR("DIRECTIONS_DETAIL");
        break;
      case 722:
        result = CFSTR("MARKET");
        break;
      case 723:
        result = CFSTR("ROUTING_SETTINGS");
        break;
      case 724:
        result = CFSTR("MAPS_FEATURES");
        break;
      case 725:
        result = CFSTR("MAPS_USER_SETTINGS");
        break;
      case 726:
        result = CFSTR("PHOTO_SUBMISSION");
        break;
      case 727:
        result = CFSTR("RATING_SUBMISSION");
        break;
      case 728:
        result = CFSTR("RATING_PHOTO_SUBMISSION");
        break;
      case 729:
        result = CFSTR("MAPS_PLACE_IDS");
        break;
      case 730:
        result = CFSTR("PLACE_CARD_RAP");
        break;
      case 731:
        result = CFSTR("OFFLINE_DOWNLOAD");
        break;
      default:
        if (a3 == 601)
        {
          result = CFSTR("USER_SESSION");
        }
        else if (a3 == 602)
        {
          result = CFSTR("EXPERIMENTS");
        }
        else
        {
LABEL_73:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_5:
          result = v3;
        }
        break;
    }
  }
  else if (a3 > 300)
  {
    switch(a3)
    {
      case 401:
        result = CFSTR("DEVICE_BASE");
        break;
      case 402:
        result = CFSTR("DEVICE_LOCALE");
        break;
      case 403:
        result = CFSTR("DEVICE_CONNECTION");
        break;
      case 404:
        result = CFSTR("CAR_PLAY");
        break;
      case 405:
        result = CFSTR("PAIRED_DEVICE");
        break;
      case 406:
        result = CFSTR("EXTENSION");
        break;
      case 407:
        result = CFSTR("DEVICE_SETTINGS");
        break;
      default:
        switch(a3)
        {
          case 501:
            result = CFSTR("MAP_VIEW");
            break;
          case 502:
            result = CFSTR("MAP_VIEW_LOCATION");
            break;
          case 503:
            result = CFSTR("TRANSIT");
            break;
          case 504:
            result = CFSTR("MAP_SETTINGS");
            break;
          case 505:
            result = CFSTR("MAP_UI");
            break;
          case 506:
            result = CFSTR("MAP_UI_SHOWN");
            break;
          default:
            if (a3 != 301)
              goto LABEL_73;
            result = CFSTR("APPLICATION_IDENTIFIER");
            break;
        }
        break;
    }
  }
  else
  {
    v3 = CFSTR("LOG_MSG_STATE_TYPE_UNKNOWN");
    switch(a3)
    {
      case 0:
        goto LABEL_5;
      case 1:
        goto LABEL_73;
      case 2:
        v3 = CFSTR("MAPS_USER");
        goto LABEL_5;
      case 3:
        result = CFSTR("ACCOUNT");
        break;
      case 4:
        result = CFSTR("RAP");
        break;
      case 5:
        result = CFSTR("PLACE_SUMMARY_LAYOUT");
        break;
      case 6:
        result = CFSTR("TRANSIT_STEP");
        break;
      case 7:
        result = CFSTR("NEARBY_TRANSIT");
        break;
      case 8:
        result = CFSTR("SEARCH_RESULTS");
        break;
      case 9:
        result = CFSTR("ELEMENT_IMPRESSION");
        break;
      case 10:
        result = CFSTR("IMPRESSION_OBJECT");
        break;
      case 11:
        result = CFSTR("TAP_EVENT");
        break;
      case 12:
        result = CFSTR("ACTION_BUTTON_DETAILS");
        break;
      case 13:
        result = CFSTR("ROUTING_WAYPOINTS");
        break;
      default:
        if (a3 != 201)
          goto LABEL_73;
        result = CFSTR("DEVICE_IDENTIFIER");
        break;
    }
  }
  return result;
}

- (int)StringAsStateType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOG_MSG_STATE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_USER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_STEP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEARBY_TRANSIT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ELEMENT_IMPRESSION")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPRESSION_OBJECT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_EVENT")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACTION_BUTTON_DETAILS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_WAYPOINTS")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_IDENTIFIER")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLICATION_IDENTIFIER")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_BASE")) & 1) != 0)
  {
    v4 = 401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_LOCALE")) & 1) != 0)
  {
    v4 = 402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_CONNECTION")) & 1) != 0)
  {
    v4 = 403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAR_PLAY")) & 1) != 0)
  {
    v4 = 404;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PAIRED_DEVICE")) & 1) != 0)
  {
    v4 = 405;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTENSION")) & 1) != 0)
  {
    v4 = 406;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE_SETTINGS")) & 1) != 0)
  {
    v4 = 407;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW_LOCATION")) & 1) != 0)
  {
    v4 = 502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_SETTINGS")) & 1) != 0)
  {
    v4 = 504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_UI")) & 1) != 0)
  {
    v4 = 505;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_UI_SHOWN")) & 1) != 0)
  {
    v4 = 506;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_SESSION")) & 1) != 0)
  {
    v4 = 601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPERIMENTS")) & 1) != 0)
  {
    v4 = 602;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CARD")) & 1) != 0)
  {
    v4 = 702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE")) & 1) != 0)
  {
    v4 = 703;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
  {
    v4 = 704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_SERVER")) & 1) != 0)
  {
    v4 = 705;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TILE_SET")) & 1) != 0)
  {
    v4 = 706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_REQUEST")) & 1) != 0)
  {
    v4 = 707;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAVIGATION")) & 1) != 0)
  {
    v4 = 708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESTORE")) & 1) != 0)
  {
    v4 = 709;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
  {
    v4 = 710;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REPORT_AN_ISSUE")) & 1) != 0)
  {
    v4 = 711;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REALTIME_TRAFFIC")) & 1) != 0)
  {
    v4 = 712;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE")) & 1) != 0)
  {
    v4 = 713;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUMMARY_LOOK_AROUND_LOG")) & 1) != 0)
  {
    v4 = 714;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DETAIL_LOOK_AROUND_LOG")) & 1) != 0)
  {
    v4 = 715;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW")) & 1) != 0)
  {
    v4 = 716;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MUNIN_RESOURCE_LOG")) & 1) != 0)
  {
    v4 = 717;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_LAUNCH")) & 1) != 0)
  {
    v4 = 718;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION")) & 1) != 0)
  {
    v4 = 719;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UGC_PHOTO")) & 1) != 0)
  {
    v4 = 720;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_DETAIL")) & 1) != 0)
  {
    v4 = 721;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MARKET")) & 1) != 0)
  {
    v4 = 722;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_SETTINGS")) & 1) != 0)
  {
    v4 = 723;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_FEATURES")) & 1) != 0)
  {
    v4 = 724;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_USER_SETTINGS")) & 1) != 0)
  {
    v4 = 725;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_SUBMISSION")) & 1) != 0)
  {
    v4 = 726;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATING_SUBMISSION")) & 1) != 0)
  {
    v4 = 727;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATING_PHOTO_SUBMISSION")) & 1) != 0)
  {
    v4 = 728;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_PLACE_IDS")) & 1) != 0)
  {
    v4 = 729;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CARD_RAP")) & 1) != 0)
  {
    v4 = 730;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_DOWNLOAD")))
  {
    v4 = 731;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readDeviceIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDeviceIdentifier
{
  -[GEOLogMsgState _readDeviceIdentifier]((uint64_t)self);
  return self->_deviceIdentifier != 0;
}

- (GEOLogMsgStateDeviceIdentifier)deviceIdentifier
{
  -[GEOLogMsgState _readDeviceIdentifier]((uint64_t)self);
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000001000uLL;
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void)_readApplicationIdentifier
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readApplicationIdentifier_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasApplicationIdentifier
{
  -[GEOLogMsgState _readApplicationIdentifier]((uint64_t)self);
  return self->_applicationIdentifier != 0;
}

- (GEOLogMsgStateApplicationIdentifier)applicationIdentifier
{
  -[GEOLogMsgState _readApplicationIdentifier]((uint64_t)self);
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000008uLL;
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (void)_readDeviceBase
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceBase_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDeviceBase
{
  -[GEOLogMsgState _readDeviceBase]((uint64_t)self);
  return self->_deviceBase != 0;
}

- (GEOLogMsgStateDeviceBase)deviceBase
{
  -[GEOLogMsgState _readDeviceBase]((uint64_t)self);
  return self->_deviceBase;
}

- (void)setDeviceBase:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000400uLL;
  objc_storeStrong((id *)&self->_deviceBase, a3);
}

- (void)_readDeviceLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceLocale_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDeviceLocale
{
  -[GEOLogMsgState _readDeviceLocale]((uint64_t)self);
  return self->_deviceLocale != 0;
}

- (GEOLogMsgStateDeviceLocale)deviceLocale
{
  -[GEOLogMsgState _readDeviceLocale]((uint64_t)self);
  return self->_deviceLocale;
}

- (void)setDeviceLocale:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000002000uLL;
  objc_storeStrong((id *)&self->_deviceLocale, a3);
}

- (void)_readDeviceConnection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceConnection_tags_4766);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDeviceConnection
{
  -[GEOLogMsgState _readDeviceConnection]((uint64_t)self);
  return self->_deviceConnection != 0;
}

- (GEOLogMsgStateDeviceConnection)deviceConnection
{
  -[GEOLogMsgState _readDeviceConnection]((uint64_t)self);
  return self->_deviceConnection;
}

- (void)setDeviceConnection:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000800uLL;
  objc_storeStrong((id *)&self->_deviceConnection, a3);
}

- (void)_readCarPlay
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCarPlay_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasCarPlay
{
  -[GEOLogMsgState _readCarPlay]((uint64_t)self);
  return self->_carPlay != 0;
}

- (GEOLogMsgStateCarPlay)carPlay
{
  -[GEOLogMsgState _readCarPlay]((uint64_t)self);
  return self->_carPlay;
}

- (void)setCarPlay:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000080uLL;
  objc_storeStrong((id *)&self->_carPlay, a3);
}

- (void)_readPairedDevice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPairedDevice_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPairedDevice
{
  -[GEOLogMsgState _readPairedDevice]((uint64_t)self);
  return self->_pairedDevice != 0;
}

- (GEOLogMsgStatePairedDevice)pairedDevice
{
  -[GEOLogMsgState _readPairedDevice]((uint64_t)self);
  return self->_pairedDevice;
}

- (void)setPairedDevice:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400004000000000uLL;
  objc_storeStrong((id *)&self->_pairedDevice, a3);
}

- (void)_readExtension
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExtension_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasExtension
{
  -[GEOLogMsgState _readExtension]((uint64_t)self);
  return self->_extension != 0;
}

- (GEOLogMsgStateExtension)extension
{
  -[GEOLogMsgState _readExtension]((uint64_t)self);
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000040000uLL;
  objc_storeStrong((id *)&self->_extension, a3);
}

- (void)_readDeviceSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDeviceSettings_tags_4767);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDeviceSettings
{
  -[GEOLogMsgState _readDeviceSettings]((uint64_t)self);
  return self->_deviceSettings != 0;
}

- (GEOLogMsgStateDeviceSettings)deviceSettings
{
  -[GEOLogMsgState _readDeviceSettings]((uint64_t)self);
  return self->_deviceSettings;
}

- (void)setDeviceSettings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000004000uLL;
  objc_storeStrong((id *)&self->_deviceSettings, a3);
}

- (void)_readMapView
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapView_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapView
{
  -[GEOLogMsgState _readMapView]((uint64_t)self);
  return self->_mapView != 0;
}

- (GEOLogMsgStateMapView)mapView
{
  -[GEOLogMsgState _readMapView]((uint64_t)self);
  return self->_mapView;
}

- (void)setMapView:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000008000000uLL;
  objc_storeStrong((id *)&self->_mapView, a3);
}

- (void)_readMapViewLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapViewLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapViewLocation
{
  -[GEOLogMsgState _readMapViewLocation]((uint64_t)self);
  return self->_mapViewLocation != 0;
}

- (GEOLogMsgStateMapViewLocation)mapViewLocation
{
  -[GEOLogMsgState _readMapViewLocation]((uint64_t)self);
  return self->_mapViewLocation;
}

- (void)setMapViewLocation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000004000000uLL;
  objc_storeStrong((id *)&self->_mapViewLocation, a3);
}

- (void)_readTransit
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransit_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTransit
{
  -[GEOLogMsgState _readTransit]((uint64_t)self);
  return self->_transit != 0;
}

- (GEOLogMsgStateTransit)transit
{
  -[GEOLogMsgState _readTransit]((uint64_t)self);
  return self->_transit;
}

- (void)setTransit:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x440000000000000uLL;
  objc_storeStrong((id *)&self->_transit, a3);
}

- (void)_readMapSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapSettings_tags_4768);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapSettings
{
  -[GEOLogMsgState _readMapSettings]((uint64_t)self);
  return self->_mapSettings != 0;
}

- (GEOLogMsgStateMapSettings)mapSettings
{
  -[GEOLogMsgState _readMapSettings]((uint64_t)self);
  return self->_mapSettings;
}

- (void)setMapSettings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000800000uLL;
  objc_storeStrong((id *)&self->_mapSettings, a3);
}

- (void)_readMapUi
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapUi_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapUi
{
  -[GEOLogMsgState _readMapUi]((uint64_t)self);
  return self->_mapUi != 0;
}

- (GEOLogMsgStateMapUI)mapUi
{
  -[GEOLogMsgState _readMapUi]((uint64_t)self);
  return self->_mapUi;
}

- (void)setMapUi:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000002000000uLL;
  objc_storeStrong((id *)&self->_mapUi, a3);
}

- (void)_readMapUiShown
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapUiShown_tags_4769);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapUiShown
{
  -[GEOLogMsgState _readMapUiShown]((uint64_t)self);
  return self->_mapUiShown != 0;
}

- (GEOLogMsgStateMapUIShown)mapUiShown
{
  -[GEOLogMsgState _readMapUiShown]((uint64_t)self);
  return self->_mapUiShown;
}

- (void)setMapUiShown:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000001000000uLL;
  objc_storeStrong((id *)&self->_mapUiShown, a3);
}

- (void)_readUserSession
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 495) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserSession_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasUserSession
{
  -[GEOLogMsgState _readUserSession]((uint64_t)self);
  return self->_userSession != 0;
}

- (GEOLogMsgStateUserSession)userSession
{
  -[GEOLogMsgState _readUserSession]((uint64_t)self);
  return self->_userSession;
}

- (void)setUserSession:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x500000000000000uLL;
  objc_storeStrong((id *)&self->_userSession, a3);
}

- (void)_readExperiments
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExperiments_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasExperiments
{
  -[GEOLogMsgState _readExperiments]((uint64_t)self);
  return self->_experiments != 0;
}

- (GEOLogMsgStateExperiments)experiments
{
  -[GEOLogMsgState _readExperiments]((uint64_t)self);
  return self->_experiments;
}

- (void)setExperiments:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000020000uLL;
  objc_storeStrong((id *)&self->_experiments, a3);
}

- (void)_readPlaceCard
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCard_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceCard
{
  -[GEOLogMsgState _readPlaceCard]((uint64_t)self);
  return self->_placeCard != 0;
}

- (GEOLogMsgStatePlaceCard)placeCard
{
  -[GEOLogMsgState _readPlaceCard]((uint64_t)self);
  return self->_placeCard;
}

- (void)setPlaceCard:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400010000000000uLL;
  objc_storeStrong((id *)&self->_placeCard, a3);
}

- (void)_readRoute
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoute_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRoute
{
  -[GEOLogMsgState _readRoute]((uint64_t)self);
  return self->_route != 0;
}

- (GEOLogMsgStateRoute)route
{
  -[GEOLogMsgState _readRoute]((uint64_t)self);
  return self->_route;
}

- (void)setRoute:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400100000000000uLL;
  objc_storeStrong((id *)&self->_route, a3);
}

- (void)_readMapsServer
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsServer_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsServer
{
  -[GEOLogMsgState _readMapsServer]((uint64_t)self);
  return self->_mapsServer != 0;
}

- (GEOLogMsgStateMapsServer)mapsServer
{
  -[GEOLogMsgState _readMapsServer]((uint64_t)self);
  return self->_mapsServer;
}

- (void)setMapsServer:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000040000000uLL;
  objc_storeStrong((id *)&self->_mapsServer, a3);
}

- (void)_readTileSet
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileSet_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasTileSet
{
  -[GEOLogMsgState _readTileSet]((uint64_t)self);
  return self->_tileSet != 0;
}

- (GEOLogMsgStateTileSet)tileSet
{
  -[GEOLogMsgState _readTileSet]((uint64_t)self);
  return self->_tileSet;
}

- (void)setTileSet:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x410000000000000uLL;
  objc_storeStrong((id *)&self->_tileSet, a3);
}

- (BOOL)hasPlaceRequest
{
  -[GEOLogMsgState _readPlaceRequest]((uint64_t)self);
  return self->_placeRequest != 0;
}

- (void)_readNavigation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavigation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasNavigation
{
  -[GEOLogMsgState _readNavigation]((uint64_t)self);
  return self->_navigation != 0;
}

- (GEOLogMsgStateNavigation)navigation
{
  -[GEOLogMsgState _readNavigation]((uint64_t)self);
  return self->_navigation;
}

- (void)setNavigation:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000400000000uLL;
  objc_storeStrong((id *)&self->_navigation, a3);
}

- (void)_readMapRestore
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapRestore_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapRestore
{
  -[GEOLogMsgState _readMapRestore]((uint64_t)self);
  return self->_mapRestore != 0;
}

- (GEOLogMsgStateMapRestore)mapRestore
{
  -[GEOLogMsgState _readMapRestore]((uint64_t)self);
  return self->_mapRestore;
}

- (void)setMapRestore:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000400000uLL;
  objc_storeStrong((id *)&self->_mapRestore, a3);
}

- (void)_readSuggestions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSuggestions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSuggestions
{
  -[GEOLogMsgState _readSuggestions]((uint64_t)self);
  return self->_suggestions != 0;
}

- (GEOLogMsgStateSuggestions)suggestions
{
  -[GEOLogMsgState _readSuggestions]((uint64_t)self);
  return self->_suggestions;
}

- (void)setSuggestions:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x402000000000000uLL;
  objc_storeStrong((id *)&self->_suggestions, a3);
}

- (void)_readOffline
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOffline_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasOffline
{
  -[GEOLogMsgState _readOffline]((uint64_t)self);
  return self->_offline != 0;
}

- (GEOLogMsgStateOffline)offline
{
  -[GEOLogMsgState _readOffline]((uint64_t)self);
  return self->_offline;
}

- (void)setOffline:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400002000000000uLL;
  objc_storeStrong((id *)&self->_offline, a3);
}

- (void)_readSummaryLookAroundLog
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSummaryLookAroundLog_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasSummaryLookAroundLog
{
  -[GEOLogMsgState _readSummaryLookAroundLog]((uint64_t)self);
  return self->_summaryLookAroundLog != 0;
}

- (GEOLogMsgStateSummaryLookAroundLog)summaryLookAroundLog
{
  -[GEOLogMsgState _readSummaryLookAroundLog]((uint64_t)self);
  return self->_summaryLookAroundLog;
}

- (void)setSummaryLookAroundLog:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x404000000000000uLL;
  objc_storeStrong((id *)&self->_summaryLookAroundLog, a3);
}

- (void)_readDetailLookAroundLog
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetailLookAroundLog_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDetailLookAroundLog
{
  -[GEOLogMsgState _readDetailLookAroundLog]((uint64_t)self);
  return self->_detailLookAroundLog != 0;
}

- (GEOLogMsgStateDetailLookAroundLog)detailLookAroundLog
{
  -[GEOLogMsgState _readDetailLookAroundLog]((uint64_t)self);
  return self->_detailLookAroundLog;
}

- (void)setDetailLookAroundLog:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000200uLL;
  objc_storeStrong((id *)&self->_detailLookAroundLog, a3);
}

- (void)_readLookAroundView
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLookAroundView_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasLookAroundView
{
  -[GEOLogMsgState _readLookAroundView]((uint64_t)self);
  return self->_lookAroundView != 0;
}

- (GEOLogMsgStateLookAroundView)lookAroundView
{
  -[GEOLogMsgState _readLookAroundView]((uint64_t)self);
  return self->_lookAroundView;
}

- (void)setLookAroundView:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000100000uLL;
  objc_storeStrong((id *)&self->_lookAroundView, a3);
}

- (void)_readMuninResource
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMuninResource_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMuninResource
{
  -[GEOLogMsgState _readMuninResource]((uint64_t)self);
  return self->_muninResource != 0;
}

- (GEOLogMsgStateMuninResource)muninResource
{
  -[GEOLogMsgState _readMuninResource]((uint64_t)self);
  return self->_muninResource;
}

- (void)setMuninResource:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000200000000uLL;
  objc_storeStrong((id *)&self->_muninResource, a3);
}

- (void)_readMapLaunch
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 490) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapLaunch_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapLaunch
{
  -[GEOLogMsgState _readMapLaunch]((uint64_t)self);
  return self->_mapLaunch != 0;
}

- (GEOLogMsgStateMapLaunch)mapLaunch
{
  -[GEOLogMsgState _readMapLaunch]((uint64_t)self);
  return self->_mapLaunch;
}

- (void)setMapLaunch:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000200000uLL;
  objc_storeStrong((id *)&self->_mapLaunch, a3);
}

- (void)_readCuratedCollection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedCollection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasCuratedCollection
{
  -[GEOLogMsgState _readCuratedCollection]((uint64_t)self);
  return self->_curatedCollection != 0;
}

- (GEOLogMsgStateCuratedCollection)curatedCollection
{
  -[GEOLogMsgState _readCuratedCollection]((uint64_t)self);
  return self->_curatedCollection;
}

- (void)setCuratedCollection:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000100uLL;
  objc_storeStrong((id *)&self->_curatedCollection, a3);
}

- (void)_readUgcPhoto
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 494) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUgcPhoto_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasUgcPhoto
{
  -[GEOLogMsgState _readUgcPhoto]((uint64_t)self);
  return self->_ugcPhoto != 0;
}

- (GEOLogMsgStateUGCPhoto)ugcPhoto
{
  -[GEOLogMsgState _readUgcPhoto]((uint64_t)self);
  return self->_ugcPhoto;
}

- (void)setUgcPhoto:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x480000000000000uLL;
  objc_storeStrong((id *)&self->_ugcPhoto, a3);
}

- (void)_readDirectionsDetail
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 489) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsDetail_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasDirectionsDetail
{
  -[GEOLogMsgState _readDirectionsDetail]((uint64_t)self);
  return self->_directionsDetail != 0;
}

- (GEOLogMsgStateDirectionsDetail)directionsDetail
{
  -[GEOLogMsgState _readDirectionsDetail]((uint64_t)self);
  return self->_directionsDetail;
}

- (void)setDirectionsDetail:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000008000uLL;
  objc_storeStrong((id *)&self->_directionsDetail, a3);
}

- (void)_readMarket
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMarket_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMarket
{
  -[GEOLogMsgState _readMarket]((uint64_t)self);
  return self->_market != 0;
}

- (GEOLogMsgStateMarket)market
{
  -[GEOLogMsgState _readMarket]((uint64_t)self);
  return self->_market;
}

- (void)setMarket:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000100000000uLL;
  objc_storeStrong((id *)&self->_market, a3);
}

- (void)_readRoutingSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 493) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRoutingSettings_tags_4770);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasRoutingSettings
{
  -[GEOLogMsgState _readRoutingSettings]((uint64_t)self);
  return self->_routingSettings != 0;
}

- (GEOLogMsgStateRoutingSettings)routingSettings
{
  -[GEOLogMsgState _readRoutingSettings]((uint64_t)self);
  return self->_routingSettings;
}

- (void)setRoutingSettings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400400000000000uLL;
  objc_storeStrong((id *)&self->_routingSettings, a3);
}

- (void)_readMapsFeatures
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsFeatures_tags_4771);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsFeatures
{
  -[GEOLogMsgState _readMapsFeatures]((uint64_t)self);
  return self->_mapsFeatures != 0;
}

- (GEOLogMsgStateMapsFeatures)mapsFeatures
{
  -[GEOLogMsgState _readMapsFeatures]((uint64_t)self);
  return self->_mapsFeatures;
}

- (void)setMapsFeatures:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000010000000uLL;
  objc_storeStrong((id *)&self->_mapsFeatures, a3);
}

- (void)_readMapsUserSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsUserSettings_tags_4772);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsUserSettings
{
  -[GEOLogMsgState _readMapsUserSettings]((uint64_t)self);
  return self->_mapsUserSettings != 0;
}

- (GEOLogMsgStateMapsUserSettings)mapsUserSettings
{
  -[GEOLogMsgState _readMapsUserSettings]((uint64_t)self);
  return self->_mapsUserSettings;
}

- (void)setMapsUserSettings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000080000000uLL;
  objc_storeStrong((id *)&self->_mapsUserSettings, a3);
}

- (void)_readArpPhotoSubmission
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArpPhotoSubmission_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasArpPhotoSubmission
{
  -[GEOLogMsgState _readArpPhotoSubmission]((uint64_t)self);
  return self->_arpPhotoSubmission != 0;
}

- (GEOLogMsgStateARPPhotoSubmission)arpPhotoSubmission
{
  -[GEOLogMsgState _readArpPhotoSubmission]((uint64_t)self);
  return self->_arpPhotoSubmission;
}

- (void)setArpPhotoSubmission:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000010uLL;
  objc_storeStrong((id *)&self->_arpPhotoSubmission, a3);
}

- (void)_readArpRatingSubmission
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArpRatingSubmission_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasArpRatingSubmission
{
  -[GEOLogMsgState _readArpRatingSubmission]((uint64_t)self);
  return self->_arpRatingSubmission != 0;
}

- (GEOLogMsgStateARPRatingSubmission)arpRatingSubmission
{
  -[GEOLogMsgState _readArpRatingSubmission]((uint64_t)self);
  return self->_arpRatingSubmission;
}

- (void)setArpRatingSubmission:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000040uLL;
  objc_storeStrong((id *)&self->_arpRatingSubmission, a3);
}

- (void)_readArpRatingPhotoSubmission
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 488) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArpRatingPhotoSubmission_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasArpRatingPhotoSubmission
{
  -[GEOLogMsgState _readArpRatingPhotoSubmission]((uint64_t)self);
  return self->_arpRatingPhotoSubmission != 0;
}

- (GEOLogMsgStateARPRatingPhotoSubmission)arpRatingPhotoSubmission
{
  -[GEOLogMsgState _readArpRatingPhotoSubmission]((uint64_t)self);
  return self->_arpRatingPhotoSubmission;
}

- (void)setArpRatingPhotoSubmission:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000000000020uLL;
  objc_storeStrong((id *)&self->_arpRatingPhotoSubmission, a3);
}

- (void)_readMapsPlaceIds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 491) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapsPlaceIds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasMapsPlaceIds
{
  -[GEOLogMsgState _readMapsPlaceIds]((uint64_t)self);
  return self->_mapsPlaceIds != 0;
}

- (GEOLogMsgStateMapsPlaceIds)mapsPlaceIds
{
  -[GEOLogMsgState _readMapsPlaceIds]((uint64_t)self);
  return self->_mapsPlaceIds;
}

- (void)setMapsPlaceIds:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400000020000000uLL;
  objc_storeStrong((id *)&self->_mapsPlaceIds, a3);
}

- (void)_readPlaceCardRap
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPlaceCardRap_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasPlaceCardRap
{
  -[GEOLogMsgState _readPlaceCardRap]((uint64_t)self);
  return self->_placeCardRap != 0;
}

- (GEOLogMsgStatePlaceCardRap)placeCardRap
{
  -[GEOLogMsgState _readPlaceCardRap]((uint64_t)self);
  return self->_placeCardRap;
}

- (void)setPlaceCardRap:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400008000000000uLL;
  objc_storeStrong((id *)&self->_placeCardRap, a3);
}

- (void)_readOfflineDownload
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 480));
    if ((*(_BYTE *)(a1 + 492) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOfflineDownload_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 480));
  }
}

- (BOOL)hasOfflineDownload
{
  -[GEOLogMsgState _readOfflineDownload]((uint64_t)self);
  return self->_offlineDownload != 0;
}

- (GEOLogMsgStateOfflineDownload)offlineDownload
{
  -[GEOLogMsgState _readOfflineDownload]((uint64_t)self);
  return self->_offlineDownload;
}

- (void)setOfflineDownload:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x400001000000000uLL;
  objc_storeStrong((id *)&self->_offlineDownload, a3);
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
  v8.super_class = (Class)GEOLogMsgState;
  -[GEOLogMsgState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgState dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgState _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  const __CFString *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  int v57;
  __CFString *v58;
  const __CFString *v59;
  void *v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  id v74;
  void *v75;
  void *v76;
  void *v77;
  const __CFString *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  const __CFString *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  const __CFString *v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  const __CFString *v93;
  id v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  void *v100;
  const __CFString *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  const __CFString *v106;
  id v107;
  void *v108;
  void *v109;
  void *v110;
  const __CFString *v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  id v120;
  void *v121;
  void *v122;
  void *v123;
  const __CFString *v124;
  id v125;
  void *v126;
  void *v127;
  void *v128;
  const __CFString *v129;
  id v130;
  void *v131;
  void *v132;
  void *v133;
  const __CFString *v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  void *v139;
  void *v140;
  void *v141;
  const __CFString *v142;
  id v143;
  void *v144;
  void *v145;
  id v146;
  void *v147;
  void *v148;
  void *v149;
  const __CFString *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  const __CFString *v155;
  id v156;
  void *v157;
  void *v158;
  void *v159;
  const __CFString *v160;
  id v161;
  void *v162;
  void *v163;
  id v164;
  void *v165;
  void *v166;
  void *v167;
  const __CFString *v168;
  id v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  id v175;
  void *v176;
  void *v177;
  void *v178;
  const __CFString *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  const __CFString *v184;
  id v185;
  void *v186;
  void *v187;
  void *v188;
  const __CFString *v189;
  id v190;
  void *v191;
  void *v192;
  void *v193;
  const __CFString *v194;
  id v195;
  void *v196;
  void *v197;
  void *v198;
  const __CFString *v199;
  id v200;
  void *v201;
  void *v202;
  void *v203;
  const __CFString *v204;
  id v205;
  void *v206;
  void *v207;
  void *v208;
  const __CFString *v209;
  id v210;
  void *v211;
  void *v212;
  void *v213;
  const __CFString *v214;
  id v215;
  void *v216;
  void *v217;
  id v218;
  void *v219;
  void *v220;
  void *v221;
  const __CFString *v222;
  id v223;
  void *v224;
  void *v225;
  void *v226;
  const __CFString *v227;
  id v228;
  void *v229;
  void *v230;
  void *v231;
  const __CFString *v232;
  id v233;
  void *v234;
  void *v235;
  void *v236;
  const __CFString *v237;
  id v238;
  void *v239;
  void *v240;
  void *v241;
  const __CFString *v242;
  id v243;
  void *v244;
  void *v245;
  void *v246;
  const __CFString *v247;
  id v248;
  void *v249;
  void *v250;
  void *v251;
  const __CFString *v252;
  id v253;
  void *v254;
  void *v255;
  void *v256;
  const __CFString *v257;
  id v258;
  void *v259;
  void *v260;
  void *v261;
  const __CFString *v262;
  id v263;
  id v264;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "stateOrigin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("stateOrigin");
      else
        v6 = CFSTR("state_origin");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "user");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("user"));
    }

    objc_msgSend((id)a1, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v10, "jsonRepresentation");
      else
        objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("account"));
    }

    objc_msgSend((id)a1, "rap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v13, "jsonRepresentation");
      else
        objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("rap"));
    }

    objc_msgSend((id)a1, "placeSummaryLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v16, "jsonRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("placeSummaryLayout");
      }
      else
      {
        objc_msgSend(v16, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("place_summary_layout");
      }
      v20 = v18;

      objc_msgSend(v4, "setObject:forKey:", v20, v19);
    }

    objc_msgSend((id)a1, "transitStep");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v21, "jsonRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("transitStep");
      }
      else
      {
        objc_msgSend(v21, "dictionaryRepresentation");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = CFSTR("transit_step");
      }
      v25 = v23;

      objc_msgSend(v4, "setObject:forKey:", v25, v24);
    }

    objc_msgSend((id)a1, "nearbyTransit");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v26, "jsonRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("nearbyTransit");
      }
      else
      {
        objc_msgSend(v26, "dictionaryRepresentation");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = CFSTR("nearby_transit");
      }
      v30 = v28;

      objc_msgSend(v4, "setObject:forKey:", v30, v29);
    }

    objc_msgSend((id)a1, "searchResults");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v31, "jsonRepresentation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = CFSTR("searchResults");
      }
      else
      {
        objc_msgSend(v31, "dictionaryRepresentation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = CFSTR("search_results");
      }
      v35 = v33;

      objc_msgSend(v4, "setObject:forKey:", v35, v34);
    }

    objc_msgSend((id)a1, "elementImpression");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    if (v36)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v36, "jsonRepresentation");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = CFSTR("elementImpression");
      }
      else
      {
        objc_msgSend(v36, "dictionaryRepresentation");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = CFSTR("element_impression");
      }
      v40 = v38;

      objc_msgSend(v4, "setObject:forKey:", v40, v39);
    }

    objc_msgSend((id)a1, "impressionObject");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v41, "jsonRepresentation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = CFSTR("impressionObject");
      }
      else
      {
        objc_msgSend(v41, "dictionaryRepresentation");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = CFSTR("impression_object");
      }
      v45 = v43;

      objc_msgSend(v4, "setObject:forKey:", v45, v44);
    }

    objc_msgSend((id)a1, "tapEvent");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v46, "jsonRepresentation");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("tapEvent");
      }
      else
      {
        objc_msgSend(v46, "dictionaryRepresentation");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("tap_event");
      }
      v50 = v48;

      objc_msgSend(v4, "setObject:forKey:", v50, v49);
    }

    objc_msgSend((id)a1, "actionButtonDetails");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v51)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v51, "jsonRepresentation");
      else
        objc_msgSend(v51, "dictionaryRepresentation");
      v53 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v53, CFSTR("actionButtonDetails"));
    }

    objc_msgSend((id)a1, "routingWaypoints");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v54;
    if (v54)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v54, "jsonRepresentation");
      else
        objc_msgSend(v54, "dictionaryRepresentation");
      v56 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("routingWaypoints"));
    }

    if ((*(_BYTE *)(a1 + 488) & 1) != 0)
    {
      v57 = *(_DWORD *)(a1 + 484);
      if (v57 > 600)
      {
        switch(v57)
        {
          case 702:
            v58 = CFSTR("PLACE_CARD");
            break;
          case 703:
            v58 = CFSTR("ROUTE");
            break;
          case 704:
            v58 = CFSTR("FLYOVER");
            break;
          case 705:
            v58 = CFSTR("MAPS_SERVER");
            break;
          case 706:
            v58 = CFSTR("TILE_SET");
            break;
          case 707:
            v58 = CFSTR("PLACE_REQUEST");
            break;
          case 708:
            v58 = CFSTR("NAVIGATION");
            break;
          case 709:
            v58 = CFSTR("MAP_RESTORE");
            break;
          case 710:
            v58 = CFSTR("SUGGESTIONS");
            break;
          case 711:
            v58 = CFSTR("REPORT_AN_ISSUE");
            break;
          case 712:
            v58 = CFSTR("REALTIME_TRAFFIC");
            break;
          case 713:
            v58 = CFSTR("OFFLINE");
            break;
          case 714:
            v58 = CFSTR("SUMMARY_LOOK_AROUND_LOG");
            break;
          case 715:
            v58 = CFSTR("DETAIL_LOOK_AROUND_LOG");
            break;
          case 716:
            v58 = CFSTR("LOOK_AROUND_VIEW");
            break;
          case 717:
            v58 = CFSTR("MUNIN_RESOURCE_LOG");
            break;
          case 718:
            v58 = CFSTR("MAPS_LAUNCH");
            break;
          case 719:
            v58 = CFSTR("CURATED_COLLECTION");
            break;
          case 720:
            v58 = CFSTR("UGC_PHOTO");
            break;
          case 721:
            v58 = CFSTR("DIRECTIONS_DETAIL");
            break;
          case 722:
            v58 = CFSTR("MARKET");
            break;
          case 723:
            v58 = CFSTR("ROUTING_SETTINGS");
            break;
          case 724:
            v58 = CFSTR("MAPS_FEATURES");
            break;
          case 725:
            v58 = CFSTR("MAPS_USER_SETTINGS");
            break;
          case 726:
            v58 = CFSTR("PHOTO_SUBMISSION");
            break;
          case 727:
            v58 = CFSTR("RATING_SUBMISSION");
            break;
          case 728:
            v58 = CFSTR("RATING_PHOTO_SUBMISSION");
            break;
          case 729:
            v58 = CFSTR("MAPS_PLACE_IDS");
            break;
          case 730:
            v58 = CFSTR("PLACE_CARD_RAP");
            break;
          case 731:
            v58 = CFSTR("OFFLINE_DOWNLOAD");
            break;
          default:
            if (v57 == 601)
            {
              v58 = CFSTR("USER_SESSION");
            }
            else if (v57 == 602)
            {
              v58 = CFSTR("EXPERIMENTS");
            }
            else
            {
LABEL_108:
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 484));
              v58 = (__CFString *)objc_claimAutoreleasedReturnValue();
            }
            break;
        }
      }
      else if (v57 > 300)
      {
        switch(v57)
        {
          case 401:
            v58 = CFSTR("DEVICE_BASE");
            break;
          case 402:
            v58 = CFSTR("DEVICE_LOCALE");
            break;
          case 403:
            v58 = CFSTR("DEVICE_CONNECTION");
            break;
          case 404:
            v58 = CFSTR("CAR_PLAY");
            break;
          case 405:
            v58 = CFSTR("PAIRED_DEVICE");
            break;
          case 406:
            v58 = CFSTR("EXTENSION");
            break;
          case 407:
            v58 = CFSTR("DEVICE_SETTINGS");
            break;
          default:
            switch(v57)
            {
              case 501:
                v58 = CFSTR("MAP_VIEW");
                break;
              case 502:
                v58 = CFSTR("MAP_VIEW_LOCATION");
                break;
              case 503:
                v58 = CFSTR("TRANSIT");
                break;
              case 504:
                v58 = CFSTR("MAP_SETTINGS");
                break;
              case 505:
                v58 = CFSTR("MAP_UI");
                break;
              case 506:
                v58 = CFSTR("MAP_UI_SHOWN");
                break;
              default:
                if (v57 != 301)
                  goto LABEL_108;
                v58 = CFSTR("APPLICATION_IDENTIFIER");
                break;
            }
            break;
        }
      }
      else
      {
        v58 = CFSTR("LOG_MSG_STATE_TYPE_UNKNOWN");
        switch(v57)
        {
          case 0:
            break;
          case 1:
            goto LABEL_108;
          case 2:
            v58 = CFSTR("MAPS_USER");
            break;
          case 3:
            v58 = CFSTR("ACCOUNT");
            break;
          case 4:
            v58 = CFSTR("RAP");
            break;
          case 5:
            v58 = CFSTR("PLACE_SUMMARY_LAYOUT");
            break;
          case 6:
            v58 = CFSTR("TRANSIT_STEP");
            break;
          case 7:
            v58 = CFSTR("NEARBY_TRANSIT");
            break;
          case 8:
            v58 = CFSTR("SEARCH_RESULTS");
            break;
          case 9:
            v58 = CFSTR("ELEMENT_IMPRESSION");
            break;
          case 10:
            v58 = CFSTR("IMPRESSION_OBJECT");
            break;
          case 11:
            v58 = CFSTR("TAP_EVENT");
            break;
          case 12:
            v58 = CFSTR("ACTION_BUTTON_DETAILS");
            break;
          case 13:
            v58 = CFSTR("ROUTING_WAYPOINTS");
            break;
          default:
            if (v57 != 201)
              goto LABEL_108;
            v58 = CFSTR("DEVICE_IDENTIFIER");
            break;
        }
      }
      if (a2)
        v59 = CFSTR("stateType");
      else
        v59 = CFSTR("state_type");
      objc_msgSend(v4, "setObject:forKey:", v58, v59);

    }
    objc_msgSend((id)a1, "deviceIdentifier");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v60;
    if (v60)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v60, "jsonRepresentation");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = CFSTR("deviceIdentifier");
      }
      else
      {
        objc_msgSend(v60, "dictionaryRepresentation");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = CFSTR("device_identifier");
      }
      v64 = v62;

      objc_msgSend(v4, "setObject:forKey:", v64, v63);
    }

    objc_msgSend((id)a1, "applicationIdentifier");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v65;
    if (v65)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v65, "jsonRepresentation");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = CFSTR("applicationIdentifier");
      }
      else
      {
        objc_msgSend(v65, "dictionaryRepresentation");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v68 = CFSTR("application_identifier");
      }
      v69 = v67;

      objc_msgSend(v4, "setObject:forKey:", v69, v68);
    }

    objc_msgSend((id)a1, "deviceBase");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (v70)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v70, "jsonRepresentation");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = CFSTR("deviceBase");
      }
      else
      {
        objc_msgSend(v70, "dictionaryRepresentation");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = CFSTR("device_base");
      }
      v74 = v72;

      objc_msgSend(v4, "setObject:forKey:", v74, v73);
    }

    objc_msgSend((id)a1, "deviceLocale");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v75;
    if (v75)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v75, "jsonRepresentation");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = CFSTR("deviceLocale");
      }
      else
      {
        objc_msgSend(v75, "dictionaryRepresentation");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = CFSTR("device_locale");
      }
      v79 = v77;

      objc_msgSend(v4, "setObject:forKey:", v79, v78);
    }

    objc_msgSend((id)a1, "deviceConnection");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = v80;
    if (v80)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v80, "jsonRepresentation");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = CFSTR("deviceConnection");
      }
      else
      {
        objc_msgSend(v80, "dictionaryRepresentation");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = CFSTR("device_connection");
      }
      v84 = v82;

      objc_msgSend(v4, "setObject:forKey:", v84, v83);
    }

    objc_msgSend((id)a1, "carPlay");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = v85;
    if (v85)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v85, "jsonRepresentation");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = CFSTR("carPlay");
      }
      else
      {
        objc_msgSend(v85, "dictionaryRepresentation");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = CFSTR("car_play");
      }
      v89 = v87;

      objc_msgSend(v4, "setObject:forKey:", v89, v88);
    }

    objc_msgSend((id)a1, "pairedDevice");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = v90;
    if (v90)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v90, "jsonRepresentation");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = CFSTR("pairedDevice");
      }
      else
      {
        objc_msgSend(v90, "dictionaryRepresentation");
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = CFSTR("paired_device");
      }
      v94 = v92;

      objc_msgSend(v4, "setObject:forKey:", v94, v93);
    }

    objc_msgSend((id)a1, "extension");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v95;
    if (v95)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v95, "jsonRepresentation");
      else
        objc_msgSend(v95, "dictionaryRepresentation");
      v97 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v97, CFSTR("extension"));
    }

    objc_msgSend((id)a1, "deviceSettings");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    v99 = v98;
    if (v98)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v98, "jsonRepresentation");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = CFSTR("deviceSettings");
      }
      else
      {
        objc_msgSend(v98, "dictionaryRepresentation");
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = CFSTR("device_settings");
      }
      v102 = v100;

      objc_msgSend(v4, "setObject:forKey:", v102, v101);
    }

    objc_msgSend((id)a1, "mapView");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v103;
    if (v103)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v103, "jsonRepresentation");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = CFSTR("mapView");
      }
      else
      {
        objc_msgSend(v103, "dictionaryRepresentation");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = CFSTR("map_view");
      }
      v107 = v105;

      objc_msgSend(v4, "setObject:forKey:", v107, v106);
    }

    objc_msgSend((id)a1, "mapViewLocation");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = v108;
    if (v108)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v108, "jsonRepresentation");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = CFSTR("mapViewLocation");
      }
      else
      {
        objc_msgSend(v108, "dictionaryRepresentation");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = CFSTR("map_view_location");
      }
      v112 = v110;

      objc_msgSend(v4, "setObject:forKey:", v112, v111);
    }

    objc_msgSend((id)a1, "transit");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v113;
    if (v113)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v113, "jsonRepresentation");
      else
        objc_msgSend(v113, "dictionaryRepresentation");
      v115 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v115, CFSTR("transit"));
    }

    objc_msgSend((id)a1, "mapSettings");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    v117 = v116;
    if (v116)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v116, "jsonRepresentation");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = CFSTR("mapSettings");
      }
      else
      {
        objc_msgSend(v116, "dictionaryRepresentation");
        v118 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = CFSTR("map_settings");
      }
      v120 = v118;

      objc_msgSend(v4, "setObject:forKey:", v120, v119);
    }

    objc_msgSend((id)a1, "mapUi");
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = v121;
    if (v121)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v121, "jsonRepresentation");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = CFSTR("mapUi");
      }
      else
      {
        objc_msgSend(v121, "dictionaryRepresentation");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = CFSTR("map_ui");
      }
      v125 = v123;

      objc_msgSend(v4, "setObject:forKey:", v125, v124);
    }

    objc_msgSend((id)a1, "mapUiShown");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = v126;
    if (v126)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v126, "jsonRepresentation");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = CFSTR("mapUiShown");
      }
      else
      {
        objc_msgSend(v126, "dictionaryRepresentation");
        v128 = (void *)objc_claimAutoreleasedReturnValue();
        v129 = CFSTR("map_ui_shown");
      }
      v130 = v128;

      objc_msgSend(v4, "setObject:forKey:", v130, v129);
    }

    objc_msgSend((id)a1, "userSession");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v132 = v131;
    if (v131)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v131, "jsonRepresentation");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = CFSTR("userSession");
      }
      else
      {
        objc_msgSend(v131, "dictionaryRepresentation");
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        v134 = CFSTR("user_session");
      }
      v135 = v133;

      objc_msgSend(v4, "setObject:forKey:", v135, v134);
    }

    objc_msgSend((id)a1, "experiments");
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = v136;
    if (v136)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v136, "jsonRepresentation");
      else
        objc_msgSend(v136, "dictionaryRepresentation");
      v138 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v138, CFSTR("experiments"));
    }

    objc_msgSend((id)a1, "placeCard");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = v139;
    if (v139)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v139, "jsonRepresentation");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = CFSTR("placeCard");
      }
      else
      {
        objc_msgSend(v139, "dictionaryRepresentation");
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        v142 = CFSTR("place_card");
      }
      v143 = v141;

      objc_msgSend(v4, "setObject:forKey:", v143, v142);
    }

    objc_msgSend((id)a1, "route");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = v144;
    if (v144)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v144, "jsonRepresentation");
      else
        objc_msgSend(v144, "dictionaryRepresentation");
      v146 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v146, CFSTR("route"));
    }

    objc_msgSend((id)a1, "mapsServer");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = v147;
    if (v147)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v147, "jsonRepresentation");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = CFSTR("mapsServer");
      }
      else
      {
        objc_msgSend(v147, "dictionaryRepresentation");
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        v150 = CFSTR("maps_server");
      }
      v151 = v149;

      objc_msgSend(v4, "setObject:forKey:", v151, v150);
    }

    objc_msgSend((id)a1, "tileSet");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = v152;
    if (v152)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v152, "jsonRepresentation");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = CFSTR("tileSet");
      }
      else
      {
        objc_msgSend(v152, "dictionaryRepresentation");
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        v155 = CFSTR("tile_set");
      }
      v156 = v154;

      objc_msgSend(v4, "setObject:forKey:", v156, v155);
    }

    objc_msgSend((id)a1, "placeRequest");
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v157;
    if (v157)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v157, "jsonRepresentation");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = CFSTR("placeRequest");
      }
      else
      {
        objc_msgSend(v157, "dictionaryRepresentation");
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        v160 = CFSTR("place_request");
      }
      v161 = v159;

      objc_msgSend(v4, "setObject:forKey:", v161, v160);
    }

    objc_msgSend((id)a1, "navigation");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v162;
    if (v162)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v162, "jsonRepresentation");
      else
        objc_msgSend(v162, "dictionaryRepresentation");
      v164 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v164, CFSTR("navigation"));
    }

    objc_msgSend((id)a1, "mapRestore");
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = v165;
    if (v165)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v165, "jsonRepresentation");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = CFSTR("mapRestore");
      }
      else
      {
        objc_msgSend(v165, "dictionaryRepresentation");
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        v168 = CFSTR("map_restore");
      }
      v169 = v167;

      objc_msgSend(v4, "setObject:forKey:", v169, v168);
    }

    objc_msgSend((id)a1, "suggestions");
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = v170;
    if (v170)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v170, "jsonRepresentation");
      else
        objc_msgSend(v170, "dictionaryRepresentation");
      v172 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v172, CFSTR("suggestions"));
    }

    objc_msgSend((id)a1, "offline");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    v174 = v173;
    if (v173)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v173, "jsonRepresentation");
      else
        objc_msgSend(v173, "dictionaryRepresentation");
      v175 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v175, CFSTR("offline"));
    }

    objc_msgSend((id)a1, "summaryLookAroundLog");
    v176 = (void *)objc_claimAutoreleasedReturnValue();
    v177 = v176;
    if (v176)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v176, "jsonRepresentation");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v179 = CFSTR("summaryLookAroundLog");
      }
      else
      {
        objc_msgSend(v176, "dictionaryRepresentation");
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        v179 = CFSTR("summary_look_around_log");
      }
      v180 = v178;

      objc_msgSend(v4, "setObject:forKey:", v180, v179);
    }

    objc_msgSend((id)a1, "detailLookAroundLog");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = v181;
    if (v181)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v181, "jsonRepresentation");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = CFSTR("detailLookAroundLog");
      }
      else
      {
        objc_msgSend(v181, "dictionaryRepresentation");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        v184 = CFSTR("detail_look_around_log");
      }
      v185 = v183;

      objc_msgSend(v4, "setObject:forKey:", v185, v184);
    }

    objc_msgSend((id)a1, "lookAroundView");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = v186;
    if (v186)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v186, "jsonRepresentation");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = CFSTR("lookAroundView");
      }
      else
      {
        objc_msgSend(v186, "dictionaryRepresentation");
        v188 = (void *)objc_claimAutoreleasedReturnValue();
        v189 = CFSTR("look_around_view");
      }
      v190 = v188;

      objc_msgSend(v4, "setObject:forKey:", v190, v189);
    }

    objc_msgSend((id)a1, "muninResource");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    v192 = v191;
    if (v191)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v191, "jsonRepresentation");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = CFSTR("muninResource");
      }
      else
      {
        objc_msgSend(v191, "dictionaryRepresentation");
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        v194 = CFSTR("munin_resource");
      }
      v195 = v193;

      objc_msgSend(v4, "setObject:forKey:", v195, v194);
    }

    objc_msgSend((id)a1, "mapLaunch");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = v196;
    if (v196)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v196, "jsonRepresentation");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = CFSTR("mapLaunch");
      }
      else
      {
        objc_msgSend(v196, "dictionaryRepresentation");
        v198 = (void *)objc_claimAutoreleasedReturnValue();
        v199 = CFSTR("map_launch");
      }
      v200 = v198;

      objc_msgSend(v4, "setObject:forKey:", v200, v199);
    }

    objc_msgSend((id)a1, "curatedCollection");
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = v201;
    if (v201)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v201, "jsonRepresentation");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = CFSTR("curatedCollection");
      }
      else
      {
        objc_msgSend(v201, "dictionaryRepresentation");
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        v204 = CFSTR("curated_collection");
      }
      v205 = v203;

      objc_msgSend(v4, "setObject:forKey:", v205, v204);
    }

    objc_msgSend((id)a1, "ugcPhoto");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = v206;
    if (v206)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v206, "jsonRepresentation");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        v209 = CFSTR("ugcPhoto");
      }
      else
      {
        objc_msgSend(v206, "dictionaryRepresentation");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        v209 = CFSTR("ugc_photo");
      }
      v210 = v208;

      objc_msgSend(v4, "setObject:forKey:", v210, v209);
    }

    objc_msgSend((id)a1, "directionsDetail");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = v211;
    if (v211)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v211, "jsonRepresentation");
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = CFSTR("directionsDetail");
      }
      else
      {
        objc_msgSend(v211, "dictionaryRepresentation");
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v214 = CFSTR("directions_detail");
      }
      v215 = v213;

      objc_msgSend(v4, "setObject:forKey:", v215, v214);
    }

    objc_msgSend((id)a1, "market");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = v216;
    if (v216)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v216, "jsonRepresentation");
      else
        objc_msgSend(v216, "dictionaryRepresentation");
      v218 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v218, CFSTR("market"));
    }

    objc_msgSend((id)a1, "routingSettings");
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    v220 = v219;
    if (v219)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v219, "jsonRepresentation");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = CFSTR("routingSettings");
      }
      else
      {
        objc_msgSend(v219, "dictionaryRepresentation");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        v222 = CFSTR("routing_settings");
      }
      v223 = v221;

      objc_msgSend(v4, "setObject:forKey:", v223, v222);
    }

    objc_msgSend((id)a1, "mapsFeatures");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v225 = v224;
    if (v224)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v224, "jsonRepresentation");
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = CFSTR("mapsFeatures");
      }
      else
      {
        objc_msgSend(v224, "dictionaryRepresentation");
        v226 = (void *)objc_claimAutoreleasedReturnValue();
        v227 = CFSTR("maps_features");
      }
      v228 = v226;

      objc_msgSend(v4, "setObject:forKey:", v228, v227);
    }

    objc_msgSend((id)a1, "mapsUserSettings");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    v230 = v229;
    if (v229)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v229, "jsonRepresentation");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = CFSTR("mapsUserSettings");
      }
      else
      {
        objc_msgSend(v229, "dictionaryRepresentation");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        v232 = CFSTR("maps_user_settings");
      }
      v233 = v231;

      objc_msgSend(v4, "setObject:forKey:", v233, v232);
    }

    objc_msgSend((id)a1, "arpPhotoSubmission");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    v235 = v234;
    if (v234)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v234, "jsonRepresentation");
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = CFSTR("arpPhotoSubmission");
      }
      else
      {
        objc_msgSend(v234, "dictionaryRepresentation");
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = CFSTR("arp_photo_submission");
      }
      v238 = v236;

      objc_msgSend(v4, "setObject:forKey:", v238, v237);
    }

    objc_msgSend((id)a1, "arpRatingSubmission");
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    v240 = v239;
    if (v239)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v239, "jsonRepresentation");
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = CFSTR("arpRatingSubmission");
      }
      else
      {
        objc_msgSend(v239, "dictionaryRepresentation");
        v241 = (void *)objc_claimAutoreleasedReturnValue();
        v242 = CFSTR("arp_rating_submission");
      }
      v243 = v241;

      objc_msgSend(v4, "setObject:forKey:", v243, v242);
    }

    objc_msgSend((id)a1, "arpRatingPhotoSubmission");
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = v244;
    if (v244)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v244, "jsonRepresentation");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v247 = CFSTR("arpRatingPhotoSubmission");
      }
      else
      {
        objc_msgSend(v244, "dictionaryRepresentation");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v247 = CFSTR("arp_rating_photo_submission");
      }
      v248 = v246;

      objc_msgSend(v4, "setObject:forKey:", v248, v247);
    }

    objc_msgSend((id)a1, "mapsPlaceIds");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = v249;
    if (v249)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v249, "jsonRepresentation");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = CFSTR("mapsPlaceIds");
      }
      else
      {
        objc_msgSend(v249, "dictionaryRepresentation");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = CFSTR("maps_place_ids");
      }
      v253 = v251;

      objc_msgSend(v4, "setObject:forKey:", v253, v252);
    }

    objc_msgSend((id)a1, "placeCardRap");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    v255 = v254;
    if (v254)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v254, "jsonRepresentation");
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = CFSTR("placeCardRap");
      }
      else
      {
        objc_msgSend(v254, "dictionaryRepresentation");
        v256 = (void *)objc_claimAutoreleasedReturnValue();
        v257 = CFSTR("place_card_rap");
      }
      v258 = v256;

      objc_msgSend(v4, "setObject:forKey:", v258, v257);
    }

    objc_msgSend((id)a1, "offlineDownload");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v260 = v259;
    if (v259)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v259, "jsonRepresentation");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        v262 = CFSTR("offlineDownload");
      }
      else
      {
        objc_msgSend(v259, "dictionaryRepresentation");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        v262 = CFSTR("offline_download");
      }
      v263 = v261;

      objc_msgSend(v4, "setObject:forKey:", v263, v262);
    }

    v264 = v4;
  }
  else
  {
    v264 = 0;
  }
  return v264;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgState _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgState)initWithDictionary:(id)a3
{
  return (GEOLogMsgState *)-[GEOLogMsgState _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOLogMsgStateUser *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  GEOLogMsgStateAccount *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOLogMsgStateRAP *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEOLogMsgStatePlaceSummaryLayout *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEOLogMsgStateTransitStep *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  GEOLogMsgStateNearbyTransit *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEOLogMsgStateSearchResults *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  GEOLogMsgStateElementImpression *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  GEOLogMsgStateImpressionObject *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  GEOLogMsgStateTapEvent *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  GEOLogMsgStateActionButtonDetails *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  GEOLogMsgStateRoutingWaypoints *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  uint64_t v67;
  const __CFString *v68;
  void *v69;
  GEOLogMsgStateDeviceIdentifier *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  GEOLogMsgStateApplicationIdentifier *v75;
  uint64_t v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  GEOLogMsgStateDeviceBase *v80;
  uint64_t v81;
  void *v82;
  const __CFString *v83;
  void *v84;
  GEOLogMsgStateDeviceLocale *v85;
  uint64_t v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  GEOLogMsgStateDeviceConnection *v90;
  uint64_t v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  GEOLogMsgStateCarPlay *v95;
  uint64_t v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  GEOLogMsgStatePairedDevice *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  GEOLogMsgStateExtension *v104;
  uint64_t v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  GEOLogMsgStateDeviceSettings *v109;
  uint64_t v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  GEOLogMsgStateMapView *v114;
  uint64_t v115;
  void *v116;
  const __CFString *v117;
  void *v118;
  GEOLogMsgStateMapViewLocation *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  GEOLogMsgStateTransit *v123;
  uint64_t v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  GEOLogMsgStateMapSettings *v128;
  uint64_t v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  GEOLogMsgStateMapUI *v133;
  uint64_t v134;
  void *v135;
  const __CFString *v136;
  void *v137;
  GEOLogMsgStateMapUIShown *v138;
  uint64_t v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  GEOLogMsgStateUserSession *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  GEOLogMsgStateExperiments *v147;
  uint64_t v148;
  void *v149;
  const __CFString *v150;
  void *v151;
  GEOLogMsgStatePlaceCard *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  GEOLogMsgStateRoute *v156;
  uint64_t v157;
  void *v158;
  const __CFString *v159;
  void *v160;
  GEOLogMsgStateMapsServer *v161;
  uint64_t v162;
  void *v163;
  const __CFString *v164;
  void *v165;
  GEOLogMsgStateTileSet *v166;
  uint64_t v167;
  void *v168;
  const __CFString *v169;
  void *v170;
  GEOLogMsgStatePlaceRequest *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  GEOLogMsgStateNavigation *v175;
  uint64_t v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  GEOLogMsgStateMapRestore *v180;
  uint64_t v181;
  void *v182;
  void *v183;
  GEOLogMsgStateSuggestions *v184;
  uint64_t v185;
  void *v186;
  void *v187;
  GEOLogMsgStateOffline *v188;
  uint64_t v189;
  void *v190;
  const __CFString *v191;
  void *v192;
  GEOLogMsgStateSummaryLookAroundLog *v193;
  uint64_t v194;
  void *v195;
  const __CFString *v196;
  void *v197;
  GEOLogMsgStateDetailLookAroundLog *v198;
  uint64_t v199;
  void *v200;
  const __CFString *v201;
  void *v202;
  GEOLogMsgStateLookAroundView *v203;
  uint64_t v204;
  void *v205;
  const __CFString *v206;
  void *v207;
  GEOLogMsgStateMuninResource *v208;
  uint64_t v209;
  void *v210;
  const __CFString *v211;
  void *v212;
  GEOLogMsgStateMapLaunch *v213;
  uint64_t v214;
  void *v215;
  const __CFString *v216;
  void *v217;
  GEOLogMsgStateCuratedCollection *v218;
  uint64_t v219;
  void *v220;
  const __CFString *v221;
  void *v222;
  GEOLogMsgStateUGCPhoto *v223;
  uint64_t v224;
  void *v225;
  const __CFString *v226;
  void *v227;
  GEOLogMsgStateDirectionsDetail *v228;
  uint64_t v229;
  void *v230;
  void *v231;
  GEOLogMsgStateMarket *v232;
  uint64_t v233;
  void *v234;
  const __CFString *v235;
  void *v236;
  GEOLogMsgStateRoutingSettings *v237;
  uint64_t v238;
  void *v239;
  const __CFString *v240;
  void *v241;
  GEOLogMsgStateMapsFeatures *v242;
  uint64_t v243;
  void *v244;
  const __CFString *v245;
  void *v246;
  GEOLogMsgStateMapsUserSettings *v247;
  uint64_t v248;
  void *v249;
  const __CFString *v250;
  void *v251;
  GEOLogMsgStateARPPhotoSubmission *v252;
  uint64_t v253;
  void *v254;
  const __CFString *v255;
  void *v256;
  GEOLogMsgStateARPRatingSubmission *v257;
  uint64_t v258;
  void *v259;
  const __CFString *v260;
  void *v261;
  GEOLogMsgStateARPRatingPhotoSubmission *v262;
  uint64_t v263;
  void *v264;
  const __CFString *v265;
  void *v266;
  GEOLogMsgStateMapsPlaceIds *v267;
  uint64_t v268;
  void *v269;
  const __CFString *v270;
  void *v271;
  GEOLogMsgStatePlaceCardRap *v272;
  uint64_t v273;
  void *v274;
  const __CFString *v275;
  void *v276;
  GEOLogMsgStateOfflineDownload *v277;
  uint64_t v278;
  void *v279;

  v5 = a2;
  if (!a1)
    goto LABEL_547;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_547;
  if (a3)
    v6 = CFSTR("stateOrigin");
  else
    v6 = CFSTR("state_origin");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setStateOrigin:", v8);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("user"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOLogMsgStateUser alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOLogMsgStateUser initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOLogMsgStateUser initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setUser:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("account"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOLogMsgStateAccount alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOLogMsgStateAccount initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOLogMsgStateAccount initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setAccount:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("rap"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOLogMsgStateRAP alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOLogMsgStateRAP initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOLogMsgStateRAP initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setRap:", v19);

  }
  if (a3)
    v21 = CFSTR("placeSummaryLayout");
  else
    v21 = CFSTR("place_summary_layout");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEOLogMsgStatePlaceSummaryLayout alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEOLogMsgStatePlaceSummaryLayout initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEOLogMsgStatePlaceSummaryLayout initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = (void *)v24;
    objc_msgSend(a1, "setPlaceSummaryLayout:", v24);

  }
  if (a3)
    v26 = CFSTR("transitStep");
  else
    v26 = CFSTR("transit_step");
  objc_msgSend(v5, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = [GEOLogMsgStateTransitStep alloc];
    if ((a3 & 1) != 0)
      v29 = -[GEOLogMsgStateTransitStep initWithJSON:](v28, "initWithJSON:", v27);
    else
      v29 = -[GEOLogMsgStateTransitStep initWithDictionary:](v28, "initWithDictionary:", v27);
    v30 = (void *)v29;
    objc_msgSend(a1, "setTransitStep:", v29);

  }
  if (a3)
    v31 = CFSTR("nearbyTransit");
  else
    v31 = CFSTR("nearby_transit");
  objc_msgSend(v5, "objectForKeyedSubscript:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v33 = [GEOLogMsgStateNearbyTransit alloc];
    if ((a3 & 1) != 0)
      v34 = -[GEOLogMsgStateNearbyTransit initWithJSON:](v33, "initWithJSON:", v32);
    else
      v34 = -[GEOLogMsgStateNearbyTransit initWithDictionary:](v33, "initWithDictionary:", v32);
    v35 = (void *)v34;
    objc_msgSend(a1, "setNearbyTransit:", v34);

  }
  if (a3)
    v36 = CFSTR("searchResults");
  else
    v36 = CFSTR("search_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = [GEOLogMsgStateSearchResults alloc];
    if ((a3 & 1) != 0)
      v39 = -[GEOLogMsgStateSearchResults initWithJSON:](v38, "initWithJSON:", v37);
    else
      v39 = -[GEOLogMsgStateSearchResults initWithDictionary:](v38, "initWithDictionary:", v37);
    v40 = (void *)v39;
    objc_msgSend(a1, "setSearchResults:", v39);

  }
  if (a3)
    v41 = CFSTR("elementImpression");
  else
    v41 = CFSTR("element_impression");
  objc_msgSend(v5, "objectForKeyedSubscript:", v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = [GEOLogMsgStateElementImpression alloc];
    if ((a3 & 1) != 0)
      v44 = -[GEOLogMsgStateElementImpression initWithJSON:](v43, "initWithJSON:", v42);
    else
      v44 = -[GEOLogMsgStateElementImpression initWithDictionary:](v43, "initWithDictionary:", v42);
    v45 = (void *)v44;
    objc_msgSend(a1, "setElementImpression:", v44);

  }
  if (a3)
    v46 = CFSTR("impressionObject");
  else
    v46 = CFSTR("impression_object");
  objc_msgSend(v5, "objectForKeyedSubscript:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v48 = [GEOLogMsgStateImpressionObject alloc];
    if ((a3 & 1) != 0)
      v49 = -[GEOLogMsgStateImpressionObject initWithJSON:](v48, "initWithJSON:", v47);
    else
      v49 = -[GEOLogMsgStateImpressionObject initWithDictionary:](v48, "initWithDictionary:", v47);
    v50 = (void *)v49;
    objc_msgSend(a1, "setImpressionObject:", v49);

  }
  if (a3)
    v51 = CFSTR("tapEvent");
  else
    v51 = CFSTR("tap_event");
  objc_msgSend(v5, "objectForKeyedSubscript:", v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v53 = [GEOLogMsgStateTapEvent alloc];
    if ((a3 & 1) != 0)
      v54 = -[GEOLogMsgStateTapEvent initWithJSON:](v53, "initWithJSON:", v52);
    else
      v54 = -[GEOLogMsgStateTapEvent initWithDictionary:](v53, "initWithDictionary:", v52);
    v55 = (void *)v54;
    objc_msgSend(a1, "setTapEvent:", v54);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("actionButtonDetails"));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v57 = [GEOLogMsgStateActionButtonDetails alloc];
    if ((a3 & 1) != 0)
      v58 = -[GEOLogMsgStateActionButtonDetails initWithJSON:](v57, "initWithJSON:", v56);
    else
      v58 = -[GEOLogMsgStateActionButtonDetails initWithDictionary:](v57, "initWithDictionary:", v56);
    v59 = (void *)v58;
    objc_msgSend(a1, "setActionButtonDetails:", v58);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("routingWaypoints"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v61 = [GEOLogMsgStateRoutingWaypoints alloc];
    if ((a3 & 1) != 0)
      v62 = -[GEOLogMsgStateRoutingWaypoints initWithJSON:](v61, "initWithJSON:", v60);
    else
      v62 = -[GEOLogMsgStateRoutingWaypoints initWithDictionary:](v61, "initWithDictionary:", v60);
    v63 = (void *)v62;
    objc_msgSend(a1, "setRoutingWaypoints:", v62);

  }
  if (a3)
    v64 = CFSTR("stateType");
  else
    v64 = CFSTR("state_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v66 = v65;
    if ((objc_msgSend(v66, "isEqualToString:", CFSTR("LOG_MSG_STATE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v67 = 0;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAPS_USER")) & 1) != 0)
    {
      v67 = 2;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("ACCOUNT")) & 1) != 0)
    {
      v67 = 3;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("RAP")) & 1) != 0)
    {
      v67 = 4;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PLACE_SUMMARY_LAYOUT")) & 1) != 0)
    {
      v67 = 5;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("TRANSIT_STEP")) & 1) != 0)
    {
      v67 = 6;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("NEARBY_TRANSIT")) & 1) != 0)
    {
      v67 = 7;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("SEARCH_RESULTS")) & 1) != 0)
    {
      v67 = 8;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("ELEMENT_IMPRESSION")) & 1) != 0)
    {
      v67 = 9;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("IMPRESSION_OBJECT")) & 1) != 0)
    {
      v67 = 10;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("TAP_EVENT")) & 1) != 0)
    {
      v67 = 11;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("ACTION_BUTTON_DETAILS")) & 1) != 0)
    {
      v67 = 12;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("ROUTING_WAYPOINTS")) & 1) != 0)
    {
      v67 = 13;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DEVICE_IDENTIFIER")) & 1) != 0)
    {
      v67 = 201;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("APPLICATION_IDENTIFIER")) & 1) != 0)
    {
      v67 = 301;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DEVICE_BASE")) & 1) != 0)
    {
      v67 = 401;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DEVICE_LOCALE")) & 1) != 0)
    {
      v67 = 402;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DEVICE_CONNECTION")) & 1) != 0)
    {
      v67 = 403;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("CAR_PLAY")) & 1) != 0)
    {
      v67 = 404;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PAIRED_DEVICE")) & 1) != 0)
    {
      v67 = 405;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("EXTENSION")) & 1) != 0)
    {
      v67 = 406;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DEVICE_SETTINGS")) & 1) != 0)
    {
      v67 = 407;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAP_VIEW")) & 1) != 0)
    {
      v67 = 501;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAP_VIEW_LOCATION")) & 1) != 0)
    {
      v67 = 502;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v67 = 503;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAP_SETTINGS")) & 1) != 0)
    {
      v67 = 504;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAP_UI")) & 1) != 0)
    {
      v67 = 505;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAP_UI_SHOWN")) & 1) != 0)
    {
      v67 = 506;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("USER_SESSION")) & 1) != 0)
    {
      v67 = 601;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("EXPERIMENTS")) & 1) != 0)
    {
      v67 = 602;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PLACE_CARD")) & 1) != 0)
    {
      v67 = 702;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("ROUTE")) & 1) != 0)
    {
      v67 = 703;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("FLYOVER")) & 1) != 0)
    {
      v67 = 704;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAPS_SERVER")) & 1) != 0)
    {
      v67 = 705;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("TILE_SET")) & 1) != 0)
    {
      v67 = 706;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PLACE_REQUEST")) & 1) != 0)
    {
      v67 = 707;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("NAVIGATION")) & 1) != 0)
    {
      v67 = 708;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAP_RESTORE")) & 1) != 0)
    {
      v67 = 709;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("SUGGESTIONS")) & 1) != 0)
    {
      v67 = 710;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("REPORT_AN_ISSUE")) & 1) != 0)
    {
      v67 = 711;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("REALTIME_TRAFFIC")) & 1) != 0)
    {
      v67 = 712;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("OFFLINE")) & 1) != 0)
    {
      v67 = 713;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("SUMMARY_LOOK_AROUND_LOG")) & 1) != 0)
    {
      v67 = 714;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DETAIL_LOOK_AROUND_LOG")) & 1) != 0)
    {
      v67 = 715;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW")) & 1) != 0)
    {
      v67 = 716;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MUNIN_RESOURCE_LOG")) & 1) != 0)
    {
      v67 = 717;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAPS_LAUNCH")) & 1) != 0)
    {
      v67 = 718;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("CURATED_COLLECTION")) & 1) != 0)
    {
      v67 = 719;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("UGC_PHOTO")) & 1) != 0)
    {
      v67 = 720;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("DIRECTIONS_DETAIL")) & 1) != 0)
    {
      v67 = 721;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MARKET")) & 1) != 0)
    {
      v67 = 722;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("ROUTING_SETTINGS")) & 1) != 0)
    {
      v67 = 723;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAPS_FEATURES")) & 1) != 0)
    {
      v67 = 724;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAPS_USER_SETTINGS")) & 1) != 0)
    {
      v67 = 725;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PHOTO_SUBMISSION")) & 1) != 0)
    {
      v67 = 726;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("RATING_SUBMISSION")) & 1) != 0)
    {
      v67 = 727;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("RATING_PHOTO_SUBMISSION")) & 1) != 0)
    {
      v67 = 728;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("MAPS_PLACE_IDS")) & 1) != 0)
    {
      v67 = 729;
    }
    else if ((objc_msgSend(v66, "isEqualToString:", CFSTR("PLACE_CARD_RAP")) & 1) != 0)
    {
      v67 = 730;
    }
    else if (objc_msgSend(v66, "isEqualToString:", CFSTR("OFFLINE_DOWNLOAD")))
    {
      v67 = 731;
    }
    else
    {
      v67 = 0;
    }

    goto LABEL_217;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v67 = objc_msgSend(v65, "intValue");
LABEL_217:
    objc_msgSend(a1, "setStateType:", v67);
  }

  if (a3)
    v68 = CFSTR("deviceIdentifier");
  else
    v68 = CFSTR("device_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v70 = [GEOLogMsgStateDeviceIdentifier alloc];
    if ((a3 & 1) != 0)
      v71 = -[GEOLogMsgStateDeviceIdentifier initWithJSON:](v70, "initWithJSON:", v69);
    else
      v71 = -[GEOLogMsgStateDeviceIdentifier initWithDictionary:](v70, "initWithDictionary:", v69);
    v72 = (void *)v71;
    objc_msgSend(a1, "setDeviceIdentifier:", v71);

  }
  if (a3)
    v73 = CFSTR("applicationIdentifier");
  else
    v73 = CFSTR("application_identifier");
  objc_msgSend(v5, "objectForKeyedSubscript:", v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v75 = [GEOLogMsgStateApplicationIdentifier alloc];
    if ((a3 & 1) != 0)
      v76 = -[GEOLogMsgStateApplicationIdentifier initWithJSON:](v75, "initWithJSON:", v74);
    else
      v76 = -[GEOLogMsgStateApplicationIdentifier initWithDictionary:](v75, "initWithDictionary:", v74);
    v77 = (void *)v76;
    objc_msgSend(a1, "setApplicationIdentifier:", v76);

  }
  if (a3)
    v78 = CFSTR("deviceBase");
  else
    v78 = CFSTR("device_base");
  objc_msgSend(v5, "objectForKeyedSubscript:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v80 = [GEOLogMsgStateDeviceBase alloc];
    if ((a3 & 1) != 0)
      v81 = -[GEOLogMsgStateDeviceBase initWithJSON:](v80, "initWithJSON:", v79);
    else
      v81 = -[GEOLogMsgStateDeviceBase initWithDictionary:](v80, "initWithDictionary:", v79);
    v82 = (void *)v81;
    objc_msgSend(a1, "setDeviceBase:", v81);

  }
  if (a3)
    v83 = CFSTR("deviceLocale");
  else
    v83 = CFSTR("device_locale");
  objc_msgSend(v5, "objectForKeyedSubscript:", v83);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v85 = [GEOLogMsgStateDeviceLocale alloc];
    if ((a3 & 1) != 0)
      v86 = -[GEOLogMsgStateDeviceLocale initWithJSON:](v85, "initWithJSON:", v84);
    else
      v86 = -[GEOLogMsgStateDeviceLocale initWithDictionary:](v85, "initWithDictionary:", v84);
    v87 = (void *)v86;
    objc_msgSend(a1, "setDeviceLocale:", v86);

  }
  if (a3)
    v88 = CFSTR("deviceConnection");
  else
    v88 = CFSTR("device_connection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = [GEOLogMsgStateDeviceConnection alloc];
    if ((a3 & 1) != 0)
      v91 = -[GEOLogMsgStateDeviceConnection initWithJSON:](v90, "initWithJSON:", v89);
    else
      v91 = -[GEOLogMsgStateDeviceConnection initWithDictionary:](v90, "initWithDictionary:", v89);
    v92 = (void *)v91;
    objc_msgSend(a1, "setDeviceConnection:", v91);

  }
  if (a3)
    v93 = CFSTR("carPlay");
  else
    v93 = CFSTR("car_play");
  objc_msgSend(v5, "objectForKeyedSubscript:", v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v95 = [GEOLogMsgStateCarPlay alloc];
    if ((a3 & 1) != 0)
      v96 = -[GEOLogMsgStateCarPlay initWithJSON:](v95, "initWithJSON:", v94);
    else
      v96 = -[GEOLogMsgStateCarPlay initWithDictionary:](v95, "initWithDictionary:", v94);
    v97 = (void *)v96;
    objc_msgSend(a1, "setCarPlay:", v96);

  }
  if (a3)
    v98 = CFSTR("pairedDevice");
  else
    v98 = CFSTR("paired_device");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v100 = [GEOLogMsgStatePairedDevice alloc];
    if ((a3 & 1) != 0)
      v101 = -[GEOLogMsgStatePairedDevice initWithJSON:](v100, "initWithJSON:", v99);
    else
      v101 = -[GEOLogMsgStatePairedDevice initWithDictionary:](v100, "initWithDictionary:", v99);
    v102 = (void *)v101;
    objc_msgSend(a1, "setPairedDevice:", v101);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("extension"));
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v104 = [GEOLogMsgStateExtension alloc];
    if ((a3 & 1) != 0)
      v105 = -[GEOLogMsgStateExtension initWithJSON:](v104, "initWithJSON:", v103);
    else
      v105 = -[GEOLogMsgStateExtension initWithDictionary:](v104, "initWithDictionary:", v103);
    v106 = (void *)v105;
    objc_msgSend(a1, "setExtension:", v105);

  }
  if (a3)
    v107 = CFSTR("deviceSettings");
  else
    v107 = CFSTR("device_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v109 = [GEOLogMsgStateDeviceSettings alloc];
    if ((a3 & 1) != 0)
      v110 = -[GEOLogMsgStateDeviceSettings initWithJSON:](v109, "initWithJSON:", v108);
    else
      v110 = -[GEOLogMsgStateDeviceSettings initWithDictionary:](v109, "initWithDictionary:", v108);
    v111 = (void *)v110;
    objc_msgSend(a1, "setDeviceSettings:", v110);

  }
  if (a3)
    v112 = CFSTR("mapView");
  else
    v112 = CFSTR("map_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v112);
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v114 = [GEOLogMsgStateMapView alloc];
    if ((a3 & 1) != 0)
      v115 = -[GEOLogMsgStateMapView initWithJSON:](v114, "initWithJSON:", v113);
    else
      v115 = -[GEOLogMsgStateMapView initWithDictionary:](v114, "initWithDictionary:", v113);
    v116 = (void *)v115;
    objc_msgSend(a1, "setMapView:", v115);

  }
  if (a3)
    v117 = CFSTR("mapViewLocation");
  else
    v117 = CFSTR("map_view_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v119 = [GEOLogMsgStateMapViewLocation alloc];
    if ((a3 & 1) != 0)
      v120 = -[GEOLogMsgStateMapViewLocation initWithJSON:](v119, "initWithJSON:", v118);
    else
      v120 = -[GEOLogMsgStateMapViewLocation initWithDictionary:](v119, "initWithDictionary:", v118);
    v121 = (void *)v120;
    objc_msgSend(a1, "setMapViewLocation:", v120);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("transit"));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v123 = [GEOLogMsgStateTransit alloc];
    if ((a3 & 1) != 0)
      v124 = -[GEOLogMsgStateTransit initWithJSON:](v123, "initWithJSON:", v122);
    else
      v124 = -[GEOLogMsgStateTransit initWithDictionary:](v123, "initWithDictionary:", v122);
    v125 = (void *)v124;
    objc_msgSend(a1, "setTransit:", v124);

  }
  if (a3)
    v126 = CFSTR("mapSettings");
  else
    v126 = CFSTR("map_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v128 = [GEOLogMsgStateMapSettings alloc];
    if ((a3 & 1) != 0)
      v129 = -[GEOLogMsgStateMapSettings initWithJSON:](v128, "initWithJSON:", v127);
    else
      v129 = -[GEOLogMsgStateMapSettings initWithDictionary:](v128, "initWithDictionary:", v127);
    v130 = (void *)v129;
    objc_msgSend(a1, "setMapSettings:", v129);

  }
  if (a3)
    v131 = CFSTR("mapUi");
  else
    v131 = CFSTR("map_ui");
  objc_msgSend(v5, "objectForKeyedSubscript:", v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v133 = [GEOLogMsgStateMapUI alloc];
    if ((a3 & 1) != 0)
      v134 = -[GEOLogMsgStateMapUI initWithJSON:](v133, "initWithJSON:", v132);
    else
      v134 = -[GEOLogMsgStateMapUI initWithDictionary:](v133, "initWithDictionary:", v132);
    v135 = (void *)v134;
    objc_msgSend(a1, "setMapUi:", v134);

  }
  if (a3)
    v136 = CFSTR("mapUiShown");
  else
    v136 = CFSTR("map_ui_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v138 = [GEOLogMsgStateMapUIShown alloc];
    if ((a3 & 1) != 0)
      v139 = -[GEOLogMsgStateMapUIShown initWithJSON:](v138, "initWithJSON:", v137);
    else
      v139 = -[GEOLogMsgStateMapUIShown initWithDictionary:](v138, "initWithDictionary:", v137);
    v140 = (void *)v139;
    objc_msgSend(a1, "setMapUiShown:", v139);

  }
  if (a3)
    v141 = CFSTR("userSession");
  else
    v141 = CFSTR("user_session");
  objc_msgSend(v5, "objectForKeyedSubscript:", v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v143 = [GEOLogMsgStateUserSession alloc];
    if ((a3 & 1) != 0)
      v144 = -[GEOLogMsgStateUserSession initWithJSON:](v143, "initWithJSON:", v142);
    else
      v144 = -[GEOLogMsgStateUserSession initWithDictionary:](v143, "initWithDictionary:", v142);
    v145 = (void *)v144;
    objc_msgSend(a1, "setUserSession:", v144);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("experiments"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v147 = [GEOLogMsgStateExperiments alloc];
    if ((a3 & 1) != 0)
      v148 = -[GEOLogMsgStateExperiments initWithJSON:](v147, "initWithJSON:", v146);
    else
      v148 = -[GEOLogMsgStateExperiments initWithDictionary:](v147, "initWithDictionary:", v146);
    v149 = (void *)v148;
    objc_msgSend(a1, "setExperiments:", v148);

  }
  if (a3)
    v150 = CFSTR("placeCard");
  else
    v150 = CFSTR("place_card");
  objc_msgSend(v5, "objectForKeyedSubscript:", v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v152 = [GEOLogMsgStatePlaceCard alloc];
    if ((a3 & 1) != 0)
      v153 = -[GEOLogMsgStatePlaceCard initWithJSON:](v152, "initWithJSON:", v151);
    else
      v153 = -[GEOLogMsgStatePlaceCard initWithDictionary:](v152, "initWithDictionary:", v151);
    v154 = (void *)v153;
    objc_msgSend(a1, "setPlaceCard:", v153);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("route"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v156 = [GEOLogMsgStateRoute alloc];
    if ((a3 & 1) != 0)
      v157 = -[GEOLogMsgStateRoute initWithJSON:](v156, "initWithJSON:", v155);
    else
      v157 = -[GEOLogMsgStateRoute initWithDictionary:](v156, "initWithDictionary:", v155);
    v158 = (void *)v157;
    objc_msgSend(a1, "setRoute:", v157);

  }
  if (a3)
    v159 = CFSTR("mapsServer");
  else
    v159 = CFSTR("maps_server");
  objc_msgSend(v5, "objectForKeyedSubscript:", v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v161 = [GEOLogMsgStateMapsServer alloc];
    if ((a3 & 1) != 0)
      v162 = -[GEOLogMsgStateMapsServer initWithJSON:](v161, "initWithJSON:", v160);
    else
      v162 = -[GEOLogMsgStateMapsServer initWithDictionary:](v161, "initWithDictionary:", v160);
    v163 = (void *)v162;
    objc_msgSend(a1, "setMapsServer:", v162);

  }
  if (a3)
    v164 = CFSTR("tileSet");
  else
    v164 = CFSTR("tile_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v164);
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v166 = [GEOLogMsgStateTileSet alloc];
    if ((a3 & 1) != 0)
      v167 = -[GEOLogMsgStateTileSet initWithJSON:](v166, "initWithJSON:", v165);
    else
      v167 = -[GEOLogMsgStateTileSet initWithDictionary:](v166, "initWithDictionary:", v165);
    v168 = (void *)v167;
    objc_msgSend(a1, "setTileSet:", v167);

  }
  if (a3)
    v169 = CFSTR("placeRequest");
  else
    v169 = CFSTR("place_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v169);
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v171 = [GEOLogMsgStatePlaceRequest alloc];
    if ((a3 & 1) != 0)
      v172 = -[GEOLogMsgStatePlaceRequest initWithJSON:](v171, "initWithJSON:", v170);
    else
      v172 = -[GEOLogMsgStatePlaceRequest initWithDictionary:](v171, "initWithDictionary:", v170);
    v173 = (void *)v172;
    objc_msgSend(a1, "setPlaceRequest:", v172);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("navigation"));
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v175 = [GEOLogMsgStateNavigation alloc];
    if ((a3 & 1) != 0)
      v176 = -[GEOLogMsgStateNavigation initWithJSON:](v175, "initWithJSON:", v174);
    else
      v176 = -[GEOLogMsgStateNavigation initWithDictionary:](v175, "initWithDictionary:", v174);
    v177 = (void *)v176;
    objc_msgSend(a1, "setNavigation:", v176);

  }
  if (a3)
    v178 = CFSTR("mapRestore");
  else
    v178 = CFSTR("map_restore");
  objc_msgSend(v5, "objectForKeyedSubscript:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = [GEOLogMsgStateMapRestore alloc];
    if ((a3 & 1) != 0)
      v181 = -[GEOLogMsgStateMapRestore initWithJSON:](v180, "initWithJSON:", v179);
    else
      v181 = -[GEOLogMsgStateMapRestore initWithDictionary:](v180, "initWithDictionary:", v179);
    v182 = (void *)v181;
    objc_msgSend(a1, "setMapRestore:", v181);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("suggestions"));
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v184 = [GEOLogMsgStateSuggestions alloc];
    if ((a3 & 1) != 0)
      v185 = -[GEOLogMsgStateSuggestions initWithJSON:](v184, "initWithJSON:", v183);
    else
      v185 = -[GEOLogMsgStateSuggestions initWithDictionary:](v184, "initWithDictionary:", v183);
    v186 = (void *)v185;
    objc_msgSend(a1, "setSuggestions:", v185);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("offline"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v188 = [GEOLogMsgStateOffline alloc];
    if ((a3 & 1) != 0)
      v189 = -[GEOLogMsgStateOffline initWithJSON:](v188, "initWithJSON:", v187);
    else
      v189 = -[GEOLogMsgStateOffline initWithDictionary:](v188, "initWithDictionary:", v187);
    v190 = (void *)v189;
    objc_msgSend(a1, "setOffline:", v189);

  }
  if (a3)
    v191 = CFSTR("summaryLookAroundLog");
  else
    v191 = CFSTR("summary_look_around_log");
  objc_msgSend(v5, "objectForKeyedSubscript:", v191);
  v192 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v193 = [GEOLogMsgStateSummaryLookAroundLog alloc];
    if ((a3 & 1) != 0)
      v194 = -[GEOLogMsgStateSummaryLookAroundLog initWithJSON:](v193, "initWithJSON:", v192);
    else
      v194 = -[GEOLogMsgStateSummaryLookAroundLog initWithDictionary:](v193, "initWithDictionary:", v192);
    v195 = (void *)v194;
    objc_msgSend(a1, "setSummaryLookAroundLog:", v194);

  }
  if (a3)
    v196 = CFSTR("detailLookAroundLog");
  else
    v196 = CFSTR("detail_look_around_log");
  objc_msgSend(v5, "objectForKeyedSubscript:", v196);
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v198 = [GEOLogMsgStateDetailLookAroundLog alloc];
    if ((a3 & 1) != 0)
      v199 = -[GEOLogMsgStateDetailLookAroundLog initWithJSON:](v198, "initWithJSON:", v197);
    else
      v199 = -[GEOLogMsgStateDetailLookAroundLog initWithDictionary:](v198, "initWithDictionary:", v197);
    v200 = (void *)v199;
    objc_msgSend(a1, "setDetailLookAroundLog:", v199);

  }
  if (a3)
    v201 = CFSTR("lookAroundView");
  else
    v201 = CFSTR("look_around_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v203 = [GEOLogMsgStateLookAroundView alloc];
    if ((a3 & 1) != 0)
      v204 = -[GEOLogMsgStateLookAroundView initWithJSON:](v203, "initWithJSON:", v202);
    else
      v204 = -[GEOLogMsgStateLookAroundView initWithDictionary:](v203, "initWithDictionary:", v202);
    v205 = (void *)v204;
    objc_msgSend(a1, "setLookAroundView:", v204);

  }
  if (a3)
    v206 = CFSTR("muninResource");
  else
    v206 = CFSTR("munin_resource");
  objc_msgSend(v5, "objectForKeyedSubscript:", v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v208 = [GEOLogMsgStateMuninResource alloc];
    if ((a3 & 1) != 0)
      v209 = -[GEOLogMsgStateMuninResource initWithJSON:](v208, "initWithJSON:", v207);
    else
      v209 = -[GEOLogMsgStateMuninResource initWithDictionary:](v208, "initWithDictionary:", v207);
    v210 = (void *)v209;
    objc_msgSend(a1, "setMuninResource:", v209);

  }
  if (a3)
    v211 = CFSTR("mapLaunch");
  else
    v211 = CFSTR("map_launch");
  objc_msgSend(v5, "objectForKeyedSubscript:", v211);
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v213 = [GEOLogMsgStateMapLaunch alloc];
    if ((a3 & 1) != 0)
      v214 = -[GEOLogMsgStateMapLaunch initWithJSON:](v213, "initWithJSON:", v212);
    else
      v214 = -[GEOLogMsgStateMapLaunch initWithDictionary:](v213, "initWithDictionary:", v212);
    v215 = (void *)v214;
    objc_msgSend(a1, "setMapLaunch:", v214);

  }
  if (a3)
    v216 = CFSTR("curatedCollection");
  else
    v216 = CFSTR("curated_collection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v218 = [GEOLogMsgStateCuratedCollection alloc];
    if ((a3 & 1) != 0)
      v219 = -[GEOLogMsgStateCuratedCollection initWithJSON:](v218, "initWithJSON:", v217);
    else
      v219 = -[GEOLogMsgStateCuratedCollection initWithDictionary:](v218, "initWithDictionary:", v217);
    v220 = (void *)v219;
    objc_msgSend(a1, "setCuratedCollection:", v219);

  }
  if (a3)
    v221 = CFSTR("ugcPhoto");
  else
    v221 = CFSTR("ugc_photo");
  objc_msgSend(v5, "objectForKeyedSubscript:", v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v223 = [GEOLogMsgStateUGCPhoto alloc];
    if ((a3 & 1) != 0)
      v224 = -[GEOLogMsgStateUGCPhoto initWithJSON:](v223, "initWithJSON:", v222);
    else
      v224 = -[GEOLogMsgStateUGCPhoto initWithDictionary:](v223, "initWithDictionary:", v222);
    v225 = (void *)v224;
    objc_msgSend(a1, "setUgcPhoto:", v224);

  }
  if (a3)
    v226 = CFSTR("directionsDetail");
  else
    v226 = CFSTR("directions_detail");
  objc_msgSend(v5, "objectForKeyedSubscript:", v226);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v228 = [GEOLogMsgStateDirectionsDetail alloc];
    if ((a3 & 1) != 0)
      v229 = -[GEOLogMsgStateDirectionsDetail initWithJSON:](v228, "initWithJSON:", v227);
    else
      v229 = -[GEOLogMsgStateDirectionsDetail initWithDictionary:](v228, "initWithDictionary:", v227);
    v230 = (void *)v229;
    objc_msgSend(a1, "setDirectionsDetail:", v229);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("market"));
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v232 = [GEOLogMsgStateMarket alloc];
    if ((a3 & 1) != 0)
      v233 = -[GEOLogMsgStateMarket initWithJSON:](v232, "initWithJSON:", v231);
    else
      v233 = -[GEOLogMsgStateMarket initWithDictionary:](v232, "initWithDictionary:", v231);
    v234 = (void *)v233;
    objc_msgSend(a1, "setMarket:", v233);

  }
  if (a3)
    v235 = CFSTR("routingSettings");
  else
    v235 = CFSTR("routing_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v235);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v237 = [GEOLogMsgStateRoutingSettings alloc];
    if ((a3 & 1) != 0)
      v238 = -[GEOLogMsgStateRoutingSettings initWithJSON:](v237, "initWithJSON:", v236);
    else
      v238 = -[GEOLogMsgStateRoutingSettings initWithDictionary:](v237, "initWithDictionary:", v236);
    v239 = (void *)v238;
    objc_msgSend(a1, "setRoutingSettings:", v238);

  }
  if (a3)
    v240 = CFSTR("mapsFeatures");
  else
    v240 = CFSTR("maps_features");
  objc_msgSend(v5, "objectForKeyedSubscript:", v240);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v242 = [GEOLogMsgStateMapsFeatures alloc];
    if ((a3 & 1) != 0)
      v243 = -[GEOLogMsgStateMapsFeatures initWithJSON:](v242, "initWithJSON:", v241);
    else
      v243 = -[GEOLogMsgStateMapsFeatures initWithDictionary:](v242, "initWithDictionary:", v241);
    v244 = (void *)v243;
    objc_msgSend(a1, "setMapsFeatures:", v243);

  }
  if (a3)
    v245 = CFSTR("mapsUserSettings");
  else
    v245 = CFSTR("maps_user_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v247 = [GEOLogMsgStateMapsUserSettings alloc];
    if ((a3 & 1) != 0)
      v248 = -[GEOLogMsgStateMapsUserSettings initWithJSON:](v247, "initWithJSON:", v246);
    else
      v248 = -[GEOLogMsgStateMapsUserSettings initWithDictionary:](v247, "initWithDictionary:", v246);
    v249 = (void *)v248;
    objc_msgSend(a1, "setMapsUserSettings:", v248);

  }
  if (a3)
    v250 = CFSTR("arpPhotoSubmission");
  else
    v250 = CFSTR("arp_photo_submission");
  objc_msgSend(v5, "objectForKeyedSubscript:", v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v252 = [GEOLogMsgStateARPPhotoSubmission alloc];
    if ((a3 & 1) != 0)
      v253 = -[GEOLogMsgStateARPPhotoSubmission initWithJSON:](v252, "initWithJSON:", v251);
    else
      v253 = -[GEOLogMsgStateARPPhotoSubmission initWithDictionary:](v252, "initWithDictionary:", v251);
    v254 = (void *)v253;
    objc_msgSend(a1, "setArpPhotoSubmission:", v253);

  }
  if (a3)
    v255 = CFSTR("arpRatingSubmission");
  else
    v255 = CFSTR("arp_rating_submission");
  objc_msgSend(v5, "objectForKeyedSubscript:", v255);
  v256 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v257 = [GEOLogMsgStateARPRatingSubmission alloc];
    if ((a3 & 1) != 0)
      v258 = -[GEOLogMsgStateARPRatingSubmission initWithJSON:](v257, "initWithJSON:", v256);
    else
      v258 = -[GEOLogMsgStateARPRatingSubmission initWithDictionary:](v257, "initWithDictionary:", v256);
    v259 = (void *)v258;
    objc_msgSend(a1, "setArpRatingSubmission:", v258);

  }
  if (a3)
    v260 = CFSTR("arpRatingPhotoSubmission");
  else
    v260 = CFSTR("arp_rating_photo_submission");
  objc_msgSend(v5, "objectForKeyedSubscript:", v260);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v262 = [GEOLogMsgStateARPRatingPhotoSubmission alloc];
    if ((a3 & 1) != 0)
      v263 = -[GEOLogMsgStateARPRatingPhotoSubmission initWithJSON:](v262, "initWithJSON:", v261);
    else
      v263 = -[GEOLogMsgStateARPRatingPhotoSubmission initWithDictionary:](v262, "initWithDictionary:", v261);
    v264 = (void *)v263;
    objc_msgSend(a1, "setArpRatingPhotoSubmission:", v263);

  }
  if (a3)
    v265 = CFSTR("mapsPlaceIds");
  else
    v265 = CFSTR("maps_place_ids");
  objc_msgSend(v5, "objectForKeyedSubscript:", v265);
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v267 = [GEOLogMsgStateMapsPlaceIds alloc];
    if ((a3 & 1) != 0)
      v268 = -[GEOLogMsgStateMapsPlaceIds initWithJSON:](v267, "initWithJSON:", v266);
    else
      v268 = -[GEOLogMsgStateMapsPlaceIds initWithDictionary:](v267, "initWithDictionary:", v266);
    v269 = (void *)v268;
    objc_msgSend(a1, "setMapsPlaceIds:", v268);

  }
  if (a3)
    v270 = CFSTR("placeCardRap");
  else
    v270 = CFSTR("place_card_rap");
  objc_msgSend(v5, "objectForKeyedSubscript:", v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v272 = [GEOLogMsgStatePlaceCardRap alloc];
    if ((a3 & 1) != 0)
      v273 = -[GEOLogMsgStatePlaceCardRap initWithJSON:](v272, "initWithJSON:", v271);
    else
      v273 = -[GEOLogMsgStatePlaceCardRap initWithDictionary:](v272, "initWithDictionary:", v271);
    v274 = (void *)v273;
    objc_msgSend(a1, "setPlaceCardRap:", v273);

  }
  if (a3)
    v275 = CFSTR("offlineDownload");
  else
    v275 = CFSTR("offline_download");
  objc_msgSend(v5, "objectForKeyedSubscript:", v275);
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v277 = [GEOLogMsgStateOfflineDownload alloc];
    if ((a3 & 1) != 0)
      v278 = -[GEOLogMsgStateOfflineDownload initWithJSON:](v277, "initWithJSON:", v276);
    else
      v278 = -[GEOLogMsgStateOfflineDownload initWithDictionary:](v277, "initWithDictionary:", v276);
    v279 = (void *)v278;
    objc_msgSend(a1, "setOfflineDownload:", v278);

  }
  a1 = a1;

LABEL_547:
  return a1;
}

- (GEOLogMsgState)initWithJSON:(id)a3
{
  return (GEOLogMsgState *)-[GEOLogMsgState _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMsgStateClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOLogMsgState _readLookAroundView]((uint64_t)self);
  if (-[GEOLogMsgStateLookAroundView hasGreenTeaWithValue:](self->_lookAroundView, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgState _readMapView]((uint64_t)self);
  if (-[GEOLogMsgStateMapView hasGreenTeaWithValue:](self->_mapView, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgState _readMapsServer]((uint64_t)self);
  if (-[GEOLogMsgStateMapsServer hasGreenTeaWithValue:](self->_mapsServer, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOLogMsgState _readPlaceRequest]((uint64_t)self);
  return -[GEOLogMsgStatePlaceRequest hasGreenTeaWithValue:](self->_placeRequest, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEOLogMsgState readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 118) = self->_readerMarkPos;
  *((_DWORD *)v5 + 119) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_stateOrigin)
    objc_msgSend(v5, "setStateOrigin:");
  if (self->_user)
    objc_msgSend(v5, "setUser:");
  v4 = v5;
  if (self->_account)
  {
    objc_msgSend(v5, "setAccount:");
    v4 = v5;
  }
  if (self->_rap)
  {
    objc_msgSend(v5, "setRap:");
    v4 = v5;
  }
  if (self->_placeSummaryLayout)
  {
    objc_msgSend(v5, "setPlaceSummaryLayout:");
    v4 = v5;
  }
  if (self->_transitStep)
  {
    objc_msgSend(v5, "setTransitStep:");
    v4 = v5;
  }
  if (self->_nearbyTransit)
  {
    objc_msgSend(v5, "setNearbyTransit:");
    v4 = v5;
  }
  if (self->_searchResults)
  {
    objc_msgSend(v5, "setSearchResults:");
    v4 = v5;
  }
  if (self->_elementImpression)
  {
    objc_msgSend(v5, "setElementImpression:");
    v4 = v5;
  }
  if (self->_impressionObject)
  {
    objc_msgSend(v5, "setImpressionObject:");
    v4 = v5;
  }
  if (self->_tapEvent)
  {
    objc_msgSend(v5, "setTapEvent:");
    v4 = v5;
  }
  if (self->_actionButtonDetails)
  {
    objc_msgSend(v5, "setActionButtonDetails:");
    v4 = v5;
  }
  if (self->_routingWaypoints)
  {
    objc_msgSend(v5, "setRoutingWaypoints:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 121) = self->_stateType;
    v4[61] = (id)((unint64_t)v4[61] | 1);
  }
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v5, "setDeviceIdentifier:");
    v4 = v5;
  }
  if (self->_applicationIdentifier)
  {
    objc_msgSend(v5, "setApplicationIdentifier:");
    v4 = v5;
  }
  if (self->_deviceBase)
  {
    objc_msgSend(v5, "setDeviceBase:");
    v4 = v5;
  }
  if (self->_deviceLocale)
  {
    objc_msgSend(v5, "setDeviceLocale:");
    v4 = v5;
  }
  if (self->_deviceConnection)
  {
    objc_msgSend(v5, "setDeviceConnection:");
    v4 = v5;
  }
  if (self->_carPlay)
  {
    objc_msgSend(v5, "setCarPlay:");
    v4 = v5;
  }
  if (self->_pairedDevice)
  {
    objc_msgSend(v5, "setPairedDevice:");
    v4 = v5;
  }
  if (self->_extension)
  {
    objc_msgSend(v5, "setExtension:");
    v4 = v5;
  }
  if (self->_deviceSettings)
  {
    objc_msgSend(v5, "setDeviceSettings:");
    v4 = v5;
  }
  if (self->_mapView)
  {
    objc_msgSend(v5, "setMapView:");
    v4 = v5;
  }
  if (self->_mapViewLocation)
  {
    objc_msgSend(v5, "setMapViewLocation:");
    v4 = v5;
  }
  if (self->_transit)
  {
    objc_msgSend(v5, "setTransit:");
    v4 = v5;
  }
  if (self->_mapSettings)
  {
    objc_msgSend(v5, "setMapSettings:");
    v4 = v5;
  }
  if (self->_mapUi)
  {
    objc_msgSend(v5, "setMapUi:");
    v4 = v5;
  }
  if (self->_mapUiShown)
  {
    objc_msgSend(v5, "setMapUiShown:");
    v4 = v5;
  }
  if (self->_userSession)
  {
    objc_msgSend(v5, "setUserSession:");
    v4 = v5;
  }
  if (self->_experiments)
  {
    objc_msgSend(v5, "setExperiments:");
    v4 = v5;
  }
  if (self->_placeCard)
  {
    objc_msgSend(v5, "setPlaceCard:");
    v4 = v5;
  }
  if (self->_route)
  {
    objc_msgSend(v5, "setRoute:");
    v4 = v5;
  }
  if (self->_mapsServer)
  {
    objc_msgSend(v5, "setMapsServer:");
    v4 = v5;
  }
  if (self->_tileSet)
  {
    objc_msgSend(v5, "setTileSet:");
    v4 = v5;
  }
  if (self->_placeRequest)
  {
    objc_msgSend(v5, "setPlaceRequest:");
    v4 = v5;
  }
  if (self->_navigation)
  {
    objc_msgSend(v5, "setNavigation:");
    v4 = v5;
  }
  if (self->_mapRestore)
  {
    objc_msgSend(v5, "setMapRestore:");
    v4 = v5;
  }
  if (self->_suggestions)
  {
    objc_msgSend(v5, "setSuggestions:");
    v4 = v5;
  }
  if (self->_offline)
  {
    objc_msgSend(v5, "setOffline:");
    v4 = v5;
  }
  if (self->_summaryLookAroundLog)
  {
    objc_msgSend(v5, "setSummaryLookAroundLog:");
    v4 = v5;
  }
  if (self->_detailLookAroundLog)
  {
    objc_msgSend(v5, "setDetailLookAroundLog:");
    v4 = v5;
  }
  if (self->_lookAroundView)
  {
    objc_msgSend(v5, "setLookAroundView:");
    v4 = v5;
  }
  if (self->_muninResource)
  {
    objc_msgSend(v5, "setMuninResource:");
    v4 = v5;
  }
  if (self->_mapLaunch)
  {
    objc_msgSend(v5, "setMapLaunch:");
    v4 = v5;
  }
  if (self->_curatedCollection)
  {
    objc_msgSend(v5, "setCuratedCollection:");
    v4 = v5;
  }
  if (self->_ugcPhoto)
  {
    objc_msgSend(v5, "setUgcPhoto:");
    v4 = v5;
  }
  if (self->_directionsDetail)
  {
    objc_msgSend(v5, "setDirectionsDetail:");
    v4 = v5;
  }
  if (self->_market)
  {
    objc_msgSend(v5, "setMarket:");
    v4 = v5;
  }
  if (self->_routingSettings)
  {
    objc_msgSend(v5, "setRoutingSettings:");
    v4 = v5;
  }
  if (self->_mapsFeatures)
  {
    objc_msgSend(v5, "setMapsFeatures:");
    v4 = v5;
  }
  if (self->_mapsUserSettings)
  {
    objc_msgSend(v5, "setMapsUserSettings:");
    v4 = v5;
  }
  if (self->_arpPhotoSubmission)
  {
    objc_msgSend(v5, "setArpPhotoSubmission:");
    v4 = v5;
  }
  if (self->_arpRatingSubmission)
  {
    objc_msgSend(v5, "setArpRatingSubmission:");
    v4 = v5;
  }
  if (self->_arpRatingPhotoSubmission)
  {
    objc_msgSend(v5, "setArpRatingPhotoSubmission:");
    v4 = v5;
  }
  if (self->_mapsPlaceIds)
  {
    objc_msgSend(v5, "setMapsPlaceIds:");
    v4 = v5;
  }
  if (self->_placeCardRap)
  {
    objc_msgSend(v5, "setPlaceCardRap:");
    v4 = v5;
  }
  if (self->_offlineDownload)
  {
    objc_msgSend(v5, "setOfflineDownload:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
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
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  id v71;
  void *v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  id v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  void *v82;
  id v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  void *v104;
  id v105;
  void *v106;
  id v107;
  void *v108;
  id v109;
  void *v110;
  id v111;
  void *v112;
  id v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  void *v118;
  id v119;
  void *v120;
  id v121;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 7) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgStateReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgState readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_stateOrigin, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v9;

  v11 = -[GEOLogMsgStateUser copyWithZone:](self->_user, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v11;

  v13 = -[GEOLogMsgStateAccount copyWithZone:](self->_account, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v13;

  v15 = -[GEOLogMsgStateRAP copyWithZone:](self->_rap, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v15;

  v17 = -[GEOLogMsgStatePlaceSummaryLayout copyWithZone:](self->_placeSummaryLayout, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 344);
  *(_QWORD *)(v5 + 344) = v17;

  v19 = -[GEOLogMsgStateTransitStep copyWithZone:](self->_transitStep, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v19;

  v21 = -[GEOLogMsgStateNearbyTransit copyWithZone:](self->_nearbyTransit, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v21;

  v23 = -[GEOLogMsgStateSearchResults copyWithZone:](self->_searchResults, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v23;

  v25 = -[GEOLogMsgStateElementImpression copyWithZone:](self->_elementImpression, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v25;

  v27 = -[GEOLogMsgStateImpressionObject copyWithZone:](self->_impressionObject, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v27;

  v29 = -[GEOLogMsgStateTapEvent copyWithZone:](self->_tapEvent, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 416);
  *(_QWORD *)(v5 + 416) = v29;

  v31 = -[GEOLogMsgStateActionButtonDetails copyWithZone:](self->_actionButtonDetails, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v31;

  v33 = -[GEOLogMsgStateRoutingWaypoints copyWithZone:](self->_routingWaypoints, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v33;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 484) = self->_stateType;
    *(_QWORD *)(v5 + 488) |= 1uLL;
  }
  v35 = -[GEOLogMsgStateDeviceIdentifier copyWithZone:](self->_deviceIdentifier, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v35;

  v37 = -[GEOLogMsgStateApplicationIdentifier copyWithZone:](self->_applicationIdentifier, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v37;

  v39 = -[GEOLogMsgStateDeviceBase copyWithZone:](self->_deviceBase, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v39;

  v41 = -[GEOLogMsgStateDeviceLocale copyWithZone:](self->_deviceLocale, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v41;

  v43 = -[GEOLogMsgStateDeviceConnection copyWithZone:](self->_deviceConnection, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v43;

  v45 = -[GEOLogMsgStateCarPlay copyWithZone:](self->_carPlay, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v45;

  v47 = -[GEOLogMsgStatePairedDevice copyWithZone:](self->_pairedDevice, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 312);
  *(_QWORD *)(v5 + 312) = v47;

  v49 = -[GEOLogMsgStateExtension copyWithZone:](self->_extension, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v49;

  v51 = -[GEOLogMsgStateDeviceSettings copyWithZone:](self->_deviceSettings, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v51;

  v53 = -[GEOLogMsgStateMapView copyWithZone:](self->_mapView, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v53;

  v55 = -[GEOLogMsgStateMapViewLocation copyWithZone:](self->_mapViewLocation, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v55;

  v57 = -[GEOLogMsgStateTransit copyWithZone:](self->_transit, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v57;

  v59 = -[GEOLogMsgStateMapSettings copyWithZone:](self->_mapSettings, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v59;

  v61 = -[GEOLogMsgStateMapUI copyWithZone:](self->_mapUi, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v61;

  v63 = -[GEOLogMsgStateMapUIShown copyWithZone:](self->_mapUiShown, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v63;

  v65 = -[GEOLogMsgStateUserSession copyWithZone:](self->_userSession, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 456);
  *(_QWORD *)(v5 + 456) = v65;

  v67 = -[GEOLogMsgStateExperiments copyWithZone:](self->_experiments, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v67;

  v69 = -[GEOLogMsgStatePlaceCard copyWithZone:](self->_placeCard, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 328);
  *(_QWORD *)(v5 + 328) = v69;

  v71 = -[GEOLogMsgStateRoute copyWithZone:](self->_route, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v71;

  v73 = -[GEOLogMsgStateMapsServer copyWithZone:](self->_mapsServer, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v73;

  v75 = -[GEOLogMsgStateTileSet copyWithZone:](self->_tileSet, "copyWithZone:", a3);
  v76 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v75;

  v77 = -[GEOLogMsgStatePlaceRequest copyWithZone:](self->_placeRequest, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v77;

  v79 = -[GEOLogMsgStateNavigation copyWithZone:](self->_navigation, "copyWithZone:", a3);
  v80 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v79;

  v81 = -[GEOLogMsgStateMapRestore copyWithZone:](self->_mapRestore, "copyWithZone:", a3);
  v82 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v81;

  v83 = -[GEOLogMsgStateSuggestions copyWithZone:](self->_suggestions, "copyWithZone:", a3);
  v84 = *(void **)(v5 + 400);
  *(_QWORD *)(v5 + 400) = v83;

  v85 = -[GEOLogMsgStateOffline copyWithZone:](self->_offline, "copyWithZone:", a3);
  v86 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v85;

  v87 = -[GEOLogMsgStateSummaryLookAroundLog copyWithZone:](self->_summaryLookAroundLog, "copyWithZone:", a3);
  v88 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v87;

  v89 = -[GEOLogMsgStateDetailLookAroundLog copyWithZone:](self->_detailLookAroundLog, "copyWithZone:", a3);
  v90 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v89;

  v91 = -[GEOLogMsgStateLookAroundView copyWithZone:](self->_lookAroundView, "copyWithZone:", a3);
  v92 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v91;

  v93 = -[GEOLogMsgStateMuninResource copyWithZone:](self->_muninResource, "copyWithZone:", a3);
  v94 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v93;

  v95 = -[GEOLogMsgStateMapLaunch copyWithZone:](self->_mapLaunch, "copyWithZone:", a3);
  v96 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v95;

  v97 = -[GEOLogMsgStateCuratedCollection copyWithZone:](self->_curatedCollection, "copyWithZone:", a3);
  v98 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v97;

  v99 = -[GEOLogMsgStateUGCPhoto copyWithZone:](self->_ugcPhoto, "copyWithZone:", a3);
  v100 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v99;

  v101 = -[GEOLogMsgStateDirectionsDetail copyWithZone:](self->_directionsDetail, "copyWithZone:", a3);
  v102 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v101;

  v103 = -[GEOLogMsgStateMarket copyWithZone:](self->_market, "copyWithZone:", a3);
  v104 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v103;

  v105 = -[GEOLogMsgStateRoutingSettings copyWithZone:](self->_routingSettings, "copyWithZone:", a3);
  v106 = *(void **)(v5 + 376);
  *(_QWORD *)(v5 + 376) = v105;

  v107 = -[GEOLogMsgStateMapsFeatures copyWithZone:](self->_mapsFeatures, "copyWithZone:", a3);
  v108 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v107;

  v109 = -[GEOLogMsgStateMapsUserSettings copyWithZone:](self->_mapsUserSettings, "copyWithZone:", a3);
  v110 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v109;

  v111 = -[GEOLogMsgStateARPPhotoSubmission copyWithZone:](self->_arpPhotoSubmission, "copyWithZone:", a3);
  v112 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v111;

  v113 = -[GEOLogMsgStateARPRatingSubmission copyWithZone:](self->_arpRatingSubmission, "copyWithZone:", a3);
  v114 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v113;

  v115 = -[GEOLogMsgStateARPRatingPhotoSubmission copyWithZone:](self->_arpRatingPhotoSubmission, "copyWithZone:", a3);
  v116 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v115;

  v117 = -[GEOLogMsgStateMapsPlaceIds copyWithZone:](self->_mapsPlaceIds, "copyWithZone:", a3);
  v118 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v117;

  v119 = -[GEOLogMsgStatePlaceCardRap copyWithZone:](self->_placeCardRap, "copyWithZone:", a3);
  v120 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v119;

  v121 = -[GEOLogMsgStateOfflineDownload copyWithZone:](self->_offlineDownload, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v121;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *stateOrigin;
  GEOLogMsgStateUser *user;
  GEOLogMsgStateAccount *account;
  GEOLogMsgStateRAP *rap;
  GEOLogMsgStatePlaceSummaryLayout *placeSummaryLayout;
  GEOLogMsgStateTransitStep *transitStep;
  GEOLogMsgStateNearbyTransit *nearbyTransit;
  GEOLogMsgStateSearchResults *searchResults;
  GEOLogMsgStateElementImpression *elementImpression;
  GEOLogMsgStateImpressionObject *impressionObject;
  GEOLogMsgStateTapEvent *tapEvent;
  GEOLogMsgStateActionButtonDetails *actionButtonDetails;
  GEOLogMsgStateRoutingWaypoints *routingWaypoints;
  uint64_t v18;
  GEOLogMsgStateDeviceIdentifier *deviceIdentifier;
  GEOLogMsgStateApplicationIdentifier *applicationIdentifier;
  GEOLogMsgStateDeviceBase *deviceBase;
  GEOLogMsgStateDeviceLocale *deviceLocale;
  GEOLogMsgStateDeviceConnection *deviceConnection;
  GEOLogMsgStateCarPlay *carPlay;
  GEOLogMsgStatePairedDevice *pairedDevice;
  GEOLogMsgStateExtension *extension;
  GEOLogMsgStateDeviceSettings *deviceSettings;
  GEOLogMsgStateMapView *mapView;
  GEOLogMsgStateMapViewLocation *mapViewLocation;
  GEOLogMsgStateTransit *transit;
  GEOLogMsgStateMapSettings *mapSettings;
  GEOLogMsgStateMapUI *mapUi;
  GEOLogMsgStateMapUIShown *mapUiShown;
  GEOLogMsgStateUserSession *userSession;
  GEOLogMsgStateExperiments *experiments;
  GEOLogMsgStatePlaceCard *placeCard;
  GEOLogMsgStateRoute *route;
  GEOLogMsgStateMapsServer *mapsServer;
  GEOLogMsgStateTileSet *tileSet;
  GEOLogMsgStatePlaceRequest *placeRequest;
  GEOLogMsgStateNavigation *navigation;
  GEOLogMsgStateMapRestore *mapRestore;
  GEOLogMsgStateSuggestions *suggestions;
  GEOLogMsgStateOffline *offline;
  GEOLogMsgStateSummaryLookAroundLog *summaryLookAroundLog;
  GEOLogMsgStateDetailLookAroundLog *detailLookAroundLog;
  GEOLogMsgStateLookAroundView *lookAroundView;
  GEOLogMsgStateMuninResource *muninResource;
  GEOLogMsgStateMapLaunch *mapLaunch;
  GEOLogMsgStateCuratedCollection *curatedCollection;
  GEOLogMsgStateUGCPhoto *ugcPhoto;
  GEOLogMsgStateDirectionsDetail *directionsDetail;
  GEOLogMsgStateMarket *market;
  GEOLogMsgStateRoutingSettings *routingSettings;
  GEOLogMsgStateMapsFeatures *mapsFeatures;
  GEOLogMsgStateMapsUserSettings *mapsUserSettings;
  GEOLogMsgStateARPPhotoSubmission *arpPhotoSubmission;
  GEOLogMsgStateARPRatingSubmission *arpRatingSubmission;
  GEOLogMsgStateARPRatingPhotoSubmission *arpRatingPhotoSubmission;
  GEOLogMsgStateMapsPlaceIds *mapsPlaceIds;
  GEOLogMsgStatePlaceCardRap *placeCardRap;
  GEOLogMsgStateOfflineDownload *offlineDownload;
  char v63;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_121;
  -[GEOLogMsgState readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  stateOrigin = self->_stateOrigin;
  if ((unint64_t)stateOrigin | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](stateOrigin, "isEqual:"))
      goto LABEL_121;
  }
  user = self->_user;
  if ((unint64_t)user | *((_QWORD *)v4 + 58))
  {
    if (!-[GEOLogMsgStateUser isEqual:](user, "isEqual:"))
      goto LABEL_121;
  }
  account = self->_account;
  if ((unint64_t)account | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOLogMsgStateAccount isEqual:](account, "isEqual:"))
      goto LABEL_121;
  }
  rap = self->_rap;
  if ((unint64_t)rap | *((_QWORD *)v4 + 44))
  {
    if (!-[GEOLogMsgStateRAP isEqual:](rap, "isEqual:"))
      goto LABEL_121;
  }
  placeSummaryLayout = self->_placeSummaryLayout;
  if ((unint64_t)placeSummaryLayout | *((_QWORD *)v4 + 43))
  {
    if (!-[GEOLogMsgStatePlaceSummaryLayout isEqual:](placeSummaryLayout, "isEqual:"))
      goto LABEL_121;
  }
  transitStep = self->_transitStep;
  if ((unint64_t)transitStep | *((_QWORD *)v4 + 54))
  {
    if (!-[GEOLogMsgStateTransitStep isEqual:](transitStep, "isEqual:"))
      goto LABEL_121;
  }
  nearbyTransit = self->_nearbyTransit;
  if ((unint64_t)nearbyTransit | *((_QWORD *)v4 + 36))
  {
    if (!-[GEOLogMsgStateNearbyTransit isEqual:](nearbyTransit, "isEqual:"))
      goto LABEL_121;
  }
  searchResults = self->_searchResults;
  if ((unint64_t)searchResults | *((_QWORD *)v4 + 48))
  {
    if (!-[GEOLogMsgStateSearchResults isEqual:](searchResults, "isEqual:"))
      goto LABEL_121;
  }
  elementImpression = self->_elementImpression;
  if ((unint64_t)elementImpression | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOLogMsgStateElementImpression isEqual:](elementImpression, "isEqual:"))
      goto LABEL_121;
  }
  impressionObject = self->_impressionObject;
  if ((unint64_t)impressionObject | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOLogMsgStateImpressionObject isEqual:](impressionObject, "isEqual:"))
      goto LABEL_121;
  }
  tapEvent = self->_tapEvent;
  if ((unint64_t)tapEvent | *((_QWORD *)v4 + 52))
  {
    if (!-[GEOLogMsgStateTapEvent isEqual:](tapEvent, "isEqual:"))
      goto LABEL_121;
  }
  actionButtonDetails = self->_actionButtonDetails;
  if ((unint64_t)actionButtonDetails | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOLogMsgStateActionButtonDetails isEqual:](actionButtonDetails, "isEqual:"))
      goto LABEL_121;
  }
  routingWaypoints = self->_routingWaypoints;
  if ((unint64_t)routingWaypoints | *((_QWORD *)v4 + 46))
  {
    if (!-[GEOLogMsgStateRoutingWaypoints isEqual:](routingWaypoints, "isEqual:"))
      goto LABEL_121;
  }
  v18 = *((_QWORD *)v4 + 61);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_stateType != *((_DWORD *)v4 + 121))
      goto LABEL_121;
  }
  else if ((v18 & 1) != 0)
  {
LABEL_121:
    v63 = 0;
    goto LABEL_122;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((_QWORD *)v4 + 13)
    && !-[GEOLogMsgStateDeviceIdentifier isEqual:](deviceIdentifier, "isEqual:"))
  {
    goto LABEL_121;
  }
  applicationIdentifier = self->_applicationIdentifier;
  if ((unint64_t)applicationIdentifier | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOLogMsgStateApplicationIdentifier isEqual:](applicationIdentifier, "isEqual:"))
      goto LABEL_121;
  }
  deviceBase = self->_deviceBase;
  if ((unint64_t)deviceBase | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOLogMsgStateDeviceBase isEqual:](deviceBase, "isEqual:"))
      goto LABEL_121;
  }
  deviceLocale = self->_deviceLocale;
  if ((unint64_t)deviceLocale | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOLogMsgStateDeviceLocale isEqual:](deviceLocale, "isEqual:"))
      goto LABEL_121;
  }
  deviceConnection = self->_deviceConnection;
  if ((unint64_t)deviceConnection | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOLogMsgStateDeviceConnection isEqual:](deviceConnection, "isEqual:"))
      goto LABEL_121;
  }
  carPlay = self->_carPlay;
  if ((unint64_t)carPlay | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLogMsgStateCarPlay isEqual:](carPlay, "isEqual:"))
      goto LABEL_121;
  }
  pairedDevice = self->_pairedDevice;
  if ((unint64_t)pairedDevice | *((_QWORD *)v4 + 39))
  {
    if (!-[GEOLogMsgStatePairedDevice isEqual:](pairedDevice, "isEqual:"))
      goto LABEL_121;
  }
  extension = self->_extension;
  if ((unint64_t)extension | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOLogMsgStateExtension isEqual:](extension, "isEqual:"))
      goto LABEL_121;
  }
  deviceSettings = self->_deviceSettings;
  if ((unint64_t)deviceSettings | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOLogMsgStateDeviceSettings isEqual:](deviceSettings, "isEqual:"))
      goto LABEL_121;
  }
  mapView = self->_mapView;
  if ((unint64_t)mapView | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOLogMsgStateMapView isEqual:](mapView, "isEqual:"))
      goto LABEL_121;
  }
  mapViewLocation = self->_mapViewLocation;
  if ((unint64_t)mapViewLocation | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOLogMsgStateMapViewLocation isEqual:](mapViewLocation, "isEqual:"))
      goto LABEL_121;
  }
  transit = self->_transit;
  if ((unint64_t)transit | *((_QWORD *)v4 + 55))
  {
    if (!-[GEOLogMsgStateTransit isEqual:](transit, "isEqual:"))
      goto LABEL_121;
  }
  mapSettings = self->_mapSettings;
  if ((unint64_t)mapSettings | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOLogMsgStateMapSettings isEqual:](mapSettings, "isEqual:"))
      goto LABEL_121;
  }
  mapUi = self->_mapUi;
  if ((unint64_t)mapUi | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOLogMsgStateMapUI isEqual:](mapUi, "isEqual:"))
      goto LABEL_121;
  }
  mapUiShown = self->_mapUiShown;
  if ((unint64_t)mapUiShown | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOLogMsgStateMapUIShown isEqual:](mapUiShown, "isEqual:"))
      goto LABEL_121;
  }
  userSession = self->_userSession;
  if ((unint64_t)userSession | *((_QWORD *)v4 + 57))
  {
    if (!-[GEOLogMsgStateUserSession isEqual:](userSession, "isEqual:"))
      goto LABEL_121;
  }
  experiments = self->_experiments;
  if ((unint64_t)experiments | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOLogMsgStateExperiments isEqual:](experiments, "isEqual:"))
      goto LABEL_121;
  }
  placeCard = self->_placeCard;
  if ((unint64_t)placeCard | *((_QWORD *)v4 + 41))
  {
    if (!-[GEOLogMsgStatePlaceCard isEqual:](placeCard, "isEqual:"))
      goto LABEL_121;
  }
  route = self->_route;
  if ((unint64_t)route | *((_QWORD *)v4 + 45))
  {
    if (!-[GEOLogMsgStateRoute isEqual:](route, "isEqual:"))
      goto LABEL_121;
  }
  mapsServer = self->_mapsServer;
  if ((unint64_t)mapsServer | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOLogMsgStateMapsServer isEqual:](mapsServer, "isEqual:"))
      goto LABEL_121;
  }
  tileSet = self->_tileSet;
  if ((unint64_t)tileSet | *((_QWORD *)v4 + 53))
  {
    if (!-[GEOLogMsgStateTileSet isEqual:](tileSet, "isEqual:"))
      goto LABEL_121;
  }
  placeRequest = self->_placeRequest;
  if ((unint64_t)placeRequest | *((_QWORD *)v4 + 42))
  {
    if (!-[GEOLogMsgStatePlaceRequest isEqual:](placeRequest, "isEqual:"))
      goto LABEL_121;
  }
  navigation = self->_navigation;
  if ((unint64_t)navigation | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOLogMsgStateNavigation isEqual:](navigation, "isEqual:"))
      goto LABEL_121;
  }
  mapRestore = self->_mapRestore;
  if ((unint64_t)mapRestore | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOLogMsgStateMapRestore isEqual:](mapRestore, "isEqual:"))
      goto LABEL_121;
  }
  suggestions = self->_suggestions;
  if ((unint64_t)suggestions | *((_QWORD *)v4 + 50))
  {
    if (!-[GEOLogMsgStateSuggestions isEqual:](suggestions, "isEqual:"))
      goto LABEL_121;
  }
  offline = self->_offline;
  if ((unint64_t)offline | *((_QWORD *)v4 + 38))
  {
    if (!-[GEOLogMsgStateOffline isEqual:](offline, "isEqual:"))
      goto LABEL_121;
  }
  summaryLookAroundLog = self->_summaryLookAroundLog;
  if ((unint64_t)summaryLookAroundLog | *((_QWORD *)v4 + 51))
  {
    if (!-[GEOLogMsgStateSummaryLookAroundLog isEqual:](summaryLookAroundLog, "isEqual:"))
      goto LABEL_121;
  }
  detailLookAroundLog = self->_detailLookAroundLog;
  if ((unint64_t)detailLookAroundLog | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOLogMsgStateDetailLookAroundLog isEqual:](detailLookAroundLog, "isEqual:"))
      goto LABEL_121;
  }
  lookAroundView = self->_lookAroundView;
  if ((unint64_t)lookAroundView | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOLogMsgStateLookAroundView isEqual:](lookAroundView, "isEqual:"))
      goto LABEL_121;
  }
  muninResource = self->_muninResource;
  if ((unint64_t)muninResource | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOLogMsgStateMuninResource isEqual:](muninResource, "isEqual:"))
      goto LABEL_121;
  }
  mapLaunch = self->_mapLaunch;
  if ((unint64_t)mapLaunch | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOLogMsgStateMapLaunch isEqual:](mapLaunch, "isEqual:"))
      goto LABEL_121;
  }
  curatedCollection = self->_curatedCollection;
  if ((unint64_t)curatedCollection | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOLogMsgStateCuratedCollection isEqual:](curatedCollection, "isEqual:"))
      goto LABEL_121;
  }
  ugcPhoto = self->_ugcPhoto;
  if ((unint64_t)ugcPhoto | *((_QWORD *)v4 + 56))
  {
    if (!-[GEOLogMsgStateUGCPhoto isEqual:](ugcPhoto, "isEqual:"))
      goto LABEL_121;
  }
  directionsDetail = self->_directionsDetail;
  if ((unint64_t)directionsDetail | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOLogMsgStateDirectionsDetail isEqual:](directionsDetail, "isEqual:"))
      goto LABEL_121;
  }
  market = self->_market;
  if ((unint64_t)market | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOLogMsgStateMarket isEqual:](market, "isEqual:"))
      goto LABEL_121;
  }
  routingSettings = self->_routingSettings;
  if ((unint64_t)routingSettings | *((_QWORD *)v4 + 47))
  {
    if (!-[GEOLogMsgStateRoutingSettings isEqual:](routingSettings, "isEqual:"))
      goto LABEL_121;
  }
  mapsFeatures = self->_mapsFeatures;
  if ((unint64_t)mapsFeatures | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOLogMsgStateMapsFeatures isEqual:](mapsFeatures, "isEqual:"))
      goto LABEL_121;
  }
  mapsUserSettings = self->_mapsUserSettings;
  if ((unint64_t)mapsUserSettings | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOLogMsgStateMapsUserSettings isEqual:](mapsUserSettings, "isEqual:"))
      goto LABEL_121;
  }
  arpPhotoSubmission = self->_arpPhotoSubmission;
  if ((unint64_t)arpPhotoSubmission | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOLogMsgStateARPPhotoSubmission isEqual:](arpPhotoSubmission, "isEqual:"))
      goto LABEL_121;
  }
  arpRatingSubmission = self->_arpRatingSubmission;
  if ((unint64_t)arpRatingSubmission | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOLogMsgStateARPRatingSubmission isEqual:](arpRatingSubmission, "isEqual:"))
      goto LABEL_121;
  }
  arpRatingPhotoSubmission = self->_arpRatingPhotoSubmission;
  if ((unint64_t)arpRatingPhotoSubmission | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOLogMsgStateARPRatingPhotoSubmission isEqual:](arpRatingPhotoSubmission, "isEqual:"))
      goto LABEL_121;
  }
  mapsPlaceIds = self->_mapsPlaceIds;
  if ((unint64_t)mapsPlaceIds | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOLogMsgStateMapsPlaceIds isEqual:](mapsPlaceIds, "isEqual:"))
      goto LABEL_121;
  }
  placeCardRap = self->_placeCardRap;
  if ((unint64_t)placeCardRap | *((_QWORD *)v4 + 40))
  {
    if (!-[GEOLogMsgStatePlaceCardRap isEqual:](placeCardRap, "isEqual:"))
      goto LABEL_121;
  }
  offlineDownload = self->_offlineDownload;
  if ((unint64_t)offlineDownload | *((_QWORD *)v4 + 37))
    v63 = -[GEOLogMsgStateOfflineDownload isEqual:](offlineDownload, "isEqual:");
  else
    v63 = 1;
LABEL_122:

  return v63;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  NSUInteger v60;

  -[GEOLogMsgState readAll:](self, "readAll:", 1);
  v60 = -[NSString hash](self->_stateOrigin, "hash");
  v59 = -[GEOLogMsgStateUser hash](self->_user, "hash");
  v58 = -[GEOLogMsgStateAccount hash](self->_account, "hash");
  v57 = -[GEOLogMsgStateRAP hash](self->_rap, "hash");
  v3 = -[GEOLogMsgStatePlaceSummaryLayout hash](self->_placeSummaryLayout, "hash");
  v4 = -[GEOLogMsgStateTransitStep hash](self->_transitStep, "hash");
  v5 = -[GEOLogMsgStateNearbyTransit hash](self->_nearbyTransit, "hash");
  v6 = -[GEOLogMsgStateSearchResults hash](self->_searchResults, "hash");
  v7 = -[GEOLogMsgStateElementImpression hash](self->_elementImpression, "hash");
  v8 = -[GEOLogMsgStateImpressionObject hash](self->_impressionObject, "hash");
  v9 = -[GEOLogMsgStateTapEvent hash](self->_tapEvent, "hash");
  v10 = -[GEOLogMsgStateActionButtonDetails hash](self->_actionButtonDetails, "hash");
  v11 = -[GEOLogMsgStateRoutingWaypoints hash](self->_routingWaypoints, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_stateType;
  else
    v12 = 0;
  v13 = v10 ^ v11 ^ v12 ^ -[GEOLogMsgStateDeviceIdentifier hash](self->_deviceIdentifier, "hash");
  v14 = v59 ^ v60 ^ v58 ^ v57 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v13 ^ -[GEOLogMsgStateApplicationIdentifier hash](self->_applicationIdentifier, "hash");
  v15 = -[GEOLogMsgStateDeviceBase hash](self->_deviceBase, "hash");
  v16 = v15 ^ -[GEOLogMsgStateDeviceLocale hash](self->_deviceLocale, "hash");
  v17 = v16 ^ -[GEOLogMsgStateDeviceConnection hash](self->_deviceConnection, "hash");
  v18 = v17 ^ -[GEOLogMsgStateCarPlay hash](self->_carPlay, "hash");
  v19 = v18 ^ -[GEOLogMsgStatePairedDevice hash](self->_pairedDevice, "hash");
  v20 = v14 ^ v19 ^ -[GEOLogMsgStateExtension hash](self->_extension, "hash");
  v21 = -[GEOLogMsgStateDeviceSettings hash](self->_deviceSettings, "hash");
  v22 = v21 ^ -[GEOLogMsgStateMapView hash](self->_mapView, "hash");
  v23 = v22 ^ -[GEOLogMsgStateMapViewLocation hash](self->_mapViewLocation, "hash");
  v24 = v23 ^ -[GEOLogMsgStateTransit hash](self->_transit, "hash");
  v25 = v24 ^ -[GEOLogMsgStateMapSettings hash](self->_mapSettings, "hash");
  v26 = v25 ^ -[GEOLogMsgStateMapUI hash](self->_mapUi, "hash");
  v27 = v20 ^ v26 ^ -[GEOLogMsgStateMapUIShown hash](self->_mapUiShown, "hash");
  v28 = -[GEOLogMsgStateUserSession hash](self->_userSession, "hash");
  v29 = v28 ^ -[GEOLogMsgStateExperiments hash](self->_experiments, "hash");
  v30 = v29 ^ -[GEOLogMsgStatePlaceCard hash](self->_placeCard, "hash");
  v31 = v30 ^ -[GEOLogMsgStateRoute hash](self->_route, "hash");
  v32 = v31 ^ -[GEOLogMsgStateMapsServer hash](self->_mapsServer, "hash");
  v33 = v32 ^ -[GEOLogMsgStateTileSet hash](self->_tileSet, "hash");
  v34 = v33 ^ -[GEOLogMsgStatePlaceRequest hash](self->_placeRequest, "hash");
  v35 = v27 ^ v34 ^ -[GEOLogMsgStateNavigation hash](self->_navigation, "hash");
  v36 = -[GEOLogMsgStateMapRestore hash](self->_mapRestore, "hash");
  v37 = v36 ^ -[GEOLogMsgStateSuggestions hash](self->_suggestions, "hash");
  v38 = v37 ^ -[GEOLogMsgStateOffline hash](self->_offline, "hash");
  v39 = v38 ^ -[GEOLogMsgStateSummaryLookAroundLog hash](self->_summaryLookAroundLog, "hash");
  v40 = v39 ^ -[GEOLogMsgStateDetailLookAroundLog hash](self->_detailLookAroundLog, "hash");
  v41 = v40 ^ -[GEOLogMsgStateLookAroundView hash](self->_lookAroundView, "hash");
  v42 = v41 ^ -[GEOLogMsgStateMuninResource hash](self->_muninResource, "hash");
  v43 = v42 ^ -[GEOLogMsgStateMapLaunch hash](self->_mapLaunch, "hash");
  v44 = v35 ^ v43 ^ -[GEOLogMsgStateCuratedCollection hash](self->_curatedCollection, "hash");
  v45 = -[GEOLogMsgStateUGCPhoto hash](self->_ugcPhoto, "hash");
  v46 = v45 ^ -[GEOLogMsgStateDirectionsDetail hash](self->_directionsDetail, "hash");
  v47 = v46 ^ -[GEOLogMsgStateMarket hash](self->_market, "hash");
  v48 = v47 ^ -[GEOLogMsgStateRoutingSettings hash](self->_routingSettings, "hash");
  v49 = v48 ^ -[GEOLogMsgStateMapsFeatures hash](self->_mapsFeatures, "hash");
  v50 = v49 ^ -[GEOLogMsgStateMapsUserSettings hash](self->_mapsUserSettings, "hash");
  v51 = v50 ^ -[GEOLogMsgStateARPPhotoSubmission hash](self->_arpPhotoSubmission, "hash");
  v52 = v51 ^ -[GEOLogMsgStateARPRatingSubmission hash](self->_arpRatingSubmission, "hash");
  v53 = v52 ^ -[GEOLogMsgStateARPRatingPhotoSubmission hash](self->_arpRatingPhotoSubmission, "hash");
  v54 = v44 ^ v53 ^ -[GEOLogMsgStateMapsPlaceIds hash](self->_mapsPlaceIds, "hash");
  v55 = -[GEOLogMsgStatePlaceCardRap hash](self->_placeCardRap, "hash");
  return v54 ^ v55 ^ -[GEOLogMsgStateOfflineDownload hash](self->_offlineDownload, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  GEOLogMsgStateUser *user;
  uint64_t v6;
  GEOLogMsgStateAccount *account;
  uint64_t v8;
  GEOLogMsgStateRAP *rap;
  uint64_t v10;
  GEOLogMsgStatePlaceSummaryLayout *placeSummaryLayout;
  uint64_t v12;
  GEOLogMsgStateTransitStep *transitStep;
  uint64_t v14;
  GEOLogMsgStateNearbyTransit *nearbyTransit;
  uint64_t v16;
  GEOLogMsgStateSearchResults *searchResults;
  uint64_t v18;
  GEOLogMsgStateElementImpression *elementImpression;
  uint64_t v20;
  GEOLogMsgStateImpressionObject *impressionObject;
  uint64_t v22;
  GEOLogMsgStateTapEvent *tapEvent;
  uint64_t v24;
  GEOLogMsgStateActionButtonDetails *actionButtonDetails;
  uint64_t v26;
  GEOLogMsgStateRoutingWaypoints *routingWaypoints;
  uint64_t v28;
  GEOLogMsgStateDeviceIdentifier *deviceIdentifier;
  uint64_t v30;
  GEOLogMsgStateApplicationIdentifier *applicationIdentifier;
  uint64_t v32;
  GEOLogMsgStateDeviceBase *deviceBase;
  uint64_t v34;
  GEOLogMsgStateDeviceLocale *deviceLocale;
  uint64_t v36;
  GEOLogMsgStateDeviceConnection *deviceConnection;
  uint64_t v38;
  GEOLogMsgStateCarPlay *carPlay;
  uint64_t v40;
  GEOLogMsgStatePairedDevice *pairedDevice;
  uint64_t v42;
  GEOLogMsgStateExtension *extension;
  uint64_t v44;
  GEOLogMsgStateDeviceSettings *deviceSettings;
  uint64_t v46;
  GEOLogMsgStateMapView *mapView;
  uint64_t v48;
  GEOLogMsgStateMapViewLocation *mapViewLocation;
  uint64_t v50;
  GEOLogMsgStateTransit *transit;
  uint64_t v52;
  GEOLogMsgStateMapSettings *mapSettings;
  uint64_t v54;
  GEOLogMsgStateMapUI *mapUi;
  uint64_t v56;
  GEOLogMsgStateMapUIShown *mapUiShown;
  uint64_t v58;
  GEOLogMsgStateUserSession *userSession;
  uint64_t v60;
  GEOLogMsgStateExperiments *experiments;
  uint64_t v62;
  GEOLogMsgStatePlaceCard *placeCard;
  uint64_t v64;
  GEOLogMsgStateRoute *route;
  uint64_t v66;
  GEOLogMsgStateMapsServer *mapsServer;
  uint64_t v68;
  GEOLogMsgStateTileSet *tileSet;
  uint64_t v70;
  GEOLogMsgStatePlaceRequest *placeRequest;
  uint64_t v72;
  GEOLogMsgStateNavigation *navigation;
  uint64_t v74;
  GEOLogMsgStateMapRestore *mapRestore;
  uint64_t v76;
  GEOLogMsgStateSuggestions *suggestions;
  uint64_t v78;
  GEOLogMsgStateOffline *offline;
  uint64_t v80;
  GEOLogMsgStateSummaryLookAroundLog *summaryLookAroundLog;
  uint64_t v82;
  GEOLogMsgStateDetailLookAroundLog *detailLookAroundLog;
  uint64_t v84;
  GEOLogMsgStateLookAroundView *lookAroundView;
  uint64_t v86;
  GEOLogMsgStateMuninResource *muninResource;
  uint64_t v88;
  GEOLogMsgStateMapLaunch *mapLaunch;
  uint64_t v90;
  GEOLogMsgStateCuratedCollection *curatedCollection;
  uint64_t v92;
  GEOLogMsgStateUGCPhoto *ugcPhoto;
  uint64_t v94;
  GEOLogMsgStateDirectionsDetail *directionsDetail;
  uint64_t v96;
  GEOLogMsgStateMarket *market;
  uint64_t v98;
  GEOLogMsgStateRoutingSettings *routingSettings;
  uint64_t v100;
  GEOLogMsgStateMapsFeatures *mapsFeatures;
  uint64_t v102;
  GEOLogMsgStateMapsUserSettings *mapsUserSettings;
  uint64_t v104;
  GEOLogMsgStateARPPhotoSubmission *arpPhotoSubmission;
  uint64_t v106;
  GEOLogMsgStateARPRatingSubmission *arpRatingSubmission;
  uint64_t v108;
  GEOLogMsgStateARPRatingPhotoSubmission *arpRatingPhotoSubmission;
  uint64_t v110;
  GEOLogMsgStateMapsPlaceIds *mapsPlaceIds;
  uint64_t v112;
  GEOLogMsgStatePlaceCardRap *placeCardRap;
  uint64_t v114;
  GEOLogMsgStateOfflineDownload *offlineDownload;
  uint64_t v116;
  _QWORD *v117;

  v117 = a3;
  objc_msgSend(v117, "readAll:", 0);
  v4 = v117;
  if (v117[49])
  {
    -[GEOLogMsgState setStateOrigin:](self, "setStateOrigin:");
    v4 = v117;
  }
  user = self->_user;
  v6 = v4[58];
  if (user)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLogMsgStateUser mergeFrom:](user, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOLogMsgState setUser:](self, "setUser:");
  }
  v4 = v117;
LABEL_9:
  account = self->_account;
  v8 = v4[2];
  if (account)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOLogMsgStateAccount mergeFrom:](account, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOLogMsgState setAccount:](self, "setAccount:");
  }
  v4 = v117;
LABEL_15:
  rap = self->_rap;
  v10 = v4[44];
  if (rap)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOLogMsgStateRAP mergeFrom:](rap, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOLogMsgState setRap:](self, "setRap:");
  }
  v4 = v117;
LABEL_21:
  placeSummaryLayout = self->_placeSummaryLayout;
  v12 = v4[43];
  if (placeSummaryLayout)
  {
    if (!v12)
      goto LABEL_27;
    -[GEOLogMsgStatePlaceSummaryLayout mergeFrom:](placeSummaryLayout, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEOLogMsgState setPlaceSummaryLayout:](self, "setPlaceSummaryLayout:");
  }
  v4 = v117;
LABEL_27:
  transitStep = self->_transitStep;
  v14 = v4[54];
  if (transitStep)
  {
    if (!v14)
      goto LABEL_33;
    -[GEOLogMsgStateTransitStep mergeFrom:](transitStep, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEOLogMsgState setTransitStep:](self, "setTransitStep:");
  }
  v4 = v117;
LABEL_33:
  nearbyTransit = self->_nearbyTransit;
  v16 = v4[36];
  if (nearbyTransit)
  {
    if (!v16)
      goto LABEL_39;
    -[GEOLogMsgStateNearbyTransit mergeFrom:](nearbyTransit, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[GEOLogMsgState setNearbyTransit:](self, "setNearbyTransit:");
  }
  v4 = v117;
LABEL_39:
  searchResults = self->_searchResults;
  v18 = v4[48];
  if (searchResults)
  {
    if (!v18)
      goto LABEL_45;
    -[GEOLogMsgStateSearchResults mergeFrom:](searchResults, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_45;
    -[GEOLogMsgState setSearchResults:](self, "setSearchResults:");
  }
  v4 = v117;
LABEL_45:
  elementImpression = self->_elementImpression;
  v20 = v4[17];
  if (elementImpression)
  {
    if (!v20)
      goto LABEL_51;
    -[GEOLogMsgStateElementImpression mergeFrom:](elementImpression, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_51;
    -[GEOLogMsgState setElementImpression:](self, "setElementImpression:");
  }
  v4 = v117;
LABEL_51:
  impressionObject = self->_impressionObject;
  v22 = v4[20];
  if (impressionObject)
  {
    if (!v22)
      goto LABEL_57;
    -[GEOLogMsgStateImpressionObject mergeFrom:](impressionObject, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_57;
    -[GEOLogMsgState setImpressionObject:](self, "setImpressionObject:");
  }
  v4 = v117;
LABEL_57:
  tapEvent = self->_tapEvent;
  v24 = v4[52];
  if (tapEvent)
  {
    if (!v24)
      goto LABEL_63;
    -[GEOLogMsgStateTapEvent mergeFrom:](tapEvent, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_63;
    -[GEOLogMsgState setTapEvent:](self, "setTapEvent:");
  }
  v4 = v117;
LABEL_63:
  actionButtonDetails = self->_actionButtonDetails;
  v26 = v4[3];
  if (actionButtonDetails)
  {
    if (!v26)
      goto LABEL_69;
    -[GEOLogMsgStateActionButtonDetails mergeFrom:](actionButtonDetails, "mergeFrom:");
  }
  else
  {
    if (!v26)
      goto LABEL_69;
    -[GEOLogMsgState setActionButtonDetails:](self, "setActionButtonDetails:");
  }
  v4 = v117;
LABEL_69:
  routingWaypoints = self->_routingWaypoints;
  v28 = v4[46];
  if (routingWaypoints)
  {
    if (!v28)
      goto LABEL_75;
    -[GEOLogMsgStateRoutingWaypoints mergeFrom:](routingWaypoints, "mergeFrom:");
  }
  else
  {
    if (!v28)
      goto LABEL_75;
    -[GEOLogMsgState setRoutingWaypoints:](self, "setRoutingWaypoints:");
  }
  v4 = v117;
LABEL_75:
  if ((v4[61] & 1) != 0)
  {
    self->_stateType = *((_DWORD *)v4 + 121);
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  deviceIdentifier = self->_deviceIdentifier;
  v30 = v4[13];
  if (deviceIdentifier)
  {
    if (!v30)
      goto LABEL_83;
    -[GEOLogMsgStateDeviceIdentifier mergeFrom:](deviceIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v30)
      goto LABEL_83;
    -[GEOLogMsgState setDeviceIdentifier:](self, "setDeviceIdentifier:");
  }
  v4 = v117;
LABEL_83:
  applicationIdentifier = self->_applicationIdentifier;
  v32 = v4[4];
  if (applicationIdentifier)
  {
    if (!v32)
      goto LABEL_89;
    -[GEOLogMsgStateApplicationIdentifier mergeFrom:](applicationIdentifier, "mergeFrom:");
  }
  else
  {
    if (!v32)
      goto LABEL_89;
    -[GEOLogMsgState setApplicationIdentifier:](self, "setApplicationIdentifier:");
  }
  v4 = v117;
LABEL_89:
  deviceBase = self->_deviceBase;
  v34 = v4[11];
  if (deviceBase)
  {
    if (!v34)
      goto LABEL_95;
    -[GEOLogMsgStateDeviceBase mergeFrom:](deviceBase, "mergeFrom:");
  }
  else
  {
    if (!v34)
      goto LABEL_95;
    -[GEOLogMsgState setDeviceBase:](self, "setDeviceBase:");
  }
  v4 = v117;
LABEL_95:
  deviceLocale = self->_deviceLocale;
  v36 = v4[14];
  if (deviceLocale)
  {
    if (!v36)
      goto LABEL_101;
    -[GEOLogMsgStateDeviceLocale mergeFrom:](deviceLocale, "mergeFrom:");
  }
  else
  {
    if (!v36)
      goto LABEL_101;
    -[GEOLogMsgState setDeviceLocale:](self, "setDeviceLocale:");
  }
  v4 = v117;
LABEL_101:
  deviceConnection = self->_deviceConnection;
  v38 = v4[12];
  if (deviceConnection)
  {
    if (!v38)
      goto LABEL_107;
    -[GEOLogMsgStateDeviceConnection mergeFrom:](deviceConnection, "mergeFrom:");
  }
  else
  {
    if (!v38)
      goto LABEL_107;
    -[GEOLogMsgState setDeviceConnection:](self, "setDeviceConnection:");
  }
  v4 = v117;
LABEL_107:
  carPlay = self->_carPlay;
  v40 = v4[8];
  if (carPlay)
  {
    if (!v40)
      goto LABEL_113;
    -[GEOLogMsgStateCarPlay mergeFrom:](carPlay, "mergeFrom:");
  }
  else
  {
    if (!v40)
      goto LABEL_113;
    -[GEOLogMsgState setCarPlay:](self, "setCarPlay:");
  }
  v4 = v117;
LABEL_113:
  pairedDevice = self->_pairedDevice;
  v42 = v4[39];
  if (pairedDevice)
  {
    if (!v42)
      goto LABEL_119;
    -[GEOLogMsgStatePairedDevice mergeFrom:](pairedDevice, "mergeFrom:");
  }
  else
  {
    if (!v42)
      goto LABEL_119;
    -[GEOLogMsgState setPairedDevice:](self, "setPairedDevice:");
  }
  v4 = v117;
LABEL_119:
  extension = self->_extension;
  v44 = v4[19];
  if (extension)
  {
    if (!v44)
      goto LABEL_125;
    -[GEOLogMsgStateExtension mergeFrom:](extension, "mergeFrom:");
  }
  else
  {
    if (!v44)
      goto LABEL_125;
    -[GEOLogMsgState setExtension:](self, "setExtension:");
  }
  v4 = v117;
LABEL_125:
  deviceSettings = self->_deviceSettings;
  v46 = v4[15];
  if (deviceSettings)
  {
    if (!v46)
      goto LABEL_131;
    -[GEOLogMsgStateDeviceSettings mergeFrom:](deviceSettings, "mergeFrom:");
  }
  else
  {
    if (!v46)
      goto LABEL_131;
    -[GEOLogMsgState setDeviceSettings:](self, "setDeviceSettings:");
  }
  v4 = v117;
LABEL_131:
  mapView = self->_mapView;
  v48 = v4[28];
  if (mapView)
  {
    if (!v48)
      goto LABEL_137;
    -[GEOLogMsgStateMapView mergeFrom:](mapView, "mergeFrom:");
  }
  else
  {
    if (!v48)
      goto LABEL_137;
    -[GEOLogMsgState setMapView:](self, "setMapView:");
  }
  v4 = v117;
LABEL_137:
  mapViewLocation = self->_mapViewLocation;
  v50 = v4[27];
  if (mapViewLocation)
  {
    if (!v50)
      goto LABEL_143;
    -[GEOLogMsgStateMapViewLocation mergeFrom:](mapViewLocation, "mergeFrom:");
  }
  else
  {
    if (!v50)
      goto LABEL_143;
    -[GEOLogMsgState setMapViewLocation:](self, "setMapViewLocation:");
  }
  v4 = v117;
LABEL_143:
  transit = self->_transit;
  v52 = v4[55];
  if (transit)
  {
    if (!v52)
      goto LABEL_149;
    -[GEOLogMsgStateTransit mergeFrom:](transit, "mergeFrom:");
  }
  else
  {
    if (!v52)
      goto LABEL_149;
    -[GEOLogMsgState setTransit:](self, "setTransit:");
  }
  v4 = v117;
LABEL_149:
  mapSettings = self->_mapSettings;
  v54 = v4[24];
  if (mapSettings)
  {
    if (!v54)
      goto LABEL_155;
    -[GEOLogMsgStateMapSettings mergeFrom:](mapSettings, "mergeFrom:");
  }
  else
  {
    if (!v54)
      goto LABEL_155;
    -[GEOLogMsgState setMapSettings:](self, "setMapSettings:");
  }
  v4 = v117;
LABEL_155:
  mapUi = self->_mapUi;
  v56 = v4[26];
  if (mapUi)
  {
    if (!v56)
      goto LABEL_161;
    -[GEOLogMsgStateMapUI mergeFrom:](mapUi, "mergeFrom:");
  }
  else
  {
    if (!v56)
      goto LABEL_161;
    -[GEOLogMsgState setMapUi:](self, "setMapUi:");
  }
  v4 = v117;
LABEL_161:
  mapUiShown = self->_mapUiShown;
  v58 = v4[25];
  if (mapUiShown)
  {
    if (!v58)
      goto LABEL_167;
    -[GEOLogMsgStateMapUIShown mergeFrom:](mapUiShown, "mergeFrom:");
  }
  else
  {
    if (!v58)
      goto LABEL_167;
    -[GEOLogMsgState setMapUiShown:](self, "setMapUiShown:");
  }
  v4 = v117;
LABEL_167:
  userSession = self->_userSession;
  v60 = v4[57];
  if (userSession)
  {
    if (!v60)
      goto LABEL_173;
    -[GEOLogMsgStateUserSession mergeFrom:](userSession, "mergeFrom:");
  }
  else
  {
    if (!v60)
      goto LABEL_173;
    -[GEOLogMsgState setUserSession:](self, "setUserSession:");
  }
  v4 = v117;
LABEL_173:
  experiments = self->_experiments;
  v62 = v4[18];
  if (experiments)
  {
    if (!v62)
      goto LABEL_179;
    -[GEOLogMsgStateExperiments mergeFrom:](experiments, "mergeFrom:");
  }
  else
  {
    if (!v62)
      goto LABEL_179;
    -[GEOLogMsgState setExperiments:](self, "setExperiments:");
  }
  v4 = v117;
LABEL_179:
  placeCard = self->_placeCard;
  v64 = v4[41];
  if (placeCard)
  {
    if (!v64)
      goto LABEL_185;
    -[GEOLogMsgStatePlaceCard mergeFrom:](placeCard, "mergeFrom:");
  }
  else
  {
    if (!v64)
      goto LABEL_185;
    -[GEOLogMsgState setPlaceCard:](self, "setPlaceCard:");
  }
  v4 = v117;
LABEL_185:
  route = self->_route;
  v66 = v4[45];
  if (route)
  {
    if (!v66)
      goto LABEL_191;
    -[GEOLogMsgStateRoute mergeFrom:](route, "mergeFrom:");
  }
  else
  {
    if (!v66)
      goto LABEL_191;
    -[GEOLogMsgState setRoute:](self, "setRoute:");
  }
  v4 = v117;
LABEL_191:
  mapsServer = self->_mapsServer;
  v68 = v4[31];
  if (mapsServer)
  {
    if (!v68)
      goto LABEL_197;
    -[GEOLogMsgStateMapsServer mergeFrom:](mapsServer, "mergeFrom:");
  }
  else
  {
    if (!v68)
      goto LABEL_197;
    -[GEOLogMsgState setMapsServer:](self, "setMapsServer:");
  }
  v4 = v117;
LABEL_197:
  tileSet = self->_tileSet;
  v70 = v4[53];
  if (tileSet)
  {
    if (!v70)
      goto LABEL_203;
    -[GEOLogMsgStateTileSet mergeFrom:](tileSet, "mergeFrom:");
  }
  else
  {
    if (!v70)
      goto LABEL_203;
    -[GEOLogMsgState setTileSet:](self, "setTileSet:");
  }
  v4 = v117;
LABEL_203:
  placeRequest = self->_placeRequest;
  v72 = v4[42];
  if (placeRequest)
  {
    if (!v72)
      goto LABEL_209;
    -[GEOLogMsgStatePlaceRequest mergeFrom:](placeRequest, "mergeFrom:");
  }
  else
  {
    if (!v72)
      goto LABEL_209;
    -[GEOLogMsgState setPlaceRequest:](self, "setPlaceRequest:");
  }
  v4 = v117;
LABEL_209:
  navigation = self->_navigation;
  v74 = v4[35];
  if (navigation)
  {
    if (!v74)
      goto LABEL_215;
    -[GEOLogMsgStateNavigation mergeFrom:](navigation, "mergeFrom:");
  }
  else
  {
    if (!v74)
      goto LABEL_215;
    -[GEOLogMsgState setNavigation:](self, "setNavigation:");
  }
  v4 = v117;
LABEL_215:
  mapRestore = self->_mapRestore;
  v76 = v4[23];
  if (mapRestore)
  {
    if (!v76)
      goto LABEL_221;
    -[GEOLogMsgStateMapRestore mergeFrom:](mapRestore, "mergeFrom:");
  }
  else
  {
    if (!v76)
      goto LABEL_221;
    -[GEOLogMsgState setMapRestore:](self, "setMapRestore:");
  }
  v4 = v117;
LABEL_221:
  suggestions = self->_suggestions;
  v78 = v4[50];
  if (suggestions)
  {
    if (!v78)
      goto LABEL_227;
    -[GEOLogMsgStateSuggestions mergeFrom:](suggestions, "mergeFrom:");
  }
  else
  {
    if (!v78)
      goto LABEL_227;
    -[GEOLogMsgState setSuggestions:](self, "setSuggestions:");
  }
  v4 = v117;
LABEL_227:
  offline = self->_offline;
  v80 = v4[38];
  if (offline)
  {
    if (!v80)
      goto LABEL_233;
    -[GEOLogMsgStateOffline mergeFrom:](offline, "mergeFrom:");
  }
  else
  {
    if (!v80)
      goto LABEL_233;
    -[GEOLogMsgState setOffline:](self, "setOffline:");
  }
  v4 = v117;
LABEL_233:
  summaryLookAroundLog = self->_summaryLookAroundLog;
  v82 = v4[51];
  if (summaryLookAroundLog)
  {
    if (!v82)
      goto LABEL_239;
    -[GEOLogMsgStateSummaryLookAroundLog mergeFrom:](summaryLookAroundLog, "mergeFrom:");
  }
  else
  {
    if (!v82)
      goto LABEL_239;
    -[GEOLogMsgState setSummaryLookAroundLog:](self, "setSummaryLookAroundLog:");
  }
  v4 = v117;
LABEL_239:
  detailLookAroundLog = self->_detailLookAroundLog;
  v84 = v4[10];
  if (detailLookAroundLog)
  {
    if (!v84)
      goto LABEL_245;
    -[GEOLogMsgStateDetailLookAroundLog mergeFrom:](detailLookAroundLog, "mergeFrom:");
  }
  else
  {
    if (!v84)
      goto LABEL_245;
    -[GEOLogMsgState setDetailLookAroundLog:](self, "setDetailLookAroundLog:");
  }
  v4 = v117;
LABEL_245:
  lookAroundView = self->_lookAroundView;
  v86 = v4[21];
  if (lookAroundView)
  {
    if (!v86)
      goto LABEL_251;
    -[GEOLogMsgStateLookAroundView mergeFrom:](lookAroundView, "mergeFrom:");
  }
  else
  {
    if (!v86)
      goto LABEL_251;
    -[GEOLogMsgState setLookAroundView:](self, "setLookAroundView:");
  }
  v4 = v117;
LABEL_251:
  muninResource = self->_muninResource;
  v88 = v4[34];
  if (muninResource)
  {
    if (!v88)
      goto LABEL_257;
    -[GEOLogMsgStateMuninResource mergeFrom:](muninResource, "mergeFrom:");
  }
  else
  {
    if (!v88)
      goto LABEL_257;
    -[GEOLogMsgState setMuninResource:](self, "setMuninResource:");
  }
  v4 = v117;
LABEL_257:
  mapLaunch = self->_mapLaunch;
  v90 = v4[22];
  if (mapLaunch)
  {
    if (!v90)
      goto LABEL_263;
    -[GEOLogMsgStateMapLaunch mergeFrom:](mapLaunch, "mergeFrom:");
  }
  else
  {
    if (!v90)
      goto LABEL_263;
    -[GEOLogMsgState setMapLaunch:](self, "setMapLaunch:");
  }
  v4 = v117;
LABEL_263:
  curatedCollection = self->_curatedCollection;
  v92 = v4[9];
  if (curatedCollection)
  {
    if (!v92)
      goto LABEL_269;
    -[GEOLogMsgStateCuratedCollection mergeFrom:](curatedCollection, "mergeFrom:");
  }
  else
  {
    if (!v92)
      goto LABEL_269;
    -[GEOLogMsgState setCuratedCollection:](self, "setCuratedCollection:");
  }
  v4 = v117;
LABEL_269:
  ugcPhoto = self->_ugcPhoto;
  v94 = v4[56];
  if (ugcPhoto)
  {
    if (!v94)
      goto LABEL_275;
    -[GEOLogMsgStateUGCPhoto mergeFrom:](ugcPhoto, "mergeFrom:");
  }
  else
  {
    if (!v94)
      goto LABEL_275;
    -[GEOLogMsgState setUgcPhoto:](self, "setUgcPhoto:");
  }
  v4 = v117;
LABEL_275:
  directionsDetail = self->_directionsDetail;
  v96 = v4[16];
  if (directionsDetail)
  {
    if (!v96)
      goto LABEL_281;
    -[GEOLogMsgStateDirectionsDetail mergeFrom:](directionsDetail, "mergeFrom:");
  }
  else
  {
    if (!v96)
      goto LABEL_281;
    -[GEOLogMsgState setDirectionsDetail:](self, "setDirectionsDetail:");
  }
  v4 = v117;
LABEL_281:
  market = self->_market;
  v98 = v4[33];
  if (market)
  {
    if (!v98)
      goto LABEL_287;
    -[GEOLogMsgStateMarket mergeFrom:](market, "mergeFrom:");
  }
  else
  {
    if (!v98)
      goto LABEL_287;
    -[GEOLogMsgState setMarket:](self, "setMarket:");
  }
  v4 = v117;
LABEL_287:
  routingSettings = self->_routingSettings;
  v100 = v4[47];
  if (routingSettings)
  {
    if (!v100)
      goto LABEL_293;
    -[GEOLogMsgStateRoutingSettings mergeFrom:](routingSettings, "mergeFrom:");
  }
  else
  {
    if (!v100)
      goto LABEL_293;
    -[GEOLogMsgState setRoutingSettings:](self, "setRoutingSettings:");
  }
  v4 = v117;
LABEL_293:
  mapsFeatures = self->_mapsFeatures;
  v102 = v4[29];
  if (mapsFeatures)
  {
    if (!v102)
      goto LABEL_299;
    -[GEOLogMsgStateMapsFeatures mergeFrom:](mapsFeatures, "mergeFrom:");
  }
  else
  {
    if (!v102)
      goto LABEL_299;
    -[GEOLogMsgState setMapsFeatures:](self, "setMapsFeatures:");
  }
  v4 = v117;
LABEL_299:
  mapsUserSettings = self->_mapsUserSettings;
  v104 = v4[32];
  if (mapsUserSettings)
  {
    if (!v104)
      goto LABEL_305;
    -[GEOLogMsgStateMapsUserSettings mergeFrom:](mapsUserSettings, "mergeFrom:");
  }
  else
  {
    if (!v104)
      goto LABEL_305;
    -[GEOLogMsgState setMapsUserSettings:](self, "setMapsUserSettings:");
  }
  v4 = v117;
LABEL_305:
  arpPhotoSubmission = self->_arpPhotoSubmission;
  v106 = v4[5];
  if (arpPhotoSubmission)
  {
    if (!v106)
      goto LABEL_311;
    -[GEOLogMsgStateARPPhotoSubmission mergeFrom:](arpPhotoSubmission, "mergeFrom:");
  }
  else
  {
    if (!v106)
      goto LABEL_311;
    -[GEOLogMsgState setArpPhotoSubmission:](self, "setArpPhotoSubmission:");
  }
  v4 = v117;
LABEL_311:
  arpRatingSubmission = self->_arpRatingSubmission;
  v108 = v4[7];
  if (arpRatingSubmission)
  {
    if (!v108)
      goto LABEL_317;
    -[GEOLogMsgStateARPRatingSubmission mergeFrom:](arpRatingSubmission, "mergeFrom:");
  }
  else
  {
    if (!v108)
      goto LABEL_317;
    -[GEOLogMsgState setArpRatingSubmission:](self, "setArpRatingSubmission:");
  }
  v4 = v117;
LABEL_317:
  arpRatingPhotoSubmission = self->_arpRatingPhotoSubmission;
  v110 = v4[6];
  if (arpRatingPhotoSubmission)
  {
    if (!v110)
      goto LABEL_323;
    -[GEOLogMsgStateARPRatingPhotoSubmission mergeFrom:](arpRatingPhotoSubmission, "mergeFrom:");
  }
  else
  {
    if (!v110)
      goto LABEL_323;
    -[GEOLogMsgState setArpRatingPhotoSubmission:](self, "setArpRatingPhotoSubmission:");
  }
  v4 = v117;
LABEL_323:
  mapsPlaceIds = self->_mapsPlaceIds;
  v112 = v4[30];
  if (mapsPlaceIds)
  {
    if (!v112)
      goto LABEL_329;
    -[GEOLogMsgStateMapsPlaceIds mergeFrom:](mapsPlaceIds, "mergeFrom:");
  }
  else
  {
    if (!v112)
      goto LABEL_329;
    -[GEOLogMsgState setMapsPlaceIds:](self, "setMapsPlaceIds:");
  }
  v4 = v117;
LABEL_329:
  placeCardRap = self->_placeCardRap;
  v114 = v4[40];
  if (placeCardRap)
  {
    if (!v114)
      goto LABEL_335;
    -[GEOLogMsgStatePlaceCardRap mergeFrom:](placeCardRap, "mergeFrom:");
  }
  else
  {
    if (!v114)
      goto LABEL_335;
    -[GEOLogMsgState setPlaceCardRap:](self, "setPlaceCardRap:");
  }
  v4 = v117;
LABEL_335:
  offlineDownload = self->_offlineDownload;
  v116 = v4[37];
  if (offlineDownload)
  {
    if (v116)
    {
      -[GEOLogMsgStateOfflineDownload mergeFrom:](offlineDownload, "mergeFrom:");
LABEL_340:
      v4 = v117;
    }
  }
  else if (v116)
  {
    -[GEOLogMsgState setOfflineDownload:](self, "setOfflineDownload:");
    goto LABEL_340;
  }

}

@end
