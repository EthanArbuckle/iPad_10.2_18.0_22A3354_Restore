@implementation GEORPFeedbackDetails

- (GEORPFeedbackDetails)init
{
  GEORPFeedbackDetails *v2;
  GEORPFeedbackDetails *v3;
  GEORPFeedbackDetails *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackDetails;
  v2 = -[GEORPFeedbackDetails init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackDetails)initWithData:(id)a3
{
  GEORPFeedbackDetails *v3;
  GEORPFeedbackDetails *v4;
  GEORPFeedbackDetails *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackDetails;
  v3 = -[GEORPFeedbackDetails initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readPoiFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiFeedback
{
  -[GEORPFeedbackDetails _readPoiFeedback]((uint64_t)self);
  return self->_poiFeedback != 0;
}

- (GEORPPoiFeedback)poiFeedback
{
  -[GEORPFeedbackDetails _readPoiFeedback]((uint64_t)self);
  return self->_poiFeedback;
}

- (void)setPoiFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x201000u;
  objc_storeStrong((id *)&self->_poiFeedback, a3);
}

- (void)_readTransitPoiFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 198) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitPoiFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTransitPoiFeedback
{
  -[GEORPFeedbackDetails _readTransitPoiFeedback]((uint64_t)self);
  return self->_transitPoiFeedback != 0;
}

- (GEORPTransitPoiFeedback)transitPoiFeedback
{
  -[GEORPFeedbackDetails _readTransitPoiFeedback]((uint64_t)self);
  return self->_transitPoiFeedback;
}

- (void)setTransitPoiFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x300000u;
  objc_storeStrong((id *)&self->_transitPoiFeedback, a3);
}

- (void)_readSearchFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 198) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasSearchFeedback
{
  -[GEORPFeedbackDetails _readSearchFeedback]((uint64_t)self);
  return self->_searchFeedback != 0;
}

- (GEORPSearchFeedback)searchFeedback
{
  -[GEORPFeedbackDetails _readSearchFeedback]((uint64_t)self);
  return self->_searchFeedback;
}

- (void)setSearchFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x210000u;
  objc_storeStrong((id *)&self->_searchFeedback, a3);
}

- (void)_readMerchantLookupFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMerchantLookupFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasMerchantLookupFeedback
{
  -[GEORPFeedbackDetails _readMerchantLookupFeedback]((uint64_t)self);
  return self->_merchantLookupFeedback != 0;
}

- (GEORPMerchantLookupFeedback)merchantLookupFeedback
{
  -[GEORPFeedbackDetails _readMerchantLookupFeedback]((uint64_t)self);
  return self->_merchantLookupFeedback;
}

- (void)setMerchantLookupFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200100u;
  objc_storeStrong((id *)&self->_merchantLookupFeedback, a3);
}

- (void)_readDirectionsFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionsFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasDirectionsFeedback
{
  -[GEORPFeedbackDetails _readDirectionsFeedback]((uint64_t)self);
  return self->_directionsFeedback != 0;
}

- (GEORPDirectionsFeedback)directionsFeedback
{
  -[GEORPFeedbackDetails _readDirectionsFeedback]((uint64_t)self);
  return self->_directionsFeedback;
}

- (void)setDirectionsFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200010u;
  objc_storeStrong((id *)&self->_directionsFeedback, a3);
}

- (void)_readAddressPointFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddressPointFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAddressPointFeedback
{
  -[GEORPFeedbackDetails _readAddressPointFeedback]((uint64_t)self);
  return self->_addressPointFeedback != 0;
}

- (GEORPAddressFeedback)addressPointFeedback
{
  -[GEORPFeedbackDetails _readAddressPointFeedback]((uint64_t)self);
  return self->_addressPointFeedback;
}

- (void)setAddressPointFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200004u;
  objc_storeStrong((id *)&self->_addressPointFeedback, a3);
}

- (void)_readTileFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 198) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTileFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasTileFeedback
{
  -[GEORPFeedbackDetails _readTileFeedback]((uint64_t)self);
  return self->_tileFeedback != 0;
}

- (GEORPTileFeedback)tileFeedback
{
  -[GEORPFeedbackDetails _readTileFeedback]((uint64_t)self);
  return self->_tileFeedback;
}

- (void)setTileFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x280000u;
  objc_storeStrong((id *)&self->_tileFeedback, a3);
}

- (void)_readGroundViewFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGroundViewFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasGroundViewFeedback
{
  -[GEORPFeedbackDetails _readGroundViewFeedback]((uint64_t)self);
  return self->_groundViewFeedback != 0;
}

- (GEORPGroundViewFeedback)groundViewFeedback
{
  -[GEORPFeedbackDetails _readGroundViewFeedback]((uint64_t)self);
  return self->_groundViewFeedback;
}

- (void)setGroundViewFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200020u;
  objc_storeStrong((id *)&self->_groundViewFeedback, a3);
}

- (void)_readPoiEnrichmentUpdate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiEnrichmentUpdate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiEnrichmentUpdate
{
  -[GEORPFeedbackDetails _readPoiEnrichmentUpdate]((uint64_t)self);
  return self->_poiEnrichmentUpdate != 0;
}

- (GEORPPoiEnrichmentUpdate)poiEnrichmentUpdate
{
  -[GEORPFeedbackDetails _readPoiEnrichmentUpdate]((uint64_t)self);
  return self->_poiEnrichmentUpdate;
}

- (void)setPoiEnrichmentUpdate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200800u;
  objc_storeStrong((id *)&self->_poiEnrichmentUpdate, a3);
}

- (void)_readIncidentFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncidentFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasIncidentFeedback
{
  -[GEORPFeedbackDetails _readIncidentFeedback]((uint64_t)self);
  return self->_incidentFeedback != 0;
}

- (GEORPIncidentFeedback)incidentFeedback
{
  -[GEORPFeedbackDetails _readIncidentFeedback]((uint64_t)self);
  return self->_incidentFeedback;
}

- (void)setIncidentFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200040u;
  objc_storeStrong((id *)&self->_incidentFeedback, a3);
}

- (void)_readPoiImageFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiImageFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiImageFeedback
{
  -[GEORPFeedbackDetails _readPoiImageFeedback]((uint64_t)self);
  return self->_poiImageFeedback != 0;
}

- (GEORPPoiImageFeedback)poiImageFeedback
{
  -[GEORPFeedbackDetails _readPoiImageFeedback]((uint64_t)self);
  return self->_poiImageFeedback;
}

- (void)setPoiImageFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x202000u;
  objc_storeStrong((id *)&self->_poiImageFeedback, a3);
}

- (void)_readCuratedCollectionFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedCollectionFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasCuratedCollectionFeedback
{
  -[GEORPFeedbackDetails _readCuratedCollectionFeedback]((uint64_t)self);
  return self->_curatedCollectionFeedback != 0;
}

- (GEORPCuratedCollectionFeedback)curatedCollectionFeedback
{
  -[GEORPFeedbackDetails _readCuratedCollectionFeedback]((uint64_t)self);
  return self->_curatedCollectionFeedback;
}

- (void)setCuratedCollectionFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200008u;
  objc_storeStrong((id *)&self->_curatedCollectionFeedback, a3);
}

- (void)_readPoiActivityFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPoiActivityFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPoiActivityFeedback
{
  -[GEORPFeedbackDetails _readPoiActivityFeedback]((uint64_t)self);
  return self->_poiActivityFeedback != 0;
}

- (GEORPPoiActivityFeedback)poiActivityFeedback
{
  -[GEORPFeedbackDetails _readPoiActivityFeedback]((uint64_t)self);
  return self->_poiActivityFeedback;
}

- (void)setPoiActivityFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200400u;
  objc_storeStrong((id *)&self->_poiActivityFeedback, a3);
}

- (void)_readAddMapFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddMapFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasAddMapFeedback
{
  -[GEORPFeedbackDetails _readAddMapFeedback]((uint64_t)self);
  return self->_addMapFeedback != 0;
}

- (GEORPAddToMapFeedback)addMapFeedback
{
  -[GEORPFeedbackDetails _readAddMapFeedback]((uint64_t)self);
  return self->_addMapFeedback;
}

