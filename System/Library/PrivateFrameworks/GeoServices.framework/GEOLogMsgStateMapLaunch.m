@implementation GEOLogMsgStateMapLaunch

- (GEOLogMsgStateMapLaunch)init
{
  GEOLogMsgStateMapLaunch *v2;
  GEOLogMsgStateMapLaunch *v3;
  GEOLogMsgStateMapLaunch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOLogMsgStateMapLaunch;
  v2 = -[GEOLogMsgStateMapLaunch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOLogMsgStateMapLaunch)initWithData:(id)a3
{
  GEOLogMsgStateMapLaunch *v3;
  GEOLogMsgStateMapLaunch *v4;
  GEOLogMsgStateMapLaunch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOLogMsgStateMapLaunch;
  v3 = -[GEOLogMsgStateMapLaunch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readSourceAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceAppId_tags_6297);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceAppId
{
  -[GEOLogMsgStateMapLaunch _readSourceAppId]((uint64_t)self);
  return self->_sourceAppId != 0;
}

- (NSString)sourceAppId
{
  -[GEOLogMsgStateMapLaunch _readSourceAppId]((uint64_t)self);
  return self->_sourceAppId;
}

- (void)setSourceAppId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_sourceAppId, a3);
}

- (void)_readLaunchUri
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLaunchUri_tags_6298);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasLaunchUri
{
  -[GEOLogMsgStateMapLaunch _readLaunchUri]((uint64_t)self);
  return self->_launchUri != 0;
}

- (NSString)launchUri
{
  -[GEOLogMsgStateMapLaunch _readLaunchUri]((uint64_t)self);
  return self->_launchUri;
}

- (void)setLaunchUri:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_launchUri, a3);
}

- (void)_readReferringWebsite
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readReferringWebsite_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasReferringWebsite
{
  -[GEOLogMsgStateMapLaunch _readReferringWebsite]((uint64_t)self);
  return self->_referringWebsite != 0;
}

- (NSString)referringWebsite
{
  -[GEOLogMsgStateMapLaunch _readReferringWebsite]((uint64_t)self);
  return self->_referringWebsite;
}

- (void)setReferringWebsite:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_referringWebsite, a3);
}

- (BOOL)isHandoff
{
  return self->_isHandoff;
}

- (void)setIsHandoff:(BOOL)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  self->_isHandoff = a3;
}

- (void)setHasIsHandoff:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -124;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFB | v3;
}

- (BOOL)hasIsHandoff
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readSourceHandoffDevice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 72) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOLogMsgStateMapLaunchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceHandoffDevice_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasSourceHandoffDevice
{
  -[GEOLogMsgStateMapLaunch _readSourceHandoffDevice]((uint64_t)self);
  return self->_sourceHandoffDevice != 0;
}

- (NSString)sourceHandoffDevice
{
  -[GEOLogMsgStateMapLaunch _readSourceHandoffDevice]((uint64_t)self);
  return self->_sourceHandoffDevice;
}

- (void)setSourceHandoffDevice:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_sourceHandoffDevice, a3);
}

- (int)launchAction
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 2) != 0)
    return self->_launchAction;
  else
    return 0;
}

- (void)setLaunchAction:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  self->_launchAction = a3;
}

- (void)setHasLaunchAction:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = -126;
  else
    v3 = 0x80;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasLaunchAction
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)launchActionAsString:(int)a3
{
  if (a3 < 0x2A)
    return off_1E1C22AD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLaunchAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowLPROnboardingAction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowCarDestinationsAction")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SharedTripAction")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowCollectionAction")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_BrandAction")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_DirectionAction")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_DisplayModeNavAction")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ErrorAction")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ForwardGeocodeAction")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_LowFuelAction")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_MarkUserLocationAction")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_NotificationRestorationAction")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_OpenLookAroundAction")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PlaceRefinementAction")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentAnnouncementAction")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentFlyoverAction")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentNavShareETAAction")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentNearbySearchAction")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentParkedCarAction")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentRAPAction")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentPhotoThumbnailGalleryAction")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentTableBookingAction")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_RefineMapItemAction")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ResetAction")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ResolveMUIDAction")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_RestorationAction")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ReverseGeocodeAction")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SearchAction")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SearchSelectionAction")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShareUserLocationAction")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowKeyboardAction")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowSearchInfoAction")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ZoomMapAction")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowCuratedCollectionAction")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowPublisherAction")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_NewWindowAction")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowAllCuratedCollectionsAction")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ReportIncidentAction")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_URLRestorationAction")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SiriRestorationAction")) & 1) != 0)
  {
    v4 = 40;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_Showcase")))
  {
    v4 = 41;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)launchActionInternal
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_launchActionInternal;
  else
    return 0;
}