- (void)setAddMapFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200002u;
  objc_storeStrong((id *)&self->_addMapFeedback, a3);
}

- (void)_readLocalityFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 196) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocalityFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasLocalityFeedback
{
  -[GEORPFeedbackDetails _readLocalityFeedback]((uint64_t)self);
  return self->_localityFeedback != 0;
}

- (GEORPLocalityFeedback)localityFeedback
{
  -[GEORPFeedbackDetails _readLocalityFeedback]((uint64_t)self);
  return self->_localityFeedback;
}

- (void)setLocalityFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200080u;
  objc_storeStrong((id *)&self->_localityFeedback, a3);
}

- (void)_readStreetFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 198) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readStreetFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasStreetFeedback
{
  -[GEORPFeedbackDetails _readStreetFeedback]((uint64_t)self);
  return self->_streetFeedback != 0;
}

- (GEORPStreetFeedback)streetFeedback
{
  -[GEORPFeedbackDetails _readStreetFeedback]((uint64_t)self);
  return self->_streetFeedback;
}

- (void)setStreetFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x220000u;
  objc_storeStrong((id *)&self->_streetFeedback, a3);
}

- (void)_readThirdPartyPhotoSharingPreferenceUpdate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 198) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readThirdPartyPhotoSharingPreferenceUpdate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasThirdPartyPhotoSharingPreferenceUpdate
{
  -[GEORPFeedbackDetails _readThirdPartyPhotoSharingPreferenceUpdate]((uint64_t)self);
  return self->_thirdPartyPhotoSharingPreferenceUpdate != 0;
}

- (GEORPThirdPartyPhotoSharingPreferenceUpdate)thirdPartyPhotoSharingPreferenceUpdate
{
  -[GEORPFeedbackDetails _readThirdPartyPhotoSharingPreferenceUpdate]((uint64_t)self);
  return self->_thirdPartyPhotoSharingPreferenceUpdate;
}

- (void)setThirdPartyPhotoSharingPreferenceUpdate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x240000u;
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdate, a3);
}

- (void)_readPhotoAttributionPreferencesUpdate
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoAttributionPreferencesUpdate_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasPhotoAttributionPreferencesUpdate
{
  -[GEORPFeedbackDetails _readPhotoAttributionPreferencesUpdate]((uint64_t)self);
  return self->_photoAttributionPreferencesUpdate != 0;
}

- (GEORPPhotoAttributionPreferencesUpdate)photoAttributionPreferencesUpdate
{
  -[GEORPFeedbackDetails _readPhotoAttributionPreferencesUpdate]((uint64_t)self);
  return self->_photoAttributionPreferencesUpdate;
}

- (void)setPhotoAttributionPreferencesUpdate:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x200200u;
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdate, a3);
}

- (void)_readRunningTrackFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRunningTrackFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasRunningTrackFeedback
{
  -[GEORPFeedbackDetails _readRunningTrackFeedback]((uint64_t)self);
  return self->_runningTrackFeedback != 0;
}

- (GEORPRunningTrackFeedback)runningTrackFeedback
{
  -[GEORPFeedbackDetails _readRunningTrackFeedback]((uint64_t)self);
  return self->_runningTrackFeedback;
}

- (void)setRunningTrackFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x208000u;
  objc_storeStrong((id *)&self->_runningTrackFeedback, a3);
}

- (void)_readRapUserResponseFeedback
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 192));
    if ((*(_BYTE *)(a1 + 197) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackDetailsReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRapUserResponseFeedback_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 192));
  }
}

- (BOOL)hasRapUserResponseFeedback
{
  -[GEORPFeedbackDetails _readRapUserResponseFeedback]((uint64_t)self);
  return self->_rapUserResponseFeedback != 0;
}

- (GEORPRapUserResponseFeedback)rapUserResponseFeedback
{
  -[GEORPFeedbackDetails _readRapUserResponseFeedback]((uint64_t)self);
  return self->_rapUserResponseFeedback;
}

- (void)setRapUserResponseFeedback:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x204000u;
  objc_storeStrong((id *)&self->_rapUserResponseFeedback, a3);
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
  v8.super_class = (Class)GEORPFeedbackDetails;
  -[GEORPFeedbackDetails description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackDetails dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackDetails _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
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
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
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
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  void *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  id v90;
  id v91;
  _QWORD v93[4];
  id v94;

  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "poiFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v5, "jsonRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("poiFeedback");
    }
    else
    {
      objc_msgSend(v5, "dictionaryRepresentation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = CFSTR("poi_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

  }
  objc_msgSend(a1, "transitPoiFeedback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("transitPoiFeedback");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("transit_poi_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
  objc_msgSend(a1, "searchFeedback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v13, "jsonRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("searchFeedback");
    }
    else
    {
      objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = CFSTR("search_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

  }
  objc_msgSend(a1, "merchantLookupFeedback");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v17, "jsonRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("merchantLookupFeedback");
    }
    else
    {
      objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = CFSTR("merchant_lookup_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  objc_msgSend(a1, "directionsFeedback");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v21, "jsonRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("directionsFeedback");
    }
    else
    {
      objc_msgSend(v21, "dictionaryRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = CFSTR("directions_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
  objc_msgSend(a1, "addressPointFeedback");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v25, "jsonRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("addressPointFeedback");
    }
    else
    {
      objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = CFSTR("address_point_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  objc_msgSend(a1, "tileFeedback");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v29, "jsonRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("tileFeedback");
    }
    else
    {
      objc_msgSend(v29, "dictionaryRepresentation");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = CFSTR("tile_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v31, v32);

  }
  objc_msgSend(a1, "groundViewFeedback");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v33, "jsonRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("groundViewFeedback");
    }
    else
    {
      objc_msgSend(v33, "dictionaryRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = CFSTR("ground_view_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v35, v36);

  }
  objc_msgSend(a1, "poiEnrichmentUpdate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v37, "jsonRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("poiEnrichmentUpdate");
    }
    else
    {
      objc_msgSend(v37, "dictionaryRepresentation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = CFSTR("poi_enrichment_update");
    }
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

  }
  objc_msgSend(a1, "incidentFeedback");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v41;
  if (v41)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v41, "jsonRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("incidentFeedback");
    }
    else
    {
      objc_msgSend(v41, "dictionaryRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = CFSTR("incident_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v43, v44);

  }
  objc_msgSend(a1, "poiImageFeedback");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if (v45)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v45, "jsonRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("poiImageFeedback");
    }
    else
    {
      objc_msgSend(v45, "dictionaryRepresentation");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = CFSTR("poi_image_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

  }
  objc_msgSend(a1, "curatedCollectionFeedback");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v49, "jsonRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("curatedCollectionFeedback");
    }
    else
    {
      objc_msgSend(v49, "dictionaryRepresentation");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = CFSTR("curated_collection_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v51, v52);

  }
  objc_msgSend(a1, "poiActivityFeedback");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v53;
  if (v53)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v53, "jsonRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("poiActivityFeedback");
    }
    else
    {
      objc_msgSend(v53, "dictionaryRepresentation");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = CFSTR("poi_activity_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v55, v56);

  }
  objc_msgSend(a1, "addMapFeedback");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v57;
  if (v57)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v57, "jsonRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("addMapFeedback");
    }
    else
    {
      objc_msgSend(v57, "dictionaryRepresentation");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = CFSTR("add_map_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

  }
  objc_msgSend(a1, "localityFeedback");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (v61)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v61, "jsonRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = CFSTR("localityFeedback");
    }
    else
    {
      objc_msgSend(v61, "dictionaryRepresentation");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = CFSTR("locality_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
  objc_msgSend(a1, "streetFeedback");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v65, "jsonRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("streetFeedback");
    }
    else
    {
      objc_msgSend(v65, "dictionaryRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("street_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v67, v68);

  }
  objc_msgSend(a1, "thirdPartyPhotoSharingPreferenceUpdate");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69;
  if (v69)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v69, "jsonRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("thirdPartyPhotoSharingPreferenceUpdate");
    }
    else
    {
      objc_msgSend(v69, "dictionaryRepresentation");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = CFSTR("third_party_photo_sharing_preference_update");
    }
    objc_msgSend(v4, "setObject:forKey:", v71, v72);

  }
  objc_msgSend(a1, "photoAttributionPreferencesUpdate");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v73;
  if (v73)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v73, "jsonRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("photoAttributionPreferencesUpdate");
    }
    else
    {
      objc_msgSend(v73, "dictionaryRepresentation");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = CFSTR("photo_attribution_preferences_update");
    }
    objc_msgSend(v4, "setObject:forKey:", v75, v76);

  }
  objc_msgSend(a1, "runningTrackFeedback");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v77;
  if (v77)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v77, "jsonRepresentation");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = CFSTR("runningTrackFeedback");
    }
    else
    {
      objc_msgSend(v77, "dictionaryRepresentation");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = CFSTR("running_track_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v79, v80);

  }
  objc_msgSend(a1, "rapUserResponseFeedback");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = v81;
  if (v81)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v81, "jsonRepresentation");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = CFSTR("rapUserResponseFeedback");
    }
    else
    {
      objc_msgSend(v81, "dictionaryRepresentation");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = CFSTR("rap_user_response_feedback");
    }
    objc_msgSend(v4, "setObject:forKey:", v83, v84);

  }
  v85 = (void *)a1[2];
  if (v85)
  {
    objc_msgSend(v85, "dictionaryRepresentation");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v86;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v86, "count"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v93[0] = MEMORY[0x1E0C809B0];
      v93[1] = 3221225472;
      v93[2] = __50__GEORPFeedbackDetails__dictionaryRepresentation___block_invoke;
      v93[3] = &unk_1E1C00600;
      v89 = v88;
      v94 = v89;
      objc_msgSend(v87, "enumerateKeysAndObjectsUsingBlock:", v93);
      v90 = v89;

      v87 = v90;
    }
    objc_msgSend(v4, "setObject:forKey:", v87, CFSTR("Unknown Fields"));

  }
  v91 = v4;

  return v91;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackDetails _dictionaryRepresentation:](self, 1);
}