- (void)setLaunchActionInternal:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_launchActionInternal = a3;
}

- (void)setHasLaunchActionInternal:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasLaunchActionInternal
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)launchActionInternalAsString:(int)a3
{
  if (a3 < 0x2A)
    return off_1E1C22AD0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsLaunchActionInternal:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowLPROnboardingAction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowCarDestinationsAction")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SharedTripAction")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowCollectionAction")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_BrandAction")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_DirectionAction")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_DisplayModeNavAction")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ErrorAction")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ForwardGeocodeAction")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_LowFuelAction")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_MarkUserLocationAction")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_NotificationRestorationAction")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_OpenLookAroundAction")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PlaceRefinementAction")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentAnnouncementAction")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentFlyoverAction")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentNavShareETAAction")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentNearbySearchAction")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentParkedCarAction")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentRAPAction")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentPhotoThumbnailGalleryAction")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_PresentTableBookingAction")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_RefineMapItemAction")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ResetAction")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ResolveMUIDAction")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_RestorationAction")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ReverseGeocodeAction")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SearchAction")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SearchSelectionAction")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShareUserLocationAction")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowKeyboardAction")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowSearchInfoAction")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ZoomMapAction")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowCuratedCollectionAction")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowPublisherAction")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_NewWindowAction")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ShowAllCuratedCollectionsAction")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_ReportIncidentAction")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_URLRestorationAction")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_SiriRestorationAction")) & 1) != 0)
  {
    v4 = 40;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MapLaunchAction_Showcase")))
  {
    v4 = 41;
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
  v8.super_class = (Class)GEOLogMsgStateMapLaunch;
  -[GEOLogMsgStateMapLaunch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStateMapLaunch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStateMapLaunch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  char v15;
  uint64_t v16;
  __CFString *v17;
  const __CFString *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "sourceAppId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (a2)
        v6 = CFSTR("sourceAppId");
      else
        v6 = CFSTR("source_app_id");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);
    }

    objc_msgSend((id)a1, "launchUri");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("launchUri");
      else
        v8 = CFSTR("launch_uri");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
    }

    objc_msgSend((id)a1, "referringWebsite");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (a2)
        v10 = CFSTR("referringWebsite");
      else
        v10 = CFSTR("referring_website");
      objc_msgSend(v4, "setObject:forKey:", v9, v10);
    }

    if ((*(_BYTE *)(a1 + 72) & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v12 = CFSTR("isHandoff");
      else
        v12 = CFSTR("is_handoff");
      objc_msgSend(v4, "setObject:forKey:", v11, v12);

    }
    objc_msgSend((id)a1, "sourceHandoffDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (a2)
        v14 = CFSTR("sourceHandoffDevice");
      else
        v14 = CFSTR("source_handoff_device");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);
    }

    v15 = *(_BYTE *)(a1 + 72);
    if ((v15 & 2) != 0)
    {
      v16 = *(int *)(a1 + 64);
      if (v16 >= 0x2A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 64));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = off_1E1C22AD0[v16];
      }
      if (a2)
        v18 = CFSTR("launchAction");
      else
        v18 = CFSTR("launch_action");
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

      v15 = *(_BYTE *)(a1 + 72);
    }
    if ((v15 & 1) != 0)
    {
      v19 = *(int *)(a1 + 60);
      if (v19 >= 0x2A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v20 = off_1E1C22AD0[v19];
      }
      if (a2)
        v21 = CFSTR("launchActionInternal");
      else
        v21 = CFSTR("launch_action_internal");
      objc_msgSend(v4, "setObject:forKey:", v20, v21);

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOLogMsgStateMapLaunch _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStateMapLaunch)initWithDictionary:(id)a3
{
  return (GEOLogMsgStateMapLaunch *)-[GEOLogMsgStateMapLaunch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  id v26;
  uint64_t v27;

  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      if (a3)
        v6 = CFSTR("sourceAppId");
      else
        v6 = CFSTR("source_app_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(a1, "setSourceAppId:", v8);

      }
      if (a3)
        v9 = CFSTR("launchUri");
      else
        v9 = CFSTR("launch_uri");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = (void *)objc_msgSend(v10, "copy");
        objc_msgSend(a1, "setLaunchUri:", v11);

      }
      if (a3)
        v12 = CFSTR("referringWebsite");
      else
        v12 = CFSTR("referring_website");
      objc_msgSend(v5, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = (void *)objc_msgSend(v13, "copy");
        objc_msgSend(a1, "setReferringWebsite:", v14);

      }
      if (a3)
        v15 = CFSTR("isHandoff");
      else
        v15 = CFSTR("is_handoff");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setIsHandoff:", objc_msgSend(v16, "BOOLValue"));

      if (a3)
        v17 = CFSTR("sourceHandoffDevice");
      else
        v17 = CFSTR("source_handoff_device");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = (void *)objc_msgSend(v18, "copy");
        objc_msgSend(a1, "setSourceHandoffDevice:", v19);

      }
      if (a3)
        v20 = CFSTR("launchAction");
      else
        v20 = CFSTR("launch_action");
      objc_msgSend(v5, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = v21;
        if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_Unknown")) & 1) != 0)
        {
          v23 = 0;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowLPROnboardingAction")) & 1) != 0)
        {
          v23 = 1;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowCarDestinationsAction")) & 1) != 0)
        {
          v23 = 2;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_SharedTripAction")) & 1) != 0)
        {
          v23 = 3;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowCollectionAction")) & 1) != 0)
        {
          v23 = 4;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_BrandAction")) & 1) != 0)
        {
          v23 = 5;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_DirectionAction")) & 1) != 0)
        {
          v23 = 6;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_DisplayModeNavAction")) & 1) != 0)
        {
          v23 = 7;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ErrorAction")) & 1) != 0)
        {
          v23 = 8;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ForwardGeocodeAction")) & 1) != 0)
        {
          v23 = 9;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_LowFuelAction")) & 1) != 0)
        {
          v23 = 10;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_MarkUserLocationAction")) & 1) != 0)
        {
          v23 = 11;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_NotificationRestorationAction")) & 1) != 0)
        {
          v23 = 12;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_OpenLookAroundAction")) & 1) != 0)
        {
          v23 = 13;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PlaceRefinementAction")) & 1) != 0)
        {
          v23 = 14;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentAnnouncementAction")) & 1) != 0)
        {
          v23 = 15;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentFlyoverAction")) & 1) != 0)
        {
          v23 = 16;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentNavShareETAAction")) & 1) != 0)
        {
          v23 = 17;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentNearbySearchAction")) & 1) != 0)
        {
          v23 = 18;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentParkedCarAction")) & 1) != 0)
        {
          v23 = 19;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentRAPAction")) & 1) != 0)
        {
          v23 = 20;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentPhotoThumbnailGalleryAction")) & 1) != 0)
        {
          v23 = 21;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_PresentTableBookingAction")) & 1) != 0)
        {
          v23 = 22;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_RefineMapItemAction")) & 1) != 0)
        {
          v23 = 23;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ResetAction")) & 1) != 0)
        {
          v23 = 24;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ResolveMUIDAction")) & 1) != 0)
        {
          v23 = 25;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_RestorationAction")) & 1) != 0)
        {
          v23 = 26;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ReverseGeocodeAction")) & 1) != 0)
        {
          v23 = 27;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_SearchAction")) & 1) != 0)
        {
          v23 = 28;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_SearchSelectionAction")) & 1) != 0)
        {
          v23 = 29;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShareUserLocationAction")) & 1) != 0)
        {
          v23 = 30;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowKeyboardAction")) & 1) != 0)
        {
          v23 = 31;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowSearchInfoAction")) & 1) != 0)
        {
          v23 = 32;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ZoomMapAction")) & 1) != 0)
        {
          v23 = 33;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowCuratedCollectionAction")) & 1) != 0)
        {
          v23 = 34;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowPublisherAction")) & 1) != 0)
        {
          v23 = 35;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_NewWindowAction")) & 1) != 0)
        {
          v23 = 36;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ShowAllCuratedCollectionsAction")) & 1) != 0)
        {
          v23 = 37;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_ReportIncidentAction")) & 1) != 0)
        {
          v23 = 38;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_URLRestorationAction")) & 1) != 0)
        {
          v23 = 39;
        }
        else if ((objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_SiriRestorationAction")) & 1) != 0)
        {
          v23 = 40;
        }
        else if (objc_msgSend(v22, "isEqualToString:", CFSTR("MapLaunchAction_Showcase")))
        {
          v23 = 41;
        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_121;
        v23 = objc_msgSend(v21, "intValue");
      }
      objc_msgSend(a1, "setLaunchAction:", v23);
LABEL_121:

      if (a3)
        v24 = CFSTR("launchActionInternal");
      else
        v24 = CFSTR("launch_action_internal");
      objc_msgSend(v5, "objectForKeyedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v26 = v25;
        if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_Unknown")) & 1) != 0)
        {
          v27 = 0;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowLPROnboardingAction")) & 1) != 0)
        {
          v27 = 1;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowCarDestinationsAction")) & 1) != 0)
        {
          v27 = 2;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_SharedTripAction")) & 1) != 0)
        {
          v27 = 3;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowCollectionAction")) & 1) != 0)
        {
          v27 = 4;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_BrandAction")) & 1) != 0)
        {
          v27 = 5;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_DirectionAction")) & 1) != 0)
        {
          v27 = 6;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_DisplayModeNavAction")) & 1) != 0)
        {
          v27 = 7;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ErrorAction")) & 1) != 0)
        {
          v27 = 8;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ForwardGeocodeAction")) & 1) != 0)
        {
          v27 = 9;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_LowFuelAction")) & 1) != 0)
        {
          v27 = 10;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_MarkUserLocationAction")) & 1) != 0)
        {
          v27 = 11;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_NotificationRestorationAction")) & 1) != 0)
        {
          v27 = 12;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_OpenLookAroundAction")) & 1) != 0)
        {
          v27 = 13;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PlaceRefinementAction")) & 1) != 0)
        {
          v27 = 14;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentAnnouncementAction")) & 1) != 0)
        {
          v27 = 15;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentFlyoverAction")) & 1) != 0)
        {
          v27 = 16;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentNavShareETAAction")) & 1) != 0)
        {
          v27 = 17;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentNearbySearchAction")) & 1) != 0)
        {
          v27 = 18;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentParkedCarAction")) & 1) != 0)
        {
          v27 = 19;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentRAPAction")) & 1) != 0)
        {
          v27 = 20;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentPhotoThumbnailGalleryAction")) & 1) != 0)
        {
          v27 = 21;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_PresentTableBookingAction")) & 1) != 0)
        {
          v27 = 22;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_RefineMapItemAction")) & 1) != 0)
        {
          v27 = 23;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ResetAction")) & 1) != 0)
        {
          v27 = 24;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ResolveMUIDAction")) & 1) != 0)
        {
          v27 = 25;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_RestorationAction")) & 1) != 0)
        {
          v27 = 26;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ReverseGeocodeAction")) & 1) != 0)
        {
          v27 = 27;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_SearchAction")) & 1) != 0)
        {
          v27 = 28;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_SearchSelectionAction")) & 1) != 0)
        {
          v27 = 29;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShareUserLocationAction")) & 1) != 0)
        {
          v27 = 30;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowKeyboardAction")) & 1) != 0)
        {
          v27 = 31;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowSearchInfoAction")) & 1) != 0)
        {
          v27 = 32;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ZoomMapAction")) & 1) != 0)
        {
          v27 = 33;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowCuratedCollectionAction")) & 1) != 0)
        {
          v27 = 34;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowPublisherAction")) & 1) != 0)
        {
          v27 = 35;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_NewWindowAction")) & 1) != 0)
        {
          v27 = 36;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ShowAllCuratedCollectionsAction")) & 1) != 0)
        {
          v27 = 37;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_ReportIncidentAction")) & 1) != 0)
        {
          v27 = 38;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_URLRestorationAction")) & 1) != 0)
        {
          v27 = 39;
        }
        else if ((objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_SiriRestorationAction")) & 1) != 0)
        {
          v27 = 40;
        }
        else if (objc_msgSend(v26, "isEqualToString:", CFSTR("MapLaunchAction_Showcase")))
        {
          v27 = 41;
        }
        else
        {
          v27 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_214:

          goto LABEL_215;
        }
        v27 = objc_msgSend(v25, "intValue");
      }
      objc_msgSend(a1, "setLaunchActionInternal:", v27);
      goto LABEL_214;
    }
  }
LABEL_215:

  return a1;
}

- (GEOLogMsgStateMapLaunch)initWithJSON:(id)a3
{
  return (GEOLogMsgStateMapLaunch *)-[GEOLogMsgStateMapLaunch _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_6319;
    else
      v8 = (int *)&readAll__nonRecursiveTag_6320;
    GEOLogMsgStateMapLaunchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStateMapLaunchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStateMapLaunchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 7u))
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
    -[GEOLogMsgStateMapLaunch readAll:](self, "readAll:", 0);
    if (self->_sourceAppId)
      PBDataWriterWriteStringField();
    if (self->_launchUri)
      PBDataWriterWriteStringField();
    if (self->_referringWebsite)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_sourceHandoffDevice)
      PBDataWriterWriteStringField();
    flags = (char)self->_flags;
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (char)self->_flags;
    }
    if ((flags & 1) != 0)
      PBDataWriterWriteInt32Field();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  char flags;
  id *v6;

  v6 = (id *)a3;
  -[GEOLogMsgStateMapLaunch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v6 + 1, self->_reader);
  *((_DWORD *)v6 + 12) = self->_readerMarkPos;
  *((_DWORD *)v6 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_sourceAppId)
    objc_msgSend(v6, "setSourceAppId:");
  if (self->_launchUri)
    objc_msgSend(v6, "setLaunchUri:");
  v4 = v6;
  if (self->_referringWebsite)
  {
    objc_msgSend(v6, "setReferringWebsite:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *((_BYTE *)v4 + 68) = self->_isHandoff;
    *((_BYTE *)v4 + 72) |= 4u;
  }
  if (self->_sourceHandoffDevice)
  {
    objc_msgSend(v6, "setSourceHandoffDevice:");
    v4 = v6;
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_launchAction;
    *((_BYTE *)v4 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *((_DWORD *)v4 + 15) = self->_launchActionInternal;
    *((_BYTE *)v4 + 72) |= 1u;
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char flags;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x80000000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOLogMsgStateMapLaunchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOLogMsgStateMapLaunch readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_sourceAppId, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_launchUri, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v11;

  v13 = -[NSString copyWithZone:](self->_referringWebsite, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 68) = self->_isHandoff;
    *(_BYTE *)(v5 + 72) |= 4u;
  }
  v15 = -[NSString copyWithZone:](self->_sourceHandoffDevice, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  flags = (char)self->_flags;
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 64) = self->_launchAction;
    *(_BYTE *)(v5 + 72) |= 2u;
    flags = (char)self->_flags;
  }
  if ((flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_launchActionInternal;
    *(_BYTE *)(v5 + 72) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sourceAppId;
  NSString *launchUri;
  NSString *referringWebsite;
  char flags;
  char v9;
  NSString *sourceHandoffDevice;
  BOOL v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_28;
  -[GEOLogMsgStateMapLaunch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  sourceAppId = self->_sourceAppId;
  if ((unint64_t)sourceAppId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sourceAppId, "isEqual:"))
      goto LABEL_28;
  }
  launchUri = self->_launchUri;
  if ((unint64_t)launchUri | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](launchUri, "isEqual:"))
      goto LABEL_28;
  }
  referringWebsite = self->_referringWebsite;
  if ((unint64_t)referringWebsite | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](referringWebsite, "isEqual:"))
      goto LABEL_28;
  }
  flags = (char)self->_flags;
  v9 = *((_BYTE *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 72) & 4) == 0)
      goto LABEL_28;
    if (self->_isHandoff)
    {
      if (!*((_BYTE *)v4 + 68))
        goto LABEL_28;
    }
    else if (*((_BYTE *)v4 + 68))
    {
      goto LABEL_28;
    }
  }
  else if ((*((_BYTE *)v4 + 72) & 4) != 0)
  {
    goto LABEL_28;
  }
  sourceHandoffDevice = self->_sourceHandoffDevice;
  if (!((unint64_t)sourceHandoffDevice | *((_QWORD *)v4 + 5)))
    goto LABEL_19;
  if (!-[NSString isEqual:](sourceHandoffDevice, "isEqual:"))
  {
LABEL_28:
    v11 = 0;
    goto LABEL_29;
  }
  flags = (char)self->_flags;
  v9 = *((_BYTE *)v4 + 72);
LABEL_19:
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_launchAction != *((_DWORD *)v4 + 16))
      goto LABEL_28;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_28;
  }
  v11 = (v9 & 1) == 0;
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_launchActionInternal != *((_DWORD *)v4 + 15))
      goto LABEL_28;
    v11 = 1;
  }
LABEL_29:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;

  -[GEOLogMsgStateMapLaunch readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_sourceAppId, "hash");
  v4 = -[NSString hash](self->_launchUri, "hash");
  v5 = -[NSString hash](self->_referringWebsite, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v6 = 2654435761 * self->_isHandoff;
  else
    v6 = 0;
  v7 = -[NSString hash](self->_sourceHandoffDevice, "hash");
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    v8 = 2654435761 * self->_launchAction;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_6;
LABEL_8:
    v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  v8 = 0;
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    goto LABEL_8;
LABEL_6:
  v9 = 2654435761 * self->_launchActionInternal;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  char v5;
  _QWORD *v6;

  v6 = a3;
  objc_msgSend(v6, "readAll:", 0);
  v4 = v6;
  if (v6[4])
  {
    -[GEOLogMsgStateMapLaunch setSourceAppId:](self, "setSourceAppId:");
    v4 = v6;
  }
  if (v4[2])
  {
    -[GEOLogMsgStateMapLaunch setLaunchUri:](self, "setLaunchUri:");
    v4 = v6;
  }
  if (v4[3])
  {
    -[GEOLogMsgStateMapLaunch setReferringWebsite:](self, "setReferringWebsite:");
    v4 = v6;
  }
  if ((v4[9] & 4) != 0)
  {
    self->_isHandoff = *((_BYTE *)v4 + 68);
    *(_BYTE *)&self->_flags |= 4u;
  }
  if (v4[5])
  {
    -[GEOLogMsgStateMapLaunch setSourceHandoffDevice:](self, "setSourceHandoffDevice:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 72);
  if ((v5 & 2) != 0)
  {
    self->_launchAction = *((_DWORD *)v4 + 16);
    *(_BYTE *)&self->_flags |= 2u;
    v5 = *((_BYTE *)v4 + 72);
  }
  if ((v5 & 1) != 0)
  {
    self->_launchActionInternal = *((_DWORD *)v4 + 15);
    *(_BYTE *)&self->_flags |= 1u;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceHandoffDevice, 0);
  objc_storeStrong((id *)&self->_sourceAppId, 0);
  objc_storeStrong((id *)&self->_referringWebsite, 0);
  objc_storeStrong((id *)&self->_launchUri, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