void __50__GEORPFeedbackDetails__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackDetails)initWithDictionary:(id)a3
{
  return (GEORPFeedbackDetails *)-[GEORPFeedbackDetails _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  GEORPPoiFeedback *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  GEORPTransitPoiFeedback *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  GEORPSearchFeedback *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  GEORPMerchantLookupFeedback *v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  GEORPDirectionsFeedback *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  GEORPAddressFeedback *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  GEORPTileFeedback *v38;
  uint64_t v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  GEORPGroundViewFeedback *v43;
  uint64_t v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  GEORPPoiEnrichmentUpdate *v48;
  uint64_t v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  GEORPIncidentFeedback *v53;
  uint64_t v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  GEORPPoiImageFeedback *v58;
  uint64_t v59;
  void *v60;
  const __CFString *v61;
  void *v62;
  GEORPCuratedCollectionFeedback *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  GEORPPoiActivityFeedback *v68;
  uint64_t v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  GEORPAddToMapFeedback *v73;
  uint64_t v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  GEORPLocalityFeedback *v78;
  uint64_t v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  GEORPStreetFeedback *v83;
  uint64_t v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  GEORPThirdPartyPhotoSharingPreferenceUpdate *v88;
  uint64_t v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  GEORPPhotoAttributionPreferencesUpdate *v93;
  uint64_t v94;
  void *v95;
  const __CFString *v96;
  void *v97;
  GEORPRunningTrackFeedback *v98;
  uint64_t v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  GEORPRapUserResponseFeedback *v103;
  uint64_t v104;
  void *v105;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("poiFeedback");
      else
        v6 = CFSTR("poi_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = [GEORPPoiFeedback alloc];
        if ((a3 & 1) != 0)
          v9 = -[GEORPPoiFeedback initWithJSON:](v8, "initWithJSON:", v7);
        else
          v9 = -[GEORPPoiFeedback initWithDictionary:](v8, "initWithDictionary:", v7);
        v10 = (void *)v9;
        objc_msgSend(a1, "setPoiFeedback:", v9);

      }
      if (a3)
        v11 = CFSTR("transitPoiFeedback");
      else
        v11 = CFSTR("transit_poi_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = [GEORPTransitPoiFeedback alloc];
        if ((a3 & 1) != 0)
          v14 = -[GEORPTransitPoiFeedback initWithJSON:](v13, "initWithJSON:", v12);
        else
          v14 = -[GEORPTransitPoiFeedback initWithDictionary:](v13, "initWithDictionary:", v12);
        v15 = (void *)v14;
        objc_msgSend(a1, "setTransitPoiFeedback:", v14);

      }
      if (a3)
        v16 = CFSTR("searchFeedback");
      else
        v16 = CFSTR("search_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = [GEORPSearchFeedback alloc];
        if ((a3 & 1) != 0)
          v19 = -[GEORPSearchFeedback initWithJSON:](v18, "initWithJSON:", v17);
        else
          v19 = -[GEORPSearchFeedback initWithDictionary:](v18, "initWithDictionary:", v17);
        v20 = (void *)v19;
        objc_msgSend(a1, "setSearchFeedback:", v19);

      }
      if (a3)
        v21 = CFSTR("merchantLookupFeedback");
      else
        v21 = CFSTR("merchant_lookup_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = [GEORPMerchantLookupFeedback alloc];
        if ((a3 & 1) != 0)
          v24 = -[GEORPMerchantLookupFeedback initWithJSON:](v23, "initWithJSON:", v22);
        else
          v24 = -[GEORPMerchantLookupFeedback initWithDictionary:](v23, "initWithDictionary:", v22);
        v25 = (void *)v24;
        objc_msgSend(a1, "setMerchantLookupFeedback:", v24);

      }
      if (a3)
        v26 = CFSTR("directionsFeedback");
      else
        v26 = CFSTR("directions_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = [GEORPDirectionsFeedback alloc];
        if ((a3 & 1) != 0)
          v29 = -[GEORPDirectionsFeedback initWithJSON:](v28, "initWithJSON:", v27);
        else
          v29 = -[GEORPDirectionsFeedback initWithDictionary:](v28, "initWithDictionary:", v27);
        v30 = (void *)v29;
        objc_msgSend(a1, "setDirectionsFeedback:", v29);

      }
      if (a3)
        v31 = CFSTR("addressPointFeedback");
      else
        v31 = CFSTR("address_point_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = [GEORPAddressFeedback alloc];
        if ((a3 & 1) != 0)
          v34 = -[GEORPAddressFeedback initWithJSON:](v33, "initWithJSON:", v32);
        else
          v34 = -[GEORPAddressFeedback initWithDictionary:](v33, "initWithDictionary:", v32);
        v35 = (void *)v34;
        objc_msgSend(a1, "setAddressPointFeedback:", v34);

      }
      if (a3)
        v36 = CFSTR("tileFeedback");
      else
        v36 = CFSTR("tile_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v38 = [GEORPTileFeedback alloc];
        if ((a3 & 1) != 0)
          v39 = -[GEORPTileFeedback initWithJSON:](v38, "initWithJSON:", v37);
        else
          v39 = -[GEORPTileFeedback initWithDictionary:](v38, "initWithDictionary:", v37);
        v40 = (void *)v39;
        objc_msgSend(a1, "setTileFeedback:", v39);

      }
      if (a3)
        v41 = CFSTR("groundViewFeedback");
      else
        v41 = CFSTR("ground_view_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v43 = [GEORPGroundViewFeedback alloc];
        if ((a3 & 1) != 0)
          v44 = -[GEORPGroundViewFeedback initWithJSON:](v43, "initWithJSON:", v42);
        else
          v44 = -[GEORPGroundViewFeedback initWithDictionary:](v43, "initWithDictionary:", v42);
        v45 = (void *)v44;
        objc_msgSend(a1, "setGroundViewFeedback:", v44);

      }
      if (a3)
        v46 = CFSTR("poiEnrichmentUpdate");
      else
        v46 = CFSTR("poi_enrichment_update");
      objc_msgSend(v5, "objectForKeyedSubscript:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v48 = [GEORPPoiEnrichmentUpdate alloc];
        if ((a3 & 1) != 0)
          v49 = -[GEORPPoiEnrichmentUpdate initWithJSON:](v48, "initWithJSON:", v47);
        else
          v49 = -[GEORPPoiEnrichmentUpdate initWithDictionary:](v48, "initWithDictionary:", v47);
        v50 = (void *)v49;
        objc_msgSend(a1, "setPoiEnrichmentUpdate:", v49);

      }
      if (a3)
        v51 = CFSTR("incidentFeedback");
      else
        v51 = CFSTR("incident_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v53 = [GEORPIncidentFeedback alloc];
        if ((a3 & 1) != 0)
          v54 = -[GEORPIncidentFeedback initWithJSON:](v53, "initWithJSON:", v52);
        else
          v54 = -[GEORPIncidentFeedback initWithDictionary:](v53, "initWithDictionary:", v52);
        v55 = (void *)v54;
        objc_msgSend(a1, "setIncidentFeedback:", v54);

      }
      if (a3)
        v56 = CFSTR("poiImageFeedback");
      else
        v56 = CFSTR("poi_image_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v58 = [GEORPPoiImageFeedback alloc];
        if ((a3 & 1) != 0)
          v59 = -[GEORPPoiImageFeedback initWithJSON:](v58, "initWithJSON:", v57);
        else
          v59 = -[GEORPPoiImageFeedback initWithDictionary:](v58, "initWithDictionary:", v57);
        v60 = (void *)v59;
        objc_msgSend(a1, "setPoiImageFeedback:", v59);

      }
      if (a3)
        v61 = CFSTR("curatedCollectionFeedback");
      else
        v61 = CFSTR("curated_collection_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v61);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v63 = [GEORPCuratedCollectionFeedback alloc];
        if ((a3 & 1) != 0)
          v64 = -[GEORPCuratedCollectionFeedback initWithJSON:](v63, "initWithJSON:", v62);
        else
          v64 = -[GEORPCuratedCollectionFeedback initWithDictionary:](v63, "initWithDictionary:", v62);
        v65 = (void *)v64;
        objc_msgSend(a1, "setCuratedCollectionFeedback:", v64);

      }
      if (a3)
        v66 = CFSTR("poiActivityFeedback");
      else
        v66 = CFSTR("poi_activity_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v68 = [GEORPPoiActivityFeedback alloc];
        if ((a3 & 1) != 0)
          v69 = -[GEORPPoiActivityFeedback initWithJSON:](v68, "initWithJSON:", v67);
        else
          v69 = -[GEORPPoiActivityFeedback initWithDictionary:](v68, "initWithDictionary:", v67);
        v70 = (void *)v69;
        objc_msgSend(a1, "setPoiActivityFeedback:", v69);

      }
      if (a3)
        v71 = CFSTR("addMapFeedback");
      else
        v71 = CFSTR("add_map_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v71);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v73 = [GEORPAddToMapFeedback alloc];
        if ((a3 & 1) != 0)
          v74 = -[GEORPAddToMapFeedback initWithJSON:](v73, "initWithJSON:", v72);
        else
          v74 = -[GEORPAddToMapFeedback initWithDictionary:](v73, "initWithDictionary:", v72);
        v75 = (void *)v74;
        objc_msgSend(a1, "setAddMapFeedback:", v74);

      }
      if (a3)
        v76 = CFSTR("localityFeedback");
      else
        v76 = CFSTR("locality_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v78 = [GEORPLocalityFeedback alloc];
        if ((a3 & 1) != 0)
          v79 = -[GEORPLocalityFeedback initWithJSON:](v78, "initWithJSON:", v77);
        else
          v79 = -[GEORPLocalityFeedback initWithDictionary:](v78, "initWithDictionary:", v77);
        v80 = (void *)v79;
        objc_msgSend(a1, "setLocalityFeedback:", v79);

      }
      if (a3)
        v81 = CFSTR("streetFeedback");
      else
        v81 = CFSTR("street_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v83 = [GEORPStreetFeedback alloc];
        if ((a3 & 1) != 0)
          v84 = -[GEORPStreetFeedback initWithJSON:](v83, "initWithJSON:", v82);
        else
          v84 = -[GEORPStreetFeedback initWithDictionary:](v83, "initWithDictionary:", v82);
        v85 = (void *)v84;
        objc_msgSend(a1, "setStreetFeedback:", v84);

      }
      if (a3)
        v86 = CFSTR("thirdPartyPhotoSharingPreferenceUpdate");
      else
        v86 = CFSTR("third_party_photo_sharing_preference_update");
      objc_msgSend(v5, "objectForKeyedSubscript:", v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v88 = [GEORPThirdPartyPhotoSharingPreferenceUpdate alloc];
        if ((a3 & 1) != 0)
          v89 = -[GEORPThirdPartyPhotoSharingPreferenceUpdate initWithJSON:](v88, "initWithJSON:", v87);
        else
          v89 = -[GEORPThirdPartyPhotoSharingPreferenceUpdate initWithDictionary:](v88, "initWithDictionary:", v87);
        v90 = (void *)v89;
        objc_msgSend(a1, "setThirdPartyPhotoSharingPreferenceUpdate:", v89);

      }
      if (a3)
        v91 = CFSTR("photoAttributionPreferencesUpdate");
      else
        v91 = CFSTR("photo_attribution_preferences_update");
      objc_msgSend(v5, "objectForKeyedSubscript:", v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v93 = [GEORPPhotoAttributionPreferencesUpdate alloc];
        if ((a3 & 1) != 0)
          v94 = -[GEORPPhotoAttributionPreferencesUpdate initWithJSON:](v93, "initWithJSON:", v92);
        else
          v94 = -[GEORPPhotoAttributionPreferencesUpdate initWithDictionary:](v93, "initWithDictionary:", v92);
        v95 = (void *)v94;
        objc_msgSend(a1, "setPhotoAttributionPreferencesUpdate:", v94);

      }
      if (a3)
        v96 = CFSTR("runningTrackFeedback");
      else
        v96 = CFSTR("running_track_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v98 = [GEORPRunningTrackFeedback alloc];
        if ((a3 & 1) != 0)
          v99 = -[GEORPRunningTrackFeedback initWithJSON:](v98, "initWithJSON:", v97);
        else
          v99 = -[GEORPRunningTrackFeedback initWithDictionary:](v98, "initWithDictionary:", v97);
        v100 = (void *)v99;
        objc_msgSend(a1, "setRunningTrackFeedback:", v99);

      }
      if (a3)
        v101 = CFSTR("rapUserResponseFeedback");
      else
        v101 = CFSTR("rap_user_response_feedback");
      objc_msgSend(v5, "objectForKeyedSubscript:", v101);
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v103 = [GEORPRapUserResponseFeedback alloc];
        if ((a3 & 1) != 0)
          v104 = -[GEORPRapUserResponseFeedback initWithJSON:](v103, "initWithJSON:", v102);
        else
          v104 = -[GEORPRapUserResponseFeedback initWithDictionary:](v103, "initWithDictionary:", v102);
        v105 = (void *)v104;
        objc_msgSend(a1, "setRapUserResponseFeedback:", v104);

      }
    }
  }

  return a1;
}

- (GEORPFeedbackDetails)initWithJSON:(id)a3
{
  return (GEORPFeedbackDetails *)-[GEORPFeedbackDetails _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1154_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1155_0;
    GEORPFeedbackDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackDetailsCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackDetailsIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackDetailsReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackDetailsIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackDetails readAll:](self, "readAll:", 0);
    if (self->_poiFeedback)
      PBDataWriterWriteSubmessage();
    v5 = v8;
    if (self->_transitPoiFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_searchFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_merchantLookupFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_directionsFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_addressPointFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_tileFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_groundViewFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_poiEnrichmentUpdate)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_incidentFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_poiImageFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_curatedCollectionFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_poiActivityFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_addMapFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_localityFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_streetFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_thirdPartyPhotoSharingPreferenceUpdate)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_photoAttributionPreferencesUpdate)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_runningTrackFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_rapUserResponseFeedback)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPFeedbackDetailsClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackDetails _readAddressPointFeedback]((uint64_t)self);
  if (-[GEORPAddressFeedback hasGreenTeaWithValue:](self->_addressPointFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readDirectionsFeedback]((uint64_t)self);
  if (-[GEORPDirectionsFeedback hasGreenTeaWithValue:](self->_directionsFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readIncidentFeedback]((uint64_t)self);
  if (-[GEORPIncidentFeedback hasGreenTeaWithValue:](self->_incidentFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readLocalityFeedback]((uint64_t)self);
  if (-[GEORPLocalityFeedback hasGreenTeaWithValue:](self->_localityFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readMerchantLookupFeedback]((uint64_t)self);
  if (-[GEORPMerchantLookupFeedback hasGreenTeaWithValue:](self->_merchantLookupFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readPoiActivityFeedback]((uint64_t)self);
  if (-[GEORPPoiActivityFeedback hasGreenTeaWithValue:](self->_poiActivityFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readPoiEnrichmentUpdate]((uint64_t)self);
  if (-[GEORPPoiEnrichmentUpdate hasGreenTeaWithValue:](self->_poiEnrichmentUpdate, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readPoiFeedback]((uint64_t)self);
  if (-[GEORPPoiFeedback hasGreenTeaWithValue:](self->_poiFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readPoiImageFeedback]((uint64_t)self);
  if (-[GEORPPoiImageFeedback hasGreenTeaWithValue:](self->_poiImageFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readSearchFeedback]((uint64_t)self);
  if (-[GEORPSearchFeedback hasGreenTeaWithValue:](self->_searchFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readTileFeedback]((uint64_t)self);
  if (-[GEORPTileFeedback hasGreenTeaWithValue:](self->_tileFeedback, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPFeedbackDetails _readTransitPoiFeedback]((uint64_t)self);
  return -[GEORPTransitPoiFeedback hasGreenTeaWithValue:](self->_transitPoiFeedback, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORPFeedbackDetails readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 46) = self->_readerMarkPos;
  *((_DWORD *)v5 + 47) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_poiFeedback)
    objc_msgSend(v5, "setPoiFeedback:");
  if (self->_transitPoiFeedback)
    objc_msgSend(v5, "setTransitPoiFeedback:");
  v4 = v5;
  if (self->_searchFeedback)
  {
    objc_msgSend(v5, "setSearchFeedback:");
    v4 = v5;
  }
  if (self->_merchantLookupFeedback)
  {
    objc_msgSend(v5, "setMerchantLookupFeedback:");
    v4 = v5;
  }
  if (self->_directionsFeedback)
  {
    objc_msgSend(v5, "setDirectionsFeedback:");
    v4 = v5;
  }
  if (self->_addressPointFeedback)
  {
    objc_msgSend(v5, "setAddressPointFeedback:");
    v4 = v5;
  }
  if (self->_tileFeedback)
  {
    objc_msgSend(v5, "setTileFeedback:");
    v4 = v5;
  }
  if (self->_groundViewFeedback)
  {
    objc_msgSend(v5, "setGroundViewFeedback:");
    v4 = v5;
  }
  if (self->_poiEnrichmentUpdate)
  {
    objc_msgSend(v5, "setPoiEnrichmentUpdate:");
    v4 = v5;
  }
  if (self->_incidentFeedback)
  {
    objc_msgSend(v5, "setIncidentFeedback:");
    v4 = v5;
  }
  if (self->_poiImageFeedback)
  {
    objc_msgSend(v5, "setPoiImageFeedback:");
    v4 = v5;
  }
  if (self->_curatedCollectionFeedback)
  {
    objc_msgSend(v5, "setCuratedCollectionFeedback:");
    v4 = v5;
  }
  if (self->_poiActivityFeedback)
  {
    objc_msgSend(v5, "setPoiActivityFeedback:");
    v4 = v5;
  }
  if (self->_addMapFeedback)
  {
    objc_msgSend(v5, "setAddMapFeedback:");
    v4 = v5;
  }
  if (self->_localityFeedback)
  {
    objc_msgSend(v5, "setLocalityFeedback:");
    v4 = v5;
  }
  if (self->_streetFeedback)
  {
    objc_msgSend(v5, "setStreetFeedback:");
    v4 = v5;
  }
  if (self->_thirdPartyPhotoSharingPreferenceUpdate)
  {
    objc_msgSend(v5, "setThirdPartyPhotoSharingPreferenceUpdate:");
    v4 = v5;
  }
  if (self->_photoAttributionPreferencesUpdate)
  {
    objc_msgSend(v5, "setPhotoAttributionPreferencesUpdate:");
    v4 = v5;
  }
  if (self->_runningTrackFeedback)
  {
    objc_msgSend(v5, "setRunningTrackFeedback:");
    v4 = v5;
  }
  if (self->_rapUserResponseFeedback)
  {
    objc_msgSend(v5, "setRapUserResponseFeedback:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
    goto LABEL_5;
  v7 = reader;
  objc_sync_enter(v7);
  if ((*((_BYTE *)&self->_flags + 2) & 0x20) != 0)
  {
    objc_sync_exit(v7);

LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackDetails readAll:](self, "readAll:", 0);
    v8 = -[GEORPPoiFeedback copyWithZone:](self->_poiFeedback, "copyWithZone:", a3);
    v9 = *(void **)(v5 + 112);
    *(_QWORD *)(v5 + 112) = v8;

    v10 = -[GEORPTransitPoiFeedback copyWithZone:](self->_transitPoiFeedback, "copyWithZone:", a3);
    v11 = *(void **)(v5 + 176);
    *(_QWORD *)(v5 + 176) = v10;

    v12 = -[GEORPSearchFeedback copyWithZone:](self->_searchFeedback, "copyWithZone:", a3);
    v13 = *(void **)(v5 + 144);
    *(_QWORD *)(v5 + 144) = v12;

    v14 = -[GEORPMerchantLookupFeedback copyWithZone:](self->_merchantLookupFeedback, "copyWithZone:", a3);
    v15 = *(void **)(v5 + 80);
    *(_QWORD *)(v5 + 80) = v14;

    v16 = -[GEORPDirectionsFeedback copyWithZone:](self->_directionsFeedback, "copyWithZone:", a3);
    v17 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v16;

    v18 = -[GEORPAddressFeedback copyWithZone:](self->_addressPointFeedback, "copyWithZone:", a3);
    v19 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = v18;

    v20 = -[GEORPTileFeedback copyWithZone:](self->_tileFeedback, "copyWithZone:", a3);
    v21 = *(void **)(v5 + 168);
    *(_QWORD *)(v5 + 168) = v20;

    v22 = -[GEORPGroundViewFeedback copyWithZone:](self->_groundViewFeedback, "copyWithZone:", a3);
    v23 = *(void **)(v5 + 56);
    *(_QWORD *)(v5 + 56) = v22;

    v24 = -[GEORPPoiEnrichmentUpdate copyWithZone:](self->_poiEnrichmentUpdate, "copyWithZone:", a3);
    v25 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v24;

    v26 = -[GEORPIncidentFeedback copyWithZone:](self->_incidentFeedback, "copyWithZone:", a3);
    v27 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v26;

    v28 = -[GEORPPoiImageFeedback copyWithZone:](self->_poiImageFeedback, "copyWithZone:", a3);
    v29 = *(void **)(v5 + 120);
    *(_QWORD *)(v5 + 120) = v28;

    v30 = -[GEORPCuratedCollectionFeedback copyWithZone:](self->_curatedCollectionFeedback, "copyWithZone:", a3);
    v31 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v30;

    v32 = -[GEORPPoiActivityFeedback copyWithZone:](self->_poiActivityFeedback, "copyWithZone:", a3);
    v33 = *(void **)(v5 + 96);
    *(_QWORD *)(v5 + 96) = v32;

    v34 = -[GEORPAddToMapFeedback copyWithZone:](self->_addMapFeedback, "copyWithZone:", a3);
    v35 = *(void **)(v5 + 24);
    *(_QWORD *)(v5 + 24) = v34;

    v36 = -[GEORPLocalityFeedback copyWithZone:](self->_localityFeedback, "copyWithZone:", a3);
    v37 = *(void **)(v5 + 72);
    *(_QWORD *)(v5 + 72) = v36;

    v38 = -[GEORPStreetFeedback copyWithZone:](self->_streetFeedback, "copyWithZone:", a3);
    v39 = *(void **)(v5 + 152);
    *(_QWORD *)(v5 + 152) = v38;

    v40 = -[GEORPThirdPartyPhotoSharingPreferenceUpdate copyWithZone:](self->_thirdPartyPhotoSharingPreferenceUpdate, "copyWithZone:", a3);
    v41 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = v40;

    v42 = -[GEORPPhotoAttributionPreferencesUpdate copyWithZone:](self->_photoAttributionPreferencesUpdate, "copyWithZone:", a3);
    v43 = *(void **)(v5 + 88);
    *(_QWORD *)(v5 + 88) = v42;

    v44 = -[GEORPRunningTrackFeedback copyWithZone:](self->_runningTrackFeedback, "copyWithZone:", a3);
    v45 = *(void **)(v5 + 136);
    *(_QWORD *)(v5 + 136) = v44;

    v46 = -[GEORPRapUserResponseFeedback copyWithZone:](self->_rapUserResponseFeedback, "copyWithZone:", a3);
    v47 = *(void **)(v5 + 128);
    *(_QWORD *)(v5 + 128) = v46;

    objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
    return (id)v5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEORPFeedbackDetailsReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  GEORPPoiFeedback *poiFeedback;
  GEORPTransitPoiFeedback *transitPoiFeedback;
  GEORPSearchFeedback *searchFeedback;
  GEORPMerchantLookupFeedback *merchantLookupFeedback;
  GEORPDirectionsFeedback *directionsFeedback;
  GEORPAddressFeedback *addressPointFeedback;
  GEORPTileFeedback *tileFeedback;
  GEORPGroundViewFeedback *groundViewFeedback;
  GEORPPoiEnrichmentUpdate *poiEnrichmentUpdate;
  GEORPIncidentFeedback *incidentFeedback;
  GEORPPoiImageFeedback *poiImageFeedback;
  GEORPCuratedCollectionFeedback *curatedCollectionFeedback;
  GEORPPoiActivityFeedback *poiActivityFeedback;
  GEORPAddToMapFeedback *addMapFeedback;
  GEORPLocalityFeedback *localityFeedback;
  GEORPStreetFeedback *streetFeedback;
  GEORPThirdPartyPhotoSharingPreferenceUpdate *thirdPartyPhotoSharingPreferenceUpdate;
  GEORPPhotoAttributionPreferencesUpdate *photoAttributionPreferencesUpdate;
  GEORPRunningTrackFeedback *runningTrackFeedback;
  GEORPRapUserResponseFeedback *rapUserResponseFeedback;
  char v25;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_42;
  -[GEORPFeedbackDetails readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  poiFeedback = self->_poiFeedback;
  if ((unint64_t)poiFeedback | v4[14])
  {
    if (!-[GEORPPoiFeedback isEqual:](poiFeedback, "isEqual:"))
      goto LABEL_42;
  }
  transitPoiFeedback = self->_transitPoiFeedback;
  if ((unint64_t)transitPoiFeedback | v4[22]
    && !-[GEORPTransitPoiFeedback isEqual:](transitPoiFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  searchFeedback = self->_searchFeedback;
  if ((unint64_t)searchFeedback | v4[18] && !-[GEORPSearchFeedback isEqual:](searchFeedback, "isEqual:"))
    goto LABEL_42;
  merchantLookupFeedback = self->_merchantLookupFeedback;
  if ((unint64_t)merchantLookupFeedback | v4[10]
    && !-[GEORPMerchantLookupFeedback isEqual:](merchantLookupFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  directionsFeedback = self->_directionsFeedback;
  if ((unint64_t)directionsFeedback | v4[6]
    && !-[GEORPDirectionsFeedback isEqual:](directionsFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  addressPointFeedback = self->_addressPointFeedback;
  if ((unint64_t)addressPointFeedback | v4[4]
    && !-[GEORPAddressFeedback isEqual:](addressPointFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  tileFeedback = self->_tileFeedback;
  if ((unint64_t)tileFeedback | v4[21] && !-[GEORPTileFeedback isEqual:](tileFeedback, "isEqual:"))
    goto LABEL_42;
  groundViewFeedback = self->_groundViewFeedback;
  if ((unint64_t)groundViewFeedback | v4[7]
    && !-[GEORPGroundViewFeedback isEqual:](groundViewFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  poiEnrichmentUpdate = self->_poiEnrichmentUpdate;
  if ((unint64_t)poiEnrichmentUpdate | v4[13]
    && !-[GEORPPoiEnrichmentUpdate isEqual:](poiEnrichmentUpdate, "isEqual:"))
  {
    goto LABEL_42;
  }
  incidentFeedback = self->_incidentFeedback;
  if ((unint64_t)incidentFeedback | v4[8] && !-[GEORPIncidentFeedback isEqual:](incidentFeedback, "isEqual:"))
    goto LABEL_42;
  poiImageFeedback = self->_poiImageFeedback;
  if ((unint64_t)poiImageFeedback | v4[15] && !-[GEORPPoiImageFeedback isEqual:](poiImageFeedback, "isEqual:"))
    goto LABEL_42;
  curatedCollectionFeedback = self->_curatedCollectionFeedback;
  if ((unint64_t)curatedCollectionFeedback | v4[5]
    && !-[GEORPCuratedCollectionFeedback isEqual:](curatedCollectionFeedback, "isEqual:"))
  {
    goto LABEL_42;
  }
  if (((poiActivityFeedback = self->_poiActivityFeedback, !((unint64_t)poiActivityFeedback | v4[12]))
     || -[GEORPPoiActivityFeedback isEqual:](poiActivityFeedback, "isEqual:"))
    && ((addMapFeedback = self->_addMapFeedback, !((unint64_t)addMapFeedback | v4[3]))
     || -[GEORPAddToMapFeedback isEqual:](addMapFeedback, "isEqual:"))
    && ((localityFeedback = self->_localityFeedback, !((unint64_t)localityFeedback | v4[9]))
     || -[GEORPLocalityFeedback isEqual:](localityFeedback, "isEqual:"))
    && ((streetFeedback = self->_streetFeedback, !((unint64_t)streetFeedback | v4[19]))
     || -[GEORPStreetFeedback isEqual:](streetFeedback, "isEqual:"))
    && ((thirdPartyPhotoSharingPreferenceUpdate = self->_thirdPartyPhotoSharingPreferenceUpdate,
         !((unint64_t)thirdPartyPhotoSharingPreferenceUpdate | v4[20]))
     || -[GEORPThirdPartyPhotoSharingPreferenceUpdate isEqual:](thirdPartyPhotoSharingPreferenceUpdate, "isEqual:"))
    && ((photoAttributionPreferencesUpdate = self->_photoAttributionPreferencesUpdate,
         !((unint64_t)photoAttributionPreferencesUpdate | v4[11]))
     || -[GEORPPhotoAttributionPreferencesUpdate isEqual:](photoAttributionPreferencesUpdate, "isEqual:"))
    && ((runningTrackFeedback = self->_runningTrackFeedback, !((unint64_t)runningTrackFeedback | v4[17]))
     || -[GEORPRunningTrackFeedback isEqual:](runningTrackFeedback, "isEqual:")))
  {
    rapUserResponseFeedback = self->_rapUserResponseFeedback;
    if ((unint64_t)rapUserResponseFeedback | v4[16])
      v25 = -[GEORPRapUserResponseFeedback isEqual:](rapUserResponseFeedback, "isEqual:");
    else
      v25 = 1;
  }
  else
  {
LABEL_42:
    v25 = 0;
  }

  return v25;
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
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;

  -[GEORPFeedbackDetails readAll:](self, "readAll:", 1);
  v3 = -[GEORPPoiFeedback hash](self->_poiFeedback, "hash");
  v4 = -[GEORPTransitPoiFeedback hash](self->_transitPoiFeedback, "hash") ^ v3;
  v5 = -[GEORPSearchFeedback hash](self->_searchFeedback, "hash");
  v6 = v4 ^ v5 ^ -[GEORPMerchantLookupFeedback hash](self->_merchantLookupFeedback, "hash");
  v7 = -[GEORPDirectionsFeedback hash](self->_directionsFeedback, "hash");
  v8 = v7 ^ -[GEORPAddressFeedback hash](self->_addressPointFeedback, "hash");
  v9 = v6 ^ v8 ^ -[GEORPTileFeedback hash](self->_tileFeedback, "hash");
  v10 = -[GEORPGroundViewFeedback hash](self->_groundViewFeedback, "hash");
  v11 = v10 ^ -[GEORPPoiEnrichmentUpdate hash](self->_poiEnrichmentUpdate, "hash");
  v12 = v11 ^ -[GEORPIncidentFeedback hash](self->_incidentFeedback, "hash");
  v13 = v9 ^ v12 ^ -[GEORPPoiImageFeedback hash](self->_poiImageFeedback, "hash");
  v14 = -[GEORPCuratedCollectionFeedback hash](self->_curatedCollectionFeedback, "hash");
  v15 = v14 ^ -[GEORPPoiActivityFeedback hash](self->_poiActivityFeedback, "hash");
  v16 = v15 ^ -[GEORPAddToMapFeedback hash](self->_addMapFeedback, "hash");
  v17 = v16 ^ -[GEORPLocalityFeedback hash](self->_localityFeedback, "hash");
  v18 = v13 ^ v17 ^ -[GEORPStreetFeedback hash](self->_streetFeedback, "hash");
  v19 = -[GEORPThirdPartyPhotoSharingPreferenceUpdate hash](self->_thirdPartyPhotoSharingPreferenceUpdate, "hash");
  v20 = v19 ^ -[GEORPPhotoAttributionPreferencesUpdate hash](self->_photoAttributionPreferencesUpdate, "hash");
  v21 = v20 ^ -[GEORPRunningTrackFeedback hash](self->_runningTrackFeedback, "hash");
  return v18 ^ v21 ^ -[GEORPRapUserResponseFeedback hash](self->_rapUserResponseFeedback, "hash");
}

- (void)mergeFrom:(id)a3
{
  GEORPPoiFeedback *poiFeedback;
  uint64_t v5;
  GEORPTransitPoiFeedback *transitPoiFeedback;
  uint64_t v7;
  GEORPSearchFeedback *searchFeedback;
  uint64_t v9;
  GEORPMerchantLookupFeedback *merchantLookupFeedback;
  uint64_t v11;
  GEORPDirectionsFeedback *directionsFeedback;
  uint64_t v13;
  GEORPAddressFeedback *addressPointFeedback;
  uint64_t v15;
  GEORPTileFeedback *tileFeedback;
  uint64_t v17;
  GEORPGroundViewFeedback *groundViewFeedback;
  uint64_t v19;
  GEORPPoiEnrichmentUpdate *poiEnrichmentUpdate;
  uint64_t v21;
  GEORPIncidentFeedback *incidentFeedback;
  uint64_t v23;
  GEORPPoiImageFeedback *poiImageFeedback;
  uint64_t v25;
  GEORPCuratedCollectionFeedback *curatedCollectionFeedback;
  uint64_t v27;
  GEORPPoiActivityFeedback *poiActivityFeedback;
  uint64_t v29;
  GEORPAddToMapFeedback *addMapFeedback;
  uint64_t v31;
  GEORPLocalityFeedback *localityFeedback;
  uint64_t v33;
  GEORPStreetFeedback *streetFeedback;
  uint64_t v35;
  GEORPThirdPartyPhotoSharingPreferenceUpdate *thirdPartyPhotoSharingPreferenceUpdate;
  uint64_t v37;
  GEORPPhotoAttributionPreferencesUpdate *photoAttributionPreferencesUpdate;
  uint64_t v39;
  GEORPRunningTrackFeedback *runningTrackFeedback;
  uint64_t v41;
  GEORPRapUserResponseFeedback *rapUserResponseFeedback;
  uint64_t v43;
  _QWORD *v44;

  v44 = a3;
  objc_msgSend(v44, "readAll:", 0);
  poiFeedback = self->_poiFeedback;
  v5 = v44[14];
  if (poiFeedback)
  {
    if (v5)
      -[GEORPPoiFeedback mergeFrom:](poiFeedback, "mergeFrom:");
  }
  else if (v5)
  {
    -[GEORPFeedbackDetails setPoiFeedback:](self, "setPoiFeedback:");
  }
  transitPoiFeedback = self->_transitPoiFeedback;
  v7 = v44[22];
  if (transitPoiFeedback)
  {
    if (v7)
      -[GEORPTransitPoiFeedback mergeFrom:](transitPoiFeedback, "mergeFrom:");
  }
  else if (v7)
  {
    -[GEORPFeedbackDetails setTransitPoiFeedback:](self, "setTransitPoiFeedback:");
  }
  searchFeedback = self->_searchFeedback;
  v9 = v44[18];
  if (searchFeedback)
  {
    if (v9)
      -[GEORPSearchFeedback mergeFrom:](searchFeedback, "mergeFrom:");
  }
  else if (v9)
  {
    -[GEORPFeedbackDetails setSearchFeedback:](self, "setSearchFeedback:");
  }
  merchantLookupFeedback = self->_merchantLookupFeedback;
  v11 = v44[10];
  if (merchantLookupFeedback)
  {
    if (v11)
      -[GEORPMerchantLookupFeedback mergeFrom:](merchantLookupFeedback, "mergeFrom:");
  }
  else if (v11)
  {
    -[GEORPFeedbackDetails setMerchantLookupFeedback:](self, "setMerchantLookupFeedback:");
  }
  directionsFeedback = self->_directionsFeedback;
  v13 = v44[6];
  if (directionsFeedback)
  {
    if (v13)
      -[GEORPDirectionsFeedback mergeFrom:](directionsFeedback, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPFeedbackDetails setDirectionsFeedback:](self, "setDirectionsFeedback:");
  }
  addressPointFeedback = self->_addressPointFeedback;
  v15 = v44[4];
  if (addressPointFeedback)
  {
    if (v15)
      -[GEORPAddressFeedback mergeFrom:](addressPointFeedback, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEORPFeedbackDetails setAddressPointFeedback:](self, "setAddressPointFeedback:");
  }
  tileFeedback = self->_tileFeedback;
  v17 = v44[21];
  if (tileFeedback)
  {
    if (v17)
      -[GEORPTileFeedback mergeFrom:](tileFeedback, "mergeFrom:");
  }
  else if (v17)
  {
    -[GEORPFeedbackDetails setTileFeedback:](self, "setTileFeedback:");
  }
  groundViewFeedback = self->_groundViewFeedback;
  v19 = v44[7];
  if (groundViewFeedback)
  {
    if (v19)
      -[GEORPGroundViewFeedback mergeFrom:](groundViewFeedback, "mergeFrom:");
  }
  else if (v19)
  {
    -[GEORPFeedbackDetails setGroundViewFeedback:](self, "setGroundViewFeedback:");
  }
  poiEnrichmentUpdate = self->_poiEnrichmentUpdate;
  v21 = v44[13];
  if (poiEnrichmentUpdate)
  {
    if (v21)
      -[GEORPPoiEnrichmentUpdate mergeFrom:](poiEnrichmentUpdate, "mergeFrom:");
  }
  else if (v21)
  {
    -[GEORPFeedbackDetails setPoiEnrichmentUpdate:](self, "setPoiEnrichmentUpdate:");
  }
  incidentFeedback = self->_incidentFeedback;
  v23 = v44[8];
  if (incidentFeedback)
  {
    if (v23)
      -[GEORPIncidentFeedback mergeFrom:](incidentFeedback, "mergeFrom:");
  }
  else if (v23)
  {
    -[GEORPFeedbackDetails setIncidentFeedback:](self, "setIncidentFeedback:");
  }
  poiImageFeedback = self->_poiImageFeedback;
  v25 = v44[15];
  if (poiImageFeedback)
  {
    if (v25)
      -[GEORPPoiImageFeedback mergeFrom:](poiImageFeedback, "mergeFrom:");
  }
  else if (v25)
  {
    -[GEORPFeedbackDetails setPoiImageFeedback:](self, "setPoiImageFeedback:");
  }
  curatedCollectionFeedback = self->_curatedCollectionFeedback;
  v27 = v44[5];
  if (curatedCollectionFeedback)
  {
    if (v27)
      -[GEORPCuratedCollectionFeedback mergeFrom:](curatedCollectionFeedback, "mergeFrom:");
  }
  else if (v27)
  {
    -[GEORPFeedbackDetails setCuratedCollectionFeedback:](self, "setCuratedCollectionFeedback:");
  }
  poiActivityFeedback = self->_poiActivityFeedback;
  v29 = v44[12];
  if (poiActivityFeedback)
  {
    if (v29)
      -[GEORPPoiActivityFeedback mergeFrom:](poiActivityFeedback, "mergeFrom:");
  }
  else if (v29)
  {
    -[GEORPFeedbackDetails setPoiActivityFeedback:](self, "setPoiActivityFeedback:");
  }
  addMapFeedback = self->_addMapFeedback;
  v31 = v44[3];
  if (addMapFeedback)
  {
    if (v31)
      -[GEORPAddToMapFeedback mergeFrom:](addMapFeedback, "mergeFrom:");
  }
  else if (v31)
  {
    -[GEORPFeedbackDetails setAddMapFeedback:](self, "setAddMapFeedback:");
  }
  localityFeedback = self->_localityFeedback;
  v33 = v44[9];
  if (localityFeedback)
  {
    if (v33)
      -[GEORPLocalityFeedback mergeFrom:](localityFeedback, "mergeFrom:");
  }
  else if (v33)
  {
    -[GEORPFeedbackDetails setLocalityFeedback:](self, "setLocalityFeedback:");
  }
  streetFeedback = self->_streetFeedback;
  v35 = v44[19];
  if (streetFeedback)
  {
    if (v35)
      -[GEORPStreetFeedback mergeFrom:](streetFeedback, "mergeFrom:");
  }
  else if (v35)
  {
    -[GEORPFeedbackDetails setStreetFeedback:](self, "setStreetFeedback:");
  }
  thirdPartyPhotoSharingPreferenceUpdate = self->_thirdPartyPhotoSharingPreferenceUpdate;
  v37 = v44[20];
  if (thirdPartyPhotoSharingPreferenceUpdate)
  {
    if (v37)
      -[GEORPThirdPartyPhotoSharingPreferenceUpdate mergeFrom:](thirdPartyPhotoSharingPreferenceUpdate, "mergeFrom:");
  }
  else if (v37)
  {
    -[GEORPFeedbackDetails setThirdPartyPhotoSharingPreferenceUpdate:](self, "setThirdPartyPhotoSharingPreferenceUpdate:");
  }
  photoAttributionPreferencesUpdate = self->_photoAttributionPreferencesUpdate;
  v39 = v44[11];
  if (photoAttributionPreferencesUpdate)
  {
    if (v39)
      -[GEORPPhotoAttributionPreferencesUpdate mergeFrom:](photoAttributionPreferencesUpdate, "mergeFrom:");
  }
  else if (v39)
  {
    -[GEORPFeedbackDetails setPhotoAttributionPreferencesUpdate:](self, "setPhotoAttributionPreferencesUpdate:");
  }
  runningTrackFeedback = self->_runningTrackFeedback;
  v41 = v44[17];
  if (runningTrackFeedback)
  {
    if (v41)
      -[GEORPRunningTrackFeedback mergeFrom:](runningTrackFeedback, "mergeFrom:");
  }
  else if (v41)
  {
    -[GEORPFeedbackDetails setRunningTrackFeedback:](self, "setRunningTrackFeedback:");
  }
  rapUserResponseFeedback = self->_rapUserResponseFeedback;
  v43 = v44[16];
  if (rapUserResponseFeedback)
  {
    if (v43)
      -[GEORPRapUserResponseFeedback mergeFrom:](rapUserResponseFeedback, "mergeFrom:");
  }
  else if (v43)
  {
    -[GEORPFeedbackDetails setRapUserResponseFeedback:](self, "setRapUserResponseFeedback:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackDetailsReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1158_0);
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
  *(_DWORD *)&self->_flags |= 0x200001u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackDetails readAll:](self, "readAll:", 0);
    -[GEORPPoiFeedback clearUnknownFields:](self->_poiFeedback, "clearUnknownFields:", 1);
    -[GEORPTransitPoiFeedback clearUnknownFields:](self->_transitPoiFeedback, "clearUnknownFields:", 1);
    -[GEORPSearchFeedback clearUnknownFields:](self->_searchFeedback, "clearUnknownFields:", 1);
    -[GEORPMerchantLookupFeedback clearUnknownFields:](self->_merchantLookupFeedback, "clearUnknownFields:", 1);
    -[GEORPDirectionsFeedback clearUnknownFields:](self->_directionsFeedback, "clearUnknownFields:", 1);
    -[GEORPAddressFeedback clearUnknownFields:](self->_addressPointFeedback, "clearUnknownFields:", 1);
    -[GEORPTileFeedback clearUnknownFields:](self->_tileFeedback, "clearUnknownFields:", 1);
    -[GEORPGroundViewFeedback clearUnknownFields:](self->_groundViewFeedback, "clearUnknownFields:", 1);
    -[GEORPPoiImageFeedback clearUnknownFields:](self->_poiImageFeedback, "clearUnknownFields:", 1);
    -[GEORPCuratedCollectionFeedback clearUnknownFields:](self->_curatedCollectionFeedback, "clearUnknownFields:", 1);
    -[GEORPPoiActivityFeedback clearUnknownFields:](self->_poiActivityFeedback, "clearUnknownFields:", 1);
    -[GEORPAddToMapFeedback clearUnknownFields:](self->_addMapFeedback, "clearUnknownFields:", 1);
    -[GEORPLocalityFeedback clearUnknownFields:](self->_localityFeedback, "clearUnknownFields:", 1);
    -[GEORPStreetFeedback clearUnknownFields:](self->_streetFeedback, "clearUnknownFields:", 1);
    -[GEORPRunningTrackFeedback clearUnknownFields:](self->_runningTrackFeedback, "clearUnknownFields:", 1);
    -[GEORPRapUserResponseFeedback clearUnknownFields:](self->_rapUserResponseFeedback, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitPoiFeedback, 0);
  objc_storeStrong((id *)&self->_tileFeedback, 0);
  objc_storeStrong((id *)&self->_thirdPartyPhotoSharingPreferenceUpdate, 0);
  objc_storeStrong((id *)&self->_streetFeedback, 0);
  objc_storeStrong((id *)&self->_searchFeedback, 0);
  objc_storeStrong((id *)&self->_runningTrackFeedback, 0);
  objc_storeStrong((id *)&self->_rapUserResponseFeedback, 0);
  objc_storeStrong((id *)&self->_poiImageFeedback, 0);
  objc_storeStrong((id *)&self->_poiFeedback, 0);
  objc_storeStrong((id *)&self->_poiEnrichmentUpdate, 0);
  objc_storeStrong((id *)&self->_poiActivityFeedback, 0);
  objc_storeStrong((id *)&self->_photoAttributionPreferencesUpdate, 0);
  objc_storeStrong((id *)&self->_merchantLookupFeedback, 0);
  objc_storeStrong((id *)&self->_localityFeedback, 0);
  objc_storeStrong((id *)&self->_incidentFeedback, 0);
  objc_storeStrong((id *)&self->_groundViewFeedback, 0);
  objc_storeStrong((id *)&self->_directionsFeedback, 0);
  objc_storeStrong((id *)&self->_curatedCollectionFeedback, 0);
  objc_storeStrong((id *)&self->_addressPointFeedback, 0);
  objc_storeStrong((id *)&self->_addMapFeedback, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
