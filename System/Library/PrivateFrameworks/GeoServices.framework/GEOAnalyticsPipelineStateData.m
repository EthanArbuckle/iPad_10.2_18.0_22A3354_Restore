@implementation GEOAnalyticsPipelineStateData

- (GEOAnalyticsPipelineStateData)init
{
  GEOAnalyticsPipelineStateData *v2;
  GEOAnalyticsPipelineStateData *v3;
  GEOAnalyticsPipelineStateData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOAnalyticsPipelineStateData;
  v2 = -[GEOAnalyticsPipelineStateData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOAnalyticsPipelineStateData)initWithData:(id)a3
{
  GEOAnalyticsPipelineStateData *v3;
  GEOAnalyticsPipelineStateData *v4;
  GEOAnalyticsPipelineStateData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOAnalyticsPipelineStateData;
  v3 = -[GEOAnalyticsPipelineStateData initWithData:](&v7, sel_initWithData_, a3);
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

  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOAnalyticsPipelineStateData;
  -[GEOAnalyticsPipelineStateData dealloc](&v3, sel_dealloc);
}

- (void)_readDeviceInputLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x80000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceInputLocale_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasDeviceInputLocale
{
  -[GEOAnalyticsPipelineStateData _readDeviceInputLocale]((uint64_t)self);
  return self->_deviceInputLocale != 0;
}

- (NSString)deviceInputLocale
{
  -[GEOAnalyticsPipelineStateData _readDeviceInputLocale]((uint64_t)self);
  return self->_deviceInputLocale;
}

- (void)setDeviceInputLocale:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x80000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_deviceInputLocale, a3);
}

- (void)_readDeviceOutputLocale
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x100000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readDeviceOutputLocale_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasDeviceOutputLocale
{
  -[GEOAnalyticsPipelineStateData _readDeviceOutputLocale]((uint64_t)self);
  return self->_deviceOutputLocale != 0;
}

- (NSString)deviceOutputLocale
{
  -[GEOAnalyticsPipelineStateData _readDeviceOutputLocale]((uint64_t)self);
  return self->_deviceOutputLocale;
}

- (void)setDeviceOutputLocale:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x100000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_deviceOutputLocale, a3);
}

- (void)_readCarPlayInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x20000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCarPlayInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasCarPlayInfo
{
  -[GEOAnalyticsPipelineStateData _readCarPlayInfo]((uint64_t)self);
  return self->_carPlayInfo != 0;
}

- (GEOCarInfo)carPlayInfo
{
  -[GEOAnalyticsPipelineStateData _readCarPlayInfo]((uint64_t)self);
  return self->_carPlayInfo;
}

- (void)setCarPlayInfo:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x20000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_carPlayInfo, a3);
}

- (BOOL)rideBookingAppInstalled
{
  return self->_rideBookingAppInstalled;
}

- (void)setRideBookingAppInstalled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x100000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_rideBookingAppInstalled = a3;
}

- (void)setHasRideBookingAppInstalled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x100000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFEFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasRideBookingAppInstalled
{
  return HIDWORD(*((_QWORD *)&self->_flags + 1)) & 1;
}

- (BOOL)rideBookingAppEnabled
{
  return self->_rideBookingAppEnabled;
}

- (void)setRideBookingAppEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x80000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_rideBookingAppEnabled = a3;
}

- (void)setHasRideBookingAppEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x80000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFF7FFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasRideBookingAppEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 31) & 1;
}

- (BOOL)tableBookingAppInstalled
{
  return self->_tableBookingAppInstalled;
}

- (void)setTableBookingAppInstalled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x800000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_tableBookingAppInstalled = a3;
}

- (void)setHasTableBookingAppInstalled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x800000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFF7FFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasTableBookingAppInstalled
{
  return (*((_QWORD *)&self->_flags + 1) >> 35) & 1;
}

- (BOOL)tableBookingAppEnabled
{
  return self->_tableBookingAppEnabled;
}

- (void)setTableBookingAppEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x400000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_tableBookingAppEnabled = a3;
}

- (void)setHasTableBookingAppEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x400000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFBFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasTableBookingAppEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 34) & 1;
}

- (double)mapViewZoomLevel
{
  return self->_mapViewZoomLevel;
}

- (void)setMapViewZoomLevel:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x40uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapViewZoomLevel = a3;
}

- (void)setHasMapViewZoomLevel:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 64;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFBFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewZoomLevel
{
  return (*(_QWORD *)&self->_flags >> 6) & 1;
}

- (void)_readMapViewMapRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x8000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapViewMapRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapViewMapRegion
{
  -[GEOAnalyticsPipelineStateData _readMapViewMapRegion]((uint64_t)self);
  return self->_mapViewMapRegion != 0;
}

- (GEOMapRegion)mapViewMapRegion
{
  -[GEOAnalyticsPipelineStateData _readMapViewMapRegion]((uint64_t)self);
  return self->_mapViewMapRegion;
}

- (void)setMapViewMapRegion:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x8000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapViewMapRegion, a3);
}

- (int)mapViewMapType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000000) != 0)
    return self->_mapViewMapType;
  else
    return 0;
}

- (void)setMapViewMapType:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x8000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapViewMapType = a3;
}

- (void)setHasMapViewMapType:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x8000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFF7FFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewMapType
{
  return (*(_QWORD *)&self->_flags >> 39) & 1;
}

- (id)mapViewMapTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C1FEE8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapViewMapType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)mapViewStyleZoomLevel
{
  return self->_mapViewStyleZoomLevel;
}

- (void)setMapViewStyleZoomLevel:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x20uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapViewStyleZoomLevel = a3;
}

- (void)setHasMapViewStyleZoomLevel:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 32;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFDFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewStyleZoomLevel
{
  return (*(_QWORD *)&self->_flags >> 5) & 1;
}

- (double)mapViewPitch
{
  return self->_mapViewPitch;
}

- (void)setMapViewPitch:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x10uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapViewPitch = a3;
}

- (void)setHasMapViewPitch:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 16;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFEFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewPitch
{
  return (*(_QWORD *)&self->_flags >> 4) & 1;
}

- (BOOL)mapViewIsAdvancedMap
{
  return self->_mapViewIsAdvancedMap;
}

- (void)setMapViewIsAdvancedMap:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x800000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapViewIsAdvancedMap = a3;
}

- (void)setHasMapViewIsAdvancedMap:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x800000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFF7FFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewIsAdvancedMap
{
  return (*((_QWORD *)&self->_flags + 1) >> 23) & 1;
}

- (BOOL)mapViewIsGlobeProjection
{
  return self->_mapViewIsGlobeProjection;
}

- (void)setMapViewIsGlobeProjection:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x1000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapViewIsGlobeProjection = a3;
}

- (void)setHasMapViewIsGlobeProjection:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x1000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFEFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewIsGlobeProjection
{
  return (*((_QWORD *)&self->_flags + 1) >> 24) & 1;
}

- (int)mapViewViewMode
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10000000000) != 0)
    return self->_mapViewViewMode;
  else
    return 0;
}

- (void)setMapViewViewMode:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapViewViewMode = a3;
}

- (void)setHasMapViewViewMode:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x10000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFEFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewViewMode
{
  return (*(_QWORD *)&self->_flags >> 40) & 1;
}

- (id)mapViewViewModeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1C1FF10[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapViewViewMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_TERRAIN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_FLYOVER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_FLYOVER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TYPE_DRIVING")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)mapViewLocationIsTourist
{
  return self->_mapViewLocationIsTourist;
}

- (void)setMapViewLocationIsTourist:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x2000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapViewLocationIsTourist = a3;
}

- (void)setHasMapViewLocationIsTourist:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x2000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFDFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewLocationIsTourist
{
  return (*((_QWORD *)&self->_flags + 1) >> 25) & 1;
}

- (double)mapViewLocationTouristTimestamp
{
  return self->_mapViewLocationTouristTimestamp;
}

- (void)setMapViewLocationTouristTimestamp:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 8uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapViewLocationTouristTimestamp = a3;
}

- (void)setHasMapViewLocationTouristTimestamp:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 8;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFF7 | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewLocationTouristTimestamp
{
  return (*(_QWORD *)&self->_flags >> 3) & 1;
}

- (BOOL)mapViewLocationPuckInViewport
{
  return self->_mapViewLocationPuckInViewport;
}

- (void)setMapViewLocationPuckInViewport:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x4000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapViewLocationPuckInViewport = a3;
}

- (void)setHasMapViewLocationPuckInViewport:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x4000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFBFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapViewLocationPuckInViewport
{
  return (*((_QWORD *)&self->_flags + 1) >> 26) & 1;
}

- (int)mapSettingsNavVolume
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x40000000) != 0)
    return self->_mapSettingsNavVolume;
  else
    return 0;
}

- (void)setMapSettingsNavVolume:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapSettingsNavVolume = a3;
}

- (void)setHasMapSettingsNavVolume:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x40000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFBFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsNavVolume
{
  return (*(_QWORD *)&self->_flags >> 30) & 1;
}

- (id)mapSettingsNavVolumeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1C1FF58[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapSettingsNavVolume:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_NO")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_LOW")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_NORMAL")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_LOUD")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapSettingsTransportMode
{
  os_unfair_lock_s *p_readerLock;
  int flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (int)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if (flags < 0)
    return self->_mapSettingsTransportMode;
  else
    return 0;
}

- (void)setMapSettingsTransportMode:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapSettingsTransportMode = a3;
}

- (void)setHasMapSettingsTransportMode:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x80000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFF7FFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsTransportMode
{
  return (*(_QWORD *)&self->_flags >> 31) & 1;
}

- (id)mapSettingsTransportModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C1FFA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapSettingsTransportMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_UNKNOWN_TRANSPORT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_DRIVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_TRANSIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_RIDESHARE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_CYCLING")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)mapSettingsAvoidHighways
{
  return self->_mapSettingsAvoidHighways;
}

- (void)setMapSettingsAvoidHighways:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x10;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsAvoidHighways = a3;
}

- (void)setHasMapSettingsAvoidHighways:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 16;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFEFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsAvoidHighways
{
  return (*((_QWORD *)&self->_flags + 1) >> 4) & 1;
}

- (BOOL)mapSettingsAvoidTolls
{
  return self->_mapSettingsAvoidTolls;
}

- (void)setMapSettingsAvoidTolls:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x80;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsAvoidTolls = a3;
}

- (void)setHasMapSettingsAvoidTolls:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 128;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFF7FLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsAvoidTolls
{
  return (*((_QWORD *)&self->_flags + 1) >> 7) & 1;
}

- (BOOL)mapSettingsFindMyCarEnabled
{
  return self->_mapSettingsFindMyCarEnabled;
}

- (void)setMapSettingsFindMyCarEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x400;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsFindMyCarEnabled = a3;
}

- (void)setHasMapSettingsFindMyCarEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 1024;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFBFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsFindMyCarEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 10) & 1;
}

- (BOOL)mapSettingsHeadingEnabled
{
  return self->_mapSettingsHeadingEnabled;
}

- (void)setMapSettingsHeadingEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x800;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsHeadingEnabled = a3;
}

- (void)setHasMapSettingsHeadingEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 2048;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFF7FFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsHeadingEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 11) & 1;
}

- (BOOL)mapSettingsLabelEnabled
{
  return self->_mapSettingsLabelEnabled;
}

- (void)setMapSettingsLabelEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x2000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsLabelEnabled = a3;
}

- (void)setHasMapSettingsLabelEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x2000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFDFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsLabelEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 13) & 1;
}

- (BOOL)mapSettingsPauseSpokenAudioEnabled
{
  return self->_mapSettingsPauseSpokenAudioEnabled;
}

- (void)setMapSettingsPauseSpokenAudioEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x8000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsPauseSpokenAudioEnabled = a3;
}

- (void)setHasMapSettingsPauseSpokenAudioEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x8000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFF7FFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsPauseSpokenAudioEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 15) & 1;
}

- (BOOL)mapSettingsSpeedLimitEnabled
{
  return self->_mapSettingsSpeedLimitEnabled;
}

- (void)setMapSettingsSpeedLimitEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x10000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsSpeedLimitEnabled = a3;
}

- (void)setHasMapSettingsSpeedLimitEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x10000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFEFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsSpeedLimitEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 16) & 1;
}

- (BOOL)mapSettingsTrafficEnabled
{
  return self->_mapSettingsTrafficEnabled;
}

- (void)setMapSettingsTrafficEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x20000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsTrafficEnabled = a3;
}

- (void)setHasMapSettingsTrafficEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x20000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFDFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsTrafficEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 17) & 1;
}

- (BOOL)mapSettingsIsHandsFreeProfileEnabled
{
  return self->_mapSettingsIsHandsFreeProfileEnabled;
}

- (void)setMapSettingsIsHandsFreeProfileEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x1000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsIsHandsFreeProfileEnabled = a3;
}

- (void)setHasMapSettingsIsHandsFreeProfileEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 4096;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFEFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsIsHandsFreeProfileEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 12) & 1;
}

- (BOOL)mapSettingsWalkingAvoidHills
{
  return self->_mapSettingsWalkingAvoidHills;
}

- (void)setMapSettingsWalkingAvoidHills:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x80000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsWalkingAvoidHills = a3;
}

- (void)setHasMapSettingsWalkingAvoidHills:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x80000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFF7FFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsWalkingAvoidHills
{
  return (*((_QWORD *)&self->_flags + 1) >> 19) & 1;
}

- (BOOL)mapSettingsWalkingAvoidBusyRoads
{
  return self->_mapSettingsWalkingAvoidBusyRoads;
}

- (void)setMapSettingsWalkingAvoidBusyRoads:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x40000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsWalkingAvoidBusyRoads = a3;
}

- (void)setHasMapSettingsWalkingAvoidBusyRoads:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x40000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFBFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsWalkingAvoidBusyRoads
{
  return (*((_QWORD *)&self->_flags + 1) >> 18) & 1;
}

- (BOOL)mapSettingsWalkingAvoidStairs
{
  return self->_mapSettingsWalkingAvoidStairs;
}

- (void)setMapSettingsWalkingAvoidStairs:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x100000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsWalkingAvoidStairs = a3;
}

- (void)setHasMapSettingsWalkingAvoidStairs:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x100000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFEFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsWalkingAvoidStairs
{
  return (*((_QWORD *)&self->_flags + 1) >> 20) & 1;
}

- (BOOL)mapSettingsDirectionsWakeDevice
{
  return self->_mapSettingsDirectionsWakeDevice;
}

- (void)setMapSettingsDirectionsWakeDevice:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x100;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsDirectionsWakeDevice = a3;
}

- (void)setHasMapSettingsDirectionsWakeDevice:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 256;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFEFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsDirectionsWakeDevice
{
  return (*((_QWORD *)&self->_flags + 1) >> 8) & 1;
}

- (int)mapUiLayoutInfo
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400000000) != 0)
    return self->_mapUiLayoutInfo;
  else
    return 0;
}

- (void)setMapUiLayoutInfo:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapUiLayoutInfo = a3;
}

- (void)setHasMapUiLayoutInfo:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x400000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFBFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiLayoutInfo
{
  return (*(_QWORD *)&self->_flags >> 34) & 1;
}

- (id)mapUiLayoutInfoAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C200B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapUiLayoutInfo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_MINI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_PARTIAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapUiLayoutStyle
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800000000) != 0)
    return self->_mapUiLayoutStyle;
  else
    return 0;
}

- (void)setMapUiLayoutStyle:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapUiLayoutStyle = a3;
}

- (void)setHasMapUiLayoutStyle:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x800000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFF7FFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiLayoutStyle
{
  return (*(_QWORD *)&self->_flags >> 35) & 1;
}

- (id)mapUiLayoutStyleAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C200D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapUiLayoutStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_COMPACT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_SIDE_BAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_FLOATING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD_SIDE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)mapUiNumberOfTabsOpen
{
  return self->_mapUiNumberOfTabsOpen;
}

- (void)setMapUiNumberOfTabsOpen:(unsigned int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapUiNumberOfTabsOpen = a3;
}

- (void)setHasMapUiNumberOfTabsOpen:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x2000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFDFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiNumberOfTabsOpen
{
  return (*(_QWORD *)&self->_flags >> 37) & 1;
}

- (unsigned)mapUiCurrentTabIndex
{
  return self->_mapUiCurrentTabIndex;
}

- (void)setMapUiCurrentTabIndex:(unsigned int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapUiCurrentTabIndex = a3;
}

- (void)setHasMapUiCurrentTabIndex:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x200000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFDFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiCurrentTabIndex
{
  return (*(_QWORD *)&self->_flags >> 33) & 1;
}

- (unsigned)mapUiNumberOfMapsWindows
{
  return self->_mapUiNumberOfMapsWindows;
}

- (void)setMapUiNumberOfMapsWindows:(unsigned int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapUiNumberOfMapsWindows = a3;
}

- (void)setHasMapUiNumberOfMapsWindows:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x1000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFEFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiNumberOfMapsWindows
{
  return (*(_QWORD *)&self->_flags >> 36) & 1;
}

- (int)windowSize
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000000000) != 0)
    return self->_windowSize;
  else
    return 0;
}

- (void)setWindowSize:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_windowSize = a3;
}

- (void)setHasWindowSize:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x8000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFF7FFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasWindowSize
{
  return (*(_QWORD *)&self->_flags >> 51) & 1;
}

- (id)windowSizeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C1FF80[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsWindowSize:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_FULL")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_DEFAULT")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_MODERATE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_SMALL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)mapUiShownAqiShown
{
  os_unfair_lock_s *p_readerLock;
  uint64_t v4;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v4 = *((_QWORD *)&self->_flags + 1);
  os_unfair_lock_unlock(p_readerLock);
  return (v4 & 0x200000) != 0 && self->_mapUiShownAqiShown;
}

- (void)setMapUiShownAqiShown:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x200000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapUiShownAqiShown = a3;
}

- (void)setHasMapUiShownAqiShown:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x200000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFDFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiShownAqiShown
{
  return (*((_QWORD *)&self->_flags + 1) >> 21) & 1;
}

- (BOOL)mapUiShownWeatherShown
{
  os_unfair_lock_s *p_readerLock;
  uint64_t v4;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v4 = *((_QWORD *)&self->_flags + 1);
  os_unfair_lock_unlock(p_readerLock);
  return (v4 & 0x400000) != 0 && self->_mapUiShownWeatherShown;
}

- (void)setMapUiShownWeatherShown:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x400000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapUiShownWeatherShown = a3;
}

- (void)setHasMapUiShownWeatherShown:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x400000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFBFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiShownWeatherShown
{
  return (*((_QWORD *)&self->_flags + 1) >> 22) & 1;
}

- (int)mapUiShownActiveNavMode
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000000000) != 0)
    return self->_mapUiShownActiveNavMode;
  else
    return 0;
}

- (void)setMapUiShownActiveNavMode:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapUiShownActiveNavMode = a3;
}

- (void)setHasMapUiShownActiveNavMode:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x4000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFBFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapUiShownActiveNavMode
{
  return (*(_QWORD *)&self->_flags >> 38) & 1;
}

- (id)mapUiShownActiveNavModeAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C1FFA0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapUiShownActiveNavMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_UNKNOWN_TRANSPORT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_DRIVING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_WALKING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_TRANSIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_RIDESHARE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_CYCLING")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)lookaroundSessionStartTime
{
  return self->_lookaroundSessionStartTime;
}

- (void)setLookaroundSessionStartTime:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 4uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionStartTime = a3;
}

- (void)setHasLookaroundSessionStartTime:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 4;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFBLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionStartTime
{
  return (*(_QWORD *)&self->_flags >> 2) & 1;
}

- (double)lookaroundSessionEndTime
{
  return self->_lookaroundSessionEndTime;
}

- (void)setLookaroundSessionEndTime:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 2uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionEndTime = a3;
}

- (void)setHasLookaroundSessionEndTime:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 2;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionEndTime
{
  return (*(_QWORD *)&self->_flags >> 1) & 1;
}

- (BOOL)lookaroundSessionHadPanAction
{
  return self->_lookaroundSessionHadPanAction;
}

- (void)setLookaroundSessionHadPanAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionHadPanAction = a3;
}

- (void)setHasLookaroundSessionHadPanAction:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x400000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFBFFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionHadPanAction
{
  return (*(_QWORD *)&self->_flags >> 58) & 1;
}

- (BOOL)lookaroundSessionHadZoomAction
{
  return self->_lookaroundSessionHadZoomAction;
}

- (void)setLookaroundSessionHadZoomAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionHadZoomAction = a3;
}

- (void)setHasLookaroundSessionHadZoomAction:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x2000000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xDFFFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionHadZoomAction
{
  return (*(_QWORD *)&self->_flags >> 61) & 1;
}

- (BOOL)lookaroundSessionHadMoveAction
{
  return self->_lookaroundSessionHadMoveAction;
}

- (void)setLookaroundSessionHadMoveAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionHadMoveAction = a3;
}

- (void)setHasLookaroundSessionHadMoveAction:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x200000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFDFFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionHadMoveAction
{
  return (*(_QWORD *)&self->_flags >> 57) & 1;
}

- (BOOL)lookaroundSessionHadTapPoiAction
{
  return self->_lookaroundSessionHadTapPoiAction;
}

- (void)setLookaroundSessionHadTapPoiAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionHadTapPoiAction = a3;
}

- (void)setHasLookaroundSessionHadTapPoiAction:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x1000000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xEFFFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionHadTapPoiAction
{
  return (*(_QWORD *)&self->_flags >> 60) & 1;
}

- (BOOL)lookaroundSessionHadShareAction
{
  return self->_lookaroundSessionHadShareAction;
}

- (void)setLookaroundSessionHadShareAction:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookaroundSessionHadShareAction = a3;
}

- (void)setHasLookaroundSessionHadShareAction:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x800000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xF7FFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookaroundSessionHadShareAction
{
  return (*(_QWORD *)&self->_flags >> 59) & 1;
}

- (void)_readLookAroundLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x400000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readLookAroundLocation_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasLookAroundLocation
{
  -[GEOAnalyticsPipelineStateData _readLookAroundLocation]((uint64_t)self);
  return self->_lookAroundLocation != 0;
}

- (GEOLocation)lookAroundLocation
{
  -[GEOAnalyticsPipelineStateData _readLookAroundLocation]((uint64_t)self);
  return self->_lookAroundLocation;
}

- (void)setLookAroundLocation:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x400000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_lookAroundLocation, a3);
}

- (unsigned)lookAroundHeading
{
  return self->_lookAroundHeading;
}

- (void)setLookAroundHeading:(unsigned int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x2000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookAroundHeading = a3;
}

- (void)setHasLookAroundHeading:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x2000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFDFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookAroundHeading
{
  return (*(_QWORD *)&self->_flags >> 13) & 1;
}

- (double)lookAroundZoom
{
  return self->_lookAroundZoom;
}

- (void)setLookAroundZoom:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 1uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookAroundZoom = a3;
}

- (void)setHasLookAroundZoom:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
}

- (BOOL)hasLookAroundZoom
{
  return *(_DWORD *)&self->_flags & 1;
}

- (unsigned)lookAroundNumberPoisInView
{
  return self->_lookAroundNumberPoisInView;
}

- (void)setLookAroundNumberPoisInView:(unsigned int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x4000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookAroundNumberPoisInView = a3;
}

- (void)setHasLookAroundNumberPoisInView:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x4000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFBFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookAroundNumberPoisInView
{
  return (*(_QWORD *)&self->_flags >> 14) & 1;
}

- (BOOL)lookAroundIsLabelingShown
{
  return self->_lookAroundIsLabelingShown;
}

- (void)setLookAroundIsLabelingShown:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookAroundIsLabelingShown = a3;
}

- (void)setHasLookAroundIsLabelingShown:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x100000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFEFFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookAroundIsLabelingShown
{
  return HIBYTE(*(_QWORD *)&self->_flags) & 1;
}

- (BOOL)lookAroundEntryIconShown
{
  return self->_lookAroundEntryIconShown;
}

- (void)setLookAroundEntryIconShown:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_lookAroundEntryIconShown = a3;
}

- (void)setHasLookAroundEntryIconShown:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x80000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFF7FFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLookAroundEntryIconShown
{
  return (*(_QWORD *)&self->_flags >> 55) & 1;
}

- (BOOL)deviceInDarkMode
{
  return self->_deviceInDarkMode;
}

- (void)setDeviceInDarkMode:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_deviceInDarkMode = a3;
}

- (void)setHasDeviceInDarkMode:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x10000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFEFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasDeviceInDarkMode
{
  return (*(_QWORD *)&self->_flags >> 52) & 1;
}

- (BOOL)venueExperienceShown
{
  os_unfair_lock_s *p_readerLock;
  uint64_t v4;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  v4 = *((_QWORD *)&self->_flags + 1);
  os_unfair_lock_unlock(p_readerLock);
  return (v4 & 0x1000000000) != 0 && self->_venueExperienceShown;
}

- (void)setVenueExperienceShown:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x1000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_venueExperienceShown = a3;
}

- (void)setHasVenueExperienceShown:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x1000000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFEFFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasVenueExperienceShown
{
  return (*((_QWORD *)&self->_flags + 1) >> 36) & 1;
}

- (void)_readPlaceCardState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardState
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardState]((uint64_t)self);
  return self->_placeCardState != 0;
}

- (GEOLogMsgStatePlaceCard)placeCardState
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardState]((uint64_t)self);
  return self->_placeCardState;
}

- (void)setPlaceCardState:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20020;
  *((_WORD *)&self->_flags + 8) |= 0x20u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_placeCardState, a3);
}

- (void)_readPlaceCardPossibleActions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x2000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPossibleActions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (unint64_t)placeCardPossibleActionsCount
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPossibleActions]((uint64_t)self);
  return self->_placeCardPossibleActions.count;
}

- (int)placeCardPossibleActions
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPossibleActions]((uint64_t)self);
  return self->_placeCardPossibleActions.list;
}

- (void)clearPlaceCardPossibleActions
{
  os_unfair_lock_s *p_readerLock;
  unsigned int v4;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v4 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v4;
  PBRepeatedInt32Clear();
}

- (void)addPlaceCardPossibleActions:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *p_flags;
  int v6;
  unsigned int v7;

  -[GEOAnalyticsPipelineStateData _readPlaceCardPossibleActions]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v6 = *((unsigned __int16 *)p_flags + 8);
  p_flags = ($293EEC582D4BBCC1CB48E4ACDB02AB11 *)((char *)p_flags + 16);
  v7 = (v6 | (*((unsigned __int8 *)p_flags + 2) << 16) | 0x20000u) >> 16;
  *(_WORD *)p_flags = v6;
  *((_BYTE *)p_flags + 2) = v7;
}

- (int)placeCardPossibleActionsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_placeCardPossibleActions;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOAnalyticsPipelineStateData _readPlaceCardPossibleActions]((uint64_t)self);
  p_placeCardPossibleActions = &self->_placeCardPossibleActions;
  count = self->_placeCardPossibleActions.count;
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
  return p_placeCardPossibleActions->list[a3];
}

- (void)setPlaceCardPossibleActions:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;
  unsigned int v6;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x2000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v6 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v6;
  PBRepeatedInt32Set();
}

- (void)_readPlaceCardUnactionableUiElements
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x4000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardUnactionableUiElements_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (unint64_t)placeCardUnactionableUiElementsCount
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardUnactionableUiElements]((uint64_t)self);
  return self->_placeCardUnactionableUiElements.count;
}

- (int)placeCardUnactionableUiElements
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardUnactionableUiElements]((uint64_t)self);
  return self->_placeCardUnactionableUiElements.list;
}

- (void)clearPlaceCardUnactionableUiElements
{
  os_unfair_lock_s *p_readerLock;
  unsigned int v4;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v4 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v4;
  PBRepeatedInt32Clear();
}

- (void)addPlaceCardUnactionableUiElements:(int)a3
{
  os_unfair_lock_s *p_readerLock;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *p_flags;
  int v6;
  unsigned int v7;

  -[GEOAnalyticsPipelineStateData _readPlaceCardUnactionableUiElements]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  p_flags = &self->_flags;
  *((_QWORD *)p_flags + 1) |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v6 = *((unsigned __int16 *)p_flags + 8);
  p_flags = ($293EEC582D4BBCC1CB48E4ACDB02AB11 *)((char *)p_flags + 16);
  v7 = (v6 | (*((unsigned __int8 *)p_flags + 2) << 16) | 0x20000u) >> 16;
  *(_WORD *)p_flags = v6;
  *((_BYTE *)p_flags + 2) = v7;
}

- (int)placeCardUnactionableUiElementsAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_placeCardUnactionableUiElements;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOAnalyticsPipelineStateData _readPlaceCardUnactionableUiElements]((uint64_t)self);
  p_placeCardUnactionableUiElements = &self->_placeCardUnactionableUiElements;
  count = self->_placeCardUnactionableUiElements.count;
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
  return p_placeCardUnactionableUiElements->list[a3];
}

- (void)setPlaceCardUnactionableUiElements:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;
  unsigned int v6;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x4000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v6 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v6;
  PBRepeatedInt32Set();
}

- (void)_readPlaceCardPlaceCardCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceCardCategory_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceCardCategory
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceCardCategory]((uint64_t)self);
  return self->_placeCardPlaceCardCategory != 0;
}

- (NSString)placeCardPlaceCardCategory
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceCardCategory]((uint64_t)self);
  return self->_placeCardPlaceCardCategory;
}

- (void)setPlaceCardPlaceCardCategory:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20008;
  *((_WORD *)&self->_flags + 8) |= 8u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_placeCardPlaceCardCategory, a3);
}

- (int)placeCardPlaceCardType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100000000000) != 0)
    return self->_placeCardPlaceCardType;
  else
    return 0;
}

- (void)setPlaceCardPlaceCardType:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceCardType = a3;
}

- (void)setHasPlaceCardPlaceCardType:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x100000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFEFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceCardType
{
  return (*(_QWORD *)&self->_flags >> 44) & 1;
}

- (id)placeCardPlaceCardTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x12 && ((0x2FFFFu >> a3) & 1) != 0)
  {
    v3 = off_1E1C1FFD0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsPlaceCardPlaceCardType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_PLACECARD")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_PLACECARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUSINESS_PLACECARD")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_PIN_PLACECARD")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CALENDAR_PLACECARD")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_LOCATION_PLACECARD")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_PLACECARD")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_STATION_PLACECARD")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LANDMARK_PLACECARD")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLYOVER_PLACECARD")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAR_PLACECARD")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_PLACECARD")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VENUE_PLACECARD")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VENUE_BUILDING_PLACECARD")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_PLACECARD")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_PLACECARD")) & 1) != 0)
  {
    v4 = 15;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")))
  {
    v4 = 17;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)placeCardTransitAdvisoryBanner
{
  return self->_placeCardTransitAdvisoryBanner;
}

- (void)setPlaceCardTransitAdvisoryBanner:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x40000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_placeCardTransitAdvisoryBanner = a3;
}

- (void)setHasPlaceCardTransitAdvisoryBanner:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x40000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFBFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardTransitAdvisoryBanner
{
  return (*((_QWORD *)&self->_flags + 1) >> 30) & 1;
}

- (void)_readPlaceCardPlaceActionDetailsActionUrl
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x400000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsActionUrl_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsActionUrl
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsActionUrl]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsActionUrl != 0;
}

- (NSString)placeCardPlaceActionDetailsActionUrl
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsActionUrl]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsActionUrl;
}

- (void)setPlaceCardPlaceActionDetailsActionUrl:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x400000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsActionUrl, a3);
}

- (unint64_t)placeCardPlaceActionDetailsAnimationId
{
  return self->_placeCardPlaceActionDetailsAnimationId;
}

- (void)setPlaceCardPlaceActionDetailsAnimationId:(unint64_t)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x80uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsAnimationId = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsAnimationId:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 128;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFF7FLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsAnimationId
{
  return (*(_QWORD *)&self->_flags >> 7) & 1;
}

- (unint64_t)placeCardPlaceActionDetailsBusinessId
{
  return self->_placeCardPlaceActionDetailsBusinessId;
}

- (void)setPlaceCardPlaceActionDetailsBusinessId:(unint64_t)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x100uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsBusinessId = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsBusinessId:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 256;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFEFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsBusinessId
{
  return (*(_QWORD *)&self->_flags >> 8) & 1;
}

- (void)_readPlaceCardPlaceActionDetailsDestinationApp
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x800000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsDestinationApp_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsDestinationApp
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsDestinationApp]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsDestinationApp != 0;
}

- (NSString)placeCardPlaceActionDetailsDestinationApp
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsDestinationApp]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsDestinationApp;
}

- (void)setPlaceCardPlaceActionDetailsDestinationApp:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x800000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsDestinationApp, a3);
}

- (void)_readPlaceCardPlaceActionDetailsPhotoId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x1000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsPhotoId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsPhotoId
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsPhotoId]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsPhotoId != 0;
}

- (NSString)placeCardPlaceActionDetailsPhotoId
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsPhotoId]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsPhotoId;
}

- (void)setPlaceCardPlaceActionDetailsPhotoId:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x1000000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsPhotoId, a3);
}

- (int64_t)placeCardPlaceActionDetailsPlaceId
{
  return self->_placeCardPlaceActionDetailsPlaceId;
}

- (void)setPlaceCardPlaceActionDetailsPlaceId:(int64_t)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x200uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsPlaceId = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsPlaceId:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 512;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFDFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsPlaceId
{
  return (*(_QWORD *)&self->_flags >> 9) & 1;
}

- (void)_readPlaceCardPlaceActionDetailsRichProviderId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x2000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsRichProviderId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsRichProviderId
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsRichProviderId]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsRichProviderId != 0;
}

- (NSString)placeCardPlaceActionDetailsRichProviderId
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsRichProviderId]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsRichProviderId;
}

- (void)setPlaceCardPlaceActionDetailsRichProviderId:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x2000000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsRichProviderId, a3);
}

- (double)placeCardPlaceActionDetailsSearchResponseRelativeTimestamp
{
  return self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
}

- (void)setPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:(double)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x400uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 1024;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFBFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp
{
  return (*(_QWORD *)&self->_flags >> 10) & 1;
}

- (unint64_t)placeCardPlaceActionDetailsTargetId
{
  return self->_placeCardPlaceActionDetailsTargetId;
}

- (void)setPlaceCardPlaceActionDetailsTargetId:(unint64_t)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x800uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsTargetId = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsTargetId:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 2048;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFF7FFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsTargetId
{
  return (*(_QWORD *)&self->_flags >> 11) & 1;
}

- (int)placeCardPlaceActionDetailsLocalSearchProviderId
{
  return self->_placeCardPlaceActionDetailsLocalSearchProviderId;
}

- (void)setPlaceCardPlaceActionDetailsLocalSearchProviderId:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsLocalSearchProviderId = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsLocalSearchProviderId:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x20000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFDFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsLocalSearchProviderId
{
  return (*(_QWORD *)&self->_flags >> 41) & 1;
}

- (int)placeCardPlaceActionDetailsResultIndex
{
  return self->_placeCardPlaceActionDetailsResultIndex;
}

- (void)setPlaceCardPlaceActionDetailsResultIndex:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsResultIndex = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsResultIndex:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x40000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFBFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsResultIndex
{
  return (*(_QWORD *)&self->_flags >> 42) & 1;
}

- (void)_readPlaceCardPlaceActionDetailsShowcaseId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x4000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsShowcaseId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsShowcaseId
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsShowcaseId]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsShowcaseId != 0;
}

- (NSString)placeCardPlaceActionDetailsShowcaseId
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsShowcaseId]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsShowcaseId;
}

- (void)setPlaceCardPlaceActionDetailsShowcaseId:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x4000000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsShowcaseId, a3);
}

- (void)_readPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x8000000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType != 0;
}

- (NSString)placeCardPlaceActionDetailsTransitPlaceCardIncidentType
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType;
}

- (void)setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:(id)a3
{
  unsigned int v3;
  unint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x8000000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType, a3);
}

- (void)_readPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName != 0;
}

- (NSString)placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName;
}

- (void)setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20004;
  *((_WORD *)&self->_flags + 8) |= 4u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName, a3);
}

- (int)placeCardPlaceActionDetailsTransitPlaceCardTransitCategory
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x80000000000) != 0)
    return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory;
  else
    return 0;
}

- (void)setPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x80000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFF7FFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory
{
  return (*(_QWORD *)&self->_flags >> 43) & 1;
}

- (id)placeCardPlaceActionDetailsTransitPlaceCardTransitCategoryAsString:(int)a3
{
  if (a3 < 7)
    return off_1E1C20060[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN_CATEGORY")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUMMARY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOW_FREQUENCY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGH_FREQUENCY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MIXED_FREQUENCY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONNECTIONS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("OUT_OF_SERVICE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection != 0;
}

- (NSString)placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection;
}

- (void)setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20001;
  *((_WORD *)&self->_flags + 8) |= 1u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection, a3);
}

- (void)_readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign != 0;
}

- (NSString)placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign]((uint64_t)self);
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign;
}

- (void)setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20002;
  *((_WORD *)&self->_flags + 8) |= 2u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign, a3);
}

- (unint64_t)placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId
{
  return self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId;
}

- (void)setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:(unint64_t)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x1000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId = a3;
}

- (void)setHasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 4096;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFEFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId
{
  return (*(_QWORD *)&self->_flags >> 12) & 1;
}

- (void)_readPlaceCardRevealedPlaceCardModules
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPlaceCardRevealedPlaceCardModules_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (NSMutableArray)placeCardRevealedPlaceCardModules
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardRevealedPlaceCardModules]((uint64_t)self);
  return self->_placeCardRevealedPlaceCardModules;
}

- (void)setPlaceCardRevealedPlaceCardModules:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *placeCardRevealedPlaceCardModules;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_WORD *)&self->_flags + 8) |= 0x10u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 18) = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  placeCardRevealedPlaceCardModules = self->_placeCardRevealedPlaceCardModules;
  self->_placeCardRevealedPlaceCardModules = v4;

}

- (void)clearPlaceCardRevealedPlaceCardModules
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_WORD *)&self->_flags + 8) |= 0x10u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 18) = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  -[NSMutableArray removeAllObjects](self->_placeCardRevealedPlaceCardModules, "removeAllObjects");
}

- (void)addPlaceCardRevealedPlaceCardModule:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 list;
  int isa_low;
  unsigned int v8;

  v4 = a3;
  -[GEOAnalyticsPipelineStateData _readPlaceCardRevealedPlaceCardModules]((uint64_t)self);
  -[GEOAnalyticsPipelineStateData _addNoFlagsPlaceCardRevealedPlaceCardModule:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOAnalyticsPipelineStateData *)((char *)self + 724);
  list = (__int16)self->_placeCardPossibleActions.list;
  self = (GEOAnalyticsPipelineStateData *)((char *)self + 16);
  LOWORD(self->super.super.isa) = list | 0x10;
  os_unfair_lock_unlock(p_readerLock);
  isa_low = LOWORD(self->super.super.isa);
  v8 = (isa_low | (BYTE2(self->super.super.isa) << 16) | 0x20000u) >> 16;
  LOWORD(self->super.super.isa) = isa_low;
  BYTE2(self->super.super.isa) = v8;
}

- (void)_addNoFlagsPlaceCardRevealedPlaceCardModule:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 400);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 400);
      *(_QWORD *)(a1 + 400) = v5;

      v4 = *(void **)(a1 + 400);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)placeCardRevealedPlaceCardModulesCount
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardRevealedPlaceCardModules]((uint64_t)self);
  return -[NSMutableArray count](self->_placeCardRevealedPlaceCardModules, "count");
}

- (id)placeCardRevealedPlaceCardModuleAtIndex:(unint64_t)a3
{
  -[GEOAnalyticsPipelineStateData _readPlaceCardRevealedPlaceCardModules]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_placeCardRevealedPlaceCardModules, "objectAtIndex:", a3);
}

+ (Class)placeCardRevealedPlaceCardModuleType
{
  return (Class)objc_opt_class();
}

- (BOOL)placeCardIsPersonPlacecard
{
  return self->_placeCardIsPersonPlacecard;
}

- (void)setPlaceCardIsPersonPlacecard:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x20000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_placeCardIsPersonPlacecard = a3;
}

- (void)setHasPlaceCardIsPersonPlacecard:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x20000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFDFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardIsPersonPlacecard
{
  return (*((_QWORD *)&self->_flags + 1) >> 29) & 1;
}

- (BOOL)placeCardIsPersonAddressAvailable
{
  return self->_placeCardIsPersonAddressAvailable;
}

- (void)setPlaceCardIsPersonAddressAvailable:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x8000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_placeCardIsPersonAddressAvailable = a3;
}

- (void)setHasPlaceCardIsPersonAddressAvailable:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x8000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFF7FFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardIsPersonAddressAvailable
{
  return (*((_QWORD *)&self->_flags + 1) >> 27) & 1;
}

- (BOOL)placeCardIsPersonLocationShared
{
  return self->_placeCardIsPersonLocationShared;
}

- (void)setPlaceCardIsPersonLocationShared:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x10000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_placeCardIsPersonLocationShared = a3;
}

- (void)setHasPlaceCardIsPersonLocationShared:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x10000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFEFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasPlaceCardIsPersonLocationShared
{
  return (*((_QWORD *)&self->_flags + 1) >> 28) & 1;
}

- (void)_readMapsServerMetadataSuggestionEntryTappedOn
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x40000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapsServerMetadataSuggestionEntryTappedOn_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapsServerMetadataSuggestionEntryTappedOn
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadataSuggestionEntryTappedOn]((uint64_t)self);
  return self->_mapsServerMetadataSuggestionEntryTappedOn != 0;
}

- (NSData)mapsServerMetadataSuggestionEntryTappedOn
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadataSuggestionEntryTappedOn]((uint64_t)self);
  return self->_mapsServerMetadataSuggestionEntryTappedOn;
}

- (void)setMapsServerMetadataSuggestionEntryTappedOn:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x40000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapsServerMetadataSuggestionEntryTappedOn, a3);
}

- (void)_readMapsServerMetadataSuggestionEntryDisplayeds
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x20000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapsServerMetadataSuggestionEntryDisplayeds_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (NSMutableArray)mapsServerMetadataSuggestionEntryDisplayeds
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadataSuggestionEntryDisplayeds]((uint64_t)self);
  return self->_mapsServerMetadataSuggestionEntryDisplayeds;
}

- (void)setMapsServerMetadataSuggestionEntryDisplayeds:(id)a3
{
  NSMutableArray *v4;
  unsigned int v5;
  NSMutableArray *mapsServerMetadataSuggestionEntryDisplayeds;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x20000000000000uLL;
  os_unfair_lock_unlock(&self->_readerLock);
  v5 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v5;
  mapsServerMetadataSuggestionEntryDisplayeds = self->_mapsServerMetadataSuggestionEntryDisplayeds;
  self->_mapsServerMetadataSuggestionEntryDisplayeds = v4;

}

- (void)clearMapsServerMetadataSuggestionEntryDisplayeds
{
  os_unfair_lock_s *p_readerLock;
  unsigned int v4;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_QWORD *)&self->_flags + 1) |= 0x20000000000000uLL;
  os_unfair_lock_unlock(p_readerLock);
  v4 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v4;
  -[NSMutableArray removeAllObjects](self->_mapsServerMetadataSuggestionEntryDisplayeds, "removeAllObjects");
}

- (void)addMapsServerMetadataSuggestionEntryDisplayed:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  int list_low;
  unsigned int v7;

  v4 = a3;
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadataSuggestionEntryDisplayeds]((uint64_t)self);
  -[GEOAnalyticsPipelineStateData _addNoFlagsMapsServerMetadataSuggestionEntryDisplayed:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOAnalyticsPipelineStateData *)((char *)self + 724);
  self->_reader = (PBDataReader *)((unint64_t)self->_reader | 0x20000000000000);
  os_unfair_lock_unlock(p_readerLock);
  list_low = LOWORD(self->_placeCardPossibleActions.list);
  self = (GEOAnalyticsPipelineStateData *)((char *)self + 16);
  v7 = (list_low | (BYTE2(self->super.super.isa) << 16) | 0x20000u) >> 16;
  LOWORD(self->super.super.isa) = list_low;
  BYTE2(self->super.super.isa) = v7;
}

- (void)_addNoFlagsMapsServerMetadataSuggestionEntryDisplayed:(uint64_t)a1
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

- (unint64_t)mapsServerMetadataSuggestionEntryDisplayedsCount
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadataSuggestionEntryDisplayeds]((uint64_t)self);
  return -[NSMutableArray count](self->_mapsServerMetadataSuggestionEntryDisplayeds, "count");
}

- (id)mapsServerMetadataSuggestionEntryDisplayedAtIndex:(unint64_t)a3
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadataSuggestionEntryDisplayeds]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_mapsServerMetadataSuggestionEntryDisplayeds, "objectAtIndex:", a3);
}

+ (Class)mapsServerMetadataSuggestionEntryDisplayedType
{
  return (Class)objc_opt_class();
}

- (void)_readMapsServerMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x80000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapsServerMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapsServerMetadata
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadata]((uint64_t)self);
  return self->_mapsServerMetadata != 0;
}

- (GEOMapsServerMetadata)mapsServerMetadata
{
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadata]((uint64_t)self);
  return self->_mapsServerMetadata;
}

- (void)setMapsServerMetadata:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x80000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapsServerMetadata, a3);
}

- (void)_readRouteRouteDetails
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRouteRouteDetails_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasRouteRouteDetails
{
  -[GEOAnalyticsPipelineStateData _readRouteRouteDetails]((uint64_t)self);
  return self->_routeRouteDetails != 0;
}

- (GEORouteDetails)routeRouteDetails
{
  -[GEOAnalyticsPipelineStateData _readRouteRouteDetails]((uint64_t)self);
  return self->_routeRouteDetails;
}

- (void)setRouteRouteDetails:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20200;
  *((_WORD *)&self->_flags + 8) |= 0x200u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_routeRouteDetails, a3);
}

- (void)_readPredExTrainingData
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPredExTrainingData_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPredExTrainingData
{
  -[GEOAnalyticsPipelineStateData _readPredExTrainingData]((uint64_t)self);
  return self->_predExTrainingData != 0;
}

- (GEOLogMsgEventPredExTrainingData)predExTrainingData
{
  -[GEOAnalyticsPipelineStateData _readPredExTrainingData]((uint64_t)self);
  return self->_predExTrainingData;
}

- (void)setPredExTrainingData:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20040;
  *((_WORD *)&self->_flags + 8) |= 0x40u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_predExTrainingData, a3);
}

- (int)suggestionsAcSequenceNumber
{
  return self->_suggestionsAcSequenceNumber;
}

- (void)setSuggestionsAcSequenceNumber:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_suggestionsAcSequenceNumber = a3;
}

- (void)setHasSuggestionsAcSequenceNumber:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x1000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFEFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasSuggestionsAcSequenceNumber
{
  return HIWORD(*(_QWORD *)&self->_flags) & 1;
}

- (int)suggestionsSearchFieldType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x2000000000000) != 0)
    return self->_suggestionsSearchFieldType;
  else
    return 0;
}

- (void)setSuggestionsSearchFieldType:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_suggestionsSearchFieldType = a3;
}

- (void)setHasSuggestionsSearchFieldType:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x2000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFDFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasSuggestionsSearchFieldType
{
  return (*(_QWORD *)&self->_flags >> 49) & 1;
}

- (id)suggestionsSearchFieldTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20098[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSuggestionsSearchFieldType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_NORMAL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_DIRECTIONS_START")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_DIRECTIONS_END")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)suggestionsSelectedIndex
{
  return self->_suggestionsSelectedIndex;
}

- (void)setSuggestionsSelectedIndex:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_suggestionsSelectedIndex = a3;
}

- (void)setHasSuggestionsSelectedIndex:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x4000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFBFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasSuggestionsSelectedIndex
{
  return (*(_QWORD *)&self->_flags >> 50) & 1;
}

- (void)_readSuggestionsSearchString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSuggestionsSearchString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasSuggestionsSearchString
{
  -[GEOAnalyticsPipelineStateData _readSuggestionsSearchString]((uint64_t)self);
  return self->_suggestionsSearchString != 0;
}

- (NSString)suggestionsSearchString
{
  -[GEOAnalyticsPipelineStateData _readSuggestionsSearchString]((uint64_t)self);
  return self->_suggestionsSearchString;
}

- (void)setSuggestionsSearchString:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x21000;
  *((_WORD *)&self->_flags + 8) |= 0x1000u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_suggestionsSearchString, a3);
}

- (void)_readSuggestionsDisplayedResults
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSuggestionsDisplayedResults_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (NSMutableArray)suggestionsDisplayedResults
{
  -[GEOAnalyticsPipelineStateData _readSuggestionsDisplayedResults]((uint64_t)self);
  return self->_suggestionsDisplayedResults;
}

- (void)setSuggestionsDisplayedResults:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *suggestionsDisplayedResults;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *((_WORD *)&self->_flags + 8) |= 0x800u;
  os_unfair_lock_unlock(&self->_readerLock);
  *((_BYTE *)&self->_flags + 18) = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  suggestionsDisplayedResults = self->_suggestionsDisplayedResults;
  self->_suggestionsDisplayedResults = v4;

}

- (void)clearSuggestionsDisplayedResults
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *((_WORD *)&self->_flags + 8) |= 0x800u;
  os_unfair_lock_unlock(p_readerLock);
  *((_BYTE *)&self->_flags + 18) = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  -[NSMutableArray removeAllObjects](self->_suggestionsDisplayedResults, "removeAllObjects");
}

- (void)addSuggestionsDisplayedResults:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 list;
  int isa_low;
  unsigned int v8;

  v4 = a3;
  -[GEOAnalyticsPipelineStateData _readSuggestionsDisplayedResults]((uint64_t)self);
  -[GEOAnalyticsPipelineStateData _addNoFlagsSuggestionsDisplayedResults:]((uint64_t)self, v4);

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  self = (GEOAnalyticsPipelineStateData *)((char *)self + 724);
  list = (__int16)self->_placeCardPossibleActions.list;
  self = (GEOAnalyticsPipelineStateData *)((char *)self + 16);
  LOWORD(self->super.super.isa) = list | 0x800;
  os_unfair_lock_unlock(p_readerLock);
  isa_low = LOWORD(self->super.super.isa);
  v8 = (isa_low | (BYTE2(self->super.super.isa) << 16) | 0x20000u) >> 16;
  LOWORD(self->super.super.isa) = isa_low;
  BYTE2(self->super.super.isa) = v8;
}

- (void)_addNoFlagsSuggestionsDisplayedResults:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 456);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 456);
      *(_QWORD *)(a1 + 456) = v5;

      v4 = *(void **)(a1 + 456);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)suggestionsDisplayedResultsCount
{
  -[GEOAnalyticsPipelineStateData _readSuggestionsDisplayedResults]((uint64_t)self);
  return -[NSMutableArray count](self->_suggestionsDisplayedResults, "count");
}

- (id)suggestionsDisplayedResultsAtIndex:(unint64_t)a3
{
  -[GEOAnalyticsPipelineStateData _readSuggestionsDisplayedResults]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_suggestionsDisplayedResults, "objectAtIndex:", a3);
}

+ (Class)suggestionsDisplayedResultsType
{
  return (Class)objc_opt_class();
}

- (BOOL)landscape
{
  return self->_landscape;
}

- (void)setLandscape:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_landscape = a3;
}

- (void)setHasLandscape:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x40000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFBFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasLandscape
{
  return (*(_QWORD *)&self->_flags >> 54) & 1;
}

- (int)restoreLayoutInfo
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x200000000000) != 0)
    return self->_restoreLayoutInfo;
  else
    return 0;
}

- (void)setRestoreLayoutInfo:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_restoreLayoutInfo = a3;
}

- (void)setHasRestoreLayoutInfo:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x200000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFDFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasRestoreLayoutInfo
{
  return (*(_QWORD *)&self->_flags >> 45) & 1;
}

- (id)restoreLayoutInfoAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C200B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRestoreLayoutInfo:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_MINI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_PARTIAL")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUT_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)restoreLayoutStyle
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x400000000000) != 0)
    return self->_restoreLayoutStyle;
  else
    return 0;
}

- (void)setRestoreLayoutStyle:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_restoreLayoutStyle = a3;
}

- (void)setHasRestoreLayoutStyle:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x400000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFBFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasRestoreLayoutStyle
{
  return (*(_QWORD *)&self->_flags >> 46) & 1;
}

- (id)restoreLayoutStyleAsString:(int)a3
{
  if (a3 < 6)
    return off_1E1C200D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRestoreLayoutStyle:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_COMPACT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_SIDE_BAR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_FLOATING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD_SIDE")))
  {
    v4 = 5;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)restoreUiTarget
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x800000000000) != 0)
    return self->_restoreUiTarget;
  else
    return 0;
}

- (void)setRestoreUiTarget:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_restoreUiTarget = a3;
}

- (void)setHasRestoreUiTarget:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x800000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFF7FFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasRestoreUiTarget
{
  return (*(_QWORD *)&self->_flags >> 47) & 1;
}

- (id)restoreUiTargetAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 > 1000)
  {
    if (a3 > 1600)
    {
      switch(a3)
      {
        case 1801:
          result = CFSTR("MAPS_WEB_PLACE");
          break;
        case 1802:
          result = CFSTR("MAPS_WEB_SEARCH");
          break;
        case 1803:
          result = CFSTR("MAPS_WEB_SEARCH_RESULTS");
          break;
        case 1804:
          result = CFSTR("MAPS_WEB_PUBLISHER");
          break;
        case 1805:
          result = CFSTR("MAPS_WEB_GUIDE");
          break;
        case 1806:
          result = CFSTR("MAPS_WEB_GUIDES_HOME");
          break;
        case 1807:
          result = CFSTR("MAPS_WEB_RELATED_PLACES_LIST");
          break;
        case 1808:
          result = CFSTR("MAPS_WEB_COLLECTION_LIST");
          break;
        case 1809:
          result = CFSTR("MAPS_WEB_DIRECTIONS");
          break;
        case 1810:
          result = CFSTR("MAPS_WEB_SIDEBAR");
          break;
        default:
          switch(a3)
          {
            case 1700:
              result = CFSTR("LOOK_AROUND_PIP");
              break;
            case 1701:
              result = CFSTR("LOOK_AROUND_ACTION_SHEET");
              break;
            case 1702:
              result = CFSTR("LOOK_AROUND_VIEW");
              break;
            case 1703:
              result = CFSTR("LOOK_AROUND_PLATTER");
              break;
            case 1704:
              result = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM");
              break;
            case 1705:
              result = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION");
              break;
            case 1706:
              result = CFSTR("LOOK_AROUND_VIEW_PLACECARD");
              break;
            case 1707:
              result = CFSTR("LOOK_AROUND_PIP_PLACECARD");
              break;
            case 1708:
              result = CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY");
              break;
            default:
              if (a3 == 1601)
              {
                result = CFSTR("MENU_ITEM_DARK_MAP");
              }
              else
              {
LABEL_39:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
                v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_4:
                result = v3;
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 1001:
          result = CFSTR("CARPLAY_NAV");
          break;
        case 1002:
          result = CFSTR("CARPLAY_EXPLORE");
          break;
        case 1003:
          result = CFSTR("CARPLAY_DESTINATIONS");
          break;
        case 1004:
          result = CFSTR("CARPLAY_TRAFFIC_INCIDENT");
          break;
        case 1005:
          result = CFSTR("CARPLAY_CONTROL");
          break;
        case 1006:
          result = CFSTR("CARPLAY_PROACTIVE");
          break;
        case 1007:
          result = CFSTR("CARPLAY_ROUTING");
          break;
        case 1008:
          result = CFSTR("CARPLAY_MORE_ROUTES");
          break;
        case 1009:
          result = CFSTR("CARPLAY_SEARCH_ALONG_ROUTE");
          break;
        case 1010:
          result = CFSTR("CARPLAY_SEARCH");
          break;
        case 1011:
          result = CFSTR("CARPLAY_SEARCH_RESULTS");
          break;
        case 1012:
          result = CFSTR("CARPLAY_FAVORITES");
          break;
        case 1013:
          result = CFSTR("CARPLAY_NAV_CONFIRMATION");
          break;
        case 1014:
          result = CFSTR("CARPLAY_DESTINATION_SHARING");
          break;
        case 1015:
          result = CFSTR("CARPLAY_NOTIFICATION_BATTERY");
          break;
        case 1016:
          result = CFSTR("CARPLAY_NOTIFICATION_DOOM");
          break;
        case 1017:
          result = CFSTR("CARPLAY_NOTIFICATION_FUEL");
          break;
        case 1018:
          result = CFSTR("CARPLAY_NOTIFICATION_HYBRID");
          break;
        case 1019:
          result = CFSTR("CARPLAY_SHARE_ETA_TRAY");
          break;
        case 1020:
          result = CFSTR("CARPLAY_ETA_UPDATE_TRAY");
          break;
        case 1021:
          result = CFSTR("CARPLAY_ACTION_TRAY");
          break;
        case 1022:
          result = CFSTR("CARPLAY_PLACECARD");
          break;
        case 1023:
          result = CFSTR("CARPLAY_KEYBOARD");
          break;
        case 1024:
          result = CFSTR("CARPLAY_UI_TARGET_UNKNOWN");
          break;
        case 1025:
          result = CFSTR("CARPLAY_EDIT_STOPS");
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_39;
        case 1100:
          result = CFSTR("RAP_DIRECTIONS_MENU");
          break;
        case 1101:
          result = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST");
          break;
        case 1102:
          result = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM");
          break;
        case 1103:
          result = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM");
          break;
        case 1104:
          result = CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM");
          break;
        case 1105:
          result = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM");
          break;
        case 1106:
          result = CFSTR("RAP_TRANSIT_MENU");
          break;
        case 1107:
          result = CFSTR("RAP_STATION_MAP");
          break;
        case 1108:
          result = CFSTR("RAP_STATION_MENU");
          break;
        case 1109:
          result = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP");
          break;
        case 1110:
          result = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM");
          break;
        case 1111:
          result = CFSTR("RAP_STATION_CLOSED_FORM");
          break;
        case 1112:
          result = CFSTR("RAP_LINE_MAP");
          break;
        case 1113:
          result = CFSTR("RAP_LINE_MENU");
          break;
        case 1114:
          result = CFSTR("RAP_LINE_NAME_FORM");
          break;
        case 1115:
          result = CFSTR("RAP_LINE_SHAPE_FORM");
          break;
        case 1116:
          result = CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM");
          break;
        case 1117:
          result = CFSTR("RAP_ADD_PLACE_MENU");
          break;
        case 1118:
          result = CFSTR("RAP_ADD_POI_MAP");
          break;
        case 1119:
          result = CFSTR("RAP_CATEGORY_LIST");
          break;
        case 1120:
          result = CFSTR("RAP_POI_DETAILS_FORM");
          break;
        case 1121:
          result = CFSTR("RAP_ADD_STREET_MAP");
          break;
        case 1122:
          result = CFSTR("RAP_STREET_DETAILS_FORM");
          break;
        case 1123:
          result = CFSTR("RAP_ADD_OTHER_MAP");
          break;
        case 1124:
          result = CFSTR("RAP_OTHER_DETAILS_FORM");
          break;
        case 1125:
          result = CFSTR("RAP_CAMERA");
          break;
        case 1126:
          result = CFSTR("RAP_LABEL_MAP");
          break;
        case 1127:
          result = CFSTR("RAP_LABEL_DETAILS_FORM");
          break;
        case 1128:
          result = CFSTR("RAP_SEARCH_MENU");
          break;
        case 1129:
          result = CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM");
          break;
        case 1130:
          result = CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM");
          break;
        case 1131:
          result = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP");
          break;
        case 1132:
          result = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM");
          break;
        case 1133:
          result = CFSTR("RAP_SATELLITE_IMAGE_MAP");
          break;
        case 1134:
          result = CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM");
          break;
        case 1135:
          result = CFSTR("RAP_OTHER_FORM");
          break;
        case 1136:
          result = CFSTR("RAP_PRIVACY");
          break;
        case 1137:
          result = CFSTR("RAP_CONFIRMATION");
          break;
        case 1138:
          result = CFSTR("RAP_POI_MENU");
          break;
        case 1139:
          result = CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU");
          break;
        case 1140:
          result = CFSTR("RAP_ADD_A_PLACE_MAP");
          break;
        case 1141:
          result = CFSTR("RAP_POI_LOCATION_MAP");
          break;
        case 1142:
          result = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP");
          break;
        case 1143:
          result = CFSTR("RAP_POI_CLOSED_FORM");
          break;
        case 1144:
          result = CFSTR("RAP_CLAIM_BUSINESS_DIALOG");
          break;
        case 1145:
          result = CFSTR("RAP_BRAND_MENU");
          break;
        case 1146:
          result = CFSTR("RAP_BRAND_DETAILS_FORM");
          break;
        case 1147:
          result = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM");
          break;
        case 1148:
          result = CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM");
          break;
        case 1149:
          result = CFSTR("RAP_LOOK_AROUND_BLURRING_FORM");
          break;
        case 1150:
          result = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM");
          break;
        case 1151:
          result = CFSTR("RAP_LOOK_AROUND_MENU");
          break;
        case 1152:
          result = CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM");
          break;
        case 1153:
          result = CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU");
          break;
        case 1154:
          result = CFSTR("RAP_LIGHTWEIGHT");
          break;
        case 1155:
          result = CFSTR("RAP_EDIT_PLACE_DETAILS");
          break;
        case 1156:
          result = CFSTR("RAP_ADD_CATEGORY");
          break;
        case 1157:
          result = CFSTR("RAP_ADD_HOURS");
          break;
        case 1158:
          result = CFSTR("RAP_EDIT_LOCATION");
          break;
        case 1159:
          result = CFSTR("RAP_EDIT_ENTRY_POINT");
          break;
        case 1160:
          result = CFSTR("RAP_LOOK_AROUND");
          break;
        case 1161:
          result = CFSTR("RAP_ADD_ENTRY_POINT");
          break;
        case 1201:
          result = CFSTR("WATCH_MAIN_MENU");
          break;
        case 1202:
          result = CFSTR("WATCH_MAIN_PRESS_MENU");
          break;
        case 1203:
          result = CFSTR("WATCH_SEARCH");
          break;
        case 1204:
          result = CFSTR("WATCH_DICTATION");
          break;
        case 1205:
          result = CFSTR("WATCH_FAVORITES");
          break;
        case 1206:
          result = CFSTR("WATCH_SUB_CATEGORY_LIST");
          break;
        case 1207:
          result = CFSTR("WATCH_SEARCH_RESULTS_LIST");
          break;
        case 1208:
          result = CFSTR("WATCH_MAP_VIEW");
          break;
        case 1209:
          result = CFSTR("WATCH_PLACECARD");
          break;
        case 1210:
          result = CFSTR("WATCH_ROUTE_PLANNING");
          break;
        case 1211:
          result = CFSTR("WATCH_ROUTE_DETAILS");
          break;
        case 1212:
          result = CFSTR("WATCH_NAV_TBT");
          break;
        case 1213:
          result = CFSTR("WATCH_NAV_MAP");
          break;
        case 1214:
          result = CFSTR("WATCH_NAV_PRESS_MENU");
          break;
        case 1215:
          result = CFSTR("WATCH_MAP_PRESS_MENU");
          break;
        case 1216:
          result = CFSTR("WATCH_ROUTING_PRESS_MENU");
          break;
        case 1217:
          result = CFSTR("WATCH_TRANSIT_MAP_VIEW");
          break;
        case 1218:
          result = CFSTR("WATCH_SCRIBBLE");
          break;
        case 1219:
          result = CFSTR("WATCH_COLLECTION_VIEW");
          break;
        case 1220:
          result = CFSTR("WATCH_ROUTE_PLANNING_WALKING");
          break;
        case 1221:
          result = CFSTR("WATCH_ROUTE_PLANNING_DRIVING");
          break;
        case 1222:
          result = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT");
          break;
        case 1223:
          result = CFSTR("WATCH_PAIRED_DEVICE");
          break;
        case 1224:
          result = CFSTR("WATCH_NAV_DRIVING_SPLIT");
          break;
        case 1225:
          result = CFSTR("WATCH_NAV_DRIVING_PLATTER");
          break;
        case 1226:
          result = CFSTR("WATCH_NAV_DRIVING_MAP");
          break;
        case 1227:
          result = CFSTR("WATCH_NAV_WALKING_SPLIT");
          break;
        case 1228:
          result = CFSTR("WATCH_NAV_WALKING_PLATTER");
          break;
        case 1229:
          result = CFSTR("WATCH_NAV_WALKING_MAP");
          break;
        case 1230:
          result = CFSTR("WATCH_NAV_TRANSIT_SPLIT");
          break;
        case 1231:
          result = CFSTR("WATCH_NAV_TRANSIT_PLATTER");
          break;
        case 1232:
          result = CFSTR("WATCH_NAV_TRANSIT_MAP");
          break;
        case 1233:
          result = CFSTR("WATCH_ROUTE_INFO");
          break;
        case 1234:
          result = CFSTR("WATCH_NAV_CYCLING_MAP");
          break;
        case 1235:
          result = CFSTR("WATCH_NAV_CYCLING_PLATTER");
          break;
        case 1236:
          result = CFSTR("WATCH_NAV_CYCLING_SPLIT");
          break;
        case 1237:
          result = CFSTR("WATCH_ROUTE_PLANNING_CYCLING");
          break;
        case 1238:
          result = CFSTR("WATCH_SEARCH_INPUT");
          break;
        case 1239:
          result = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
          break;
        case 1240:
          result = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE");
          break;
        case 1301:
          result = CFSTR("PERSONALIZED_ADDRESS_LIST");
          break;
        case 1302:
          result = CFSTR("PERSONALIZED_ADDRESS_FORM");
          break;
        case 1303:
          result = CFSTR("PERSONALIZED_LABEL_FORM");
          break;
        case 1304:
          result = CFSTR("PERSONALIZED_EDIT_MAP");
          break;
        case 1305:
          result = CFSTR("PERSONALIZED_CONFIRMATION");
          break;
        case 1306:
          result = CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG");
          break;
        case 1307:
          result = CFSTR("PERSONALIZED_ADDRESS_INFO");
          break;
        case 1308:
          result = CFSTR("PERSONALIZED_ADDRESS_SEARCH");
          break;
        case 1309:
          result = CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS");
          break;
        case 1310:
          result = CFSTR("FAVORITE_SEARCH");
          break;
        case 1311:
          result = CFSTR("FAVORITE_LIST");
          break;
        case 1312:
          result = CFSTR("FAVORITE_INFO");
          break;
        case 1313:
          result = CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY");
          break;
        default:
          switch(a3)
          {
            case 1401:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS");
              break;
            case 1402:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING");
              break;
            case 1403:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING");
              break;
            case 1404:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED");
              break;
            case 1405:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG");
              break;
            case 1406:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK");
              break;
            case 1407:
              result = CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL");
              break;
            default:
              switch(a3)
              {
                case 1501:
                  result = CFSTR("PLACECARD_HEADER");
                  break;
                case 1502:
                  result = CFSTR("PLACECARD_ADDRESS");
                  break;
                case 1503:
                  result = CFSTR("PLACECARD_PHONE");
                  break;
                case 1504:
                  result = CFSTR("PLACECARD_URL");
                  break;
                default:
                  goto LABEL_39;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v3 = CFSTR("UI_TARGET_UNKNOWN");
    switch(a3)
    {
      case 0:
        goto LABEL_4;
      case 1:
        v3 = CFSTR("UI_TARGET_POI");
        goto LABEL_4;
      case 2:
        result = CFSTR("UI_TARGET_SEARCH_RESULT_LIST");
        break;
      case 3:
        result = CFSTR("UI_TARGET_POPULAR_NEARBY_LIST");
        break;
      case 4:
        result = CFSTR("UI_TARGET_CALLOUT");
        break;
      case 5:
        result = CFSTR("UI_TARGET_SEARCH_PIN");
        break;
      case 6:
        result = CFSTR("UI_TARGET_DROPPED_PIN");
        break;
      case 7:
        result = CFSTR("UI_TARGET_TRANSIT_LINE");
        break;
      case 8:
        result = CFSTR("SEARCH_TRAY");
        break;
      case 9:
        result = CFSTR("SEARCH_TRAY_BROWSE");
        break;
      case 10:
        result = CFSTR("SEARCH_TRAY_POPULAR_NEARBY");
        break;
      case 11:
        result = CFSTR("SEARCH_TRAY_AC");
        break;
      case 12:
        result = CFSTR("SEARCH_TRAY_AC_INTERMEDIATE");
        break;
      case 13:
        result = CFSTR("SEARCH_TRAY_NO_QUERY");
        break;
      case 14:
        result = CFSTR("AR_WALKING_LEGAL_TRAY");
        break;
      case 15:
        result = CFSTR("RAISE_TO_START_AR_TRAY");
        break;
      case 16:
        result = CFSTR("EVENTS_ADVISORY_DETAILS_PAGE");
        break;
      case 17:
        result = CFSTR("INCIDENT_REPORT_TRAY_CARPLAY");
        break;
      case 18:
        result = CFSTR("HIGHLIGHTED_AREA");
        break;
      case 19:
        result = CFSTR("CURATED_COLLECTIONS_HOME");
        break;
      case 20:
        result = CFSTR("TRAVEL_PREFERENCES_TRAY");
        break;
      case 21:
        result = CFSTR("RESULT_TRAY_SEARCH");
        break;
      case 22:
        result = CFSTR("SINGLE_CARD_FILTER");
        break;
      case 23:
        result = CFSTR("FULL_CARD_FILTER");
        break;
      case 24:
        result = CFSTR("ACCOUNT_PRIVACY_TRAY");
        break;
      case 25:
        result = CFSTR("APPLE_RATINGS_HISTORY_TRAY");
        break;
      case 26:
        result = CFSTR("CURATED_COLLECTIONS_HOME_FILTERED");
        break;
      case 27:
        result = CFSTR("CITY_MENU");
        break;
      case 28:
        result = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED");
        break;
      case 29:
        result = CFSTR("ACCOUNT_TRAY");
        break;
      case 30:
        result = CFSTR("QUICK_ACTION_TRAY");
        break;
      case 31:
        result = CFSTR("SUBMIT_TRIP_FEEDBACK");
        break;
      case 32:
        result = CFSTR("RAP_PLACE_ISSUE_DETAILS");
        break;
      case 33:
        result = CFSTR("RAP_GUIDES_DETAILS");
        break;
      case 34:
        result = CFSTR("RAP_BAD_DIRECTIONS_DETAILS");
        break;
      case 35:
        result = CFSTR("RAP_ADD_MAP_DETAILS");
        break;
      case 36:
        result = CFSTR("WATCH_COMPLICATION");
        break;
      case 37:
        result = CFSTR("RAP_NAV_MENU");
        break;
      case 38:
        result = CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT");
        break;
      case 39:
        result = CFSTR("RAP_REPORT_MENU");
        break;
      case 40:
        result = CFSTR("RAP_CURATED_COLLECTION_MENU");
        break;
      case 41:
        result = CFSTR("RAP_REPORT_CARD_DETAILS");
        break;
      case 42:
        result = CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT");
        break;
      case 43:
        result = CFSTR("RAP_STREET_ISSUE_DETAILS");
        break;
      case 44:
        result = CFSTR("NEARBY_TRANSIT_CARD");
        break;
      case 45:
        result = CFSTR("WATCH_NAV_MENU");
        break;
      case 46:
        result = CFSTR("GENERIC_ADVISORY_PAGE");
        break;
      case 47:
        result = CFSTR("USER_PROFILE_TRAY");
        break;
      case 48:
        result = CFSTR("MEDIA_APP_MENU");
        break;
      case 49:
        result = CFSTR("TEMPLATE_PLACE_TRAY");
        break;
      case 50:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP");
        break;
      case 51:
        result = CFSTR("ALLOW_NOTIFICATION_DIALOG");
        break;
      case 52:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING");
        break;
      case 53:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP");
        break;
      case 54:
        result = CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED");
        break;
      case 55:
        result = CFSTR("NOTIFICATION_CONSENT_PROMPT");
        break;
      case 56:
        result = CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU");
        break;
      case 57:
        result = CFSTR("PLACECARD_TRAY_VENDORS_MENU");
        break;
      case 58:
        result = CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING");
        break;
      case 59:
        result = CFSTR("SEARCH_ALONG_ROUTE_TRAY");
        break;
      case 60:
        result = CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING");
        break;
      case 61:
        result = CFSTR("PLACECARD_SHOWCASE_MENU");
        break;
      case 62:
        result = CFSTR("RAP_INLINE_ADD_DETAILS");
        break;
      case 63:
        result = CFSTR("RAP_EDIT_MENU_DETAILS");
        break;
      case 64:
        result = CFSTR("RAP_SUBMISSION_PROMPT");
        break;
      case 65:
        result = CFSTR("RAP_PLACECARD_EDIT_MENU");
        break;
      case 66:
        result = CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE");
        break;
      case 67:
        result = CFSTR("INCIDENT_REPORT_MENU");
        break;
      case 68:
        result = CFSTR("RAP_SELECT_BAD_ROUTES_STEPS");
        break;
      case 69:
        result = CFSTR("RAP_SELECT_BAD_ROUTES");
        break;
      case 70:
        result = CFSTR("SIRI_SUGGESTION_RESUME_ROUTE");
        break;
      case 71:
        result = CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
        break;
      case 72:
        result = CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST");
        break;
      case 73:
        result = CFSTR("SPOTLIGHT_BUSINESS_ENTITY");
        break;
      case 74:
        result = CFSTR("NOTIFICATION_ARP");
        break;
      case 75:
        result = CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT");
        break;
      case 76:
        result = CFSTR("YOUR_PHOTOS_ALBUM");
        break;
      case 77:
        result = CFSTR("ARP_PHOTO_CREDIT");
        break;
      case 78:
        result = CFSTR("RAP_OUTREACH_REVIEWED_REPORT");
        break;
      case 79:
        result = CFSTR("RAP_REPORT_MENU_MORE");
        break;
      case 80:
        result = CFSTR("WATCH_MAPS_SETTINGS");
        break;
      case 81:
        result = CFSTR("OFFLINE_FEATURE_PROMPT");
        break;
      case 82:
        result = CFSTR("EXPIRED_MAPS_DETAILS");
        break;
      case 83:
        result = CFSTR("MAPS_VIEW");
        break;
      case 84:
        result = CFSTR("NOTIFICATION_OFFLINE");
        break;
      case 85:
        result = CFSTR("EXPIRED_MAPS_MANAGEMENT");
        break;
      case 86:
        result = CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT");
        break;
      case 87:
        result = CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT");
        break;
      case 88:
        result = CFSTR("OFFLINE_MAPS_MANAGEMENT");
        break;
      case 89:
        result = CFSTR("REGION_SELECTOR");
        break;
      case 90:
        result = CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT");
        break;
      case 91:
        result = CFSTR("FIND_MY_ETA_SHARING_TRAY");
        break;
      case 92:
        result = CFSTR("WATCH_PLACE");
        break;
      case 93:
        result = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL");
        break;
      case 94:
        result = CFSTR("WATCH_ROUTE_PLANNING_MAP");
        break;
      case 95:
        result = CFSTR("WATCH_NAV_WALKING_CONTROLS");
        break;
      case 96:
        result = CFSTR("WATCH_NAV_CYCLING_CONTROLS");
        break;
      case 97:
        result = CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL");
        break;
      case 98:
        result = CFSTR("WATCH_NAV_TRANSIT_CONTROLS");
        break;
      case 99:
        result = CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL");
        break;
      case 100:
        result = CFSTR("WATCH_NAV_DRIVING_CONTROLS");
        break;
      case 101:
        result = CFSTR("RESULTS_TRAY_SEARCH");
        break;
      case 102:
        result = CFSTR("RESULTS_TRAY_BROWSE");
        break;
      case 103:
        result = CFSTR("RESULTS_TRAY_FAVORITES");
        break;
      case 104:
        result = CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE");
        break;
      case 105:
        result = CFSTR("RESULTS_TRAY_CLUSTER");
        break;
      case 106:
        result = CFSTR("RESULTS_TRAY_VENUE_BROWSE");
        break;
      case 107:
        result = CFSTR("WATCH_MAP_RESULTS");
        break;
      case 108:
        result = CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW");
        break;
      case 109:
        result = CFSTR("WATCH_PLACES");
        break;
      case 110:
        result = CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW");
        break;
      case 111:
        result = CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL");
        break;
      case 112:
        result = CFSTR("DOWNLOADED_MAPS_DETAILS");
        break;
      case 113:
        result = CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL");
        break;
      case 114:
        result = CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP");
        break;
      case 115:
        result = CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP");
        break;
      case 116:
        result = CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP");
        break;
      case 117:
        result = CFSTR("WATCH_ROUTE_OPTIONS");
        break;
      case 118:
        result = CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP");
        break;
      case 119:
        result = CFSTR("WATCH_MORE_GUIDES");
        break;
      case 120:
        result = CFSTR("WATCH_RECENTLY_VIEWED");
        break;
      case 121:
        result = CFSTR("EV_SUCCESS_TRAY");
        break;
      case 122:
        result = CFSTR("PREFERRED_NETWORK_SELECTION_TRAY");
        break;
      case 123:
        result = CFSTR("PREFERRED_NETWORK_TRAY");
        break;
      case 124:
        result = CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 125:
        result = CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY");
        break;
      case 126:
        result = CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY");
        break;
      case 127:
        result = CFSTR("AC_KEYBOARD_TRAY");
        break;
      case 128:
        result = CFSTR("MORE_RELATED_TRAILS");
        break;
      case 129:
        result = CFSTR("MORE_RELATED_TRAILHEADS");
        break;
      case 130:
        result = CFSTR("ROUTING_TRAY_CUSTOM_ROUTE");
        break;
      case 131:
        result = CFSTR("CUSTOM_ROUTE_CREATION_TRAY");
        break;
      case 132:
        result = CFSTR("ROUTING_TRAY_CURATED_HIKE");
        break;
      case 133:
        result = CFSTR("MORE_CURATED_HIKES");
        break;
      case 134:
        result = CFSTR("CUSTOM_ROUTE_ONBOARDING");
        break;
      case 135:
        result = CFSTR("LIBRARY_ROUTES");
        break;
      case 136:
        result = CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 137:
        result = CFSTR("MY_LIBRARY");
        break;
      case 138:
        result = CFSTR("EDIT_NOTE_TRAY");
        break;
      case 139:
        result = CFSTR("CREATE_NOTE_TRAY");
        break;
      case 140:
        result = CFSTR("LIBRARY_PLACES");
        break;
      case 141:
        result = CFSTR("WATCH_ACCOUNT");
        break;
      case 142:
        result = CFSTR("WATCH_DOWNLOADED_MAPS");
        break;
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_39;
      case 201:
        result = CFSTR("PLACECARD_TRAY");
        break;
      case 202:
        result = CFSTR("WEB_MODULE");
        break;
      case 250:
        result = CFSTR("ADD_FAVORITE_TRAY");
        break;
      case 251:
        result = CFSTR("COLLECTION_LIST");
        break;
      case 252:
        result = CFSTR("COLLECTION_VIEW");
        break;
      case 253:
        result = CFSTR("FAVORITE_DETAILS");
        break;
      case 254:
        result = CFSTR("FAVORITES_TRAY");
        break;
      case 255:
        result = CFSTR("SHARED_COLLECTION");
        break;
      case 256:
        result = CFSTR("SHARED_COLLECTION_VIEW");
        break;
      case 257:
        result = CFSTR("RECENTLY_VIEWED");
        break;
      case 258:
        result = CFSTR("SHARED_WEB_COLLECTION");
        break;
      case 259:
        result = CFSTR("CURATED_COLLECTION_VIEW");
        break;
      case 260:
        result = CFSTR("FEATURED_COLLECTIONS");
        break;
      case 261:
        result = CFSTR("PUBLISHER_TRAY");
        break;
      case 262:
        result = CFSTR("SHARED_CURATED_COLLECTION_VIEW");
        break;
      case 263:
        result = CFSTR("CURATED_COLLECTION_NOTIFICATION");
        break;
      case 264:
        result = CFSTR("CURATED_COLLECTION_LIST");
        break;
      case 265:
        result = CFSTR("PUBLISHER_LIST");
        break;
      case 266:
        result = CFSTR("WATCH_CURATED_COLLECTION_VIEW");
        break;
      case 267:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST");
        break;
      case 268:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST");
        break;
      case 301:
        result = CFSTR("ROUTING_TRAY_DRIVING");
        break;
      case 302:
        result = CFSTR("ROUTING_TRAY_WALKING");
        break;
      case 303:
        result = CFSTR("ROUTING_TRAY_TRANSIT");
        break;
      case 304:
        result = CFSTR("ROUTING_TRAY_RIDESHARE");
        break;
      case 305:
        result = CFSTR("ROUTING_TRAY_CYCLING");
        break;
      case 306:
        result = CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW");
        break;
      case 401:
        result = CFSTR("NAV_TRAY_DRIVING");
        break;
      case 402:
        result = CFSTR("NAV_TRAY_WALKING");
        break;
      case 403:
        result = CFSTR("NAV_TRAY_TRANSIT");
        break;
      case 404:
        result = CFSTR("NAV_TRAY_CYCLING");
        break;
      case 501:
        result = CFSTR("MAP_PLACECARD");
        break;
      case 502:
        result = CFSTR("MAP_SEARCH");
        break;
      case 503:
        result = CFSTR("MAP_RESULTS");
        break;
      case 504:
        result = CFSTR("MAP_ROUTING");
        break;
      case 505:
        result = CFSTR("MAP_NAV");
        break;
      case 506:
        result = CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE");
        break;
      case 507:
        result = CFSTR("MAP_TRAFFIC_INCIDENT");
        break;
      case 508:
        result = CFSTR("MAP_FULL_SCREEN");
        break;
      case 509:
        result = CFSTR("MAP_DRIVE");
        break;
      case 510:
        result = CFSTR("MAP_LAUNCH_AND_GO");
        break;
      case 511:
        result = CFSTR("MAP_VIEW");
        break;
      case 601:
        result = CFSTR("MAPS_SETTINGS");
        break;
      case 602:
        result = CFSTR("MAPS_PREFERENCES");
        break;
      case 603:
        result = CFSTR("RAP");
        break;
      case 604:
        result = CFSTR("ROUTING_DRIVING_DETAILS");
        break;
      case 605:
        result = CFSTR("ROUTING_WALKING_DETAILS");
        break;
      case 606:
        result = CFSTR("ROUTING_TRANSIT_DETAILS");
        break;
      case 607:
        result = CFSTR("ROUTING_EDITOR");
        break;
      case 608:
        result = CFSTR("NAV_DRIVING_DETAILS");
        break;
      case 609:
        result = CFSTR("NAV_WALKING_DETAILS");
        break;
      case 610:
        result = CFSTR("NAV_TRANSIT_DETAILS");
        break;
      case 611:
        result = CFSTR("NAV_AUDIO_SETTINGS");
        break;
      case 612:
        result = CFSTR("PHOTO_VIEWER_ALL");
        break;
      case 613:
        result = CFSTR("PHOTO_VIEWER_SINGLE");
        break;
      case 614:
        result = CFSTR("ROUTE_OPTIONS_TRANSIT");
        break;
      case 615:
        result = CFSTR("TRAFFIC_INCIDENT_TRAY");
        break;
      case 616:
        result = CFSTR("NAV_DIRECTIONS_BANNER_DRIVING");
        break;
      case 617:
        result = CFSTR("NAV_DIRECTIONS_BANNER_WALKING");
        break;
      case 618:
        result = CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT");
        break;
      case 619:
        result = CFSTR("REFINE_SEARCH_SUGGESTION_AREA");
        break;
      case 620:
        result = CFSTR("ADD_PHOTO_SHEET");
        break;
      case 621:
        result = CFSTR("ADD_PLACE_SHEET");
        break;
      case 622:
        result = CFSTR("SHARE_SHEET");
        break;
      case 623:
        result = CFSTR("EDIT_LOCATION_SHEET");
        break;
      case 624:
        result = CFSTR("ADD_CONTACT_SHEET");
        break;
      case 625:
        result = CFSTR("EDIT_NAME_SHEET");
        break;
      case 626:
        result = CFSTR("DRIVING_NAV_SETTINGS");
        break;
      case 627:
        result = CFSTR("TRANSIT_SETTINGS");
        break;
      case 628:
        result = CFSTR("TRANSIT_ADVISORY_SHEET");
        break;
      case 629:
        result = CFSTR("REMOVE_CAR_SHEET");
        break;
      case 630:
        result = CFSTR("ROUTE_OPTIONS_DRIVING");
        break;
      case 631:
        result = CFSTR("ROUTE_OPTIONS_DATETIME");
        break;
      case 632:
        result = CFSTR("TRANSIT_ADVISORY_BANNER");
        break;
      case 633:
        result = CFSTR("BOOK_TABLE_SELECT_TIME");
        break;
      case 634:
        result = CFSTR("BOOK_TABLE_MORE_OPTIONS");
        break;
      case 635:
        result = CFSTR("BOOK_TABLE_READY");
        break;
      case 636:
        result = CFSTR("BOOK_TABLE_BOOKED");
        break;
      case 637:
        result = CFSTR("TRANSIT_LINE_CLUSTER_SHEET");
        break;
      case 638:
        result = CFSTR("TRANSIT_LINE_LIST_SHEET");
        break;
      case 639:
        result = CFSTR("TRANSIT_BALANCE_BANNER");
        break;
      case 640:
        result = CFSTR("WEATHER_ICON");
        break;
      case 641:
        result = CFSTR("HELP_IMPROVE_MAPS_DIALOG");
        break;
      case 642:
        result = CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 643:
        result = CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 644:
        result = CFSTR("FLOOR_PICKER");
        break;
      case 645:
        result = CFSTR("VENUE_LIST");
        break;
      case 646:
        result = CFSTR("AR_MODE");
        break;
      case 647:
        result = CFSTR("ROUTING_TRANSIT_TICKETS_SHEET");
        break;
      case 648:
        result = CFSTR("LINKED_SERVICE_HOURS");
        break;
      case 649:
        result = CFSTR("SHARE_ETA_TRAY");
        break;
      case 650:
        result = CFSTR("ETA_UPDATE_TRAY");
        break;
      case 651:
        result = CFSTR("SCHEDULECARD_TRAY");
        break;
      case 652:
        result = CFSTR("AR_NAV");
        break;
      case 653:
        result = CFSTR("TAP_TRANSIT_ACCESS_POINT");
        break;
      case 654:
        result = CFSTR("LOCATIONS_INSIDE");
        break;
      case 655:
        result = CFSTR("SIMILAR_LOCATIONS");
        break;
      case 656:
        result = CFSTR("LOCATIONS_AT_ADDRESS");
        break;
      case 657:
        result = CFSTR("NAV_DIRECTIONS_BANNER_CYCLING");
        break;
      case 658:
        result = CFSTR("ROUTE_OPTIONS_CYCLING");
        break;
      case 659:
        result = CFSTR("EV_CONNECTION_TRAY");
        break;
      case 660:
        result = CFSTR("VIRTUAL_GARAGE");
        break;
      case 661:
        result = CFSTR("VIRTUAL_GARAGE_BANNER");
        break;
      case 662:
        result = CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW");
        break;
      case 663:
        result = CFSTR("ADVISORY_DETAILS_PAGE");
        break;
      case 664:
        result = CFSTR("APP_CLIP_NOTIFICATION");
        break;
      case 665:
        result = CFSTR("PHOTO_VIEWER_GALLERY");
        break;
      case 666:
        result = CFSTR("RECOMMENDATION_CARD");
        break;
      case 667:
        result = CFSTR("INCIDENT_REPORT_TRAY");
        break;
      case 668:
        result = CFSTR("MAPS_WIDGET_DISPLAY");
        break;
      case 669:
        result = CFSTR("VISUAL_LOCATION_FRAMEWORK");
        break;
      case 670:
        result = CFSTR("APP_CLIP_TRAY");
        break;
      case 671:
        result = CFSTR("LICENSE_PLATE_SUGGESTION_PAGE");
        break;
      case 672:
        result = CFSTR("NOTIFICATION_ADD_PLATE");
        break;
      case 673:
        result = CFSTR("MAPS_RESULTS");
        break;
      case 674:
        result = CFSTR("MAPS_WIDGET_APP_CONNECTION");
        break;
      case 675:
        result = CFSTR("MAPS_WIDGET_CURRENT_LOCATION");
        break;
      case 676:
        result = CFSTR("MAPS_WIDGET_CURRENT_NAV");
        break;
      case 677:
        result = CFSTR("MAPS_WIDGET_ETA");
        break;
      case 678:
        result = CFSTR("MAPS_WIDGET_TRANSIT");
        break;
      case 679:
        result = CFSTR("MAPS_WIDGET_UPC_DESTINATION");
        break;
      case 680:
        result = CFSTR("WIDGET_CREATION_TRAY");
        break;
      case 681:
        result = CFSTR("MAPS_WIDGET_HOME");
        break;
      case 682:
        result = CFSTR("MAPS_WIDGET_PARKED_CAR");
        break;
      case 683:
        result = CFSTR("MAPS_WIDGET_POI");
        break;
      case 684:
        result = CFSTR("MAPS_WIDGET_SCHOOL");
        break;
      case 685:
        result = CFSTR("MAPS_WIDGET_WORK");
        break;
      case 686:
        result = CFSTR("AIRPORT_NOTIFICATION");
        break;
      case 687:
        result = CFSTR("MAPS_WIDGET_EMPTY");
        break;
      case 688:
        result = CFSTR("COARSE_LOCATION_OPTIONS_PROMPT");
        break;
      case 689:
        result = CFSTR("ALLOW_PRECISE_LOCATION_PROMPT");
        break;
      case 690:
        result = CFSTR("SHARE_MY_LOCATION");
        break;
      case 691:
        result = CFSTR("MARK_MY_LOCATION");
        break;
      case 692:
        result = CFSTR("AIRPORT_NOTIFICATION_WATCH");
        break;
      case 693:
        result = CFSTR("EDIT_FAVORITE");
        break;
      case 694:
        result = CFSTR("ROUTING_CYCLING_DETAILS");
        break;
      case 695:
        result = CFSTR("NAV_CYCLING_DETAILS");
        break;
      case 696:
        result = CFSTR("MAPS_SUGGESTION_WIDGET");
        break;
      case 697:
        result = CFSTR("ARP_TIPKIT");
        break;
      case 698:
        result = CFSTR("ARP_PRIVACY");
        break;
      case 699:
        result = CFSTR("ROUTE_OPTIONS_WALKING");
        break;
      case 701:
        result = CFSTR("SAFARI_SEARCH");
        break;
      case 702:
        result = CFSTR("SPOTLIGHT_SEARCH");
        break;
      case 703:
        result = CFSTR("SAFARI_MAPS_SEARCH_RESULTS");
        break;
      case 704:
        result = CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS");
        break;
      case 705:
        result = CFSTR("WIDGET_MAPS_DESTINATIONS");
        break;
      case 706:
        result = CFSTR("WIDGET_MAPS_TRANSIT");
        break;
      case 707:
        result = CFSTR("WIDGET_MAPS_NEARBY");
        break;
      case 708:
        result = CFSTR("NOTIFICATION_FIND_MY_CAR");
        break;
      case 709:
        result = CFSTR("CONTROL_CENTER");
        break;
      case 710:
        result = CFSTR("NOTIFICATION_CENTER");
        break;
      case 711:
        result = CFSTR("NOTIFICATION_DOOM");
        break;
      case 712:
        result = CFSTR("NOTIFICATION_VENUES");
        break;
      case 713:
        result = CFSTR("NOTIFICATION_RAP_UPDATE");
        break;
      case 714:
        result = CFSTR("NOTIFICATION_TRIP_CANCELLED");
        break;
      case 715:
        result = CFSTR("NOTIFICATION_STOP_SKIPPED");
        break;
      case 716:
        result = CFSTR("NOTIFICATION_TRIP_DELAYED");
        break;
      case 717:
        result = CFSTR("NOTIFICATION_RAP");
        break;
      case 718:
        result = CFSTR("NOTIFICATION_PROXY_AUTH");
        break;
      case 719:
        result = CFSTR("NOTIFICATION_PUSH_TO_DEVICE");
        break;
      case 720:
        result = CFSTR("NOTIFICATION_LOW_FUEL");
        break;
      case 721:
        result = CFSTR("NOTIFICATION_FIND_MY_CAR_RESET");
        break;
      case 722:
        result = CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS");
        break;
      case 723:
        result = CFSTR("NOTIFICATION_SHARED_ETA");
        break;
      case 724:
        result = CFSTR("NOTIFICATION_SHARED_ETA_UPDATE");
        break;
      case 725:
        result = CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN");
        break;
      case 726:
        result = CFSTR("ANNOUNCEMENT_TYPE_GENERAL");
        break;
      case 727:
        result = CFSTR("ANNOUNCEMENT_TYPE_FLYOVER");
        break;
      case 728:
        result = CFSTR("ANNOUNCEMENT_TYPE_TRANSIT");
        break;
      case 729:
        result = CFSTR("ANNOUNCEMENT_TYPE_VENUES");
        break;
      case 730:
        result = CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL");
        break;
      case 731:
        result = CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE");
        break;
      case 732:
        result = CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND");
        break;
      case 733:
        result = CFSTR("APP_SHEET");
        break;
      case 734:
        result = CFSTR("CZ_ADVISORY_DETAILS_PAGE");
        break;
      case 735:
        result = CFSTR("SHARE_ETA_CONTACT_TRAY");
        break;
      case 736:
        result = CFSTR("SIRI_SHARE_ETA");
        break;
      case 737:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA");
        break;
      case 738:
        result = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY");
        break;
      case 739:
        result = CFSTR("INCIDENT_ALERT_TRAY");
        break;
      case 740:
        result = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY");
        break;
      case 741:
        result = CFSTR("RAP_INCIDENT_REPORT_VIEW");
        break;
      case 742:
        result = CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY");
        break;
      case 743:
        result = CFSTR("TRAFFIC_ADVISORY_SHEET");
        break;
      case 801:
        result = CFSTR("SIRI_PLUGIN_SNIPPET");
        break;
      case 802:
        result = CFSTR("SIRI_PLUGIN_COMMAND");
        break;
      case 803:
        result = CFSTR("SIRI_SEARCH_RESULT_LIST");
        break;
      case 804:
        result = CFSTR("SIRI_DISAMBIGUATION_LIST");
        break;
      case 805:
        result = CFSTR("SIRI_PLACE_SNIPPET");
        break;
      default:
        if (a3 != 901)
          goto LABEL_39;
        result = CFSTR("CHROME");
        break;
    }
  }
  return result;
}

- (int)StringAsRestoreUiTarget:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_POI")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_RESULT_LIST")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_POPULAR_NEARBY_LIST")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_CALLOUT")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_PIN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_DROPPED_PIN")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UI_TARGET_TRANSIT_LINE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_BROWSE")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_POPULAR_NEARBY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_AC")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_AC_INTERMEDIATE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_TRAY_NO_QUERY")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_WALKING_LEGAL_TRAY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAISE_TO_START_AR_TRAY")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EVENTS_ADVISORY_DETAILS_PAGE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY_CARPLAY")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHLIGHTED_AREA")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAVEL_PREFERENCES_TRAY")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULT_TRAY_SEARCH")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SINGLE_CARD_FILTER")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FULL_CARD_FILTER")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_PRIVACY_TRAY")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_RATINGS_HISTORY_TRAY")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_FILTERED")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CITY_MENU")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ACCOUNT_TRAY")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUBMIT_TRIP_FEEDBACK")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_PLACE_ISSUE_DETAILS")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_GUIDES_DETAILS")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_BAD_DIRECTIONS_DETAILS")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_MAP_DETAILS")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_COMPLICATION")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_NAV_MENU")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_REPORT_MENU")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CURATED_COLLECTION_MENU")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_REPORT_CARD_DETAILS")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STREET_ISSUE_DETAILS")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NEARBY_TRANSIT_CARD")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_MENU")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC_ADVISORY_PAGE")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PROFILE_TRAY")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MEDIA_APP_MENU")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPLATE_PLACE_TRAY")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOW_NOTIFICATION_DIALOG")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_PROMPT")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_TRAY_VENDORS_MENU")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_TRAY")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_SHOWCASE_MENU")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_INLINE_ADD_DETAILS")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_MENU_DETAILS")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SUBMISSION_PROMPT")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_PLACECARD_EDIT_MENU")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_MENU")) & 1) != 0)
  {
    v4 = 67;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES_STEPS")) & 1) != 0)
  {
    v4 = 68;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES")) & 1) != 0)
  {
    v4 = 69;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 70;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
  {
    v4 = 71;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST")) & 1) != 0)
  {
    v4 = 72;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY")) & 1) != 0)
  {
    v4 = 73;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ARP")) & 1) != 0)
  {
    v4 = 74;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT")) & 1) != 0)
  {
    v4 = 75;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("YOUR_PHOTOS_ALBUM")) & 1) != 0)
  {
    v4 = 76;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_PHOTO_CREDIT")) & 1) != 0)
  {
    v4 = 77;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_OUTREACH_REVIEWED_REPORT")) & 1) != 0)
  {
    v4 = 78;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_REPORT_MENU_MORE")) & 1) != 0)
  {
    v4 = 79;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAPS_SETTINGS")) & 1) != 0)
  {
    v4 = 80;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_FEATURE_PROMPT")) & 1) != 0)
  {
    v4 = 81;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED_MAPS_DETAILS")) & 1) != 0)
  {
    v4 = 82;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_VIEW")) & 1) != 0)
  {
    v4 = 83;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_OFFLINE")) & 1) != 0)
  {
    v4 = 84;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 85;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 86;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 87;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 88;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REGION_SELECTOR")) & 1) != 0)
  {
    v4 = 89;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT")) & 1) != 0)
  {
    v4 = 90;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
  {
    v4 = 91;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACE")) & 1) != 0)
  {
    v4 = 92;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL")) & 1) != 0)
  {
    v4 = 93;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_MAP")) & 1) != 0)
  {
    v4 = 94;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_CONTROLS")) & 1) != 0)
  {
    v4 = 95;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_CONTROLS")) & 1) != 0)
  {
    v4 = 96;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL")) & 1) != 0)
  {
    v4 = 97;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_CONTROLS")) & 1) != 0)
  {
    v4 = 98;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL")) & 1) != 0)
  {
    v4 = 99;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_CONTROLS")) & 1) != 0)
  {
    v4 = 100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_BROWSE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_FAVORITES")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_CLUSTER")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RESULTS_TRAY_VENUE_BROWSE")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_RESULTS")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACES")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW")) & 1) != 0)
  {
    v4 = 110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL")) & 1) != 0)
  {
    v4 = 111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOWNLOADED_MAPS_DETAILS")) & 1) != 0)
  {
    v4 = 112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL")) & 1) != 0)
  {
    v4 = 113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_OPTIONS")) & 1) != 0)
  {
    v4 = 117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP")) & 1) != 0)
  {
    v4 = 118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MORE_GUIDES")) & 1) != 0)
  {
    v4 = 119;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_RECENTLY_VIEWED")) & 1) != 0)
  {
    v4 = 120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_SUCCESS_TRAY")) & 1) != 0)
  {
    v4 = 121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_NETWORK_SELECTION_TRAY")) & 1) != 0)
  {
    v4 = 122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PREFERRED_NETWORK_TRAY")) & 1) != 0)
  {
    v4 = 123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
  {
    v4 = 124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
  {
    v4 = 125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
  {
    v4 = 126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AC_KEYBOARD_TRAY")) & 1) != 0)
  {
    v4 = 127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_RELATED_TRAILS")) & 1) != 0)
  {
    v4 = 128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_RELATED_TRAILHEADS")) & 1) != 0)
  {
    v4 = 129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CUSTOM_ROUTE")) & 1) != 0)
  {
    v4 = 130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM_ROUTE_CREATION_TRAY")) & 1) != 0)
  {
    v4 = 131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CURATED_HIKE")) & 1) != 0)
  {
    v4 = 132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MORE_CURATED_HIKES")) & 1) != 0)
  {
    v4 = 133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM_ROUTE_ONBOARDING")) & 1) != 0)
  {
    v4 = 134;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIBRARY_ROUTES")) & 1) != 0)
  {
    v4 = 135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
  {
    v4 = 136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MY_LIBRARY")) & 1) != 0)
  {
    v4 = 137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_NOTE_TRAY")) & 1) != 0)
  {
    v4 = 138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CREATE_NOTE_TRAY")) & 1) != 0)
  {
    v4 = 139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIBRARY_PLACES")) & 1) != 0)
  {
    v4 = 140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ACCOUNT")) & 1) != 0)
  {
    v4 = 141;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_DOWNLOADED_MAPS")) & 1) != 0)
  {
    v4 = 142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_TRAY")) & 1) != 0)
  {
    v4 = 201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEB_MODULE")) & 1) != 0)
  {
    v4 = 202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_FAVORITE_TRAY")) & 1) != 0)
  {
    v4 = 250;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_LIST")) & 1) != 0)
  {
    v4 = 251;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 252;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_DETAILS")) & 1) != 0)
  {
    v4 = 253;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITES_TRAY")) & 1) != 0)
  {
    v4 = 254;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_COLLECTION")) & 1) != 0)
  {
    v4 = 255;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 256;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECENTLY_VIEWED")) & 1) != 0)
  {
    v4 = 257;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_WEB_COLLECTION")) & 1) != 0)
  {
    v4 = 258;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 259;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEATURED_COLLECTIONS")) & 1) != 0)
  {
    v4 = 260;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_TRAY")) & 1) != 0)
  {
    v4 = 261;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_CURATED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 262;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_NOTIFICATION")) & 1) != 0)
  {
    v4 = 263;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_LIST")) & 1) != 0)
  {
    v4 = 264;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_LIST")) & 1) != 0)
  {
    v4 = 265;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_CURATED_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 266;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST")) & 1) != 0)
  {
    v4 = 267;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST")) & 1) != 0)
  {
    v4 = 268;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_DRIVING")) & 1) != 0)
  {
    v4 = 301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_WALKING")) & 1) != 0)
  {
    v4 = 302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_TRANSIT")) & 1) != 0)
  {
    v4 = 303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE")) & 1) != 0)
  {
    v4 = 304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_CYCLING")) & 1) != 0)
  {
    v4 = 305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW")) & 1) != 0)
  {
    v4 = 306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_DRIVING")) & 1) != 0)
  {
    v4 = 401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_WALKING")) & 1) != 0)
  {
    v4 = 402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_TRANSIT")) & 1) != 0)
  {
    v4 = 403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRAY_CYCLING")) & 1) != 0)
  {
    v4 = 404;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_PLACECARD")) & 1) != 0)
  {
    v4 = 501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_SEARCH")) & 1) != 0)
  {
    v4 = 502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESULTS")) & 1) != 0)
  {
    v4 = 503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_ROUTING")) & 1) != 0)
  {
    v4 = 504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_NAV")) & 1) != 0)
  {
    v4 = 505;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 506;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_TRAFFIC_INCIDENT")) & 1) != 0)
  {
    v4 = 507;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_FULL_SCREEN")) & 1) != 0)
  {
    v4 = 508;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_DRIVE")) & 1) != 0)
  {
    v4 = 509;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_LAUNCH_AND_GO")) & 1) != 0)
  {
    v4 = 510;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_VIEW")) & 1) != 0)
  {
    v4 = 511;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_SETTINGS")) & 1) != 0)
  {
    v4 = 601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_PREFERENCES")) & 1) != 0)
  {
    v4 = 602;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP")) & 1) != 0)
  {
    v4 = 603;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_DRIVING_DETAILS")) & 1) != 0)
  {
    v4 = 604;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_WALKING_DETAILS")) & 1) != 0)
  {
    v4 = 605;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRANSIT_DETAILS")) & 1) != 0)
  {
    v4 = 606;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_EDITOR")) & 1) != 0)
  {
    v4 = 607;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DRIVING_DETAILS")) & 1) != 0)
  {
    v4 = 608;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_WALKING_DETAILS")) & 1) != 0)
  {
    v4 = 609;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_TRANSIT_DETAILS")) & 1) != 0)
  {
    v4 = 610;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_AUDIO_SETTINGS")) & 1) != 0)
  {
    v4 = 611;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_VIEWER_ALL")) & 1) != 0)
  {
    v4 = 612;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_VIEWER_SINGLE")) & 1) != 0)
  {
    v4 = 613;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_TRANSIT")) & 1) != 0)
  {
    v4 = 614;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_TRAY")) & 1) != 0)
  {
    v4 = 615;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_DRIVING")) & 1) != 0)
  {
    v4 = 616;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_WALKING")) & 1) != 0)
  {
    v4 = 617;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT")) & 1) != 0)
  {
    v4 = 618;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REFINE_SEARCH_SUGGESTION_AREA")) & 1) != 0)
  {
    v4 = 619;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_PHOTO_SHEET")) & 1) != 0)
  {
    v4 = 620;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_PLACE_SHEET")) & 1) != 0)
  {
    v4 = 621;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_SHEET")) & 1) != 0)
  {
    v4 = 622;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_LOCATION_SHEET")) & 1) != 0)
  {
    v4 = 623;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_CONTACT_SHEET")) & 1) != 0)
  {
    v4 = 624;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_NAME_SHEET")) & 1) != 0)
  {
    v4 = 625;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVING_NAV_SETTINGS")) & 1) != 0)
  {
    v4 = 626;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_SETTINGS")) & 1) != 0)
  {
    v4 = 627;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_SHEET")) & 1) != 0)
  {
    v4 = 628;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REMOVE_CAR_SHEET")) & 1) != 0)
  {
    v4 = 629;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DRIVING")) & 1) != 0)
  {
    v4 = 630;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DATETIME")) & 1) != 0)
  {
    v4 = 631;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_BANNER")) & 1) != 0)
  {
    v4 = 632;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_SELECT_TIME")) & 1) != 0)
  {
    v4 = 633;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_MORE_OPTIONS")) & 1) != 0)
  {
    v4 = 634;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_READY")) & 1) != 0)
  {
    v4 = 635;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOK_TABLE_BOOKED")) & 1) != 0)
  {
    v4 = 636;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_CLUSTER_SHEET")) & 1) != 0)
  {
    v4 = 637;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_LIST_SHEET")) & 1) != 0)
  {
    v4 = 638;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_BALANCE_BANNER")) & 1) != 0)
  {
    v4 = 639;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WEATHER_ICON")) & 1) != 0)
  {
    v4 = 640;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HELP_IMPROVE_MAPS_DIALOG")) & 1) != 0)
  {
    v4 = 641;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
  {
    v4 = 642;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
  {
    v4 = 643;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FLOOR_PICKER")) & 1) != 0)
  {
    v4 = 644;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VENUE_LIST")) & 1) != 0)
  {
    v4 = 645;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_MODE")) & 1) != 0)
  {
    v4 = 646;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRANSIT_TICKETS_SHEET")) & 1) != 0)
  {
    v4 = 647;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LINKED_SERVICE_HOURS")) & 1) != 0)
  {
    v4 = 648;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_ETA_TRAY")) & 1) != 0)
  {
    v4 = 649;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ETA_UPDATE_TRAY")) & 1) != 0)
  {
    v4 = 650;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCHEDULECARD_TRAY")) & 1) != 0)
  {
    v4 = 651;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AR_NAV")) & 1) != 0)
  {
    v4 = 652;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAP_TRANSIT_ACCESS_POINT")) & 1) != 0)
  {
    v4 = 653;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATIONS_INSIDE")) & 1) != 0)
  {
    v4 = 654;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIMILAR_LOCATIONS")) & 1) != 0)
  {
    v4 = 655;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATIONS_AT_ADDRESS")) & 1) != 0)
  {
    v4 = 656;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_CYCLING")) & 1) != 0)
  {
    v4 = 657;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_CYCLING")) & 1) != 0)
  {
    v4 = 658;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_CONNECTION_TRAY")) & 1) != 0)
  {
    v4 = 659;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL_GARAGE")) & 1) != 0)
  {
    v4 = 660;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_BANNER")) & 1) != 0)
  {
    v4 = 661;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW")) & 1) != 0)
  {
    v4 = 662;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADVISORY_DETAILS_PAGE")) & 1) != 0)
  {
    v4 = 663;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_CLIP_NOTIFICATION")) & 1) != 0)
  {
    v4 = 664;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_VIEWER_GALLERY")) & 1) != 0)
  {
    v4 = 665;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECOMMENDATION_CARD")) & 1) != 0)
  {
    v4 = 666;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY")) & 1) != 0)
  {
    v4 = 667;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_DISPLAY")) & 1) != 0)
  {
    v4 = 668;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VISUAL_LOCATION_FRAMEWORK")) & 1) != 0)
  {
    v4 = 669;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_CLIP_TRAY")) & 1) != 0)
  {
    v4 = 670;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LICENSE_PLATE_SUGGESTION_PAGE")) & 1) != 0)
  {
    v4 = 671;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_ADD_PLATE")) & 1) != 0)
  {
    v4 = 672;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_RESULTS")) & 1) != 0)
  {
    v4 = 673;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_APP_CONNECTION")) & 1) != 0)
  {
    v4 = 674;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 675;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_NAV")) & 1) != 0)
  {
    v4 = 676;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_ETA")) & 1) != 0)
  {
    v4 = 677;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_TRANSIT")) & 1) != 0)
  {
    v4 = 678;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_UPC_DESTINATION")) & 1) != 0)
  {
    v4 = 679;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_CREATION_TRAY")) & 1) != 0)
  {
    v4 = 680;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_HOME")) & 1) != 0)
  {
    v4 = 681;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_PARKED_CAR")) & 1) != 0)
  {
    v4 = 682;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_POI")) & 1) != 0)
  {
    v4 = 683;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_SCHOOL")) & 1) != 0)
  {
    v4 = 684;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_WORK")) & 1) != 0)
  {
    v4 = 685;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION")) & 1) != 0)
  {
    v4 = 686;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WIDGET_EMPTY")) & 1) != 0)
  {
    v4 = 687;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COARSE_LOCATION_OPTIONS_PROMPT")) & 1) != 0)
  {
    v4 = 688;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ALLOW_PRECISE_LOCATION_PROMPT")) & 1) != 0)
  {
    v4 = 689;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_MY_LOCATION")) & 1) != 0)
  {
    v4 = 690;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MARK_MY_LOCATION")) & 1) != 0)
  {
    v4 = 691;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION_WATCH")) & 1) != 0)
  {
    v4 = 692;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EDIT_FAVORITE")) & 1) != 0)
  {
    v4 = 693;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_CYCLING_DETAILS")) & 1) != 0)
  {
    v4 = 694;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAV_CYCLING_DETAILS")) & 1) != 0)
  {
    v4 = 695;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_SUGGESTION_WIDGET")) & 1) != 0)
  {
    v4 = 696;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_TIPKIT")) & 1) != 0)
  {
    v4 = 697;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_PRIVACY")) & 1) != 0)
  {
    v4 = 698;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_OPTIONS_WALKING")) & 1) != 0)
  {
    v4 = 699;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_SEARCH")) & 1) != 0)
  {
    v4 = 701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_SEARCH")) & 1) != 0)
  {
    v4 = 702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SAFARI_MAPS_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 703;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_MAPS_DESTINATIONS")) & 1) != 0)
  {
    v4 = 705;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_MAPS_TRANSIT")) & 1) != 0)
  {
    v4 = 706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIDGET_MAPS_NEARBY")) & 1) != 0)
  {
    v4 = 707;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR")) & 1) != 0)
  {
    v4 = 708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTROL_CENTER")) & 1) != 0)
  {
    v4 = 709;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_CENTER")) & 1) != 0)
  {
    v4 = 710;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_DOOM")) & 1) != 0)
  {
    v4 = 711;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_VENUES")) & 1) != 0)
  {
    v4 = 712;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_RAP_UPDATE")) & 1) != 0)
  {
    v4 = 713;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_CANCELLED")) & 1) != 0)
  {
    v4 = 714;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_STOP_SKIPPED")) & 1) != 0)
  {
    v4 = 715;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_DELAYED")) & 1) != 0)
  {
    v4 = 716;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_RAP")) & 1) != 0)
  {
    v4 = 717;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_PROXY_AUTH")) & 1) != 0)
  {
    v4 = 718;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_PUSH_TO_DEVICE")) & 1) != 0)
  {
    v4 = 719;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_LOW_FUEL")) & 1) != 0)
  {
    v4 = 720;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR_RESET")) & 1) != 0)
  {
    v4 = 721;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS")) & 1) != 0)
  {
    v4 = 722;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA")) & 1) != 0)
  {
    v4 = 723;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA_UPDATE")) & 1) != 0)
  {
    v4 = 724;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 725;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_GENERAL")) & 1) != 0)
  {
    v4 = 726;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 727;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_TRANSIT")) & 1) != 0)
  {
    v4 = 728;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_VENUES")) & 1) != 0)
  {
    v4 = 729;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL")) & 1) != 0)
  {
    v4 = 730;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE")) & 1) != 0)
  {
    v4 = 731;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 732;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APP_SHEET")) & 1) != 0)
  {
    v4 = 733;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CZ_ADVISORY_DETAILS_PAGE")) & 1) != 0)
  {
    v4 = 734;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHARE_ETA_CONTACT_TRAY")) & 1) != 0)
  {
    v4 = 735;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SHARE_ETA")) & 1) != 0)
  {
    v4 = 736;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA")) & 1) != 0)
  {
    v4 = 737;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY")) & 1) != 0)
  {
    v4 = 738;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_ALERT_TRAY")) & 1) != 0)
  {
    v4 = 739;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY")) & 1) != 0)
  {
    v4 = 740;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_INCIDENT_REPORT_VIEW")) & 1) != 0)
  {
    v4 = 741;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY")) & 1) != 0)
  {
    v4 = 742;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_ADVISORY_SHEET")) & 1) != 0)
  {
    v4 = 743;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_PLUGIN_SNIPPET")) & 1) != 0)
  {
    v4 = 801;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_PLUGIN_COMMAND")) & 1) != 0)
  {
    v4 = 802;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_SEARCH_RESULT_LIST")) & 1) != 0)
  {
    v4 = 803;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_DISAMBIGUATION_LIST")) & 1) != 0)
  {
    v4 = 804;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SIRI_PLACE_SNIPPET")) & 1) != 0)
  {
    v4 = 805;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CHROME")) & 1) != 0)
  {
    v4 = 901;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NAV")) & 1) != 0)
  {
    v4 = 1001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_EXPLORE")) & 1) != 0)
  {
    v4 = 1002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_DESTINATIONS")) & 1) != 0)
  {
    v4 = 1003;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_TRAFFIC_INCIDENT")) & 1) != 0)
  {
    v4 = 1004;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_CONTROL")) & 1) != 0)
  {
    v4 = 1005;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_PROACTIVE")) & 1) != 0)
  {
    v4 = 1006;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ROUTING")) & 1) != 0)
  {
    v4 = 1007;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_MORE_ROUTES")) & 1) != 0)
  {
    v4 = 1008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
  {
    v4 = 1009;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH")) & 1) != 0)
  {
    v4 = 1010;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 1011;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_FAVORITES")) & 1) != 0)
  {
    v4 = 1012;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NAV_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1013;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_DESTINATION_SHARING")) & 1) != 0)
  {
    v4 = 1014;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_BATTERY")) & 1) != 0)
  {
    v4 = 1015;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_DOOM")) & 1) != 0)
  {
    v4 = 1016;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_FUEL")) & 1) != 0)
  {
    v4 = 1017;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_HYBRID")) & 1) != 0)
  {
    v4 = 1018;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_SHARE_ETA_TRAY")) & 1) != 0)
  {
    v4 = 1019;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ETA_UPDATE_TRAY")) & 1) != 0)
  {
    v4 = 1020;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_ACTION_TRAY")) & 1) != 0)
  {
    v4 = 1021;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_PLACECARD")) & 1) != 0)
  {
    v4 = 1022;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_KEYBOARD")) & 1) != 0)
  {
    v4 = 1023;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_UI_TARGET_UNKNOWN")) & 1) != 0)
  {
    v4 = 1024;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARPLAY_EDIT_STOPS")) & 1) != 0)
  {
    v4 = 1025;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_MENU")) & 1) != 0)
  {
    v4 = 1100;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST")) & 1) != 0)
  {
    v4 = 1101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM")) & 1) != 0)
  {
    v4 = 1103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_TRANSIT_MENU")) & 1) != 0)
  {
    v4 = 1106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_MAP")) & 1) != 0)
  {
    v4 = 1107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_MENU")) & 1) != 0)
  {
    v4 = 1108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP")) & 1) != 0)
  {
    v4 = 1109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1110;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STATION_CLOSED_FORM")) & 1) != 0)
  {
    v4 = 1111;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_MAP")) & 1) != 0)
  {
    v4 = 1112;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_MENU")) & 1) != 0)
  {
    v4 = 1113;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_NAME_FORM")) & 1) != 0)
  {
    v4 = 1114;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_SHAPE_FORM")) & 1) != 0)
  {
    v4 = 1115;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1116;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_PLACE_MENU")) & 1) != 0)
  {
    v4 = 1117;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_POI_MAP")) & 1) != 0)
  {
    v4 = 1118;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CATEGORY_LIST")) & 1) != 0)
  {
    v4 = 1119;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1120;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_STREET_MAP")) & 1) != 0)
  {
    v4 = 1121;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_STREET_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1122;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_OTHER_MAP")) & 1) != 0)
  {
    v4 = 1123;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_OTHER_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1124;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CAMERA")) & 1) != 0)
  {
    v4 = 1125;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LABEL_MAP")) & 1) != 0)
  {
    v4 = 1126;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LABEL_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1127;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_MENU")) & 1) != 0)
  {
    v4 = 1128;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM")) & 1) != 0)
  {
    v4 = 1129;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM")) & 1) != 0)
  {
    v4 = 1130;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP")) & 1) != 0)
  {
    v4 = 1131;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1132;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_MAP")) & 1) != 0)
  {
    v4 = 1133;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1134;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_OTHER_FORM")) & 1) != 0)
  {
    v4 = 1135;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_PRIVACY")) & 1) != 0)
  {
    v4 = 1136;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1137;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_MENU")) & 1) != 0)
  {
    v4 = 1138;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU")) & 1) != 0)
  {
    v4 = 1139;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_A_PLACE_MAP")) & 1) != 0)
  {
    v4 = 1140;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_LOCATION_MAP")) & 1) != 0)
  {
    v4 = 1141;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP")) & 1) != 0)
  {
    v4 = 1142;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_POI_CLOSED_FORM")) & 1) != 0)
  {
    v4 = 1143;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_CLAIM_BUSINESS_DIALOG")) & 1) != 0)
  {
    v4 = 1144;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_BRAND_MENU")) & 1) != 0)
  {
    v4 = 1145;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_BRAND_DETAILS_FORM")) & 1) != 0)
  {
    v4 = 1146;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM")) & 1) != 0)
  {
    v4 = 1147;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM")) & 1) != 0)
  {
    v4 = 1148;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_BLURRING_FORM")) & 1) != 0)
  {
    v4 = 1149;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM")) & 1) != 0)
  {
    v4 = 1150;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_MENU")) & 1) != 0)
  {
    v4 = 1151;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM")) & 1) != 0)
  {
    v4 = 1152;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU")) & 1) != 0)
  {
    v4 = 1153;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LIGHTWEIGHT")) & 1) != 0)
  {
    v4 = 1154;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_PLACE_DETAILS")) & 1) != 0)
  {
    v4 = 1155;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_CATEGORY")) & 1) != 0)
  {
    v4 = 1156;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_HOURS")) & 1) != 0)
  {
    v4 = 1157;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_LOCATION")) & 1) != 0)
  {
    v4 = 1158;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_EDIT_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 1159;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_LOOK_AROUND")) & 1) != 0)
  {
    v4 = 1160;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RAP_ADD_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 1161;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAIN_MENU")) & 1) != 0)
  {
    v4 = 1201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAIN_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH")) & 1) != 0)
  {
    v4 = 1203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_DICTATION")) & 1) != 0)
  {
    v4 = 1204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_FAVORITES")) & 1) != 0)
  {
    v4 = 1205;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SUB_CATEGORY_LIST")) & 1) != 0)
  {
    v4 = 1206;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_LIST")) & 1) != 0)
  {
    v4 = 1207;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_VIEW")) & 1) != 0)
  {
    v4 = 1208;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PLACECARD")) & 1) != 0)
  {
    v4 = 1209;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 1210;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_DETAILS")) & 1) != 0)
  {
    v4 = 1211;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TBT")) & 1) != 0)
  {
    v4 = 1212;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_MAP")) & 1) != 0)
  {
    v4 = 1213;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1214;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_MAP_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1215;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTING_PRESS_MENU")) & 1) != 0)
  {
    v4 = 1216;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_TRANSIT_MAP_VIEW")) & 1) != 0)
  {
    v4 = 1217;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SCRIBBLE")) & 1) != 0)
  {
    v4 = 1218;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_COLLECTION_VIEW")) & 1) != 0)
  {
    v4 = 1219;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING")) & 1) != 0)
  {
    v4 = 1220;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING")) & 1) != 0)
  {
    v4 = 1221;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT")) & 1) != 0)
  {
    v4 = 1222;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_PAIRED_DEVICE")) & 1) != 0)
  {
    v4 = 1223;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_SPLIT")) & 1) != 0)
  {
    v4 = 1224;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_PLATTER")) & 1) != 0)
  {
    v4 = 1225;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_MAP")) & 1) != 0)
  {
    v4 = 1226;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_SPLIT")) & 1) != 0)
  {
    v4 = 1227;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_PLATTER")) & 1) != 0)
  {
    v4 = 1228;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_MAP")) & 1) != 0)
  {
    v4 = 1229;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_SPLIT")) & 1) != 0)
  {
    v4 = 1230;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_PLATTER")) & 1) != 0)
  {
    v4 = 1231;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_MAP")) & 1) != 0)
  {
    v4 = 1232;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_INFO")) & 1) != 0)
  {
    v4 = 1233;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_MAP")) & 1) != 0)
  {
    v4 = 1234;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_PLATTER")) & 1) != 0)
  {
    v4 = 1235;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_SPLIT")) & 1) != 0)
  {
    v4 = 1236;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING")) & 1) != 0)
  {
    v4 = 1237;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SEARCH_INPUT")) & 1) != 0)
  {
    v4 = 1238;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
  {
    v4 = 1239;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
  {
    v4 = 1240;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_LIST")) & 1) != 0)
  {
    v4 = 1301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_FORM")) & 1) != 0)
  {
    v4 = 1302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_LABEL_FORM")) & 1) != 0)
  {
    v4 = 1303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_EDIT_MAP")) & 1) != 0)
  {
    v4 = 1304;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION")) & 1) != 0)
  {
    v4 = 1305;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG")) & 1) != 0)
  {
    v4 = 1306;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_INFO")) & 1) != 0)
  {
    v4 = 1307;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH")) & 1) != 0)
  {
    v4 = 1308;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 1309;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_SEARCH")) & 1) != 0)
  {
    v4 = 1310;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_LIST")) & 1) != 0)
  {
    v4 = 1311;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAVORITE_INFO")) & 1) != 0)
  {
    v4 = 1312;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY")) & 1) != 0)
  {
    v4 = 1313;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS")) & 1) != 0)
  {
    v4 = 1401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING")) & 1) != 0)
  {
    v4 = 1402;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING")) & 1) != 0)
  {
    v4 = 1403;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED")) & 1) != 0)
  {
    v4 = 1404;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG")) & 1) != 0)
  {
    v4 = 1405;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK")) & 1) != 0)
  {
    v4 = 1406;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL")) & 1) != 0)
  {
    v4 = 1407;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_HEADER")) & 1) != 0)
  {
    v4 = 1501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_ADDRESS")) & 1) != 0)
  {
    v4 = 1502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_PHONE")) & 1) != 0)
  {
    v4 = 1503;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACECARD_URL")) & 1) != 0)
  {
    v4 = 1504;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MENU_ITEM_DARK_MAP")) & 1) != 0)
  {
    v4 = 1601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP")) & 1) != 0)
  {
    v4 = 1700;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_ACTION_SHEET")) & 1) != 0)
  {
    v4 = 1701;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW")) & 1) != 0)
  {
    v4 = 1702;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PLATTER")) & 1) != 0)
  {
    v4 = 1703;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM")) & 1) != 0)
  {
    v4 = 1704;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION")) & 1) != 0)
  {
    v4 = 1705;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW_PLACECARD")) & 1) != 0)
  {
    v4 = 1706;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_PLACECARD")) & 1) != 0)
  {
    v4 = 1707;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY")) & 1) != 0)
  {
    v4 = 1708;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_PLACE")) & 1) != 0)
  {
    v4 = 1801;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH")) & 1) != 0)
  {
    v4 = 1802;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 1803;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_PUBLISHER")) & 1) != 0)
  {
    v4 = 1804;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_GUIDE")) & 1) != 0)
  {
    v4 = 1805;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 1806;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_RELATED_PLACES_LIST")) & 1) != 0)
  {
    v4 = 1807;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_COLLECTION_LIST")) & 1) != 0)
  {
    v4 = 1808;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_DIRECTIONS")) & 1) != 0)
  {
    v4 = 1809;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MAPS_WEB_SIDEBAR")))
  {
    v4 = 1810;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMapLaunchSourceAppId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x2000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapLaunchSourceAppId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapLaunchSourceAppId
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchSourceAppId]((uint64_t)self);
  return self->_mapLaunchSourceAppId != 0;
}

- (NSString)mapLaunchSourceAppId
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchSourceAppId]((uint64_t)self);
  return self->_mapLaunchSourceAppId;
}

- (void)setMapLaunchSourceAppId:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x2000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapLaunchSourceAppId, a3);
}

- (void)_readMapLaunchLaunchUri
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x800000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapLaunchLaunchUri_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapLaunchLaunchUri
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchLaunchUri]((uint64_t)self);
  return self->_mapLaunchLaunchUri != 0;
}

- (NSString)mapLaunchLaunchUri
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchLaunchUri]((uint64_t)self);
  return self->_mapLaunchLaunchUri;
}

- (void)setMapLaunchLaunchUri:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x800000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapLaunchLaunchUri, a3);
}

- (void)_readMapLaunchReferringWebsite
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x1000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapLaunchReferringWebsite_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapLaunchReferringWebsite
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchReferringWebsite]((uint64_t)self);
  return self->_mapLaunchReferringWebsite != 0;
}

- (NSString)mapLaunchReferringWebsite
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchReferringWebsite]((uint64_t)self);
  return self->_mapLaunchReferringWebsite;
}

- (void)setMapLaunchReferringWebsite:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x1000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapLaunchReferringWebsite, a3);
}

- (BOOL)mapLaunchIsHandoff
{
  return self->_mapLaunchIsHandoff;
}

- (void)setMapLaunchIsHandoff:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapLaunchIsHandoff = a3;
}

- (void)setHasMapLaunchIsHandoff:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 4;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFFBLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapLaunchIsHandoff
{
  return (*((_QWORD *)&self->_flags + 1) >> 2) & 1;
}

- (void)_readMapLaunchSourceHandoffDevice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x4000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapLaunchSourceHandoffDevice_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapLaunchSourceHandoffDevice
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchSourceHandoffDevice]((uint64_t)self);
  return self->_mapLaunchSourceHandoffDevice != 0;
}

- (NSString)mapLaunchSourceHandoffDevice
{
  -[GEOAnalyticsPipelineStateData _readMapLaunchSourceHandoffDevice]((uint64_t)self);
  return self->_mapLaunchSourceHandoffDevice;
}

- (void)setMapLaunchSourceHandoffDevice:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x4000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapLaunchSourceHandoffDevice, a3);
}

- (int)mapLaunchAction
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x4000000) != 0)
    return self->_mapLaunchAction;
  else
    return 0;
}

- (void)setMapLaunchAction:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x4000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapLaunchAction = a3;
}

- (void)setHasMapLaunchAction:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x4000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFBFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapLaunchAction
{
  return (*(_QWORD *)&self->_flags >> 26) & 1;
}

- (id)mapLaunchActionAsString:(int)a3
{
  if (a3 < 0x29)
    return off_1E1C20108[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapLaunchAction:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowLPROnboardingAction")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowCarDestinationsAction")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_SharedTripAction")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowCollectionAction")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_BrandAction")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_DirectionAction")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_DisplayModeNavAction")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ErrorAction")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ForwardGeocodeAction")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_LowFuelAction")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_MarkUserLocationAction")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_NotificationRestorationAction")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_OpenLookAroundAction")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PlaceRefinementAction")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentAnnouncementAction")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentFlyoverAction")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentNavShareETAAction")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentNearbySearchAction")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentParkedCarAction")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentRAPAction")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentPhotoThumbnailGalleryAction")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_PresentTableBookingAction")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_RefineMapItemAction")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ResetAction")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ResolveMUIDAction")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_RestorationAction")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ReverseGeocodeAction")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_SearchAction")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_SearchSelectionAction")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShareUserLocationAction")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowKeyboardAction")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowSearchInfoAction")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ZoomMapAction")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowCuratedCollectionAction")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowPublisherAction")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_NewWindowAction")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ShowAllCuratedCollectionsAction")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_ReportIncidentAction")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_URLRestorationAction")) & 1) != 0)
  {
    v4 = 39;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LaunchAction_SiriRestorationAction")))
  {
    v4 = 40;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readCuratedCollectionState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x40000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readCuratedCollectionState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasCuratedCollectionState
{
  -[GEOAnalyticsPipelineStateData _readCuratedCollectionState]((uint64_t)self);
  return self->_curatedCollectionState != 0;
}

- (GEOLogMsgStateCuratedCollection)curatedCollectionState
{
  -[GEOAnalyticsPipelineStateData _readCuratedCollectionState]((uint64_t)self);
  return self->_curatedCollectionState;
}

- (void)setCuratedCollectionState:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x40000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_curatedCollectionState, a3);
}

- (BOOL)mapSettingsAvoidHills
{
  return self->_mapSettingsAvoidHills;
}

- (void)setMapSettingsAvoidHills:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x20;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsAvoidHills = a3;
}

- (void)setHasMapSettingsAvoidHills:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 32;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFDFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsAvoidHills
{
  return (*((_QWORD *)&self->_flags + 1) >> 5) & 1;
}

- (BOOL)mapSettingsAvoidStairs
{
  return self->_mapSettingsAvoidStairs;
}

- (void)setMapSettingsAvoidStairs:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x40;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsAvoidStairs = a3;
}

- (void)setHasMapSettingsAvoidStairs:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 64;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFBFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsAvoidStairs
{
  return (*((_QWORD *)&self->_flags + 1) >> 6) & 1;
}

- (BOOL)mapSettingsAvoidBusyRoads
{
  return self->_mapSettingsAvoidBusyRoads;
}

- (void)setMapSettingsAvoidBusyRoads:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 8;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsAvoidBusyRoads = a3;
}

- (void)setHasMapSettingsAvoidBusyRoads:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 8;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFF7 | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsAvoidBusyRoads
{
  return (*((_QWORD *)&self->_flags + 1) >> 3) & 1;
}

- (int)mapSettingsLocationPrecisionType
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x20000000) != 0)
    return self->_mapSettingsLocationPrecisionType;
  else
    return 0;
}

- (void)setMapSettingsLocationPrecisionType:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapSettingsLocationPrecisionType = a3;
}

- (void)setHasMapSettingsLocationPrecisionType:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x20000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFDFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsLocationPrecisionType
{
  return (*(_QWORD *)&self->_flags >> 29) & 1;
}

- (id)mapSettingsLocationPrecisionTypeAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20250[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapSettingsLocationPrecisionType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_NO_AUTH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_PRECISE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_COARSE")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)mapSettingsEBike
{
  return self->_mapSettingsEBike;
}

- (void)setMapSettingsEBike:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x200;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsEBike = a3;
}

- (void)setHasMapSettingsEBike:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 512;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFDFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsEBike
{
  return (*((_QWORD *)&self->_flags + 1) >> 9) & 1;
}

- (void)_readUgcPhotoState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x4000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUgcPhotoState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasUgcPhotoState
{
  -[GEOAnalyticsPipelineStateData _readUgcPhotoState]((uint64_t)self);
  return self->_ugcPhotoState != 0;
}

- (GEOLogMsgStateUGCPhoto)ugcPhotoState
{
  -[GEOAnalyticsPipelineStateData _readUgcPhotoState]((uint64_t)self);
  return self->_ugcPhotoState;
}

- (void)setUgcPhotoState:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x24000;
  *((_WORD *)&self->_flags + 8) |= 0x4000u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_ugcPhotoState, a3);
}

- (void)_readMetroRegion
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x100000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMetroRegion_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMetroRegion
{
  -[GEOAnalyticsPipelineStateData _readMetroRegion]((uint64_t)self);
  return self->_metroRegion != 0;
}

- (NSString)metroRegion
{
  -[GEOAnalyticsPipelineStateData _readMetroRegion]((uint64_t)self);
  return self->_metroRegion;
}

- (void)setMetroRegion:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x100000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_metroRegion, a3);
}

- (void)_readUserHomeMetro
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if (((*(unsigned __int16 *)(a1 + 740) | (*(unsigned __int8 *)(a1 + 742) << 16)) & 0x10000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUserHomeMetro_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasUserHomeMetro
{
  -[GEOAnalyticsPipelineStateData _readUserHomeMetro]((uint64_t)self);
  return self->_userHomeMetro != 0;
}

- (NSString)userHomeMetro
{
  -[GEOAnalyticsPipelineStateData _readUserHomeMetro]((uint64_t)self);
  return self->_userHomeMetro;
}

- (void)setUserHomeMetro:(id)a3
{
  unsigned int v3;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x30000u) >> 16;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_userHomeMetro, a3);
}

- (void)_readUserHomeCountry
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x8000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readUserHomeCountry_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasUserHomeCountry
{
  -[GEOAnalyticsPipelineStateData _readUserHomeCountry]((uint64_t)self);
  return self->_userHomeCountry != 0;
}

- (NSString)userHomeCountry
{
  -[GEOAnalyticsPipelineStateData _readUserHomeCountry]((uint64_t)self);
  return self->_userHomeCountry;
}

- (void)setUserHomeCountry:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x28000;
  *((_WORD *)&self->_flags + 8) |= 0x8000u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_userHomeCountry, a3);
}

- (int)mapSettingsDrivingVoiceSettings
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10000000) != 0)
    return self->_mapSettingsDrivingVoiceSettings;
  else
    return 0;
}

- (void)setMapSettingsDrivingVoiceSettings:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x10000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapSettingsDrivingVoiceSettings = a3;
}

- (void)setHasMapSettingsDrivingVoiceSettings:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x10000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFEFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsDrivingVoiceSettings
{
  return (*(_QWORD *)&self->_flags >> 28) & 1;
}

- (id)mapSettingsDrivingVoiceSettingsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20270[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapSettingsDrivingVoiceSettings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapSettingsWalkingVoiceSettings
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x100000000) != 0)
    return self->_mapSettingsWalkingVoiceSettings;
  else
    return 0;
}

- (void)setMapSettingsWalkingVoiceSettings:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapSettingsWalkingVoiceSettings = a3;
}

- (void)setHasMapSettingsWalkingVoiceSettings:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x100000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFEFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsWalkingVoiceSettings
{
  return HIDWORD(*(_QWORD *)&self->_flags) & 1;
}

- (id)mapSettingsWalkingVoiceSettingsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20270[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapSettingsWalkingVoiceSettings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (int)mapSettingsCyclingVoiceSettings
{
  os_unfair_lock_s *p_readerLock;
  uint64_t flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (uint64_t)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x8000000) != 0)
    return self->_mapSettingsCyclingVoiceSettings;
  else
    return 0;
}

- (void)setMapSettingsCyclingVoiceSettings:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x8000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapSettingsCyclingVoiceSettings = a3;
}

- (void)setHasMapSettingsCyclingVoiceSettings:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x8000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFF7FFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsCyclingVoiceSettings
{
  return (*(_QWORD *)&self->_flags >> 27) & 1;
}

- (id)mapSettingsCyclingVoiceSettingsAsString:(int)a3
{
  if (a3 < 4)
    return off_1E1C20270[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsMapSettingsCyclingVoiceSettings:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LEVEL_FULL")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readAccount
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x8000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readAccount_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasAccount
{
  -[GEOAnalyticsPipelineStateData _readAccount]((uint64_t)self);
  return self->_account != 0;
}

- (GEOLogMsgStateAccount)account
{
  -[GEOAnalyticsPipelineStateData _readAccount]((uint64_t)self);
  return self->_account;
}

- (void)setAccount:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x8000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_account, a3);
}

- (int)mapFeaturePersonalCollectionsCount
{
  return self->_mapFeaturePersonalCollectionsCount;
}

- (void)setMapFeaturePersonalCollectionsCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x400000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeaturePersonalCollectionsCount = a3;
}

- (void)setHasMapFeaturePersonalCollectionsCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x400000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFBFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeaturePersonalCollectionsCount
{
  return (*(_QWORD *)&self->_flags >> 22) & 1;
}

- (int)mapFeatureSavedCollectionsCount
{
  return self->_mapFeatureSavedCollectionsCount;
}

- (void)setMapFeatureSavedCollectionsCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x800000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureSavedCollectionsCount = a3;
}

- (void)setHasMapFeatureSavedCollectionsCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x800000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFF7FFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureSavedCollectionsCount
{
  return (*(_QWORD *)&self->_flags >> 23) & 1;
}

- (int)mapFeatureSubmittedRatingsCount
{
  return self->_mapFeatureSubmittedRatingsCount;
}

- (void)setMapFeatureSubmittedRatingsCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x2000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureSubmittedRatingsCount = a3;
}

- (void)setHasMapFeatureSubmittedRatingsCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x2000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFDFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureSubmittedRatingsCount
{
  return (*(_QWORD *)&self->_flags >> 25) & 1;
}

- (int)mapFeatureSubmittedPhotosCount
{
  return self->_mapFeatureSubmittedPhotosCount;
}

- (void)setMapFeatureSubmittedPhotosCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureSubmittedPhotosCount = a3;
}

- (void)setHasMapFeatureSubmittedPhotosCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x1000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFEFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureSubmittedPhotosCount
{
  return (*(_QWORD *)&self->_flags >> 24) & 1;
}

- (int)mapFeatureElectronicVehicleCount
{
  return self->_mapFeatureElectronicVehicleCount;
}

- (void)setMapFeatureElectronicVehicleCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureElectronicVehicleCount = a3;
}

- (void)setHasMapFeatureElectronicVehicleCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x8000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFF7FFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureElectronicVehicleCount
{
  return (*(_QWORD *)&self->_flags >> 15) & 1;
}

- (int)mapFeatureLicensePlateCount
{
  return self->_mapFeatureLicensePlateCount;
}

- (void)setMapFeatureLicensePlateCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureLicensePlateCount = a3;
}

- (void)setHasMapFeatureLicensePlateCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x200000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFDFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureLicensePlateCount
{
  return (*(_QWORD *)&self->_flags >> 21) & 1;
}

- (BOOL)suggestionsSiriEnabled
{
  return self->_suggestionsSiriEnabled;
}

- (void)setSuggestionsSiriEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x200000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_suggestionsSiriEnabled = a3;
}

- (void)setHasSuggestionsSiriEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x200000000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFDFFFFFFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasSuggestionsSiriEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 33) & 1;
}

- (BOOL)mapFeatureIsHomeFavoriteSet
{
  return self->_mapFeatureIsHomeFavoriteSet;
}

- (void)setMapFeatureIsHomeFavoriteSet:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureIsHomeFavoriteSet = a3;
}

- (void)setHasMapFeatureIsHomeFavoriteSet:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x4000000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xBFFFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureIsHomeFavoriteSet
{
  return (*(_QWORD *)&self->_flags >> 62) & 1;
}

- (BOOL)mapFeatureIsWorkFavoriteSet
{
  return self->_mapFeatureIsWorkFavoriteSet;
}

- (void)setMapFeatureIsWorkFavoriteSet:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 2;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapFeatureIsWorkFavoriteSet = a3;
}

- (void)setHasMapFeatureIsWorkFavoriteSet:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 2;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFFDLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureIsWorkFavoriteSet
{
  return (*((_QWORD *)&self->_flags + 1) >> 1) & 1;
}

- (BOOL)mapFeatureIsSchoolFavoriteSet
{
  return self->_mapFeatureIsSchoolFavoriteSet;
}

- (void)setMapFeatureIsSchoolFavoriteSet:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureIsSchoolFavoriteSet = a3;
}

- (void)setHasMapFeatureIsSchoolFavoriteSet:(BOOL)a3
{
  __int16 v3;
  int v4;
  unint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x8000000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = v5 & 0x8000000000000000 | *(_QWORD *)&self->_flags & 0x7FFFFFFFFFFFFFFFLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureIsSchoolFavoriteSet
{
  return *(_QWORD *)&self->_flags >> 63;
}

- (BOOL)mapFeatureIsTransitFavoriteSet
{
  return self->_mapFeatureIsTransitFavoriteSet;
}

- (void)setMapFeatureIsTransitFavoriteSet:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 1;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapFeatureIsTransitFavoriteSet = a3;
}

- (void)setHasMapFeatureIsTransitFavoriteSet:(BOOL)a3
{
  int v3;
  unint64_t v4;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFFFFELL;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4 | a3;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureIsTransitFavoriteSet
{
  return *((_DWORD *)&self->_flags + 2) & 1;
}

- (int)mapFeatureFavoritesCount
{
  return self->_mapFeatureFavoritesCount;
}

- (void)setMapFeatureFavoritesCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureFavoritesCount = a3;
}

- (void)setHasMapFeatureFavoritesCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x10000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFEFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureFavoritesCount
{
  return (*(_QWORD *)&self->_flags >> 16) & 1;
}

- (int)mapFeatureLibrarySavedPlacesCount
{
  return self->_mapFeatureLibrarySavedPlacesCount;
}

- (void)setMapFeatureLibrarySavedPlacesCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureLibrarySavedPlacesCount = a3;
}

- (void)setHasMapFeatureLibrarySavedPlacesCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x100000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFEFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureLibrarySavedPlacesCount
{
  return (*(_QWORD *)&self->_flags >> 20) & 1;
}

- (int)mapFeatureLibraryPlacesWithNoteCount
{
  return self->_mapFeatureLibraryPlacesWithNoteCount;
}

- (void)setMapFeatureLibraryPlacesWithNoteCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureLibraryPlacesWithNoteCount = a3;
}

- (void)setHasMapFeatureLibraryPlacesWithNoteCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x80000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFF7FFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureLibraryPlacesWithNoteCount
{
  return (*(_QWORD *)&self->_flags >> 19) & 1;
}

- (int)mapFeatureLibraryGuidesSavedPlacesCount
{
  return self->_mapFeatureLibraryGuidesSavedPlacesCount;
}

- (void)setMapFeatureLibraryGuidesSavedPlacesCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureLibraryGuidesSavedPlacesCount = a3;
}

- (void)setHasMapFeatureLibraryGuidesSavedPlacesCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x40000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFBFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureLibraryGuidesSavedPlacesCount
{
  return (*(_QWORD *)&self->_flags >> 18) & 1;
}

- (int)mapFeatureLibraryFavoritesGuideSavedPlacesCount
{
  return self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount;
}

- (void)setMapFeatureLibraryFavoritesGuideSavedPlacesCount:(int)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount = a3;
}

- (void)setHasMapFeatureLibraryFavoritesGuideSavedPlacesCount:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x20000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFFFFFFFFFFDFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasMapFeatureLibraryFavoritesGuideSavedPlacesCount
{
  return (*(_QWORD *)&self->_flags >> 17) & 1;
}

- (BOOL)mapSettingsNotificationsEnabled
{
  return self->_mapSettingsNotificationsEnabled;
}

- (void)setMapSettingsNotificationsEnabled:(BOOL)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x4000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  self->_mapSettingsNotificationsEnabled = a3;
}

- (void)setHasMapSettingsNotificationsEnabled:(BOOL)a3
{
  int v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v4 = 0x4000;
  if (!a3)
    v4 = 0;
  v5 = *((_QWORD *)&self->_flags + 1) & 0xFFFFFFFFFFFFBFFFLL | v4;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v5;
  *((_BYTE *)&self->_flags + 18) = (v3 | 0x20000u) >> 16;
}

- (BOOL)hasMapSettingsNotificationsEnabled
{
  return (*((_QWORD *)&self->_flags + 1) >> 14) & 1;
}

- (void)_readSearchResultsState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readSearchResultsState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasSearchResultsState
{
  -[GEOAnalyticsPipelineStateData _readSearchResultsState]((uint64_t)self);
  return self->_searchResultsState != 0;
}

- (GEOLogMsgStateSearchResults)searchResultsState
{
  -[GEOAnalyticsPipelineStateData _readSearchResultsState]((uint64_t)self);
  return self->_searchResultsState;
}

- (void)setSearchResultsState:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20400;
  *((_WORD *)&self->_flags + 8) |= 0x400u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_searchResultsState, a3);
}

- (void)_readImpressionObjectState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x200000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readImpressionObjectState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasImpressionObjectState
{
  -[GEOAnalyticsPipelineStateData _readImpressionObjectState]((uint64_t)self);
  return self->_impressionObjectState != 0;
}

- (GEOLogMsgStateImpressionObject)impressionObjectState
{
  -[GEOAnalyticsPipelineStateData _readImpressionObjectState]((uint64_t)self);
  return self->_impressionObjectState;
}

- (void)setImpressionObjectState:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x200000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_impressionObjectState, a3);
}

- (void)_readTapEventState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readTapEventState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasTapEventState
{
  -[GEOAnalyticsPipelineStateData _readTapEventState]((uint64_t)self);
  return self->_tapEventState != 0;
}

- (GEOLogMsgStateTapEvent)tapEventState
{
  -[GEOAnalyticsPipelineStateData _readTapEventState]((uint64_t)self);
  return self->_tapEventState;
}

- (void)setTapEventState:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x22000;
  *((_WORD *)&self->_flags + 8) |= 0x2000u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_tapEventState, a3);
}

- (void)_readActionButtonDetailsState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x10000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readActionButtonDetailsState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasActionButtonDetailsState
{
  -[GEOAnalyticsPipelineStateData _readActionButtonDetailsState]((uint64_t)self);
  return self->_actionButtonDetailsState != 0;
}

- (GEOLogMsgStateActionButtonDetails)actionButtonDetailsState
{
  -[GEOAnalyticsPipelineStateData _readActionButtonDetailsState]((uint64_t)self);
  return self->_actionButtonDetailsState;
}

- (void)setActionButtonDetailsState:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x10000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_actionButtonDetailsState, a3);
}

- (void)_readPhotoSubmissionDetailsState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x200000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readPhotoSubmissionDetailsState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasPhotoSubmissionDetailsState
{
  -[GEOAnalyticsPipelineStateData _readPhotoSubmissionDetailsState]((uint64_t)self);
  return self->_photoSubmissionDetailsState != 0;
}

- (GEOLogMsgStateARPPhotoSubmission)photoSubmissionDetailsState
{
  -[GEOAnalyticsPipelineStateData _readPhotoSubmissionDetailsState]((uint64_t)self);
  return self->_photoSubmissionDetailsState;
}

- (void)setPhotoSubmissionDetailsState:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x200000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_photoSubmissionDetailsState, a3);
}

- (void)_readRatingSubmissionDetailsState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRatingSubmissionDetailsState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasRatingSubmissionDetailsState
{
  -[GEOAnalyticsPipelineStateData _readRatingSubmissionDetailsState]((uint64_t)self);
  return self->_ratingSubmissionDetailsState != 0;
}

- (GEOLogMsgStateARPRatingSubmission)ratingSubmissionDetailsState
{
  -[GEOAnalyticsPipelineStateData _readRatingSubmissionDetailsState]((uint64_t)self);
  return self->_ratingSubmissionDetailsState;
}

- (void)setRatingSubmissionDetailsState:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20100;
  *((_WORD *)&self->_flags + 8) |= 0x100u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_ratingSubmissionDetailsState, a3);
}

- (void)_readRatingPhotoSubmissionDetailsState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_WORD *)(a1 + 740) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readRatingPhotoSubmissionDetailsState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasRatingPhotoSubmissionDetailsState
{
  -[GEOAnalyticsPipelineStateData _readRatingPhotoSubmissionDetailsState]((uint64_t)self);
  return self->_ratingPhotoSubmissionDetailsState != 0;
}

- (GEOLogMsgStateARPRatingPhotoSubmission)ratingPhotoSubmissionDetailsState
{
  -[GEOAnalyticsPipelineStateData _readRatingPhotoSubmissionDetailsState]((uint64_t)self);
  return self->_ratingPhotoSubmissionDetailsState;
}

- (void)setRatingPhotoSubmissionDetailsState:(id)a3
{
  int v3;

  v3 = *((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20080;
  *((_WORD *)&self->_flags + 8) |= 0x80u;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v3);
  objc_storeStrong((id *)&self->_ratingPhotoSubmissionDetailsState, a3);
}

- (void)_readMapsPlaceIdsState
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 512));
    if ((*(_QWORD *)(a1 + 732) & 0x10000000000000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOAnalyticsPipelineStateDataReadSpecified(a1, *(char **)(a1 + 8), (int *)&_readMapsPlaceIdsState_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 512));
  }
}

- (BOOL)hasMapsPlaceIdsState
{
  -[GEOAnalyticsPipelineStateData _readMapsPlaceIdsState]((uint64_t)self);
  return self->_mapsPlaceIdsState != 0;
}

- (GEOLogMsgStateMapsPlaceIds)mapsPlaceIdsState
{
  -[GEOAnalyticsPipelineStateData _readMapsPlaceIdsState]((uint64_t)self);
  return self->_mapsPlaceIdsState;
}

- (void)setMapsPlaceIdsState:(id)a3
{
  unsigned int v3;
  uint64_t v4;

  v3 = ((*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000u) >> 16;
  v4 = *((_QWORD *)&self->_flags + 1) | 0x10000000000000;
  *((_WORD *)&self->_flags + 8) = *((_WORD *)&self->_flags + 8);
  *((_QWORD *)&self->_flags + 1) = v4;
  *((_BYTE *)&self->_flags + 18) = v3;
  objc_storeStrong((id *)&self->_mapsPlaceIdsState, a3);
}

- (BOOL)isInternalTool
{
  return self->_isInternalTool;
}

- (void)setIsInternalTool:(BOOL)a3
{
  __int16 v3;
  int v4;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = (*((unsigned __int8 *)&self->_flags + 18) << 16) | 0x20000;
  *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = BYTE2(v4);
  self->_isInternalTool = a3;
}

- (void)setHasIsInternalTool:(BOOL)a3
{
  __int16 v3;
  int v4;
  uint64_t v5;

  v3 = *((_WORD *)&self->_flags + 8);
  v4 = *((unsigned __int8 *)&self->_flags + 18) << 16;
  v5 = 0x20000000000000;
  if (!a3)
    v5 = 0;
  *(_QWORD *)&self->_flags = *(_QWORD *)&self->_flags & 0xFFDFFFFFFFFFFFFFLL | v5;
  *((_WORD *)&self->_flags + 8) = v3;
  *((_BYTE *)&self->_flags + 18) = (v4 | 0x20000u) >> 16;
}

- (BOOL)hasIsInternalTool
{
  return (*(_QWORD *)&self->_flags >> 53) & 1;
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
  v8.super_class = (Class)GEOAnalyticsPipelineStateData;
  -[GEOAnalyticsPipelineStateData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOAnalyticsPipelineStateData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOAnalyticsPipelineStateData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  id v13;
  int *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  uint64_t v52;
  __CFString *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  const __CFString *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  void *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  id v75;
  void *v76;
  const __CFString *v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  uint64_t v82;
  uint64_t v83;
  __CFString *v84;
  const __CFString *v85;
  void *v86;
  const __CFString *v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  const __CFString *v91;
  uint64_t v92;
  __CFString *v93;
  const __CFString *v94;
  uint64_t v95;
  __CFString *v96;
  const __CFString *v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  const __CFString *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  const __CFString *v105;
  void *v106;
  const __CFString *v107;
  void *v108;
  const __CFString *v109;
  void *v110;
  const __CFString *v111;
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
  const __CFString *v123;
  uint64_t v124;
  __CFString *v125;
  const __CFString *v126;
  uint64_t v127;
  __CFString *v128;
  const __CFString *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  const __CFString *v135;
  uint64_t v136;
  __CFString *v137;
  const __CFString *v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  const __CFString *v142;
  uint64_t v143;
  __CFString *v144;
  const __CFString *v145;
  void *v146;
  const __CFString *v147;
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
  const __CFString *v158;
  void *v159;
  const __CFString *v160;
  void *v161;
  const __CFString *v162;
  uint64_t v163;
  void *v164;
  const __CFString *v165;
  void *v166;
  const __CFString *v167;
  void *v168;
  const __CFString *v169;
  void *v170;
  const __CFString *v171;
  void *v172;
  const __CFString *v173;
  void *v174;
  const __CFString *v175;
  uint64_t v176;
  void *v177;
  const __CFString *v178;
  void *v179;
  const __CFString *v180;
  void *v181;
  const __CFString *v182;
  void *v183;
  const __CFString *v184;
  uint64_t v185;
  __CFString *v186;
  void *v187;
  const __CFString *v188;
  void *v189;
  const __CFString *v190;
  void *v191;
  const __CFString *v192;
  const __CFString *v193;
  void *v194;
  const __CFString *v195;
  void *v196;
  const __CFString *v197;
  void *v198;
  const __CFString *v199;
  unint64_t v200;
  void *v201;
  id v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t i;
  void *v207;
  id v208;
  const __CFString *v209;
  uint64_t v210;
  void *v211;
  const __CFString *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  const __CFString *v217;
  void *v218;
  const __CFString *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t j;
  void *v228;
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
  uint64_t v244;
  void *v245;
  const __CFString *v246;
  void *v247;
  const __CFString *v248;
  void *v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t k;
  void *v255;
  id v256;
  const __CFString *v257;
  uint64_t v258;
  void *v259;
  const __CFString *v260;
  uint64_t v261;
  __CFString *v262;
  void *v263;
  uint64_t v264;
  __CFString *v265;
  const __CFString *v266;
  const __CFString *v267;
  uint64_t v268;
  __CFString *v269;
  const __CFString *v270;
  int v271;
  __CFString *v272;
  const __CFString *v273;
  void *v274;
  const __CFString *v275;
  void *v276;
  const __CFString *v277;
  void *v278;
  const __CFString *v279;
  void *v280;
  const __CFString *v281;
  void *v282;
  const __CFString *v283;
  uint64_t v284;
  __CFString *v285;
  const __CFString *v286;
  void *v287;
  void *v288;
  void *v289;
  const __CFString *v290;
  id v291;
  uint64_t *v292;
  uint64_t v293;
  void *v294;
  const __CFString *v295;
  uint64_t v296;
  void *v297;
  const __CFString *v298;
  void *v299;
  void *v300;
  void *v301;
  const __CFString *v302;
  void *v303;
  const __CFString *v304;
  void *v305;
  const __CFString *v306;
  uint64_t v307;
  __CFString *v308;
  id v309;
  void *v310;
  const __CFString *v311;
  void *v312;
  const __CFString *v313;
  void *v314;
  const __CFString *v315;
  uint64_t v316;
  uint64_t v317;
  __CFString *v318;
  const __CFString *v319;
  const __CFString *v320;
  uint64_t v321;
  __CFString *v322;
  const __CFString *v323;
  uint64_t v324;
  __CFString *v325;
  const __CFString *v326;
  void *v327;
  void *v328;
  id v329;
  uint64_t *v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const __CFString *v334;
  void *v335;
  const __CFString *v336;
  void *v337;
  const __CFString *v338;
  void *v339;
  void *v340;
  void *v341;
  const __CFString *v342;
  void *v343;
  const __CFString *v344;
  void *v345;
  const __CFString *v346;
  void *v347;
  const __CFString *v348;
  void *v349;
  const __CFString *v350;
  void *v351;
  const __CFString *v352;
  void *v353;
  const __CFString *v354;
  void *v355;
  const __CFString *v356;
  void *v357;
  const __CFString *v358;
  void *v359;
  const __CFString *v360;
  void *v361;
  const __CFString *v362;
  void *v363;
  const __CFString *v364;
  void *v365;
  const __CFString *v366;
  void *v367;
  const __CFString *v368;
  void *v369;
  const __CFString *v370;
  id v371;
  void *v372;
  void *v373;
  void *v374;
  const __CFString *v375;
  id v376;
  void *v377;
  void *v378;
  void *v379;
  const __CFString *v380;
  id v381;
  void *v382;
  void *v383;
  void *v384;
  const __CFString *v385;
  id v386;
  void *v387;
  void *v388;
  void *v389;
  const __CFString *v390;
  id v391;
  void *v392;
  void *v393;
  void *v394;
  const __CFString *v395;
  id v396;
  void *v397;
  void *v398;
  void *v399;
  const __CFString *v400;
  id v401;
  void *v402;
  void *v403;
  void *v404;
  const __CFString *v405;
  id v406;
  void *v407;
  const __CFString *v408;
  id v409;
  __int128 v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  _BYTE v423[128];
  _BYTE v424[128];
  _BYTE v425[128];
  uint64_t v426;

  v426 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "deviceInputLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (a2)
      v6 = CFSTR("deviceInputLocale");
    else
      v6 = CFSTR("device_input_locale");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);
  }

  objc_msgSend((id)a1, "deviceOutputLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a2)
      v8 = CFSTR("deviceOutputLocale");
    else
      v8 = CFSTR("device_output_locale");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  objc_msgSend((id)a1, "carPlayInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v9, "jsonRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("carPlayInfo");
    }
    else
    {
      objc_msgSend(v9, "dictionaryRepresentation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = CFSTR("car_play_info");
    }
    v13 = v11;

    objc_msgSend(v4, "setObject:forKey:", v13, v12);
  }

  v14 = &OBJC_IVAR___GEOTileCoordinate__x;
  v15 = (uint64_t *)(a1 + 724);
  v16 = *(_QWORD *)(a1 + 732);
  if ((v16 & 0x100000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 716));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("rideBookingAppInstalled");
    else
      v18 = CFSTR("ride_booking_app_installed");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v15 = (uint64_t *)(a1 + 724);
    v16 = *(_QWORD *)(a1 + 732);
  }
  v19 = *v15;
  if ((v16 & 0x80000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 715));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v27 = CFSTR("rideBookingAppEnabled");
    else
      v27 = CFSTR("ride_booking_app_enabled");
    objc_msgSend(v4, "setObject:forKey:", v26, v27);

    v19 = *(_QWORD *)(a1 + 724);
    v16 = *(_QWORD *)(a1 + 732);
    if ((v16 & 0x800000000) == 0)
    {
LABEL_24:
      if ((v16 & 0x400000000) == 0)
        goto LABEL_25;
      goto LABEL_41;
    }
  }
  else if ((v16 & 0x800000000) == 0)
  {
    goto LABEL_24;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 719));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v29 = CFSTR("tableBookingAppInstalled");
  else
    v29 = CFSTR("table_booking_app_installed");
  objc_msgSend(v4, "setObject:forKey:", v28, v29);

  v19 = *(_QWORD *)(a1 + 724);
  if ((*(_QWORD *)(a1 + 732) & 0x400000000) == 0)
  {
LABEL_25:
    if ((v19 & 0x40) == 0)
      goto LABEL_30;
    goto LABEL_26;
  }
LABEL_41:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 718));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v31 = CFSTR("tableBookingAppEnabled");
  else
    v31 = CFSTR("table_booking_app_enabled");
  objc_msgSend(v4, "setObject:forKey:", v30, v31);

  if ((*(_QWORD *)(a1 + 724) & 0x40) != 0)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 216));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("mapViewZoomLevel");
    else
      v21 = CFSTR("map_view_zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
LABEL_30:
  objc_msgSend((id)a1, "mapViewMapRegion");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v22, "jsonRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("mapViewMapRegion");
    }
    else
    {
      objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = CFSTR("map_view_map_region");
    }
    v32 = v24;

    objc_msgSend(v4, "setObject:forKey:", v32, v25);
  }

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 0x8000000000) == 0)
  {
    v34 = *(_QWORD *)(a1 + 732);
    if ((v33 & 0x20) == 0)
      goto LABEL_62;
    goto LABEL_58;
  }
  v35 = *(int *)(a1 + 620);
  if (v35 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 620));
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = off_1E1C1FEE8[v35];
  }
  if (a2)
    v37 = CFSTR("mapViewMapType");
  else
    v37 = CFSTR("map_view_map_type");
  objc_msgSend(v4, "setObject:forKey:", v36, v37);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x20) != 0)
  {
LABEL_58:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 208));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("mapViewStyleZoomLevel");
    else
      v39 = CFSTR("map_view_style_zoom_level");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

    v33 = *(_QWORD *)(a1 + 724);
    v34 = *(_QWORD *)(a1 + 732);
  }
LABEL_62:
  if ((v33 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 200));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v47 = CFSTR("mapViewPitch");
    else
      v47 = CFSTR("map_view_pitch");
    objc_msgSend(v4, "setObject:forKey:", v46, v47);

    v33 = *(_QWORD *)(a1 + 724);
    v34 = *(_QWORD *)(a1 + 732);
    if ((v34 & 0x800000) == 0)
    {
LABEL_64:
      if ((v34 & 0x1000000) == 0)
        goto LABEL_65;
      goto LABEL_115;
    }
  }
  else if ((v34 & 0x800000) == 0)
  {
    goto LABEL_64;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 707));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v49 = CFSTR("mapViewIsAdvancedMap");
  else
    v49 = CFSTR("map_view_is_advanced_map");
  objc_msgSend(v4, "setObject:forKey:", v48, v49);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x1000000) == 0)
  {
LABEL_65:
    if ((v33 & 0x10000000000) == 0)
      goto LABEL_66;
    goto LABEL_119;
  }
LABEL_115:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 708));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v51 = CFSTR("mapViewIsGlobeProjection");
  else
    v51 = CFSTR("map_view_is_globe_projection");
  objc_msgSend(v4, "setObject:forKey:", v50, v51);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x10000000000) == 0)
  {
LABEL_66:
    if ((v34 & 0x2000000) == 0)
      goto LABEL_67;
    goto LABEL_189;
  }
LABEL_119:
  v52 = *(int *)(a1 + 624);
  if (v52 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 624));
    v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v53 = off_1E1C1FF10[v52];
  }
  if (a2)
    v85 = CFSTR("mapViewViewMode");
  else
    v85 = CFSTR("map_view_view_mode");
  objc_msgSend(v4, "setObject:forKey:", v53, v85);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x2000000) == 0)
  {
LABEL_67:
    if ((v33 & 8) == 0)
      goto LABEL_68;
    goto LABEL_193;
  }
LABEL_189:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 709));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v87 = CFSTR("mapViewLocationIsTourist");
  else
    v87 = CFSTR("map_view_location_is_tourist");
  objc_msgSend(v4, "setObject:forKey:", v86, v87);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 8) == 0)
  {
LABEL_68:
    if ((v34 & 0x4000000) == 0)
      goto LABEL_69;
    goto LABEL_197;
  }
LABEL_193:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 184));
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v89 = CFSTR("mapViewLocationTouristTimestamp");
  else
    v89 = CFSTR("map_view_location_tourist_timestamp");
  objc_msgSend(v4, "setObject:forKey:", v88, v89);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x4000000) == 0)
  {
LABEL_69:
    if ((v33 & 0x40000000) == 0)
      goto LABEL_70;
    goto LABEL_201;
  }
LABEL_197:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 710));
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v91 = CFSTR("mapViewLocationPuckInViewport");
  else
    v91 = CFSTR("map_view_location_puck_in_viewport");
  objc_msgSend(v4, "setObject:forKey:", v90, v91);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x40000000) == 0)
  {
LABEL_70:
    if ((v33 & 0x80000000) == 0)
      goto LABEL_71;
    goto LABEL_208;
  }
LABEL_201:
  v92 = *(int *)(a1 + 584);
  if (v92 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 584));
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v93 = off_1E1C1FF58[v92];
  }
  if (a2)
    v94 = CFSTR("mapSettingsNavVolume");
  else
    v94 = CFSTR("map_settings_nav_volume");
  objc_msgSend(v4, "setObject:forKey:", v93, v94);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x80000000) == 0)
  {
LABEL_71:
    if ((v34 & 0x10) == 0)
      goto LABEL_72;
    goto LABEL_215;
  }
LABEL_208:
  v95 = *(int *)(a1 + 588);
  if (v95 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 588));
    v96 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v96 = off_1E1C1FFA0[v95];
  }
  if (a2)
    v97 = CFSTR("mapSettingsTransportMode");
  else
    v97 = CFSTR("map_settings_transport_mode");
  objc_msgSend(v4, "setObject:forKey:", v96, v97);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x10) == 0)
  {
LABEL_72:
    if ((v34 & 0x80) == 0)
      goto LABEL_73;
    goto LABEL_219;
  }
LABEL_215:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 688));
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v99 = CFSTR("mapSettingsAvoidHighways");
  else
    v99 = CFSTR("map_settings_avoid_highways");
  objc_msgSend(v4, "setObject:forKey:", v98, v99);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x80) == 0)
  {
LABEL_73:
    if ((v34 & 0x400) == 0)
      goto LABEL_74;
    goto LABEL_223;
  }
LABEL_219:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 691));
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v101 = CFSTR("mapSettingsAvoidTolls");
  else
    v101 = CFSTR("map_settings_avoid_tolls");
  objc_msgSend(v4, "setObject:forKey:", v100, v101);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x400) == 0)
  {
LABEL_74:
    if ((v34 & 0x800) == 0)
      goto LABEL_75;
    goto LABEL_227;
  }
LABEL_223:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 694));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v103 = CFSTR("mapSettingsFindMyCarEnabled");
  else
    v103 = CFSTR("map_settings_find_my_car_enabled");
  objc_msgSend(v4, "setObject:forKey:", v102, v103);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x800) == 0)
  {
LABEL_75:
    if ((v34 & 0x2000) == 0)
      goto LABEL_76;
    goto LABEL_231;
  }
LABEL_227:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 695));
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v105 = CFSTR("mapSettingsHeadingEnabled");
  else
    v105 = CFSTR("map_settings_heading_enabled");
  objc_msgSend(v4, "setObject:forKey:", v104, v105);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x2000) == 0)
  {
LABEL_76:
    if ((v34 & 0x8000) == 0)
      goto LABEL_77;
    goto LABEL_235;
  }
LABEL_231:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 697));
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v107 = CFSTR("mapSettingsLabelEnabled");
  else
    v107 = CFSTR("map_settings_label_enabled");
  objc_msgSend(v4, "setObject:forKey:", v106, v107);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x8000) == 0)
  {
LABEL_77:
    if ((v34 & 0x10000) == 0)
      goto LABEL_78;
    goto LABEL_239;
  }
LABEL_235:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 699));
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v109 = CFSTR("mapSettingsPauseSpokenAudioEnabled");
  else
    v109 = CFSTR("map_settings_pause_spoken_audio_enabled");
  objc_msgSend(v4, "setObject:forKey:", v108, v109);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x10000) == 0)
  {
LABEL_78:
    if ((v34 & 0x20000) == 0)
      goto LABEL_79;
    goto LABEL_243;
  }
LABEL_239:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 700));
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v111 = CFSTR("mapSettingsSpeedLimitEnabled");
  else
    v111 = CFSTR("map_settings_speed_limit_enabled");
  objc_msgSend(v4, "setObject:forKey:", v110, v111);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x20000) == 0)
  {
LABEL_79:
    if ((v34 & 0x1000) == 0)
      goto LABEL_80;
    goto LABEL_247;
  }
LABEL_243:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 701));
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v113 = CFSTR("mapSettingsTrafficEnabled");
  else
    v113 = CFSTR("map_settings_traffic_enabled");
  objc_msgSend(v4, "setObject:forKey:", v112, v113);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x1000) == 0)
  {
LABEL_80:
    if ((v34 & 0x80000) == 0)
      goto LABEL_81;
    goto LABEL_251;
  }
LABEL_247:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 696));
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v115 = CFSTR("mapSettingsIsHandsFreeProfileEnabled");
  else
    v115 = CFSTR("map_settings_is_hands_free_profile_enabled");
  objc_msgSend(v4, "setObject:forKey:", v114, v115);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x80000) == 0)
  {
LABEL_81:
    if ((v34 & 0x40000) == 0)
      goto LABEL_82;
    goto LABEL_255;
  }
LABEL_251:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 703));
  v116 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v117 = CFSTR("mapSettingsWalkingAvoidHills");
  else
    v117 = CFSTR("map_settings_walking_avoid_hills");
  objc_msgSend(v4, "setObject:forKey:", v116, v117);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x40000) == 0)
  {
LABEL_82:
    if ((v34 & 0x100000) == 0)
      goto LABEL_83;
    goto LABEL_259;
  }
LABEL_255:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 702));
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v119 = CFSTR("mapSettingsWalkingAvoidBusyRoads");
  else
    v119 = CFSTR("map_settings_walking_avoid_busy_roads");
  objc_msgSend(v4, "setObject:forKey:", v118, v119);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x100000) == 0)
  {
LABEL_83:
    if ((v34 & 0x100) == 0)
      goto LABEL_84;
    goto LABEL_263;
  }
LABEL_259:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 704));
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v121 = CFSTR("mapSettingsWalkingAvoidStairs");
  else
    v121 = CFSTR("map_settings_walking_avoid_stairs");
  objc_msgSend(v4, "setObject:forKey:", v120, v121);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x100) == 0)
  {
LABEL_84:
    if ((v33 & 0x400000000) == 0)
      goto LABEL_85;
    goto LABEL_267;
  }
LABEL_263:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 692));
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v123 = CFSTR("mapSettingsDirectionsWakeDevice");
  else
    v123 = CFSTR("map_settings_directions_wake_device");
  objc_msgSend(v4, "setObject:forKey:", v122, v123);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x400000000) == 0)
  {
LABEL_85:
    if ((v33 & 0x800000000) == 0)
      goto LABEL_86;
    goto LABEL_274;
  }
LABEL_267:
  v124 = *(int *)(a1 + 600);
  if (v124 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 600));
    v125 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v125 = off_1E1C200B8[v124];
  }
  if (a2)
    v126 = CFSTR("mapUiLayoutInfo");
  else
    v126 = CFSTR("map_ui_layout_info");
  objc_msgSend(v4, "setObject:forKey:", v125, v126);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x800000000) == 0)
  {
LABEL_86:
    if ((v33 & 0x2000000000) == 0)
      goto LABEL_87;
    goto LABEL_281;
  }
LABEL_274:
  v127 = *(int *)(a1 + 604);
  if (v127 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 604));
    v128 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v128 = off_1E1C200D8[v127];
  }
  if (a2)
    v129 = CFSTR("mapUiLayoutStyle");
  else
    v129 = CFSTR("map_ui_layout_style");
  objc_msgSend(v4, "setObject:forKey:", v128, v129);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x2000000000) == 0)
  {
LABEL_87:
    if ((v33 & 0x200000000) == 0)
      goto LABEL_88;
    goto LABEL_285;
  }
LABEL_281:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 612));
  v130 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v131 = CFSTR("mapUiNumberOfTabsOpen");
  else
    v131 = CFSTR("map_ui_number_of_tabs_open");
  objc_msgSend(v4, "setObject:forKey:", v130, v131);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x200000000) == 0)
  {
LABEL_88:
    if ((v33 & 0x1000000000) == 0)
      goto LABEL_89;
    goto LABEL_289;
  }
LABEL_285:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 596));
  v132 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v133 = CFSTR("mapUiCurrentTabIndex");
  else
    v133 = CFSTR("map_ui_current_tab_index");
  objc_msgSend(v4, "setObject:forKey:", v132, v133);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x1000000000) == 0)
  {
LABEL_89:
    if ((v33 & 0x8000000000000) == 0)
      goto LABEL_90;
    goto LABEL_293;
  }
LABEL_289:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 608));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v135 = CFSTR("mapUiNumberOfMapsWindows");
  else
    v135 = CFSTR("map_ui_number_of_maps_windows");
  objc_msgSend(v4, "setObject:forKey:", v134, v135);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v33 & 0x8000000000000) == 0)
  {
LABEL_90:
    if ((v34 & 0x200000) == 0)
      goto LABEL_91;
    goto LABEL_300;
  }
LABEL_293:
  v136 = *(int *)(a1 + 668);
  if (v136 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 668));
    v137 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v137 = off_1E1C1FF80[v136];
  }
  if (a2)
    v138 = CFSTR("windowSize");
  else
    v138 = CFSTR("window_size");
  objc_msgSend(v4, "setObject:forKey:", v137, v138);

  v33 = *(_QWORD *)(a1 + 724);
  v34 = *(_QWORD *)(a1 + 732);
  if ((v34 & 0x200000) == 0)
  {
LABEL_91:
    if ((v34 & 0x400000) == 0)
      goto LABEL_92;
    goto LABEL_304;
  }
LABEL_300:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 705));
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v140 = CFSTR("mapUiShownAqiShown");
  else
    v140 = CFSTR("map_ui_shown_aqi_shown");
  objc_msgSend(v4, "setObject:forKey:", v139, v140);

  v33 = *(_QWORD *)(a1 + 724);
  if ((*(_QWORD *)(a1 + 732) & 0x400000) == 0)
  {
LABEL_92:
    if ((v33 & 0x4000000000) == 0)
      goto LABEL_93;
    goto LABEL_308;
  }
LABEL_304:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 706));
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v142 = CFSTR("mapUiShownWeatherShown");
  else
    v142 = CFSTR("map_ui_shown_weather_shown");
  objc_msgSend(v4, "setObject:forKey:", v141, v142);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 0x4000000000) == 0)
  {
LABEL_93:
    if ((v33 & 4) == 0)
      goto LABEL_94;
    goto LABEL_315;
  }
LABEL_308:
  v143 = *(int *)(a1 + 616);
  if (v143 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 616));
    v144 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v144 = off_1E1C1FFA0[v143];
  }
  if (a2)
    v145 = CFSTR("mapUiShownActiveNavMode");
  else
    v145 = CFSTR("map_ui_shown_active_nav_mode");
  objc_msgSend(v4, "setObject:forKey:", v144, v145);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 4) == 0)
  {
LABEL_94:
    if ((v33 & 2) == 0)
      goto LABEL_95;
    goto LABEL_319;
  }
LABEL_315:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 144));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v147 = CFSTR("lookaroundSessionStartTime");
  else
    v147 = CFSTR("lookaround_session_start_time");
  objc_msgSend(v4, "setObject:forKey:", v146, v147);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 2) == 0)
  {
LABEL_95:
    if ((v33 & 0x400000000000000) == 0)
      goto LABEL_96;
    goto LABEL_323;
  }
LABEL_319:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 136));
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v149 = CFSTR("lookaroundSessionEndTime");
  else
    v149 = CFSTR("lookaround_session_end_time");
  objc_msgSend(v4, "setObject:forKey:", v148, v149);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 0x400000000000000) == 0)
  {
LABEL_96:
    if ((v33 & 0x2000000000000000) == 0)
      goto LABEL_97;
    goto LABEL_327;
  }
LABEL_323:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 678));
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v151 = CFSTR("lookaroundSessionHadPanAction");
  else
    v151 = CFSTR("lookaround_session_had_pan_action");
  objc_msgSend(v4, "setObject:forKey:", v150, v151);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 0x2000000000000000) == 0)
  {
LABEL_97:
    if ((v33 & 0x200000000000000) == 0)
      goto LABEL_98;
    goto LABEL_331;
  }
LABEL_327:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 681));
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v153 = CFSTR("lookaroundSessionHadZoomAction");
  else
    v153 = CFSTR("lookaround_session_had_zoom_action");
  objc_msgSend(v4, "setObject:forKey:", v152, v153);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 0x200000000000000) == 0)
  {
LABEL_98:
    if ((v33 & 0x1000000000000000) == 0)
      goto LABEL_99;
    goto LABEL_335;
  }
LABEL_331:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 677));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v155 = CFSTR("lookaroundSessionHadMoveAction");
  else
    v155 = CFSTR("lookaround_session_had_move_action");
  objc_msgSend(v4, "setObject:forKey:", v154, v155);

  v33 = *(_QWORD *)(a1 + 724);
  if ((v33 & 0x1000000000000000) == 0)
  {
LABEL_99:
    if ((v33 & 0x800000000000000) == 0)
      goto LABEL_104;
    goto LABEL_100;
  }
LABEL_335:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 680));
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v157 = CFSTR("lookaroundSessionHadTapPoiAction");
  else
    v157 = CFSTR("lookaround_session_had_tap_poi_action");
  objc_msgSend(v4, "setObject:forKey:", v156, v157);

  if ((*(_QWORD *)(a1 + 724) & 0x800000000000000) != 0)
  {
LABEL_100:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 679));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("lookaroundSessionHadShareAction");
    else
      v41 = CFSTR("lookaround_session_had_share_action");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

  }
LABEL_104:
  objc_msgSend((id)a1, "lookAroundLocation");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v42;
  if (v42)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v42, "jsonRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("lookAroundLocation");
    }
    else
    {
      objc_msgSend(v42, "dictionaryRepresentation");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = CFSTR("look_around_location");
    }
    v54 = v44;

    objc_msgSend(v4, "setObject:forKey:", v54, v45);
  }

  v55 = *(_QWORD *)(a1 + 724);
  if ((v55 & 0x2000) == 0)
  {
    v56 = *(_QWORD *)(a1 + 732);
    if ((v55 & 1) == 0)
      goto LABEL_134;
    goto LABEL_130;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 516));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v58 = CFSTR("lookAroundHeading");
  else
    v58 = CFSTR("look_around_heading");
  objc_msgSend(v4, "setObject:forKey:", v57, v58);

  v55 = *(_QWORD *)(a1 + 724);
  v56 = *(_QWORD *)(a1 + 732);
  if ((v55 & 1) != 0)
  {
LABEL_130:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 128));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v60 = CFSTR("lookAroundZoom");
    else
      v60 = CFSTR("look_around_zoom");
    objc_msgSend(v4, "setObject:forKey:", v59, v60);

    v55 = *(_QWORD *)(a1 + 724);
    v56 = *(_QWORD *)(a1 + 732);
  }
LABEL_134:
  if ((v55 & 0x4000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 520));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v68 = CFSTR("lookAroundNumberPoisInView");
    else
      v68 = CFSTR("look_around_number_pois_in_view");
    objc_msgSend(v4, "setObject:forKey:", v67, v68);

    v55 = *(_QWORD *)(a1 + 724);
    v56 = *(_QWORD *)(a1 + 732);
    if ((v55 & 0x100000000000000) == 0)
    {
LABEL_136:
      if ((v55 & 0x80000000000000) == 0)
        goto LABEL_137;
      goto LABEL_154;
    }
  }
  else if ((v55 & 0x100000000000000) == 0)
  {
    goto LABEL_136;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 676));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v70 = CFSTR("lookAroundIsLabelingShown");
  else
    v70 = CFSTR("look_around_is_labeling_shown");
  objc_msgSend(v4, "setObject:forKey:", v69, v70);

  v55 = *(_QWORD *)(a1 + 724);
  v56 = *(_QWORD *)(a1 + 732);
  if ((v55 & 0x80000000000000) == 0)
  {
LABEL_137:
    if ((v55 & 0x10000000000000) == 0)
      goto LABEL_138;
    goto LABEL_158;
  }
LABEL_154:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 675));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v72 = CFSTR("lookAroundEntryIconShown");
  else
    v72 = CFSTR("look_around_entry_icon_shown");
  objc_msgSend(v4, "setObject:forKey:", v71, v72);

  v56 = *(_QWORD *)(a1 + 732);
  if ((*(_QWORD *)(a1 + 724) & 0x10000000000000) == 0)
  {
LABEL_138:
    if ((v56 & 0x1000000000) == 0)
      goto LABEL_143;
    goto LABEL_139;
  }
LABEL_158:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 672));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v74 = CFSTR("deviceInDarkMode");
  else
    v74 = CFSTR("device_in_dark_mode");
  objc_msgSend(v4, "setObject:forKey:", v73, v74);

  if ((*(_QWORD *)(a1 + 732) & 0x1000000000) != 0)
  {
LABEL_139:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 720));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v62 = CFSTR("venueExperienceShown");
    else
      v62 = CFSTR("venue_experience_shown");
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

  }
LABEL_143:
  objc_msgSend((id)a1, "placeCardState");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v63;
  if (v63)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v63, "jsonRepresentation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("placeCardState");
    }
    else
    {
      objc_msgSend(v63, "dictionaryRepresentation");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = CFSTR("place_card_state");
    }
    v75 = v65;

    objc_msgSend(v4, "setObject:forKey:", v75, v66);
  }

  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedInt32NSArray();
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v77 = CFSTR("placeCardPossibleActions");
    else
      v77 = CFSTR("place_card_possible_actions");
    objc_msgSend(v4, "setObject:forKey:", v76, v77);

  }
  if (*(_QWORD *)(a1 + 48))
  {
    PBRepeatedInt32NSArray();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v79 = CFSTR("placeCardUnactionableUiElements");
    else
      v79 = CFSTR("place_card_unactionable_ui_elements");
    objc_msgSend(v4, "setObject:forKey:", v78, v79);

  }
  objc_msgSend((id)a1, "placeCardPlaceCardCategory");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  if (v80)
  {
    if (a2)
      v81 = CFSTR("placeCardPlaceCardCategory");
    else
      v81 = CFSTR("place_card_place_card_category");
    objc_msgSend(v4, "setObject:forKey:", v80, v81);
  }

  v82 = a1 + 724;
  if ((*(_QWORD *)(a1 + 724) & 0x100000000000) != 0)
  {
    v83 = *(int *)(a1 + 640);
    if (v83 < 0x12 && ((0x2FFFFu >> v83) & 1) != 0)
    {
      v84 = off_1E1C1FFD0[v83];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 640));
      v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    if (a2)
      v158 = CFSTR("placeCardPlaceCardType");
    else
      v158 = CFSTR("place_card_place_card_type");
    objc_msgSend(v4, "setObject:forKey:", v84, v158);

    v82 = a1 + 724;
  }
  if ((*(_QWORD *)(v82 + 8) & 0x40000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 714));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v160 = CFSTR("placeCardTransitAdvisoryBanner");
    else
      v160 = CFSTR("place_card_transit_advisory_banner");
    objc_msgSend(v4, "setObject:forKey:", v159, v160);

  }
  objc_msgSend((id)a1, "placeCardPlaceActionDetailsActionUrl");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  if (v161)
  {
    if (a2)
      v162 = CFSTR("placeCardPlaceActionDetailsActionUrl");
    else
      v162 = CFSTR("place_card_place_action_details_action_url");
    objc_msgSend(v4, "setObject:forKey:", v161, v162);
  }

  v163 = *(_QWORD *)(a1 + 724);
  if ((v163 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 280));
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v165 = CFSTR("placeCardPlaceActionDetailsAnimationId");
    else
      v165 = CFSTR("place_card_place_action_details_animation_id");
    objc_msgSend(v4, "setObject:forKey:", v164, v165);

    v163 = *(_QWORD *)(a1 + 724);
  }
  if ((v163 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 288));
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v167 = CFSTR("placeCardPlaceActionDetailsBusinessId");
    else
      v167 = CFSTR("place_card_place_action_details_business_id");
    objc_msgSend(v4, "setObject:forKey:", v166, v167);

  }
  objc_msgSend((id)a1, "placeCardPlaceActionDetailsDestinationApp");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  if (v168)
  {
    if (a2)
      v169 = CFSTR("placeCardPlaceActionDetailsDestinationApp");
    else
      v169 = CFSTR("place_card_place_action_details_destination_app");
    objc_msgSend(v4, "setObject:forKey:", v168, v169);
  }

  objc_msgSend((id)a1, "placeCardPlaceActionDetailsPhotoId");
  v170 = (void *)objc_claimAutoreleasedReturnValue();
  if (v170)
  {
    if (a2)
      v171 = CFSTR("placeCardPlaceActionDetailsPhotoId");
    else
      v171 = CFSTR("place_card_place_action_details_photo_id");
    objc_msgSend(v4, "setObject:forKey:", v170, v171);
  }

  if ((*(_QWORD *)(a1 + 724) & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)(a1 + 312));
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v173 = CFSTR("placeCardPlaceActionDetailsPlaceId");
    else
      v173 = CFSTR("place_card_place_action_details_place_id");
    objc_msgSend(v4, "setObject:forKey:", v172, v173);

  }
  objc_msgSend((id)a1, "placeCardPlaceActionDetailsRichProviderId");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  if (v174)
  {
    if (a2)
      v175 = CFSTR("placeCardPlaceActionDetailsRichProviderId");
    else
      v175 = CFSTR("place_card_place_action_details_rich_provider_id");
    objc_msgSend(v4, "setObject:forKey:", v174, v175);
  }

  v176 = *(_QWORD *)(a1 + 724);
  if ((v176 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 328));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v188 = CFSTR("placeCardPlaceActionDetailsSearchResponseRelativeTimestamp");
    else
      v188 = CFSTR("place_card_place_action_details_search_response_relative_timestamp");
    objc_msgSend(v4, "setObject:forKey:", v187, v188);

    v176 = *(_QWORD *)(a1 + 724);
    if ((v176 & 0x800) == 0)
    {
LABEL_387:
      if ((v176 & 0x20000000000) == 0)
        goto LABEL_388;
      goto LABEL_419;
    }
  }
  else if ((v176 & 0x800) == 0)
  {
    goto LABEL_387;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 344));
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v190 = CFSTR("placeCardPlaceActionDetailsTargetId");
  else
    v190 = CFSTR("place_card_place_action_details_target_id");
  objc_msgSend(v4, "setObject:forKey:", v189, v190);

  v176 = *(_QWORD *)(a1 + 724);
  if ((v176 & 0x20000000000) == 0)
  {
LABEL_388:
    if ((v176 & 0x40000000000) == 0)
      goto LABEL_393;
    goto LABEL_389;
  }
LABEL_419:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 628));
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v192 = CFSTR("placeCardPlaceActionDetailsLocalSearchProviderId");
  else
    v192 = CFSTR("place_card_place_action_details_local_search_provider_id");
  objc_msgSend(v4, "setObject:forKey:", v191, v192);

  if ((*(_QWORD *)(a1 + 724) & 0x40000000000) != 0)
  {
LABEL_389:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 632));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v178 = CFSTR("placeCardPlaceActionDetailsResultIndex");
    else
      v178 = CFSTR("place_card_place_action_details_result_index");
    objc_msgSend(v4, "setObject:forKey:", v177, v178);

  }
LABEL_393:
  objc_msgSend((id)a1, "placeCardPlaceActionDetailsShowcaseId");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  if (v179)
  {
    if (a2)
      v180 = CFSTR("placeCardPlaceActionDetailsShowcaseId");
    else
      v180 = CFSTR("place_card_place_action_details_showcase_id");
    objc_msgSend(v4, "setObject:forKey:", v179, v180);
  }

  objc_msgSend((id)a1, "placeCardPlaceActionDetailsTransitPlaceCardIncidentType");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  if (v181)
  {
    if (a2)
      v182 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardIncidentType");
    else
      v182 = CFSTR("place_card_place_action_details_transit_place_card_incident_type");
    objc_msgSend(v4, "setObject:forKey:", v181, v182);
  }

  objc_msgSend((id)a1, "placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  if (v183)
  {
    if (a2)
      v184 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName");
    else
      v184 = CFSTR("place_card_place_action_details_transit_place_card_transit_system_name");
    objc_msgSend(v4, "setObject:forKey:", v183, v184);
  }

  if ((*(_QWORD *)(a1 + 724) & 0x80000000000) != 0)
  {
    v185 = *(int *)(a1 + 636);
    if (v185 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 636));
      v186 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v186 = off_1E1C20060[v185];
    }
    if (a2)
      v193 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitCategory");
    else
      v193 = CFSTR("place_card_place_action_details_transit_place_card_transit_category");
    objc_msgSend(v4, "setObject:forKey:", v186, v193);

  }
  objc_msgSend((id)a1, "placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  if (v194)
  {
    if (a2)
      v195 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection");
    else
      v195 = CFSTR("place_card_place_action_details_transit_place_card_transit_departure_sequence_usage_direction");
    objc_msgSend(v4, "setObject:forKey:", v194, v195);
  }

  objc_msgSend((id)a1, "placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  if (v196)
  {
    if (a2)
      v197 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign");
    else
      v197 = CFSTR("place_card_place_action_details_transit_place_card_transit_departure_sequence_usage_headsign");
    objc_msgSend(v4, "setObject:forKey:", v196, v197);
  }

  if ((*(_QWORD *)(a1 + 724) & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 376));
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v199 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId");
    else
      v199 = CFSTR("place_card_place_action_details_transit_place_card_transit_departure_sequence_usage_line_id");
    objc_msgSend(v4, "setObject:forKey:", v198, v199);

  }
  v200 = 0x1E0C99000uLL;
  if (objc_msgSend(*(id *)(a1 + 400), "count"))
  {
    v201 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 400), "count"));
    v419 = 0u;
    v420 = 0u;
    v421 = 0u;
    v422 = 0u;
    v202 = *(id *)(a1 + 400);
    v203 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v419, v425, 16);
    if (v203)
    {
      v204 = v203;
      v205 = *(_QWORD *)v420;
      do
      {
        for (i = 0; i != v204; ++i)
        {
          if (*(_QWORD *)v420 != v205)
            objc_enumerationMutation(v202);
          v207 = *(void **)(*((_QWORD *)&v419 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v207, "jsonRepresentation");
          else
            objc_msgSend(v207, "dictionaryRepresentation");
          v208 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v201, "addObject:", v208);
        }
        v204 = objc_msgSend(v202, "countByEnumeratingWithState:objects:count:", &v419, v425, 16);
      }
      while (v204);
    }

    if (a2)
      v209 = CFSTR("placeCardRevealedPlaceCardModule");
    else
      v209 = CFSTR("place_card_revealed_place_card_module");
    objc_msgSend(v4, "setObject:forKey:", v201, v209);

    v14 = &OBJC_IVAR___GEOTileCoordinate__x;
    v200 = 0x1E0C99000uLL;
  }
  v210 = *(_QWORD *)(a1 + 732);
  if ((v210 & 0x20000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 713));
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v217 = CFSTR("placeCardIsPersonPlacecard");
    else
      v217 = CFSTR("place_card_is_person_placecard");
    objc_msgSend(v4, "setObject:forKey:", v216, v217);

    v210 = *(_QWORD *)(a1 + 732);
    if ((v210 & 0x8000000) == 0)
    {
LABEL_461:
      if ((v210 & 0x10000000) == 0)
        goto LABEL_466;
      goto LABEL_462;
    }
  }
  else if ((v210 & 0x8000000) == 0)
  {
    goto LABEL_461;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 711));
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v219 = CFSTR("placeCardIsPersonAddressAvailable");
  else
    v219 = CFSTR("place_card_is_person_address_available");
  objc_msgSend(v4, "setObject:forKey:", v218, v219);

  if ((*(_QWORD *)(a1 + 732) & 0x10000000) != 0)
  {
LABEL_462:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 712));
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v212 = CFSTR("placeCardIsPersonLocationShared");
    else
      v212 = CFSTR("place_card_is_person_location_shared");
    objc_msgSend(v4, "setObject:forKey:", v211, v212);

  }
LABEL_466:
  objc_msgSend((id)a1, "mapsServerMetadataSuggestionEntryTappedOn");
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v213)
  {
    if (!*(_QWORD *)(a1 + 232))
      goto LABEL_492;
    if (a2)
      goto LABEL_481;
LABEL_490:
    objc_msgSend((id)a1, "mapsServerMetadataSuggestionEntryDisplayeds");
    v222 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v222, CFSTR("maps_server_metadata_suggestion_entry_displayed"));
LABEL_491:

    goto LABEL_492;
  }
  v214 = v213;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(v4, "setObject:forKey:", v213, CFSTR("maps_server_metadata_suggestion_entry_tapped_on"));

    if (!*(_QWORD *)(a1 + 232))
      goto LABEL_492;
    goto LABEL_490;
  }
  objc_msgSend(v213, "base64EncodedStringWithOptions:", 0);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v215, CFSTR("mapsServerMetadataSuggestionEntryTappedOn"));

  if (*(_QWORD *)(a1 + 232))
  {
LABEL_481:
    v220 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend((id)a1, "mapsServerMetadataSuggestionEntryDisplayeds");
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v220, "arrayWithCapacity:", objc_msgSend(v221, "count"));
    v222 = (void *)objc_claimAutoreleasedReturnValue();

    v417 = 0u;
    v418 = 0u;
    v415 = 0u;
    v416 = 0u;
    objc_msgSend((id)a1, "mapsServerMetadataSuggestionEntryDisplayeds");
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    v224 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v415, v424, 16);
    if (v224)
    {
      v225 = v224;
      v226 = *(_QWORD *)v416;
      do
      {
        for (j = 0; j != v225; ++j)
        {
          if (*(_QWORD *)v416 != v226)
            objc_enumerationMutation(v223);
          objc_msgSend(*(id *)(*((_QWORD *)&v415 + 1) + 8 * j), "base64EncodedStringWithOptions:", 0);
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "addObject:", v228);

        }
        v225 = objc_msgSend(v223, "countByEnumeratingWithState:objects:count:", &v415, v424, 16);
      }
      while (v225);
    }

    objc_msgSend(v4, "setObject:forKey:", v222, CFSTR("mapsServerMetadataSuggestionEntryDisplayed"));
    v14 = &OBJC_IVAR___GEOTileCoordinate__x;
    v200 = 0x1E0C99000;
    goto LABEL_491;
  }
LABEL_492:
  objc_msgSend((id)a1, "mapsServerMetadata");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  v230 = v229;
  if (v229)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v229, "jsonRepresentation");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      v232 = CFSTR("mapsServerMetadata");
    }
    else
    {
      objc_msgSend(v229, "dictionaryRepresentation");
      v231 = (void *)objc_claimAutoreleasedReturnValue();
      v232 = CFSTR("maps_server_metadata");
    }
    v233 = v231;

    objc_msgSend(v4, "setObject:forKey:", v233, v232);
  }

  objc_msgSend((id)a1, "routeRouteDetails");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  v235 = v234;
  if (v234)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v234, "jsonRepresentation");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = CFSTR("routeRouteDetails");
    }
    else
    {
      objc_msgSend(v234, "dictionaryRepresentation");
      v236 = (void *)objc_claimAutoreleasedReturnValue();
      v237 = CFSTR("route_route_details");
    }
    v238 = v236;

    objc_msgSend(v4, "setObject:forKey:", v238, v237);
  }

  objc_msgSend((id)a1, "predExTrainingData");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  v240 = v239;
  if (v239)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v239, "jsonRepresentation");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      v242 = CFSTR("predExTrainingData");
    }
    else
    {
      objc_msgSend(v239, "dictionaryRepresentation");
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      v242 = CFSTR("pred_ex_training_data");
    }
    v243 = v241;

    objc_msgSend(v4, "setObject:forKey:", v243, v242);
  }

  v244 = *(_QWORD *)(a1 + v14[479]);
  if ((v244 & 0x1000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 656));
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v260 = CFSTR("suggestionsAcSequenceNumber");
    else
      v260 = CFSTR("suggestions_ac_sequence_number");
    objc_msgSend(v4, "setObject:forKey:", v259, v260);

    v244 = *(_QWORD *)(a1 + 724);
    if ((v244 & 0x2000000000000) == 0)
    {
LABEL_509:
      if ((v244 & 0x4000000000000) == 0)
        goto LABEL_514;
      goto LABEL_510;
    }
  }
  else if ((v244 & 0x2000000000000) == 0)
  {
    goto LABEL_509;
  }
  v261 = *(int *)(a1 + 660);
  if (v261 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 660));
    v262 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v262 = off_1E1C20098[v261];
  }
  if (a2)
    v266 = CFSTR("suggestionsSearchFieldType");
  else
    v266 = CFSTR("suggestions_search_field_type");
  objc_msgSend(v4, "setObject:forKey:", v262, v266);

  if ((*(_QWORD *)(a1 + v14[479]) & 0x4000000000000) != 0)
  {
LABEL_510:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 664));
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v246 = CFSTR("suggestionsSelectedIndex");
    else
      v246 = CFSTR("suggestions_selected_index");
    objc_msgSend(v4, "setObject:forKey:", v245, v246);

  }
LABEL_514:
  objc_msgSend((id)a1, "suggestionsSearchString");
  v247 = (void *)objc_claimAutoreleasedReturnValue();
  if (v247)
  {
    if (a2)
      v248 = CFSTR("suggestionsSearchString");
    else
      v248 = CFSTR("suggestions_search_string");
    objc_msgSend(v4, "setObject:forKey:", v247, v248);
  }

  if (objc_msgSend(*(id *)(a1 + 456), "count"))
  {
    v249 = (void *)objc_msgSend(objc_alloc(*(Class *)(v200 + 3560)), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 456), "count"));
    v411 = 0u;
    v412 = 0u;
    v413 = 0u;
    v414 = 0u;
    v250 = *(id *)(a1 + 456);
    v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v411, v423, 16);
    if (v251)
    {
      v252 = v251;
      v253 = *(_QWORD *)v412;
      do
      {
        for (k = 0; k != v252; ++k)
        {
          if (*(_QWORD *)v412 != v253)
            objc_enumerationMutation(v250);
          v255 = *(void **)(*((_QWORD *)&v411 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v255, "jsonRepresentation");
          else
            objc_msgSend(v255, "dictionaryRepresentation");
          v256 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v249, "addObject:", v256);
        }
        v252 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v411, v423, 16);
      }
      while (v252);
    }

    if (a2)
      v257 = CFSTR("suggestionsDisplayedResults");
    else
      v257 = CFSTR("suggestions_displayed_results");
    objc_msgSend(v4, "setObject:forKey:", v249, v257);

    v14 = &OBJC_IVAR___GEOTileCoordinate__x;
  }
  v258 = *(_QWORD *)(a1 + v14[479]);
  if ((v258 & 0x40000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 674));
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v263, CFSTR("landscape"));

    v258 = *(_QWORD *)(a1 + 724);
    if ((v258 & 0x200000000000) == 0)
    {
LABEL_536:
      if ((v258 & 0x400000000000) == 0)
        goto LABEL_537;
LABEL_559:
      v268 = *(int *)(a1 + 648);
      if (v268 >= 6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 648));
        v269 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v269 = off_1E1C200D8[v268];
      }
      if (a2)
        v270 = CFSTR("restoreLayoutStyle");
      else
        v270 = CFSTR("restore_layout_style");
      objc_msgSend(v4, "setObject:forKey:", v269, v270);

      if ((*(_QWORD *)(a1 + v14[479]) & 0x800000000000) == 0)
        goto LABEL_1085;
      goto LABEL_566;
    }
  }
  else if ((v258 & 0x200000000000) == 0)
  {
    goto LABEL_536;
  }
  v264 = *(int *)(a1 + 644);
  if (v264 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 644));
    v265 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v265 = off_1E1C200B8[v264];
  }
  if (a2)
    v267 = CFSTR("restoreLayoutInfo");
  else
    v267 = CFSTR("restore_layout_info");
  objc_msgSend(v4, "setObject:forKey:", v265, v267);

  v258 = *(_QWORD *)(a1 + v14[479]);
  if ((v258 & 0x400000000000) != 0)
    goto LABEL_559;
LABEL_537:
  if ((v258 & 0x800000000000) == 0)
    goto LABEL_1085;
LABEL_566:
  v271 = *(_DWORD *)(a1 + 652);
  if (v271 > 1000)
  {
    if (v271 > 1600)
    {
      switch(v271)
      {
        case 1801:
          v272 = CFSTR("MAPS_WEB_PLACE");
          break;
        case 1802:
          v272 = CFSTR("MAPS_WEB_SEARCH");
          break;
        case 1803:
          v272 = CFSTR("MAPS_WEB_SEARCH_RESULTS");
          break;
        case 1804:
          v272 = CFSTR("MAPS_WEB_PUBLISHER");
          break;
        case 1805:
          v272 = CFSTR("MAPS_WEB_GUIDE");
          break;
        case 1806:
          v272 = CFSTR("MAPS_WEB_GUIDES_HOME");
          break;
        case 1807:
          v272 = CFSTR("MAPS_WEB_RELATED_PLACES_LIST");
          break;
        case 1808:
          v272 = CFSTR("MAPS_WEB_COLLECTION_LIST");
          break;
        case 1809:
          v272 = CFSTR("MAPS_WEB_DIRECTIONS");
          break;
        case 1810:
          v272 = CFSTR("MAPS_WEB_SIDEBAR");
          break;
        default:
          switch(v271)
          {
            case 1700:
              v272 = CFSTR("LOOK_AROUND_PIP");
              break;
            case 1701:
              v272 = CFSTR("LOOK_AROUND_ACTION_SHEET");
              break;
            case 1702:
              v272 = CFSTR("LOOK_AROUND_VIEW");
              break;
            case 1703:
              v272 = CFSTR("LOOK_AROUND_PLATTER");
              break;
            case 1704:
              v272 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM");
              break;
            case 1705:
              v272 = CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION");
              break;
            case 1706:
              v272 = CFSTR("LOOK_AROUND_VIEW_PLACECARD");
              break;
            case 1707:
              v272 = CFSTR("LOOK_AROUND_PIP_PLACECARD");
              break;
            case 1708:
              v272 = CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY");
              break;
            default:
              if (v271 == 1601)
              {
                v272 = CFSTR("MENU_ITEM_DARK_MAP");
              }
              else
              {
LABEL_602:
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 652));
                v272 = (__CFString *)objc_claimAutoreleasedReturnValue();
              }
              break;
          }
          break;
      }
    }
    else
    {
      switch(v271)
      {
        case 1001:
          v272 = CFSTR("CARPLAY_NAV");
          break;
        case 1002:
          v272 = CFSTR("CARPLAY_EXPLORE");
          break;
        case 1003:
          v272 = CFSTR("CARPLAY_DESTINATIONS");
          break;
        case 1004:
          v272 = CFSTR("CARPLAY_TRAFFIC_INCIDENT");
          break;
        case 1005:
          v272 = CFSTR("CARPLAY_CONTROL");
          break;
        case 1006:
          v272 = CFSTR("CARPLAY_PROACTIVE");
          break;
        case 1007:
          v272 = CFSTR("CARPLAY_ROUTING");
          break;
        case 1008:
          v272 = CFSTR("CARPLAY_MORE_ROUTES");
          break;
        case 1009:
          v272 = CFSTR("CARPLAY_SEARCH_ALONG_ROUTE");
          break;
        case 1010:
          v272 = CFSTR("CARPLAY_SEARCH");
          break;
        case 1011:
          v272 = CFSTR("CARPLAY_SEARCH_RESULTS");
          break;
        case 1012:
          v272 = CFSTR("CARPLAY_FAVORITES");
          break;
        case 1013:
          v272 = CFSTR("CARPLAY_NAV_CONFIRMATION");
          break;
        case 1014:
          v272 = CFSTR("CARPLAY_DESTINATION_SHARING");
          break;
        case 1015:
          v272 = CFSTR("CARPLAY_NOTIFICATION_BATTERY");
          break;
        case 1016:
          v272 = CFSTR("CARPLAY_NOTIFICATION_DOOM");
          break;
        case 1017:
          v272 = CFSTR("CARPLAY_NOTIFICATION_FUEL");
          break;
        case 1018:
          v272 = CFSTR("CARPLAY_NOTIFICATION_HYBRID");
          break;
        case 1019:
          v272 = CFSTR("CARPLAY_SHARE_ETA_TRAY");
          break;
        case 1020:
          v272 = CFSTR("CARPLAY_ETA_UPDATE_TRAY");
          break;
        case 1021:
          v272 = CFSTR("CARPLAY_ACTION_TRAY");
          break;
        case 1022:
          v272 = CFSTR("CARPLAY_PLACECARD");
          break;
        case 1023:
          v272 = CFSTR("CARPLAY_KEYBOARD");
          break;
        case 1024:
          v272 = CFSTR("CARPLAY_UI_TARGET_UNKNOWN");
          break;
        case 1025:
          v272 = CFSTR("CARPLAY_EDIT_STOPS");
          break;
        case 1026:
        case 1027:
        case 1028:
        case 1029:
        case 1030:
        case 1031:
        case 1032:
        case 1033:
        case 1034:
        case 1035:
        case 1036:
        case 1037:
        case 1038:
        case 1039:
        case 1040:
        case 1041:
        case 1042:
        case 1043:
        case 1044:
        case 1045:
        case 1046:
        case 1047:
        case 1048:
        case 1049:
        case 1050:
        case 1051:
        case 1052:
        case 1053:
        case 1054:
        case 1055:
        case 1056:
        case 1057:
        case 1058:
        case 1059:
        case 1060:
        case 1061:
        case 1062:
        case 1063:
        case 1064:
        case 1065:
        case 1066:
        case 1067:
        case 1068:
        case 1069:
        case 1070:
        case 1071:
        case 1072:
        case 1073:
        case 1074:
        case 1075:
        case 1076:
        case 1077:
        case 1078:
        case 1079:
        case 1080:
        case 1081:
        case 1082:
        case 1083:
        case 1084:
        case 1085:
        case 1086:
        case 1087:
        case 1088:
        case 1089:
        case 1090:
        case 1091:
        case 1092:
        case 1093:
        case 1094:
        case 1095:
        case 1096:
        case 1097:
        case 1098:
        case 1099:
        case 1162:
        case 1163:
        case 1164:
        case 1165:
        case 1166:
        case 1167:
        case 1168:
        case 1169:
        case 1170:
        case 1171:
        case 1172:
        case 1173:
        case 1174:
        case 1175:
        case 1176:
        case 1177:
        case 1178:
        case 1179:
        case 1180:
        case 1181:
        case 1182:
        case 1183:
        case 1184:
        case 1185:
        case 1186:
        case 1187:
        case 1188:
        case 1189:
        case 1190:
        case 1191:
        case 1192:
        case 1193:
        case 1194:
        case 1195:
        case 1196:
        case 1197:
        case 1198:
        case 1199:
        case 1200:
        case 1241:
        case 1242:
        case 1243:
        case 1244:
        case 1245:
        case 1246:
        case 1247:
        case 1248:
        case 1249:
        case 1250:
        case 1251:
        case 1252:
        case 1253:
        case 1254:
        case 1255:
        case 1256:
        case 1257:
        case 1258:
        case 1259:
        case 1260:
        case 1261:
        case 1262:
        case 1263:
        case 1264:
        case 1265:
        case 1266:
        case 1267:
        case 1268:
        case 1269:
        case 1270:
        case 1271:
        case 1272:
        case 1273:
        case 1274:
        case 1275:
        case 1276:
        case 1277:
        case 1278:
        case 1279:
        case 1280:
        case 1281:
        case 1282:
        case 1283:
        case 1284:
        case 1285:
        case 1286:
        case 1287:
        case 1288:
        case 1289:
        case 1290:
        case 1291:
        case 1292:
        case 1293:
        case 1294:
        case 1295:
        case 1296:
        case 1297:
        case 1298:
        case 1299:
        case 1300:
          goto LABEL_602;
        case 1100:
          v272 = CFSTR("RAP_DIRECTIONS_MENU");
          break;
        case 1101:
          v272 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST");
          break;
        case 1102:
          v272 = CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM");
          break;
        case 1103:
          v272 = CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM");
          break;
        case 1104:
          v272 = CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM");
          break;
        case 1105:
          v272 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM");
          break;
        case 1106:
          v272 = CFSTR("RAP_TRANSIT_MENU");
          break;
        case 1107:
          v272 = CFSTR("RAP_STATION_MAP");
          break;
        case 1108:
          v272 = CFSTR("RAP_STATION_MENU");
          break;
        case 1109:
          v272 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP");
          break;
        case 1110:
          v272 = CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM");
          break;
        case 1111:
          v272 = CFSTR("RAP_STATION_CLOSED_FORM");
          break;
        case 1112:
          v272 = CFSTR("RAP_LINE_MAP");
          break;
        case 1113:
          v272 = CFSTR("RAP_LINE_MENU");
          break;
        case 1114:
          v272 = CFSTR("RAP_LINE_NAME_FORM");
          break;
        case 1115:
          v272 = CFSTR("RAP_LINE_SHAPE_FORM");
          break;
        case 1116:
          v272 = CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM");
          break;
        case 1117:
          v272 = CFSTR("RAP_ADD_PLACE_MENU");
          break;
        case 1118:
          v272 = CFSTR("RAP_ADD_POI_MAP");
          break;
        case 1119:
          v272 = CFSTR("RAP_CATEGORY_LIST");
          break;
        case 1120:
          v272 = CFSTR("RAP_POI_DETAILS_FORM");
          break;
        case 1121:
          v272 = CFSTR("RAP_ADD_STREET_MAP");
          break;
        case 1122:
          v272 = CFSTR("RAP_STREET_DETAILS_FORM");
          break;
        case 1123:
          v272 = CFSTR("RAP_ADD_OTHER_MAP");
          break;
        case 1124:
          v272 = CFSTR("RAP_OTHER_DETAILS_FORM");
          break;
        case 1125:
          v272 = CFSTR("RAP_CAMERA");
          break;
        case 1126:
          v272 = CFSTR("RAP_LABEL_MAP");
          break;
        case 1127:
          v272 = CFSTR("RAP_LABEL_DETAILS_FORM");
          break;
        case 1128:
          v272 = CFSTR("RAP_SEARCH_MENU");
          break;
        case 1129:
          v272 = CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM");
          break;
        case 1130:
          v272 = CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM");
          break;
        case 1131:
          v272 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP");
          break;
        case 1132:
          v272 = CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM");
          break;
        case 1133:
          v272 = CFSTR("RAP_SATELLITE_IMAGE_MAP");
          break;
        case 1134:
          v272 = CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM");
          break;
        case 1135:
          v272 = CFSTR("RAP_OTHER_FORM");
          break;
        case 1136:
          v272 = CFSTR("RAP_PRIVACY");
          break;
        case 1137:
          v272 = CFSTR("RAP_CONFIRMATION");
          break;
        case 1138:
          v272 = CFSTR("RAP_POI_MENU");
          break;
        case 1139:
          v272 = CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU");
          break;
        case 1140:
          v272 = CFSTR("RAP_ADD_A_PLACE_MAP");
          break;
        case 1141:
          v272 = CFSTR("RAP_POI_LOCATION_MAP");
          break;
        case 1142:
          v272 = CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP");
          break;
        case 1143:
          v272 = CFSTR("RAP_POI_CLOSED_FORM");
          break;
        case 1144:
          v272 = CFSTR("RAP_CLAIM_BUSINESS_DIALOG");
          break;
        case 1145:
          v272 = CFSTR("RAP_BRAND_MENU");
          break;
        case 1146:
          v272 = CFSTR("RAP_BRAND_DETAILS_FORM");
          break;
        case 1147:
          v272 = CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM");
          break;
        case 1148:
          v272 = CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM");
          break;
        case 1149:
          v272 = CFSTR("RAP_LOOK_AROUND_BLURRING_FORM");
          break;
        case 1150:
          v272 = CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM");
          break;
        case 1151:
          v272 = CFSTR("RAP_LOOK_AROUND_MENU");
          break;
        case 1152:
          v272 = CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM");
          break;
        case 1153:
          v272 = CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU");
          break;
        case 1154:
          v272 = CFSTR("RAP_LIGHTWEIGHT");
          break;
        case 1155:
          v272 = CFSTR("RAP_EDIT_PLACE_DETAILS");
          break;
        case 1156:
          v272 = CFSTR("RAP_ADD_CATEGORY");
          break;
        case 1157:
          v272 = CFSTR("RAP_ADD_HOURS");
          break;
        case 1158:
          v272 = CFSTR("RAP_EDIT_LOCATION");
          break;
        case 1159:
          v272 = CFSTR("RAP_EDIT_ENTRY_POINT");
          break;
        case 1160:
          v272 = CFSTR("RAP_LOOK_AROUND");
          break;
        case 1161:
          v272 = CFSTR("RAP_ADD_ENTRY_POINT");
          break;
        case 1201:
          v272 = CFSTR("WATCH_MAIN_MENU");
          break;
        case 1202:
          v272 = CFSTR("WATCH_MAIN_PRESS_MENU");
          break;
        case 1203:
          v272 = CFSTR("WATCH_SEARCH");
          break;
        case 1204:
          v272 = CFSTR("WATCH_DICTATION");
          break;
        case 1205:
          v272 = CFSTR("WATCH_FAVORITES");
          break;
        case 1206:
          v272 = CFSTR("WATCH_SUB_CATEGORY_LIST");
          break;
        case 1207:
          v272 = CFSTR("WATCH_SEARCH_RESULTS_LIST");
          break;
        case 1208:
          v272 = CFSTR("WATCH_MAP_VIEW");
          break;
        case 1209:
          v272 = CFSTR("WATCH_PLACECARD");
          break;
        case 1210:
          v272 = CFSTR("WATCH_ROUTE_PLANNING");
          break;
        case 1211:
          v272 = CFSTR("WATCH_ROUTE_DETAILS");
          break;
        case 1212:
          v272 = CFSTR("WATCH_NAV_TBT");
          break;
        case 1213:
          v272 = CFSTR("WATCH_NAV_MAP");
          break;
        case 1214:
          v272 = CFSTR("WATCH_NAV_PRESS_MENU");
          break;
        case 1215:
          v272 = CFSTR("WATCH_MAP_PRESS_MENU");
          break;
        case 1216:
          v272 = CFSTR("WATCH_ROUTING_PRESS_MENU");
          break;
        case 1217:
          v272 = CFSTR("WATCH_TRANSIT_MAP_VIEW");
          break;
        case 1218:
          v272 = CFSTR("WATCH_SCRIBBLE");
          break;
        case 1219:
          v272 = CFSTR("WATCH_COLLECTION_VIEW");
          break;
        case 1220:
          v272 = CFSTR("WATCH_ROUTE_PLANNING_WALKING");
          break;
        case 1221:
          v272 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING");
          break;
        case 1222:
          v272 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT");
          break;
        case 1223:
          v272 = CFSTR("WATCH_PAIRED_DEVICE");
          break;
        case 1224:
          v272 = CFSTR("WATCH_NAV_DRIVING_SPLIT");
          break;
        case 1225:
          v272 = CFSTR("WATCH_NAV_DRIVING_PLATTER");
          break;
        case 1226:
          v272 = CFSTR("WATCH_NAV_DRIVING_MAP");
          break;
        case 1227:
          v272 = CFSTR("WATCH_NAV_WALKING_SPLIT");
          break;
        case 1228:
          v272 = CFSTR("WATCH_NAV_WALKING_PLATTER");
          break;
        case 1229:
          v272 = CFSTR("WATCH_NAV_WALKING_MAP");
          break;
        case 1230:
          v272 = CFSTR("WATCH_NAV_TRANSIT_SPLIT");
          break;
        case 1231:
          v272 = CFSTR("WATCH_NAV_TRANSIT_PLATTER");
          break;
        case 1232:
          v272 = CFSTR("WATCH_NAV_TRANSIT_MAP");
          break;
        case 1233:
          v272 = CFSTR("WATCH_ROUTE_INFO");
          break;
        case 1234:
          v272 = CFSTR("WATCH_NAV_CYCLING_MAP");
          break;
        case 1235:
          v272 = CFSTR("WATCH_NAV_CYCLING_PLATTER");
          break;
        case 1236:
          v272 = CFSTR("WATCH_NAV_CYCLING_SPLIT");
          break;
        case 1237:
          v272 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING");
          break;
        case 1238:
          v272 = CFSTR("WATCH_SEARCH_INPUT");
          break;
        case 1239:
          v272 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
          break;
        case 1240:
          v272 = CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE");
          break;
        case 1301:
          v272 = CFSTR("PERSONALIZED_ADDRESS_LIST");
          break;
        case 1302:
          v272 = CFSTR("PERSONALIZED_ADDRESS_FORM");
          break;
        case 1303:
          v272 = CFSTR("PERSONALIZED_LABEL_FORM");
          break;
        case 1304:
          v272 = CFSTR("PERSONALIZED_EDIT_MAP");
          break;
        case 1305:
          v272 = CFSTR("PERSONALIZED_CONFIRMATION");
          break;
        case 1306:
          v272 = CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG");
          break;
        case 1307:
          v272 = CFSTR("PERSONALIZED_ADDRESS_INFO");
          break;
        case 1308:
          v272 = CFSTR("PERSONALIZED_ADDRESS_SEARCH");
          break;
        case 1309:
          v272 = CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS");
          break;
        case 1310:
          v272 = CFSTR("FAVORITE_SEARCH");
          break;
        case 1311:
          v272 = CFSTR("FAVORITE_LIST");
          break;
        case 1312:
          v272 = CFSTR("FAVORITE_INFO");
          break;
        case 1313:
          v272 = CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY");
          break;
        default:
          switch(v271)
          {
            case 1401:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS");
              break;
            case 1402:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING");
              break;
            case 1403:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING");
              break;
            case 1404:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED");
              break;
            case 1405:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG");
              break;
            case 1406:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK");
              break;
            case 1407:
              v272 = CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL");
              break;
            default:
              switch(v271)
              {
                case 1501:
                  v272 = CFSTR("PLACECARD_HEADER");
                  break;
                case 1502:
                  v272 = CFSTR("PLACECARD_ADDRESS");
                  break;
                case 1503:
                  v272 = CFSTR("PLACECARD_PHONE");
                  break;
                case 1504:
                  v272 = CFSTR("PLACECARD_URL");
                  break;
                default:
                  goto LABEL_602;
              }
              break;
          }
          break;
      }
    }
  }
  else
  {
    v272 = CFSTR("UI_TARGET_UNKNOWN");
    switch(v271)
    {
      case 0:
        break;
      case 1:
        v272 = CFSTR("UI_TARGET_POI");
        break;
      case 2:
        v272 = CFSTR("UI_TARGET_SEARCH_RESULT_LIST");
        break;
      case 3:
        v272 = CFSTR("UI_TARGET_POPULAR_NEARBY_LIST");
        break;
      case 4:
        v272 = CFSTR("UI_TARGET_CALLOUT");
        break;
      case 5:
        v272 = CFSTR("UI_TARGET_SEARCH_PIN");
        break;
      case 6:
        v272 = CFSTR("UI_TARGET_DROPPED_PIN");
        break;
      case 7:
        v272 = CFSTR("UI_TARGET_TRANSIT_LINE");
        break;
      case 8:
        v272 = CFSTR("SEARCH_TRAY");
        break;
      case 9:
        v272 = CFSTR("SEARCH_TRAY_BROWSE");
        break;
      case 10:
        v272 = CFSTR("SEARCH_TRAY_POPULAR_NEARBY");
        break;
      case 11:
        v272 = CFSTR("SEARCH_TRAY_AC");
        break;
      case 12:
        v272 = CFSTR("SEARCH_TRAY_AC_INTERMEDIATE");
        break;
      case 13:
        v272 = CFSTR("SEARCH_TRAY_NO_QUERY");
        break;
      case 14:
        v272 = CFSTR("AR_WALKING_LEGAL_TRAY");
        break;
      case 15:
        v272 = CFSTR("RAISE_TO_START_AR_TRAY");
        break;
      case 16:
        v272 = CFSTR("EVENTS_ADVISORY_DETAILS_PAGE");
        break;
      case 17:
        v272 = CFSTR("INCIDENT_REPORT_TRAY_CARPLAY");
        break;
      case 18:
        v272 = CFSTR("HIGHLIGHTED_AREA");
        break;
      case 19:
        v272 = CFSTR("CURATED_COLLECTIONS_HOME");
        break;
      case 20:
        v272 = CFSTR("TRAVEL_PREFERENCES_TRAY");
        break;
      case 21:
        v272 = CFSTR("RESULT_TRAY_SEARCH");
        break;
      case 22:
        v272 = CFSTR("SINGLE_CARD_FILTER");
        break;
      case 23:
        v272 = CFSTR("FULL_CARD_FILTER");
        break;
      case 24:
        v272 = CFSTR("ACCOUNT_PRIVACY_TRAY");
        break;
      case 25:
        v272 = CFSTR("APPLE_RATINGS_HISTORY_TRAY");
        break;
      case 26:
        v272 = CFSTR("CURATED_COLLECTIONS_HOME_FILTERED");
        break;
      case 27:
        v272 = CFSTR("CITY_MENU");
        break;
      case 28:
        v272 = CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED");
        break;
      case 29:
        v272 = CFSTR("ACCOUNT_TRAY");
        break;
      case 30:
        v272 = CFSTR("QUICK_ACTION_TRAY");
        break;
      case 31:
        v272 = CFSTR("SUBMIT_TRIP_FEEDBACK");
        break;
      case 32:
        v272 = CFSTR("RAP_PLACE_ISSUE_DETAILS");
        break;
      case 33:
        v272 = CFSTR("RAP_GUIDES_DETAILS");
        break;
      case 34:
        v272 = CFSTR("RAP_BAD_DIRECTIONS_DETAILS");
        break;
      case 35:
        v272 = CFSTR("RAP_ADD_MAP_DETAILS");
        break;
      case 36:
        v272 = CFSTR("WATCH_COMPLICATION");
        break;
      case 37:
        v272 = CFSTR("RAP_NAV_MENU");
        break;
      case 38:
        v272 = CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT");
        break;
      case 39:
        v272 = CFSTR("RAP_REPORT_MENU");
        break;
      case 40:
        v272 = CFSTR("RAP_CURATED_COLLECTION_MENU");
        break;
      case 41:
        v272 = CFSTR("RAP_REPORT_CARD_DETAILS");
        break;
      case 42:
        v272 = CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT");
        break;
      case 43:
        v272 = CFSTR("RAP_STREET_ISSUE_DETAILS");
        break;
      case 44:
        v272 = CFSTR("NEARBY_TRANSIT_CARD");
        break;
      case 45:
        v272 = CFSTR("WATCH_NAV_MENU");
        break;
      case 46:
        v272 = CFSTR("GENERIC_ADVISORY_PAGE");
        break;
      case 47:
        v272 = CFSTR("USER_PROFILE_TRAY");
        break;
      case 48:
        v272 = CFSTR("MEDIA_APP_MENU");
        break;
      case 49:
        v272 = CFSTR("TEMPLATE_PLACE_TRAY");
        break;
      case 50:
        v272 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP");
        break;
      case 51:
        v272 = CFSTR("ALLOW_NOTIFICATION_DIALOG");
        break;
      case 52:
        v272 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING");
        break;
      case 53:
        v272 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP");
        break;
      case 54:
        v272 = CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED");
        break;
      case 55:
        v272 = CFSTR("NOTIFICATION_CONSENT_PROMPT");
        break;
      case 56:
        v272 = CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU");
        break;
      case 57:
        v272 = CFSTR("PLACECARD_TRAY_VENDORS_MENU");
        break;
      case 58:
        v272 = CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING");
        break;
      case 59:
        v272 = CFSTR("SEARCH_ALONG_ROUTE_TRAY");
        break;
      case 60:
        v272 = CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING");
        break;
      case 61:
        v272 = CFSTR("PLACECARD_SHOWCASE_MENU");
        break;
      case 62:
        v272 = CFSTR("RAP_INLINE_ADD_DETAILS");
        break;
      case 63:
        v272 = CFSTR("RAP_EDIT_MENU_DETAILS");
        break;
      case 64:
        v272 = CFSTR("RAP_SUBMISSION_PROMPT");
        break;
      case 65:
        v272 = CFSTR("RAP_PLACECARD_EDIT_MENU");
        break;
      case 66:
        v272 = CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE");
        break;
      case 67:
        v272 = CFSTR("INCIDENT_REPORT_MENU");
        break;
      case 68:
        v272 = CFSTR("RAP_SELECT_BAD_ROUTES_STEPS");
        break;
      case 69:
        v272 = CFSTR("RAP_SELECT_BAD_ROUTES");
        break;
      case 70:
        v272 = CFSTR("SIRI_SUGGESTION_RESUME_ROUTE");
        break;
      case 71:
        v272 = CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE");
        break;
      case 72:
        v272 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST");
        break;
      case 73:
        v272 = CFSTR("SPOTLIGHT_BUSINESS_ENTITY");
        break;
      case 74:
        v272 = CFSTR("NOTIFICATION_ARP");
        break;
      case 75:
        v272 = CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT");
        break;
      case 76:
        v272 = CFSTR("YOUR_PHOTOS_ALBUM");
        break;
      case 77:
        v272 = CFSTR("ARP_PHOTO_CREDIT");
        break;
      case 78:
        v272 = CFSTR("RAP_OUTREACH_REVIEWED_REPORT");
        break;
      case 79:
        v272 = CFSTR("RAP_REPORT_MENU_MORE");
        break;
      case 80:
        v272 = CFSTR("WATCH_MAPS_SETTINGS");
        break;
      case 81:
        v272 = CFSTR("OFFLINE_FEATURE_PROMPT");
        break;
      case 82:
        v272 = CFSTR("EXPIRED_MAPS_DETAILS");
        break;
      case 83:
        v272 = CFSTR("MAPS_VIEW");
        break;
      case 84:
        v272 = CFSTR("NOTIFICATION_OFFLINE");
        break;
      case 85:
        v272 = CFSTR("EXPIRED_MAPS_MANAGEMENT");
        break;
      case 86:
        v272 = CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT");
        break;
      case 87:
        v272 = CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT");
        break;
      case 88:
        v272 = CFSTR("OFFLINE_MAPS_MANAGEMENT");
        break;
      case 89:
        v272 = CFSTR("REGION_SELECTOR");
        break;
      case 90:
        v272 = CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT");
        break;
      case 91:
        v272 = CFSTR("FIND_MY_ETA_SHARING_TRAY");
        break;
      case 92:
        v272 = CFSTR("WATCH_PLACE");
        break;
      case 93:
        v272 = CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL");
        break;
      case 94:
        v272 = CFSTR("WATCH_ROUTE_PLANNING_MAP");
        break;
      case 95:
        v272 = CFSTR("WATCH_NAV_WALKING_CONTROLS");
        break;
      case 96:
        v272 = CFSTR("WATCH_NAV_CYCLING_CONTROLS");
        break;
      case 97:
        v272 = CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL");
        break;
      case 98:
        v272 = CFSTR("WATCH_NAV_TRANSIT_CONTROLS");
        break;
      case 99:
        v272 = CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL");
        break;
      case 100:
        v272 = CFSTR("WATCH_NAV_DRIVING_CONTROLS");
        break;
      case 101:
        v272 = CFSTR("RESULTS_TRAY_SEARCH");
        break;
      case 102:
        v272 = CFSTR("RESULTS_TRAY_BROWSE");
        break;
      case 103:
        v272 = CFSTR("RESULTS_TRAY_FAVORITES");
        break;
      case 104:
        v272 = CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE");
        break;
      case 105:
        v272 = CFSTR("RESULTS_TRAY_CLUSTER");
        break;
      case 106:
        v272 = CFSTR("RESULTS_TRAY_VENUE_BROWSE");
        break;
      case 107:
        v272 = CFSTR("WATCH_MAP_RESULTS");
        break;
      case 108:
        v272 = CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW");
        break;
      case 109:
        v272 = CFSTR("WATCH_PLACES");
        break;
      case 110:
        v272 = CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW");
        break;
      case 111:
        v272 = CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL");
        break;
      case 112:
        v272 = CFSTR("DOWNLOADED_MAPS_DETAILS");
        break;
      case 113:
        v272 = CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL");
        break;
      case 114:
        v272 = CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP");
        break;
      case 115:
        v272 = CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP");
        break;
      case 116:
        v272 = CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP");
        break;
      case 117:
        v272 = CFSTR("WATCH_ROUTE_OPTIONS");
        break;
      case 118:
        v272 = CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP");
        break;
      case 119:
        v272 = CFSTR("WATCH_MORE_GUIDES");
        break;
      case 120:
        v272 = CFSTR("WATCH_RECENTLY_VIEWED");
        break;
      case 121:
        v272 = CFSTR("EV_SUCCESS_TRAY");
        break;
      case 122:
        v272 = CFSTR("PREFERRED_NETWORK_SELECTION_TRAY");
        break;
      case 123:
        v272 = CFSTR("PREFERRED_NETWORK_TRAY");
        break;
      case 124:
        v272 = CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 125:
        v272 = CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY");
        break;
      case 126:
        v272 = CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY");
        break;
      case 127:
        v272 = CFSTR("AC_KEYBOARD_TRAY");
        break;
      case 128:
        v272 = CFSTR("MORE_RELATED_TRAILS");
        break;
      case 129:
        v272 = CFSTR("MORE_RELATED_TRAILHEADS");
        break;
      case 130:
        v272 = CFSTR("ROUTING_TRAY_CUSTOM_ROUTE");
        break;
      case 131:
        v272 = CFSTR("CUSTOM_ROUTE_CREATION_TRAY");
        break;
      case 132:
        v272 = CFSTR("ROUTING_TRAY_CURATED_HIKE");
        break;
      case 133:
        v272 = CFSTR("MORE_CURATED_HIKES");
        break;
      case 134:
        v272 = CFSTR("CUSTOM_ROUTE_ONBOARDING");
        break;
      case 135:
        v272 = CFSTR("LIBRARY_ROUTES");
        break;
      case 136:
        v272 = CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY");
        break;
      case 137:
        v272 = CFSTR("MY_LIBRARY");
        break;
      case 138:
        v272 = CFSTR("EDIT_NOTE_TRAY");
        break;
      case 139:
        v272 = CFSTR("CREATE_NOTE_TRAY");
        break;
      case 140:
        v272 = CFSTR("LIBRARY_PLACES");
        break;
      case 141:
        v272 = CFSTR("WATCH_ACCOUNT");
        break;
      case 142:
        v272 = CFSTR("WATCH_DOWNLOADED_MAPS");
        break;
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 269:
      case 270:
      case 271:
      case 272:
      case 273:
      case 274:
      case 275:
      case 276:
      case 277:
      case 278:
      case 279:
      case 280:
      case 281:
      case 282:
      case 283:
      case 284:
      case 285:
      case 286:
      case 287:
      case 288:
      case 289:
      case 290:
      case 291:
      case 292:
      case 293:
      case 294:
      case 295:
      case 296:
      case 297:
      case 298:
      case 299:
      case 300:
      case 307:
      case 308:
      case 309:
      case 310:
      case 311:
      case 312:
      case 313:
      case 314:
      case 315:
      case 316:
      case 317:
      case 318:
      case 319:
      case 320:
      case 321:
      case 322:
      case 323:
      case 324:
      case 325:
      case 326:
      case 327:
      case 328:
      case 329:
      case 330:
      case 331:
      case 332:
      case 333:
      case 334:
      case 335:
      case 336:
      case 337:
      case 338:
      case 339:
      case 340:
      case 341:
      case 342:
      case 343:
      case 344:
      case 345:
      case 346:
      case 347:
      case 348:
      case 349:
      case 350:
      case 351:
      case 352:
      case 353:
      case 354:
      case 355:
      case 356:
      case 357:
      case 358:
      case 359:
      case 360:
      case 361:
      case 362:
      case 363:
      case 364:
      case 365:
      case 366:
      case 367:
      case 368:
      case 369:
      case 370:
      case 371:
      case 372:
      case 373:
      case 374:
      case 375:
      case 376:
      case 377:
      case 378:
      case 379:
      case 380:
      case 381:
      case 382:
      case 383:
      case 384:
      case 385:
      case 386:
      case 387:
      case 388:
      case 389:
      case 390:
      case 391:
      case 392:
      case 393:
      case 394:
      case 395:
      case 396:
      case 397:
      case 398:
      case 399:
      case 400:
      case 405:
      case 406:
      case 407:
      case 408:
      case 409:
      case 410:
      case 411:
      case 412:
      case 413:
      case 414:
      case 415:
      case 416:
      case 417:
      case 418:
      case 419:
      case 420:
      case 421:
      case 422:
      case 423:
      case 424:
      case 425:
      case 426:
      case 427:
      case 428:
      case 429:
      case 430:
      case 431:
      case 432:
      case 433:
      case 434:
      case 435:
      case 436:
      case 437:
      case 438:
      case 439:
      case 440:
      case 441:
      case 442:
      case 443:
      case 444:
      case 445:
      case 446:
      case 447:
      case 448:
      case 449:
      case 450:
      case 451:
      case 452:
      case 453:
      case 454:
      case 455:
      case 456:
      case 457:
      case 458:
      case 459:
      case 460:
      case 461:
      case 462:
      case 463:
      case 464:
      case 465:
      case 466:
      case 467:
      case 468:
      case 469:
      case 470:
      case 471:
      case 472:
      case 473:
      case 474:
      case 475:
      case 476:
      case 477:
      case 478:
      case 479:
      case 480:
      case 481:
      case 482:
      case 483:
      case 484:
      case 485:
      case 486:
      case 487:
      case 488:
      case 489:
      case 490:
      case 491:
      case 492:
      case 493:
      case 494:
      case 495:
      case 496:
      case 497:
      case 498:
      case 499:
      case 500:
      case 512:
      case 513:
      case 514:
      case 515:
      case 516:
      case 517:
      case 518:
      case 519:
      case 520:
      case 521:
      case 522:
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 556:
      case 557:
      case 558:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 569:
      case 570:
      case 571:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 597:
      case 598:
      case 599:
      case 600:
      case 700:
      case 744:
      case 745:
      case 746:
      case 747:
      case 748:
      case 749:
      case 750:
      case 751:
      case 752:
      case 753:
      case 754:
      case 755:
      case 756:
      case 757:
      case 758:
      case 759:
      case 760:
      case 761:
      case 762:
      case 763:
      case 764:
      case 765:
      case 766:
      case 767:
      case 768:
      case 769:
      case 770:
      case 771:
      case 772:
      case 773:
      case 774:
      case 775:
      case 776:
      case 777:
      case 778:
      case 779:
      case 780:
      case 781:
      case 782:
      case 783:
      case 784:
      case 785:
      case 786:
      case 787:
      case 788:
      case 789:
      case 790:
      case 791:
      case 792:
      case 793:
      case 794:
      case 795:
      case 796:
      case 797:
      case 798:
      case 799:
      case 800:
        goto LABEL_602;
      case 201:
        v272 = CFSTR("PLACECARD_TRAY");
        break;
      case 202:
        v272 = CFSTR("WEB_MODULE");
        break;
      case 250:
        v272 = CFSTR("ADD_FAVORITE_TRAY");
        break;
      case 251:
        v272 = CFSTR("COLLECTION_LIST");
        break;
      case 252:
        v272 = CFSTR("COLLECTION_VIEW");
        break;
      case 253:
        v272 = CFSTR("FAVORITE_DETAILS");
        break;
      case 254:
        v272 = CFSTR("FAVORITES_TRAY");
        break;
      case 255:
        v272 = CFSTR("SHARED_COLLECTION");
        break;
      case 256:
        v272 = CFSTR("SHARED_COLLECTION_VIEW");
        break;
      case 257:
        v272 = CFSTR("RECENTLY_VIEWED");
        break;
      case 258:
        v272 = CFSTR("SHARED_WEB_COLLECTION");
        break;
      case 259:
        v272 = CFSTR("CURATED_COLLECTION_VIEW");
        break;
      case 260:
        v272 = CFSTR("FEATURED_COLLECTIONS");
        break;
      case 261:
        v272 = CFSTR("PUBLISHER_TRAY");
        break;
      case 262:
        v272 = CFSTR("SHARED_CURATED_COLLECTION_VIEW");
        break;
      case 263:
        v272 = CFSTR("CURATED_COLLECTION_NOTIFICATION");
        break;
      case 264:
        v272 = CFSTR("CURATED_COLLECTION_LIST");
        break;
      case 265:
        v272 = CFSTR("PUBLISHER_LIST");
        break;
      case 266:
        v272 = CFSTR("WATCH_CURATED_COLLECTION_VIEW");
        break;
      case 267:
        v272 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST");
        break;
      case 268:
        v272 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST");
        break;
      case 301:
        v272 = CFSTR("ROUTING_TRAY_DRIVING");
        break;
      case 302:
        v272 = CFSTR("ROUTING_TRAY_WALKING");
        break;
      case 303:
        v272 = CFSTR("ROUTING_TRAY_TRANSIT");
        break;
      case 304:
        v272 = CFSTR("ROUTING_TRAY_RIDESHARE");
        break;
      case 305:
        v272 = CFSTR("ROUTING_TRAY_CYCLING");
        break;
      case 306:
        v272 = CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW");
        break;
      case 401:
        v272 = CFSTR("NAV_TRAY_DRIVING");
        break;
      case 402:
        v272 = CFSTR("NAV_TRAY_WALKING");
        break;
      case 403:
        v272 = CFSTR("NAV_TRAY_TRANSIT");
        break;
      case 404:
        v272 = CFSTR("NAV_TRAY_CYCLING");
        break;
      case 501:
        v272 = CFSTR("MAP_PLACECARD");
        break;
      case 502:
        v272 = CFSTR("MAP_SEARCH");
        break;
      case 503:
        v272 = CFSTR("MAP_RESULTS");
        break;
      case 504:
        v272 = CFSTR("MAP_ROUTING");
        break;
      case 505:
        v272 = CFSTR("MAP_NAV");
        break;
      case 506:
        v272 = CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE");
        break;
      case 507:
        v272 = CFSTR("MAP_TRAFFIC_INCIDENT");
        break;
      case 508:
        v272 = CFSTR("MAP_FULL_SCREEN");
        break;
      case 509:
        v272 = CFSTR("MAP_DRIVE");
        break;
      case 510:
        v272 = CFSTR("MAP_LAUNCH_AND_GO");
        break;
      case 511:
        v272 = CFSTR("MAP_VIEW");
        break;
      case 601:
        v272 = CFSTR("MAPS_SETTINGS");
        break;
      case 602:
        v272 = CFSTR("MAPS_PREFERENCES");
        break;
      case 603:
        v272 = CFSTR("RAP");
        break;
      case 604:
        v272 = CFSTR("ROUTING_DRIVING_DETAILS");
        break;
      case 605:
        v272 = CFSTR("ROUTING_WALKING_DETAILS");
        break;
      case 606:
        v272 = CFSTR("ROUTING_TRANSIT_DETAILS");
        break;
      case 607:
        v272 = CFSTR("ROUTING_EDITOR");
        break;
      case 608:
        v272 = CFSTR("NAV_DRIVING_DETAILS");
        break;
      case 609:
        v272 = CFSTR("NAV_WALKING_DETAILS");
        break;
      case 610:
        v272 = CFSTR("NAV_TRANSIT_DETAILS");
        break;
      case 611:
        v272 = CFSTR("NAV_AUDIO_SETTINGS");
        break;
      case 612:
        v272 = CFSTR("PHOTO_VIEWER_ALL");
        break;
      case 613:
        v272 = CFSTR("PHOTO_VIEWER_SINGLE");
        break;
      case 614:
        v272 = CFSTR("ROUTE_OPTIONS_TRANSIT");
        break;
      case 615:
        v272 = CFSTR("TRAFFIC_INCIDENT_TRAY");
        break;
      case 616:
        v272 = CFSTR("NAV_DIRECTIONS_BANNER_DRIVING");
        break;
      case 617:
        v272 = CFSTR("NAV_DIRECTIONS_BANNER_WALKING");
        break;
      case 618:
        v272 = CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT");
        break;
      case 619:
        v272 = CFSTR("REFINE_SEARCH_SUGGESTION_AREA");
        break;
      case 620:
        v272 = CFSTR("ADD_PHOTO_SHEET");
        break;
      case 621:
        v272 = CFSTR("ADD_PLACE_SHEET");
        break;
      case 622:
        v272 = CFSTR("SHARE_SHEET");
        break;
      case 623:
        v272 = CFSTR("EDIT_LOCATION_SHEET");
        break;
      case 624:
        v272 = CFSTR("ADD_CONTACT_SHEET");
        break;
      case 625:
        v272 = CFSTR("EDIT_NAME_SHEET");
        break;
      case 626:
        v272 = CFSTR("DRIVING_NAV_SETTINGS");
        break;
      case 627:
        v272 = CFSTR("TRANSIT_SETTINGS");
        break;
      case 628:
        v272 = CFSTR("TRANSIT_ADVISORY_SHEET");
        break;
      case 629:
        v272 = CFSTR("REMOVE_CAR_SHEET");
        break;
      case 630:
        v272 = CFSTR("ROUTE_OPTIONS_DRIVING");
        break;
      case 631:
        v272 = CFSTR("ROUTE_OPTIONS_DATETIME");
        break;
      case 632:
        v272 = CFSTR("TRANSIT_ADVISORY_BANNER");
        break;
      case 633:
        v272 = CFSTR("BOOK_TABLE_SELECT_TIME");
        break;
      case 634:
        v272 = CFSTR("BOOK_TABLE_MORE_OPTIONS");
        break;
      case 635:
        v272 = CFSTR("BOOK_TABLE_READY");
        break;
      case 636:
        v272 = CFSTR("BOOK_TABLE_BOOKED");
        break;
      case 637:
        v272 = CFSTR("TRANSIT_LINE_CLUSTER_SHEET");
        break;
      case 638:
        v272 = CFSTR("TRANSIT_LINE_LIST_SHEET");
        break;
      case 639:
        v272 = CFSTR("TRANSIT_BALANCE_BANNER");
        break;
      case 640:
        v272 = CFSTR("WEATHER_ICON");
        break;
      case 641:
        v272 = CFSTR("HELP_IMPROVE_MAPS_DIALOG");
        break;
      case 642:
        v272 = CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 643:
        v272 = CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG");
        break;
      case 644:
        v272 = CFSTR("FLOOR_PICKER");
        break;
      case 645:
        v272 = CFSTR("VENUE_LIST");
        break;
      case 646:
        v272 = CFSTR("AR_MODE");
        break;
      case 647:
        v272 = CFSTR("ROUTING_TRANSIT_TICKETS_SHEET");
        break;
      case 648:
        v272 = CFSTR("LINKED_SERVICE_HOURS");
        break;
      case 649:
        v272 = CFSTR("SHARE_ETA_TRAY");
        break;
      case 650:
        v272 = CFSTR("ETA_UPDATE_TRAY");
        break;
      case 651:
        v272 = CFSTR("SCHEDULECARD_TRAY");
        break;
      case 652:
        v272 = CFSTR("AR_NAV");
        break;
      case 653:
        v272 = CFSTR("TAP_TRANSIT_ACCESS_POINT");
        break;
      case 654:
        v272 = CFSTR("LOCATIONS_INSIDE");
        break;
      case 655:
        v272 = CFSTR("SIMILAR_LOCATIONS");
        break;
      case 656:
        v272 = CFSTR("LOCATIONS_AT_ADDRESS");
        break;
      case 657:
        v272 = CFSTR("NAV_DIRECTIONS_BANNER_CYCLING");
        break;
      case 658:
        v272 = CFSTR("ROUTE_OPTIONS_CYCLING");
        break;
      case 659:
        v272 = CFSTR("EV_CONNECTION_TRAY");
        break;
      case 660:
        v272 = CFSTR("VIRTUAL_GARAGE");
        break;
      case 661:
        v272 = CFSTR("VIRTUAL_GARAGE_BANNER");
        break;
      case 662:
        v272 = CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW");
        break;
      case 663:
        v272 = CFSTR("ADVISORY_DETAILS_PAGE");
        break;
      case 664:
        v272 = CFSTR("APP_CLIP_NOTIFICATION");
        break;
      case 665:
        v272 = CFSTR("PHOTO_VIEWER_GALLERY");
        break;
      case 666:
        v272 = CFSTR("RECOMMENDATION_CARD");
        break;
      case 667:
        v272 = CFSTR("INCIDENT_REPORT_TRAY");
        break;
      case 668:
        v272 = CFSTR("MAPS_WIDGET_DISPLAY");
        break;
      case 669:
        v272 = CFSTR("VISUAL_LOCATION_FRAMEWORK");
        break;
      case 670:
        v272 = CFSTR("APP_CLIP_TRAY");
        break;
      case 671:
        v272 = CFSTR("LICENSE_PLATE_SUGGESTION_PAGE");
        break;
      case 672:
        v272 = CFSTR("NOTIFICATION_ADD_PLATE");
        break;
      case 673:
        v272 = CFSTR("MAPS_RESULTS");
        break;
      case 674:
        v272 = CFSTR("MAPS_WIDGET_APP_CONNECTION");
        break;
      case 675:
        v272 = CFSTR("MAPS_WIDGET_CURRENT_LOCATION");
        break;
      case 676:
        v272 = CFSTR("MAPS_WIDGET_CURRENT_NAV");
        break;
      case 677:
        v272 = CFSTR("MAPS_WIDGET_ETA");
        break;
      case 678:
        v272 = CFSTR("MAPS_WIDGET_TRANSIT");
        break;
      case 679:
        v272 = CFSTR("MAPS_WIDGET_UPC_DESTINATION");
        break;
      case 680:
        v272 = CFSTR("WIDGET_CREATION_TRAY");
        break;
      case 681:
        v272 = CFSTR("MAPS_WIDGET_HOME");
        break;
      case 682:
        v272 = CFSTR("MAPS_WIDGET_PARKED_CAR");
        break;
      case 683:
        v272 = CFSTR("MAPS_WIDGET_POI");
        break;
      case 684:
        v272 = CFSTR("MAPS_WIDGET_SCHOOL");
        break;
      case 685:
        v272 = CFSTR("MAPS_WIDGET_WORK");
        break;
      case 686:
        v272 = CFSTR("AIRPORT_NOTIFICATION");
        break;
      case 687:
        v272 = CFSTR("MAPS_WIDGET_EMPTY");
        break;
      case 688:
        v272 = CFSTR("COARSE_LOCATION_OPTIONS_PROMPT");
        break;
      case 689:
        v272 = CFSTR("ALLOW_PRECISE_LOCATION_PROMPT");
        break;
      case 690:
        v272 = CFSTR("SHARE_MY_LOCATION");
        break;
      case 691:
        v272 = CFSTR("MARK_MY_LOCATION");
        break;
      case 692:
        v272 = CFSTR("AIRPORT_NOTIFICATION_WATCH");
        break;
      case 693:
        v272 = CFSTR("EDIT_FAVORITE");
        break;
      case 694:
        v272 = CFSTR("ROUTING_CYCLING_DETAILS");
        break;
      case 695:
        v272 = CFSTR("NAV_CYCLING_DETAILS");
        break;
      case 696:
        v272 = CFSTR("MAPS_SUGGESTION_WIDGET");
        break;
      case 697:
        v272 = CFSTR("ARP_TIPKIT");
        break;
      case 698:
        v272 = CFSTR("ARP_PRIVACY");
        break;
      case 699:
        v272 = CFSTR("ROUTE_OPTIONS_WALKING");
        break;
      case 701:
        v272 = CFSTR("SAFARI_SEARCH");
        break;
      case 702:
        v272 = CFSTR("SPOTLIGHT_SEARCH");
        break;
      case 703:
        v272 = CFSTR("SAFARI_MAPS_SEARCH_RESULTS");
        break;
      case 704:
        v272 = CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS");
        break;
      case 705:
        v272 = CFSTR("WIDGET_MAPS_DESTINATIONS");
        break;
      case 706:
        v272 = CFSTR("WIDGET_MAPS_TRANSIT");
        break;
      case 707:
        v272 = CFSTR("WIDGET_MAPS_NEARBY");
        break;
      case 708:
        v272 = CFSTR("NOTIFICATION_FIND_MY_CAR");
        break;
      case 709:
        v272 = CFSTR("CONTROL_CENTER");
        break;
      case 710:
        v272 = CFSTR("NOTIFICATION_CENTER");
        break;
      case 711:
        v272 = CFSTR("NOTIFICATION_DOOM");
        break;
      case 712:
        v272 = CFSTR("NOTIFICATION_VENUES");
        break;
      case 713:
        v272 = CFSTR("NOTIFICATION_RAP_UPDATE");
        break;
      case 714:
        v272 = CFSTR("NOTIFICATION_TRIP_CANCELLED");
        break;
      case 715:
        v272 = CFSTR("NOTIFICATION_STOP_SKIPPED");
        break;
      case 716:
        v272 = CFSTR("NOTIFICATION_TRIP_DELAYED");
        break;
      case 717:
        v272 = CFSTR("NOTIFICATION_RAP");
        break;
      case 718:
        v272 = CFSTR("NOTIFICATION_PROXY_AUTH");
        break;
      case 719:
        v272 = CFSTR("NOTIFICATION_PUSH_TO_DEVICE");
        break;
      case 720:
        v272 = CFSTR("NOTIFICATION_LOW_FUEL");
        break;
      case 721:
        v272 = CFSTR("NOTIFICATION_FIND_MY_CAR_RESET");
        break;
      case 722:
        v272 = CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS");
        break;
      case 723:
        v272 = CFSTR("NOTIFICATION_SHARED_ETA");
        break;
      case 724:
        v272 = CFSTR("NOTIFICATION_SHARED_ETA_UPDATE");
        break;
      case 725:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN");
        break;
      case 726:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_GENERAL");
        break;
      case 727:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_FLYOVER");
        break;
      case 728:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_TRANSIT");
        break;
      case 729:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_VENUES");
        break;
      case 730:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL");
        break;
      case 731:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE");
        break;
      case 732:
        v272 = CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND");
        break;
      case 733:
        v272 = CFSTR("APP_SHEET");
        break;
      case 734:
        v272 = CFSTR("CZ_ADVISORY_DETAILS_PAGE");
        break;
      case 735:
        v272 = CFSTR("SHARE_ETA_CONTACT_TRAY");
        break;
      case 736:
        v272 = CFSTR("SIRI_SHARE_ETA");
        break;
      case 737:
        v272 = CFSTR("SIRI_SUGGESTION_SHARED_ETA");
        break;
      case 738:
        v272 = CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY");
        break;
      case 739:
        v272 = CFSTR("INCIDENT_ALERT_TRAY");
        break;
      case 740:
        v272 = CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY");
        break;
      case 741:
        v272 = CFSTR("RAP_INCIDENT_REPORT_VIEW");
        break;
      case 742:
        v272 = CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY");
        break;
      case 743:
        v272 = CFSTR("TRAFFIC_ADVISORY_SHEET");
        break;
      case 801:
        v272 = CFSTR("SIRI_PLUGIN_SNIPPET");
        break;
      case 802:
        v272 = CFSTR("SIRI_PLUGIN_COMMAND");
        break;
      case 803:
        v272 = CFSTR("SIRI_SEARCH_RESULT_LIST");
        break;
      case 804:
        v272 = CFSTR("SIRI_DISAMBIGUATION_LIST");
        break;
      case 805:
        v272 = CFSTR("SIRI_PLACE_SNIPPET");
        break;
      default:
        if (v271 != 901)
          goto LABEL_602;
        v272 = CFSTR("CHROME");
        break;
    }
  }
  if (a2)
    v273 = CFSTR("restoreUiTarget");
  else
    v273 = CFSTR("restore_ui_target");
  objc_msgSend(v4, "setObject:forKey:", v272, v273);

LABEL_1085:
  objc_msgSend((id)a1, "mapLaunchSourceAppId");
  v274 = (void *)objc_claimAutoreleasedReturnValue();
  if (v274)
  {
    if (a2)
      v275 = CFSTR("mapLaunchSourceAppId");
    else
      v275 = CFSTR("map_launch_source_app_id");
    objc_msgSend(v4, "setObject:forKey:", v274, v275);
  }

  objc_msgSend((id)a1, "mapLaunchLaunchUri");
  v276 = (void *)objc_claimAutoreleasedReturnValue();
  if (v276)
  {
    if (a2)
      v277 = CFSTR("mapLaunchLaunchUri");
    else
      v277 = CFSTR("map_launch_launch_uri");
    objc_msgSend(v4, "setObject:forKey:", v276, v277);
  }

  objc_msgSend((id)a1, "mapLaunchReferringWebsite");
  v278 = (void *)objc_claimAutoreleasedReturnValue();
  if (v278)
  {
    if (a2)
      v279 = CFSTR("mapLaunchReferringWebsite");
    else
      v279 = CFSTR("map_launch_referring_website");
    objc_msgSend(v4, "setObject:forKey:", v278, v279);
  }

  if ((*(_QWORD *)(a1 + v14[479] + 8) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 686));
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v281 = CFSTR("mapLaunchIsHandoff");
    else
      v281 = CFSTR("map_launch_is_handoff");
    objc_msgSend(v4, "setObject:forKey:", v280, v281);

  }
  objc_msgSend((id)a1, "mapLaunchSourceHandoffDevice");
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  if (v282)
  {
    if (a2)
      v283 = CFSTR("mapLaunchSourceHandoffDevice");
    else
      v283 = CFSTR("map_launch_source_handoff_device");
    objc_msgSend(v4, "setObject:forKey:", v282, v283);
  }

  if ((*(_QWORD *)(a1 + v14[479]) & 0x4000000) != 0)
  {
    v284 = *(int *)(a1 + 568);
    if (v284 >= 0x29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 568));
      v285 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v285 = off_1E1C20108[v284];
    }
    if (a2)
      v286 = CFSTR("mapLaunchAction");
    else
      v286 = CFSTR("map_launch_action");
    objc_msgSend(v4, "setObject:forKey:", v285, v286);

  }
  objc_msgSend((id)a1, "curatedCollectionState");
  v287 = (void *)objc_claimAutoreleasedReturnValue();
  v288 = v287;
  if (v287)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v287, "jsonRepresentation");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      v290 = CFSTR("curatedCollectionState");
    }
    else
    {
      objc_msgSend(v287, "dictionaryRepresentation");
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      v290 = CFSTR("curated_collection_state");
    }
    v291 = v289;

    objc_msgSend(v4, "setObject:forKey:", v291, v290);
  }

  v292 = (uint64_t *)(a1 + v14[479]);
  v293 = v292[1];
  if ((v293 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 689));
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v295 = CFSTR("mapSettingsAvoidHills");
    else
      v295 = CFSTR("map_settings_avoid_hills");
    objc_msgSend(v4, "setObject:forKey:", v294, v295);

    v292 = (uint64_t *)(a1 + 724);
    v293 = *(_QWORD *)(a1 + 732);
  }
  v296 = *v292;
  if ((v293 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 690));
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v304 = CFSTR("mapSettingsAvoidStairs");
    else
      v304 = CFSTR("map_settings_avoid_stairs");
    objc_msgSend(v4, "setObject:forKey:", v303, v304);

    v296 = *(_QWORD *)(a1 + 724);
    v293 = *(_QWORD *)(a1 + 732);
    if ((v293 & 8) == 0)
    {
LABEL_1130:
      if ((v296 & 0x20000000) == 0)
        goto LABEL_1131;
      goto LABEL_1147;
    }
  }
  else if ((v293 & 8) == 0)
  {
    goto LABEL_1130;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 687));
  v305 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v306 = CFSTR("mapSettingsAvoidBusyRoads");
  else
    v306 = CFSTR("map_settings_avoid_busy_roads");
  objc_msgSend(v4, "setObject:forKey:", v305, v306);

  v293 = *(_QWORD *)(a1 + 732);
  if ((*(_QWORD *)(a1 + 724) & 0x20000000) == 0)
  {
LABEL_1131:
    if ((v293 & 0x200) == 0)
      goto LABEL_1136;
    goto LABEL_1132;
  }
LABEL_1147:
  v307 = *(int *)(a1 + 580);
  if (v307 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 580));
    v308 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v308 = off_1E1C20250[v307];
  }
  if (a2)
    v319 = CFSTR("mapSettingsLocationPrecisionType");
  else
    v319 = CFSTR("map_settings_location_precision_type");
  objc_msgSend(v4, "setObject:forKey:", v308, v319);

  if ((*(_QWORD *)(a1 + v14[479] + 8) & 0x200) != 0)
  {
LABEL_1132:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 693));
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v298 = CFSTR("mapSettingsEBike");
    else
      v298 = CFSTR("map_settings_e_bike");
    objc_msgSend(v4, "setObject:forKey:", v297, v298);

  }
LABEL_1136:
  objc_msgSend((id)a1, "ugcPhotoState");
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v300 = v299;
  if (v299)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v299, "jsonRepresentation");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v302 = CFSTR("ugcPhotoState");
    }
    else
    {
      objc_msgSend(v299, "dictionaryRepresentation");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v302 = CFSTR("ugc_photo_state");
    }
    v309 = v301;

    objc_msgSend(v4, "setObject:forKey:", v309, v302);
  }

  objc_msgSend((id)a1, "metroRegion");
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  if (v310)
  {
    if (a2)
      v311 = CFSTR("metroRegion");
    else
      v311 = CFSTR("metro_region");
    objc_msgSend(v4, "setObject:forKey:", v310, v311);
  }

  objc_msgSend((id)a1, "userHomeMetro");
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  if (v312)
  {
    if (a2)
      v313 = CFSTR("userHomeMetro");
    else
      v313 = CFSTR("user_home_metro");
    objc_msgSend(v4, "setObject:forKey:", v312, v313);
  }

  objc_msgSend((id)a1, "userHomeCountry");
  v314 = (void *)objc_claimAutoreleasedReturnValue();
  if (v314)
  {
    if (a2)
      v315 = CFSTR("userHomeCountry");
    else
      v315 = CFSTR("user_home_country");
    objc_msgSend(v4, "setObject:forKey:", v314, v315);
  }

  v316 = *(_QWORD *)(a1 + v14[479]);
  if ((v316 & 0x10000000) != 0)
  {
    v317 = *(int *)(a1 + 576);
    if (v317 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 576));
      v318 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v318 = off_1E1C20270[v317];
    }
    if (a2)
      v320 = CFSTR("mapSettingsDrivingVoiceSettings");
    else
      v320 = CFSTR("map_settings_driving_voice_settings");
    objc_msgSend(v4, "setObject:forKey:", v318, v320);

    v316 = *(_QWORD *)(a1 + v14[479]);
    if ((v316 & 0x100000000) == 0)
    {
LABEL_1168:
      if ((v316 & 0x8000000) == 0)
        goto LABEL_1197;
      goto LABEL_1190;
    }
  }
  else if ((v316 & 0x100000000) == 0)
  {
    goto LABEL_1168;
  }
  v321 = *(int *)(a1 + 592);
  if (v321 >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 592));
    v322 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v322 = off_1E1C20270[v321];
  }
  if (a2)
    v323 = CFSTR("mapSettingsWalkingVoiceSettings");
  else
    v323 = CFSTR("map_settings_walking_voice_settings");
  objc_msgSend(v4, "setObject:forKey:", v322, v323);

  if ((*(_QWORD *)(a1 + v14[479]) & 0x8000000) != 0)
  {
LABEL_1190:
    v324 = *(int *)(a1 + 572);
    if (v324 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 572));
      v325 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v325 = off_1E1C20270[v324];
    }
    if (a2)
      v326 = CFSTR("mapSettingsCyclingVoiceSettings");
    else
      v326 = CFSTR("map_settings_cycling_voice_settings");
    objc_msgSend(v4, "setObject:forKey:", v325, v326);

  }
LABEL_1197:
  objc_msgSend((id)a1, "account");
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  v328 = v327;
  if (v327)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v327, "jsonRepresentation");
    else
      objc_msgSend(v327, "dictionaryRepresentation");
    v329 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v329, CFSTR("account"));
  }

  v330 = (uint64_t *)(a1 + v14[479]);
  v331 = *v330;
  if ((*v330 & 0x400000) == 0)
  {
    v332 = v330[1];
    if ((v331 & 0x800000) == 0)
      goto LABEL_1213;
    goto LABEL_1209;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 552));
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v334 = CFSTR("mapFeaturePersonalCollectionsCount");
  else
    v334 = CFSTR("map_feature_personal_collections_count");
  objc_msgSend(v4, "setObject:forKey:", v333, v334);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x800000) != 0)
  {
LABEL_1209:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 556));
    v335 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v336 = CFSTR("mapFeatureSavedCollectionsCount");
    else
      v336 = CFSTR("map_feature_saved_collections_count");
    objc_msgSend(v4, "setObject:forKey:", v335, v336);

    v331 = *(_QWORD *)(a1 + 724);
    v332 = *(_QWORD *)(a1 + 732);
  }
LABEL_1213:
  if ((v331 & 0x2000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 564));
    v343 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v344 = CFSTR("mapFeatureSubmittedRatingsCount");
    else
      v344 = CFSTR("map_feature_submitted_ratings_count");
    objc_msgSend(v4, "setObject:forKey:", v343, v344);

    v331 = *(_QWORD *)(a1 + 724);
    v332 = *(_QWORD *)(a1 + 732);
    if ((v331 & 0x1000000) == 0)
    {
LABEL_1215:
      if ((v331 & 0x8000) == 0)
        goto LABEL_1216;
      goto LABEL_1243;
    }
  }
  else if ((v331 & 0x1000000) == 0)
  {
    goto LABEL_1215;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 560));
  v345 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v346 = CFSTR("mapFeatureSubmittedPhotosCount");
  else
    v346 = CFSTR("map_feature_submitted_photos_count");
  objc_msgSend(v4, "setObject:forKey:", v345, v346);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x8000) == 0)
  {
LABEL_1216:
    if ((v331 & 0x200000) == 0)
      goto LABEL_1217;
    goto LABEL_1247;
  }
LABEL_1243:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 524));
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v348 = CFSTR("mapFeatureElectronicVehicleCount");
  else
    v348 = CFSTR("map_feature_electronic_vehicle_count");
  objc_msgSend(v4, "setObject:forKey:", v347, v348);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x200000) == 0)
  {
LABEL_1217:
    if ((v332 & 0x200000000) == 0)
      goto LABEL_1218;
    goto LABEL_1251;
  }
LABEL_1247:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 548));
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v350 = CFSTR("mapFeatureLicensePlateCount");
  else
    v350 = CFSTR("map_feature_license_plate_count");
  objc_msgSend(v4, "setObject:forKey:", v349, v350);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v332 & 0x200000000) == 0)
  {
LABEL_1218:
    if ((v331 & 0x4000000000000000) == 0)
      goto LABEL_1219;
    goto LABEL_1255;
  }
LABEL_1251:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 717));
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v352 = CFSTR("suggestionsSiriEnabled");
  else
    v352 = CFSTR("suggestions_siri_enabled");
  objc_msgSend(v4, "setObject:forKey:", v351, v352);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x4000000000000000) == 0)
  {
LABEL_1219:
    if ((v332 & 2) == 0)
      goto LABEL_1220;
    goto LABEL_1259;
  }
LABEL_1255:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 682));
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v354 = CFSTR("mapFeatureIsHomeFavoriteSet");
  else
    v354 = CFSTR("map_feature_is_home_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v353, v354);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v332 & 2) == 0)
  {
LABEL_1220:
    if ((v331 & 0x8000000000000000) == 0)
      goto LABEL_1221;
    goto LABEL_1263;
  }
LABEL_1259:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 685));
  v355 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v356 = CFSTR("mapFeatureIsWorkFavoriteSet");
  else
    v356 = CFSTR("map_feature_is_work_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v355, v356);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x8000000000000000) == 0)
  {
LABEL_1221:
    if ((v332 & 1) == 0)
      goto LABEL_1222;
    goto LABEL_1267;
  }
LABEL_1263:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 683));
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v358 = CFSTR("mapFeatureIsSchoolFavoriteSet");
  else
    v358 = CFSTR("map_feature_is_school_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v357, v358);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v332 & 1) == 0)
  {
LABEL_1222:
    if ((v331 & 0x10000) == 0)
      goto LABEL_1223;
    goto LABEL_1271;
  }
LABEL_1267:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 684));
  v359 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v360 = CFSTR("mapFeatureIsTransitFavoriteSet");
  else
    v360 = CFSTR("map_feature_is_transit_favorite_set");
  objc_msgSend(v4, "setObject:forKey:", v359, v360);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x10000) == 0)
  {
LABEL_1223:
    if ((v331 & 0x100000) == 0)
      goto LABEL_1224;
    goto LABEL_1275;
  }
LABEL_1271:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 528));
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v362 = CFSTR("mapFeatureFavoritesCount");
  else
    v362 = CFSTR("map_feature_favorites_count");
  objc_msgSend(v4, "setObject:forKey:", v361, v362);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x100000) == 0)
  {
LABEL_1224:
    if ((v331 & 0x80000) == 0)
      goto LABEL_1225;
    goto LABEL_1279;
  }
LABEL_1275:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 544));
  v363 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v364 = CFSTR("mapFeatureLibrarySavedPlacesCount");
  else
    v364 = CFSTR("map_feature_library_saved_places_count");
  objc_msgSend(v4, "setObject:forKey:", v363, v364);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x80000) == 0)
  {
LABEL_1225:
    if ((v331 & 0x40000) == 0)
      goto LABEL_1226;
    goto LABEL_1283;
  }
LABEL_1279:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 540));
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v366 = CFSTR("mapFeatureLibraryPlacesWithNoteCount");
  else
    v366 = CFSTR("map_feature_library_places_with_note_count");
  objc_msgSend(v4, "setObject:forKey:", v365, v366);

  v331 = *(_QWORD *)(a1 + 724);
  v332 = *(_QWORD *)(a1 + 732);
  if ((v331 & 0x40000) == 0)
  {
LABEL_1226:
    if ((v331 & 0x20000) == 0)
      goto LABEL_1227;
LABEL_1287:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 532));
    v369 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v370 = CFSTR("mapFeatureLibraryFavoritesGuideSavedPlacesCount");
    else
      v370 = CFSTR("map_feature_library_favorites_guide_saved_places_count");
    objc_msgSend(v4, "setObject:forKey:", v369, v370);

    if ((*(_QWORD *)(a1 + 732) & 0x4000) == 0)
      goto LABEL_1232;
    goto LABEL_1228;
  }
LABEL_1283:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 536));
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v368 = CFSTR("mapFeatureLibraryGuidesSavedPlacesCount");
  else
    v368 = CFSTR("map_feature_library_guides_saved_places_count");
  objc_msgSend(v4, "setObject:forKey:", v367, v368);

  v332 = *(_QWORD *)(a1 + 732);
  if ((*(_QWORD *)(a1 + 724) & 0x20000) != 0)
    goto LABEL_1287;
LABEL_1227:
  if ((v332 & 0x4000) != 0)
  {
LABEL_1228:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 698));
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v338 = CFSTR("mapSettingsNotificationsEnabled");
    else
      v338 = CFSTR("map_settings_notifications_enabled");
    objc_msgSend(v4, "setObject:forKey:", v337, v338);

  }
LABEL_1232:
  objc_msgSend((id)a1, "searchResultsState");
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  v340 = v339;
  if (v339)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v339, "jsonRepresentation");
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      v342 = CFSTR("searchResultsState");
    }
    else
    {
      objc_msgSend(v339, "dictionaryRepresentation");
      v341 = (void *)objc_claimAutoreleasedReturnValue();
      v342 = CFSTR("search_results_state");
    }
    v371 = v341;

    objc_msgSend(v4, "setObject:forKey:", v371, v342);
  }

  objc_msgSend((id)a1, "impressionObjectState");
  v372 = (void *)objc_claimAutoreleasedReturnValue();
  v373 = v372;
  if (v372)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v372, "jsonRepresentation");
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      v375 = CFSTR("impressionObjectState");
    }
    else
    {
      objc_msgSend(v372, "dictionaryRepresentation");
      v374 = (void *)objc_claimAutoreleasedReturnValue();
      v375 = CFSTR("impression_object_state");
    }
    v376 = v374;

    objc_msgSend(v4, "setObject:forKey:", v376, v375);
  }

  objc_msgSend((id)a1, "tapEventState");
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  v378 = v377;
  if (v377)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v377, "jsonRepresentation");
      v379 = (void *)objc_claimAutoreleasedReturnValue();
      v380 = CFSTR("tapEventState");
    }
    else
    {
      objc_msgSend(v377, "dictionaryRepresentation");
      v379 = (void *)objc_claimAutoreleasedReturnValue();
      v380 = CFSTR("tap_event_state");
    }
    v381 = v379;

    objc_msgSend(v4, "setObject:forKey:", v381, v380);
  }

  objc_msgSend((id)a1, "actionButtonDetailsState");
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  v383 = v382;
  if (v382)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v382, "jsonRepresentation");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      v385 = CFSTR("actionButtonDetailsState");
    }
    else
    {
      objc_msgSend(v382, "dictionaryRepresentation");
      v384 = (void *)objc_claimAutoreleasedReturnValue();
      v385 = CFSTR("action_button_details_state");
    }
    v386 = v384;

    objc_msgSend(v4, "setObject:forKey:", v386, v385);
  }

  objc_msgSend((id)a1, "photoSubmissionDetailsState");
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v388 = v387;
  if (v387)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v387, "jsonRepresentation");
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      v390 = CFSTR("photoSubmissionDetailsState");
    }
    else
    {
      objc_msgSend(v387, "dictionaryRepresentation");
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      v390 = CFSTR("photo_submission_details_state");
    }
    v391 = v389;

    objc_msgSend(v4, "setObject:forKey:", v391, v390);
  }

  objc_msgSend((id)a1, "ratingSubmissionDetailsState");
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v393 = v392;
  if (v392)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v392, "jsonRepresentation");
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      v395 = CFSTR("ratingSubmissionDetailsState");
    }
    else
    {
      objc_msgSend(v392, "dictionaryRepresentation");
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      v395 = CFSTR("rating_submission_details_state");
    }
    v396 = v394;

    objc_msgSend(v4, "setObject:forKey:", v396, v395);
  }

  objc_msgSend((id)a1, "ratingPhotoSubmissionDetailsState");
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v398 = v397;
  if (v397)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v397, "jsonRepresentation");
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      v400 = CFSTR("ratingPhotoSubmissionDetailsState");
    }
    else
    {
      objc_msgSend(v397, "dictionaryRepresentation");
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      v400 = CFSTR("rating_photo_submission_details_state");
    }
    v401 = v399;

    objc_msgSend(v4, "setObject:forKey:", v401, v400);
  }

  objc_msgSend((id)a1, "mapsPlaceIdsState");
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v403 = v402;
  if (v402)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v402, "jsonRepresentation");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      v405 = CFSTR("mapsPlaceIdsState");
    }
    else
    {
      objc_msgSend(v402, "dictionaryRepresentation");
      v404 = (void *)objc_claimAutoreleasedReturnValue();
      v405 = CFSTR("maps_place_ids_state");
    }
    v406 = v404;

    objc_msgSend(v4, "setObject:forKey:", v406, v405);
  }

  if ((*(_QWORD *)(a1 + v14[479]) & 0x20000000000000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 673));
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v408 = CFSTR("isInternalTool");
    else
      v408 = CFSTR("is_internal_tool");
    objc_msgSend(v4, "setObject:forKey:", v407, v408);

  }
  v409 = v4;

  return v409;
}

- (id)jsonRepresentation
{
  return -[GEOAnalyticsPipelineStateData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOAnalyticsPipelineStateData)initWithDictionary:(id)a3
{
  return (GEOAnalyticsPipelineStateData *)-[GEOAnalyticsPipelineStateData _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
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
  GEOCarInfo *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  GEOMapRegion *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  id v56;
  uint64_t v57;
  const __CFString *v58;
  void *v59;
  id v60;
  uint64_t v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  void *v71;
  const __CFString *v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  const __CFString *v76;
  void *v77;
  const __CFString *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  const __CFString *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  id v90;
  uint64_t v91;
  const __CFString *v92;
  void *v93;
  id v94;
  uint64_t v95;
  const __CFString *v96;
  void *v97;
  const __CFString *v98;
  void *v99;
  const __CFString *v100;
  void *v101;
  const __CFString *v102;
  void *v103;
  id v104;
  uint64_t v105;
  const __CFString *v106;
  void *v107;
  const __CFString *v108;
  void *v109;
  const __CFString *v110;
  void *v111;
  id v112;
  uint64_t v113;
  const __CFString *v114;
  void *v115;
  const __CFString *v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  const __CFString *v120;
  void *v121;
  const __CFString *v122;
  void *v123;
  const __CFString *v124;
  void *v125;
  const __CFString *v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  GEOLocation *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  const __CFString *v135;
  void *v136;
  const __CFString *v137;
  void *v138;
  const __CFString *v139;
  void *v140;
  const __CFString *v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  const __CFString *v145;
  void *v146;
  const __CFString *v147;
  void *v148;
  GEOLogMsgStatePlaceCard *v149;
  uint64_t v150;
  void *v151;
  const __CFString *v152;
  void *v153;
  id v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t i;
  void *v159;
  const __CFString *v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t j;
  void *v167;
  const __CFString *v168;
  void *v169;
  void *v170;
  const __CFString *v171;
  void *v172;
  id v173;
  uint64_t v174;
  const __CFString *v175;
  void *v176;
  const __CFString *v177;
  void *v178;
  void *v179;
  const __CFString *v180;
  void *v181;
  const __CFString *v182;
  void *v183;
  const __CFString *v184;
  void *v185;
  void *v186;
  const __CFString *v187;
  void *v188;
  void *v189;
  const __CFString *v190;
  void *v191;
  const __CFString *v192;
  void *v193;
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
  void *v205;
  const __CFString *v206;
  void *v207;
  void *v208;
  const __CFString *v209;
  void *v210;
  void *v211;
  const __CFString *v212;
  void *v213;
  id v214;
  uint64_t v215;
  const __CFString *v216;
  void *v217;
  void *v218;
  const __CFString *v219;
  void *v220;
  void *v221;
  const __CFString *v222;
  void *v223;
  const __CFString *v224;
  void *v225;
  id v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t k;
  uint64_t v231;
  GEORevealedPlaceCardModule *v232;
  uint64_t v233;
  void *v234;
  const __CFString *v235;
  void *v236;
  const __CFString *v237;
  void *v238;
  const __CFString *v239;
  void *v240;
  const __CFString *v241;
  void *v242;
  void *v243;
  const __CFString *v244;
  void *v245;
  id v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t m;
  uint64_t v251;
  void *v252;
  const __CFString *v253;
  void *v254;
  GEOMapsServerMetadata *v255;
  uint64_t v256;
  void *v257;
  const __CFString *v258;
  void *v259;
  GEORouteDetails *v260;
  uint64_t v261;
  void *v262;
  const __CFString *v263;
  void *v264;
  GEOLogMsgEventPredExTrainingData *v265;
  uint64_t v266;
  void *v267;
  const __CFString *v268;
  void *v269;
  const __CFString *v270;
  void *v271;
  id v272;
  uint64_t v273;
  const __CFString *v274;
  void *v275;
  const __CFString *v276;
  void *v277;
  void *v278;
  const __CFString *v279;
  void *v280;
  id v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t n;
  uint64_t v286;
  GEOAutoCompleteResultInfo *v287;
  uint64_t v288;
  void *v289;
  void *v290;
  const __CFString *v291;
  void *v292;
  id v293;
  uint64_t v294;
  const __CFString *v295;
  void *v296;
  id v297;
  uint64_t v298;
  const __CFString *v299;
  void *v300;
  id v301;
  uint64_t v302;
  const __CFString *v303;
  void *v304;
  void *v305;
  const __CFString *v306;
  void *v307;
  void *v308;
  const __CFString *v309;
  void *v310;
  void *v311;
  const __CFString *v312;
  void *v313;
  const __CFString *v314;
  void *v315;
  void *v316;
  const __CFString *v317;
  void *v318;
  id v319;
  uint64_t v320;
  const __CFString *v321;
  void *v322;
  GEOLogMsgStateCuratedCollection *v323;
  uint64_t v324;
  void *v325;
  const __CFString *v326;
  void *v327;
  const __CFString *v328;
  void *v329;
  const __CFString *v330;
  void *v331;
  const __CFString *v332;
  void *v333;
  id v334;
  uint64_t v335;
  const __CFString *v336;
  void *v337;
  const __CFString *v338;
  void *v339;
  GEOLogMsgStateUGCPhoto *v340;
  uint64_t v341;
  void *v342;
  const __CFString *v343;
  void *v344;
  void *v345;
  const __CFString *v346;
  void *v347;
  void *v348;
  const __CFString *v349;
  void *v350;
  void *v351;
  const __CFString *v352;
  void *v353;
  id v354;
  uint64_t v355;
  const __CFString *v356;
  void *v357;
  id v358;
  uint64_t v359;
  const __CFString *v360;
  void *v361;
  id v362;
  uint64_t v363;
  void *v364;
  GEOLogMsgStateAccount *v365;
  uint64_t v366;
  void *v367;
  const __CFString *v368;
  void *v369;
  const __CFString *v370;
  void *v371;
  const __CFString *v372;
  void *v373;
  const __CFString *v374;
  void *v375;
  const __CFString *v376;
  void *v377;
  const __CFString *v378;
  void *v379;
  const __CFString *v380;
  void *v381;
  const __CFString *v382;
  void *v383;
  const __CFString *v384;
  void *v385;
  const __CFString *v386;
  void *v387;
  const __CFString *v388;
  void *v389;
  const __CFString *v390;
  void *v391;
  const __CFString *v392;
  void *v393;
  const __CFString *v394;
  void *v395;
  const __CFString *v396;
  void *v397;
  const __CFString *v398;
  void *v399;
  const __CFString *v400;
  void *v401;
  const __CFString *v402;
  void *v403;
  GEOLogMsgStateSearchResults *v404;
  uint64_t v405;
  void *v406;
  const __CFString *v407;
  void *v408;
  GEOLogMsgStateImpressionObject *v409;
  uint64_t v410;
  void *v411;
  const __CFString *v412;
  void *v413;
  GEOLogMsgStateTapEvent *v414;
  uint64_t v415;
  void *v416;
  const __CFString *v417;
  void *v418;
  GEOLogMsgStateActionButtonDetails *v419;
  uint64_t v420;
  void *v421;
  const __CFString *v422;
  void *v423;
  GEOLogMsgStateARPPhotoSubmission *v424;
  uint64_t v425;
  void *v426;
  const __CFString *v427;
  void *v428;
  GEOLogMsgStateARPRatingSubmission *v429;
  uint64_t v430;
  void *v431;
  const __CFString *v432;
  void *v433;
  GEOLogMsgStateARPRatingPhotoSubmission *v434;
  uint64_t v435;
  void *v436;
  const __CFString *v437;
  void *v438;
  GEOLogMsgStateMapsPlaceIds *v439;
  uint64_t v440;
  void *v441;
  const __CFString *v442;
  void *v443;
  void *v445;
  void *v446;
  id v447;
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
  _BYTE v468[128];
  _BYTE v469[128];
  _BYTE v470[128];
  _BYTE v471[128];
  _BYTE v472[128];
  uint64_t v473;

  v473 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_2195;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_2195;
  if (a3)
    v6 = CFSTR("deviceInputLocale");
  else
    v6 = CFSTR("device_input_locale");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(a1, "setDeviceInputLocale:", v8);

  }
  if (a3)
    v9 = CFSTR("deviceOutputLocale");
  else
    v9 = CFSTR("device_output_locale");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setDeviceOutputLocale:", v11);

  }
  if (a3)
    v12 = CFSTR("carPlayInfo");
  else
    v12 = CFSTR("car_play_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOCarInfo alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOCarInfo initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOCarInfo initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setCarPlayInfo:", v15);

  }
  if (a3)
    v17 = CFSTR("rideBookingAppInstalled");
  else
    v17 = CFSTR("ride_booking_app_installed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRideBookingAppInstalled:", objc_msgSend(v18, "BOOLValue"));

  if (a3)
    v19 = CFSTR("rideBookingAppEnabled");
  else
    v19 = CFSTR("ride_booking_app_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRideBookingAppEnabled:", objc_msgSend(v20, "BOOLValue"));

  if (a3)
    v21 = CFSTR("tableBookingAppInstalled");
  else
    v21 = CFSTR("table_booking_app_installed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTableBookingAppInstalled:", objc_msgSend(v22, "BOOLValue"));

  if (a3)
    v23 = CFSTR("tableBookingAppEnabled");
  else
    v23 = CFSTR("table_booking_app_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setTableBookingAppEnabled:", objc_msgSend(v24, "BOOLValue"));

  if (a3)
    v25 = CFSTR("mapViewZoomLevel");
  else
    v25 = CFSTR("map_view_zoom_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(a1, "setMapViewZoomLevel:");
  }

  if (a3)
    v27 = CFSTR("mapViewMapRegion");
  else
    v27 = CFSTR("map_view_map_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = [GEOMapRegion alloc];
    if ((a3 & 1) != 0)
      v30 = -[GEOMapRegion initWithJSON:](v29, "initWithJSON:", v28);
    else
      v30 = -[GEOMapRegion initWithDictionary:](v29, "initWithDictionary:", v28);
    v31 = (void *)v30;
    objc_msgSend(a1, "setMapViewMapRegion:", v30);

  }
  if (a3)
    v32 = CFSTR("mapViewMapType");
  else
    v32 = CFSTR("map_view_map_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v35 = 0;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v35 = 2;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v35 = 3;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")))
    {
      v35 = 4;
    }
    else
    {
      v35 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_73;
    v35 = objc_msgSend(v33, "intValue");
  }
  objc_msgSend(a1, "setMapViewMapType:", v35);
LABEL_73:

  if (a3)
    v36 = CFSTR("mapViewStyleZoomLevel");
  else
    v36 = CFSTR("map_view_style_zoom_level");
  objc_msgSend(v5, "objectForKeyedSubscript:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v37, "doubleValue");
    objc_msgSend(a1, "setMapViewStyleZoomLevel:");
  }

  if (a3)
    v38 = CFSTR("mapViewPitch");
  else
    v38 = CFSTR("map_view_pitch");
  objc_msgSend(v5, "objectForKeyedSubscript:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v39, "doubleValue");
    objc_msgSend(a1, "setMapViewPitch:");
  }

  if (a3)
    v40 = CFSTR("mapViewIsAdvancedMap");
  else
    v40 = CFSTR("map_view_is_advanced_map");
  objc_msgSend(v5, "objectForKeyedSubscript:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapViewIsAdvancedMap:", objc_msgSend(v41, "BOOLValue"));

  if (a3)
    v42 = CFSTR("mapViewIsGlobeProjection");
  else
    v42 = CFSTR("map_view_is_globe_projection");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapViewIsGlobeProjection:", objc_msgSend(v43, "BOOLValue"));

  if (a3)
    v44 = CFSTR("mapViewViewMode");
  else
    v44 = CFSTR("map_view_view_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v46 = v45;
    if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_NONE")) & 1) != 0)
    {
      v47 = 0;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_STANDARD")) & 1) != 0)
    {
      v47 = 1;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE")) & 1) != 0)
    {
      v47 = 2;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID")) & 1) != 0)
    {
      v47 = 3;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_TRANSIT")) & 1) != 0)
    {
      v47 = 4;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_TERRAIN")) & 1) != 0)
    {
      v47 = 5;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_HYBRID_FLYOVER")) & 1) != 0)
    {
      v47 = 6;
    }
    else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_SATELLITE_FLYOVER")) & 1) != 0)
    {
      v47 = 7;
    }
    else if (objc_msgSend(v46, "isEqualToString:", CFSTR("MAP_TYPE_DRIVING")))
    {
      v47 = 8;
    }
    else
    {
      v47 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_120;
    v47 = objc_msgSend(v45, "intValue");
  }
  objc_msgSend(a1, "setMapViewViewMode:", v47);
LABEL_120:

  if (a3)
    v48 = CFSTR("mapViewLocationIsTourist");
  else
    v48 = CFSTR("map_view_location_is_tourist");
  objc_msgSend(v5, "objectForKeyedSubscript:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapViewLocationIsTourist:", objc_msgSend(v49, "BOOLValue"));

  if (a3)
    v50 = CFSTR("mapViewLocationTouristTimestamp");
  else
    v50 = CFSTR("map_view_location_tourist_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v51, "doubleValue");
    objc_msgSend(a1, "setMapViewLocationTouristTimestamp:");
  }

  if (a3)
    v52 = CFSTR("mapViewLocationPuckInViewport");
  else
    v52 = CFSTR("map_view_location_puck_in_viewport");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapViewLocationPuckInViewport:", objc_msgSend(v53, "BOOLValue"));

  if (a3)
    v54 = CFSTR("mapSettingsNavVolume");
  else
    v54 = CFSTR("map_settings_nav_volume");
  objc_msgSend(v5, "objectForKeyedSubscript:", v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v56 = v55;
    if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_UNKNOWN")) & 1) != 0)
    {
      v57 = 0;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_NO")) & 1) != 0)
    {
      v57 = 1;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_LOW")) & 1) != 0)
    {
      v57 = 2;
    }
    else if ((objc_msgSend(v56, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_NORMAL")) & 1) != 0)
    {
      v57 = 3;
    }
    else if (objc_msgSend(v56, "isEqualToString:", CFSTR("AP_NAVVOICEVOLUME_LOUD")))
    {
      v57 = 4;
    }
    else
    {
      v57 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_154;
    v57 = objc_msgSend(v55, "intValue");
  }
  objc_msgSend(a1, "setMapSettingsNavVolume:", v57);
LABEL_154:

  if (a3)
    v58 = CFSTR("mapSettingsTransportMode");
  else
    v58 = CFSTR("map_settings_transport_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v58);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v60 = v59;
    if ((objc_msgSend(v60, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_UNKNOWN_TRANSPORT")) & 1) != 0)
    {
      v61 = 0;
    }
    else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_DRIVING")) & 1) != 0)
    {
      v61 = 1;
    }
    else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_WALKING")) & 1) != 0)
    {
      v61 = 2;
    }
    else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_TRANSIT")) & 1) != 0)
    {
      v61 = 3;
    }
    else if ((objc_msgSend(v60, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_RIDESHARE")) & 1) != 0)
    {
      v61 = 4;
    }
    else if (objc_msgSend(v60, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_CYCLING")))
    {
      v61 = 5;
    }
    else
    {
      v61 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_175;
    v61 = objc_msgSend(v59, "intValue");
  }
  objc_msgSend(a1, "setMapSettingsTransportMode:", v61);
LABEL_175:

  if (a3)
    v62 = CFSTR("mapSettingsAvoidHighways");
  else
    v62 = CFSTR("map_settings_avoid_highways");
  objc_msgSend(v5, "objectForKeyedSubscript:", v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsAvoidHighways:", objc_msgSend(v63, "BOOLValue"));

  if (a3)
    v64 = CFSTR("mapSettingsAvoidTolls");
  else
    v64 = CFSTR("map_settings_avoid_tolls");
  objc_msgSend(v5, "objectForKeyedSubscript:", v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsAvoidTolls:", objc_msgSend(v65, "BOOLValue"));

  if (a3)
    v66 = CFSTR("mapSettingsFindMyCarEnabled");
  else
    v66 = CFSTR("map_settings_find_my_car_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsFindMyCarEnabled:", objc_msgSend(v67, "BOOLValue"));

  if (a3)
    v68 = CFSTR("mapSettingsHeadingEnabled");
  else
    v68 = CFSTR("map_settings_heading_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsHeadingEnabled:", objc_msgSend(v69, "BOOLValue"));

  if (a3)
    v70 = CFSTR("mapSettingsLabelEnabled");
  else
    v70 = CFSTR("map_settings_label_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsLabelEnabled:", objc_msgSend(v71, "BOOLValue"));

  if (a3)
    v72 = CFSTR("mapSettingsPauseSpokenAudioEnabled");
  else
    v72 = CFSTR("map_settings_pause_spoken_audio_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsPauseSpokenAudioEnabled:", objc_msgSend(v73, "BOOLValue"));

  if (a3)
    v74 = CFSTR("mapSettingsSpeedLimitEnabled");
  else
    v74 = CFSTR("map_settings_speed_limit_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsSpeedLimitEnabled:", objc_msgSend(v75, "BOOLValue"));

  if (a3)
    v76 = CFSTR("mapSettingsTrafficEnabled");
  else
    v76 = CFSTR("map_settings_traffic_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v76);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsTrafficEnabled:", objc_msgSend(v77, "BOOLValue"));

  if (a3)
    v78 = CFSTR("mapSettingsIsHandsFreeProfileEnabled");
  else
    v78 = CFSTR("map_settings_is_hands_free_profile_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsIsHandsFreeProfileEnabled:", objc_msgSend(v79, "BOOLValue"));

  if (a3)
    v80 = CFSTR("mapSettingsWalkingAvoidHills");
  else
    v80 = CFSTR("map_settings_walking_avoid_hills");
  objc_msgSend(v5, "objectForKeyedSubscript:", v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsWalkingAvoidHills:", objc_msgSend(v81, "BOOLValue"));

  if (a3)
    v82 = CFSTR("mapSettingsWalkingAvoidBusyRoads");
  else
    v82 = CFSTR("map_settings_walking_avoid_busy_roads");
  objc_msgSend(v5, "objectForKeyedSubscript:", v82);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsWalkingAvoidBusyRoads:", objc_msgSend(v83, "BOOLValue"));

  if (a3)
    v84 = CFSTR("mapSettingsWalkingAvoidStairs");
  else
    v84 = CFSTR("map_settings_walking_avoid_stairs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsWalkingAvoidStairs:", objc_msgSend(v85, "BOOLValue"));

  if (a3)
    v86 = CFSTR("mapSettingsDirectionsWakeDevice");
  else
    v86 = CFSTR("map_settings_directions_wake_device");
  objc_msgSend(v5, "objectForKeyedSubscript:", v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsDirectionsWakeDevice:", objc_msgSend(v87, "BOOLValue"));

  if (a3)
    v88 = CFSTR("mapUiLayoutInfo");
  else
    v88 = CFSTR("map_ui_layout_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v90 = v89;
    if ((objc_msgSend(v90, "isEqualToString:", CFSTR("AP_LAYOUT_UNKNOWN")) & 1) != 0)
    {
      v91 = 0;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("AP_LAYOUT_MINI")) & 1) != 0)
    {
      v91 = 1;
    }
    else if ((objc_msgSend(v90, "isEqualToString:", CFSTR("AP_LAYOUT_PARTIAL")) & 1) != 0)
    {
      v91 = 2;
    }
    else if (objc_msgSend(v90, "isEqualToString:", CFSTR("AP_LAYOUT_FULL")))
    {
      v91 = 3;
    }
    else
    {
      v91 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_257;
    v91 = objc_msgSend(v89, "intValue");
  }
  objc_msgSend(a1, "setMapUiLayoutInfo:", v91);
LABEL_257:

  if (a3)
    v92 = CFSTR("mapUiLayoutStyle");
  else
    v92 = CFSTR("map_ui_layout_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v92);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v94 = v93;
    if ((objc_msgSend(v94, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_UNKNOWN")) & 1) != 0)
    {
      v95 = 0;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD")) & 1) != 0)
    {
      v95 = 1;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_COMPACT")) & 1) != 0)
    {
      v95 = 2;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_SIDE_BAR")) & 1) != 0)
    {
      v95 = 3;
    }
    else if ((objc_msgSend(v94, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_FLOATING")) & 1) != 0)
    {
      v95 = 4;
    }
    else if (objc_msgSend(v94, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD_SIDE")))
    {
      v95 = 5;
    }
    else
    {
      v95 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_278;
    v95 = objc_msgSend(v93, "intValue");
  }
  objc_msgSend(a1, "setMapUiLayoutStyle:", v95);
LABEL_278:

  if (a3)
    v96 = CFSTR("mapUiNumberOfTabsOpen");
  else
    v96 = CFSTR("map_ui_number_of_tabs_open");
  objc_msgSend(v5, "objectForKeyedSubscript:", v96);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapUiNumberOfTabsOpen:", objc_msgSend(v97, "unsignedIntValue"));

  if (a3)
    v98 = CFSTR("mapUiCurrentTabIndex");
  else
    v98 = CFSTR("map_ui_current_tab_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapUiCurrentTabIndex:", objc_msgSend(v99, "unsignedIntValue"));

  if (a3)
    v100 = CFSTR("mapUiNumberOfMapsWindows");
  else
    v100 = CFSTR("map_ui_number_of_maps_windows");
  objc_msgSend(v5, "objectForKeyedSubscript:", v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapUiNumberOfMapsWindows:", objc_msgSend(v101, "unsignedIntValue"));

  if (a3)
    v102 = CFSTR("windowSize");
  else
    v102 = CFSTR("window_size");
  objc_msgSend(v5, "objectForKeyedSubscript:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v104 = v103;
    if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_FULL")) & 1) != 0)
    {
      v105 = 0;
    }
    else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_DEFAULT")) & 1) != 0)
    {
      v105 = 1;
    }
    else if ((objc_msgSend(v104, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_MODERATE")) & 1) != 0)
    {
      v105 = 2;
    }
    else if (objc_msgSend(v104, "isEqualToString:", CFSTR("AP_WINDOW_SIZE_SMALL")))
    {
      v105 = 3;
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
      goto LABEL_310;
    v105 = objc_msgSend(v103, "intValue");
  }
  objc_msgSend(a1, "setWindowSize:", v105);
LABEL_310:

  if (a3)
    v106 = CFSTR("mapUiShownAqiShown");
  else
    v106 = CFSTR("map_ui_shown_aqi_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v106);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapUiShownAqiShown:", objc_msgSend(v107, "BOOLValue"));

  if (a3)
    v108 = CFSTR("mapUiShownWeatherShown");
  else
    v108 = CFSTR("map_ui_shown_weather_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapUiShownWeatherShown:", objc_msgSend(v109, "BOOLValue"));

  if (a3)
    v110 = CFSTR("mapUiShownActiveNavMode");
  else
    v110 = CFSTR("map_ui_shown_active_nav_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v112 = v111;
    if ((objc_msgSend(v112, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_UNKNOWN_TRANSPORT")) & 1) != 0)
    {
      v113 = 0;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_DRIVING")) & 1) != 0)
    {
      v113 = 1;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_WALKING")) & 1) != 0)
    {
      v113 = 2;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_TRANSIT")) & 1) != 0)
    {
      v113 = 3;
    }
    else if ((objc_msgSend(v112, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_RIDESHARE")) & 1) != 0)
    {
      v113 = 4;
    }
    else if (objc_msgSend(v112, "isEqualToString:", CFSTR("AP_TRANSPORTMODE_CYCLING")))
    {
      v113 = 5;
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
      goto LABEL_341;
    v113 = objc_msgSend(v111, "intValue");
  }
  objc_msgSend(a1, "setMapUiShownActiveNavMode:", v113);
LABEL_341:

  if (a3)
    v114 = CFSTR("lookaroundSessionStartTime");
  else
    v114 = CFSTR("lookaround_session_start_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v115, "doubleValue");
    objc_msgSend(a1, "setLookaroundSessionStartTime:");
  }

  if (a3)
    v116 = CFSTR("lookaroundSessionEndTime");
  else
    v116 = CFSTR("lookaround_session_end_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v116);
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v117, "doubleValue");
    objc_msgSend(a1, "setLookaroundSessionEndTime:");
  }

  if (a3)
    v118 = CFSTR("lookaroundSessionHadPanAction");
  else
    v118 = CFSTR("lookaround_session_had_pan_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookaroundSessionHadPanAction:", objc_msgSend(v119, "BOOLValue"));

  if (a3)
    v120 = CFSTR("lookaroundSessionHadZoomAction");
  else
    v120 = CFSTR("lookaround_session_had_zoom_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v120);
  v121 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookaroundSessionHadZoomAction:", objc_msgSend(v121, "BOOLValue"));

  if (a3)
    v122 = CFSTR("lookaroundSessionHadMoveAction");
  else
    v122 = CFSTR("lookaround_session_had_move_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookaroundSessionHadMoveAction:", objc_msgSend(v123, "BOOLValue"));

  if (a3)
    v124 = CFSTR("lookaroundSessionHadTapPoiAction");
  else
    v124 = CFSTR("lookaround_session_had_tap_poi_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v124);
  v125 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookaroundSessionHadTapPoiAction:", objc_msgSend(v125, "BOOLValue"));

  if (a3)
    v126 = CFSTR("lookaroundSessionHadShareAction");
  else
    v126 = CFSTR("lookaround_session_had_share_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v126);
  v127 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookaroundSessionHadShareAction:", objc_msgSend(v127, "BOOLValue"));

  if (a3)
    v128 = CFSTR("lookAroundLocation");
  else
    v128 = CFSTR("look_around_location");
  objc_msgSend(v5, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = [GEOLocation alloc];
    if ((a3 & 1) != 0)
      v131 = -[GEOLocation initWithJSON:](v130, "initWithJSON:", v129);
    else
      v131 = -[GEOLocation initWithDictionary:](v130, "initWithDictionary:", v129);
    v132 = (void *)v131;
    objc_msgSend(a1, "setLookAroundLocation:", v131);

  }
  if (a3)
    v133 = CFSTR("lookAroundHeading");
  else
    v133 = CFSTR("look_around_heading");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookAroundHeading:", objc_msgSend(v134, "unsignedIntValue"));

  if (a3)
    v135 = CFSTR("lookAroundZoom");
  else
    v135 = CFSTR("look_around_zoom");
  objc_msgSend(v5, "objectForKeyedSubscript:", v135);
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v136, "doubleValue");
    objc_msgSend(a1, "setLookAroundZoom:");
  }

  if (a3)
    v137 = CFSTR("lookAroundNumberPoisInView");
  else
    v137 = CFSTR("look_around_number_pois_in_view");
  objc_msgSend(v5, "objectForKeyedSubscript:", v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookAroundNumberPoisInView:", objc_msgSend(v138, "unsignedIntValue"));

  if (a3)
    v139 = CFSTR("lookAroundIsLabelingShown");
  else
    v139 = CFSTR("look_around_is_labeling_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v139);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookAroundIsLabelingShown:", objc_msgSend(v140, "BOOLValue"));

  if (a3)
    v141 = CFSTR("lookAroundEntryIconShown");
  else
    v141 = CFSTR("look_around_entry_icon_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLookAroundEntryIconShown:", objc_msgSend(v142, "BOOLValue"));

  if (a3)
    v143 = CFSTR("deviceInDarkMode");
  else
    v143 = CFSTR("device_in_dark_mode");
  objc_msgSend(v5, "objectForKeyedSubscript:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setDeviceInDarkMode:", objc_msgSend(v144, "BOOLValue"));

  if (a3)
    v145 = CFSTR("venueExperienceShown");
  else
    v145 = CFSTR("venue_experience_shown");
  objc_msgSend(v5, "objectForKeyedSubscript:", v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setVenueExperienceShown:", objc_msgSend(v146, "BOOLValue"));

  if (a3)
    v147 = CFSTR("placeCardState");
  else
    v147 = CFSTR("place_card_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v147);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v149 = [GEOLogMsgStatePlaceCard alloc];
    if ((a3 & 1) != 0)
      v150 = -[GEOLogMsgStatePlaceCard initWithJSON:](v149, "initWithJSON:", v148);
    else
      v150 = -[GEOLogMsgStatePlaceCard initWithDictionary:](v149, "initWithDictionary:", v148);
    v151 = (void *)v150;
    objc_msgSend(a1, "setPlaceCardState:", v150);

  }
  if (a3)
    v152 = CFSTR("placeCardPossibleActions");
  else
    v152 = CFSTR("place_card_possible_actions");
  objc_msgSend(v5, "objectForKeyedSubscript:", v152);
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v447 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v466 = 0u;
    v467 = 0u;
    v464 = 0u;
    v465 = 0u;
    v154 = v153;
    v155 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v464, v472, 16);
    if (v155)
    {
      v156 = v155;
      v157 = *(_QWORD *)v465;
      do
      {
        for (i = 0; i != v156; ++i)
        {
          if (*(_QWORD *)v465 != v157)
            objc_enumerationMutation(v154);
          v159 = *(void **)(*((_QWORD *)&v464 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addPlaceCardPossibleActions:", objc_msgSend(v159, "intValue"));
        }
        v156 = objc_msgSend(v154, "countByEnumeratingWithState:objects:count:", &v464, v472, 16);
      }
      while (v156);
    }

    v5 = v447;
  }

  if (a3)
    v160 = CFSTR("placeCardUnactionableUiElements");
  else
    v160 = CFSTR("place_card_unactionable_ui_elements");
  objc_msgSend(v5, "objectForKeyedSubscript:", v160);
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v462 = 0u;
    v463 = 0u;
    v460 = 0u;
    v461 = 0u;
    v162 = v161;
    v163 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v460, v471, 16);
    if (v163)
    {
      v164 = v163;
      v165 = *(_QWORD *)v461;
      do
      {
        for (j = 0; j != v164; ++j)
        {
          if (*(_QWORD *)v461 != v165)
            objc_enumerationMutation(v162);
          v167 = *(void **)(*((_QWORD *)&v460 + 1) + 8 * j);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addPlaceCardUnactionableUiElements:", objc_msgSend(v167, "intValue"));
        }
        v164 = objc_msgSend(v162, "countByEnumeratingWithState:objects:count:", &v460, v471, 16);
      }
      while (v164);
    }

    v5 = v447;
  }

  if (a3)
    v168 = CFSTR("placeCardPlaceCardCategory");
  else
    v168 = CFSTR("place_card_place_card_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = (void *)objc_msgSend(v169, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceCardCategory:", v170);

  }
  if (a3)
    v171 = CFSTR("placeCardPlaceCardType");
  else
    v171 = CFSTR("place_card_place_card_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v171);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v173 = v172;
    if ((objc_msgSend(v173, "isEqualToString:", CFSTR("UNKNOWN_PLACECARD")) & 1) != 0)
    {
      v174 = 0;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("ADDRESS_PLACECARD")) & 1) != 0)
    {
      v174 = 1;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("BUSINESS_PLACECARD")) & 1) != 0)
    {
      v174 = 2;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("DROPPED_PIN_PLACECARD")) & 1) != 0)
    {
      v174 = 3;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("CALENDAR_PLACECARD")) & 1) != 0)
    {
      v174 = 4;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("CURRENT_LOCATION_PLACECARD")) & 1) != 0)
    {
      v174 = 5;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("TRANSIT_LINE_PLACECARD")) & 1) != 0)
    {
      v174 = 6;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("TRANSIT_STATION_PLACECARD")) & 1) != 0)
    {
      v174 = 7;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("LANDMARK_PLACECARD")) & 1) != 0)
    {
      v174 = 8;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("FLYOVER_PLACECARD")) & 1) != 0)
    {
      v174 = 9;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("SAR_PLACECARD")) & 1) != 0)
    {
      v174 = 10;
    }
    else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("BRAND_PLACECARD")) & 1) != 0)
    {
      v174 = 11;
    }
    else
    {
      if ((objc_msgSend(v173, "isEqualToString:", CFSTR("VENUE_PLACECARD")) & 1) != 0)
      {
        v174 = 12;
      }
      else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("VENUE_BUILDING_PLACECARD")) & 1) != 0)
      {
        v174 = 13;
      }
      else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("CURATED_COLLECTION_PLACECARD")) & 1) != 0)
      {
        v174 = 14;
      }
      else if ((objc_msgSend(v173, "isEqualToString:", CFSTR("TRANSIT_PLACECARD")) & 1) != 0)
      {
        v174 = 15;
      }
      else if (objc_msgSend(v173, "isEqualToString:", CFSTR("OTHER")))
      {
        v174 = 17;
      }
      else
      {
        v174 = 0;
      }
      v5 = v447;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_504;
    v174 = objc_msgSend(v172, "intValue");
  }
  objc_msgSend(a1, "setPlaceCardPlaceCardType:", v174);
LABEL_504:

  if (a3)
    v175 = CFSTR("placeCardTransitAdvisoryBanner");
  else
    v175 = CFSTR("place_card_transit_advisory_banner");
  objc_msgSend(v5, "objectForKeyedSubscript:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardTransitAdvisoryBanner:", objc_msgSend(v176, "BOOLValue"));

  if (a3)
    v177 = CFSTR("placeCardPlaceActionDetailsActionUrl");
  else
    v177 = CFSTR("place_card_place_action_details_action_url");
  objc_msgSend(v5, "objectForKeyedSubscript:", v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v179 = (void *)objc_msgSend(v178, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsActionUrl:", v179);

  }
  if (a3)
    v180 = CFSTR("placeCardPlaceActionDetailsAnimationId");
  else
    v180 = CFSTR("place_card_place_action_details_animation_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v180);
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsAnimationId:", objc_msgSend(v181, "unsignedLongLongValue"));

  if (a3)
    v182 = CFSTR("placeCardPlaceActionDetailsBusinessId");
  else
    v182 = CFSTR("place_card_place_action_details_business_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v182);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsBusinessId:", objc_msgSend(v183, "unsignedLongLongValue"));

  if (a3)
    v184 = CFSTR("placeCardPlaceActionDetailsDestinationApp");
  else
    v184 = CFSTR("place_card_place_action_details_destination_app");
  objc_msgSend(v5, "objectForKeyedSubscript:", v184);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v186 = (void *)objc_msgSend(v185, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsDestinationApp:", v186);

  }
  if (a3)
    v187 = CFSTR("placeCardPlaceActionDetailsPhotoId");
  else
    v187 = CFSTR("place_card_place_action_details_photo_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v189 = (void *)objc_msgSend(v188, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsPhotoId:", v189);

  }
  if (a3)
    v190 = CFSTR("placeCardPlaceActionDetailsPlaceId");
  else
    v190 = CFSTR("place_card_place_action_details_place_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v190);
  v191 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsPlaceId:", objc_msgSend(v191, "longLongValue"));

  if (a3)
    v192 = CFSTR("placeCardPlaceActionDetailsRichProviderId");
  else
    v192 = CFSTR("place_card_place_action_details_rich_provider_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v192);
  v193 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v194 = (void *)objc_msgSend(v193, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsRichProviderId:", v194);

  }
  if (a3)
    v195 = CFSTR("placeCardPlaceActionDetailsSearchResponseRelativeTimestamp");
  else
    v195 = CFSTR("place_card_place_action_details_search_response_relative_timestamp");
  objc_msgSend(v5, "objectForKeyedSubscript:", v195);
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v196, "doubleValue");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsSearchResponseRelativeTimestamp:");
  }

  if (a3)
    v197 = CFSTR("placeCardPlaceActionDetailsTargetId");
  else
    v197 = CFSTR("place_card_place_action_details_target_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v197);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTargetId:", objc_msgSend(v198, "unsignedLongLongValue"));

  if (a3)
    v199 = CFSTR("placeCardPlaceActionDetailsLocalSearchProviderId");
  else
    v199 = CFSTR("place_card_place_action_details_local_search_provider_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v199);
  v200 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsLocalSearchProviderId:", objc_msgSend(v200, "intValue"));

  if (a3)
    v201 = CFSTR("placeCardPlaceActionDetailsResultIndex");
  else
    v201 = CFSTR("place_card_place_action_details_result_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v201);
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsResultIndex:", objc_msgSend(v202, "intValue"));

  if (a3)
    v203 = CFSTR("placeCardPlaceActionDetailsShowcaseId");
  else
    v203 = CFSTR("place_card_place_action_details_showcase_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v205 = (void *)objc_msgSend(v204, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsShowcaseId:", v205);

  }
  if (a3)
    v206 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardIncidentType");
  else
    v206 = CFSTR("place_card_place_action_details_transit_place_card_incident_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v206);
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v208 = (void *)objc_msgSend(v207, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:", v208);

  }
  if (a3)
    v209 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName");
  else
    v209 = CFSTR("place_card_place_action_details_transit_place_card_transit_system_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v211 = (void *)objc_msgSend(v210, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:", v211);

  }
  if (a3)
    v212 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitCategory");
  else
    v212 = CFSTR("place_card_place_action_details_transit_place_card_transit_category");
  objc_msgSend(v5, "objectForKeyedSubscript:", v212);
  v213 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v214 = v213;
    if ((objc_msgSend(v214, "isEqualToString:", CFSTR("UNKNOWN_CATEGORY")) & 1) != 0)
    {
      v215 = 0;
    }
    else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("SUMMARY")) & 1) != 0)
    {
      v215 = 1;
    }
    else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("LOW_FREQUENCY")) & 1) != 0)
    {
      v215 = 2;
    }
    else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("HIGH_FREQUENCY")) & 1) != 0)
    {
      v215 = 3;
    }
    else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("MIXED_FREQUENCY")) & 1) != 0)
    {
      v215 = 4;
    }
    else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("CONNECTIONS")) & 1) != 0)
    {
      v215 = 5;
    }
    else if (objc_msgSend(v214, "isEqualToString:", CFSTR("OUT_OF_SERVICE")))
    {
      v215 = 6;
    }
    else
    {
      v215 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_602;
    v215 = objc_msgSend(v213, "intValue");
  }
  objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitCategory:", v215);
LABEL_602:

  if (a3)
    v216 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection");
  else
    v216 = CFSTR("place_card_place_action_details_transit_place_card_transit_departure_sequence_usage_direction");
  objc_msgSend(v5, "objectForKeyedSubscript:", v216);
  v217 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v218 = (void *)objc_msgSend(v217, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:", v218);

  }
  if (a3)
    v219 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign");
  else
    v219 = CFSTR("place_card_place_action_details_transit_place_card_transit_departure_sequence_usage_headsign");
  objc_msgSend(v5, "objectForKeyedSubscript:", v219);
  v220 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v221 = (void *)objc_msgSend(v220, "copy");
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:", v221);

  }
  if (a3)
    v222 = CFSTR("placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId");
  else
    v222 = CFSTR("place_card_place_action_details_transit_place_card_transit_departure_sequence_usage_line_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v222);
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId:", objc_msgSend(v223, "unsignedLongLongValue"));

  if (a3)
    v224 = CFSTR("placeCardRevealedPlaceCardModule");
  else
    v224 = CFSTR("place_card_revealed_place_card_module");
  objc_msgSend(v5, "objectForKeyedSubscript:", v224);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v458 = 0u;
    v459 = 0u;
    v456 = 0u;
    v457 = 0u;
    v445 = v225;
    v226 = v225;
    v227 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v456, v470, 16);
    if (v227)
    {
      v228 = v227;
      v229 = *(_QWORD *)v457;
      do
      {
        for (k = 0; k != v228; ++k)
        {
          if (*(_QWORD *)v457 != v229)
            objc_enumerationMutation(v226);
          v231 = *(_QWORD *)(*((_QWORD *)&v456 + 1) + 8 * k);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v232 = [GEORevealedPlaceCardModule alloc];
            if ((a3 & 1) != 0)
              v233 = -[GEORevealedPlaceCardModule initWithJSON:](v232, "initWithJSON:", v231);
            else
              v233 = -[GEORevealedPlaceCardModule initWithDictionary:](v232, "initWithDictionary:", v231);
            v234 = (void *)v233;
            objc_msgSend(a1, "addPlaceCardRevealedPlaceCardModule:", v233, v445);

          }
        }
        v228 = objc_msgSend(v226, "countByEnumeratingWithState:objects:count:", &v456, v470, 16);
      }
      while (v228);
    }

    v225 = v445;
  }

  if (a3)
    v235 = CFSTR("placeCardIsPersonPlacecard");
  else
    v235 = CFSTR("place_card_is_person_placecard");
  objc_msgSend(v5, "objectForKeyedSubscript:", v235, v445);
  v236 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardIsPersonPlacecard:", objc_msgSend(v236, "BOOLValue"));

  if (a3)
    v237 = CFSTR("placeCardIsPersonAddressAvailable");
  else
    v237 = CFSTR("place_card_is_person_address_available");
  objc_msgSend(v5, "objectForKeyedSubscript:", v237);
  v238 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardIsPersonAddressAvailable:", objc_msgSend(v238, "BOOLValue"));

  if (a3)
    v239 = CFSTR("placeCardIsPersonLocationShared");
  else
    v239 = CFSTR("place_card_is_person_location_shared");
  objc_msgSend(v5, "objectForKeyedSubscript:", v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPlaceCardIsPersonLocationShared:", objc_msgSend(v240, "BOOLValue"));

  if (a3)
    v241 = CFSTR("mapsServerMetadataSuggestionEntryTappedOn");
  else
    v241 = CFSTR("maps_server_metadata_suggestion_entry_tapped_on");
  objc_msgSend(v5, "objectForKeyedSubscript:", v241);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v243 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v242, 0);
    objc_msgSend(a1, "setMapsServerMetadataSuggestionEntryTappedOn:", v243);

  }
  if (a3)
    v244 = CFSTR("mapsServerMetadataSuggestionEntryDisplayed");
  else
    v244 = CFSTR("maps_server_metadata_suggestion_entry_displayed");
  objc_msgSend(v5, "objectForKeyedSubscript:", v244);
  v245 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v454 = 0u;
    v455 = 0u;
    v452 = 0u;
    v453 = 0u;
    v246 = v245;
    v247 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v452, v469, 16);
    if (v247)
    {
      v248 = v247;
      v249 = *(_QWORD *)v453;
      do
      {
        for (m = 0; m != v248; ++m)
        {
          if (*(_QWORD *)v453 != v249)
            objc_enumerationMutation(v246);
          v251 = *(_QWORD *)(*((_QWORD *)&v452 + 1) + 8 * m);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v252 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v251, 0);
            objc_msgSend(a1, "addMapsServerMetadataSuggestionEntryDisplayed:", v252);

          }
        }
        v248 = objc_msgSend(v246, "countByEnumeratingWithState:objects:count:", &v452, v469, 16);
      }
      while (v248);
    }

    v5 = v447;
  }

  if (a3)
    v253 = CFSTR("mapsServerMetadata");
  else
    v253 = CFSTR("maps_server_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v253);
  v254 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v255 = [GEOMapsServerMetadata alloc];
    if ((a3 & 1) != 0)
      v256 = -[GEOMapsServerMetadata initWithJSON:](v255, "initWithJSON:", v254);
    else
      v256 = -[GEOMapsServerMetadata initWithDictionary:](v255, "initWithDictionary:", v254);
    v257 = (void *)v256;
    objc_msgSend(a1, "setMapsServerMetadata:", v256);

  }
  if (a3)
    v258 = CFSTR("routeRouteDetails");
  else
    v258 = CFSTR("route_route_details");
  objc_msgSend(v5, "objectForKeyedSubscript:", v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v260 = [GEORouteDetails alloc];
    if ((a3 & 1) != 0)
      v261 = -[GEORouteDetails initWithJSON:](v260, "initWithJSON:", v259);
    else
      v261 = -[GEORouteDetails initWithDictionary:](v260, "initWithDictionary:", v259);
    v262 = (void *)v261;
    objc_msgSend(a1, "setRouteRouteDetails:", v261);

  }
  if (a3)
    v263 = CFSTR("predExTrainingData");
  else
    v263 = CFSTR("pred_ex_training_data");
  objc_msgSend(v5, "objectForKeyedSubscript:", v263);
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v265 = [GEOLogMsgEventPredExTrainingData alloc];
    if ((a3 & 1) != 0)
      v266 = -[GEOLogMsgEventPredExTrainingData initWithJSON:](v265, "initWithJSON:", v264);
    else
      v266 = -[GEOLogMsgEventPredExTrainingData initWithDictionary:](v265, "initWithDictionary:", v264);
    v267 = (void *)v266;
    objc_msgSend(a1, "setPredExTrainingData:", v266);

  }
  if (a3)
    v268 = CFSTR("suggestionsAcSequenceNumber");
  else
    v268 = CFSTR("suggestions_ac_sequence_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v268);
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSuggestionsAcSequenceNumber:", objc_msgSend(v269, "intValue"));

  if (a3)
    v270 = CFSTR("suggestionsSearchFieldType");
  else
    v270 = CFSTR("suggestions_search_field_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v272 = v271;
    if ((objc_msgSend(v272, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_UNKNOWN")) & 1) != 0)
    {
      v273 = 0;
    }
    else if ((objc_msgSend(v272, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_NORMAL")) & 1) != 0)
    {
      v273 = 1;
    }
    else if ((objc_msgSend(v272, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_DIRECTIONS_START")) & 1) != 0)
    {
      v273 = 2;
    }
    else if (objc_msgSend(v272, "isEqualToString:", CFSTR("AP_SEARCHFIELDTYPE_DIRECTIONS_END")))
    {
      v273 = 3;
    }
    else
    {
      v273 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_714;
    v273 = objc_msgSend(v271, "intValue");
  }
  objc_msgSend(a1, "setSuggestionsSearchFieldType:", v273);
LABEL_714:

  if (a3)
    v274 = CFSTR("suggestionsSelectedIndex");
  else
    v274 = CFSTR("suggestions_selected_index");
  objc_msgSend(v5, "objectForKeyedSubscript:", v274);
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSuggestionsSelectedIndex:", objc_msgSend(v275, "intValue"));

  if (a3)
    v276 = CFSTR("suggestionsSearchString");
  else
    v276 = CFSTR("suggestions_search_string");
  objc_msgSend(v5, "objectForKeyedSubscript:", v276);
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v278 = (void *)objc_msgSend(v277, "copy");
    objc_msgSend(a1, "setSuggestionsSearchString:", v278);

  }
  if (a3)
    v279 = CFSTR("suggestionsDisplayedResults");
  else
    v279 = CFSTR("suggestions_displayed_results");
  objc_msgSend(v5, "objectForKeyedSubscript:", v279);
  v280 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v450 = 0u;
    v451 = 0u;
    v448 = 0u;
    v449 = 0u;
    v446 = v280;
    v281 = v280;
    v282 = objc_msgSend(v281, "countByEnumeratingWithState:objects:count:", &v448, v468, 16);
    if (v282)
    {
      v283 = v282;
      v284 = *(_QWORD *)v449;
      do
      {
        for (n = 0; n != v283; ++n)
        {
          if (*(_QWORD *)v449 != v284)
            objc_enumerationMutation(v281);
          v286 = *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * n);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v287 = [GEOAutoCompleteResultInfo alloc];
            if ((a3 & 1) != 0)
              v288 = -[GEOAutoCompleteResultInfo initWithJSON:](v287, "initWithJSON:", v286);
            else
              v288 = -[GEOAutoCompleteResultInfo initWithDictionary:](v287, "initWithDictionary:", v286);
            v289 = (void *)v288;
            objc_msgSend(a1, "addSuggestionsDisplayedResults:", v288, v446);

          }
        }
        v283 = objc_msgSend(v281, "countByEnumeratingWithState:objects:count:", &v448, v468, 16);
      }
      while (v283);
    }

    v280 = v446;
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("landscape"));
  v290 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLandscape:", objc_msgSend(v290, "BOOLValue"));

  if (a3)
    v291 = CFSTR("restoreLayoutInfo");
  else
    v291 = CFSTR("restore_layout_info");
  objc_msgSend(v5, "objectForKeyedSubscript:", v291, v446);
  v292 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v293 = v292;
    if ((objc_msgSend(v293, "isEqualToString:", CFSTR("AP_LAYOUT_UNKNOWN")) & 1) != 0)
    {
      v294 = 0;
    }
    else if ((objc_msgSend(v293, "isEqualToString:", CFSTR("AP_LAYOUT_MINI")) & 1) != 0)
    {
      v294 = 1;
    }
    else if ((objc_msgSend(v293, "isEqualToString:", CFSTR("AP_LAYOUT_PARTIAL")) & 1) != 0)
    {
      v294 = 2;
    }
    else if (objc_msgSend(v293, "isEqualToString:", CFSTR("AP_LAYOUT_FULL")))
    {
      v294 = 3;
    }
    else
    {
      v294 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_760;
    v294 = objc_msgSend(v292, "intValue");
  }
  objc_msgSend(a1, "setRestoreLayoutInfo:", v294);
LABEL_760:

  if (a3)
    v295 = CFSTR("restoreLayoutStyle");
  else
    v295 = CFSTR("restore_layout_style");
  objc_msgSend(v5, "objectForKeyedSubscript:", v295);
  v296 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v297 = v296;
    if ((objc_msgSend(v297, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_UNKNOWN")) & 1) != 0)
    {
      v298 = 0;
    }
    else if ((objc_msgSend(v297, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD")) & 1) != 0)
    {
      v298 = 1;
    }
    else if ((objc_msgSend(v297, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_COMPACT")) & 1) != 0)
    {
      v298 = 2;
    }
    else if ((objc_msgSend(v297, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_SIDE_BAR")) & 1) != 0)
    {
      v298 = 3;
    }
    else if ((objc_msgSend(v297, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_FLOATING")) & 1) != 0)
    {
      v298 = 4;
    }
    else if (objc_msgSend(v297, "isEqualToString:", CFSTR("AP_LAYOUTSTYLE_STANDARD_SIDE")))
    {
      v298 = 5;
    }
    else
    {
      v298 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_781;
    v298 = objc_msgSend(v296, "intValue");
  }
  objc_msgSend(a1, "setRestoreLayoutStyle:", v298);
LABEL_781:

  if (a3)
    v299 = CFSTR("restoreUiTarget");
  else
    v299 = CFSTR("restore_ui_target");
  objc_msgSend(v5, "objectForKeyedSubscript:", v299);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v301 = v300;
    if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_UNKNOWN")) & 1) != 0)
    {
      v302 = 0;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_POI")) & 1) != 0)
    {
      v302 = 1;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_RESULT_LIST")) & 1) != 0)
    {
      v302 = 2;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_POPULAR_NEARBY_LIST")) & 1) != 0)
    {
      v302 = 3;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_CALLOUT")) & 1) != 0)
    {
      v302 = 4;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_SEARCH_PIN")) & 1) != 0)
    {
      v302 = 5;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_DROPPED_PIN")) & 1) != 0)
    {
      v302 = 6;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("UI_TARGET_TRANSIT_LINE")) & 1) != 0)
    {
      v302 = 7;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_TRAY")) & 1) != 0)
    {
      v302 = 8;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_TRAY_BROWSE")) & 1) != 0)
    {
      v302 = 9;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_TRAY_POPULAR_NEARBY")) & 1) != 0)
    {
      v302 = 10;
    }
    else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_TRAY_AC")) & 1) != 0)
    {
      v302 = 11;
    }
    else
    {
      if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_TRAY_AC_INTERMEDIATE")) & 1) != 0)
      {
        v302 = 12;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_TRAY_NO_QUERY")) & 1) != 0)
      {
        v302 = 13;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("AR_WALKING_LEGAL_TRAY")) & 1) != 0)
      {
        v302 = 14;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAISE_TO_START_AR_TRAY")) & 1) != 0)
      {
        v302 = 15;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EVENTS_ADVISORY_DETAILS_PAGE")) & 1) != 0)
      {
        v302 = 16;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY_CARPLAY")) & 1) != 0)
      {
        v302 = 17;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("HIGHLIGHTED_AREA")) & 1) != 0)
      {
        v302 = 18;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME")) & 1) != 0)
      {
        v302 = 19;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRAVEL_PREFERENCES_TRAY")) & 1) != 0)
      {
        v302 = 20;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULT_TRAY_SEARCH")) & 1) != 0)
      {
        v302 = 21;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SINGLE_CARD_FILTER")) & 1) != 0)
      {
        v302 = 22;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FULL_CARD_FILTER")) & 1) != 0)
      {
        v302 = 23;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ACCOUNT_PRIVACY_TRAY")) & 1) != 0)
      {
        v302 = 24;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("APPLE_RATINGS_HISTORY_TRAY")) & 1) != 0)
      {
        v302 = 25;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_FILTERED")) & 1) != 0)
      {
        v302 = 26;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CITY_MENU")) & 1) != 0)
      {
        v302 = 27;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CURATED_COLLECTIONS_HOME_CONDENSED")) & 1) != 0)
      {
        v302 = 28;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ACCOUNT_TRAY")) & 1) != 0)
      {
        v302 = 29;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY")) & 1) != 0)
      {
        v302 = 30;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SUBMIT_TRIP_FEEDBACK")) & 1) != 0)
      {
        v302 = 31;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_PLACE_ISSUE_DETAILS")) & 1) != 0)
      {
        v302 = 32;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_GUIDES_DETAILS")) & 1) != 0)
      {
        v302 = 33;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_BAD_DIRECTIONS_DETAILS")) & 1) != 0)
      {
        v302 = 34;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_MAP_DETAILS")) & 1) != 0)
      {
        v302 = 35;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_COMPLICATION")) & 1) != 0)
      {
        v302 = 36;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_NAV_MENU")) & 1) != 0)
      {
        v302 = 37;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_ALIGHT_BANNER_TRANSIT")) & 1) != 0)
      {
        v302 = 38;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_REPORT_MENU")) & 1) != 0)
      {
        v302 = 39;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_CURATED_COLLECTION_MENU")) & 1) != 0)
      {
        v302 = 40;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_REPORT_CARD_DETAILS")) & 1) != 0)
      {
        v302 = 41;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_NO_LOCATION_TRANSIT")) & 1) != 0)
      {
        v302 = 42;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STREET_ISSUE_DETAILS")) & 1) != 0)
      {
        v302 = 43;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NEARBY_TRANSIT_CARD")) & 1) != 0)
      {
        v302 = 44;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_MENU")) & 1) != 0)
      {
        v302 = 45;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("GENERIC_ADVISORY_PAGE")) & 1) != 0)
      {
        v302 = 46;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("USER_PROFILE_TRAY")) & 1) != 0)
      {
        v302 = 47;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MEDIA_APP_MENU")) & 1) != 0)
      {
        v302 = 48;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TEMPLATE_PLACE_TRAY")) & 1) != 0)
      {
        v302 = 49;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_RAP")) & 1) != 0)
      {
        v302 = 50;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ALLOW_NOTIFICATION_DIALOG")) & 1) != 0)
      {
        v302 = 51;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_DRIVING")) & 1) != 0)
      {
        v302 = 52;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_ARP")) & 1) != 0)
      {
        v302 = 53;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_REPROMPT_TIME_ELAPSED")) & 1) != 0)
      {
        v302 = 54;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_CONSENT_PROMPT")) & 1) != 0)
      {
        v302 = 55;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("QUICK_ACTION_TRAY_VENDORS_MENU")) & 1) != 0)
      {
        v302 = 56;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_TRAY_VENDORS_MENU")) & 1) != 0)
      {
        v302 = 57;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ROUTE_PLANNING")) & 1) != 0)
      {
        v302 = 58;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_TRAY")) & 1) != 0)
      {
        v302 = 59;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ROUTE_PLANNING")) & 1) != 0)
      {
        v302 = 60;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_SHOWCASE_MENU")) & 1) != 0)
      {
        v302 = 61;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_INLINE_ADD_DETAILS")) & 1) != 0)
      {
        v302 = 62;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_EDIT_MENU_DETAILS")) & 1) != 0)
      {
        v302 = 63;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SUBMISSION_PROMPT")) & 1) != 0)
      {
        v302 = 64;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_PLACECARD_EDIT_MENU")) & 1) != 0)
      {
        v302 = 65;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ARP_SUBMISSION_CONFIRMATION_PAGE")) & 1) != 0)
      {
        v302 = 66;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("INCIDENT_REPORT_MENU")) & 1) != 0)
      {
        v302 = 67;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES_STEPS")) & 1) != 0)
      {
        v302 = 68;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SELECT_BAD_ROUTES")) & 1) != 0)
      {
        v302 = 69;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
      {
        v302 = 70;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
      {
        v302 = 71;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY_LIST")) & 1) != 0)
      {
        v302 = 72;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SPOTLIGHT_BUSINESS_ENTITY")) & 1) != 0)
      {
        v302 = 73;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_ARP")) & 1) != 0)
      {
        v302 = 74;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("IMPROVE_LOCATION_ACCURACY_PROMPT")) & 1) != 0)
      {
        v302 = 75;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("YOUR_PHOTOS_ALBUM")) & 1) != 0)
      {
        v302 = 76;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ARP_PHOTO_CREDIT")) & 1) != 0)
      {
        v302 = 77;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_OUTREACH_REVIEWED_REPORT")) & 1) != 0)
      {
        v302 = 78;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_REPORT_MENU_MORE")) & 1) != 0)
      {
        v302 = 79;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MAPS_SETTINGS")) & 1) != 0)
      {
        v302 = 80;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("OFFLINE_FEATURE_PROMPT")) & 1) != 0)
      {
        v302 = 81;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EXPIRED_MAPS_DETAILS")) & 1) != 0)
      {
        v302 = 82;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_VIEW")) & 1) != 0)
      {
        v302 = 83;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_OFFLINE")) & 1) != 0)
      {
        v302 = 84;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
      {
        v302 = 85;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("OFFLINE_NEW_MAPS_MANAGEMENT")) & 1) != 0)
      {
        v302 = 86;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EDIT_EXPIRED_MAPS_MANAGEMENT")) & 1) != 0)
      {
        v302 = 87;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("OFFLINE_MAPS_MANAGEMENT")) & 1) != 0)
      {
        v302 = 88;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("REGION_SELECTOR")) & 1) != 0)
      {
        v302 = 89;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("OFFLINE_SUGGESTED_MAPS_MANAGEMENT")) & 1) != 0)
      {
        v302 = 90;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
      {
        v302 = 91;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_PLACE")) & 1) != 0)
      {
        v302 = 92;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT_CAROUSEL")) & 1) != 0)
      {
        v302 = 93;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_MAP")) & 1) != 0)
      {
        v302 = 94;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_CONTROLS")) & 1) != 0)
      {
        v302 = 95;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_CONTROLS")) & 1) != 0)
      {
        v302 = 96;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING_CAROUSEL")) & 1) != 0)
      {
        v302 = 97;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_CONTROLS")) & 1) != 0)
      {
        v302 = 98;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_CAROUSEL")) & 1) != 0)
      {
        v302 = 99;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_CONTROLS")) & 1) != 0)
      {
        v302 = 100;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH")) & 1) != 0)
      {
        v302 = 101;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_BROWSE")) & 1) != 0)
      {
        v302 = 102;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_FAVORITES")) & 1) != 0)
      {
        v302 = 103;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
      {
        v302 = 104;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_CLUSTER")) & 1) != 0)
      {
        v302 = 105;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RESULTS_TRAY_VENUE_BROWSE")) & 1) != 0)
      {
        v302 = 106;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MAP_RESULTS")) & 1) != 0)
      {
        v302 = 107;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_ELEVATION_VIEW")) & 1) != 0)
      {
        v302 = 108;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_PLACES")) & 1) != 0)
      {
        v302 = 109;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_ELEVATION_VIEW")) & 1) != 0)
      {
        v302 = 110;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING_CAROUSEL")) & 1) != 0)
      {
        v302 = 111;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("DOWNLOADED_MAPS_DETAILS")) & 1) != 0)
      {
        v302 = 112;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING_CAROUSEL")) & 1) != 0)
      {
        v302 = 113;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_OVERVIEW_MAP")) & 1) != 0)
      {
        v302 = 114;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_OVERVIEW_MAP")) & 1) != 0)
      {
        v302 = 115;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_OVERVIEW_MAP")) & 1) != 0)
      {
        v302 = 116;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_OPTIONS")) & 1) != 0)
      {
        v302 = 117;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_OVERVIEW_MAP")) & 1) != 0)
      {
        v302 = 118;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MORE_GUIDES")) & 1) != 0)
      {
        v302 = 119;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_RECENTLY_VIEWED")) & 1) != 0)
      {
        v302 = 120;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EV_SUCCESS_TRAY")) & 1) != 0)
      {
        v302 = 121;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PREFERRED_NETWORK_SELECTION_TRAY")) & 1) != 0)
      {
        v302 = 122;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PREFERRED_NETWORK_TRAY")) & 1) != 0)
      {
        v302 = 123;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WALKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
      {
        v302 = 124;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FINDMY_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
      {
        v302 = 125;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_FIND_MY_ETA_SHARING_TRAY")) & 1) != 0)
      {
        v302 = 126;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("AC_KEYBOARD_TRAY")) & 1) != 0)
      {
        v302 = 127;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MORE_RELATED_TRAILS")) & 1) != 0)
      {
        v302 = 128;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MORE_RELATED_TRAILHEADS")) & 1) != 0)
      {
        v302 = 129;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_CUSTOM_ROUTE")) & 1) != 0)
      {
        v302 = 130;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CUSTOM_ROUTE_CREATION_TRAY")) & 1) != 0)
      {
        v302 = 131;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_CURATED_HIKE")) & 1) != 0)
      {
        v302 = 132;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MORE_CURATED_HIKES")) & 1) != 0)
      {
        v302 = 133;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CUSTOM_ROUTE_ONBOARDING")) & 1) != 0)
      {
        v302 = 134;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LIBRARY_ROUTES")) & 1) != 0)
      {
        v302 = 135;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("HIKING_TRANSITION_SUGGESTION_TRAY")) & 1) != 0)
      {
        v302 = 136;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MY_LIBRARY")) & 1) != 0)
      {
        v302 = 137;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EDIT_NOTE_TRAY")) & 1) != 0)
      {
        v302 = 138;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CREATE_NOTE_TRAY")) & 1) != 0)
      {
        v302 = 139;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LIBRARY_PLACES")) & 1) != 0)
      {
        v302 = 140;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ACCOUNT")) & 1) != 0)
      {
        v302 = 141;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_DOWNLOADED_MAPS")) & 1) != 0)
      {
        v302 = 142;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_TRAY")) & 1) != 0)
      {
        v302 = 201;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WEB_MODULE")) & 1) != 0)
      {
        v302 = 202;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ADD_FAVORITE_TRAY")) & 1) != 0)
      {
        v302 = 250;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("COLLECTION_LIST")) & 1) != 0)
      {
        v302 = 251;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("COLLECTION_VIEW")) & 1) != 0)
      {
        v302 = 252;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FAVORITE_DETAILS")) & 1) != 0)
      {
        v302 = 253;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FAVORITES_TRAY")) & 1) != 0)
      {
        v302 = 254;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARED_COLLECTION")) & 1) != 0)
      {
        v302 = 255;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARED_COLLECTION_VIEW")) & 1) != 0)
      {
        v302 = 256;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RECENTLY_VIEWED")) & 1) != 0)
      {
        v302 = 257;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARED_WEB_COLLECTION")) & 1) != 0)
      {
        v302 = 258;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CURATED_COLLECTION_VIEW")) & 1) != 0)
      {
        v302 = 259;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FEATURED_COLLECTIONS")) & 1) != 0)
      {
        v302 = 260;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PUBLISHER_TRAY")) & 1) != 0)
      {
        v302 = 261;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARED_CURATED_COLLECTION_VIEW")) & 1) != 0)
      {
        v302 = 262;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CURATED_COLLECTION_NOTIFICATION")) & 1) != 0)
      {
        v302 = 263;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CURATED_COLLECTION_LIST")) & 1) != 0)
      {
        v302 = 264;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PUBLISHER_LIST")) & 1) != 0)
      {
        v302 = 265;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_CURATED_COLLECTION_VIEW")) & 1) != 0)
      {
        v302 = 266;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_SUBLIST")) & 1) != 0)
      {
        v302 = 267;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY_SUBLIST")) & 1) != 0)
      {
        v302 = 268;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_DRIVING")) & 1) != 0)
      {
        v302 = 301;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_WALKING")) & 1) != 0)
      {
        v302 = 302;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_TRANSIT")) & 1) != 0)
      {
        v302 = 303;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE")) & 1) != 0)
      {
        v302 = 304;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_CYCLING")) & 1) != 0)
      {
        v302 = 305;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_VIRTUAL_GARAGE_VIEW")) & 1) != 0)
      {
        v302 = 306;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_TRAY_DRIVING")) & 1) != 0)
      {
        v302 = 401;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_TRAY_WALKING")) & 1) != 0)
      {
        v302 = 402;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_TRAY_TRANSIT")) & 1) != 0)
      {
        v302 = 403;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_TRAY_CYCLING")) & 1) != 0)
      {
        v302 = 404;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_PLACECARD")) & 1) != 0)
      {
        v302 = 501;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_SEARCH")) & 1) != 0)
      {
        v302 = 502;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_RESULTS")) & 1) != 0)
      {
        v302 = 503;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_ROUTING")) & 1) != 0)
      {
        v302 = 504;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_NAV")) & 1) != 0)
      {
        v302 = 505;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_RESULTS_SEARCH_ALONG_ROUTE")) & 1) != 0)
      {
        v302 = 506;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_TRAFFIC_INCIDENT")) & 1) != 0)
      {
        v302 = 507;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_FULL_SCREEN")) & 1) != 0)
      {
        v302 = 508;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_DRIVE")) & 1) != 0)
      {
        v302 = 509;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_LAUNCH_AND_GO")) & 1) != 0)
      {
        v302 = 510;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAP_VIEW")) & 1) != 0)
      {
        v302 = 511;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_SETTINGS")) & 1) != 0)
      {
        v302 = 601;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_PREFERENCES")) & 1) != 0)
      {
        v302 = 602;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP")) & 1) != 0)
      {
        v302 = 603;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_DRIVING_DETAILS")) & 1) != 0)
      {
        v302 = 604;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_WALKING_DETAILS")) & 1) != 0)
      {
        v302 = 605;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRANSIT_DETAILS")) & 1) != 0)
      {
        v302 = 606;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_EDITOR")) & 1) != 0)
      {
        v302 = 607;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_DRIVING_DETAILS")) & 1) != 0)
      {
        v302 = 608;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_WALKING_DETAILS")) & 1) != 0)
      {
        v302 = 609;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_TRANSIT_DETAILS")) & 1) != 0)
      {
        v302 = 610;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_AUDIO_SETTINGS")) & 1) != 0)
      {
        v302 = 611;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PHOTO_VIEWER_ALL")) & 1) != 0)
      {
        v302 = 612;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PHOTO_VIEWER_SINGLE")) & 1) != 0)
      {
        v302 = 613;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTE_OPTIONS_TRANSIT")) & 1) != 0)
      {
        v302 = 614;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_TRAY")) & 1) != 0)
      {
        v302 = 615;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_DRIVING")) & 1) != 0)
      {
        v302 = 616;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_WALKING")) & 1) != 0)
      {
        v302 = 617;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_TRANSIT")) & 1) != 0)
      {
        v302 = 618;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("REFINE_SEARCH_SUGGESTION_AREA")) & 1) != 0)
      {
        v302 = 619;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ADD_PHOTO_SHEET")) & 1) != 0)
      {
        v302 = 620;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ADD_PLACE_SHEET")) & 1) != 0)
      {
        v302 = 621;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARE_SHEET")) & 1) != 0)
      {
        v302 = 622;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EDIT_LOCATION_SHEET")) & 1) != 0)
      {
        v302 = 623;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ADD_CONTACT_SHEET")) & 1) != 0)
      {
        v302 = 624;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EDIT_NAME_SHEET")) & 1) != 0)
      {
        v302 = 625;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("DRIVING_NAV_SETTINGS")) & 1) != 0)
      {
        v302 = 626;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRANSIT_SETTINGS")) & 1) != 0)
      {
        v302 = 627;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_SHEET")) & 1) != 0)
      {
        v302 = 628;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("REMOVE_CAR_SHEET")) & 1) != 0)
      {
        v302 = 629;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DRIVING")) & 1) != 0)
      {
        v302 = 630;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTE_OPTIONS_DATETIME")) & 1) != 0)
      {
        v302 = 631;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRANSIT_ADVISORY_BANNER")) & 1) != 0)
      {
        v302 = 632;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("BOOK_TABLE_SELECT_TIME")) & 1) != 0)
      {
        v302 = 633;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("BOOK_TABLE_MORE_OPTIONS")) & 1) != 0)
      {
        v302 = 634;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("BOOK_TABLE_READY")) & 1) != 0)
      {
        v302 = 635;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("BOOK_TABLE_BOOKED")) & 1) != 0)
      {
        v302 = 636;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRANSIT_LINE_CLUSTER_SHEET")) & 1) != 0)
      {
        v302 = 637;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRANSIT_LINE_LIST_SHEET")) & 1) != 0)
      {
        v302 = 638;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRANSIT_BALANCE_BANNER")) & 1) != 0)
      {
        v302 = 639;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WEATHER_ICON")) & 1) != 0)
      {
        v302 = 640;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("HELP_IMPROVE_MAPS_DIALOG")) & 1) != 0)
      {
        v302 = 641;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("HELP_IMPROVE_COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
      {
        v302 = 642;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("COMMUTE_PREDICTION_ACCURACY_DIALOG")) & 1) != 0)
      {
        v302 = 643;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FLOOR_PICKER")) & 1) != 0)
      {
        v302 = 644;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("VENUE_LIST")) & 1) != 0)
      {
        v302 = 645;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("AR_MODE")) & 1) != 0)
      {
        v302 = 646;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRANSIT_TICKETS_SHEET")) & 1) != 0)
      {
        v302 = 647;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LINKED_SERVICE_HOURS")) & 1) != 0)
      {
        v302 = 648;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARE_ETA_TRAY")) & 1) != 0)
      {
        v302 = 649;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ETA_UPDATE_TRAY")) & 1) != 0)
      {
        v302 = 650;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SCHEDULECARD_TRAY")) & 1) != 0)
      {
        v302 = 651;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("AR_NAV")) & 1) != 0)
      {
        v302 = 652;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TAP_TRANSIT_ACCESS_POINT")) & 1) != 0)
      {
        v302 = 653;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOCATIONS_INSIDE")) & 1) != 0)
      {
        v302 = 654;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIMILAR_LOCATIONS")) & 1) != 0)
      {
        v302 = 655;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOCATIONS_AT_ADDRESS")) & 1) != 0)
      {
        v302 = 656;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_DIRECTIONS_BANNER_CYCLING")) & 1) != 0)
      {
        v302 = 657;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTE_OPTIONS_CYCLING")) & 1) != 0)
      {
        v302 = 658;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EV_CONNECTION_TRAY")) & 1) != 0)
      {
        v302 = 659;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("VIRTUAL_GARAGE")) & 1) != 0)
      {
        v302 = 660;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_BANNER")) & 1) != 0)
      {
        v302 = 661;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("VIRTUAL_GARAGE_VEHICLE_VIEW")) & 1) != 0)
      {
        v302 = 662;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ADVISORY_DETAILS_PAGE")) & 1) != 0)
      {
        v302 = 663;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("APP_CLIP_NOTIFICATION")) & 1) != 0)
      {
        v302 = 664;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PHOTO_VIEWER_GALLERY")) & 1) != 0)
      {
        v302 = 665;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RECOMMENDATION_CARD")) & 1) != 0)
      {
        v302 = 666;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("INCIDENT_REPORT_TRAY")) & 1) != 0)
      {
        v302 = 667;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_DISPLAY")) & 1) != 0)
      {
        v302 = 668;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("VISUAL_LOCATION_FRAMEWORK")) & 1) != 0)
      {
        v302 = 669;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("APP_CLIP_TRAY")) & 1) != 0)
      {
        v302 = 670;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LICENSE_PLATE_SUGGESTION_PAGE")) & 1) != 0)
      {
        v302 = 671;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_ADD_PLATE")) & 1) != 0)
      {
        v302 = 672;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_RESULTS")) & 1) != 0)
      {
        v302 = 673;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_APP_CONNECTION")) & 1) != 0)
      {
        v302 = 674;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_LOCATION")) & 1) != 0)
      {
        v302 = 675;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_CURRENT_NAV")) & 1) != 0)
      {
        v302 = 676;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_ETA")) & 1) != 0)
      {
        v302 = 677;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_TRANSIT")) & 1) != 0)
      {
        v302 = 678;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_UPC_DESTINATION")) & 1) != 0)
      {
        v302 = 679;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WIDGET_CREATION_TRAY")) & 1) != 0)
      {
        v302 = 680;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_HOME")) & 1) != 0)
      {
        v302 = 681;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_PARKED_CAR")) & 1) != 0)
      {
        v302 = 682;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_POI")) & 1) != 0)
      {
        v302 = 683;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_SCHOOL")) & 1) != 0)
      {
        v302 = 684;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_WORK")) & 1) != 0)
      {
        v302 = 685;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION")) & 1) != 0)
      {
        v302 = 686;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WIDGET_EMPTY")) & 1) != 0)
      {
        v302 = 687;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("COARSE_LOCATION_OPTIONS_PROMPT")) & 1) != 0)
      {
        v302 = 688;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ALLOW_PRECISE_LOCATION_PROMPT")) & 1) != 0)
      {
        v302 = 689;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARE_MY_LOCATION")) & 1) != 0)
      {
        v302 = 690;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MARK_MY_LOCATION")) & 1) != 0)
      {
        v302 = 691;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("AIRPORT_NOTIFICATION_WATCH")) & 1) != 0)
      {
        v302 = 692;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("EDIT_FAVORITE")) & 1) != 0)
      {
        v302 = 693;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_CYCLING_DETAILS")) & 1) != 0)
      {
        v302 = 694;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NAV_CYCLING_DETAILS")) & 1) != 0)
      {
        v302 = 695;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_SUGGESTION_WIDGET")) & 1) != 0)
      {
        v302 = 696;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ARP_TIPKIT")) & 1) != 0)
      {
        v302 = 697;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ARP_PRIVACY")) & 1) != 0)
      {
        v302 = 698;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTE_OPTIONS_WALKING")) & 1) != 0)
      {
        v302 = 699;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SAFARI_SEARCH")) & 1) != 0)
      {
        v302 = 701;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SPOTLIGHT_SEARCH")) & 1) != 0)
      {
        v302 = 702;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SAFARI_MAPS_SEARCH_RESULTS")) & 1) != 0)
      {
        v302 = 703;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SPOTLIGHT_MAPS_SEARCH_RESULTS")) & 1) != 0)
      {
        v302 = 704;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WIDGET_MAPS_DESTINATIONS")) & 1) != 0)
      {
        v302 = 705;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WIDGET_MAPS_TRANSIT")) & 1) != 0)
      {
        v302 = 706;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WIDGET_MAPS_NEARBY")) & 1) != 0)
      {
        v302 = 707;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR")) & 1) != 0)
      {
        v302 = 708;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CONTROL_CENTER")) & 1) != 0)
      {
        v302 = 709;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_CENTER")) & 1) != 0)
      {
        v302 = 710;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_DOOM")) & 1) != 0)
      {
        v302 = 711;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_VENUES")) & 1) != 0)
      {
        v302 = 712;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_RAP_UPDATE")) & 1) != 0)
      {
        v302 = 713;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_CANCELLED")) & 1) != 0)
      {
        v302 = 714;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_STOP_SKIPPED")) & 1) != 0)
      {
        v302 = 715;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_TRIP_DELAYED")) & 1) != 0)
      {
        v302 = 716;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_RAP")) & 1) != 0)
      {
        v302 = 717;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_PROXY_AUTH")) & 1) != 0)
      {
        v302 = 718;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_PUSH_TO_DEVICE")) & 1) != 0)
      {
        v302 = 719;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_LOW_FUEL")) & 1) != 0)
      {
        v302 = 720;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_FIND_MY_CAR_RESET")) & 1) != 0)
      {
        v302 = 721;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_TRAFFIC_CONDITIONS")) & 1) != 0)
      {
        v302 = 722;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA")) & 1) != 0)
      {
        v302 = 723;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("NOTIFICATION_SHARED_ETA_UPDATE")) & 1) != 0)
      {
        v302 = 724;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_UNKNOWN")) & 1) != 0)
      {
        v302 = 725;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_GENERAL")) & 1) != 0)
      {
        v302 = 726;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_FLYOVER")) & 1) != 0)
      {
        v302 = 727;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_TRANSIT")) & 1) != 0)
      {
        v302 = 728;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_VENUES")) & 1) != 0)
      {
        v302 = 729;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_ENHANCED_DETAIL")) & 1) != 0)
      {
        v302 = 730;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LANE_GUIDANCE")) & 1) != 0)
      {
        v302 = 731;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ANNOUNCEMENT_TYPE_LOOK_AROUND")) & 1) != 0)
      {
        v302 = 732;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("APP_SHEET")) & 1) != 0)
      {
        v302 = 733;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CZ_ADVISORY_DETAILS_PAGE")) & 1) != 0)
      {
        v302 = 734;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SHARE_ETA_CONTACT_TRAY")) & 1) != 0)
      {
        v302 = 735;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SHARE_ETA")) & 1) != 0)
      {
        v302 = 736;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA")) & 1) != 0)
      {
        v302 = 737;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SUGGESTION_SHARED_ETA_CARPLAY")) & 1) != 0)
      {
        v302 = 738;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("INCIDENT_ALERT_TRAY")) & 1) != 0)
      {
        v302 = 739;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("INCIDENT_REPORT_CONFIRMATION_TRAY")) & 1) != 0)
      {
        v302 = 740;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_INCIDENT_REPORT_VIEW")) & 1) != 0)
      {
        v302 = 741;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SEARCH_ALONG_ROUTE_CATEGORY_TRAY")) & 1) != 0)
      {
        v302 = 742;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("TRAFFIC_ADVISORY_SHEET")) & 1) != 0)
      {
        v302 = 743;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_PLUGIN_SNIPPET")) & 1) != 0)
      {
        v302 = 801;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_PLUGIN_COMMAND")) & 1) != 0)
      {
        v302 = 802;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_SEARCH_RESULT_LIST")) & 1) != 0)
      {
        v302 = 803;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_DISAMBIGUATION_LIST")) & 1) != 0)
      {
        v302 = 804;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("SIRI_PLACE_SNIPPET")) & 1) != 0)
      {
        v302 = 805;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CHROME")) & 1) != 0)
      {
        v302 = 901;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_NAV")) & 1) != 0)
      {
        v302 = 1001;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_EXPLORE")) & 1) != 0)
      {
        v302 = 1002;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_DESTINATIONS")) & 1) != 0)
      {
        v302 = 1003;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_TRAFFIC_INCIDENT")) & 1) != 0)
      {
        v302 = 1004;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_CONTROL")) & 1) != 0)
      {
        v302 = 1005;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_PROACTIVE")) & 1) != 0)
      {
        v302 = 1006;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_ROUTING")) & 1) != 0)
      {
        v302 = 1007;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_MORE_ROUTES")) & 1) != 0)
      {
        v302 = 1008;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_SEARCH_ALONG_ROUTE")) & 1) != 0)
      {
        v302 = 1009;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_SEARCH")) & 1) != 0)
      {
        v302 = 1010;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_SEARCH_RESULTS")) & 1) != 0)
      {
        v302 = 1011;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_FAVORITES")) & 1) != 0)
      {
        v302 = 1012;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_NAV_CONFIRMATION")) & 1) != 0)
      {
        v302 = 1013;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_DESTINATION_SHARING")) & 1) != 0)
      {
        v302 = 1014;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_BATTERY")) & 1) != 0)
      {
        v302 = 1015;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_DOOM")) & 1) != 0)
      {
        v302 = 1016;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_FUEL")) & 1) != 0)
      {
        v302 = 1017;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_NOTIFICATION_HYBRID")) & 1) != 0)
      {
        v302 = 1018;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_SHARE_ETA_TRAY")) & 1) != 0)
      {
        v302 = 1019;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_ETA_UPDATE_TRAY")) & 1) != 0)
      {
        v302 = 1020;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_ACTION_TRAY")) & 1) != 0)
      {
        v302 = 1021;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_PLACECARD")) & 1) != 0)
      {
        v302 = 1022;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_KEYBOARD")) & 1) != 0)
      {
        v302 = 1023;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_UI_TARGET_UNKNOWN")) & 1) != 0)
      {
        v302 = 1024;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("CARPLAY_EDIT_STOPS")) & 1) != 0)
      {
        v302 = 1025;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_MENU")) & 1) != 0)
      {
        v302 = 1100;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_LIST")) & 1) != 0)
      {
        v302 = 1101;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_INSTRUCTIONS_INCORRECT_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1102;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_BETTER_ROUTE_AVAILABLE_FORM")) & 1) != 0)
      {
        v302 = 1103;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ESTIMATED_TIME_INCORRECT_FORM")) & 1) != 0)
      {
        v302 = 1104;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_FORM")) & 1) != 0)
      {
        v302 = 1105;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_TRANSIT_MENU")) & 1) != 0)
      {
        v302 = 1106;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STATION_MAP")) & 1) != 0)
      {
        v302 = 1107;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STATION_MENU")) & 1) != 0)
      {
        v302 = 1108;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_MAP")) & 1) != 0)
      {
        v302 = 1109;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STATION_ENTRANCE_EXIT_INCORRECT_FORM")) & 1) != 0)
      {
        v302 = 1110;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STATION_CLOSED_FORM")) & 1) != 0)
      {
        v302 = 1111;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LINE_MAP")) & 1) != 0)
      {
        v302 = 1112;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LINE_MENU")) & 1) != 0)
      {
        v302 = 1113;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LINE_NAME_FORM")) & 1) != 0)
      {
        v302 = 1114;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LINE_SHAPE_FORM")) & 1) != 0)
      {
        v302 = 1115;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LINE_SCHEDULE_INCORRECT_FORM")) & 1) != 0)
      {
        v302 = 1116;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_PLACE_MENU")) & 1) != 0)
      {
        v302 = 1117;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_POI_MAP")) & 1) != 0)
      {
        v302 = 1118;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_CATEGORY_LIST")) & 1) != 0)
      {
        v302 = 1119;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_POI_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1120;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_STREET_MAP")) & 1) != 0)
      {
        v302 = 1121;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_STREET_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1122;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_OTHER_MAP")) & 1) != 0)
      {
        v302 = 1123;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_OTHER_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1124;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_CAMERA")) & 1) != 0)
      {
        v302 = 1125;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LABEL_MAP")) & 1) != 0)
      {
        v302 = 1126;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LABEL_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1127;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SEARCH_MENU")) & 1) != 0)
      {
        v302 = 1128;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SEARCH_UNEXPECTED_RESULT_FORM")) & 1) != 0)
      {
        v302 = 1129;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SEARCH_ADDRESS_INCORRECT_FORM")) & 1) != 0)
      {
        v302 = 1130;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_MAP")) & 1) != 0)
      {
        v302 = 1131;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SEARCH_LOCATION_INCORRECT_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1132;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_MAP")) & 1) != 0)
      {
        v302 = 1133;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SATELLITE_IMAGE_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1134;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_OTHER_FORM")) & 1) != 0)
      {
        v302 = 1135;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_PRIVACY")) & 1) != 0)
      {
        v302 = 1136;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_CONFIRMATION")) & 1) != 0)
      {
        v302 = 1137;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_POI_MENU")) & 1) != 0)
      {
        v302 = 1138;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_SEARCH_AUTOCOMPLETE_MENU")) & 1) != 0)
      {
        v302 = 1139;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_A_PLACE_MAP")) & 1) != 0)
      {
        v302 = 1140;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_POI_LOCATION_MAP")) & 1) != 0)
      {
        v302 = 1141;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT_MAP")) & 1) != 0)
      {
        v302 = 1142;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_POI_CLOSED_FORM")) & 1) != 0)
      {
        v302 = 1143;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_CLAIM_BUSINESS_DIALOG")) & 1) != 0)
      {
        v302 = 1144;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_BRAND_MENU")) & 1) != 0)
      {
        v302 = 1145;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_BRAND_DETAILS_FORM")) & 1) != 0)
      {
        v302 = 1146;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_IMAGE_QUALITY_FORM")) & 1) != 0)
      {
        v302 = 1147;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STREET_FORM")) & 1) != 0)
      {
        v302 = 1148;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_BLURRING_FORM")) & 1) != 0)
      {
        v302 = 1149;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_REMOVE_HOME_FORM")) & 1) != 0)
      {
        v302 = 1150;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_MENU")) & 1) != 0)
      {
        v302 = 1151;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_LABELS_STORE_FORM")) & 1) != 0)
      {
        v302 = 1152;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND_PRIVACY_MENU")) & 1) != 0)
      {
        v302 = 1153;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LIGHTWEIGHT")) & 1) != 0)
      {
        v302 = 1154;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_EDIT_PLACE_DETAILS")) & 1) != 0)
      {
        v302 = 1155;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_CATEGORY")) & 1) != 0)
      {
        v302 = 1156;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_HOURS")) & 1) != 0)
      {
        v302 = 1157;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_EDIT_LOCATION")) & 1) != 0)
      {
        v302 = 1158;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_EDIT_ENTRY_POINT")) & 1) != 0)
      {
        v302 = 1159;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_LOOK_AROUND")) & 1) != 0)
      {
        v302 = 1160;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("RAP_ADD_ENTRY_POINT")) & 1) != 0)
      {
        v302 = 1161;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MAIN_MENU")) & 1) != 0)
      {
        v302 = 1201;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MAIN_PRESS_MENU")) & 1) != 0)
      {
        v302 = 1202;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SEARCH")) & 1) != 0)
      {
        v302 = 1203;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_DICTATION")) & 1) != 0)
      {
        v302 = 1204;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_FAVORITES")) & 1) != 0)
      {
        v302 = 1205;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SUB_CATEGORY_LIST")) & 1) != 0)
      {
        v302 = 1206;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SEARCH_RESULTS_LIST")) & 1) != 0)
      {
        v302 = 1207;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MAP_VIEW")) & 1) != 0)
      {
        v302 = 1208;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_PLACECARD")) & 1) != 0)
      {
        v302 = 1209;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING")) & 1) != 0)
      {
        v302 = 1210;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_DETAILS")) & 1) != 0)
      {
        v302 = 1211;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_TBT")) & 1) != 0)
      {
        v302 = 1212;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_MAP")) & 1) != 0)
      {
        v302 = 1213;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_PRESS_MENU")) & 1) != 0)
      {
        v302 = 1214;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_MAP_PRESS_MENU")) & 1) != 0)
      {
        v302 = 1215;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTING_PRESS_MENU")) & 1) != 0)
      {
        v302 = 1216;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_TRANSIT_MAP_VIEW")) & 1) != 0)
      {
        v302 = 1217;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SCRIBBLE")) & 1) != 0)
      {
        v302 = 1218;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_COLLECTION_VIEW")) & 1) != 0)
      {
        v302 = 1219;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_WALKING")) & 1) != 0)
      {
        v302 = 1220;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_DRIVING")) & 1) != 0)
      {
        v302 = 1221;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_TRANSIT")) & 1) != 0)
      {
        v302 = 1222;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_PAIRED_DEVICE")) & 1) != 0)
      {
        v302 = 1223;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_SPLIT")) & 1) != 0)
      {
        v302 = 1224;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_PLATTER")) & 1) != 0)
      {
        v302 = 1225;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_DRIVING_MAP")) & 1) != 0)
      {
        v302 = 1226;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_SPLIT")) & 1) != 0)
      {
        v302 = 1227;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_PLATTER")) & 1) != 0)
      {
        v302 = 1228;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_WALKING_MAP")) & 1) != 0)
      {
        v302 = 1229;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_SPLIT")) & 1) != 0)
      {
        v302 = 1230;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_PLATTER")) & 1) != 0)
      {
        v302 = 1231;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_TRANSIT_MAP")) & 1) != 0)
      {
        v302 = 1232;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_INFO")) & 1) != 0)
      {
        v302 = 1233;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_MAP")) & 1) != 0)
      {
        v302 = 1234;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_PLATTER")) & 1) != 0)
      {
        v302 = 1235;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_NAV_CYCLING_SPLIT")) & 1) != 0)
      {
        v302 = 1236;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_ROUTE_PLANNING_CYCLING")) & 1) != 0)
      {
        v302 = 1237;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SEARCH_INPUT")) & 1) != 0)
      {
        v302 = 1238;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_MULTIPOINT_ROUTE")) & 1) != 0)
      {
        v302 = 1239;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("WATCH_SIRI_SUGGESTION_RESUME_ROUTE")) & 1) != 0)
      {
        v302 = 1240;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_LIST")) & 1) != 0)
      {
        v302 = 1301;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_FORM")) & 1) != 0)
      {
        v302 = 1302;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_LABEL_FORM")) & 1) != 0)
      {
        v302 = 1303;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_EDIT_MAP")) & 1) != 0)
      {
        v302 = 1304;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION")) & 1) != 0)
      {
        v302 = 1305;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_DELETE_DIALOG")) & 1) != 0)
      {
        v302 = 1306;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_INFO")) & 1) != 0)
      {
        v302 = 1307;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH")) & 1) != 0)
      {
        v302 = 1308;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_ADDRESS_SEARCH_RESULTS")) & 1) != 0)
      {
        v302 = 1309;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FAVORITE_SEARCH")) & 1) != 0)
      {
        v302 = 1310;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FAVORITE_LIST")) & 1) != 0)
      {
        v302 = 1311;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("FAVORITE_INFO")) & 1) != 0)
      {
        v302 = 1312;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PERSONALIZED_CONFIRMATION_WITH_PRIVACY")) & 1) != 0)
      {
        v302 = 1313;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_RIDE_OPTIONS")) & 1) != 0)
      {
        v302 = 1401;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_DETAILS_PICKING")) & 1) != 0)
      {
        v302 = 1402;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_REQUESTING")) & 1) != 0)
      {
        v302 = 1403;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_CONFIRMATION_CONFIRMED")) & 1) != 0)
      {
        v302 = 1404;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_SURGE_PRICING_DIALOG")) & 1) != 0)
      {
        v302 = 1405;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_FEEDBACK")) & 1) != 0)
      {
        v302 = 1406;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("ROUTING_TRAY_RIDESHARE_ENABLE_ALL")) & 1) != 0)
      {
        v302 = 1407;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_HEADER")) & 1) != 0)
      {
        v302 = 1501;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_ADDRESS")) & 1) != 0)
      {
        v302 = 1502;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_PHONE")) & 1) != 0)
      {
        v302 = 1503;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("PLACECARD_URL")) & 1) != 0)
      {
        v302 = 1504;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MENU_ITEM_DARK_MAP")) & 1) != 0)
      {
        v302 = 1601;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_PIP")) & 1) != 0)
      {
        v302 = 1700;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_ACTION_SHEET")) & 1) != 0)
      {
        v302 = 1701;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW")) & 1) != 0)
      {
        v302 = 1702;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_PLATTER")) & 1) != 0)
      {
        v302 = 1703;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_ZOOM")) & 1) != 0)
      {
        v302 = 1704;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_UNAVAILABLE_REGION")) & 1) != 0)
      {
        v302 = 1705;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_VIEW_PLACECARD")) & 1) != 0)
      {
        v302 = 1706;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("LOOK_AROUND_PIP_PLACECARD")) & 1) != 0)
      {
        v302 = 1707;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("OFFLINE_BROWSE_ONLY_SEARCH_TRAY")) & 1) != 0)
      {
        v302 = 1708;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_PLACE")) & 1) != 0)
      {
        v302 = 1801;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH")) & 1) != 0)
      {
        v302 = 1802;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_SEARCH_RESULTS")) & 1) != 0)
      {
        v302 = 1803;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_PUBLISHER")) & 1) != 0)
      {
        v302 = 1804;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_GUIDE")) & 1) != 0)
      {
        v302 = 1805;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_GUIDES_HOME")) & 1) != 0)
      {
        v302 = 1806;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_RELATED_PLACES_LIST")) & 1) != 0)
      {
        v302 = 1807;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_COLLECTION_LIST")) & 1) != 0)
      {
        v302 = 1808;
      }
      else if ((objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_DIRECTIONS")) & 1) != 0)
      {
        v302 = 1809;
      }
      else if (objc_msgSend(v301, "isEqualToString:", CFSTR("MAPS_WEB_SIDEBAR")))
      {
        v302 = 1810;
      }
      else
      {
        v302 = 0;
      }
      v5 = v447;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_1799;
    v302 = objc_msgSend(v300, "intValue");
  }
  objc_msgSend(a1, "setRestoreUiTarget:", v302);
LABEL_1799:

  if (a3)
    v303 = CFSTR("mapLaunchSourceAppId");
  else
    v303 = CFSTR("map_launch_source_app_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v303);
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v305 = (void *)objc_msgSend(v304, "copy");
    objc_msgSend(a1, "setMapLaunchSourceAppId:", v305);

  }
  if (a3)
    v306 = CFSTR("mapLaunchLaunchUri");
  else
    v306 = CFSTR("map_launch_launch_uri");
  objc_msgSend(v5, "objectForKeyedSubscript:", v306);
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v308 = (void *)objc_msgSend(v307, "copy");
    objc_msgSend(a1, "setMapLaunchLaunchUri:", v308);

  }
  if (a3)
    v309 = CFSTR("mapLaunchReferringWebsite");
  else
    v309 = CFSTR("map_launch_referring_website");
  objc_msgSend(v5, "objectForKeyedSubscript:", v309);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v311 = (void *)objc_msgSend(v310, "copy");
    objc_msgSend(a1, "setMapLaunchReferringWebsite:", v311);

  }
  if (a3)
    v312 = CFSTR("mapLaunchIsHandoff");
  else
    v312 = CFSTR("map_launch_is_handoff");
  objc_msgSend(v5, "objectForKeyedSubscript:", v312);
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapLaunchIsHandoff:", objc_msgSend(v313, "BOOLValue"));

  if (a3)
    v314 = CFSTR("mapLaunchSourceHandoffDevice");
  else
    v314 = CFSTR("map_launch_source_handoff_device");
  objc_msgSend(v5, "objectForKeyedSubscript:", v314);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v316 = (void *)objc_msgSend(v315, "copy");
    objc_msgSend(a1, "setMapLaunchSourceHandoffDevice:", v316);

  }
  if (a3)
    v317 = CFSTR("mapLaunchAction");
  else
    v317 = CFSTR("map_launch_action");
  objc_msgSend(v5, "objectForKeyedSubscript:", v317);
  v318 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v319 = v318;
    if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_Unknown")) & 1) != 0)
    {
      v320 = 0;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowLPROnboardingAction")) & 1) != 0)
    {
      v320 = 1;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowCarDestinationsAction")) & 1) != 0)
    {
      v320 = 2;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_SharedTripAction")) & 1) != 0)
    {
      v320 = 3;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowCollectionAction")) & 1) != 0)
    {
      v320 = 4;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_BrandAction")) & 1) != 0)
    {
      v320 = 5;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_DirectionAction")) & 1) != 0)
    {
      v320 = 6;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_DisplayModeNavAction")) & 1) != 0)
    {
      v320 = 7;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ErrorAction")) & 1) != 0)
    {
      v320 = 8;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ForwardGeocodeAction")) & 1) != 0)
    {
      v320 = 9;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_LowFuelAction")) & 1) != 0)
    {
      v320 = 10;
    }
    else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_MarkUserLocationAction")) & 1) != 0)
    {
      v320 = 11;
    }
    else
    {
      if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_NotificationRestorationAction")) & 1) != 0)
      {
        v320 = 12;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_OpenLookAroundAction")) & 1) != 0)
      {
        v320 = 13;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PlaceRefinementAction")) & 1) != 0)
      {
        v320 = 14;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentAnnouncementAction")) & 1) != 0)
      {
        v320 = 15;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentFlyoverAction")) & 1) != 0)
      {
        v320 = 16;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentNavShareETAAction")) & 1) != 0)
      {
        v320 = 17;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentNearbySearchAction")) & 1) != 0)
      {
        v320 = 18;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentParkedCarAction")) & 1) != 0)
      {
        v320 = 19;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentRAPAction")) & 1) != 0)
      {
        v320 = 20;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentPhotoThumbnailGalleryAction")) & 1) != 0)
      {
        v320 = 21;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_PresentTableBookingAction")) & 1) != 0)
      {
        v320 = 22;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_RefineMapItemAction")) & 1) != 0)
      {
        v320 = 23;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ResetAction")) & 1) != 0)
      {
        v320 = 24;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ResolveMUIDAction")) & 1) != 0)
      {
        v320 = 25;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_RestorationAction")) & 1) != 0)
      {
        v320 = 26;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ReverseGeocodeAction")) & 1) != 0)
      {
        v320 = 27;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_SearchAction")) & 1) != 0)
      {
        v320 = 28;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_SearchSelectionAction")) & 1) != 0)
      {
        v320 = 29;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShareUserLocationAction")) & 1) != 0)
      {
        v320 = 30;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowKeyboardAction")) & 1) != 0)
      {
        v320 = 31;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowSearchInfoAction")) & 1) != 0)
      {
        v320 = 32;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ZoomMapAction")) & 1) != 0)
      {
        v320 = 33;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowCuratedCollectionAction")) & 1) != 0)
      {
        v320 = 34;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowPublisherAction")) & 1) != 0)
      {
        v320 = 35;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_NewWindowAction")) & 1) != 0)
      {
        v320 = 36;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ShowAllCuratedCollectionsAction")) & 1) != 0)
      {
        v320 = 37;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_ReportIncidentAction")) & 1) != 0)
      {
        v320 = 38;
      }
      else if ((objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_URLRestorationAction")) & 1) != 0)
      {
        v320 = 39;
      }
      else if (objc_msgSend(v319, "isEqualToString:", CFSTR("AP_LaunchAction_SiriRestorationAction")))
      {
        v320 = 40;
      }
      else
      {
        v320 = 0;
      }
      v5 = v447;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_1916;
    v320 = objc_msgSend(v318, "intValue");
  }
  objc_msgSend(a1, "setMapLaunchAction:", v320);
LABEL_1916:

  if (a3)
    v321 = CFSTR("curatedCollectionState");
  else
    v321 = CFSTR("curated_collection_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v321);
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v323 = [GEOLogMsgStateCuratedCollection alloc];
    if ((a3 & 1) != 0)
      v324 = -[GEOLogMsgStateCuratedCollection initWithJSON:](v323, "initWithJSON:", v322);
    else
      v324 = -[GEOLogMsgStateCuratedCollection initWithDictionary:](v323, "initWithDictionary:", v322);
    v325 = (void *)v324;
    objc_msgSend(a1, "setCuratedCollectionState:", v324);

  }
  if (a3)
    v326 = CFSTR("mapSettingsAvoidHills");
  else
    v326 = CFSTR("map_settings_avoid_hills");
  objc_msgSend(v5, "objectForKeyedSubscript:", v326);
  v327 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsAvoidHills:", objc_msgSend(v327, "BOOLValue"));

  if (a3)
    v328 = CFSTR("mapSettingsAvoidStairs");
  else
    v328 = CFSTR("map_settings_avoid_stairs");
  objc_msgSend(v5, "objectForKeyedSubscript:", v328);
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsAvoidStairs:", objc_msgSend(v329, "BOOLValue"));

  if (a3)
    v330 = CFSTR("mapSettingsAvoidBusyRoads");
  else
    v330 = CFSTR("map_settings_avoid_busy_roads");
  objc_msgSend(v5, "objectForKeyedSubscript:", v330);
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsAvoidBusyRoads:", objc_msgSend(v331, "BOOLValue"));

  if (a3)
    v332 = CFSTR("mapSettingsLocationPrecisionType");
  else
    v332 = CFSTR("map_settings_location_precision_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v332);
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v334 = v333;
    if ((objc_msgSend(v334, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_UNKNOWN")) & 1) != 0)
    {
      v335 = 0;
    }
    else if ((objc_msgSend(v334, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_NO_AUTH")) & 1) != 0)
    {
      v335 = 1;
    }
    else if ((objc_msgSend(v334, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_PRECISE")) & 1) != 0)
    {
      v335 = 2;
    }
    else if (objc_msgSend(v334, "isEqualToString:", CFSTR("AP_LOCATIONPRECISIONTYPE_COARSE")))
    {
      v335 = 3;
    }
    else
    {
      v335 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_1956;
    v335 = objc_msgSend(v333, "intValue");
  }
  objc_msgSend(a1, "setMapSettingsLocationPrecisionType:", v335);
LABEL_1956:

  if (a3)
    v336 = CFSTR("mapSettingsEBike");
  else
    v336 = CFSTR("map_settings_e_bike");
  objc_msgSend(v5, "objectForKeyedSubscript:", v336);
  v337 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsEBike:", objc_msgSend(v337, "BOOLValue"));

  if (a3)
    v338 = CFSTR("ugcPhotoState");
  else
    v338 = CFSTR("ugc_photo_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v338);
  v339 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v340 = [GEOLogMsgStateUGCPhoto alloc];
    if ((a3 & 1) != 0)
      v341 = -[GEOLogMsgStateUGCPhoto initWithJSON:](v340, "initWithJSON:", v339);
    else
      v341 = -[GEOLogMsgStateUGCPhoto initWithDictionary:](v340, "initWithDictionary:", v339);
    v342 = (void *)v341;
    objc_msgSend(a1, "setUgcPhotoState:", v341);

  }
  if (a3)
    v343 = CFSTR("metroRegion");
  else
    v343 = CFSTR("metro_region");
  objc_msgSend(v5, "objectForKeyedSubscript:", v343);
  v344 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v345 = (void *)objc_msgSend(v344, "copy");
    objc_msgSend(a1, "setMetroRegion:", v345);

  }
  if (a3)
    v346 = CFSTR("userHomeMetro");
  else
    v346 = CFSTR("user_home_metro");
  objc_msgSend(v5, "objectForKeyedSubscript:", v346);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v348 = (void *)objc_msgSend(v347, "copy");
    objc_msgSend(a1, "setUserHomeMetro:", v348);

  }
  if (a3)
    v349 = CFSTR("userHomeCountry");
  else
    v349 = CFSTR("user_home_country");
  objc_msgSend(v5, "objectForKeyedSubscript:", v349);
  v350 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v351 = (void *)objc_msgSend(v350, "copy");
    objc_msgSend(a1, "setUserHomeCountry:", v351);

  }
  if (a3)
    v352 = CFSTR("mapSettingsDrivingVoiceSettings");
  else
    v352 = CFSTR("map_settings_driving_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v352);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v354 = v353;
    if ((objc_msgSend(v354, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v355 = 0;
    }
    else if ((objc_msgSend(v354, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v355 = 1;
    }
    else if ((objc_msgSend(v354, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v355 = 2;
    }
    else if (objc_msgSend(v354, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v355 = 3;
    }
    else
    {
      v355 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_2001;
    v355 = objc_msgSend(v353, "intValue");
  }
  objc_msgSend(a1, "setMapSettingsDrivingVoiceSettings:", v355);
LABEL_2001:

  if (a3)
    v356 = CFSTR("mapSettingsWalkingVoiceSettings");
  else
    v356 = CFSTR("map_settings_walking_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v356);
  v357 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v358 = v357;
    if ((objc_msgSend(v358, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v359 = 0;
    }
    else if ((objc_msgSend(v358, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v359 = 1;
    }
    else if ((objc_msgSend(v358, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v359 = 2;
    }
    else if (objc_msgSend(v358, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v359 = 3;
    }
    else
    {
      v359 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_2018;
    v359 = objc_msgSend(v357, "intValue");
  }
  objc_msgSend(a1, "setMapSettingsWalkingVoiceSettings:", v359);
LABEL_2018:

  if (a3)
    v360 = CFSTR("mapSettingsCyclingVoiceSettings");
  else
    v360 = CFSTR("map_settings_cycling_voice_settings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v360);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v362 = v361;
    if ((objc_msgSend(v362, "isEqualToString:", CFSTR("LEVEL_UNKNOWN")) & 1) != 0)
    {
      v363 = 0;
    }
    else if ((objc_msgSend(v362, "isEqualToString:", CFSTR("LEVEL_NONE")) & 1) != 0)
    {
      v363 = 1;
    }
    else if ((objc_msgSend(v362, "isEqualToString:", CFSTR("LEVEL_INCIDENTS")) & 1) != 0)
    {
      v363 = 2;
    }
    else if (objc_msgSend(v362, "isEqualToString:", CFSTR("LEVEL_FULL")))
    {
      v363 = 3;
    }
    else
    {
      v363 = 0;
    }

    goto LABEL_2034;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v363 = objc_msgSend(v361, "intValue");
LABEL_2034:
    objc_msgSend(a1, "setMapSettingsCyclingVoiceSettings:", v363);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("account"));
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v365 = [GEOLogMsgStateAccount alloc];
    if ((a3 & 1) != 0)
      v366 = -[GEOLogMsgStateAccount initWithJSON:](v365, "initWithJSON:", v364);
    else
      v366 = -[GEOLogMsgStateAccount initWithDictionary:](v365, "initWithDictionary:", v364);
    v367 = (void *)v366;
    objc_msgSend(a1, "setAccount:", v366);

  }
  if (a3)
    v368 = CFSTR("mapFeaturePersonalCollectionsCount");
  else
    v368 = CFSTR("map_feature_personal_collections_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v368);
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeaturePersonalCollectionsCount:", objc_msgSend(v369, "intValue"));

  if (a3)
    v370 = CFSTR("mapFeatureSavedCollectionsCount");
  else
    v370 = CFSTR("map_feature_saved_collections_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v370);
  v371 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureSavedCollectionsCount:", objc_msgSend(v371, "intValue"));

  if (a3)
    v372 = CFSTR("mapFeatureSubmittedRatingsCount");
  else
    v372 = CFSTR("map_feature_submitted_ratings_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v372);
  v373 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureSubmittedRatingsCount:", objc_msgSend(v373, "intValue"));

  if (a3)
    v374 = CFSTR("mapFeatureSubmittedPhotosCount");
  else
    v374 = CFSTR("map_feature_submitted_photos_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v374);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureSubmittedPhotosCount:", objc_msgSend(v375, "intValue"));

  if (a3)
    v376 = CFSTR("mapFeatureElectronicVehicleCount");
  else
    v376 = CFSTR("map_feature_electronic_vehicle_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v376);
  v377 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureElectronicVehicleCount:", objc_msgSend(v377, "intValue"));

  if (a3)
    v378 = CFSTR("mapFeatureLicensePlateCount");
  else
    v378 = CFSTR("map_feature_license_plate_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v378);
  v379 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureLicensePlateCount:", objc_msgSend(v379, "intValue"));

  if (a3)
    v380 = CFSTR("suggestionsSiriEnabled");
  else
    v380 = CFSTR("suggestions_siri_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v380);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setSuggestionsSiriEnabled:", objc_msgSend(v381, "BOOLValue"));

  if (a3)
    v382 = CFSTR("mapFeatureIsHomeFavoriteSet");
  else
    v382 = CFSTR("map_feature_is_home_favorite_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v382);
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureIsHomeFavoriteSet:", objc_msgSend(v383, "BOOLValue"));

  if (a3)
    v384 = CFSTR("mapFeatureIsWorkFavoriteSet");
  else
    v384 = CFSTR("map_feature_is_work_favorite_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v384);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureIsWorkFavoriteSet:", objc_msgSend(v385, "BOOLValue"));

  if (a3)
    v386 = CFSTR("mapFeatureIsSchoolFavoriteSet");
  else
    v386 = CFSTR("map_feature_is_school_favorite_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v386);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureIsSchoolFavoriteSet:", objc_msgSend(v387, "BOOLValue"));

  if (a3)
    v388 = CFSTR("mapFeatureIsTransitFavoriteSet");
  else
    v388 = CFSTR("map_feature_is_transit_favorite_set");
  objc_msgSend(v5, "objectForKeyedSubscript:", v388);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureIsTransitFavoriteSet:", objc_msgSend(v389, "BOOLValue"));

  if (a3)
    v390 = CFSTR("mapFeatureFavoritesCount");
  else
    v390 = CFSTR("map_feature_favorites_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v390);
  v391 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureFavoritesCount:", objc_msgSend(v391, "intValue"));

  if (a3)
    v392 = CFSTR("mapFeatureLibrarySavedPlacesCount");
  else
    v392 = CFSTR("map_feature_library_saved_places_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v392);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureLibrarySavedPlacesCount:", objc_msgSend(v393, "intValue"));

  if (a3)
    v394 = CFSTR("mapFeatureLibraryPlacesWithNoteCount");
  else
    v394 = CFSTR("map_feature_library_places_with_note_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v394);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureLibraryPlacesWithNoteCount:", objc_msgSend(v395, "intValue"));

  if (a3)
    v396 = CFSTR("mapFeatureLibraryGuidesSavedPlacesCount");
  else
    v396 = CFSTR("map_feature_library_guides_saved_places_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v396);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureLibraryGuidesSavedPlacesCount:", objc_msgSend(v397, "intValue"));

  if (a3)
    v398 = CFSTR("mapFeatureLibraryFavoritesGuideSavedPlacesCount");
  else
    v398 = CFSTR("map_feature_library_favorites_guide_saved_places_count");
  objc_msgSend(v5, "objectForKeyedSubscript:", v398);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapFeatureLibraryFavoritesGuideSavedPlacesCount:", objc_msgSend(v399, "intValue"));

  if (a3)
    v400 = CFSTR("mapSettingsNotificationsEnabled");
  else
    v400 = CFSTR("map_settings_notifications_enabled");
  objc_msgSend(v5, "objectForKeyedSubscript:", v400);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setMapSettingsNotificationsEnabled:", objc_msgSend(v401, "BOOLValue"));

  if (a3)
    v402 = CFSTR("searchResultsState");
  else
    v402 = CFSTR("search_results_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v402);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v404 = [GEOLogMsgStateSearchResults alloc];
    if ((a3 & 1) != 0)
      v405 = -[GEOLogMsgStateSearchResults initWithJSON:](v404, "initWithJSON:", v403);
    else
      v405 = -[GEOLogMsgStateSearchResults initWithDictionary:](v404, "initWithDictionary:", v403);
    v406 = (void *)v405;
    objc_msgSend(a1, "setSearchResultsState:", v405);

  }
  if (a3)
    v407 = CFSTR("impressionObjectState");
  else
    v407 = CFSTR("impression_object_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v407);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v409 = [GEOLogMsgStateImpressionObject alloc];
    if ((a3 & 1) != 0)
      v410 = -[GEOLogMsgStateImpressionObject initWithJSON:](v409, "initWithJSON:", v408);
    else
      v410 = -[GEOLogMsgStateImpressionObject initWithDictionary:](v409, "initWithDictionary:", v408);
    v411 = (void *)v410;
    objc_msgSend(a1, "setImpressionObjectState:", v410);

  }
  if (a3)
    v412 = CFSTR("tapEventState");
  else
    v412 = CFSTR("tap_event_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v412);
  v413 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v414 = [GEOLogMsgStateTapEvent alloc];
    if ((a3 & 1) != 0)
      v415 = -[GEOLogMsgStateTapEvent initWithJSON:](v414, "initWithJSON:", v413);
    else
      v415 = -[GEOLogMsgStateTapEvent initWithDictionary:](v414, "initWithDictionary:", v413);
    v416 = (void *)v415;
    objc_msgSend(a1, "setTapEventState:", v415);

  }
  if (a3)
    v417 = CFSTR("actionButtonDetailsState");
  else
    v417 = CFSTR("action_button_details_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v417);
  v418 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v419 = [GEOLogMsgStateActionButtonDetails alloc];
    if ((a3 & 1) != 0)
      v420 = -[GEOLogMsgStateActionButtonDetails initWithJSON:](v419, "initWithJSON:", v418);
    else
      v420 = -[GEOLogMsgStateActionButtonDetails initWithDictionary:](v419, "initWithDictionary:", v418);
    v421 = (void *)v420;
    objc_msgSend(a1, "setActionButtonDetailsState:", v420);

  }
  if (a3)
    v422 = CFSTR("photoSubmissionDetailsState");
  else
    v422 = CFSTR("photo_submission_details_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v422);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v424 = [GEOLogMsgStateARPPhotoSubmission alloc];
    if ((a3 & 1) != 0)
      v425 = -[GEOLogMsgStateARPPhotoSubmission initWithJSON:](v424, "initWithJSON:", v423);
    else
      v425 = -[GEOLogMsgStateARPPhotoSubmission initWithDictionary:](v424, "initWithDictionary:", v423);
    v426 = (void *)v425;
    objc_msgSend(a1, "setPhotoSubmissionDetailsState:", v425);

  }
  if (a3)
    v427 = CFSTR("ratingSubmissionDetailsState");
  else
    v427 = CFSTR("rating_submission_details_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v427);
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v429 = [GEOLogMsgStateARPRatingSubmission alloc];
    if ((a3 & 1) != 0)
      v430 = -[GEOLogMsgStateARPRatingSubmission initWithJSON:](v429, "initWithJSON:", v428);
    else
      v430 = -[GEOLogMsgStateARPRatingSubmission initWithDictionary:](v429, "initWithDictionary:", v428);
    v431 = (void *)v430;
    objc_msgSend(a1, "setRatingSubmissionDetailsState:", v430);

  }
  if (a3)
    v432 = CFSTR("ratingPhotoSubmissionDetailsState");
  else
    v432 = CFSTR("rating_photo_submission_details_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v432);
  v433 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v434 = [GEOLogMsgStateARPRatingPhotoSubmission alloc];
    if ((a3 & 1) != 0)
      v435 = -[GEOLogMsgStateARPRatingPhotoSubmission initWithJSON:](v434, "initWithJSON:", v433);
    else
      v435 = -[GEOLogMsgStateARPRatingPhotoSubmission initWithDictionary:](v434, "initWithDictionary:", v433);
    v436 = (void *)v435;
    objc_msgSend(a1, "setRatingPhotoSubmissionDetailsState:", v435);

  }
  if (a3)
    v437 = CFSTR("mapsPlaceIdsState");
  else
    v437 = CFSTR("maps_place_ids_state");
  objc_msgSend(v5, "objectForKeyedSubscript:", v437);
  v438 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v439 = [GEOLogMsgStateMapsPlaceIds alloc];
    if ((a3 & 1) != 0)
      v440 = -[GEOLogMsgStateMapsPlaceIds initWithJSON:](v439, "initWithJSON:", v438);
    else
      v440 = -[GEOLogMsgStateMapsPlaceIds initWithDictionary:](v439, "initWithDictionary:", v438);
    v441 = (void *)v440;
    objc_msgSend(a1, "setMapsPlaceIdsState:", v440);

  }
  if (a3)
    v442 = CFSTR("isInternalTool");
  else
    v442 = CFSTR("is_internal_tool");
  objc_msgSend(v5, "objectForKeyedSubscript:", v442);
  v443 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setIsInternalTool:", objc_msgSend(v443, "BOOLValue"));

  a1 = a1;
LABEL_2195:

  return a1;
}

- (GEOAnalyticsPipelineStateData)initWithJSON:(id)a3
{
  return (GEOAnalyticsPipelineStateData *)-[GEOAnalyticsPipelineStateData _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_79;
    else
      v8 = (int *)&readAll__nonRecursiveTag_79;
    GEOAnalyticsPipelineStateDataReadSpecified((uint64_t)self, (char *)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOAnalyticsPipelineStateDataCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOAnalyticsPipelineStateDataIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOAnalyticsPipelineStateDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *p_flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  PBDataReader *v37;
  void *v38;
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
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOAnalyticsPipelineStateDataIsDirty((uint64_t)self) & 1) == 0)
  {
    v37 = self->_reader;
    objc_sync_enter(v37);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v38);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v37);
    goto LABEL_318;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAnalyticsPipelineStateData readAll:](self, "readAll:", 0);
  if (self->_deviceInputLocale)
    PBDataWriterWriteStringField();
  if (self->_deviceOutputLocale)
    PBDataWriterWriteStringField();
  if (self->_carPlayInfo)
    PBDataWriterWriteSubmessage();
  p_flags = &self->_flags;
  v7 = *((_QWORD *)&self->_flags + 1);
  if ((v7 & 0x100000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = *((_QWORD *)&self->_flags + 1);
  }
  v8 = *(_QWORD *)p_flags;
  if ((v7 & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = *(_QWORD *)p_flags;
    v7 = *((_QWORD *)&self->_flags + 1);
    if ((v7 & 0x800000000) == 0)
    {
LABEL_13:
      if ((v7 & 0x400000000) == 0)
        goto LABEL_14;
      goto LABEL_23;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  v8 = *(_QWORD *)p_flags;
  if ((*((_QWORD *)&self->_flags + 1) & 0x400000000) == 0)
  {
LABEL_14:
    if ((v8 & 0x40) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_23:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)p_flags & 0x40) != 0)
LABEL_15:
    PBDataWriterWriteDoubleField();
LABEL_16:
  if (self->_mapViewMapRegion)
    PBDataWriterWriteSubmessage();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x8000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = *(_QWORD *)p_flags;
    v10 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)p_flags & 0x20) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x20) != 0)
  {
LABEL_26:
    PBDataWriterWriteDoubleField();
    v9 = *(_QWORD *)p_flags;
    v10 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_27:
  if ((v9 & 0x10) != 0)
  {
    PBDataWriterWriteDoubleField();
    v9 = *(_QWORD *)p_flags;
    v10 = *((_QWORD *)&self->_flags + 1);
    if ((v10 & 0x800000) == 0)
    {
LABEL_29:
      if ((v10 & 0x1000000) == 0)
        goto LABEL_30;
      goto LABEL_73;
    }
  }
  else if ((v10 & 0x800000) == 0)
  {
    goto LABEL_29;
  }
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x1000000) == 0)
  {
LABEL_30:
    if ((v9 & 0x10000000000) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x10000000000) == 0)
  {
LABEL_31:
    if ((v10 & 0x2000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x2000000) == 0)
  {
LABEL_32:
    if ((v9 & 8) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 8) == 0)
  {
LABEL_33:
    if ((v10 & 0x4000000) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteDoubleField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x4000000) == 0)
  {
LABEL_34:
    if ((v9 & 0x40000000) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x40000000) == 0)
  {
LABEL_35:
    if ((v9 & 0x80000000) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x80000000) == 0)
  {
LABEL_36:
    if ((v10 & 0x10) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x10) == 0)
  {
LABEL_37:
    if ((v10 & 0x80) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x80) == 0)
  {
LABEL_38:
    if ((v10 & 0x400) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x400) == 0)
  {
LABEL_39:
    if ((v10 & 0x800) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x800) == 0)
  {
LABEL_40:
    if ((v10 & 0x2000) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x2000) == 0)
  {
LABEL_41:
    if ((v10 & 0x8000) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x8000) == 0)
  {
LABEL_42:
    if ((v10 & 0x10000) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x10000) == 0)
  {
LABEL_43:
    if ((v10 & 0x20000) == 0)
      goto LABEL_44;
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x20000) == 0)
  {
LABEL_44:
    if ((v10 & 0x1000) == 0)
      goto LABEL_45;
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x1000) == 0)
  {
LABEL_45:
    if ((v10 & 0x80000) == 0)
      goto LABEL_46;
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x80000) == 0)
  {
LABEL_46:
    if ((v10 & 0x40000) == 0)
      goto LABEL_47;
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x40000) == 0)
  {
LABEL_47:
    if ((v10 & 0x100000) == 0)
      goto LABEL_48;
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x100000) == 0)
  {
LABEL_48:
    if ((v10 & 0x100) == 0)
      goto LABEL_49;
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x100) == 0)
  {
LABEL_49:
    if ((v9 & 0x400000000) == 0)
      goto LABEL_50;
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x400000000) == 0)
  {
LABEL_50:
    if ((v9 & 0x800000000) == 0)
      goto LABEL_51;
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x800000000) == 0)
  {
LABEL_51:
    if ((v9 & 0x2000000000) == 0)
      goto LABEL_52;
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x2000000000) == 0)
  {
LABEL_52:
    if ((v9 & 0x200000000) == 0)
      goto LABEL_53;
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x200000000) == 0)
  {
LABEL_53:
    if ((v9 & 0x1000000000) == 0)
      goto LABEL_54;
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x1000000000) == 0)
  {
LABEL_54:
    if ((v9 & 0x8000000000000) == 0)
      goto LABEL_55;
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x8000000000000) == 0)
  {
LABEL_55:
    if ((v10 & 0x200000) == 0)
      goto LABEL_56;
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  v10 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x200000) == 0)
  {
LABEL_56:
    if ((v10 & 0x400000) == 0)
      goto LABEL_57;
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  if ((*((_QWORD *)&self->_flags + 1) & 0x400000) == 0)
  {
LABEL_57:
    if ((v9 & 0x4000000000) == 0)
      goto LABEL_58;
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x4000000000) == 0)
  {
LABEL_58:
    if ((v9 & 4) == 0)
      goto LABEL_59;
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteInt32Field();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 4) == 0)
  {
LABEL_59:
    if ((v9 & 2) == 0)
      goto LABEL_60;
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteDoubleField();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 2) == 0)
  {
LABEL_60:
    if ((v9 & 0x400000000000000) == 0)
      goto LABEL_61;
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteDoubleField();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x400000000000000) == 0)
  {
LABEL_61:
    if ((v9 & 0x2000000000000000) == 0)
      goto LABEL_62;
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x2000000000000000) == 0)
  {
LABEL_62:
    if ((v9 & 0x200000000000000) == 0)
      goto LABEL_63;
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x200000000000000) == 0)
  {
LABEL_63:
    if ((v9 & 0x1000000000000000) == 0)
      goto LABEL_64;
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteBOOLField();
  v9 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x1000000000000000) == 0)
  {
LABEL_64:
    if ((v9 & 0x800000000000000) == 0)
      goto LABEL_66;
    goto LABEL_65;
  }
LABEL_107:
  PBDataWriterWriteBOOLField();
  if ((*(_QWORD *)p_flags & 0x800000000000000) != 0)
LABEL_65:
    PBDataWriterWriteBOOLField();
LABEL_66:
  if (self->_lookAroundLocation)
    PBDataWriterWriteSubmessage();
  v11 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x2000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = *(_QWORD *)p_flags;
    v12 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)p_flags & 1) == 0)
      goto LABEL_111;
    goto LABEL_110;
  }
  v12 = *((_QWORD *)&self->_flags + 1);
  if ((v11 & 1) != 0)
  {
LABEL_110:
    PBDataWriterWriteDoubleField();
    v11 = *(_QWORD *)p_flags;
    v12 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_111:
  if ((v11 & 0x4000) != 0)
  {
    PBDataWriterWriteUint32Field();
    v11 = *(_QWORD *)p_flags;
    v12 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)p_flags & 0x100000000000000) == 0)
    {
LABEL_113:
      if ((v11 & 0x80000000000000) == 0)
        goto LABEL_114;
      goto LABEL_275;
    }
  }
  else if ((v11 & 0x100000000000000) == 0)
  {
    goto LABEL_113;
  }
  PBDataWriterWriteBOOLField();
  v11 = *(_QWORD *)p_flags;
  v12 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x80000000000000) == 0)
  {
LABEL_114:
    if ((v11 & 0x10000000000000) == 0)
      goto LABEL_115;
    goto LABEL_276;
  }
LABEL_275:
  PBDataWriterWriteBOOLField();
  v12 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x10000000000000) == 0)
  {
LABEL_115:
    if ((v12 & 0x1000000000) == 0)
      goto LABEL_117;
    goto LABEL_116;
  }
LABEL_276:
  PBDataWriterWriteBOOLField();
  if ((*((_QWORD *)&self->_flags + 1) & 0x1000000000) != 0)
LABEL_116:
    PBDataWriterWriteBOOLField();
LABEL_117:
  if (self->_placeCardState)
    PBDataWriterWriteSubmessage();
  if (self->_placeCardPossibleActions.count)
  {
    v13 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v13;
    }
    while (v13 < self->_placeCardPossibleActions.count);
  }
  if (self->_placeCardUnactionableUiElements.count)
  {
    v14 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v14;
    }
    while (v14 < self->_placeCardUnactionableUiElements.count);
  }
  if (self->_placeCardPlaceCardCategory)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)p_flags & 0x100000000000) != 0)
    PBDataWriterWriteInt32Field();
  if ((*((_QWORD *)&self->_flags + 1) & 0x40000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_placeCardPlaceActionDetailsActionUrl)
    PBDataWriterWriteStringField();
  v15 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x80) != 0)
  {
    PBDataWriterWriteUint64Field();
    v15 = *(_QWORD *)p_flags;
  }
  if ((v15 & 0x100) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_placeCardPlaceActionDetailsDestinationApp)
    PBDataWriterWriteStringField();
  if (self->_placeCardPlaceActionDetailsPhotoId)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)p_flags & 0x200) != 0)
    PBDataWriterWriteInt64Field();
  if (self->_placeCardPlaceActionDetailsRichProviderId)
    PBDataWriterWriteStringField();
  v16 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x400) != 0)
  {
    PBDataWriterWriteDoubleField();
    v16 = *(_QWORD *)p_flags;
    if ((*(_QWORD *)p_flags & 0x800) == 0)
    {
LABEL_147:
      if ((v16 & 0x20000000000) == 0)
        goto LABEL_148;
      goto LABEL_280;
    }
  }
  else if ((v16 & 0x800) == 0)
  {
    goto LABEL_147;
  }
  PBDataWriterWriteUint64Field();
  v16 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x20000000000) == 0)
  {
LABEL_148:
    if ((v16 & 0x40000000000) == 0)
      goto LABEL_150;
    goto LABEL_149;
  }
LABEL_280:
  PBDataWriterWriteInt32Field();
  if ((*(_QWORD *)p_flags & 0x40000000000) != 0)
LABEL_149:
    PBDataWriterWriteInt32Field();
LABEL_150:
  if (self->_placeCardPlaceActionDetailsShowcaseId)
    PBDataWriterWriteStringField();
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType)
    PBDataWriterWriteStringField();
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)p_flags & 0x80000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection)
    PBDataWriterWriteStringField();
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)p_flags & 0x1000) != 0)
    PBDataWriterWriteUint64Field();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v17 = self->_placeCardRevealedPlaceCardModules;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(v17);
        PBDataWriterWriteSubmessage();
      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    }
    while (v18);
  }

  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x20000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v21 = *((_QWORD *)&self->_flags + 1);
  }
  if ((v21 & 0x8000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v21 = *((_QWORD *)&self->_flags + 1);
  }
  if ((v21 & 0x10000000) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_mapsServerMetadataSuggestionEntryTappedOn)
    PBDataWriterWriteDataField();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = self->_mapsServerMetadataSuggestionEntryDisplayeds;
  v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v44 != v24)
          objc_enumerationMutation(v22);
        PBDataWriterWriteDataField();
      }
      v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v23);
  }

  if (self->_mapsServerMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_routeRouteDetails)
    PBDataWriterWriteSubmessage();
  if (self->_predExTrainingData)
    PBDataWriterWriteSubmessage();
  v26 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x1000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v26 = *(_QWORD *)p_flags;
  }
  if ((v26 & 0x2000000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v26 = *(_QWORD *)p_flags;
  }
  if ((v26 & 0x4000000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_suggestionsSearchString)
    PBDataWriterWriteStringField();
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v27 = self->_suggestionsDisplayedResults;
  v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v40;
    do
    {
      for (k = 0; k != v28; ++k)
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(v27);
        PBDataWriterWriteSubmessage();
      }
      v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v28);
  }

  v31 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x40000000000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    v31 = *(_QWORD *)p_flags;
  }
  if ((v31 & 0x200000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v31 = *(_QWORD *)p_flags;
  }
  if ((v31 & 0x400000000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v31 = *(_QWORD *)p_flags;
  }
  if ((v31 & 0x800000000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_mapLaunchSourceAppId)
    PBDataWriterWriteStringField();
  if (self->_mapLaunchLaunchUri)
    PBDataWriterWriteStringField();
  if (self->_mapLaunchReferringWebsite)
    PBDataWriterWriteStringField();
  if ((*((_QWORD *)&self->_flags + 1) & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_mapLaunchSourceHandoffDevice)
    PBDataWriterWriteStringField();
  if ((*(_QWORD *)p_flags & 0x4000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_curatedCollectionState)
    PBDataWriterWriteSubmessage();
  v32 = *((_QWORD *)&self->_flags + 1);
  if ((v32 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    v32 = *((_QWORD *)&self->_flags + 1);
  }
  v33 = *(_QWORD *)p_flags;
  if ((v32 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v33 = *(_QWORD *)p_flags;
    v32 = *((_QWORD *)&self->_flags + 1);
  }
  if ((v32 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v33 = *(_QWORD *)p_flags;
    v32 = *((_QWORD *)&self->_flags + 1);
  }
  if ((v33 & 0x20000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v32 = *((_QWORD *)&self->_flags + 1);
  }
  if ((v32 & 0x200) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_ugcPhotoState)
    PBDataWriterWriteSubmessage();
  if (self->_metroRegion)
    PBDataWriterWriteStringField();
  if (self->_userHomeMetro)
    PBDataWriterWriteStringField();
  if (self->_userHomeCountry)
    PBDataWriterWriteStringField();
  v34 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x10000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v34 = *(_QWORD *)p_flags;
  }
  if ((v34 & 0x100000000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v34 = *(_QWORD *)p_flags;
  }
  if ((v34 & 0x8000000) != 0)
    PBDataWriterWriteInt32Field();
  if (self->_account)
    PBDataWriterWriteSubmessage();
  v35 = *(_QWORD *)p_flags;
  if ((*(_QWORD *)p_flags & 0x400000) != 0)
  {
    PBDataWriterWriteInt32Field();
    v35 = *(_QWORD *)p_flags;
    v36 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)p_flags & 0x800000) == 0)
    {
LABEL_257:
      if ((v35 & 0x2000000) == 0)
        goto LABEL_258;
      goto LABEL_284;
    }
  }
  else
  {
    v36 = *((_QWORD *)&self->_flags + 1);
    if ((v35 & 0x800000) == 0)
      goto LABEL_257;
  }
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x2000000) == 0)
  {
LABEL_258:
    if ((v35 & 0x1000000) == 0)
      goto LABEL_259;
    goto LABEL_285;
  }
LABEL_284:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x1000000) == 0)
  {
LABEL_259:
    if ((v35 & 0x8000) == 0)
      goto LABEL_260;
    goto LABEL_286;
  }
LABEL_285:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x8000) == 0)
  {
LABEL_260:
    if ((v35 & 0x200000) == 0)
      goto LABEL_261;
    goto LABEL_287;
  }
LABEL_286:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x200000) == 0)
  {
LABEL_261:
    if ((v36 & 0x200000000) == 0)
      goto LABEL_262;
    goto LABEL_288;
  }
LABEL_287:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((v36 & 0x200000000) == 0)
  {
LABEL_262:
    if ((v35 & 0x4000000000000000) == 0)
      goto LABEL_263;
    goto LABEL_289;
  }
LABEL_288:
  PBDataWriterWriteBOOLField();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x4000000000000000) == 0)
  {
LABEL_263:
    if ((v36 & 2) == 0)
      goto LABEL_264;
    goto LABEL_290;
  }
LABEL_289:
  PBDataWriterWriteBOOLField();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((v36 & 2) == 0)
  {
LABEL_264:
    if ((v35 & 0x8000000000000000) == 0)
      goto LABEL_265;
    goto LABEL_291;
  }
LABEL_290:
  PBDataWriterWriteBOOLField();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x8000000000000000) == 0)
  {
LABEL_265:
    if ((v36 & 1) == 0)
      goto LABEL_266;
    goto LABEL_292;
  }
LABEL_291:
  PBDataWriterWriteBOOLField();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((v36 & 1) == 0)
  {
LABEL_266:
    if ((v35 & 0x10000) == 0)
      goto LABEL_267;
    goto LABEL_293;
  }
LABEL_292:
  PBDataWriterWriteBOOLField();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x10000) == 0)
  {
LABEL_267:
    if ((v35 & 0x100000) == 0)
      goto LABEL_268;
    goto LABEL_294;
  }
LABEL_293:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x100000) == 0)
  {
LABEL_268:
    if ((v35 & 0x80000) == 0)
      goto LABEL_269;
    goto LABEL_295;
  }
LABEL_294:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x80000) == 0)
  {
LABEL_269:
    if ((v35 & 0x40000) == 0)
      goto LABEL_270;
    goto LABEL_296;
  }
LABEL_295:
  PBDataWriterWriteInt32Field();
  v35 = *(_QWORD *)p_flags;
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x40000) == 0)
  {
LABEL_270:
    if ((v35 & 0x20000) == 0)
      goto LABEL_271;
    goto LABEL_297;
  }
LABEL_296:
  PBDataWriterWriteInt32Field();
  v36 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)p_flags & 0x20000) == 0)
  {
LABEL_271:
    if ((v36 & 0x4000) == 0)
      goto LABEL_299;
    goto LABEL_298;
  }
LABEL_297:
  PBDataWriterWriteInt32Field();
  if ((*((_QWORD *)&self->_flags + 1) & 0x4000) != 0)
LABEL_298:
    PBDataWriterWriteBOOLField();
LABEL_299:
  if (self->_searchResultsState)
    PBDataWriterWriteSubmessage();
  if (self->_impressionObjectState)
    PBDataWriterWriteSubmessage();
  if (self->_tapEventState)
    PBDataWriterWriteSubmessage();
  if (self->_actionButtonDetailsState)
    PBDataWriterWriteSubmessage();
  if (self->_photoSubmissionDetailsState)
    PBDataWriterWriteSubmessage();
  if (self->_ratingSubmissionDetailsState)
    PBDataWriterWriteSubmessage();
  if (self->_ratingPhotoSubmissionDetailsState)
    PBDataWriterWriteSubmessage();
  if (self->_mapsPlaceIdsState)
    PBDataWriterWriteSubmessage();
  if ((*(_QWORD *)p_flags & 0x20000000000000) != 0)
    PBDataWriterWriteBOOLField();
LABEL_318:

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOAnalyticsPipelineStateDataClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOAnalyticsPipelineStateData _readLookAroundLocation]((uint64_t)self);
  if (-[GEOLocation hasGreenTeaWithValue:](self->_lookAroundLocation, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOAnalyticsPipelineStateData _readMapViewMapRegion]((uint64_t)self);
  if (-[GEOMapRegion hasGreenTeaWithValue:](self->_mapViewMapRegion, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOAnalyticsPipelineStateData _readMapsServerMetadata]((uint64_t)self);
  if (-[GEOMapsServerMetadata hasGreenTeaWithValue:](self->_mapsServerMetadata, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOAnalyticsPipelineStateData _readPredExTrainingData]((uint64_t)self);
  return -[GEOLogMsgEventPredExTrainingData hasGreenTeaWithValue:](self->_predExTrainingData, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char *v4;
  uint64_t v5;
  uint64_t flags;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *p_flags;
  uint64_t v8;
  uint64_t v9;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t i;
  unint64_t v16;
  unint64_t v17;
  uint64_t j;
  char *v19;
  uint64_t v20;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t k;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t m;
  void *v31;
  char *v32;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t n;
  void *v38;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v44;
  uint64_t v45;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;

  v49 = (char *)a3;
  -[GEOAnalyticsPipelineStateData readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v49 + 1, self->_reader);
  *((_DWORD *)v49 + 126) = self->_readerMarkPos;
  *((_DWORD *)v49 + 127) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_deviceInputLocale)
    objc_msgSend(v49, "setDeviceInputLocale:");
  if (self->_deviceOutputLocale)
    objc_msgSend(v49, "setDeviceOutputLocale:");
  v4 = v49;
  if (self->_carPlayInfo)
  {
    objc_msgSend(v49, "setCarPlayInfo:");
    v4 = v49;
  }
  v5 = *((_QWORD *)&self->_flags + 1);
  if ((v5 & 0x100000000) != 0)
  {
    v4[716] = self->_rideBookingAppInstalled;
    *(_QWORD *)(v4 + 732) |= 0x100000000uLL;
    v5 = *((_QWORD *)&self->_flags + 1);
  }
  flags = (uint64_t)self->_flags;
  if ((v5 & 0x80000000) != 0)
  {
    v4[715] = self->_rideBookingAppEnabled;
    *(_QWORD *)(v4 + 732) |= 0x80000000uLL;
    flags = (uint64_t)self->_flags;
    v5 = *((_QWORD *)&self->_flags + 1);
    if ((v5 & 0x800000000) == 0)
    {
LABEL_11:
      if ((v5 & 0x400000000) == 0)
        goto LABEL_12;
      goto LABEL_21;
    }
  }
  else if ((v5 & 0x800000000) == 0)
  {
    goto LABEL_11;
  }
  v4[719] = self->_tableBookingAppInstalled;
  *(_QWORD *)(v4 + 732) |= 0x800000000uLL;
  flags = (uint64_t)self->_flags;
  if ((*((_QWORD *)&self->_flags + 1) & 0x400000000) == 0)
  {
LABEL_12:
    if ((flags & 0x40) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_21:
  v4[718] = self->_tableBookingAppEnabled;
  *(_QWORD *)(v4 + 732) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_13:
    *((_QWORD *)v4 + 27) = *(_QWORD *)&self->_mapViewZoomLevel;
    *(_QWORD *)(v4 + 724) |= 0x40uLL;
  }
LABEL_14:
  if (self->_mapViewMapRegion)
  {
    objc_msgSend(v49, "setMapViewMapRegion:");
    v4 = v49;
  }
  p_flags = &self->_flags;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x8000000000) != 0)
  {
    *((_DWORD *)v4 + 155) = self->_mapViewMapType;
    *(_QWORD *)(v4 + 724) |= 0x8000000000uLL;
    v8 = *(_QWORD *)p_flags;
    v9 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)p_flags & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x20) != 0)
  {
LABEL_24:
    *((_QWORD *)v4 + 26) = *(_QWORD *)&self->_mapViewStyleZoomLevel;
    *(_QWORD *)(v4 + 724) |= 0x20uLL;
    v8 = (uint64_t)self->_flags;
    v9 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_25:
  if ((v8 & 0x10) != 0)
  {
    *((_QWORD *)v4 + 25) = *(_QWORD *)&self->_mapViewPitch;
    *(_QWORD *)(v4 + 724) |= 0x10uLL;
    v8 = (uint64_t)self->_flags;
    v9 = *((_QWORD *)&self->_flags + 1);
    if ((v9 & 0x800000) == 0)
    {
LABEL_27:
      if ((v9 & 0x1000000) == 0)
        goto LABEL_28;
      goto LABEL_71;
    }
  }
  else if ((v9 & 0x800000) == 0)
  {
    goto LABEL_27;
  }
  v4[707] = self->_mapViewIsAdvancedMap;
  *(_QWORD *)(v4 + 732) |= 0x800000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_28:
    if ((v8 & 0x10000000000) == 0)
      goto LABEL_29;
    goto LABEL_72;
  }
LABEL_71:
  v4[708] = self->_mapViewIsGlobeProjection;
  *(_QWORD *)(v4 + 732) |= 0x1000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x10000000000) == 0)
  {
LABEL_29:
    if ((v9 & 0x2000000) == 0)
      goto LABEL_30;
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)v4 + 156) = self->_mapViewViewMode;
  *(_QWORD *)(v4 + 724) |= 0x10000000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x2000000) == 0)
  {
LABEL_30:
    if ((v8 & 8) == 0)
      goto LABEL_31;
    goto LABEL_74;
  }
LABEL_73:
  v4[709] = self->_mapViewLocationIsTourist;
  *(_QWORD *)(v4 + 732) |= 0x2000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 8) == 0)
  {
LABEL_31:
    if ((v9 & 0x4000000) == 0)
      goto LABEL_32;
    goto LABEL_75;
  }
LABEL_74:
  *((_QWORD *)v4 + 23) = *(_QWORD *)&self->_mapViewLocationTouristTimestamp;
  *(_QWORD *)(v4 + 724) |= 8uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x4000000) == 0)
  {
LABEL_32:
    if ((v8 & 0x40000000) == 0)
      goto LABEL_33;
    goto LABEL_76;
  }
LABEL_75:
  v4[710] = self->_mapViewLocationPuckInViewport;
  *(_QWORD *)(v4 + 732) |= 0x4000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x40000000) == 0)
  {
LABEL_33:
    if ((v8 & 0x80000000) == 0)
      goto LABEL_34;
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)v4 + 146) = self->_mapSettingsNavVolume;
  *(_QWORD *)(v4 + 724) |= 0x40000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x80000000) == 0)
  {
LABEL_34:
    if ((v9 & 0x10) == 0)
      goto LABEL_35;
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)v4 + 147) = self->_mapSettingsTransportMode;
  *(_QWORD *)(v4 + 724) |= 0x80000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x10) == 0)
  {
LABEL_35:
    if ((v9 & 0x80) == 0)
      goto LABEL_36;
    goto LABEL_79;
  }
LABEL_78:
  v4[688] = self->_mapSettingsAvoidHighways;
  *(_QWORD *)(v4 + 732) |= 0x10uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x80) == 0)
  {
LABEL_36:
    if ((v9 & 0x400) == 0)
      goto LABEL_37;
    goto LABEL_80;
  }
LABEL_79:
  v4[691] = self->_mapSettingsAvoidTolls;
  *(_QWORD *)(v4 + 732) |= 0x80uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x400) == 0)
  {
LABEL_37:
    if ((v9 & 0x800) == 0)
      goto LABEL_38;
    goto LABEL_81;
  }
LABEL_80:
  v4[694] = self->_mapSettingsFindMyCarEnabled;
  *(_QWORD *)(v4 + 732) |= 0x400uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x800) == 0)
  {
LABEL_38:
    if ((v9 & 0x2000) == 0)
      goto LABEL_39;
    goto LABEL_82;
  }
LABEL_81:
  v4[695] = self->_mapSettingsHeadingEnabled;
  *(_QWORD *)(v4 + 732) |= 0x800uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x2000) == 0)
  {
LABEL_39:
    if ((v9 & 0x8000) == 0)
      goto LABEL_40;
    goto LABEL_83;
  }
LABEL_82:
  v4[697] = self->_mapSettingsLabelEnabled;
  *(_QWORD *)(v4 + 732) |= 0x2000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x8000) == 0)
  {
LABEL_40:
    if ((v9 & 0x10000) == 0)
      goto LABEL_41;
    goto LABEL_84;
  }
LABEL_83:
  v4[699] = self->_mapSettingsPauseSpokenAudioEnabled;
  *(_QWORD *)(v4 + 732) |= 0x8000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x10000) == 0)
  {
LABEL_41:
    if ((v9 & 0x20000) == 0)
      goto LABEL_42;
    goto LABEL_85;
  }
LABEL_84:
  v4[700] = self->_mapSettingsSpeedLimitEnabled;
  *(_QWORD *)(v4 + 732) |= 0x10000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x20000) == 0)
  {
LABEL_42:
    if ((v9 & 0x1000) == 0)
      goto LABEL_43;
    goto LABEL_86;
  }
LABEL_85:
  v4[701] = self->_mapSettingsTrafficEnabled;
  *(_QWORD *)(v4 + 732) |= 0x20000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x1000) == 0)
  {
LABEL_43:
    if ((v9 & 0x80000) == 0)
      goto LABEL_44;
    goto LABEL_87;
  }
LABEL_86:
  v4[696] = self->_mapSettingsIsHandsFreeProfileEnabled;
  *(_QWORD *)(v4 + 732) |= 0x1000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x80000) == 0)
  {
LABEL_44:
    if ((v9 & 0x40000) == 0)
      goto LABEL_45;
    goto LABEL_88;
  }
LABEL_87:
  v4[703] = self->_mapSettingsWalkingAvoidHills;
  *(_QWORD *)(v4 + 732) |= 0x80000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x40000) == 0)
  {
LABEL_45:
    if ((v9 & 0x100000) == 0)
      goto LABEL_46;
    goto LABEL_89;
  }
LABEL_88:
  v4[702] = self->_mapSettingsWalkingAvoidBusyRoads;
  *(_QWORD *)(v4 + 732) |= 0x40000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x100000) == 0)
  {
LABEL_46:
    if ((v9 & 0x100) == 0)
      goto LABEL_47;
    goto LABEL_90;
  }
LABEL_89:
  v4[704] = self->_mapSettingsWalkingAvoidStairs;
  *(_QWORD *)(v4 + 732) |= 0x100000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x100) == 0)
  {
LABEL_47:
    if ((v8 & 0x400000000) == 0)
      goto LABEL_48;
    goto LABEL_91;
  }
LABEL_90:
  v4[692] = self->_mapSettingsDirectionsWakeDevice;
  *(_QWORD *)(v4 + 732) |= 0x100uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x400000000) == 0)
  {
LABEL_48:
    if ((v8 & 0x800000000) == 0)
      goto LABEL_49;
    goto LABEL_92;
  }
LABEL_91:
  *((_DWORD *)v4 + 150) = self->_mapUiLayoutInfo;
  *(_QWORD *)(v4 + 724) |= 0x400000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x800000000) == 0)
  {
LABEL_49:
    if ((v8 & 0x2000000000) == 0)
      goto LABEL_50;
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)v4 + 151) = self->_mapUiLayoutStyle;
  *(_QWORD *)(v4 + 724) |= 0x800000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x2000000000) == 0)
  {
LABEL_50:
    if ((v8 & 0x200000000) == 0)
      goto LABEL_51;
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)v4 + 153) = self->_mapUiNumberOfTabsOpen;
  *(_QWORD *)(v4 + 724) |= 0x2000000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x200000000) == 0)
  {
LABEL_51:
    if ((v8 & 0x1000000000) == 0)
      goto LABEL_52;
    goto LABEL_95;
  }
LABEL_94:
  *((_DWORD *)v4 + 149) = self->_mapUiCurrentTabIndex;
  *(_QWORD *)(v4 + 724) |= 0x200000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x1000000000) == 0)
  {
LABEL_52:
    if ((v8 & 0x8000000000000) == 0)
      goto LABEL_53;
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)v4 + 152) = self->_mapUiNumberOfMapsWindows;
  *(_QWORD *)(v4 + 724) |= 0x1000000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v8 & 0x8000000000000) == 0)
  {
LABEL_53:
    if ((v9 & 0x200000) == 0)
      goto LABEL_54;
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)v4 + 167) = self->_windowSize;
  *(_QWORD *)(v4 + 724) |= 0x8000000000000uLL;
  v8 = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  if ((v9 & 0x200000) == 0)
  {
LABEL_54:
    if ((v9 & 0x400000) == 0)
      goto LABEL_55;
    goto LABEL_98;
  }
LABEL_97:
  v4[705] = self->_mapUiShownAqiShown;
  *(_QWORD *)(v4 + 732) |= 0x200000uLL;
  v8 = (uint64_t)self->_flags;
  if ((*((_QWORD *)&self->_flags + 1) & 0x400000) == 0)
  {
LABEL_55:
    if ((v8 & 0x4000000000) == 0)
      goto LABEL_56;
    goto LABEL_99;
  }
LABEL_98:
  v4[706] = self->_mapUiShownWeatherShown;
  *(_QWORD *)(v4 + 732) |= 0x400000uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x4000000000) == 0)
  {
LABEL_56:
    if ((v8 & 4) == 0)
      goto LABEL_57;
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)v4 + 154) = self->_mapUiShownActiveNavMode;
  *(_QWORD *)(v4 + 724) |= 0x4000000000uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 4) == 0)
  {
LABEL_57:
    if ((v8 & 2) == 0)
      goto LABEL_58;
    goto LABEL_101;
  }
LABEL_100:
  *((_QWORD *)v4 + 18) = *(_QWORD *)&self->_lookaroundSessionStartTime;
  *(_QWORD *)(v4 + 724) |= 4uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 2) == 0)
  {
LABEL_58:
    if ((v8 & 0x400000000000000) == 0)
      goto LABEL_59;
    goto LABEL_102;
  }
LABEL_101:
  *((_QWORD *)v4 + 17) = *(_QWORD *)&self->_lookaroundSessionEndTime;
  *(_QWORD *)(v4 + 724) |= 2uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x400000000000000) == 0)
  {
LABEL_59:
    if ((v8 & 0x2000000000000000) == 0)
      goto LABEL_60;
    goto LABEL_103;
  }
LABEL_102:
  v4[678] = self->_lookaroundSessionHadPanAction;
  *(_QWORD *)(v4 + 724) |= 0x400000000000000uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x2000000000000000) == 0)
  {
LABEL_60:
    if ((v8 & 0x200000000000000) == 0)
      goto LABEL_61;
    goto LABEL_104;
  }
LABEL_103:
  v4[681] = self->_lookaroundSessionHadZoomAction;
  *(_QWORD *)(v4 + 724) |= 0x2000000000000000uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x200000000000000) == 0)
  {
LABEL_61:
    if ((v8 & 0x1000000000000000) == 0)
      goto LABEL_62;
    goto LABEL_105;
  }
LABEL_104:
  v4[677] = self->_lookaroundSessionHadMoveAction;
  *(_QWORD *)(v4 + 724) |= 0x200000000000000uLL;
  v8 = (uint64_t)self->_flags;
  if ((v8 & 0x1000000000000000) == 0)
  {
LABEL_62:
    if ((v8 & 0x800000000000000) == 0)
      goto LABEL_64;
    goto LABEL_63;
  }
LABEL_105:
  v4[680] = self->_lookaroundSessionHadTapPoiAction;
  *(_QWORD *)(v4 + 724) |= 0x1000000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x800000000000000) != 0)
  {
LABEL_63:
    v4[679] = self->_lookaroundSessionHadShareAction;
    *(_QWORD *)(v4 + 724) |= 0x800000000000000uLL;
  }
LABEL_64:
  if (self->_lookAroundLocation)
  {
    objc_msgSend(v49, "setLookAroundLocation:");
    v4 = v49;
  }
  v10 = &self->_flags;
  v11 = (uint64_t)self->_flags;
  if ((v11 & 0x2000) != 0)
  {
    *((_DWORD *)v4 + 129) = self->_lookAroundHeading;
    *(_QWORD *)(v4 + 724) |= 0x2000uLL;
    v11 = *(_QWORD *)v10;
    v12 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)v10 & 1) == 0)
      goto LABEL_109;
    goto LABEL_108;
  }
  v12 = *((_QWORD *)&self->_flags + 1);
  if ((v11 & 1) != 0)
  {
LABEL_108:
    *((_QWORD *)v4 + 16) = *(_QWORD *)&self->_lookAroundZoom;
    *(_QWORD *)(v4 + 724) |= 1uLL;
    v11 = (uint64_t)self->_flags;
    v12 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_109:
  if ((v11 & 0x4000) != 0)
  {
    *((_DWORD *)v4 + 130) = self->_lookAroundNumberPoisInView;
    *(_QWORD *)(v4 + 724) |= 0x4000uLL;
    v11 = (uint64_t)self->_flags;
    v12 = *((_QWORD *)&self->_flags + 1);
    if ((v11 & 0x100000000000000) == 0)
    {
LABEL_111:
      if ((v11 & 0x80000000000000) == 0)
        goto LABEL_112;
      goto LABEL_239;
    }
  }
  else if ((v11 & 0x100000000000000) == 0)
  {
    goto LABEL_111;
  }
  v4[676] = self->_lookAroundIsLabelingShown;
  *(_QWORD *)(v4 + 724) |= 0x100000000000000uLL;
  v11 = (uint64_t)self->_flags;
  v12 = *((_QWORD *)&self->_flags + 1);
  if ((v11 & 0x80000000000000) == 0)
  {
LABEL_112:
    if ((v11 & 0x10000000000000) == 0)
      goto LABEL_113;
    goto LABEL_240;
  }
LABEL_239:
  v4[675] = self->_lookAroundEntryIconShown;
  *(_QWORD *)(v4 + 724) |= 0x80000000000000uLL;
  v12 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x10000000000000) == 0)
  {
LABEL_113:
    if ((v12 & 0x1000000000) == 0)
      goto LABEL_115;
    goto LABEL_114;
  }
LABEL_240:
  v4[672] = self->_deviceInDarkMode;
  *(_QWORD *)(v4 + 724) |= 0x10000000000000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x1000000000) != 0)
  {
LABEL_114:
    v4[720] = self->_venueExperienceShown;
    *(_QWORD *)(v4 + 732) |= 0x1000000000uLL;
  }
LABEL_115:
  if (self->_placeCardState)
    objc_msgSend(v49, "setPlaceCardState:");
  if (-[GEOAnalyticsPipelineStateData placeCardPossibleActionsCount](self, "placeCardPossibleActionsCount"))
  {
    objc_msgSend(v49, "clearPlaceCardPossibleActions");
    v13 = -[GEOAnalyticsPipelineStateData placeCardPossibleActionsCount](self, "placeCardPossibleActionsCount");
    if (v13)
    {
      v14 = v13;
      for (i = 0; i != v14; ++i)
        objc_msgSend(v49, "addPlaceCardPossibleActions:", -[GEOAnalyticsPipelineStateData placeCardPossibleActionsAtIndex:](self, "placeCardPossibleActionsAtIndex:", i));
    }
  }
  if (-[GEOAnalyticsPipelineStateData placeCardUnactionableUiElementsCount](self, "placeCardUnactionableUiElementsCount"))
  {
    objc_msgSend(v49, "clearPlaceCardUnactionableUiElements");
    v16 = -[GEOAnalyticsPipelineStateData placeCardUnactionableUiElementsCount](self, "placeCardUnactionableUiElementsCount");
    if (v16)
    {
      v17 = v16;
      for (j = 0; j != v17; ++j)
        objc_msgSend(v49, "addPlaceCardUnactionableUiElements:", -[GEOAnalyticsPipelineStateData placeCardUnactionableUiElementsAtIndex:](self, "placeCardUnactionableUiElementsAtIndex:", j));
    }
  }
  if (self->_placeCardPlaceCardCategory)
    objc_msgSend(v49, "setPlaceCardPlaceCardCategory:");
  v19 = v49;
  if ((*(_QWORD *)&self->_flags & 0x100000000000) != 0)
  {
    *((_DWORD *)v49 + 160) = self->_placeCardPlaceCardType;
    *(_QWORD *)(v49 + 724) |= 0x100000000000uLL;
  }
  if ((*((_QWORD *)&self->_flags + 1) & 0x40000000) != 0)
  {
    v49[714] = self->_placeCardTransitAdvisoryBanner;
    *(_QWORD *)(v49 + 732) |= 0x40000000uLL;
  }
  if (self->_placeCardPlaceActionDetailsActionUrl)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsActionUrl:");
    v19 = v49;
  }
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x80) != 0)
  {
    *((_QWORD *)v19 + 35) = self->_placeCardPlaceActionDetailsAnimationId;
    *(_QWORD *)(v19 + 724) |= 0x80uLL;
    v20 = (uint64_t)self->_flags;
  }
  if ((v20 & 0x100) != 0)
  {
    *((_QWORD *)v19 + 36) = self->_placeCardPlaceActionDetailsBusinessId;
    *(_QWORD *)(v19 + 724) |= 0x100uLL;
  }
  if (self->_placeCardPlaceActionDetailsDestinationApp)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsDestinationApp:");
    v19 = v49;
  }
  if (self->_placeCardPlaceActionDetailsPhotoId)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsPhotoId:");
    v19 = v49;
  }
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
    *((_QWORD *)v19 + 39) = self->_placeCardPlaceActionDetailsPlaceId;
    *(_QWORD *)(v19 + 724) |= 0x200uLL;
  }
  if (self->_placeCardPlaceActionDetailsRichProviderId)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsRichProviderId:");
    v19 = v49;
  }
  v21 = &self->_flags;
  v22 = (uint64_t)self->_flags;
  if ((v22 & 0x400) != 0)
  {
    *((_QWORD *)v19 + 41) = *(_QWORD *)&self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
    *(_QWORD *)(v19 + 724) |= 0x400uLL;
    v22 = *(_QWORD *)v21;
    if ((*(_QWORD *)v21 & 0x800) == 0)
    {
LABEL_147:
      if ((v22 & 0x20000000000) == 0)
        goto LABEL_148;
      goto LABEL_244;
    }
  }
  else if ((v22 & 0x800) == 0)
  {
    goto LABEL_147;
  }
  *((_QWORD *)v19 + 43) = self->_placeCardPlaceActionDetailsTargetId;
  *(_QWORD *)(v19 + 724) |= 0x800uLL;
  v22 = (uint64_t)self->_flags;
  if ((v22 & 0x20000000000) == 0)
  {
LABEL_148:
    if ((v22 & 0x40000000000) == 0)
      goto LABEL_150;
    goto LABEL_149;
  }
LABEL_244:
  *((_DWORD *)v19 + 157) = self->_placeCardPlaceActionDetailsLocalSearchProviderId;
  *(_QWORD *)(v19 + 724) |= 0x20000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40000000000) != 0)
  {
LABEL_149:
    *((_DWORD *)v19 + 158) = self->_placeCardPlaceActionDetailsResultIndex;
    *(_QWORD *)(v19 + 724) |= 0x40000000000uLL;
  }
LABEL_150:
  if (self->_placeCardPlaceActionDetailsShowcaseId)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsShowcaseId:");
    v19 = v49;
  }
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:");
    v19 = v49;
  }
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:");
    v19 = v49;
  }
  if ((*(_QWORD *)&self->_flags & 0x80000000000) != 0)
  {
    *((_DWORD *)v19 + 159) = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory;
    *(_QWORD *)(v19 + 724) |= 0x80000000000uLL;
  }
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:");
    v19 = v49;
  }
  if (self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign)
  {
    objc_msgSend(v49, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:");
    v19 = v49;
  }
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
    *((_QWORD *)v19 + 47) = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId;
    *(_QWORD *)(v19 + 724) |= 0x1000uLL;
  }
  if (-[GEOAnalyticsPipelineStateData placeCardRevealedPlaceCardModulesCount](self, "placeCardRevealedPlaceCardModulesCount"))
  {
    objc_msgSend(v49, "clearPlaceCardRevealedPlaceCardModules");
    v23 = -[GEOAnalyticsPipelineStateData placeCardRevealedPlaceCardModulesCount](self, "placeCardRevealedPlaceCardModulesCount");
    if (v23)
    {
      v24 = v23;
      for (k = 0; k != v24; ++k)
      {
        -[GEOAnalyticsPipelineStateData placeCardRevealedPlaceCardModuleAtIndex:](self, "placeCardRevealedPlaceCardModuleAtIndex:", k);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addPlaceCardRevealedPlaceCardModule:", v26);

      }
    }
  }
  v27 = *((_QWORD *)&self->_flags + 1);
  if ((v27 & 0x20000000) != 0)
  {
    v49[713] = self->_placeCardIsPersonPlacecard;
    *(_QWORD *)(v49 + 732) |= 0x20000000uLL;
    v27 = *((_QWORD *)&self->_flags + 1);
    if ((v27 & 0x8000000) == 0)
    {
LABEL_170:
      if ((v27 & 0x10000000) == 0)
        goto LABEL_172;
      goto LABEL_171;
    }
  }
  else if ((v27 & 0x8000000) == 0)
  {
    goto LABEL_170;
  }
  v49[711] = self->_placeCardIsPersonAddressAvailable;
  *(_QWORD *)(v49 + 732) |= 0x8000000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x10000000) != 0)
  {
LABEL_171:
    v49[712] = self->_placeCardIsPersonLocationShared;
    *(_QWORD *)(v49 + 732) |= 0x10000000uLL;
  }
LABEL_172:
  if (self->_mapsServerMetadataSuggestionEntryTappedOn)
    objc_msgSend(v49, "setMapsServerMetadataSuggestionEntryTappedOn:");
  if (-[GEOAnalyticsPipelineStateData mapsServerMetadataSuggestionEntryDisplayedsCount](self, "mapsServerMetadataSuggestionEntryDisplayedsCount"))
  {
    objc_msgSend(v49, "clearMapsServerMetadataSuggestionEntryDisplayeds");
    v28 = -[GEOAnalyticsPipelineStateData mapsServerMetadataSuggestionEntryDisplayedsCount](self, "mapsServerMetadataSuggestionEntryDisplayedsCount");
    if (v28)
    {
      v29 = v28;
      for (m = 0; m != v29; ++m)
      {
        -[GEOAnalyticsPipelineStateData mapsServerMetadataSuggestionEntryDisplayedAtIndex:](self, "mapsServerMetadataSuggestionEntryDisplayedAtIndex:", m);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addMapsServerMetadataSuggestionEntryDisplayed:", v31);

      }
    }
  }
  if (self->_mapsServerMetadata)
    objc_msgSend(v49, "setMapsServerMetadata:");
  v32 = v49;
  if (self->_routeRouteDetails)
  {
    objc_msgSend(v49, "setRouteRouteDetails:");
    v32 = v49;
  }
  if (self->_predExTrainingData)
  {
    objc_msgSend(v49, "setPredExTrainingData:");
    v32 = v49;
  }
  v33 = &self->_flags;
  v34 = (uint64_t)self->_flags;
  if ((v34 & 0x1000000000000) != 0)
  {
    *((_DWORD *)v32 + 164) = self->_suggestionsAcSequenceNumber;
    *(_QWORD *)(v32 + 724) |= 0x1000000000000uLL;
    v34 = *(_QWORD *)v33;
    if ((*(_QWORD *)v33 & 0x2000000000000) == 0)
    {
LABEL_186:
      if ((v34 & 0x4000000000000) == 0)
        goto LABEL_188;
      goto LABEL_187;
    }
  }
  else if ((v34 & 0x2000000000000) == 0)
  {
    goto LABEL_186;
  }
  *((_DWORD *)v32 + 165) = self->_suggestionsSearchFieldType;
  *(_QWORD *)(v32 + 724) |= 0x2000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x4000000000000) != 0)
  {
LABEL_187:
    *((_DWORD *)v32 + 166) = self->_suggestionsSelectedIndex;
    *(_QWORD *)(v32 + 724) |= 0x4000000000000uLL;
  }
LABEL_188:
  if (self->_suggestionsSearchString)
    objc_msgSend(v49, "setSuggestionsSearchString:");
  if (-[GEOAnalyticsPipelineStateData suggestionsDisplayedResultsCount](self, "suggestionsDisplayedResultsCount"))
  {
    objc_msgSend(v49, "clearSuggestionsDisplayedResults");
    v35 = -[GEOAnalyticsPipelineStateData suggestionsDisplayedResultsCount](self, "suggestionsDisplayedResultsCount");
    if (v35)
    {
      v36 = v35;
      for (n = 0; n != v36; ++n)
      {
        -[GEOAnalyticsPipelineStateData suggestionsDisplayedResultsAtIndex:](self, "suggestionsDisplayedResultsAtIndex:", n);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "addSuggestionsDisplayedResults:", v38);

      }
    }
  }
  v39 = &self->_flags;
  v40 = (uint64_t)self->_flags;
  v41 = v49;
  if ((v40 & 0x40000000000000) != 0)
  {
    v49[674] = self->_landscape;
    *(_QWORD *)(v49 + 724) |= 0x40000000000000uLL;
    v40 = *(_QWORD *)v39;
    if ((*(_QWORD *)v39 & 0x200000000000) == 0)
    {
LABEL_196:
      if ((v40 & 0x400000000000) == 0)
        goto LABEL_197;
      goto LABEL_254;
    }
  }
  else if ((v40 & 0x200000000000) == 0)
  {
    goto LABEL_196;
  }
  *((_DWORD *)v49 + 161) = self->_restoreLayoutInfo;
  *(_QWORD *)(v49 + 724) |= 0x200000000000uLL;
  v40 = (uint64_t)self->_flags;
  if ((v40 & 0x400000000000) == 0)
  {
LABEL_197:
    if ((v40 & 0x800000000000) == 0)
      goto LABEL_199;
    goto LABEL_198;
  }
LABEL_254:
  *((_DWORD *)v49 + 162) = self->_restoreLayoutStyle;
  *(_QWORD *)(v49 + 724) |= 0x400000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x800000000000) != 0)
  {
LABEL_198:
    *((_DWORD *)v49 + 163) = self->_restoreUiTarget;
    *(_QWORD *)(v49 + 724) |= 0x800000000000uLL;
  }
LABEL_199:
  if (self->_mapLaunchSourceAppId)
  {
    objc_msgSend(v49, "setMapLaunchSourceAppId:");
    v41 = v49;
  }
  if (self->_mapLaunchLaunchUri)
  {
    objc_msgSend(v49, "setMapLaunchLaunchUri:");
    v41 = v49;
  }
  if (self->_mapLaunchReferringWebsite)
  {
    objc_msgSend(v49, "setMapLaunchReferringWebsite:");
    v41 = v49;
  }
  if ((*((_QWORD *)&self->_flags + 1) & 4) != 0)
  {
    v41[686] = self->_mapLaunchIsHandoff;
    *(_QWORD *)(v41 + 732) |= 4uLL;
  }
  if (self->_mapLaunchSourceHandoffDevice)
  {
    objc_msgSend(v49, "setMapLaunchSourceHandoffDevice:");
    v41 = v49;
  }
  if ((*(_QWORD *)&self->_flags & 0x4000000) != 0)
  {
    *((_DWORD *)v41 + 142) = self->_mapLaunchAction;
    *(_QWORD *)(v41 + 724) |= 0x4000000uLL;
  }
  if (self->_curatedCollectionState)
  {
    objc_msgSend(v49, "setCuratedCollectionState:");
    v41 = v49;
  }
  v42 = *((_QWORD *)&self->_flags + 1);
  if ((v42 & 0x20) != 0)
  {
    v41[689] = self->_mapSettingsAvoidHills;
    *(_QWORD *)(v41 + 732) |= 0x20uLL;
    v42 = *((_QWORD *)&self->_flags + 1);
  }
  v43 = (uint64_t)self->_flags;
  if ((v42 & 0x40) != 0)
  {
    v41[690] = self->_mapSettingsAvoidStairs;
    *(_QWORD *)(v41 + 732) |= 0x40uLL;
    v43 = (uint64_t)self->_flags;
    v42 = *((_QWORD *)&self->_flags + 1);
    if ((v42 & 8) == 0)
    {
LABEL_217:
      if ((v43 & 0x20000000) == 0)
        goto LABEL_218;
      goto LABEL_258;
    }
  }
  else if ((v42 & 8) == 0)
  {
    goto LABEL_217;
  }
  v41[687] = self->_mapSettingsAvoidBusyRoads;
  *(_QWORD *)(v41 + 732) |= 8uLL;
  v42 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x20000000) == 0)
  {
LABEL_218:
    if ((v42 & 0x200) == 0)
      goto LABEL_220;
    goto LABEL_219;
  }
LABEL_258:
  *((_DWORD *)v41 + 145) = self->_mapSettingsLocationPrecisionType;
  *(_QWORD *)(v41 + 724) |= 0x20000000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x200) != 0)
  {
LABEL_219:
    v41[693] = self->_mapSettingsEBike;
    *(_QWORD *)(v41 + 732) |= 0x200uLL;
  }
LABEL_220:
  if (self->_ugcPhotoState)
  {
    objc_msgSend(v49, "setUgcPhotoState:");
    v41 = v49;
  }
  if (self->_metroRegion)
  {
    objc_msgSend(v49, "setMetroRegion:");
    v41 = v49;
  }
  if (self->_userHomeMetro)
  {
    objc_msgSend(v49, "setUserHomeMetro:");
    v41 = v49;
  }
  if (self->_userHomeCountry)
  {
    objc_msgSend(v49, "setUserHomeCountry:");
    v41 = v49;
  }
  v44 = &self->_flags;
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x10000000) != 0)
  {
    *((_DWORD *)v41 + 144) = self->_mapSettingsDrivingVoiceSettings;
    *(_QWORD *)(v41 + 724) |= 0x10000000uLL;
    v45 = *(_QWORD *)v44;
    if ((*(_QWORD *)v44 & 0x100000000) == 0)
    {
LABEL_230:
      if ((v45 & 0x8000000) == 0)
        goto LABEL_232;
      goto LABEL_231;
    }
  }
  else if ((v45 & 0x100000000) == 0)
  {
    goto LABEL_230;
  }
  *((_DWORD *)v41 + 148) = self->_mapSettingsWalkingVoiceSettings;
  *(_QWORD *)(v41 + 724) |= 0x100000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x8000000) != 0)
  {
LABEL_231:
    *((_DWORD *)v41 + 143) = self->_mapSettingsCyclingVoiceSettings;
    *(_QWORD *)(v41 + 724) |= 0x8000000uLL;
  }
LABEL_232:
  if (self->_account)
  {
    objc_msgSend(v49, "setAccount:");
    v41 = v49;
  }
  v46 = &self->_flags;
  v47 = (uint64_t)self->_flags;
  if ((v47 & 0x400000) != 0)
  {
    *((_DWORD *)v41 + 138) = self->_mapFeaturePersonalCollectionsCount;
    *(_QWORD *)(v41 + 724) |= 0x400000uLL;
    v47 = *(_QWORD *)v46;
    v48 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)v46 & 0x800000) == 0)
      goto LABEL_265;
    goto LABEL_264;
  }
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x800000) != 0)
  {
LABEL_264:
    *((_DWORD *)v41 + 139) = self->_mapFeatureSavedCollectionsCount;
    *(_QWORD *)(v41 + 724) |= 0x800000uLL;
    v47 = (uint64_t)self->_flags;
    v48 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_265:
  if ((v47 & 0x2000000) != 0)
  {
    *((_DWORD *)v41 + 141) = self->_mapFeatureSubmittedRatingsCount;
    *(_QWORD *)(v41 + 724) |= 0x2000000uLL;
    v47 = (uint64_t)self->_flags;
    v48 = *((_QWORD *)&self->_flags + 1);
    if ((v47 & 0x1000000) == 0)
    {
LABEL_267:
      if ((v47 & 0x8000) == 0)
        goto LABEL_268;
      goto LABEL_302;
    }
  }
  else if ((v47 & 0x1000000) == 0)
  {
    goto LABEL_267;
  }
  *((_DWORD *)v41 + 140) = self->_mapFeatureSubmittedPhotosCount;
  *(_QWORD *)(v41 + 724) |= 0x1000000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x8000) == 0)
  {
LABEL_268:
    if ((v47 & 0x200000) == 0)
      goto LABEL_269;
    goto LABEL_303;
  }
LABEL_302:
  *((_DWORD *)v41 + 131) = self->_mapFeatureElectronicVehicleCount;
  *(_QWORD *)(v41 + 724) |= 0x8000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x200000) == 0)
  {
LABEL_269:
    if ((v48 & 0x200000000) == 0)
      goto LABEL_270;
    goto LABEL_304;
  }
LABEL_303:
  *((_DWORD *)v41 + 137) = self->_mapFeatureLicensePlateCount;
  *(_QWORD *)(v41 + 724) |= 0x200000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v48 & 0x200000000) == 0)
  {
LABEL_270:
    if ((v47 & 0x4000000000000000) == 0)
      goto LABEL_271;
    goto LABEL_305;
  }
LABEL_304:
  v41[717] = self->_suggestionsSiriEnabled;
  *(_QWORD *)(v41 + 732) |= 0x200000000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x4000000000000000) == 0)
  {
LABEL_271:
    if ((v48 & 2) == 0)
      goto LABEL_272;
    goto LABEL_306;
  }
LABEL_305:
  v41[682] = self->_mapFeatureIsHomeFavoriteSet;
  *(_QWORD *)(v41 + 724) |= 0x4000000000000000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v48 & 2) == 0)
  {
LABEL_272:
    if ((v47 & 0x8000000000000000) == 0)
      goto LABEL_273;
    goto LABEL_307;
  }
LABEL_306:
  v41[685] = self->_mapFeatureIsWorkFavoriteSet;
  *(_QWORD *)(v41 + 732) |= 2uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x8000000000000000) == 0)
  {
LABEL_273:
    if ((v48 & 1) == 0)
      goto LABEL_274;
    goto LABEL_308;
  }
LABEL_307:
  v41[683] = self->_mapFeatureIsSchoolFavoriteSet;
  *(_QWORD *)(v41 + 724) |= 0x8000000000000000;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v48 & 1) == 0)
  {
LABEL_274:
    if ((v47 & 0x10000) == 0)
      goto LABEL_275;
    goto LABEL_309;
  }
LABEL_308:
  v41[684] = self->_mapFeatureIsTransitFavoriteSet;
  *(_QWORD *)(v41 + 732) |= 1uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x10000) == 0)
  {
LABEL_275:
    if ((v47 & 0x100000) == 0)
      goto LABEL_276;
    goto LABEL_310;
  }
LABEL_309:
  *((_DWORD *)v41 + 132) = self->_mapFeatureFavoritesCount;
  *(_QWORD *)(v41 + 724) |= 0x10000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x100000) == 0)
  {
LABEL_276:
    if ((v47 & 0x80000) == 0)
      goto LABEL_277;
    goto LABEL_311;
  }
LABEL_310:
  *((_DWORD *)v41 + 136) = self->_mapFeatureLibrarySavedPlacesCount;
  *(_QWORD *)(v41 + 724) |= 0x100000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x80000) == 0)
  {
LABEL_277:
    if ((v47 & 0x40000) == 0)
      goto LABEL_278;
    goto LABEL_312;
  }
LABEL_311:
  *((_DWORD *)v41 + 135) = self->_mapFeatureLibraryPlacesWithNoteCount;
  *(_QWORD *)(v41 + 724) |= 0x80000uLL;
  v47 = (uint64_t)self->_flags;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((v47 & 0x40000) == 0)
  {
LABEL_278:
    if ((v47 & 0x20000) == 0)
      goto LABEL_279;
    goto LABEL_313;
  }
LABEL_312:
  *((_DWORD *)v41 + 134) = self->_mapFeatureLibraryGuidesSavedPlacesCount;
  *(_QWORD *)(v41 + 724) |= 0x40000uLL;
  v48 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x20000) == 0)
  {
LABEL_279:
    if ((v48 & 0x4000) == 0)
      goto LABEL_281;
    goto LABEL_280;
  }
LABEL_313:
  *((_DWORD *)v41 + 133) = self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount;
  *(_QWORD *)(v41 + 724) |= 0x20000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x4000) != 0)
  {
LABEL_280:
    v41[698] = self->_mapSettingsNotificationsEnabled;
    *(_QWORD *)(v41 + 732) |= 0x4000uLL;
  }
LABEL_281:
  if (self->_searchResultsState)
  {
    objc_msgSend(v49, "setSearchResultsState:");
    v41 = v49;
  }
  if (self->_impressionObjectState)
  {
    objc_msgSend(v49, "setImpressionObjectState:");
    v41 = v49;
  }
  if (self->_tapEventState)
  {
    objc_msgSend(v49, "setTapEventState:");
    v41 = v49;
  }
  if (self->_actionButtonDetailsState)
  {
    objc_msgSend(v49, "setActionButtonDetailsState:");
    v41 = v49;
  }
  if (self->_photoSubmissionDetailsState)
  {
    objc_msgSend(v49, "setPhotoSubmissionDetailsState:");
    v41 = v49;
  }
  if (self->_ratingSubmissionDetailsState)
  {
    objc_msgSend(v49, "setRatingSubmissionDetailsState:");
    v41 = v49;
  }
  if (self->_ratingPhotoSubmissionDetailsState)
  {
    objc_msgSend(v49, "setRatingPhotoSubmissionDetailsState:");
    v41 = v49;
  }
  if (self->_mapsPlaceIdsState)
  {
    objc_msgSend(v49, "setMapsPlaceIdsState:");
    v41 = v49;
  }
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    v41[673] = self->_isInternalTool;
    *(_QWORD *)(v41 + 724) |= 0x20000000000000uLL;
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
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t flags;
  id v17;
  void *v18;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *p_flags;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSMutableArray *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  id v69;
  void *v70;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  NSMutableArray *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t k;
  void *v79;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  id v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  void *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  void *v101;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v102;
  uint64_t v103;
  id v104;
  void *v105;
  $293EEC582D4BBCC1CB48E4ACDB02AB11 *v106;
  uint64_t v107;
  uint64_t v108;
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
  void *v122;
  id v123;
  void *v124;
  id v125;
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
  _BYTE v139[128];
  _BYTE v140[128];
  _BYTE v141[128];
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if (((*((unsigned __int16 *)&self->_flags + 8) | (*((unsigned __int8 *)&self->_flags + 18) << 16)) & 0x20000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOAnalyticsPipelineStateDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_227;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOAnalyticsPipelineStateData readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_deviceInputLocale, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v9;

  v11 = -[NSString copyWithZone:](self->_deviceOutputLocale, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v11;

  v13 = -[GEOCarInfo copyWithZone:](self->_carPlayInfo, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v13;

  v15 = *((_QWORD *)&self->_flags + 1);
  if ((v15 & 0x100000000) != 0)
  {
    *(_BYTE *)(v5 + 716) = self->_rideBookingAppInstalled;
    *(_QWORD *)(v5 + 732) |= 0x100000000uLL;
    v15 = *((_QWORD *)&self->_flags + 1);
  }
  flags = (uint64_t)self->_flags;
  if ((v15 & 0x80000000) != 0)
  {
    *(_BYTE *)(v5 + 715) = self->_rideBookingAppEnabled;
    *(_QWORD *)(v5 + 732) |= 0x80000000uLL;
    flags = (uint64_t)self->_flags;
    v15 = *((_QWORD *)&self->_flags + 1);
    if ((v15 & 0x800000000) == 0)
    {
LABEL_9:
      if ((v15 & 0x400000000) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v15 & 0x800000000) == 0)
  {
    goto LABEL_9;
  }
  *(_BYTE *)(v5 + 719) = self->_tableBookingAppInstalled;
  *(_QWORD *)(v5 + 732) |= 0x800000000uLL;
  flags = (uint64_t)self->_flags;
  if ((*((_QWORD *)&self->_flags + 1) & 0x400000000) == 0)
  {
LABEL_10:
    if ((flags & 0x40) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  *(_BYTE *)(v5 + 718) = self->_tableBookingAppEnabled;
  *(_QWORD *)(v5 + 732) |= 0x400000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40) != 0)
  {
LABEL_11:
    *(double *)(v5 + 216) = self->_mapViewZoomLevel;
    *(_QWORD *)(v5 + 724) |= 0x40uLL;
  }
LABEL_12:
  v17 = -[GEOMapRegion copyWithZone:](self->_mapViewMapRegion, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v17;

  p_flags = &self->_flags;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x8000000000) != 0)
  {
    *(_DWORD *)(v5 + 620) = self->_mapViewMapType;
    *(_QWORD *)(v5 + 724) |= 0x8000000000uLL;
    v20 = *(_QWORD *)p_flags;
    v21 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)p_flags & 0x20) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x20) != 0)
  {
LABEL_20:
    *(double *)(v5 + 208) = self->_mapViewStyleZoomLevel;
    *(_QWORD *)(v5 + 724) |= 0x20uLL;
    v20 = (uint64_t)self->_flags;
    v21 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_21:
  if ((v20 & 0x10) != 0)
  {
    *(double *)(v5 + 200) = self->_mapViewPitch;
    *(_QWORD *)(v5 + 724) |= 0x10uLL;
    v20 = (uint64_t)self->_flags;
    v21 = *((_QWORD *)&self->_flags + 1);
    if ((v21 & 0x800000) == 0)
    {
LABEL_23:
      if ((v21 & 0x1000000) == 0)
        goto LABEL_24;
      goto LABEL_65;
    }
  }
  else if ((v21 & 0x800000) == 0)
  {
    goto LABEL_23;
  }
  *(_BYTE *)(v5 + 707) = self->_mapViewIsAdvancedMap;
  *(_QWORD *)(v5 + 732) |= 0x800000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x1000000) == 0)
  {
LABEL_24:
    if ((v20 & 0x10000000000) == 0)
      goto LABEL_25;
    goto LABEL_66;
  }
LABEL_65:
  *(_BYTE *)(v5 + 708) = self->_mapViewIsGlobeProjection;
  *(_QWORD *)(v5 + 732) |= 0x1000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x10000000000) == 0)
  {
LABEL_25:
    if ((v21 & 0x2000000) == 0)
      goto LABEL_26;
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 624) = self->_mapViewViewMode;
  *(_QWORD *)(v5 + 724) |= 0x10000000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x2000000) == 0)
  {
LABEL_26:
    if ((v20 & 8) == 0)
      goto LABEL_27;
    goto LABEL_68;
  }
LABEL_67:
  *(_BYTE *)(v5 + 709) = self->_mapViewLocationIsTourist;
  *(_QWORD *)(v5 + 732) |= 0x2000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 8) == 0)
  {
LABEL_27:
    if ((v21 & 0x4000000) == 0)
      goto LABEL_28;
    goto LABEL_69;
  }
LABEL_68:
  *(double *)(v5 + 184) = self->_mapViewLocationTouristTimestamp;
  *(_QWORD *)(v5 + 724) |= 8uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x4000000) == 0)
  {
LABEL_28:
    if ((v20 & 0x40000000) == 0)
      goto LABEL_29;
    goto LABEL_70;
  }
LABEL_69:
  *(_BYTE *)(v5 + 710) = self->_mapViewLocationPuckInViewport;
  *(_QWORD *)(v5 + 732) |= 0x4000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x40000000) == 0)
  {
LABEL_29:
    if ((v20 & 0x80000000) == 0)
      goto LABEL_30;
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 584) = self->_mapSettingsNavVolume;
  *(_QWORD *)(v5 + 724) |= 0x40000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x80000000) == 0)
  {
LABEL_30:
    if ((v21 & 0x10) == 0)
      goto LABEL_31;
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 588) = self->_mapSettingsTransportMode;
  *(_QWORD *)(v5 + 724) |= 0x80000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x10) == 0)
  {
LABEL_31:
    if ((v21 & 0x80) == 0)
      goto LABEL_32;
    goto LABEL_73;
  }
LABEL_72:
  *(_BYTE *)(v5 + 688) = self->_mapSettingsAvoidHighways;
  *(_QWORD *)(v5 + 732) |= 0x10uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x80) == 0)
  {
LABEL_32:
    if ((v21 & 0x400) == 0)
      goto LABEL_33;
    goto LABEL_74;
  }
LABEL_73:
  *(_BYTE *)(v5 + 691) = self->_mapSettingsAvoidTolls;
  *(_QWORD *)(v5 + 732) |= 0x80uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x400) == 0)
  {
LABEL_33:
    if ((v21 & 0x800) == 0)
      goto LABEL_34;
    goto LABEL_75;
  }
LABEL_74:
  *(_BYTE *)(v5 + 694) = self->_mapSettingsFindMyCarEnabled;
  *(_QWORD *)(v5 + 732) |= 0x400uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x800) == 0)
  {
LABEL_34:
    if ((v21 & 0x2000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  *(_BYTE *)(v5 + 695) = self->_mapSettingsHeadingEnabled;
  *(_QWORD *)(v5 + 732) |= 0x800uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x2000) == 0)
  {
LABEL_35:
    if ((v21 & 0x8000) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  *(_BYTE *)(v5 + 697) = self->_mapSettingsLabelEnabled;
  *(_QWORD *)(v5 + 732) |= 0x2000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x8000) == 0)
  {
LABEL_36:
    if ((v21 & 0x10000) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  *(_BYTE *)(v5 + 699) = self->_mapSettingsPauseSpokenAudioEnabled;
  *(_QWORD *)(v5 + 732) |= 0x8000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x10000) == 0)
  {
LABEL_37:
    if ((v21 & 0x20000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  *(_BYTE *)(v5 + 700) = self->_mapSettingsSpeedLimitEnabled;
  *(_QWORD *)(v5 + 732) |= 0x10000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x20000) == 0)
  {
LABEL_38:
    if ((v21 & 0x1000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  *(_BYTE *)(v5 + 701) = self->_mapSettingsTrafficEnabled;
  *(_QWORD *)(v5 + 732) |= 0x20000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x1000) == 0)
  {
LABEL_39:
    if ((v21 & 0x80000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  *(_BYTE *)(v5 + 696) = self->_mapSettingsIsHandsFreeProfileEnabled;
  *(_QWORD *)(v5 + 732) |= 0x1000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x80000) == 0)
  {
LABEL_40:
    if ((v21 & 0x40000) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  *(_BYTE *)(v5 + 703) = self->_mapSettingsWalkingAvoidHills;
  *(_QWORD *)(v5 + 732) |= 0x80000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x40000) == 0)
  {
LABEL_41:
    if ((v21 & 0x100000) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  *(_BYTE *)(v5 + 702) = self->_mapSettingsWalkingAvoidBusyRoads;
  *(_QWORD *)(v5 + 732) |= 0x40000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x100000) == 0)
  {
LABEL_42:
    if ((v21 & 0x100) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  *(_BYTE *)(v5 + 704) = self->_mapSettingsWalkingAvoidStairs;
  *(_QWORD *)(v5 + 732) |= 0x100000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x100) == 0)
  {
LABEL_43:
    if ((v20 & 0x400000000) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  *(_BYTE *)(v5 + 692) = self->_mapSettingsDirectionsWakeDevice;
  *(_QWORD *)(v5 + 732) |= 0x100uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x400000000) == 0)
  {
LABEL_44:
    if ((v20 & 0x800000000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 600) = self->_mapUiLayoutInfo;
  *(_QWORD *)(v5 + 724) |= 0x400000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x800000000) == 0)
  {
LABEL_45:
    if ((v20 & 0x2000000000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 604) = self->_mapUiLayoutStyle;
  *(_QWORD *)(v5 + 724) |= 0x800000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x2000000000) == 0)
  {
LABEL_46:
    if ((v20 & 0x200000000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v5 + 612) = self->_mapUiNumberOfTabsOpen;
  *(_QWORD *)(v5 + 724) |= 0x2000000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x200000000) == 0)
  {
LABEL_47:
    if ((v20 & 0x1000000000) == 0)
      goto LABEL_48;
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 596) = self->_mapUiCurrentTabIndex;
  *(_QWORD *)(v5 + 724) |= 0x200000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x1000000000) == 0)
  {
LABEL_48:
    if ((v20 & 0x8000000000000) == 0)
      goto LABEL_49;
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v5 + 608) = self->_mapUiNumberOfMapsWindows;
  *(_QWORD *)(v5 + 724) |= 0x1000000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v20 & 0x8000000000000) == 0)
  {
LABEL_49:
    if ((v21 & 0x200000) == 0)
      goto LABEL_50;
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 668) = self->_windowSize;
  *(_QWORD *)(v5 + 724) |= 0x8000000000000uLL;
  v20 = (uint64_t)self->_flags;
  v21 = *((_QWORD *)&self->_flags + 1);
  if ((v21 & 0x200000) == 0)
  {
LABEL_50:
    if ((v21 & 0x400000) == 0)
      goto LABEL_51;
    goto LABEL_92;
  }
LABEL_91:
  *(_BYTE *)(v5 + 705) = self->_mapUiShownAqiShown;
  *(_QWORD *)(v5 + 732) |= 0x200000uLL;
  v20 = (uint64_t)self->_flags;
  if ((*((_QWORD *)&self->_flags + 1) & 0x400000) == 0)
  {
LABEL_51:
    if ((v20 & 0x4000000000) == 0)
      goto LABEL_52;
    goto LABEL_93;
  }
LABEL_92:
  *(_BYTE *)(v5 + 706) = self->_mapUiShownWeatherShown;
  *(_QWORD *)(v5 + 732) |= 0x400000uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x4000000000) == 0)
  {
LABEL_52:
    if ((v20 & 4) == 0)
      goto LABEL_53;
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v5 + 616) = self->_mapUiShownActiveNavMode;
  *(_QWORD *)(v5 + 724) |= 0x4000000000uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 4) == 0)
  {
LABEL_53:
    if ((v20 & 2) == 0)
      goto LABEL_54;
    goto LABEL_95;
  }
LABEL_94:
  *(double *)(v5 + 144) = self->_lookaroundSessionStartTime;
  *(_QWORD *)(v5 + 724) |= 4uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 2) == 0)
  {
LABEL_54:
    if ((v20 & 0x400000000000000) == 0)
      goto LABEL_55;
    goto LABEL_96;
  }
LABEL_95:
  *(double *)(v5 + 136) = self->_lookaroundSessionEndTime;
  *(_QWORD *)(v5 + 724) |= 2uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x400000000000000) == 0)
  {
LABEL_55:
    if ((v20 & 0x2000000000000000) == 0)
      goto LABEL_56;
    goto LABEL_97;
  }
LABEL_96:
  *(_BYTE *)(v5 + 678) = self->_lookaroundSessionHadPanAction;
  *(_QWORD *)(v5 + 724) |= 0x400000000000000uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x2000000000000000) == 0)
  {
LABEL_56:
    if ((v20 & 0x200000000000000) == 0)
      goto LABEL_57;
    goto LABEL_98;
  }
LABEL_97:
  *(_BYTE *)(v5 + 681) = self->_lookaroundSessionHadZoomAction;
  *(_QWORD *)(v5 + 724) |= 0x2000000000000000uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x200000000000000) == 0)
  {
LABEL_57:
    if ((v20 & 0x1000000000000000) == 0)
      goto LABEL_58;
    goto LABEL_99;
  }
LABEL_98:
  *(_BYTE *)(v5 + 677) = self->_lookaroundSessionHadMoveAction;
  *(_QWORD *)(v5 + 724) |= 0x200000000000000uLL;
  v20 = (uint64_t)self->_flags;
  if ((v20 & 0x1000000000000000) == 0)
  {
LABEL_58:
    if ((v20 & 0x800000000000000) == 0)
      goto LABEL_60;
    goto LABEL_59;
  }
LABEL_99:
  *(_BYTE *)(v5 + 680) = self->_lookaroundSessionHadTapPoiAction;
  *(_QWORD *)(v5 + 724) |= 0x1000000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x800000000000000) != 0)
  {
LABEL_59:
    *(_BYTE *)(v5 + 679) = self->_lookaroundSessionHadShareAction;
    *(_QWORD *)(v5 + 724) |= 0x800000000000000uLL;
  }
LABEL_60:
  v22 = -[GEOLocation copyWithZone:](self->_lookAroundLocation, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v22;

  v24 = &self->_flags;
  v25 = (uint64_t)self->_flags;
  if ((v25 & 0x2000) != 0)
  {
    *(_DWORD *)(v5 + 516) = self->_lookAroundHeading;
    *(_QWORD *)(v5 + 724) |= 0x2000uLL;
    v25 = *(_QWORD *)v24;
    v26 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)v24 & 1) == 0)
      goto LABEL_103;
    goto LABEL_102;
  }
  v26 = *((_QWORD *)&self->_flags + 1);
  if ((v25 & 1) != 0)
  {
LABEL_102:
    *(double *)(v5 + 128) = self->_lookAroundZoom;
    *(_QWORD *)(v5 + 724) |= 1uLL;
    v25 = (uint64_t)self->_flags;
    v26 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_103:
  if ((v25 & 0x4000) != 0)
  {
    *(_DWORD *)(v5 + 520) = self->_lookAroundNumberPoisInView;
    *(_QWORD *)(v5 + 724) |= 0x4000uLL;
    v25 = (uint64_t)self->_flags;
    v26 = *((_QWORD *)&self->_flags + 1);
    if ((v25 & 0x100000000000000) == 0)
    {
LABEL_105:
      if ((v25 & 0x80000000000000) == 0)
        goto LABEL_106;
      goto LABEL_182;
    }
  }
  else if ((v25 & 0x100000000000000) == 0)
  {
    goto LABEL_105;
  }
  *(_BYTE *)(v5 + 676) = self->_lookAroundIsLabelingShown;
  *(_QWORD *)(v5 + 724) |= 0x100000000000000uLL;
  v25 = (uint64_t)self->_flags;
  v26 = *((_QWORD *)&self->_flags + 1);
  if ((v25 & 0x80000000000000) == 0)
  {
LABEL_106:
    if ((v25 & 0x10000000000000) == 0)
      goto LABEL_107;
    goto LABEL_183;
  }
LABEL_182:
  *(_BYTE *)(v5 + 675) = self->_lookAroundEntryIconShown;
  *(_QWORD *)(v5 + 724) |= 0x80000000000000uLL;
  v26 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x10000000000000) == 0)
  {
LABEL_107:
    if ((v26 & 0x1000000000) == 0)
      goto LABEL_109;
    goto LABEL_108;
  }
LABEL_183:
  *(_BYTE *)(v5 + 672) = self->_deviceInDarkMode;
  *(_QWORD *)(v5 + 724) |= 0x10000000000000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x1000000000) != 0)
  {
LABEL_108:
    *(_BYTE *)(v5 + 720) = self->_venueExperienceShown;
    *(_QWORD *)(v5 + 732) |= 0x1000000000uLL;
  }
LABEL_109:
  v27 = -[GEOLogMsgStatePlaceCard copyWithZone:](self->_placeCardState, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 408);
  *(_QWORD *)(v5 + 408) = v27;

  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  v29 = -[NSString copyWithZone:](self->_placeCardPlaceCardCategory, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 392);
  *(_QWORD *)(v5 + 392) = v29;

  if ((*(_QWORD *)&self->_flags & 0x100000000000) != 0)
  {
    *(_DWORD *)(v5 + 640) = self->_placeCardPlaceCardType;
    *(_QWORD *)(v5 + 724) |= 0x100000000000uLL;
  }
  if ((*((_QWORD *)&self->_flags + 1) & 0x40000000) != 0)
  {
    *(_BYTE *)(v5 + 714) = self->_placeCardTransitAdvisoryBanner;
    *(_QWORD *)(v5 + 732) |= 0x40000000uLL;
  }
  v31 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsActionUrl, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v31;

  v33 = (uint64_t)self->_flags;
  if ((v33 & 0x80) != 0)
  {
    *(_QWORD *)(v5 + 280) = self->_placeCardPlaceActionDetailsAnimationId;
    *(_QWORD *)(v5 + 724) |= 0x80uLL;
    v33 = (uint64_t)self->_flags;
  }
  if ((v33 & 0x100) != 0)
  {
    *(_QWORD *)(v5 + 288) = self->_placeCardPlaceActionDetailsBusinessId;
    *(_QWORD *)(v5 + 724) |= 0x100uLL;
  }
  v34 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsDestinationApp, "copyWithZone:", a3);
  v35 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v34;

  v36 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsPhotoId, "copyWithZone:", a3);
  v37 = *(void **)(v5 + 304);
  *(_QWORD *)(v5 + 304) = v36;

  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
  {
    *(_QWORD *)(v5 + 312) = self->_placeCardPlaceActionDetailsPlaceId;
    *(_QWORD *)(v5 + 724) |= 0x200uLL;
  }
  v38 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsRichProviderId, "copyWithZone:", a3);
  v39 = *(void **)(v5 + 320);
  *(_QWORD *)(v5 + 320) = v38;

  v40 = &self->_flags;
  v41 = (uint64_t)self->_flags;
  if ((v41 & 0x400) != 0)
  {
    *(double *)(v5 + 328) = self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
    *(_QWORD *)(v5 + 724) |= 0x400uLL;
    v41 = *(_QWORD *)v40;
    if ((*(_QWORD *)v40 & 0x800) == 0)
    {
LABEL_121:
      if ((v41 & 0x20000000000) == 0)
        goto LABEL_122;
      goto LABEL_187;
    }
  }
  else if ((v41 & 0x800) == 0)
  {
    goto LABEL_121;
  }
  *(_QWORD *)(v5 + 344) = self->_placeCardPlaceActionDetailsTargetId;
  *(_QWORD *)(v5 + 724) |= 0x800uLL;
  v41 = (uint64_t)self->_flags;
  if ((v41 & 0x20000000000) == 0)
  {
LABEL_122:
    if ((v41 & 0x40000000000) == 0)
      goto LABEL_124;
    goto LABEL_123;
  }
LABEL_187:
  *(_DWORD *)(v5 + 628) = self->_placeCardPlaceActionDetailsLocalSearchProviderId;
  *(_QWORD *)(v5 + 724) |= 0x20000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x40000000000) != 0)
  {
LABEL_123:
    *(_DWORD *)(v5 + 632) = self->_placeCardPlaceActionDetailsResultIndex;
    *(_QWORD *)(v5 + 724) |= 0x40000000000uLL;
  }
LABEL_124:
  v42 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsShowcaseId, "copyWithZone:", a3);
  v43 = *(void **)(v5 + 336);
  *(_QWORD *)(v5 + 336) = v42;

  v44 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType, "copyWithZone:", a3);
  v45 = *(void **)(v5 + 352);
  *(_QWORD *)(v5 + 352) = v44;

  v46 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName, "copyWithZone:", a3);
  v47 = *(void **)(v5 + 384);
  *(_QWORD *)(v5 + 384) = v46;

  if ((*(_QWORD *)&self->_flags & 0x80000000000) != 0)
  {
    *(_DWORD *)(v5 + 636) = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory;
    *(_QWORD *)(v5 + 724) |= 0x80000000000uLL;
  }
  v48 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection, "copyWithZone:", a3);
  v49 = *(void **)(v5 + 360);
  *(_QWORD *)(v5 + 360) = v48;

  v50 = -[NSString copyWithZone:](self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign, "copyWithZone:", a3);
  v51 = *(void **)(v5 + 368);
  *(_QWORD *)(v5 + 368) = v50;

  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
    *(_QWORD *)(v5 + 376) = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId;
    *(_QWORD *)(v5 + 724) |= 0x1000uLL;
  }
  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  v52 = self->_placeCardRevealedPlaceCardModules;
  v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
  if (v53)
  {
    v54 = *(_QWORD *)v136;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v136 != v54)
          objc_enumerationMutation(v52);
        v56 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addPlaceCardRevealedPlaceCardModule:", v56);

      }
      v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v135, v141, 16);
    }
    while (v53);
  }

  v57 = *((_QWORD *)&self->_flags + 1);
  if ((v57 & 0x20000000) != 0)
  {
    *(_BYTE *)(v5 + 713) = self->_placeCardIsPersonPlacecard;
    *(_QWORD *)(v5 + 732) |= 0x20000000uLL;
    v57 = *((_QWORD *)&self->_flags + 1);
    if ((v57 & 0x8000000) == 0)
    {
LABEL_137:
      if ((v57 & 0x10000000) == 0)
        goto LABEL_139;
      goto LABEL_138;
    }
  }
  else if ((v57 & 0x8000000) == 0)
  {
    goto LABEL_137;
  }
  *(_BYTE *)(v5 + 711) = self->_placeCardIsPersonAddressAvailable;
  *(_QWORD *)(v5 + 732) |= 0x8000000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x10000000) != 0)
  {
LABEL_138:
    *(_BYTE *)(v5 + 712) = self->_placeCardIsPersonLocationShared;
    *(_QWORD *)(v5 + 732) |= 0x10000000uLL;
  }
LABEL_139:
  v58 = -[NSData copyWithZone:](self->_mapsServerMetadataSuggestionEntryTappedOn, "copyWithZone:", a3);
  v59 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v58;

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v60 = self->_mapsServerMetadataSuggestionEntryDisplayeds;
  v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
  if (v61)
  {
    v62 = *(_QWORD *)v132;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v132 != v62)
          objc_enumerationMutation(v60);
        v64 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v131 + 1) + 8 * j), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addMapsServerMetadataSuggestionEntryDisplayed:", v64);

      }
      v61 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v131, v140, 16);
    }
    while (v61);
  }

  v65 = -[GEOMapsServerMetadata copyWithZone:](self->_mapsServerMetadata, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v65;

  v67 = -[GEORouteDetails copyWithZone:](self->_routeRouteDetails, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 440);
  *(_QWORD *)(v5 + 440) = v67;

  v69 = -[GEOLogMsgEventPredExTrainingData copyWithZone:](self->_predExTrainingData, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 416);
  *(_QWORD *)(v5 + 416) = v69;

  v71 = &self->_flags;
  v72 = (uint64_t)self->_flags;
  if ((v72 & 0x1000000000000) != 0)
  {
    *(_DWORD *)(v5 + 656) = self->_suggestionsAcSequenceNumber;
    *(_QWORD *)(v5 + 724) |= 0x1000000000000uLL;
    v72 = *(_QWORD *)v71;
    if ((*(_QWORD *)v71 & 0x2000000000000) == 0)
    {
LABEL_148:
      if ((v72 & 0x4000000000000) == 0)
        goto LABEL_150;
      goto LABEL_149;
    }
  }
  else if ((v72 & 0x2000000000000) == 0)
  {
    goto LABEL_148;
  }
  *(_DWORD *)(v5 + 660) = self->_suggestionsSearchFieldType;
  *(_QWORD *)(v5 + 724) |= 0x2000000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x4000000000000) != 0)
  {
LABEL_149:
    *(_DWORD *)(v5 + 664) = self->_suggestionsSelectedIndex;
    *(_QWORD *)(v5 + 724) |= 0x4000000000000uLL;
  }
LABEL_150:
  v73 = -[NSString copyWithZone:](self->_suggestionsSearchString, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 464);
  *(_QWORD *)(v5 + 464) = v73;

  v129 = 0u;
  v130 = 0u;
  v127 = 0u;
  v128 = 0u;
  v75 = self->_suggestionsDisplayedResults;
  v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
  if (v76)
  {
    v77 = *(_QWORD *)v128;
    do
    {
      for (k = 0; k != v76; ++k)
      {
        if (*(_QWORD *)v128 != v77)
          objc_enumerationMutation(v75);
        v79 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v127 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v127);
        objc_msgSend((id)v5, "addSuggestionsDisplayedResults:", v79);

      }
      v76 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v75, "countByEnumeratingWithState:objects:count:", &v127, v139, 16);
    }
    while (v76);
  }

  v80 = &self->_flags;
  v81 = (uint64_t)self->_flags;
  if ((v81 & 0x40000000000000) != 0)
  {
    *(_BYTE *)(v5 + 674) = self->_landscape;
    *(_QWORD *)(v5 + 724) |= 0x40000000000000uLL;
    v81 = *(_QWORD *)v80;
    if ((*(_QWORD *)v80 & 0x200000000000) == 0)
    {
LABEL_159:
      if ((v81 & 0x400000000000) == 0)
        goto LABEL_160;
      goto LABEL_197;
    }
  }
  else if ((v81 & 0x200000000000) == 0)
  {
    goto LABEL_159;
  }
  *(_DWORD *)(v5 + 644) = self->_restoreLayoutInfo;
  *(_QWORD *)(v5 + 724) |= 0x200000000000uLL;
  v81 = (uint64_t)self->_flags;
  if ((v81 & 0x400000000000) == 0)
  {
LABEL_160:
    if ((v81 & 0x800000000000) == 0)
      goto LABEL_162;
    goto LABEL_161;
  }
LABEL_197:
  *(_DWORD *)(v5 + 648) = self->_restoreLayoutStyle;
  *(_QWORD *)(v5 + 724) |= 0x400000000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x800000000000) != 0)
  {
LABEL_161:
    *(_DWORD *)(v5 + 652) = self->_restoreUiTarget;
    *(_QWORD *)(v5 + 724) |= 0x800000000000uLL;
  }
LABEL_162:
  v82 = -[NSString copyWithZone:](self->_mapLaunchSourceAppId, "copyWithZone:", a3, (_QWORD)v127);
  v83 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v82;

  v84 = -[NSString copyWithZone:](self->_mapLaunchLaunchUri, "copyWithZone:", a3);
  v85 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v84;

  v86 = -[NSString copyWithZone:](self->_mapLaunchReferringWebsite, "copyWithZone:", a3);
  v87 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v86;

  if ((*((_QWORD *)&self->_flags + 1) & 4) != 0)
  {
    *(_BYTE *)(v5 + 686) = self->_mapLaunchIsHandoff;
    *(_QWORD *)(v5 + 732) |= 4uLL;
  }
  v88 = -[NSString copyWithZone:](self->_mapLaunchSourceHandoffDevice, "copyWithZone:", a3);
  v89 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v88;

  if ((*(_QWORD *)&self->_flags & 0x4000000) != 0)
  {
    *(_DWORD *)(v5 + 568) = self->_mapLaunchAction;
    *(_QWORD *)(v5 + 724) |= 0x4000000uLL;
  }
  v90 = -[GEOLogMsgStateCuratedCollection copyWithZone:](self->_curatedCollectionState, "copyWithZone:", a3);
  v91 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v90;

  v92 = *((_QWORD *)&self->_flags + 1);
  if ((v92 & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 689) = self->_mapSettingsAvoidHills;
    *(_QWORD *)(v5 + 732) |= 0x20uLL;
    v92 = *((_QWORD *)&self->_flags + 1);
  }
  v93 = (uint64_t)self->_flags;
  if ((v92 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 690) = self->_mapSettingsAvoidStairs;
    *(_QWORD *)(v5 + 732) |= 0x40uLL;
    v93 = (uint64_t)self->_flags;
    v92 = *((_QWORD *)&self->_flags + 1);
    if ((v92 & 8) == 0)
    {
LABEL_170:
      if ((v93 & 0x20000000) == 0)
        goto LABEL_171;
      goto LABEL_201;
    }
  }
  else if ((v92 & 8) == 0)
  {
    goto LABEL_170;
  }
  *(_BYTE *)(v5 + 687) = self->_mapSettingsAvoidBusyRoads;
  *(_QWORD *)(v5 + 732) |= 8uLL;
  v92 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x20000000) == 0)
  {
LABEL_171:
    if ((v92 & 0x200) == 0)
      goto LABEL_173;
    goto LABEL_172;
  }
LABEL_201:
  *(_DWORD *)(v5 + 580) = self->_mapSettingsLocationPrecisionType;
  *(_QWORD *)(v5 + 724) |= 0x20000000uLL;
  if ((*((_QWORD *)&self->_flags + 1) & 0x200) != 0)
  {
LABEL_172:
    *(_BYTE *)(v5 + 693) = self->_mapSettingsEBike;
    *(_QWORD *)(v5 + 732) |= 0x200uLL;
  }
LABEL_173:
  v94 = -[GEOLogMsgStateUGCPhoto copyWithZone:](self->_ugcPhotoState, "copyWithZone:", a3);
  v95 = *(void **)(v5 + 480);
  *(_QWORD *)(v5 + 480) = v94;

  v96 = -[NSString copyWithZone:](self->_metroRegion, "copyWithZone:", a3);
  v97 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v96;

  v98 = -[NSString copyWithZone:](self->_userHomeMetro, "copyWithZone:", a3);
  v99 = *(void **)(v5 + 496);
  *(_QWORD *)(v5 + 496) = v98;

  v100 = -[NSString copyWithZone:](self->_userHomeCountry, "copyWithZone:", a3);
  v101 = *(void **)(v5 + 488);
  *(_QWORD *)(v5 + 488) = v100;

  v102 = &self->_flags;
  v103 = (uint64_t)self->_flags;
  if ((v103 & 0x10000000) != 0)
  {
    *(_DWORD *)(v5 + 576) = self->_mapSettingsDrivingVoiceSettings;
    *(_QWORD *)(v5 + 724) |= 0x10000000uLL;
    v103 = *(_QWORD *)v102;
    if ((*(_QWORD *)v102 & 0x100000000) == 0)
    {
LABEL_175:
      if ((v103 & 0x8000000) == 0)
        goto LABEL_177;
      goto LABEL_176;
    }
  }
  else if ((v103 & 0x100000000) == 0)
  {
    goto LABEL_175;
  }
  *(_DWORD *)(v5 + 592) = self->_mapSettingsWalkingVoiceSettings;
  *(_QWORD *)(v5 + 724) |= 0x100000000uLL;
  if ((*(_QWORD *)&self->_flags & 0x8000000) != 0)
  {
LABEL_176:
    *(_DWORD *)(v5 + 572) = self->_mapSettingsCyclingVoiceSettings;
    *(_QWORD *)(v5 + 724) |= 0x8000000uLL;
  }
LABEL_177:
  v104 = -[GEOLogMsgStateAccount copyWithZone:](self->_account, "copyWithZone:", a3);
  v105 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v104;

  v106 = &self->_flags;
  v107 = (uint64_t)self->_flags;
  if ((v107 & 0x400000) != 0)
  {
    *(_DWORD *)(v5 + 552) = self->_mapFeaturePersonalCollectionsCount;
    *(_QWORD *)(v5 + 724) |= 0x400000uLL;
    v107 = *(_QWORD *)v106;
    v108 = *((_QWORD *)&self->_flags + 1);
    if ((*(_QWORD *)v106 & 0x800000) == 0)
      goto LABEL_208;
    goto LABEL_207;
  }
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x800000) != 0)
  {
LABEL_207:
    *(_DWORD *)(v5 + 556) = self->_mapFeatureSavedCollectionsCount;
    *(_QWORD *)(v5 + 724) |= 0x800000uLL;
    v107 = (uint64_t)self->_flags;
    v108 = *((_QWORD *)&self->_flags + 1);
  }
LABEL_208:
  if ((v107 & 0x2000000) != 0)
  {
    *(_DWORD *)(v5 + 564) = self->_mapFeatureSubmittedRatingsCount;
    *(_QWORD *)(v5 + 724) |= 0x2000000uLL;
    v107 = (uint64_t)self->_flags;
    v108 = *((_QWORD *)&self->_flags + 1);
    if ((v107 & 0x1000000) == 0)
    {
LABEL_210:
      if ((v107 & 0x8000) == 0)
        goto LABEL_211;
      goto LABEL_230;
    }
  }
  else if ((v107 & 0x1000000) == 0)
  {
    goto LABEL_210;
  }
  *(_DWORD *)(v5 + 560) = self->_mapFeatureSubmittedPhotosCount;
  *(_QWORD *)(v5 + 724) |= 0x1000000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x8000) == 0)
  {
LABEL_211:
    if ((v107 & 0x200000) == 0)
      goto LABEL_212;
    goto LABEL_231;
  }
LABEL_230:
  *(_DWORD *)(v5 + 524) = self->_mapFeatureElectronicVehicleCount;
  *(_QWORD *)(v5 + 724) |= 0x8000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x200000) == 0)
  {
LABEL_212:
    if ((v108 & 0x200000000) == 0)
      goto LABEL_213;
    goto LABEL_232;
  }
LABEL_231:
  *(_DWORD *)(v5 + 548) = self->_mapFeatureLicensePlateCount;
  *(_QWORD *)(v5 + 724) |= 0x200000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v108 & 0x200000000) == 0)
  {
LABEL_213:
    if ((v107 & 0x4000000000000000) == 0)
      goto LABEL_214;
    goto LABEL_233;
  }
LABEL_232:
  *(_BYTE *)(v5 + 717) = self->_suggestionsSiriEnabled;
  *(_QWORD *)(v5 + 732) |= 0x200000000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x4000000000000000) == 0)
  {
LABEL_214:
    if ((v108 & 2) == 0)
      goto LABEL_215;
    goto LABEL_234;
  }
LABEL_233:
  *(_BYTE *)(v5 + 682) = self->_mapFeatureIsHomeFavoriteSet;
  *(_QWORD *)(v5 + 724) |= 0x4000000000000000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v108 & 2) == 0)
  {
LABEL_215:
    if ((v107 & 0x8000000000000000) == 0)
      goto LABEL_216;
    goto LABEL_235;
  }
LABEL_234:
  *(_BYTE *)(v5 + 685) = self->_mapFeatureIsWorkFavoriteSet;
  *(_QWORD *)(v5 + 732) |= 2uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x8000000000000000) == 0)
  {
LABEL_216:
    if ((v108 & 1) == 0)
      goto LABEL_217;
    goto LABEL_236;
  }
LABEL_235:
  *(_BYTE *)(v5 + 683) = self->_mapFeatureIsSchoolFavoriteSet;
  *(_QWORD *)(v5 + 724) |= 0x8000000000000000;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v108 & 1) == 0)
  {
LABEL_217:
    if ((v107 & 0x10000) == 0)
      goto LABEL_218;
    goto LABEL_237;
  }
LABEL_236:
  *(_BYTE *)(v5 + 684) = self->_mapFeatureIsTransitFavoriteSet;
  *(_QWORD *)(v5 + 732) |= 1uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x10000) == 0)
  {
LABEL_218:
    if ((v107 & 0x100000) == 0)
      goto LABEL_219;
    goto LABEL_238;
  }
LABEL_237:
  *(_DWORD *)(v5 + 528) = self->_mapFeatureFavoritesCount;
  *(_QWORD *)(v5 + 724) |= 0x10000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x100000) == 0)
  {
LABEL_219:
    if ((v107 & 0x80000) == 0)
      goto LABEL_220;
    goto LABEL_239;
  }
LABEL_238:
  *(_DWORD *)(v5 + 544) = self->_mapFeatureLibrarySavedPlacesCount;
  *(_QWORD *)(v5 + 724) |= 0x100000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x80000) == 0)
  {
LABEL_220:
    if ((v107 & 0x40000) == 0)
      goto LABEL_221;
    goto LABEL_240;
  }
LABEL_239:
  *(_DWORD *)(v5 + 540) = self->_mapFeatureLibraryPlacesWithNoteCount;
  *(_QWORD *)(v5 + 724) |= 0x80000uLL;
  v107 = (uint64_t)self->_flags;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((v107 & 0x40000) == 0)
  {
LABEL_221:
    if ((v107 & 0x20000) == 0)
      goto LABEL_222;
LABEL_241:
    *(_DWORD *)(v5 + 532) = self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount;
    *(_QWORD *)(v5 + 724) |= 0x20000uLL;
    if ((*((_QWORD *)&self->_flags + 1) & 0x4000) == 0)
      goto LABEL_224;
    goto LABEL_223;
  }
LABEL_240:
  *(_DWORD *)(v5 + 536) = self->_mapFeatureLibraryGuidesSavedPlacesCount;
  *(_QWORD *)(v5 + 724) |= 0x40000uLL;
  v108 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x20000) != 0)
    goto LABEL_241;
LABEL_222:
  if ((v108 & 0x4000) != 0)
  {
LABEL_223:
    *(_BYTE *)(v5 + 698) = self->_mapSettingsNotificationsEnabled;
    *(_QWORD *)(v5 + 732) |= 0x4000uLL;
  }
LABEL_224:
  v109 = -[GEOLogMsgStateSearchResults copyWithZone:](self->_searchResultsState, "copyWithZone:", a3);
  v110 = *(void **)(v5 + 448);
  *(_QWORD *)(v5 + 448) = v109;

  v111 = -[GEOLogMsgStateImpressionObject copyWithZone:](self->_impressionObjectState, "copyWithZone:", a3);
  v112 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v111;

  v113 = -[GEOLogMsgStateTapEvent copyWithZone:](self->_tapEventState, "copyWithZone:", a3);
  v114 = *(void **)(v5 + 472);
  *(_QWORD *)(v5 + 472) = v113;

  v115 = -[GEOLogMsgStateActionButtonDetails copyWithZone:](self->_actionButtonDetailsState, "copyWithZone:", a3);
  v116 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v115;

  v117 = -[GEOLogMsgStateARPPhotoSubmission copyWithZone:](self->_photoSubmissionDetailsState, "copyWithZone:", a3);
  v118 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v117;

  v119 = -[GEOLogMsgStateARPRatingSubmission copyWithZone:](self->_ratingSubmissionDetailsState, "copyWithZone:", a3);
  v120 = *(void **)(v5 + 432);
  *(_QWORD *)(v5 + 432) = v119;

  v121 = -[GEOLogMsgStateARPRatingPhotoSubmission copyWithZone:](self->_ratingPhotoSubmissionDetailsState, "copyWithZone:", a3);
  v122 = *(void **)(v5 + 424);
  *(_QWORD *)(v5 + 424) = v121;

  v123 = -[GEOLogMsgStateMapsPlaceIds copyWithZone:](self->_mapsPlaceIdsState, "copyWithZone:", a3);
  v124 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v123;

  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    *(_BYTE *)(v5 + 673) = self->_isInternalTool;
    *(_QWORD *)(v5 + 724) |= 0x20000000000000uLL;
  }
  v125 = (id)v5;
LABEL_227:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *deviceInputLocale;
  NSString *deviceOutputLocale;
  GEOCarInfo *carPlayInfo;
  uint64_t flags;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  GEOMapRegion *mapViewMapRegion;
  GEOLocation *lookAroundLocation;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  GEOLogMsgStatePlaceCard *placeCardState;
  NSString *placeCardPlaceCardCategory;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSString *placeCardPlaceActionDetailsActionUrl;
  NSString *placeCardPlaceActionDetailsDestinationApp;
  NSString *placeCardPlaceActionDetailsPhotoId;
  uint64_t v25;
  uint64_t v26;
  NSString *placeCardPlaceActionDetailsRichProviderId;
  NSString *placeCardPlaceActionDetailsShowcaseId;
  NSString *placeCardPlaceActionDetailsTransitPlaceCardIncidentType;
  NSString *placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName;
  uint64_t v31;
  NSString *placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection;
  NSString *placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSMutableArray *placeCardRevealedPlaceCardModules;
  NSData *mapsServerMetadataSuggestionEntryTappedOn;
  NSMutableArray *mapsServerMetadataSuggestionEntryDisplayeds;
  GEOMapsServerMetadata *mapsServerMetadata;
  GEORouteDetails *routeRouteDetails;
  GEOLogMsgEventPredExTrainingData *predExTrainingData;
  uint64_t v43;
  uint64_t v44;
  NSString *suggestionsSearchString;
  NSMutableArray *suggestionsDisplayedResults;
  uint64_t v47;
  uint64_t v48;
  NSString *mapLaunchSourceAppId;
  NSString *mapLaunchLaunchUri;
  NSString *mapLaunchReferringWebsite;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSString *mapLaunchSourceHandoffDevice;
  GEOLogMsgStateCuratedCollection *curatedCollectionState;
  GEOLogMsgStateUGCPhoto *ugcPhotoState;
  NSString *metroRegion;
  NSString *userHomeMetro;
  NSString *userHomeCountry;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  GEOLogMsgStateAccount *account;
  GEOLogMsgStateSearchResults *searchResultsState;
  GEOLogMsgStateImpressionObject *impressionObjectState;
  GEOLogMsgStateTapEvent *tapEventState;
  GEOLogMsgStateActionButtonDetails *actionButtonDetailsState;
  GEOLogMsgStateARPPhotoSubmission *photoSubmissionDetailsState;
  GEOLogMsgStateARPRatingSubmission *ratingSubmissionDetailsState;
  GEOLogMsgStateARPRatingPhotoSubmission *ratingPhotoSubmissionDetailsState;
  GEOLogMsgStateMapsPlaceIds *mapsPlaceIdsState;
  uint64_t v75;
  BOOL v76;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_744;
  -[GEOAnalyticsPipelineStateData readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  deviceInputLocale = self->_deviceInputLocale;
  if ((unint64_t)deviceInputLocale | *((_QWORD *)v4 + 12))
  {
    if (!-[NSString isEqual:](deviceInputLocale, "isEqual:"))
      goto LABEL_744;
  }
  deviceOutputLocale = self->_deviceOutputLocale;
  if ((unint64_t)deviceOutputLocale | *((_QWORD *)v4 + 13))
  {
    if (!-[NSString isEqual:](deviceOutputLocale, "isEqual:"))
      goto LABEL_744;
  }
  carPlayInfo = self->_carPlayInfo;
  if ((unint64_t)carPlayInfo | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOCarInfo isEqual:](carPlayInfo, "isEqual:"))
      goto LABEL_744;
  }
  flags = (uint64_t)self->_flags;
  v9 = *((_QWORD *)&self->_flags + 1);
  v10 = *(_QWORD *)(v4 + 724);
  v11 = *(_QWORD *)(v4 + 732);
  if ((v9 & 0x100000000) != 0)
  {
    if ((v11 & 0x100000000) == 0)
      goto LABEL_744;
    if (self->_rideBookingAppInstalled)
    {
      if (!v4[716])
        goto LABEL_744;
    }
    else if (v4[716])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x100000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x80000000) != 0)
  {
    if ((v11 & 0x80000000) == 0)
      goto LABEL_744;
    if (self->_rideBookingAppEnabled)
    {
      if (!v4[715])
        goto LABEL_744;
    }
    else if (v4[715])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x80000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x800000000) != 0)
  {
    if ((v11 & 0x800000000) == 0)
      goto LABEL_744;
    if (self->_tableBookingAppInstalled)
    {
      if (!v4[719])
        goto LABEL_744;
    }
    else if (v4[719])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x800000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x400000000) != 0)
  {
    if ((v11 & 0x400000000) == 0)
      goto LABEL_744;
    if (self->_tableBookingAppEnabled)
    {
      if (!v4[718])
        goto LABEL_744;
    }
    else if (v4[718])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x400000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0 || self->_mapViewZoomLevel != *((double *)v4 + 27))
      goto LABEL_744;
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_744;
  }
  mapViewMapRegion = self->_mapViewMapRegion;
  if ((unint64_t)mapViewMapRegion | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOMapRegion isEqual:](mapViewMapRegion, "isEqual:"))
      goto LABEL_744;
    flags = (uint64_t)self->_flags;
    v9 = *((_QWORD *)&self->_flags + 1);
    v10 = *(_QWORD *)(v4 + 724);
    v11 = *(_QWORD *)(v4 + 732);
  }
  if ((flags & 0x8000000000) != 0)
  {
    if ((v10 & 0x8000000000) == 0 || self->_mapViewMapType != *((_DWORD *)v4 + 155))
      goto LABEL_744;
  }
  else if ((v10 & 0x8000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_mapViewStyleZoomLevel != *((double *)v4 + 26))
      goto LABEL_744;
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_mapViewPitch != *((double *)v4 + 25))
      goto LABEL_744;
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x800000) != 0)
  {
    if ((v11 & 0x800000) == 0)
      goto LABEL_744;
    if (self->_mapViewIsAdvancedMap)
    {
      if (!v4[707])
        goto LABEL_744;
    }
    else if (v4[707])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x800000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x1000000) != 0)
  {
    if ((v11 & 0x1000000) == 0)
      goto LABEL_744;
    if (self->_mapViewIsGlobeProjection)
    {
      if (!v4[708])
        goto LABEL_744;
    }
    else if (v4[708])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x1000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x10000000000) != 0)
  {
    if ((v10 & 0x10000000000) == 0 || self->_mapViewViewMode != *((_DWORD *)v4 + 156))
      goto LABEL_744;
  }
  else if ((v10 & 0x10000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x2000000) != 0)
  {
    if ((v11 & 0x2000000) == 0)
      goto LABEL_744;
    if (self->_mapViewLocationIsTourist)
    {
      if (!v4[709])
        goto LABEL_744;
    }
    else if (v4[709])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x2000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 8) != 0)
  {
    if ((v10 & 8) == 0 || self->_mapViewLocationTouristTimestamp != *((double *)v4 + 23))
      goto LABEL_744;
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x4000000) != 0)
  {
    if ((v11 & 0x4000000) == 0)
      goto LABEL_744;
    if (self->_mapViewLocationPuckInViewport)
    {
      if (!v4[710])
        goto LABEL_744;
    }
    else if (v4[710])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x4000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x40000000) != 0)
  {
    if ((v10 & 0x40000000) == 0 || self->_mapSettingsNavVolume != *((_DWORD *)v4 + 146))
      goto LABEL_744;
  }
  else if ((v10 & 0x40000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x80000000) != 0)
  {
    if ((v10 & 0x80000000) == 0 || self->_mapSettingsTransportMode != *((_DWORD *)v4 + 147))
      goto LABEL_744;
  }
  else if ((v10 & 0x80000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0)
      goto LABEL_744;
    if (self->_mapSettingsAvoidHighways)
    {
      if (!v4[688])
        goto LABEL_744;
    }
    else if (v4[688])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0)
      goto LABEL_744;
    if (self->_mapSettingsAvoidTolls)
    {
      if (!v4[691])
        goto LABEL_744;
    }
    else if (v4[691])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0)
      goto LABEL_744;
    if (self->_mapSettingsFindMyCarEnabled)
    {
      if (!v4[694])
        goto LABEL_744;
    }
    else if (v4[694])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0)
      goto LABEL_744;
    if (self->_mapSettingsHeadingEnabled)
    {
      if (!v4[695])
        goto LABEL_744;
    }
    else if (v4[695])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x2000) != 0)
  {
    if ((v11 & 0x2000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsLabelEnabled)
    {
      if (!v4[697])
        goto LABEL_744;
    }
    else if (v4[697])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x2000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x8000) != 0)
  {
    if ((v11 & 0x8000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsPauseSpokenAudioEnabled)
    {
      if (!v4[699])
        goto LABEL_744;
    }
    else if (v4[699])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x8000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x10000) != 0)
  {
    if ((v11 & 0x10000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsSpeedLimitEnabled)
    {
      if (!v4[700])
        goto LABEL_744;
    }
    else if (v4[700])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x10000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x20000) != 0)
  {
    if ((v11 & 0x20000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsTrafficEnabled)
    {
      if (!v4[701])
        goto LABEL_744;
    }
    else if (v4[701])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x20000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x1000) != 0)
  {
    if ((v11 & 0x1000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsIsHandsFreeProfileEnabled)
    {
      if (!v4[696])
        goto LABEL_744;
    }
    else if (v4[696])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x1000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x80000) != 0)
  {
    if ((v11 & 0x80000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsWalkingAvoidHills)
    {
      if (!v4[703])
        goto LABEL_744;
    }
    else if (v4[703])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x80000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x40000) != 0)
  {
    if ((v11 & 0x40000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsWalkingAvoidBusyRoads)
    {
      if (!v4[702])
        goto LABEL_744;
    }
    else if (v4[702])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x40000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x100000) != 0)
  {
    if ((v11 & 0x100000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsWalkingAvoidStairs)
    {
      if (!v4[704])
        goto LABEL_744;
    }
    else if (v4[704])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x100000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x100) != 0)
  {
    if ((v11 & 0x100) == 0)
      goto LABEL_744;
    if (self->_mapSettingsDirectionsWakeDevice)
    {
      if (!v4[692])
        goto LABEL_744;
    }
    else if (v4[692])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x100) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_mapUiLayoutInfo != *((_DWORD *)v4 + 150))
      goto LABEL_744;
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x800000000) != 0)
  {
    if ((v10 & 0x800000000) == 0 || self->_mapUiLayoutStyle != *((_DWORD *)v4 + 151))
      goto LABEL_744;
  }
  else if ((v10 & 0x800000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x2000000000) != 0)
  {
    if ((v10 & 0x2000000000) == 0 || self->_mapUiNumberOfTabsOpen != *((_DWORD *)v4 + 153))
      goto LABEL_744;
  }
  else if ((v10 & 0x2000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_mapUiCurrentTabIndex != *((_DWORD *)v4 + 149))
      goto LABEL_744;
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x1000000000) != 0)
  {
    if ((v10 & 0x1000000000) == 0 || self->_mapUiNumberOfMapsWindows != *((_DWORD *)v4 + 152))
      goto LABEL_744;
  }
  else if ((v10 & 0x1000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x8000000000000) != 0)
  {
    if ((v10 & 0x8000000000000) == 0 || self->_windowSize != *((_DWORD *)v4 + 167))
      goto LABEL_744;
  }
  else if ((v10 & 0x8000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x200000) != 0)
  {
    if ((v11 & 0x200000) == 0)
      goto LABEL_744;
    if (self->_mapUiShownAqiShown)
    {
      if (!v4[705])
        goto LABEL_744;
    }
    else if (v4[705])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x200000) != 0)
  {
    goto LABEL_744;
  }
  if ((v9 & 0x400000) != 0)
  {
    if ((v11 & 0x400000) == 0)
      goto LABEL_744;
    if (self->_mapUiShownWeatherShown)
    {
      if (!v4[706])
        goto LABEL_744;
    }
    else if (v4[706])
    {
      goto LABEL_744;
    }
  }
  else if ((v11 & 0x400000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x4000000000) != 0)
  {
    if ((v10 & 0x4000000000) == 0 || self->_mapUiShownActiveNavMode != *((_DWORD *)v4 + 154))
      goto LABEL_744;
  }
  else if ((v10 & 0x4000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_lookaroundSessionStartTime != *((double *)v4 + 18))
      goto LABEL_744;
  }
  else if ((v10 & 4) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_lookaroundSessionEndTime != *((double *)v4 + 17))
      goto LABEL_744;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x400000000000000) != 0)
  {
    if ((v10 & 0x400000000000000) == 0)
      goto LABEL_744;
    if (self->_lookaroundSessionHadPanAction)
    {
      if (!v4[678])
        goto LABEL_744;
    }
    else if (v4[678])
    {
      goto LABEL_744;
    }
  }
  else if ((v10 & 0x400000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x2000000000000000) != 0)
  {
    if ((v10 & 0x2000000000000000) == 0)
      goto LABEL_744;
    if (self->_lookaroundSessionHadZoomAction)
    {
      if (!v4[681])
        goto LABEL_744;
    }
    else if (v4[681])
    {
      goto LABEL_744;
    }
  }
  else if ((v10 & 0x2000000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x200000000000000) != 0)
  {
    if ((v10 & 0x200000000000000) == 0)
      goto LABEL_744;
    if (self->_lookaroundSessionHadMoveAction)
    {
      if (!v4[677])
        goto LABEL_744;
    }
    else if (v4[677])
    {
      goto LABEL_744;
    }
  }
  else if ((v10 & 0x200000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x1000000000000000) != 0)
  {
    if ((v10 & 0x1000000000000000) == 0)
      goto LABEL_744;
    if (self->_lookaroundSessionHadTapPoiAction)
    {
      if (!v4[680])
        goto LABEL_744;
    }
    else if (v4[680])
    {
      goto LABEL_744;
    }
  }
  else if ((v10 & 0x1000000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((flags & 0x800000000000000) != 0)
  {
    if ((v10 & 0x800000000000000) == 0)
      goto LABEL_744;
    if (self->_lookaroundSessionHadShareAction)
    {
      if (!v4[679])
        goto LABEL_744;
    }
    else if (v4[679])
    {
      goto LABEL_744;
    }
  }
  else if ((v10 & 0x800000000000000) != 0)
  {
    goto LABEL_744;
  }
  lookAroundLocation = self->_lookAroundLocation;
  if ((unint64_t)lookAroundLocation | *((_QWORD *)v4 + 15)
    && !-[GEOLocation isEqual:](lookAroundLocation, "isEqual:"))
  {
    goto LABEL_744;
  }
  v14 = (uint64_t)self->_flags;
  v16 = *(_QWORD *)(v4 + 724);
  v15 = *(_QWORD *)(v4 + 732);
  if ((v14 & 0x2000) != 0)
  {
    if ((v16 & 0x2000) == 0 || self->_lookAroundHeading != *((_DWORD *)v4 + 129))
      goto LABEL_744;
  }
  else if ((v16 & 0x2000) != 0)
  {
    goto LABEL_744;
  }
  if ((v14 & 1) != 0)
  {
    if ((v16 & 1) == 0 || self->_lookAroundZoom != *((double *)v4 + 16))
      goto LABEL_744;
  }
  else if ((v16 & 1) != 0)
  {
    goto LABEL_744;
  }
  if ((v14 & 0x4000) != 0)
  {
    if ((v16 & 0x4000) == 0 || self->_lookAroundNumberPoisInView != *((_DWORD *)v4 + 130))
      goto LABEL_744;
  }
  else if ((v16 & 0x4000) != 0)
  {
    goto LABEL_744;
  }
  if ((v14 & 0x100000000000000) != 0)
  {
    if ((v16 & 0x100000000000000) == 0)
      goto LABEL_744;
    if (self->_lookAroundIsLabelingShown)
    {
      if (!v4[676])
        goto LABEL_744;
    }
    else if (v4[676])
    {
      goto LABEL_744;
    }
  }
  else if ((v16 & 0x100000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v14 & 0x80000000000000) != 0)
  {
    if ((v16 & 0x80000000000000) == 0)
      goto LABEL_744;
    if (self->_lookAroundEntryIconShown)
    {
      if (!v4[675])
        goto LABEL_744;
    }
    else if (v4[675])
    {
      goto LABEL_744;
    }
  }
  else if ((v16 & 0x80000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v14 & 0x10000000000000) != 0)
  {
    if ((v16 & 0x10000000000000) == 0)
      goto LABEL_744;
    if (self->_deviceInDarkMode)
    {
      if (!v4[672])
        goto LABEL_744;
    }
    else if (v4[672])
    {
      goto LABEL_744;
    }
  }
  else if ((v16 & 0x10000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((*((_QWORD *)&self->_flags + 1) & 0x1000000000) != 0)
  {
    if ((v15 & 0x1000000000) == 0)
      goto LABEL_744;
    if (self->_venueExperienceShown)
    {
      if (!v4[720])
        goto LABEL_744;
    }
    else if (v4[720])
    {
      goto LABEL_744;
    }
  }
  else if ((v15 & 0x1000000000) != 0)
  {
    goto LABEL_744;
  }
  placeCardState = self->_placeCardState;
  if ((unint64_t)placeCardState | *((_QWORD *)v4 + 51)
    && !-[GEOLogMsgStatePlaceCard isEqual:](placeCardState, "isEqual:"))
  {
    goto LABEL_744;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_744;
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_744;
  placeCardPlaceCardCategory = self->_placeCardPlaceCardCategory;
  if ((unint64_t)placeCardPlaceCardCategory | *((_QWORD *)v4 + 49))
  {
    if (!-[NSString isEqual:](placeCardPlaceCardCategory, "isEqual:"))
      goto LABEL_744;
  }
  v19 = (uint64_t)self->_flags;
  v20 = *(_QWORD *)(v4 + 724);
  v21 = *(_QWORD *)(v4 + 732);
  if ((v19 & 0x100000000000) != 0)
  {
    if ((v20 & 0x100000000000) == 0 || self->_placeCardPlaceCardType != *((_DWORD *)v4 + 160))
      goto LABEL_744;
  }
  else if ((v20 & 0x100000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((*((_QWORD *)&self->_flags + 1) & 0x40000000) != 0)
  {
    if ((v21 & 0x40000000) == 0)
      goto LABEL_744;
    if (self->_placeCardTransitAdvisoryBanner)
    {
      if (!v4[714])
        goto LABEL_744;
    }
    else if (v4[714])
    {
      goto LABEL_744;
    }
  }
  else if ((v21 & 0x40000000) != 0)
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsActionUrl = self->_placeCardPlaceActionDetailsActionUrl;
  if ((unint64_t)placeCardPlaceActionDetailsActionUrl | *((_QWORD *)v4 + 34))
  {
    if (!-[NSString isEqual:](placeCardPlaceActionDetailsActionUrl, "isEqual:"))
      goto LABEL_744;
    v19 = (uint64_t)self->_flags;
    v20 = *(_QWORD *)(v4 + 724);
  }
  if ((v19 & 0x80) != 0)
  {
    if ((v20 & 0x80) == 0 || self->_placeCardPlaceActionDetailsAnimationId != *((_QWORD *)v4 + 35))
      goto LABEL_744;
  }
  else if ((v20 & 0x80) != 0)
  {
    goto LABEL_744;
  }
  if ((v19 & 0x100) != 0)
  {
    if ((v20 & 0x100) == 0 || self->_placeCardPlaceActionDetailsBusinessId != *((_QWORD *)v4 + 36))
      goto LABEL_744;
  }
  else if ((v20 & 0x100) != 0)
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsDestinationApp = self->_placeCardPlaceActionDetailsDestinationApp;
  if ((unint64_t)placeCardPlaceActionDetailsDestinationApp | *((_QWORD *)v4 + 37)
    && !-[NSString isEqual:](placeCardPlaceActionDetailsDestinationApp, "isEqual:"))
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsPhotoId = self->_placeCardPlaceActionDetailsPhotoId;
  if ((unint64_t)placeCardPlaceActionDetailsPhotoId | *((_QWORD *)v4 + 38))
  {
    if (!-[NSString isEqual:](placeCardPlaceActionDetailsPhotoId, "isEqual:"))
      goto LABEL_744;
  }
  v25 = (uint64_t)self->_flags;
  v26 = *(_QWORD *)(v4 + 724);
  if ((v25 & 0x200) != 0)
  {
    if ((v26 & 0x200) == 0 || self->_placeCardPlaceActionDetailsPlaceId != *((_QWORD *)v4 + 39))
      goto LABEL_744;
  }
  else if ((v26 & 0x200) != 0)
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsRichProviderId = self->_placeCardPlaceActionDetailsRichProviderId;
  if ((unint64_t)placeCardPlaceActionDetailsRichProviderId | *((_QWORD *)v4 + 40))
  {
    if (!-[NSString isEqual:](placeCardPlaceActionDetailsRichProviderId, "isEqual:"))
      goto LABEL_744;
    v25 = (uint64_t)self->_flags;
    v26 = *(_QWORD *)(v4 + 724);
  }
  if ((v25 & 0x400) != 0)
  {
    if ((v26 & 0x400) == 0 || self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp != *((double *)v4 + 41))
      goto LABEL_744;
  }
  else if ((v26 & 0x400) != 0)
  {
    goto LABEL_744;
  }
  if ((v25 & 0x800) != 0)
  {
    if ((v26 & 0x800) == 0 || self->_placeCardPlaceActionDetailsTargetId != *((_QWORD *)v4 + 43))
      goto LABEL_744;
  }
  else if ((v26 & 0x800) != 0)
  {
    goto LABEL_744;
  }
  if ((v25 & 0x20000000000) != 0)
  {
    if ((v26 & 0x20000000000) == 0
      || self->_placeCardPlaceActionDetailsLocalSearchProviderId != *((_DWORD *)v4 + 157))
    {
      goto LABEL_744;
    }
  }
  else if ((v26 & 0x20000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v25 & 0x40000000000) != 0)
  {
    if ((v26 & 0x40000000000) == 0 || self->_placeCardPlaceActionDetailsResultIndex != *((_DWORD *)v4 + 158))
      goto LABEL_744;
  }
  else if ((v26 & 0x40000000000) != 0)
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsShowcaseId = self->_placeCardPlaceActionDetailsShowcaseId;
  if ((unint64_t)placeCardPlaceActionDetailsShowcaseId | *((_QWORD *)v4 + 42)
    && !-[NSString isEqual:](placeCardPlaceActionDetailsShowcaseId, "isEqual:"))
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsTransitPlaceCardIncidentType = self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType;
  if ((unint64_t)placeCardPlaceActionDetailsTransitPlaceCardIncidentType | *((_QWORD *)v4 + 44))
  {
    if (!-[NSString isEqual:](placeCardPlaceActionDetailsTransitPlaceCardIncidentType, "isEqual:"))
      goto LABEL_744;
  }
  placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName;
  if ((unint64_t)placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName | *((_QWORD *)v4 + 48))
  {
    if (!-[NSString isEqual:](placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName, "isEqual:"))
      goto LABEL_744;
  }
  v31 = *(_QWORD *)(v4 + 724);
  if ((*(_QWORD *)&self->_flags & 0x80000000000) != 0)
  {
    if ((v31 & 0x80000000000) == 0
      || self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory != *((_DWORD *)v4 + 159))
    {
      goto LABEL_744;
    }
  }
  else if ((v31 & 0x80000000000) != 0)
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection;
  if ((unint64_t)placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection | *((_QWORD *)v4 + 45)
    && !-[NSString isEqual:](placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection, "isEqual:"))
  {
    goto LABEL_744;
  }
  placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign = self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign;
  if ((unint64_t)placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign | *((_QWORD *)v4 + 46))
  {
    if (!-[NSString isEqual:](placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign, "isEqual:"))goto LABEL_744;
  }
  v34 = *((_QWORD *)&self->_flags + 1);
  v36 = *(_QWORD *)(v4 + 724);
  v35 = *(_QWORD *)(v4 + 732);
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
  {
    if ((v36 & 0x1000) == 0
      || self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId != *((_QWORD *)v4 + 47))
    {
      goto LABEL_744;
    }
  }
  else if ((v36 & 0x1000) != 0)
  {
    goto LABEL_744;
  }
  placeCardRevealedPlaceCardModules = self->_placeCardRevealedPlaceCardModules;
  if ((unint64_t)placeCardRevealedPlaceCardModules | *((_QWORD *)v4 + 50))
  {
    if (!-[NSMutableArray isEqual:](placeCardRevealedPlaceCardModules, "isEqual:"))
      goto LABEL_744;
    v34 = *((_QWORD *)&self->_flags + 1);
    v35 = *(_QWORD *)(v4 + 732);
  }
  if ((v34 & 0x20000000) != 0)
  {
    if ((v35 & 0x20000000) == 0)
      goto LABEL_744;
    if (self->_placeCardIsPersonPlacecard)
    {
      if (!v4[713])
        goto LABEL_744;
    }
    else if (v4[713])
    {
      goto LABEL_744;
    }
  }
  else if ((v35 & 0x20000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v34 & 0x8000000) != 0)
  {
    if ((v35 & 0x8000000) == 0)
      goto LABEL_744;
    if (self->_placeCardIsPersonAddressAvailable)
    {
      if (!v4[711])
        goto LABEL_744;
    }
    else if (v4[711])
    {
      goto LABEL_744;
    }
  }
  else if ((v35 & 0x8000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v34 & 0x10000000) != 0)
  {
    if ((v35 & 0x10000000) == 0)
      goto LABEL_744;
    if (self->_placeCardIsPersonLocationShared)
    {
      if (!v4[712])
        goto LABEL_744;
    }
    else if (v4[712])
    {
      goto LABEL_744;
    }
  }
  else if ((v35 & 0x10000000) != 0)
  {
    goto LABEL_744;
  }
  mapsServerMetadataSuggestionEntryTappedOn = self->_mapsServerMetadataSuggestionEntryTappedOn;
  if ((unint64_t)mapsServerMetadataSuggestionEntryTappedOn | *((_QWORD *)v4 + 30)
    && !-[NSData isEqual:](mapsServerMetadataSuggestionEntryTappedOn, "isEqual:"))
  {
    goto LABEL_744;
  }
  mapsServerMetadataSuggestionEntryDisplayeds = self->_mapsServerMetadataSuggestionEntryDisplayeds;
  if ((unint64_t)mapsServerMetadataSuggestionEntryDisplayeds | *((_QWORD *)v4 + 29))
  {
    if (!-[NSMutableArray isEqual:](mapsServerMetadataSuggestionEntryDisplayeds, "isEqual:"))
      goto LABEL_744;
  }
  mapsServerMetadata = self->_mapsServerMetadata;
  if ((unint64_t)mapsServerMetadata | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOMapsServerMetadata isEqual:](mapsServerMetadata, "isEqual:"))
      goto LABEL_744;
  }
  routeRouteDetails = self->_routeRouteDetails;
  if ((unint64_t)routeRouteDetails | *((_QWORD *)v4 + 55))
  {
    if (!-[GEORouteDetails isEqual:](routeRouteDetails, "isEqual:"))
      goto LABEL_744;
  }
  predExTrainingData = self->_predExTrainingData;
  if ((unint64_t)predExTrainingData | *((_QWORD *)v4 + 52))
  {
    if (!-[GEOLogMsgEventPredExTrainingData isEqual:](predExTrainingData, "isEqual:"))
      goto LABEL_744;
  }
  v43 = (uint64_t)self->_flags;
  v44 = *(_QWORD *)(v4 + 724);
  if ((v43 & 0x1000000000000) != 0)
  {
    if ((v44 & 0x1000000000000) == 0 || self->_suggestionsAcSequenceNumber != *((_DWORD *)v4 + 164))
      goto LABEL_744;
  }
  else if ((v44 & 0x1000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v43 & 0x2000000000000) != 0)
  {
    if ((v44 & 0x2000000000000) == 0 || self->_suggestionsSearchFieldType != *((_DWORD *)v4 + 165))
      goto LABEL_744;
  }
  else if ((v44 & 0x2000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v43 & 0x4000000000000) != 0)
  {
    if ((v44 & 0x4000000000000) == 0 || self->_suggestionsSelectedIndex != *((_DWORD *)v4 + 166))
      goto LABEL_744;
  }
  else if ((v44 & 0x4000000000000) != 0)
  {
    goto LABEL_744;
  }
  suggestionsSearchString = self->_suggestionsSearchString;
  if ((unint64_t)suggestionsSearchString | *((_QWORD *)v4 + 58)
    && !-[NSString isEqual:](suggestionsSearchString, "isEqual:"))
  {
    goto LABEL_744;
  }
  suggestionsDisplayedResults = self->_suggestionsDisplayedResults;
  if ((unint64_t)suggestionsDisplayedResults | *((_QWORD *)v4 + 57))
  {
    if (!-[NSMutableArray isEqual:](suggestionsDisplayedResults, "isEqual:"))
      goto LABEL_744;
  }
  v47 = (uint64_t)self->_flags;
  v48 = *(_QWORD *)(v4 + 724);
  if ((v47 & 0x40000000000000) != 0)
  {
    if ((v48 & 0x40000000000000) == 0)
      goto LABEL_744;
    if (self->_landscape)
    {
      if (!v4[674])
        goto LABEL_744;
    }
    else if (v4[674])
    {
      goto LABEL_744;
    }
  }
  else if ((v48 & 0x40000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v47 & 0x200000000000) != 0)
  {
    if ((v48 & 0x200000000000) == 0 || self->_restoreLayoutInfo != *((_DWORD *)v4 + 161))
      goto LABEL_744;
  }
  else if ((v48 & 0x200000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v47 & 0x400000000000) != 0)
  {
    if ((v48 & 0x400000000000) == 0 || self->_restoreLayoutStyle != *((_DWORD *)v4 + 162))
      goto LABEL_744;
  }
  else if ((v48 & 0x400000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v47 & 0x800000000000) != 0)
  {
    if ((v48 & 0x800000000000) == 0 || self->_restoreUiTarget != *((_DWORD *)v4 + 163))
      goto LABEL_744;
  }
  else if ((v48 & 0x800000000000) != 0)
  {
    goto LABEL_744;
  }
  mapLaunchSourceAppId = self->_mapLaunchSourceAppId;
  if ((unint64_t)mapLaunchSourceAppId | *((_QWORD *)v4 + 21)
    && !-[NSString isEqual:](mapLaunchSourceAppId, "isEqual:"))
  {
    goto LABEL_744;
  }
  mapLaunchLaunchUri = self->_mapLaunchLaunchUri;
  if ((unint64_t)mapLaunchLaunchUri | *((_QWORD *)v4 + 19))
  {
    if (!-[NSString isEqual:](mapLaunchLaunchUri, "isEqual:"))
      goto LABEL_744;
  }
  mapLaunchReferringWebsite = self->_mapLaunchReferringWebsite;
  if ((unint64_t)mapLaunchReferringWebsite | *((_QWORD *)v4 + 20))
  {
    if (!-[NSString isEqual:](mapLaunchReferringWebsite, "isEqual:"))
      goto LABEL_744;
  }
  v53 = (uint64_t)self->_flags;
  v52 = *((_QWORD *)&self->_flags + 1);
  v55 = *(_QWORD *)(v4 + 724);
  v54 = *(_QWORD *)(v4 + 732);
  if ((v52 & 4) != 0)
  {
    if ((v54 & 4) == 0)
      goto LABEL_744;
    if (self->_mapLaunchIsHandoff)
    {
      if (!v4[686])
        goto LABEL_744;
    }
    else if (v4[686])
    {
      goto LABEL_744;
    }
  }
  else if ((v54 & 4) != 0)
  {
    goto LABEL_744;
  }
  mapLaunchSourceHandoffDevice = self->_mapLaunchSourceHandoffDevice;
  if ((unint64_t)mapLaunchSourceHandoffDevice | *((_QWORD *)v4 + 22))
  {
    if (!-[NSString isEqual:](mapLaunchSourceHandoffDevice, "isEqual:"))
      goto LABEL_744;
    v53 = (uint64_t)self->_flags;
    v52 = *((_QWORD *)&self->_flags + 1);
    v55 = *(_QWORD *)(v4 + 724);
    v54 = *(_QWORD *)(v4 + 732);
  }
  if ((v53 & 0x4000000) != 0)
  {
    if ((v55 & 0x4000000) == 0 || self->_mapLaunchAction != *((_DWORD *)v4 + 142))
      goto LABEL_744;
  }
  else if ((v55 & 0x4000000) != 0)
  {
    goto LABEL_744;
  }
  curatedCollectionState = self->_curatedCollectionState;
  if ((unint64_t)curatedCollectionState | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOLogMsgStateCuratedCollection isEqual:](curatedCollectionState, "isEqual:"))
      goto LABEL_744;
    v53 = (uint64_t)self->_flags;
    v52 = *((_QWORD *)&self->_flags + 1);
    v55 = *(_QWORD *)(v4 + 724);
    v54 = *(_QWORD *)(v4 + 732);
  }
  if ((v52 & 0x20) != 0)
  {
    if ((v54 & 0x20) == 0)
      goto LABEL_744;
    if (self->_mapSettingsAvoidHills)
    {
      if (!v4[689])
        goto LABEL_744;
    }
    else if (v4[689])
    {
      goto LABEL_744;
    }
  }
  else if ((v54 & 0x20) != 0)
  {
    goto LABEL_744;
  }
  if ((v52 & 0x40) != 0)
  {
    if ((v54 & 0x40) == 0)
      goto LABEL_744;
    if (self->_mapSettingsAvoidStairs)
    {
      if (!v4[690])
        goto LABEL_744;
    }
    else if (v4[690])
    {
      goto LABEL_744;
    }
  }
  else if ((v54 & 0x40) != 0)
  {
    goto LABEL_744;
  }
  if ((v52 & 8) != 0)
  {
    if ((v54 & 8) == 0)
      goto LABEL_744;
    if (self->_mapSettingsAvoidBusyRoads)
    {
      if (!v4[687])
        goto LABEL_744;
    }
    else if (v4[687])
    {
      goto LABEL_744;
    }
  }
  else if ((v54 & 8) != 0)
  {
    goto LABEL_744;
  }
  if ((v53 & 0x20000000) != 0)
  {
    if ((v55 & 0x20000000) == 0 || self->_mapSettingsLocationPrecisionType != *((_DWORD *)v4 + 145))
      goto LABEL_744;
  }
  else if ((v55 & 0x20000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v52 & 0x200) != 0)
  {
    if ((v54 & 0x200) == 0)
      goto LABEL_744;
    if (self->_mapSettingsEBike)
    {
      if (!v4[693])
        goto LABEL_744;
    }
    else if (v4[693])
    {
      goto LABEL_744;
    }
  }
  else if ((v54 & 0x200) != 0)
  {
    goto LABEL_744;
  }
  ugcPhotoState = self->_ugcPhotoState;
  if ((unint64_t)ugcPhotoState | *((_QWORD *)v4 + 60)
    && !-[GEOLogMsgStateUGCPhoto isEqual:](ugcPhotoState, "isEqual:"))
  {
    goto LABEL_744;
  }
  metroRegion = self->_metroRegion;
  if ((unint64_t)metroRegion | *((_QWORD *)v4 + 32))
  {
    if (!-[NSString isEqual:](metroRegion, "isEqual:"))
      goto LABEL_744;
  }
  userHomeMetro = self->_userHomeMetro;
  if ((unint64_t)userHomeMetro | *((_QWORD *)v4 + 62))
  {
    if (!-[NSString isEqual:](userHomeMetro, "isEqual:"))
      goto LABEL_744;
  }
  userHomeCountry = self->_userHomeCountry;
  if ((unint64_t)userHomeCountry | *((_QWORD *)v4 + 61))
  {
    if (!-[NSString isEqual:](userHomeCountry, "isEqual:"))
      goto LABEL_744;
  }
  v63 = (uint64_t)self->_flags;
  v62 = *((_QWORD *)&self->_flags + 1);
  v65 = *(_QWORD *)(v4 + 724);
  v64 = *(_QWORD *)(v4 + 732);
  if ((v63 & 0x10000000) != 0)
  {
    if ((v65 & 0x10000000) == 0 || self->_mapSettingsDrivingVoiceSettings != *((_DWORD *)v4 + 144))
      goto LABEL_744;
  }
  else if ((v65 & 0x10000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x100000000) != 0)
  {
    if ((v65 & 0x100000000) == 0 || self->_mapSettingsWalkingVoiceSettings != *((_DWORD *)v4 + 148))
      goto LABEL_744;
  }
  else if ((v65 & 0x100000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x8000000) != 0)
  {
    if ((v65 & 0x8000000) == 0 || self->_mapSettingsCyclingVoiceSettings != *((_DWORD *)v4 + 143))
      goto LABEL_744;
  }
  else if ((v65 & 0x8000000) != 0)
  {
    goto LABEL_744;
  }
  account = self->_account;
  if ((unint64_t)account | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOLogMsgStateAccount isEqual:](account, "isEqual:"))
      goto LABEL_744;
    v63 = (uint64_t)self->_flags;
    v62 = *((_QWORD *)&self->_flags + 1);
    v65 = *(_QWORD *)(v4 + 724);
    v64 = *(_QWORD *)(v4 + 732);
  }
  if ((v63 & 0x400000) != 0)
  {
    if ((v65 & 0x400000) == 0 || self->_mapFeaturePersonalCollectionsCount != *((_DWORD *)v4 + 138))
      goto LABEL_744;
  }
  else if ((v65 & 0x400000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x800000) != 0)
  {
    if ((v65 & 0x800000) == 0 || self->_mapFeatureSavedCollectionsCount != *((_DWORD *)v4 + 139))
      goto LABEL_744;
  }
  else if ((v65 & 0x800000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x2000000) != 0)
  {
    if ((v65 & 0x2000000) == 0 || self->_mapFeatureSubmittedRatingsCount != *((_DWORD *)v4 + 141))
      goto LABEL_744;
  }
  else if ((v65 & 0x2000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x1000000) != 0)
  {
    if ((v65 & 0x1000000) == 0 || self->_mapFeatureSubmittedPhotosCount != *((_DWORD *)v4 + 140))
      goto LABEL_744;
  }
  else if ((v65 & 0x1000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x8000) != 0)
  {
    if ((v65 & 0x8000) == 0 || self->_mapFeatureElectronicVehicleCount != *((_DWORD *)v4 + 131))
      goto LABEL_744;
  }
  else if ((v65 & 0x8000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x200000) != 0)
  {
    if ((v65 & 0x200000) == 0 || self->_mapFeatureLicensePlateCount != *((_DWORD *)v4 + 137))
      goto LABEL_744;
  }
  else if ((v65 & 0x200000) != 0)
  {
    goto LABEL_744;
  }
  if ((v62 & 0x200000000) != 0)
  {
    if ((v64 & 0x200000000) == 0)
      goto LABEL_744;
    if (self->_suggestionsSiriEnabled)
    {
      if (!v4[717])
        goto LABEL_744;
    }
    else if (v4[717])
    {
      goto LABEL_744;
    }
  }
  else if ((v64 & 0x200000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x4000000000000000) != 0)
  {
    if ((v65 & 0x4000000000000000) == 0)
      goto LABEL_744;
    if (self->_mapFeatureIsHomeFavoriteSet)
    {
      if (!v4[682])
        goto LABEL_744;
    }
    else if (v4[682])
    {
      goto LABEL_744;
    }
  }
  else if ((v65 & 0x4000000000000000) != 0)
  {
    goto LABEL_744;
  }
  if ((v62 & 2) != 0)
  {
    if ((v64 & 2) == 0)
      goto LABEL_744;
    if (self->_mapFeatureIsWorkFavoriteSet)
    {
      if (!v4[685])
        goto LABEL_744;
    }
    else if (v4[685])
    {
      goto LABEL_744;
    }
  }
  else if ((v64 & 2) != 0)
  {
    goto LABEL_744;
  }
  if (v63 < 0)
  {
    if ((v65 & 0x8000000000000000) == 0)
      goto LABEL_744;
    if (self->_mapFeatureIsSchoolFavoriteSet)
    {
      if (!v4[683])
        goto LABEL_744;
    }
    else if (v4[683])
    {
      goto LABEL_744;
    }
  }
  else if (v65 < 0)
  {
    goto LABEL_744;
  }
  if ((v62 & 1) != 0)
  {
    if ((v64 & 1) == 0)
      goto LABEL_744;
    if (self->_mapFeatureIsTransitFavoriteSet)
    {
      if (!v4[684])
        goto LABEL_744;
    }
    else if (v4[684])
    {
      goto LABEL_744;
    }
  }
  else if ((v64 & 1) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x10000) != 0)
  {
    if ((v65 & 0x10000) == 0 || self->_mapFeatureFavoritesCount != *((_DWORD *)v4 + 132))
      goto LABEL_744;
  }
  else if ((v65 & 0x10000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x100000) != 0)
  {
    if ((v65 & 0x100000) == 0 || self->_mapFeatureLibrarySavedPlacesCount != *((_DWORD *)v4 + 136))
      goto LABEL_744;
  }
  else if ((v65 & 0x100000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x80000) != 0)
  {
    if ((v65 & 0x80000) == 0 || self->_mapFeatureLibraryPlacesWithNoteCount != *((_DWORD *)v4 + 135))
      goto LABEL_744;
  }
  else if ((v65 & 0x80000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x40000) != 0)
  {
    if ((v65 & 0x40000) == 0 || self->_mapFeatureLibraryGuidesSavedPlacesCount != *((_DWORD *)v4 + 134))
      goto LABEL_744;
  }
  else if ((v65 & 0x40000) != 0)
  {
    goto LABEL_744;
  }
  if ((v63 & 0x20000) != 0)
  {
    if ((v65 & 0x20000) == 0 || self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount != *((_DWORD *)v4 + 133))
      goto LABEL_744;
  }
  else if ((v65 & 0x20000) != 0)
  {
    goto LABEL_744;
  }
  if ((v62 & 0x4000) != 0)
  {
    if ((v64 & 0x4000) == 0)
      goto LABEL_744;
    if (self->_mapSettingsNotificationsEnabled)
    {
      if (!v4[698])
        goto LABEL_744;
    }
    else if (v4[698])
    {
      goto LABEL_744;
    }
  }
  else if ((v64 & 0x4000) != 0)
  {
    goto LABEL_744;
  }
  searchResultsState = self->_searchResultsState;
  if ((unint64_t)searchResultsState | *((_QWORD *)v4 + 56)
    && !-[GEOLogMsgStateSearchResults isEqual:](searchResultsState, "isEqual:"))
  {
    goto LABEL_744;
  }
  impressionObjectState = self->_impressionObjectState;
  if ((unint64_t)impressionObjectState | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOLogMsgStateImpressionObject isEqual:](impressionObjectState, "isEqual:"))
      goto LABEL_744;
  }
  tapEventState = self->_tapEventState;
  if ((unint64_t)tapEventState | *((_QWORD *)v4 + 59))
  {
    if (!-[GEOLogMsgStateTapEvent isEqual:](tapEventState, "isEqual:"))
      goto LABEL_744;
  }
  actionButtonDetailsState = self->_actionButtonDetailsState;
  if ((unint64_t)actionButtonDetailsState | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOLogMsgStateActionButtonDetails isEqual:](actionButtonDetailsState, "isEqual:"))
      goto LABEL_744;
  }
  photoSubmissionDetailsState = self->_photoSubmissionDetailsState;
  if ((unint64_t)photoSubmissionDetailsState | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOLogMsgStateARPPhotoSubmission isEqual:](photoSubmissionDetailsState, "isEqual:"))
      goto LABEL_744;
  }
  ratingSubmissionDetailsState = self->_ratingSubmissionDetailsState;
  if ((unint64_t)ratingSubmissionDetailsState | *((_QWORD *)v4 + 54))
  {
    if (!-[GEOLogMsgStateARPRatingSubmission isEqual:](ratingSubmissionDetailsState, "isEqual:"))
      goto LABEL_744;
  }
  ratingPhotoSubmissionDetailsState = self->_ratingPhotoSubmissionDetailsState;
  if ((unint64_t)ratingPhotoSubmissionDetailsState | *((_QWORD *)v4 + 53))
  {
    if (!-[GEOLogMsgStateARPRatingPhotoSubmission isEqual:](ratingPhotoSubmissionDetailsState, "isEqual:"))
      goto LABEL_744;
  }
  mapsPlaceIdsState = self->_mapsPlaceIdsState;
  if ((unint64_t)mapsPlaceIdsState | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOLogMsgStateMapsPlaceIds isEqual:](mapsPlaceIdsState, "isEqual:"))
      goto LABEL_744;
  }
  v75 = *(_QWORD *)(v4 + 724);
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
  {
    if ((v75 & 0x20000000000000) != 0)
    {
      if (self->_isInternalTool)
      {
        if (!v4[673])
          goto LABEL_744;
      }
      else if (v4[673])
      {
        goto LABEL_744;
      }
      v76 = 1;
      goto LABEL_745;
    }
LABEL_744:
    v76 = 0;
    goto LABEL_745;
  }
  v76 = (v75 & 0x20000000000000) == 0;
LABEL_745:

  return v76;
}

- (unint64_t)hash
{
  uint64_t flags;
  uint64_t v4;
  double mapViewZoomLevel;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double mapViewStyleZoomLevel;
  double v13;
  long double v14;
  double v15;
  unint64_t v16;
  unint64_t v17;
  double mapViewPitch;
  double v19;
  long double v20;
  double v21;
  double mapViewLocationTouristTimestamp;
  double v23;
  long double v24;
  double v25;
  unint64_t v26;
  double lookaroundSessionStartTime;
  double v28;
  long double v29;
  double v30;
  unint64_t v31;
  unint64_t v32;
  double lookaroundSessionEndTime;
  double v34;
  long double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  double lookAroundZoom;
  double v41;
  long double v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  double placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
  double v49;
  long double v50;
  double v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  NSUInteger v65;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  NSUInteger v92;
  NSUInteger v93;
  NSUInteger v94;
  unint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  NSUInteger v103;
  uint64_t v104;
  NSUInteger v105;
  NSUInteger v106;
  NSUInteger v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  NSUInteger v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  unint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unint64_t v126;
  NSUInteger v127;
  NSUInteger v128;
  uint64_t v129;
  NSUInteger v130;
  NSUInteger v131;
  NSUInteger v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  NSUInteger v137;
  uint64_t v138;
  NSUInteger v139;
  NSUInteger v140;
  unint64_t v141;
  unint64_t v142;
  NSUInteger v143;
  uint64_t v144;
  uint64_t v145;
  NSUInteger v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  unint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  unint64_t v163;
  unint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  unint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  unint64_t v201;
  NSUInteger v202;
  NSUInteger v203;

  -[GEOAnalyticsPipelineStateData readAll:](self, "readAll:", 1);
  v203 = -[NSString hash](self->_deviceInputLocale, "hash");
  v202 = -[NSString hash](self->_deviceOutputLocale, "hash");
  v201 = -[GEOCarInfo hash](self->_carPlayInfo, "hash");
  flags = (uint64_t)self->_flags;
  v4 = *((_QWORD *)&self->_flags + 1);
  if ((v4 & 0x100000000) != 0)
  {
    v200 = 2654435761 * self->_rideBookingAppInstalled;
    if ((v4 & 0x80000000) != 0)
    {
LABEL_3:
      v199 = 2654435761 * self->_rideBookingAppEnabled;
      if ((v4 & 0x800000000) != 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else
  {
    v200 = 0;
    if ((v4 & 0x80000000) != 0)
      goto LABEL_3;
  }
  v199 = 0;
  if ((v4 & 0x800000000) != 0)
  {
LABEL_4:
    v198 = 2654435761 * self->_tableBookingAppInstalled;
    if ((v4 & 0x400000000) != 0)
      goto LABEL_5;
LABEL_13:
    v197 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_6;
LABEL_14:
    v9 = 0;
    goto LABEL_17;
  }
LABEL_12:
  v198 = 0;
  if ((v4 & 0x400000000) == 0)
    goto LABEL_13;
LABEL_5:
  v197 = 2654435761 * self->_tableBookingAppEnabled;
  if ((flags & 0x40) == 0)
    goto LABEL_14;
LABEL_6:
  mapViewZoomLevel = self->_mapViewZoomLevel;
  v6 = -mapViewZoomLevel;
  if (mapViewZoomLevel >= 0.0)
    v6 = self->_mapViewZoomLevel;
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
LABEL_17:
  v196 = v9;
  v195 = -[GEOMapRegion hash](self->_mapViewMapRegion, "hash");
  v10 = (uint64_t)self->_flags;
  v11 = *((_QWORD *)&self->_flags + 1);
  if ((v10 & 0x8000000000) != 0)
  {
    v194 = 2654435761 * self->_mapViewMapType;
    if ((v10 & 0x20) != 0)
      goto LABEL_19;
LABEL_24:
    v16 = 0;
    goto LABEL_27;
  }
  v194 = 0;
  if ((v10 & 0x20) == 0)
    goto LABEL_24;
LABEL_19:
  mapViewStyleZoomLevel = self->_mapViewStyleZoomLevel;
  v13 = -mapViewStyleZoomLevel;
  if (mapViewStyleZoomLevel >= 0.0)
    v13 = self->_mapViewStyleZoomLevel;
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
LABEL_27:
  if ((v10 & 0x10) != 0)
  {
    mapViewPitch = self->_mapViewPitch;
    v19 = -mapViewPitch;
    if (mapViewPitch >= 0.0)
      v19 = self->_mapViewPitch;
    v20 = floor(v19 + 0.5);
    v21 = (v19 - v20) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
    if (v21 >= 0.0)
    {
      if (v21 > 0.0)
        v17 += (unint64_t)v21;
    }
    else
    {
      v17 -= (unint64_t)fabs(v21);
    }
  }
  else
  {
    v17 = 0;
  }
  if ((v11 & 0x800000) != 0)
  {
    v193 = 2654435761 * self->_mapViewIsAdvancedMap;
    if ((v11 & 0x1000000) != 0)
    {
LABEL_37:
      v192 = 2654435761 * self->_mapViewIsGlobeProjection;
      if ((v10 & 0x10000000000) != 0)
        goto LABEL_38;
      goto LABEL_46;
    }
  }
  else
  {
    v193 = 0;
    if ((v11 & 0x1000000) != 0)
      goto LABEL_37;
  }
  v192 = 0;
  if ((v10 & 0x10000000000) != 0)
  {
LABEL_38:
    v191 = 2654435761 * self->_mapViewViewMode;
    if ((v11 & 0x2000000) != 0)
      goto LABEL_39;
LABEL_47:
    v190 = 0;
    if ((v10 & 8) != 0)
      goto LABEL_40;
LABEL_48:
    v26 = 0;
    goto LABEL_51;
  }
LABEL_46:
  v191 = 0;
  if ((v11 & 0x2000000) == 0)
    goto LABEL_47;
LABEL_39:
  v190 = 2654435761 * self->_mapViewLocationIsTourist;
  if ((v10 & 8) == 0)
    goto LABEL_48;
LABEL_40:
  mapViewLocationTouristTimestamp = self->_mapViewLocationTouristTimestamp;
  v23 = -mapViewLocationTouristTimestamp;
  if (mapViewLocationTouristTimestamp >= 0.0)
    v23 = self->_mapViewLocationTouristTimestamp;
  v24 = floor(v23 + 0.5);
  v25 = (v23 - v24) * 1.84467441e19;
  v26 = 2654435761u * (unint64_t)fmod(v24, 1.84467441e19);
  if (v25 >= 0.0)
  {
    if (v25 > 0.0)
      v26 += (unint64_t)v25;
  }
  else
  {
    v26 -= (unint64_t)fabs(v25);
  }
LABEL_51:
  if ((v11 & 0x4000000) != 0)
  {
    v189 = 2654435761 * self->_mapViewLocationPuckInViewport;
    if ((v10 & 0x40000000) != 0)
    {
LABEL_53:
      v188 = 2654435761 * self->_mapSettingsNavVolume;
      if ((v10 & 0x80000000) != 0)
        goto LABEL_54;
      goto LABEL_83;
    }
  }
  else
  {
    v189 = 0;
    if ((v10 & 0x40000000) != 0)
      goto LABEL_53;
  }
  v188 = 0;
  if ((v10 & 0x80000000) != 0)
  {
LABEL_54:
    v187 = 2654435761 * self->_mapSettingsTransportMode;
    if ((v11 & 0x10) != 0)
      goto LABEL_55;
    goto LABEL_84;
  }
LABEL_83:
  v187 = 0;
  if ((v11 & 0x10) != 0)
  {
LABEL_55:
    v186 = 2654435761 * self->_mapSettingsAvoidHighways;
    if ((v11 & 0x80) != 0)
      goto LABEL_56;
    goto LABEL_85;
  }
LABEL_84:
  v186 = 0;
  if ((v11 & 0x80) != 0)
  {
LABEL_56:
    v185 = 2654435761 * self->_mapSettingsAvoidTolls;
    if ((v11 & 0x400) != 0)
      goto LABEL_57;
    goto LABEL_86;
  }
LABEL_85:
  v185 = 0;
  if ((v11 & 0x400) != 0)
  {
LABEL_57:
    v184 = 2654435761 * self->_mapSettingsFindMyCarEnabled;
    if ((v11 & 0x800) != 0)
      goto LABEL_58;
    goto LABEL_87;
  }
LABEL_86:
  v184 = 0;
  if ((v11 & 0x800) != 0)
  {
LABEL_58:
    v183 = 2654435761 * self->_mapSettingsHeadingEnabled;
    if ((v11 & 0x2000) != 0)
      goto LABEL_59;
    goto LABEL_88;
  }
LABEL_87:
  v183 = 0;
  if ((v11 & 0x2000) != 0)
  {
LABEL_59:
    v182 = 2654435761 * self->_mapSettingsLabelEnabled;
    if ((v11 & 0x8000) != 0)
      goto LABEL_60;
    goto LABEL_89;
  }
LABEL_88:
  v182 = 0;
  if ((v11 & 0x8000) != 0)
  {
LABEL_60:
    v181 = 2654435761 * self->_mapSettingsPauseSpokenAudioEnabled;
    if ((v11 & 0x10000) != 0)
      goto LABEL_61;
    goto LABEL_90;
  }
LABEL_89:
  v181 = 0;
  if ((v11 & 0x10000) != 0)
  {
LABEL_61:
    v180 = 2654435761 * self->_mapSettingsSpeedLimitEnabled;
    if ((v11 & 0x20000) != 0)
      goto LABEL_62;
    goto LABEL_91;
  }
LABEL_90:
  v180 = 0;
  if ((v11 & 0x20000) != 0)
  {
LABEL_62:
    v179 = 2654435761 * self->_mapSettingsTrafficEnabled;
    if ((v11 & 0x1000) != 0)
      goto LABEL_63;
    goto LABEL_92;
  }
LABEL_91:
  v179 = 0;
  if ((v11 & 0x1000) != 0)
  {
LABEL_63:
    v178 = 2654435761 * self->_mapSettingsIsHandsFreeProfileEnabled;
    if ((v11 & 0x80000) != 0)
      goto LABEL_64;
    goto LABEL_93;
  }
LABEL_92:
  v178 = 0;
  if ((v11 & 0x80000) != 0)
  {
LABEL_64:
    v177 = 2654435761 * self->_mapSettingsWalkingAvoidHills;
    if ((v11 & 0x40000) != 0)
      goto LABEL_65;
    goto LABEL_94;
  }
LABEL_93:
  v177 = 0;
  if ((v11 & 0x40000) != 0)
  {
LABEL_65:
    v176 = 2654435761 * self->_mapSettingsWalkingAvoidBusyRoads;
    if ((v11 & 0x100000) != 0)
      goto LABEL_66;
    goto LABEL_95;
  }
LABEL_94:
  v176 = 0;
  if ((v11 & 0x100000) != 0)
  {
LABEL_66:
    v175 = 2654435761 * self->_mapSettingsWalkingAvoidStairs;
    if ((v11 & 0x100) != 0)
      goto LABEL_67;
    goto LABEL_96;
  }
LABEL_95:
  v175 = 0;
  if ((v11 & 0x100) != 0)
  {
LABEL_67:
    v174 = 2654435761 * self->_mapSettingsDirectionsWakeDevice;
    if ((v10 & 0x400000000) != 0)
      goto LABEL_68;
    goto LABEL_97;
  }
LABEL_96:
  v174 = 0;
  if ((v10 & 0x400000000) != 0)
  {
LABEL_68:
    v173 = 2654435761 * self->_mapUiLayoutInfo;
    if ((v10 & 0x800000000) != 0)
      goto LABEL_69;
    goto LABEL_98;
  }
LABEL_97:
  v173 = 0;
  if ((v10 & 0x800000000) != 0)
  {
LABEL_69:
    v172 = 2654435761 * self->_mapUiLayoutStyle;
    if ((v10 & 0x2000000000) != 0)
      goto LABEL_70;
    goto LABEL_99;
  }
LABEL_98:
  v172 = 0;
  if ((v10 & 0x2000000000) != 0)
  {
LABEL_70:
    v171 = 2654435761 * self->_mapUiNumberOfTabsOpen;
    if ((v10 & 0x200000000) != 0)
      goto LABEL_71;
    goto LABEL_100;
  }
LABEL_99:
  v171 = 0;
  if ((v10 & 0x200000000) != 0)
  {
LABEL_71:
    v170 = 2654435761 * self->_mapUiCurrentTabIndex;
    if ((v10 & 0x1000000000) != 0)
      goto LABEL_72;
    goto LABEL_101;
  }
LABEL_100:
  v170 = 0;
  if ((v10 & 0x1000000000) != 0)
  {
LABEL_72:
    v169 = 2654435761 * self->_mapUiNumberOfMapsWindows;
    if ((v10 & 0x8000000000000) != 0)
      goto LABEL_73;
    goto LABEL_102;
  }
LABEL_101:
  v169 = 0;
  if ((v10 & 0x8000000000000) != 0)
  {
LABEL_73:
    v168 = 2654435761 * self->_windowSize;
    if ((v11 & 0x200000) != 0)
      goto LABEL_74;
    goto LABEL_103;
  }
LABEL_102:
  v168 = 0;
  if ((v11 & 0x200000) != 0)
  {
LABEL_74:
    v167 = 2654435761 * self->_mapUiShownAqiShown;
    if ((v11 & 0x400000) != 0)
      goto LABEL_75;
    goto LABEL_104;
  }
LABEL_103:
  v167 = 0;
  if ((v11 & 0x400000) != 0)
  {
LABEL_75:
    v166 = 2654435761 * self->_mapUiShownWeatherShown;
    if ((v10 & 0x4000000000) != 0)
      goto LABEL_76;
LABEL_105:
    v165 = 0;
    if ((v10 & 4) != 0)
      goto LABEL_77;
LABEL_106:
    v31 = 0;
    goto LABEL_109;
  }
LABEL_104:
  v166 = 0;
  if ((v10 & 0x4000000000) == 0)
    goto LABEL_105;
LABEL_76:
  v165 = 2654435761 * self->_mapUiShownActiveNavMode;
  if ((v10 & 4) == 0)
    goto LABEL_106;
LABEL_77:
  lookaroundSessionStartTime = self->_lookaroundSessionStartTime;
  v28 = -lookaroundSessionStartTime;
  if (lookaroundSessionStartTime >= 0.0)
    v28 = self->_lookaroundSessionStartTime;
  v29 = floor(v28 + 0.5);
  v30 = (v28 - v29) * 1.84467441e19;
  v31 = 2654435761u * (unint64_t)fmod(v29, 1.84467441e19);
  if (v30 >= 0.0)
  {
    if (v30 > 0.0)
      v31 += (unint64_t)v30;
  }
  else
  {
    v31 -= (unint64_t)fabs(v30);
  }
LABEL_109:
  if ((v10 & 2) != 0)
  {
    lookaroundSessionEndTime = self->_lookaroundSessionEndTime;
    v34 = -lookaroundSessionEndTime;
    if (lookaroundSessionEndTime >= 0.0)
      v34 = self->_lookaroundSessionEndTime;
    v35 = floor(v34 + 0.5);
    v36 = (v34 - v35) * 1.84467441e19;
    v32 = 2654435761u * (unint64_t)fmod(v35, 1.84467441e19);
    if (v36 >= 0.0)
    {
      if (v36 > 0.0)
        v32 += (unint64_t)v36;
    }
    else
    {
      v32 -= (unint64_t)fabs(v36);
    }
  }
  else
  {
    v32 = 0;
  }
  if ((v10 & 0x400000000000000) != 0)
  {
    v162 = 2654435761 * self->_lookaroundSessionHadPanAction;
    if ((v10 & 0x2000000000000000) != 0)
    {
LABEL_119:
      v161 = 2654435761 * self->_lookaroundSessionHadZoomAction;
      if ((v10 & 0x200000000000000) != 0)
        goto LABEL_120;
LABEL_124:
      v160 = 0;
      if ((v10 & 0x1000000000000000) != 0)
        goto LABEL_121;
      goto LABEL_125;
    }
  }
  else
  {
    v162 = 0;
    if ((v10 & 0x2000000000000000) != 0)
      goto LABEL_119;
  }
  v161 = 0;
  if ((v10 & 0x200000000000000) == 0)
    goto LABEL_124;
LABEL_120:
  v160 = 2654435761 * self->_lookaroundSessionHadMoveAction;
  if ((v10 & 0x1000000000000000) != 0)
  {
LABEL_121:
    v159 = 2654435761 * self->_lookaroundSessionHadTapPoiAction;
    goto LABEL_126;
  }
LABEL_125:
  v159 = 0;
LABEL_126:
  v163 = v32;
  if ((v10 & 0x800000000000000) != 0)
    v158 = 2654435761 * self->_lookaroundSessionHadShareAction;
  else
    v158 = 0;
  v157 = -[GEOLocation hash](self->_lookAroundLocation, "hash");
  v37 = (uint64_t)self->_flags;
  v164 = v31;
  if ((v37 & 0x2000) != 0)
    v156 = 2654435761 * self->_lookAroundHeading;
  else
    v156 = 0;
  v38 = *((_QWORD *)&self->_flags + 1);
  if ((v37 & 1) != 0)
  {
    lookAroundZoom = self->_lookAroundZoom;
    v41 = -lookAroundZoom;
    if (lookAroundZoom >= 0.0)
      v41 = self->_lookAroundZoom;
    v42 = floor(v41 + 0.5);
    v43 = (v41 - v42) * 1.84467441e19;
    v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0)
        v39 += (unint64_t)v43;
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    v39 = 0;
  }
  if ((v37 & 0x4000) != 0)
  {
    v154 = 2654435761 * self->_lookAroundNumberPoisInView;
    if ((v37 & 0x100000000000000) != 0)
    {
LABEL_142:
      v153 = 2654435761 * self->_lookAroundIsLabelingShown;
      if ((v37 & 0x80000000000000) != 0)
        goto LABEL_143;
LABEL_147:
      v152 = 0;
      if ((v37 & 0x10000000000000) != 0)
        goto LABEL_144;
      goto LABEL_148;
    }
  }
  else
  {
    v154 = 0;
    if ((v37 & 0x100000000000000) != 0)
      goto LABEL_142;
  }
  v153 = 0;
  if ((v37 & 0x80000000000000) == 0)
    goto LABEL_147;
LABEL_143:
  v152 = 2654435761 * self->_lookAroundEntryIconShown;
  if ((v37 & 0x10000000000000) != 0)
  {
LABEL_144:
    v151 = 2654435761 * self->_deviceInDarkMode;
    goto LABEL_149;
  }
LABEL_148:
  v151 = 0;
LABEL_149:
  v155 = v39;
  if ((v38 & 0x1000000000) != 0)
    v150 = 2654435761 * self->_venueExperienceShown;
  else
    v150 = 0;
  v149 = -[GEOLogMsgStatePlaceCard hash](self->_placeCardState, "hash");
  v148 = PBRepeatedInt32Hash();
  v147 = PBRepeatedInt32Hash();
  v146 = -[NSString hash](self->_placeCardPlaceCardCategory, "hash");
  v44 = *((_QWORD *)&self->_flags + 1);
  if ((*(_QWORD *)&self->_flags & 0x100000000000) != 0)
  {
    v145 = 2654435761 * self->_placeCardPlaceCardType;
    if ((v44 & 0x40000000) != 0)
      goto LABEL_154;
  }
  else
  {
    v145 = 0;
    if ((v44 & 0x40000000) != 0)
    {
LABEL_154:
      v144 = 2654435761 * self->_placeCardTransitAdvisoryBanner;
      goto LABEL_157;
    }
  }
  v144 = 0;
LABEL_157:
  v143 = -[NSString hash](self->_placeCardPlaceActionDetailsActionUrl, "hash");
  v45 = (uint64_t)self->_flags;
  if ((v45 & 0x80) != 0)
  {
    v142 = 2654435761u * self->_placeCardPlaceActionDetailsAnimationId;
    if ((v45 & 0x100) != 0)
      goto LABEL_159;
  }
  else
  {
    v142 = 0;
    if ((v45 & 0x100) != 0)
    {
LABEL_159:
      v141 = 2654435761u * self->_placeCardPlaceActionDetailsBusinessId;
      goto LABEL_162;
    }
  }
  v141 = 0;
LABEL_162:
  v140 = -[NSString hash](self->_placeCardPlaceActionDetailsDestinationApp, "hash");
  v139 = -[NSString hash](self->_placeCardPlaceActionDetailsPhotoId, "hash");
  if ((*(_QWORD *)&self->_flags & 0x200) != 0)
    v138 = 2654435761 * self->_placeCardPlaceActionDetailsPlaceId;
  else
    v138 = 0;
  v137 = -[NSString hash](self->_placeCardPlaceActionDetailsRichProviderId, "hash");
  v46 = (uint64_t)self->_flags;
  if ((v46 & 0x400) != 0)
  {
    placeCardPlaceActionDetailsSearchResponseRelativeTimestamp = self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
    v49 = -placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
    if (placeCardPlaceActionDetailsSearchResponseRelativeTimestamp >= 0.0)
      v49 = self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp;
    v50 = floor(v49 + 0.5);
    v51 = (v49 - v50) * 1.84467441e19;
    v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0)
        v47 += (unint64_t)v51;
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    v47 = 0;
  }
  if ((v46 & 0x800) != 0)
  {
    v135 = 2654435761u * self->_placeCardPlaceActionDetailsTargetId;
    if ((v46 & 0x20000000000) != 0)
      goto LABEL_175;
  }
  else
  {
    v135 = 0;
    if ((v46 & 0x20000000000) != 0)
    {
LABEL_175:
      v134 = 2654435761 * self->_placeCardPlaceActionDetailsLocalSearchProviderId;
      goto LABEL_178;
    }
  }
  v134 = 0;
LABEL_178:
  v136 = v47;
  if ((v46 & 0x40000000000) != 0)
    v133 = 2654435761 * self->_placeCardPlaceActionDetailsResultIndex;
  else
    v133 = 0;
  v132 = -[NSString hash](self->_placeCardPlaceActionDetailsShowcaseId, "hash");
  v131 = -[NSString hash](self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType, "hash");
  v130 = -[NSString hash](self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName, "hash");
  if ((*(_QWORD *)&self->_flags & 0x80000000000) != 0)
    v129 = 2654435761 * self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory;
  else
    v129 = 0;
  v128 = -[NSString hash](self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection, "hash");
  v127 = -[NSString hash](self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign, "hash");
  if ((*(_QWORD *)&self->_flags & 0x1000) != 0)
    v126 = 2654435761u * self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId;
  else
    v126 = 0;
  v125 = -[NSMutableArray hash](self->_placeCardRevealedPlaceCardModules, "hash");
  v52 = *((_QWORD *)&self->_flags + 1);
  if ((v52 & 0x20000000) == 0)
  {
    v124 = 0;
    if ((v52 & 0x8000000) != 0)
      goto LABEL_189;
LABEL_192:
    v123 = 0;
    if ((v52 & 0x10000000) != 0)
      goto LABEL_190;
    goto LABEL_193;
  }
  v124 = 2654435761 * self->_placeCardIsPersonPlacecard;
  if ((v52 & 0x8000000) == 0)
    goto LABEL_192;
LABEL_189:
  v123 = 2654435761 * self->_placeCardIsPersonAddressAvailable;
  if ((v52 & 0x10000000) != 0)
  {
LABEL_190:
    v122 = 2654435761 * self->_placeCardIsPersonLocationShared;
    goto LABEL_194;
  }
LABEL_193:
  v122 = 0;
LABEL_194:
  v121 = -[NSData hash](self->_mapsServerMetadataSuggestionEntryTappedOn, "hash");
  v120 = -[NSMutableArray hash](self->_mapsServerMetadataSuggestionEntryDisplayeds, "hash");
  v119 = -[GEOMapsServerMetadata hash](self->_mapsServerMetadata, "hash");
  v118 = -[GEORouteDetails hash](self->_routeRouteDetails, "hash");
  v117 = -[GEOLogMsgEventPredExTrainingData hash](self->_predExTrainingData, "hash");
  v53 = (uint64_t)self->_flags;
  if ((v53 & 0x1000000000000) == 0)
  {
    v116 = 0;
    if ((v53 & 0x2000000000000) != 0)
      goto LABEL_196;
LABEL_199:
    v115 = 0;
    if ((v53 & 0x4000000000000) != 0)
      goto LABEL_197;
    goto LABEL_200;
  }
  v116 = 2654435761 * self->_suggestionsAcSequenceNumber;
  if ((v53 & 0x2000000000000) == 0)
    goto LABEL_199;
LABEL_196:
  v115 = 2654435761 * self->_suggestionsSearchFieldType;
  if ((v53 & 0x4000000000000) != 0)
  {
LABEL_197:
    v114 = 2654435761 * self->_suggestionsSelectedIndex;
    goto LABEL_201;
  }
LABEL_200:
  v114 = 0;
LABEL_201:
  v113 = -[NSString hash](self->_suggestionsSearchString, "hash");
  v112 = -[NSMutableArray hash](self->_suggestionsDisplayedResults, "hash");
  v54 = (uint64_t)self->_flags;
  if ((v54 & 0x40000000000000) != 0)
  {
    v111 = 2654435761 * self->_landscape;
    if ((v54 & 0x200000000000) != 0)
    {
LABEL_203:
      v110 = 2654435761 * self->_restoreLayoutInfo;
      if ((v54 & 0x400000000000) != 0)
        goto LABEL_204;
LABEL_208:
      v109 = 0;
      if ((v54 & 0x800000000000) != 0)
        goto LABEL_205;
      goto LABEL_209;
    }
  }
  else
  {
    v111 = 0;
    if ((v54 & 0x200000000000) != 0)
      goto LABEL_203;
  }
  v110 = 0;
  if ((v54 & 0x400000000000) == 0)
    goto LABEL_208;
LABEL_204:
  v109 = 2654435761 * self->_restoreLayoutStyle;
  if ((v54 & 0x800000000000) != 0)
  {
LABEL_205:
    v108 = 2654435761 * self->_restoreUiTarget;
    goto LABEL_210;
  }
LABEL_209:
  v108 = 0;
LABEL_210:
  v107 = -[NSString hash](self->_mapLaunchSourceAppId, "hash");
  v106 = -[NSString hash](self->_mapLaunchLaunchUri, "hash");
  v105 = -[NSString hash](self->_mapLaunchReferringWebsite, "hash");
  if ((*((_QWORD *)&self->_flags + 1) & 4) != 0)
    v104 = 2654435761 * self->_mapLaunchIsHandoff;
  else
    v104 = 0;
  v103 = -[NSString hash](self->_mapLaunchSourceHandoffDevice, "hash");
  if ((*(_QWORD *)&self->_flags & 0x4000000) != 0)
    v102 = 2654435761 * self->_mapLaunchAction;
  else
    v102 = 0;
  v101 = -[GEOLogMsgStateCuratedCollection hash](self->_curatedCollectionState, "hash");
  v56 = (uint64_t)self->_flags;
  v55 = *((_QWORD *)&self->_flags + 1);
  if ((v55 & 0x20) != 0)
  {
    v100 = 2654435761 * self->_mapSettingsAvoidHills;
    if ((v55 & 0x40) != 0)
    {
LABEL_218:
      v99 = 2654435761 * self->_mapSettingsAvoidStairs;
      if ((v55 & 8) != 0)
        goto LABEL_219;
      goto LABEL_224;
    }
  }
  else
  {
    v100 = 0;
    if ((v55 & 0x40) != 0)
      goto LABEL_218;
  }
  v99 = 0;
  if ((v55 & 8) != 0)
  {
LABEL_219:
    v98 = 2654435761 * self->_mapSettingsAvoidBusyRoads;
    if ((v56 & 0x20000000) != 0)
      goto LABEL_220;
LABEL_225:
    v97 = 0;
    if ((v55 & 0x200) != 0)
      goto LABEL_221;
    goto LABEL_226;
  }
LABEL_224:
  v98 = 0;
  if ((v56 & 0x20000000) == 0)
    goto LABEL_225;
LABEL_220:
  v97 = 2654435761 * self->_mapSettingsLocationPrecisionType;
  if ((v55 & 0x200) != 0)
  {
LABEL_221:
    v96 = 2654435761 * self->_mapSettingsEBike;
    goto LABEL_227;
  }
LABEL_226:
  v96 = 0;
LABEL_227:
  v95 = -[GEOLogMsgStateUGCPhoto hash](self->_ugcPhotoState, "hash");
  v94 = -[NSString hash](self->_metroRegion, "hash");
  v93 = -[NSString hash](self->_userHomeMetro, "hash");
  v92 = -[NSString hash](self->_userHomeCountry, "hash");
  v57 = (uint64_t)self->_flags;
  if ((v57 & 0x10000000) == 0)
  {
    v91 = 0;
    if ((v57 & 0x100000000) != 0)
      goto LABEL_229;
LABEL_232:
    v90 = 0;
    if ((v57 & 0x8000000) != 0)
      goto LABEL_230;
    goto LABEL_233;
  }
  v91 = 2654435761 * self->_mapSettingsDrivingVoiceSettings;
  if ((v57 & 0x100000000) == 0)
    goto LABEL_232;
LABEL_229:
  v90 = 2654435761 * self->_mapSettingsWalkingVoiceSettings;
  if ((v57 & 0x8000000) != 0)
  {
LABEL_230:
    v89 = 2654435761 * self->_mapSettingsCyclingVoiceSettings;
    goto LABEL_234;
  }
LABEL_233:
  v89 = 0;
LABEL_234:
  v88 = -[GEOLogMsgStateAccount hash](self->_account, "hash");
  v58 = (uint64_t)self->_flags;
  if ((v58 & 0x400000) != 0)
  {
    v87 = 2654435761 * self->_mapFeaturePersonalCollectionsCount;
    if ((v58 & 0x800000) != 0)
    {
LABEL_236:
      v86 = 2654435761 * self->_mapFeatureSavedCollectionsCount;
      if ((v58 & 0x2000000) != 0)
        goto LABEL_237;
      goto LABEL_242;
    }
  }
  else
  {
    v87 = 0;
    if ((v58 & 0x800000) != 0)
      goto LABEL_236;
  }
  v86 = 0;
  if ((v58 & 0x2000000) != 0)
  {
LABEL_237:
    v85 = 2654435761 * self->_mapFeatureSubmittedRatingsCount;
    if ((v58 & 0x1000000) != 0)
      goto LABEL_238;
LABEL_243:
    v84 = 0;
    if ((v58 & 0x8000) != 0)
      goto LABEL_239;
    goto LABEL_244;
  }
LABEL_242:
  v85 = 0;
  if ((v58 & 0x1000000) == 0)
    goto LABEL_243;
LABEL_238:
  v84 = 2654435761 * self->_mapFeatureSubmittedPhotosCount;
  if ((v58 & 0x8000) != 0)
  {
LABEL_239:
    v83 = 2654435761 * self->_mapFeatureElectronicVehicleCount;
    goto LABEL_245;
  }
LABEL_244:
  v83 = 0;
LABEL_245:
  v59 = *((_QWORD *)&self->_flags + 1);
  if ((v58 & 0x200000) != 0)
  {
    v82 = 2654435761 * self->_mapFeatureLicensePlateCount;
    if ((v59 & 0x200000000) != 0)
    {
LABEL_247:
      v81 = 2654435761 * self->_suggestionsSiriEnabled;
      if ((v58 & 0x4000000000000000) != 0)
        goto LABEL_248;
      goto LABEL_260;
    }
  }
  else
  {
    v82 = 0;
    if ((v59 & 0x200000000) != 0)
      goto LABEL_247;
  }
  v81 = 0;
  if ((v58 & 0x4000000000000000) != 0)
  {
LABEL_248:
    v80 = 2654435761 * self->_mapFeatureIsHomeFavoriteSet;
    if ((v59 & 2) != 0)
      goto LABEL_249;
    goto LABEL_261;
  }
LABEL_260:
  v80 = 0;
  if ((v59 & 2) != 0)
  {
LABEL_249:
    v79 = 2654435761 * self->_mapFeatureIsWorkFavoriteSet;
    if (v58 < 0)
      goto LABEL_250;
    goto LABEL_262;
  }
LABEL_261:
  v79 = 0;
  if (v58 < 0)
  {
LABEL_250:
    v78 = 2654435761 * self->_mapFeatureIsSchoolFavoriteSet;
    if ((v59 & 1) != 0)
      goto LABEL_251;
    goto LABEL_263;
  }
LABEL_262:
  v78 = 0;
  if ((v59 & 1) != 0)
  {
LABEL_251:
    v77 = 2654435761 * self->_mapFeatureIsTransitFavoriteSet;
    if ((v58 & 0x10000) != 0)
      goto LABEL_252;
    goto LABEL_264;
  }
LABEL_263:
  v77 = 0;
  if ((v58 & 0x10000) != 0)
  {
LABEL_252:
    v76 = 2654435761 * self->_mapFeatureFavoritesCount;
    if ((v58 & 0x100000) != 0)
      goto LABEL_253;
    goto LABEL_265;
  }
LABEL_264:
  v76 = 0;
  if ((v58 & 0x100000) != 0)
  {
LABEL_253:
    v75 = 2654435761 * self->_mapFeatureLibrarySavedPlacesCount;
    if ((v58 & 0x80000) != 0)
      goto LABEL_254;
    goto LABEL_266;
  }
LABEL_265:
  v75 = 0;
  if ((v58 & 0x80000) != 0)
  {
LABEL_254:
    v74 = 2654435761 * self->_mapFeatureLibraryPlacesWithNoteCount;
    if ((v58 & 0x40000) != 0)
      goto LABEL_255;
    goto LABEL_267;
  }
LABEL_266:
  v74 = 0;
  if ((v58 & 0x40000) != 0)
  {
LABEL_255:
    v73 = 2654435761 * self->_mapFeatureLibraryGuidesSavedPlacesCount;
    if ((v58 & 0x20000) != 0)
      goto LABEL_256;
LABEL_268:
    v72 = 0;
    if ((v59 & 0x4000) != 0)
      goto LABEL_257;
    goto LABEL_269;
  }
LABEL_267:
  v73 = 0;
  if ((v58 & 0x20000) == 0)
    goto LABEL_268;
LABEL_256:
  v72 = 2654435761 * self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount;
  if ((v59 & 0x4000) != 0)
  {
LABEL_257:
    v71 = 2654435761 * self->_mapSettingsNotificationsEnabled;
    goto LABEL_270;
  }
LABEL_269:
  v71 = 0;
LABEL_270:
  v70 = -[GEOLogMsgStateSearchResults hash](self->_searchResultsState, "hash");
  v69 = -[GEOLogMsgStateImpressionObject hash](self->_impressionObjectState, "hash");
  v68 = -[GEOLogMsgStateTapEvent hash](self->_tapEventState, "hash");
  v67 = -[GEOLogMsgStateActionButtonDetails hash](self->_actionButtonDetailsState, "hash");
  v60 = -[GEOLogMsgStateARPPhotoSubmission hash](self->_photoSubmissionDetailsState, "hash");
  v61 = -[GEOLogMsgStateARPRatingSubmission hash](self->_ratingSubmissionDetailsState, "hash");
  v62 = -[GEOLogMsgStateARPRatingPhotoSubmission hash](self->_ratingPhotoSubmissionDetailsState, "hash");
  v63 = -[GEOLogMsgStateMapsPlaceIds hash](self->_mapsPlaceIdsState, "hash");
  if ((*(_QWORD *)&self->_flags & 0x20000000000000) != 0)
    v64 = 2654435761 * self->_isInternalTool;
  else
    v64 = 0;
  v65 = v202 ^ v203 ^ v201 ^ v200 ^ v199 ^ v198 ^ v197 ^ v196 ^ v195 ^ v194 ^ v16 ^ v17 ^ v193 ^ v192 ^ v191 ^ v190 ^ v26 ^ v189 ^ v188 ^ v187 ^ v186 ^ v185 ^ v184 ^ v183 ^ v182 ^ v181 ^ v180 ^ v179 ^ v178 ^ v177 ^ v176 ^ v175 ^ v174 ^ v173 ^ v172 ^ v171 ^ v170 ^ v169 ^ v168 ^ v167 ^ v166 ^ v165 ^ v164 ^ v163 ^ v162 ^ v161 ^ v160 ^ v159 ^ v158 ^ v157 ^ v156 ^ v155 ^ v154 ^ v153 ^ v152 ^ v151 ^ v150 ^ v149 ^ v148 ^ v147 ^ v146 ^ v145 ^ v144 ^ v143 ^ v142 ^ v141 ^ v140 ^ v139 ^ v138 ^ v137 ^ v136 ^ v135 ^ v134 ^ v133 ^ v132 ^ v131 ^ v130 ^ v129 ^ v128 ^ v127 ^ v126 ^ v125;
  return v65 ^ v124 ^ v123 ^ v122 ^ v121 ^ v120 ^ v119 ^ v118 ^ v117 ^ v116 ^ v115 ^ v114 ^ v113 ^ v112 ^ v111 ^ v110 ^ v109 ^ v108 ^ v107 ^ v106 ^ v105 ^ v104 ^ v103 ^ v102 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v60 ^ v61 ^ v62 ^ v63 ^ v64;
}

- (void)mergeFrom:(id)a3
{
  char *v4;
  GEOCarInfo *carPlayInfo;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  GEOMapRegion *mapViewMapRegion;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  GEOLocation *lookAroundLocation;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  GEOLogMsgStatePlaceCard *placeCardState;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t m;
  GEOMapsServerMetadata *mapsServerMetadata;
  uint64_t v42;
  GEORouteDetails *routeRouteDetails;
  uint64_t v44;
  GEOLogMsgEventPredExTrainingData *predExTrainingData;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t n;
  uint64_t *v54;
  uint64_t v55;
  GEOLogMsgStateCuratedCollection *curatedCollectionState;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  GEOLogMsgStateUGCPhoto *ugcPhotoState;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  GEOLogMsgStateAccount *account;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  GEOLogMsgStateSearchResults *searchResultsState;
  uint64_t v70;
  GEOLogMsgStateImpressionObject *impressionObjectState;
  uint64_t v72;
  GEOLogMsgStateTapEvent *tapEventState;
  uint64_t v74;
  GEOLogMsgStateActionButtonDetails *actionButtonDetailsState;
  uint64_t v76;
  GEOLogMsgStateARPPhotoSubmission *photoSubmissionDetailsState;
  uint64_t v78;
  GEOLogMsgStateARPRatingSubmission *ratingSubmissionDetailsState;
  uint64_t v80;
  GEOLogMsgStateARPRatingPhotoSubmission *ratingPhotoSubmissionDetailsState;
  uint64_t v82;
  GEOLogMsgStateMapsPlaceIds *mapsPlaceIdsState;
  uint64_t v84;
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
  _BYTE v97[128];
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 12))
    -[GEOAnalyticsPipelineStateData setDeviceInputLocale:](self, "setDeviceInputLocale:");
  if (*((_QWORD *)v4 + 13))
    -[GEOAnalyticsPipelineStateData setDeviceOutputLocale:](self, "setDeviceOutputLocale:");
  carPlayInfo = self->_carPlayInfo;
  v6 = *((_QWORD *)v4 + 10);
  if (carPlayInfo)
  {
    if (v6)
      -[GEOCarInfo mergeFrom:](carPlayInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOAnalyticsPipelineStateData setCarPlayInfo:](self, "setCarPlayInfo:");
  }
  v7 = *(_QWORD *)(v4 + 732);
  if ((v7 & 0x100000000) != 0)
  {
    self->_rideBookingAppInstalled = v4[716];
    *((_QWORD *)&self->_flags + 1) |= 0x100000000uLL;
    v7 = *(_QWORD *)(v4 + 732);
  }
  v8 = *(_QWORD *)(v4 + 724);
  if ((v7 & 0x80000000) != 0)
  {
    self->_rideBookingAppEnabled = v4[715];
    *((_QWORD *)&self->_flags + 1) |= 0x80000000uLL;
    v8 = *(_QWORD *)(v4 + 724);
    v7 = *(_QWORD *)(v4 + 732);
    if ((v7 & 0x800000000) == 0)
    {
LABEL_14:
      if ((v7 & 0x400000000) == 0)
        goto LABEL_15;
      goto LABEL_22;
    }
  }
  else if ((v7 & 0x800000000) == 0)
  {
    goto LABEL_14;
  }
  self->_tableBookingAppInstalled = v4[719];
  *((_QWORD *)&self->_flags + 1) |= 0x800000000uLL;
  v8 = *(_QWORD *)(v4 + 724);
  if ((*(_QWORD *)(v4 + 732) & 0x400000000) == 0)
  {
LABEL_15:
    if ((v8 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_22:
  self->_tableBookingAppEnabled = v4[718];
  *((_QWORD *)&self->_flags + 1) |= 0x400000000uLL;
  if ((*(_QWORD *)(v4 + 724) & 0x40) != 0)
  {
LABEL_16:
    self->_mapViewZoomLevel = *((double *)v4 + 27);
    *(_QWORD *)&self->_flags |= 0x40uLL;
  }
LABEL_17:
  mapViewMapRegion = self->_mapViewMapRegion;
  v10 = *((_QWORD *)v4 + 24);
  if (mapViewMapRegion)
  {
    if (v10)
      -[GEOMapRegion mergeFrom:](mapViewMapRegion, "mergeFrom:");
  }
  else if (v10)
  {
    -[GEOAnalyticsPipelineStateData setMapViewMapRegion:](self, "setMapViewMapRegion:");
  }
  v11 = (uint64_t *)(v4 + 724);
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 0x8000000000) != 0)
  {
    self->_mapViewMapType = *((_DWORD *)v4 + 155);
    *(_QWORD *)&self->_flags |= 0x8000000000uLL;
    v12 = *v11;
    v13 = *(_QWORD *)(v4 + 732);
    if ((*v11 & 0x20) == 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x20) != 0)
  {
LABEL_30:
    self->_mapViewStyleZoomLevel = *((double *)v4 + 26);
    *(_QWORD *)&self->_flags |= 0x20uLL;
    v12 = *(_QWORD *)(v4 + 724);
    v13 = *(_QWORD *)(v4 + 732);
  }
LABEL_31:
  if ((v12 & 0x10) != 0)
  {
    self->_mapViewPitch = *((double *)v4 + 25);
    *(_QWORD *)&self->_flags |= 0x10uLL;
    v12 = *(_QWORD *)(v4 + 724);
    v13 = *(_QWORD *)(v4 + 732);
    if ((v13 & 0x800000) == 0)
    {
LABEL_33:
      if ((v13 & 0x1000000) == 0)
        goto LABEL_34;
      goto LABEL_75;
    }
  }
  else if ((v13 & 0x800000) == 0)
  {
    goto LABEL_33;
  }
  self->_mapViewIsAdvancedMap = v4[707];
  *((_QWORD *)&self->_flags + 1) |= 0x800000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x1000000) == 0)
  {
LABEL_34:
    if ((v12 & 0x10000000000) == 0)
      goto LABEL_35;
    goto LABEL_76;
  }
LABEL_75:
  self->_mapViewIsGlobeProjection = v4[708];
  *((_QWORD *)&self->_flags + 1) |= 0x1000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x10000000000) == 0)
  {
LABEL_35:
    if ((v13 & 0x2000000) == 0)
      goto LABEL_36;
    goto LABEL_77;
  }
LABEL_76:
  self->_mapViewViewMode = *((_DWORD *)v4 + 156);
  *(_QWORD *)&self->_flags |= 0x10000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x2000000) == 0)
  {
LABEL_36:
    if ((v12 & 8) == 0)
      goto LABEL_37;
    goto LABEL_78;
  }
LABEL_77:
  self->_mapViewLocationIsTourist = v4[709];
  *((_QWORD *)&self->_flags + 1) |= 0x2000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 8) == 0)
  {
LABEL_37:
    if ((v13 & 0x4000000) == 0)
      goto LABEL_38;
    goto LABEL_79;
  }
LABEL_78:
  self->_mapViewLocationTouristTimestamp = *((double *)v4 + 23);
  *(_QWORD *)&self->_flags |= 8uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x4000000) == 0)
  {
LABEL_38:
    if ((v12 & 0x40000000) == 0)
      goto LABEL_39;
    goto LABEL_80;
  }
LABEL_79:
  self->_mapViewLocationPuckInViewport = v4[710];
  *((_QWORD *)&self->_flags + 1) |= 0x4000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x40000000) == 0)
  {
LABEL_39:
    if ((v12 & 0x80000000) == 0)
      goto LABEL_40;
    goto LABEL_81;
  }
LABEL_80:
  self->_mapSettingsNavVolume = *((_DWORD *)v4 + 146);
  *(_QWORD *)&self->_flags |= 0x40000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x80000000) == 0)
  {
LABEL_40:
    if ((v13 & 0x10) == 0)
      goto LABEL_41;
    goto LABEL_82;
  }
LABEL_81:
  self->_mapSettingsTransportMode = *((_DWORD *)v4 + 147);
  *(_QWORD *)&self->_flags |= 0x80000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x10) == 0)
  {
LABEL_41:
    if ((v13 & 0x80) == 0)
      goto LABEL_42;
    goto LABEL_83;
  }
LABEL_82:
  self->_mapSettingsAvoidHighways = v4[688];
  *((_QWORD *)&self->_flags + 1) |= 0x10uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x80) == 0)
  {
LABEL_42:
    if ((v13 & 0x400) == 0)
      goto LABEL_43;
    goto LABEL_84;
  }
LABEL_83:
  self->_mapSettingsAvoidTolls = v4[691];
  *((_QWORD *)&self->_flags + 1) |= 0x80uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x400) == 0)
  {
LABEL_43:
    if ((v13 & 0x800) == 0)
      goto LABEL_44;
    goto LABEL_85;
  }
LABEL_84:
  self->_mapSettingsFindMyCarEnabled = v4[694];
  *((_QWORD *)&self->_flags + 1) |= 0x400uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x800) == 0)
  {
LABEL_44:
    if ((v13 & 0x2000) == 0)
      goto LABEL_45;
    goto LABEL_86;
  }
LABEL_85:
  self->_mapSettingsHeadingEnabled = v4[695];
  *((_QWORD *)&self->_flags + 1) |= 0x800uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x2000) == 0)
  {
LABEL_45:
    if ((v13 & 0x8000) == 0)
      goto LABEL_46;
    goto LABEL_87;
  }
LABEL_86:
  self->_mapSettingsLabelEnabled = v4[697];
  *((_QWORD *)&self->_flags + 1) |= 0x2000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x8000) == 0)
  {
LABEL_46:
    if ((v13 & 0x10000) == 0)
      goto LABEL_47;
    goto LABEL_88;
  }
LABEL_87:
  self->_mapSettingsPauseSpokenAudioEnabled = v4[699];
  *((_QWORD *)&self->_flags + 1) |= 0x8000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x10000) == 0)
  {
LABEL_47:
    if ((v13 & 0x20000) == 0)
      goto LABEL_48;
    goto LABEL_89;
  }
LABEL_88:
  self->_mapSettingsSpeedLimitEnabled = v4[700];
  *((_QWORD *)&self->_flags + 1) |= 0x10000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x20000) == 0)
  {
LABEL_48:
    if ((v13 & 0x1000) == 0)
      goto LABEL_49;
    goto LABEL_90;
  }
LABEL_89:
  self->_mapSettingsTrafficEnabled = v4[701];
  *((_QWORD *)&self->_flags + 1) |= 0x20000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x1000) == 0)
  {
LABEL_49:
    if ((v13 & 0x80000) == 0)
      goto LABEL_50;
    goto LABEL_91;
  }
LABEL_90:
  self->_mapSettingsIsHandsFreeProfileEnabled = v4[696];
  *((_QWORD *)&self->_flags + 1) |= 0x1000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x80000) == 0)
  {
LABEL_50:
    if ((v13 & 0x40000) == 0)
      goto LABEL_51;
    goto LABEL_92;
  }
LABEL_91:
  self->_mapSettingsWalkingAvoidHills = v4[703];
  *((_QWORD *)&self->_flags + 1) |= 0x80000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x40000) == 0)
  {
LABEL_51:
    if ((v13 & 0x100000) == 0)
      goto LABEL_52;
    goto LABEL_93;
  }
LABEL_92:
  self->_mapSettingsWalkingAvoidBusyRoads = v4[702];
  *((_QWORD *)&self->_flags + 1) |= 0x40000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x100000) == 0)
  {
LABEL_52:
    if ((v13 & 0x100) == 0)
      goto LABEL_53;
    goto LABEL_94;
  }
LABEL_93:
  self->_mapSettingsWalkingAvoidStairs = v4[704];
  *((_QWORD *)&self->_flags + 1) |= 0x100000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x100) == 0)
  {
LABEL_53:
    if ((v12 & 0x400000000) == 0)
      goto LABEL_54;
    goto LABEL_95;
  }
LABEL_94:
  self->_mapSettingsDirectionsWakeDevice = v4[692];
  *((_QWORD *)&self->_flags + 1) |= 0x100uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x400000000) == 0)
  {
LABEL_54:
    if ((v12 & 0x800000000) == 0)
      goto LABEL_55;
    goto LABEL_96;
  }
LABEL_95:
  self->_mapUiLayoutInfo = *((_DWORD *)v4 + 150);
  *(_QWORD *)&self->_flags |= 0x400000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x800000000) == 0)
  {
LABEL_55:
    if ((v12 & 0x2000000000) == 0)
      goto LABEL_56;
    goto LABEL_97;
  }
LABEL_96:
  self->_mapUiLayoutStyle = *((_DWORD *)v4 + 151);
  *(_QWORD *)&self->_flags |= 0x800000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x2000000000) == 0)
  {
LABEL_56:
    if ((v12 & 0x200000000) == 0)
      goto LABEL_57;
    goto LABEL_98;
  }
LABEL_97:
  self->_mapUiNumberOfTabsOpen = *((_DWORD *)v4 + 153);
  *(_QWORD *)&self->_flags |= 0x2000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x200000000) == 0)
  {
LABEL_57:
    if ((v12 & 0x1000000000) == 0)
      goto LABEL_58;
    goto LABEL_99;
  }
LABEL_98:
  self->_mapUiCurrentTabIndex = *((_DWORD *)v4 + 149);
  *(_QWORD *)&self->_flags |= 0x200000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x1000000000) == 0)
  {
LABEL_58:
    if ((v12 & 0x8000000000000) == 0)
      goto LABEL_59;
    goto LABEL_100;
  }
LABEL_99:
  self->_mapUiNumberOfMapsWindows = *((_DWORD *)v4 + 152);
  *(_QWORD *)&self->_flags |= 0x1000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v12 & 0x8000000000000) == 0)
  {
LABEL_59:
    if ((v13 & 0x200000) == 0)
      goto LABEL_60;
    goto LABEL_101;
  }
LABEL_100:
  self->_windowSize = *((_DWORD *)v4 + 167);
  *(_QWORD *)&self->_flags |= 0x8000000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  v13 = *(_QWORD *)(v4 + 732);
  if ((v13 & 0x200000) == 0)
  {
LABEL_60:
    if ((v13 & 0x400000) == 0)
      goto LABEL_61;
    goto LABEL_102;
  }
LABEL_101:
  self->_mapUiShownAqiShown = v4[705];
  *((_QWORD *)&self->_flags + 1) |= 0x200000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((*(_QWORD *)(v4 + 732) & 0x400000) == 0)
  {
LABEL_61:
    if ((v12 & 0x4000000000) == 0)
      goto LABEL_62;
    goto LABEL_103;
  }
LABEL_102:
  self->_mapUiShownWeatherShown = v4[706];
  *((_QWORD *)&self->_flags + 1) |= 0x400000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 0x4000000000) == 0)
  {
LABEL_62:
    if ((v12 & 4) == 0)
      goto LABEL_63;
    goto LABEL_104;
  }
LABEL_103:
  self->_mapUiShownActiveNavMode = *((_DWORD *)v4 + 154);
  *(_QWORD *)&self->_flags |= 0x4000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 4) == 0)
  {
LABEL_63:
    if ((v12 & 2) == 0)
      goto LABEL_64;
    goto LABEL_105;
  }
LABEL_104:
  self->_lookaroundSessionStartTime = *((double *)v4 + 18);
  *(_QWORD *)&self->_flags |= 4uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 2) == 0)
  {
LABEL_64:
    if ((v12 & 0x400000000000000) == 0)
      goto LABEL_65;
    goto LABEL_106;
  }
LABEL_105:
  self->_lookaroundSessionEndTime = *((double *)v4 + 17);
  *(_QWORD *)&self->_flags |= 2uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 0x400000000000000) == 0)
  {
LABEL_65:
    if ((v12 & 0x2000000000000000) == 0)
      goto LABEL_66;
    goto LABEL_107;
  }
LABEL_106:
  self->_lookaroundSessionHadPanAction = v4[678];
  *(_QWORD *)&self->_flags |= 0x400000000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 0x2000000000000000) == 0)
  {
LABEL_66:
    if ((v12 & 0x200000000000000) == 0)
      goto LABEL_67;
    goto LABEL_108;
  }
LABEL_107:
  self->_lookaroundSessionHadZoomAction = v4[681];
  *(_QWORD *)&self->_flags |= 0x2000000000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 0x200000000000000) == 0)
  {
LABEL_67:
    if ((v12 & 0x1000000000000000) == 0)
      goto LABEL_68;
    goto LABEL_109;
  }
LABEL_108:
  self->_lookaroundSessionHadMoveAction = v4[677];
  *(_QWORD *)&self->_flags |= 0x200000000000000uLL;
  v12 = *(_QWORD *)(v4 + 724);
  if ((v12 & 0x1000000000000000) == 0)
  {
LABEL_68:
    if ((v12 & 0x800000000000000) == 0)
      goto LABEL_70;
    goto LABEL_69;
  }
LABEL_109:
  self->_lookaroundSessionHadTapPoiAction = v4[680];
  *(_QWORD *)&self->_flags |= 0x1000000000000000uLL;
  if ((*(_QWORD *)(v4 + 724) & 0x800000000000000) != 0)
  {
LABEL_69:
    self->_lookaroundSessionHadShareAction = v4[679];
    *(_QWORD *)&self->_flags |= 0x800000000000000uLL;
  }
LABEL_70:
  lookAroundLocation = self->_lookAroundLocation;
  v15 = *((_QWORD *)v4 + 15);
  if (lookAroundLocation)
  {
    if (v15)
      -[GEOLocation mergeFrom:](lookAroundLocation, "mergeFrom:");
  }
  else if (v15)
  {
    -[GEOAnalyticsPipelineStateData setLookAroundLocation:](self, "setLookAroundLocation:");
  }
  v16 = (uint64_t *)(v4 + 724);
  v17 = *(_QWORD *)(v4 + 724);
  if ((v17 & 0x2000) != 0)
  {
    self->_lookAroundHeading = *((_DWORD *)v4 + 129);
    *(_QWORD *)&self->_flags |= 0x2000uLL;
    v17 = *v16;
    v18 = *(_QWORD *)(v4 + 732);
    if ((*v16 & 1) == 0)
      goto LABEL_118;
    goto LABEL_117;
  }
  v18 = *(_QWORD *)(v4 + 732);
  if ((v17 & 1) != 0)
  {
LABEL_117:
    self->_lookAroundZoom = *((double *)v4 + 16);
    *(_QWORD *)&self->_flags |= 1uLL;
    v17 = *(_QWORD *)(v4 + 724);
    v18 = *(_QWORD *)(v4 + 732);
  }
LABEL_118:
  if ((v17 & 0x4000) != 0)
  {
    self->_lookAroundNumberPoisInView = *((_DWORD *)v4 + 130);
    *(_QWORD *)&self->_flags |= 0x4000uLL;
    v17 = *(_QWORD *)(v4 + 724);
    v18 = *(_QWORD *)(v4 + 732);
    if ((v17 & 0x100000000000000) == 0)
    {
LABEL_120:
      if ((v17 & 0x80000000000000) == 0)
        goto LABEL_121;
      goto LABEL_129;
    }
  }
  else if ((v17 & 0x100000000000000) == 0)
  {
    goto LABEL_120;
  }
  self->_lookAroundIsLabelingShown = v4[676];
  *(_QWORD *)&self->_flags |= 0x100000000000000uLL;
  v17 = *(_QWORD *)(v4 + 724);
  v18 = *(_QWORD *)(v4 + 732);
  if ((v17 & 0x80000000000000) == 0)
  {
LABEL_121:
    if ((v17 & 0x10000000000000) == 0)
      goto LABEL_122;
    goto LABEL_130;
  }
LABEL_129:
  self->_lookAroundEntryIconShown = v4[675];
  *(_QWORD *)&self->_flags |= 0x80000000000000uLL;
  v18 = *(_QWORD *)(v4 + 732);
  if ((*(_QWORD *)(v4 + 724) & 0x10000000000000) == 0)
  {
LABEL_122:
    if ((v18 & 0x1000000000) == 0)
      goto LABEL_124;
    goto LABEL_123;
  }
LABEL_130:
  self->_deviceInDarkMode = v4[672];
  *(_QWORD *)&self->_flags |= 0x10000000000000uLL;
  if ((*(_QWORD *)(v4 + 732) & 0x1000000000) != 0)
  {
LABEL_123:
    self->_venueExperienceShown = v4[720];
    *((_QWORD *)&self->_flags + 1) |= 0x1000000000uLL;
  }
LABEL_124:
  placeCardState = self->_placeCardState;
  v20 = *((_QWORD *)v4 + 51);
  if (placeCardState)
  {
    if (v20)
      -[GEOLogMsgStatePlaceCard mergeFrom:](placeCardState, "mergeFrom:");
  }
  else if (v20)
  {
    -[GEOAnalyticsPipelineStateData setPlaceCardState:](self, "setPlaceCardState:");
  }
  v21 = objc_msgSend(v4, "placeCardPossibleActionsCount");
  if (v21)
  {
    v22 = v21;
    for (i = 0; i != v22; ++i)
      -[GEOAnalyticsPipelineStateData addPlaceCardPossibleActions:](self, "addPlaceCardPossibleActions:", objc_msgSend(v4, "placeCardPossibleActionsAtIndex:", i));
  }
  v24 = objc_msgSend(v4, "placeCardUnactionableUiElementsCount");
  if (v24)
  {
    v25 = v24;
    for (j = 0; j != v25; ++j)
      -[GEOAnalyticsPipelineStateData addPlaceCardUnactionableUiElements:](self, "addPlaceCardUnactionableUiElements:", objc_msgSend(v4, "placeCardUnactionableUiElementsAtIndex:", j));
  }
  if (*((_QWORD *)v4 + 49))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceCardCategory:](self, "setPlaceCardPlaceCardCategory:");
  if ((*(_QWORD *)(v4 + 724) & 0x100000000000) != 0)
  {
    self->_placeCardPlaceCardType = *((_DWORD *)v4 + 160);
    *(_QWORD *)&self->_flags |= 0x100000000000uLL;
  }
  if ((*(_QWORD *)(v4 + 732) & 0x40000000) != 0)
  {
    self->_placeCardTransitAdvisoryBanner = v4[714];
    *((_QWORD *)&self->_flags + 1) |= 0x40000000uLL;
  }
  if (*((_QWORD *)v4 + 34))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsActionUrl:](self, "setPlaceCardPlaceActionDetailsActionUrl:");
  v27 = *(_QWORD *)(v4 + 724);
  if ((v27 & 0x80) != 0)
  {
    self->_placeCardPlaceActionDetailsAnimationId = *((_QWORD *)v4 + 35);
    *(_QWORD *)&self->_flags |= 0x80uLL;
    v27 = *(_QWORD *)(v4 + 724);
  }
  if ((v27 & 0x100) != 0)
  {
    self->_placeCardPlaceActionDetailsBusinessId = *((_QWORD *)v4 + 36);
    *(_QWORD *)&self->_flags |= 0x100uLL;
  }
  if (*((_QWORD *)v4 + 37))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsDestinationApp:](self, "setPlaceCardPlaceActionDetailsDestinationApp:");
  if (*((_QWORD *)v4 + 38))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsPhotoId:](self, "setPlaceCardPlaceActionDetailsPhotoId:");
  if ((*(_QWORD *)(v4 + 724) & 0x200) != 0)
  {
    self->_placeCardPlaceActionDetailsPlaceId = *((_QWORD *)v4 + 39);
    *(_QWORD *)&self->_flags |= 0x200uLL;
  }
  if (*((_QWORD *)v4 + 40))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsRichProviderId:](self, "setPlaceCardPlaceActionDetailsRichProviderId:");
  v28 = (uint64_t *)(v4 + 724);
  v29 = *(_QWORD *)(v4 + 724);
  if ((v29 & 0x400) != 0)
  {
    self->_placeCardPlaceActionDetailsSearchResponseRelativeTimestamp = *((double *)v4 + 41);
    *(_QWORD *)&self->_flags |= 0x400uLL;
    v29 = *v28;
    if ((*v28 & 0x800) == 0)
    {
LABEL_162:
      if ((v29 & 0x20000000000) == 0)
        goto LABEL_163;
      goto LABEL_204;
    }
  }
  else if ((v29 & 0x800) == 0)
  {
    goto LABEL_162;
  }
  self->_placeCardPlaceActionDetailsTargetId = *((_QWORD *)v4 + 43);
  *(_QWORD *)&self->_flags |= 0x800uLL;
  v29 = *(_QWORD *)(v4 + 724);
  if ((v29 & 0x20000000000) == 0)
  {
LABEL_163:
    if ((v29 & 0x40000000000) == 0)
      goto LABEL_165;
    goto LABEL_164;
  }
LABEL_204:
  self->_placeCardPlaceActionDetailsLocalSearchProviderId = *((_DWORD *)v4 + 157);
  *(_QWORD *)&self->_flags |= 0x20000000000uLL;
  if ((*(_QWORD *)(v4 + 724) & 0x40000000000) != 0)
  {
LABEL_164:
    self->_placeCardPlaceActionDetailsResultIndex = *((_DWORD *)v4 + 158);
    *(_QWORD *)&self->_flags |= 0x40000000000uLL;
  }
LABEL_165:
  if (*((_QWORD *)v4 + 42))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsShowcaseId:](self, "setPlaceCardPlaceActionDetailsShowcaseId:");
  if (*((_QWORD *)v4 + 44))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardIncidentType:");
  if (*((_QWORD *)v4 + 48))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitSystemName:");
  if ((*(_QWORD *)(v4 + 724) & 0x80000000000) != 0)
  {
    self->_placeCardPlaceActionDetailsTransitPlaceCardTransitCategory = *((_DWORD *)v4 + 159);
    *(_QWORD *)&self->_flags |= 0x80000000000uLL;
  }
  if (*((_QWORD *)v4 + 45))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection:");
  if (*((_QWORD *)v4 + 46))
    -[GEOAnalyticsPipelineStateData setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:](self, "setPlaceCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign:");
  if ((*(_QWORD *)(v4 + 724) & 0x1000) != 0)
  {
    self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageLineId = *((_QWORD *)v4 + 47);
    *(_QWORD *)&self->_flags |= 0x1000uLL;
  }
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v30 = *((id *)v4 + 50);
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v94;
    do
    {
      for (k = 0; k != v32; ++k)
      {
        if (*(_QWORD *)v94 != v33)
          objc_enumerationMutation(v30);
        -[GEOAnalyticsPipelineStateData addPlaceCardRevealedPlaceCardModule:](self, "addPlaceCardRevealedPlaceCardModule:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * k));
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v93, v99, 16);
    }
    while (v32);
  }

  v35 = *(_QWORD *)(v4 + 732);
  if ((v35 & 0x20000000) != 0)
  {
    self->_placeCardIsPersonPlacecard = v4[713];
    *((_QWORD *)&self->_flags + 1) |= 0x20000000uLL;
    v35 = *(_QWORD *)(v4 + 732);
    if ((v35 & 0x8000000) == 0)
    {
LABEL_188:
      if ((v35 & 0x10000000) == 0)
        goto LABEL_190;
      goto LABEL_189;
    }
  }
  else if ((v35 & 0x8000000) == 0)
  {
    goto LABEL_188;
  }
  self->_placeCardIsPersonAddressAvailable = v4[711];
  *((_QWORD *)&self->_flags + 1) |= 0x8000000uLL;
  if ((*(_QWORD *)(v4 + 732) & 0x10000000) != 0)
  {
LABEL_189:
    self->_placeCardIsPersonLocationShared = v4[712];
    *((_QWORD *)&self->_flags + 1) |= 0x10000000uLL;
  }
LABEL_190:
  if (*((_QWORD *)v4 + 30))
    -[GEOAnalyticsPipelineStateData setMapsServerMetadataSuggestionEntryTappedOn:](self, "setMapsServerMetadataSuggestionEntryTappedOn:");
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v36 = *((id *)v4 + 29);
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v90;
    do
    {
      for (m = 0; m != v38; ++m)
      {
        if (*(_QWORD *)v90 != v39)
          objc_enumerationMutation(v36);
        -[GEOAnalyticsPipelineStateData addMapsServerMetadataSuggestionEntryDisplayed:](self, "addMapsServerMetadataSuggestionEntryDisplayed:", *(_QWORD *)(*((_QWORD *)&v89 + 1) + 8 * m));
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v89, v98, 16);
    }
    while (v38);
  }

  mapsServerMetadata = self->_mapsServerMetadata;
  v42 = *((_QWORD *)v4 + 31);
  if (mapsServerMetadata)
  {
    if (v42)
      -[GEOMapsServerMetadata mergeFrom:](mapsServerMetadata, "mergeFrom:");
  }
  else if (v42)
  {
    -[GEOAnalyticsPipelineStateData setMapsServerMetadata:](self, "setMapsServerMetadata:");
  }
  routeRouteDetails = self->_routeRouteDetails;
  v44 = *((_QWORD *)v4 + 55);
  if (routeRouteDetails)
  {
    if (v44)
      -[GEORouteDetails mergeFrom:](routeRouteDetails, "mergeFrom:");
  }
  else if (v44)
  {
    -[GEOAnalyticsPipelineStateData setRouteRouteDetails:](self, "setRouteRouteDetails:");
  }
  predExTrainingData = self->_predExTrainingData;
  v46 = *((_QWORD *)v4 + 52);
  if (predExTrainingData)
  {
    if (v46)
      -[GEOLogMsgEventPredExTrainingData mergeFrom:](predExTrainingData, "mergeFrom:");
  }
  else if (v46)
  {
    -[GEOAnalyticsPipelineStateData setPredExTrainingData:](self, "setPredExTrainingData:");
  }
  v47 = (uint64_t *)(v4 + 724);
  v48 = *(_QWORD *)(v4 + 724);
  if ((v48 & 0x1000000000000) != 0)
  {
    self->_suggestionsAcSequenceNumber = *((_DWORD *)v4 + 164);
    *(_QWORD *)&self->_flags |= 0x1000000000000uLL;
    v48 = *v47;
    if ((*v47 & 0x2000000000000) == 0)
    {
LABEL_223:
      if ((v48 & 0x4000000000000) == 0)
        goto LABEL_225;
      goto LABEL_224;
    }
  }
  else if ((v48 & 0x2000000000000) == 0)
  {
    goto LABEL_223;
  }
  self->_suggestionsSearchFieldType = *((_DWORD *)v4 + 165);
  *(_QWORD *)&self->_flags |= 0x2000000000000uLL;
  if ((*(_QWORD *)(v4 + 724) & 0x4000000000000) != 0)
  {
LABEL_224:
    self->_suggestionsSelectedIndex = *((_DWORD *)v4 + 166);
    *(_QWORD *)&self->_flags |= 0x4000000000000uLL;
  }
LABEL_225:
  if (*((_QWORD *)v4 + 58))
    -[GEOAnalyticsPipelineStateData setSuggestionsSearchString:](self, "setSuggestionsSearchString:");
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v49 = *((id *)v4 + 57);
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v86;
    do
    {
      for (n = 0; n != v51; ++n)
      {
        if (*(_QWORD *)v86 != v52)
          objc_enumerationMutation(v49);
        -[GEOAnalyticsPipelineStateData addSuggestionsDisplayedResults:](self, "addSuggestionsDisplayedResults:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * n), (_QWORD)v85);
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v85, v97, 16);
    }
    while (v51);
  }

  v54 = (uint64_t *)(v4 + 724);
  v55 = *(_QWORD *)(v4 + 724);
  if ((v55 & 0x40000000000000) != 0)
  {
    self->_landscape = v4[674];
    *(_QWORD *)&self->_flags |= 0x40000000000000uLL;
    v55 = *v54;
    if ((*v54 & 0x200000000000) == 0)
    {
LABEL_236:
      if ((v55 & 0x400000000000) == 0)
        goto LABEL_237;
      goto LABEL_259;
    }
  }
  else if ((v55 & 0x200000000000) == 0)
  {
    goto LABEL_236;
  }
  self->_restoreLayoutInfo = *((_DWORD *)v4 + 161);
  *(_QWORD *)&self->_flags |= 0x200000000000uLL;
  v55 = *(_QWORD *)(v4 + 724);
  if ((v55 & 0x400000000000) == 0)
  {
LABEL_237:
    if ((v55 & 0x800000000000) == 0)
      goto LABEL_239;
    goto LABEL_238;
  }
LABEL_259:
  self->_restoreLayoutStyle = *((_DWORD *)v4 + 162);
  *(_QWORD *)&self->_flags |= 0x400000000000uLL;
  if ((*(_QWORD *)(v4 + 724) & 0x800000000000) != 0)
  {
LABEL_238:
    self->_restoreUiTarget = *((_DWORD *)v4 + 163);
    *(_QWORD *)&self->_flags |= 0x800000000000uLL;
  }
LABEL_239:
  if (*((_QWORD *)v4 + 21))
    -[GEOAnalyticsPipelineStateData setMapLaunchSourceAppId:](self, "setMapLaunchSourceAppId:");
  if (*((_QWORD *)v4 + 19))
    -[GEOAnalyticsPipelineStateData setMapLaunchLaunchUri:](self, "setMapLaunchLaunchUri:");
  if (*((_QWORD *)v4 + 20))
    -[GEOAnalyticsPipelineStateData setMapLaunchReferringWebsite:](self, "setMapLaunchReferringWebsite:");
  if ((*(_QWORD *)(v4 + 732) & 4) != 0)
  {
    self->_mapLaunchIsHandoff = v4[686];
    *((_QWORD *)&self->_flags + 1) |= 4uLL;
  }
  if (*((_QWORD *)v4 + 22))
    -[GEOAnalyticsPipelineStateData setMapLaunchSourceHandoffDevice:](self, "setMapLaunchSourceHandoffDevice:");
  if ((*(_QWORD *)(v4 + 724) & 0x4000000) != 0)
  {
    self->_mapLaunchAction = *((_DWORD *)v4 + 142);
    *(_QWORD *)&self->_flags |= 0x4000000uLL;
  }
  curatedCollectionState = self->_curatedCollectionState;
  v57 = *((_QWORD *)v4 + 11);
  if (curatedCollectionState)
  {
    if (v57)
      -[GEOLogMsgStateCuratedCollection mergeFrom:](curatedCollectionState, "mergeFrom:");
  }
  else if (v57)
  {
    -[GEOAnalyticsPipelineStateData setCuratedCollectionState:](self, "setCuratedCollectionState:");
  }
  v58 = *(_QWORD *)(v4 + 732);
  if ((v58 & 0x20) != 0)
  {
    self->_mapSettingsAvoidHills = v4[689];
    *((_QWORD *)&self->_flags + 1) |= 0x20uLL;
    v58 = *(_QWORD *)(v4 + 732);
  }
  v59 = *(_QWORD *)(v4 + 724);
  if ((v58 & 0x40) != 0)
  {
    self->_mapSettingsAvoidStairs = v4[690];
    *((_QWORD *)&self->_flags + 1) |= 0x40uLL;
    v59 = *(_QWORD *)(v4 + 724);
    v58 = *(_QWORD *)(v4 + 732);
    if ((v58 & 8) == 0)
    {
LABEL_267:
      if ((v59 & 0x20000000) == 0)
        goto LABEL_268;
      goto LABEL_275;
    }
  }
  else if ((v58 & 8) == 0)
  {
    goto LABEL_267;
  }
  self->_mapSettingsAvoidBusyRoads = v4[687];
  *((_QWORD *)&self->_flags + 1) |= 8uLL;
  v58 = *(_QWORD *)(v4 + 732);
  if ((*(_QWORD *)(v4 + 724) & 0x20000000) == 0)
  {
LABEL_268:
    if ((v58 & 0x200) == 0)
      goto LABEL_270;
    goto LABEL_269;
  }
LABEL_275:
  self->_mapSettingsLocationPrecisionType = *((_DWORD *)v4 + 145);
  *(_QWORD *)&self->_flags |= 0x20000000uLL;
  if ((*(_QWORD *)(v4 + 732) & 0x200) != 0)
  {
LABEL_269:
    self->_mapSettingsEBike = v4[693];
    *((_QWORD *)&self->_flags + 1) |= 0x200uLL;
  }
LABEL_270:
  ugcPhotoState = self->_ugcPhotoState;
  v61 = *((_QWORD *)v4 + 60);
  if (ugcPhotoState)
  {
    if (v61)
      -[GEOLogMsgStateUGCPhoto mergeFrom:](ugcPhotoState, "mergeFrom:");
  }
  else if (v61)
  {
    -[GEOAnalyticsPipelineStateData setUgcPhotoState:](self, "setUgcPhotoState:");
  }
  if (*((_QWORD *)v4 + 32))
    -[GEOAnalyticsPipelineStateData setMetroRegion:](self, "setMetroRegion:");
  if (*((_QWORD *)v4 + 62))
    -[GEOAnalyticsPipelineStateData setUserHomeMetro:](self, "setUserHomeMetro:");
  if (*((_QWORD *)v4 + 61))
    -[GEOAnalyticsPipelineStateData setUserHomeCountry:](self, "setUserHomeCountry:");
  v62 = (uint64_t *)(v4 + 724);
  v63 = *(_QWORD *)(v4 + 724);
  if ((v63 & 0x10000000) != 0)
  {
    self->_mapSettingsDrivingVoiceSettings = *((_DWORD *)v4 + 144);
    *(_QWORD *)&self->_flags |= 0x10000000uLL;
    v63 = *v62;
    if ((*v62 & 0x100000000) == 0)
    {
LABEL_287:
      if ((v63 & 0x8000000) == 0)
        goto LABEL_289;
      goto LABEL_288;
    }
  }
  else if ((v63 & 0x100000000) == 0)
  {
    goto LABEL_287;
  }
  self->_mapSettingsWalkingVoiceSettings = *((_DWORD *)v4 + 148);
  *(_QWORD *)&self->_flags |= 0x100000000uLL;
  if ((*(_QWORD *)(v4 + 724) & 0x8000000) != 0)
  {
LABEL_288:
    self->_mapSettingsCyclingVoiceSettings = *((_DWORD *)v4 + 143);
    *(_QWORD *)&self->_flags |= 0x8000000uLL;
  }
LABEL_289:
  account = self->_account;
  v65 = *((_QWORD *)v4 + 8);
  if (account)
  {
    if (v65)
      -[GEOLogMsgStateAccount mergeFrom:](account, "mergeFrom:");
  }
  else if (v65)
  {
    -[GEOAnalyticsPipelineStateData setAccount:](self, "setAccount:");
  }
  v66 = (uint64_t *)(v4 + 724);
  v67 = *(_QWORD *)(v4 + 724);
  if ((v67 & 0x400000) != 0)
  {
    self->_mapFeaturePersonalCollectionsCount = *((_DWORD *)v4 + 138);
    *(_QWORD *)&self->_flags |= 0x400000uLL;
    v67 = *v66;
    v68 = *(_QWORD *)(v4 + 732);
    if ((*v66 & 0x800000) == 0)
      goto LABEL_302;
    goto LABEL_301;
  }
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x800000) != 0)
  {
LABEL_301:
    self->_mapFeatureSavedCollectionsCount = *((_DWORD *)v4 + 139);
    *(_QWORD *)&self->_flags |= 0x800000uLL;
    v67 = *(_QWORD *)(v4 + 724);
    v68 = *(_QWORD *)(v4 + 732);
  }
LABEL_302:
  if ((v67 & 0x2000000) != 0)
  {
    self->_mapFeatureSubmittedRatingsCount = *((_DWORD *)v4 + 141);
    *(_QWORD *)&self->_flags |= 0x2000000uLL;
    v67 = *(_QWORD *)(v4 + 724);
    v68 = *(_QWORD *)(v4 + 732);
    if ((v67 & 0x1000000) == 0)
    {
LABEL_304:
      if ((v67 & 0x8000) == 0)
        goto LABEL_305;
      goto LABEL_323;
    }
  }
  else if ((v67 & 0x1000000) == 0)
  {
    goto LABEL_304;
  }
  self->_mapFeatureSubmittedPhotosCount = *((_DWORD *)v4 + 140);
  *(_QWORD *)&self->_flags |= 0x1000000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x8000) == 0)
  {
LABEL_305:
    if ((v67 & 0x200000) == 0)
      goto LABEL_306;
    goto LABEL_324;
  }
LABEL_323:
  self->_mapFeatureElectronicVehicleCount = *((_DWORD *)v4 + 131);
  *(_QWORD *)&self->_flags |= 0x8000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x200000) == 0)
  {
LABEL_306:
    if ((v68 & 0x200000000) == 0)
      goto LABEL_307;
    goto LABEL_325;
  }
LABEL_324:
  self->_mapFeatureLicensePlateCount = *((_DWORD *)v4 + 137);
  *(_QWORD *)&self->_flags |= 0x200000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v68 & 0x200000000) == 0)
  {
LABEL_307:
    if ((v67 & 0x4000000000000000) == 0)
      goto LABEL_308;
    goto LABEL_326;
  }
LABEL_325:
  self->_suggestionsSiriEnabled = v4[717];
  *((_QWORD *)&self->_flags + 1) |= 0x200000000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x4000000000000000) == 0)
  {
LABEL_308:
    if ((v68 & 2) == 0)
      goto LABEL_309;
    goto LABEL_327;
  }
LABEL_326:
  self->_mapFeatureIsHomeFavoriteSet = v4[682];
  *(_QWORD *)&self->_flags |= 0x4000000000000000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v68 & 2) == 0)
  {
LABEL_309:
    if ((v67 & 0x8000000000000000) == 0)
      goto LABEL_310;
    goto LABEL_328;
  }
LABEL_327:
  self->_mapFeatureIsWorkFavoriteSet = v4[685];
  *((_QWORD *)&self->_flags + 1) |= 2uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x8000000000000000) == 0)
  {
LABEL_310:
    if ((v68 & 1) == 0)
      goto LABEL_311;
    goto LABEL_329;
  }
LABEL_328:
  self->_mapFeatureIsSchoolFavoriteSet = v4[683];
  *(_QWORD *)&self->_flags |= 0x8000000000000000;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v68 & 1) == 0)
  {
LABEL_311:
    if ((v67 & 0x10000) == 0)
      goto LABEL_312;
    goto LABEL_330;
  }
LABEL_329:
  self->_mapFeatureIsTransitFavoriteSet = v4[684];
  *((_QWORD *)&self->_flags + 1) |= 1uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x10000) == 0)
  {
LABEL_312:
    if ((v67 & 0x100000) == 0)
      goto LABEL_313;
    goto LABEL_331;
  }
LABEL_330:
  self->_mapFeatureFavoritesCount = *((_DWORD *)v4 + 132);
  *(_QWORD *)&self->_flags |= 0x10000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x100000) == 0)
  {
LABEL_313:
    if ((v67 & 0x80000) == 0)
      goto LABEL_314;
    goto LABEL_332;
  }
LABEL_331:
  self->_mapFeatureLibrarySavedPlacesCount = *((_DWORD *)v4 + 136);
  *(_QWORD *)&self->_flags |= 0x100000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x80000) == 0)
  {
LABEL_314:
    if ((v67 & 0x40000) == 0)
      goto LABEL_315;
    goto LABEL_333;
  }
LABEL_332:
  self->_mapFeatureLibraryPlacesWithNoteCount = *((_DWORD *)v4 + 135);
  *(_QWORD *)&self->_flags |= 0x80000uLL;
  v67 = *(_QWORD *)(v4 + 724);
  v68 = *(_QWORD *)(v4 + 732);
  if ((v67 & 0x40000) == 0)
  {
LABEL_315:
    if ((v67 & 0x20000) == 0)
      goto LABEL_316;
    goto LABEL_334;
  }
LABEL_333:
  self->_mapFeatureLibraryGuidesSavedPlacesCount = *((_DWORD *)v4 + 134);
  *(_QWORD *)&self->_flags |= 0x40000uLL;
  v68 = *(_QWORD *)(v4 + 732);
  if ((*(_QWORD *)(v4 + 724) & 0x20000) == 0)
  {
LABEL_316:
    if ((v68 & 0x4000) == 0)
      goto LABEL_318;
    goto LABEL_317;
  }
LABEL_334:
  self->_mapFeatureLibraryFavoritesGuideSavedPlacesCount = *((_DWORD *)v4 + 133);
  *(_QWORD *)&self->_flags |= 0x20000uLL;
  if ((*(_QWORD *)(v4 + 732) & 0x4000) != 0)
  {
LABEL_317:
    self->_mapSettingsNotificationsEnabled = v4[698];
    *((_QWORD *)&self->_flags + 1) |= 0x4000uLL;
  }
LABEL_318:
  searchResultsState = self->_searchResultsState;
  v70 = *((_QWORD *)v4 + 56);
  if (searchResultsState)
  {
    if (v70)
      -[GEOLogMsgStateSearchResults mergeFrom:](searchResultsState, "mergeFrom:");
  }
  else if (v70)
  {
    -[GEOAnalyticsPipelineStateData setSearchResultsState:](self, "setSearchResultsState:");
  }
  impressionObjectState = self->_impressionObjectState;
  v72 = *((_QWORD *)v4 + 14);
  if (impressionObjectState)
  {
    if (v72)
      -[GEOLogMsgStateImpressionObject mergeFrom:](impressionObjectState, "mergeFrom:");
  }
  else if (v72)
  {
    -[GEOAnalyticsPipelineStateData setImpressionObjectState:](self, "setImpressionObjectState:");
  }
  tapEventState = self->_tapEventState;
  v74 = *((_QWORD *)v4 + 59);
  if (tapEventState)
  {
    if (v74)
      -[GEOLogMsgStateTapEvent mergeFrom:](tapEventState, "mergeFrom:");
  }
  else if (v74)
  {
    -[GEOAnalyticsPipelineStateData setTapEventState:](self, "setTapEventState:");
  }
  actionButtonDetailsState = self->_actionButtonDetailsState;
  v76 = *((_QWORD *)v4 + 9);
  if (actionButtonDetailsState)
  {
    if (v76)
      -[GEOLogMsgStateActionButtonDetails mergeFrom:](actionButtonDetailsState, "mergeFrom:");
  }
  else if (v76)
  {
    -[GEOAnalyticsPipelineStateData setActionButtonDetailsState:](self, "setActionButtonDetailsState:");
  }
  photoSubmissionDetailsState = self->_photoSubmissionDetailsState;
  v78 = *((_QWORD *)v4 + 33);
  if (photoSubmissionDetailsState)
  {
    if (v78)
      -[GEOLogMsgStateARPPhotoSubmission mergeFrom:](photoSubmissionDetailsState, "mergeFrom:");
  }
  else if (v78)
  {
    -[GEOAnalyticsPipelineStateData setPhotoSubmissionDetailsState:](self, "setPhotoSubmissionDetailsState:");
  }
  ratingSubmissionDetailsState = self->_ratingSubmissionDetailsState;
  v80 = *((_QWORD *)v4 + 54);
  if (ratingSubmissionDetailsState)
  {
    if (v80)
      -[GEOLogMsgStateARPRatingSubmission mergeFrom:](ratingSubmissionDetailsState, "mergeFrom:");
  }
  else if (v80)
  {
    -[GEOAnalyticsPipelineStateData setRatingSubmissionDetailsState:](self, "setRatingSubmissionDetailsState:");
  }
  ratingPhotoSubmissionDetailsState = self->_ratingPhotoSubmissionDetailsState;
  v82 = *((_QWORD *)v4 + 53);
  if (ratingPhotoSubmissionDetailsState)
  {
    if (v82)
      -[GEOLogMsgStateARPRatingPhotoSubmission mergeFrom:](ratingPhotoSubmissionDetailsState, "mergeFrom:");
  }
  else if (v82)
  {
    -[GEOAnalyticsPipelineStateData setRatingPhotoSubmissionDetailsState:](self, "setRatingPhotoSubmissionDetailsState:");
  }
  mapsPlaceIdsState = self->_mapsPlaceIdsState;
  v84 = *((_QWORD *)v4 + 28);
  if (mapsPlaceIdsState)
  {
    if (v84)
      -[GEOLogMsgStateMapsPlaceIds mergeFrom:](mapsPlaceIdsState, "mergeFrom:");
  }
  else if (v84)
  {
    -[GEOAnalyticsPipelineStateData setMapsPlaceIdsState:](self, "setMapsPlaceIdsState:");
  }
  if ((*(_QWORD *)(v4 + 724) & 0x20000000000000) != 0)
  {
    self->_isInternalTool = v4[673];
    *(_QWORD *)&self->_flags |= 0x20000000000000uLL;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userHomeMetro, 0);
  objc_storeStrong((id *)&self->_userHomeCountry, 0);
  objc_storeStrong((id *)&self->_ugcPhotoState, 0);
  objc_storeStrong((id *)&self->_tapEventState, 0);
  objc_storeStrong((id *)&self->_suggestionsSearchString, 0);
  objc_storeStrong((id *)&self->_suggestionsDisplayedResults, 0);
  objc_storeStrong((id *)&self->_searchResultsState, 0);
  objc_storeStrong((id *)&self->_routeRouteDetails, 0);
  objc_storeStrong((id *)&self->_ratingSubmissionDetailsState, 0);
  objc_storeStrong((id *)&self->_ratingPhotoSubmissionDetailsState, 0);
  objc_storeStrong((id *)&self->_predExTrainingData, 0);
  objc_storeStrong((id *)&self->_placeCardState, 0);
  objc_storeStrong((id *)&self->_placeCardRevealedPlaceCardModules, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceCardCategory, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardTransitSystemName, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageHeadsign, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardTransitDepartureSequenceUsageDirection, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsTransitPlaceCardIncidentType, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsShowcaseId, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsRichProviderId, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsPhotoId, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsDestinationApp, 0);
  objc_storeStrong((id *)&self->_placeCardPlaceActionDetailsActionUrl, 0);
  objc_storeStrong((id *)&self->_photoSubmissionDetailsState, 0);
  objc_storeStrong((id *)&self->_metroRegion, 0);
  objc_storeStrong((id *)&self->_mapsServerMetadata, 0);
  objc_storeStrong((id *)&self->_mapsServerMetadataSuggestionEntryTappedOn, 0);
  objc_storeStrong((id *)&self->_mapsServerMetadataSuggestionEntryDisplayeds, 0);
  objc_storeStrong((id *)&self->_mapsPlaceIdsState, 0);
  objc_storeStrong((id *)&self->_mapViewMapRegion, 0);
  objc_storeStrong((id *)&self->_mapLaunchSourceHandoffDevice, 0);
  objc_storeStrong((id *)&self->_mapLaunchSourceAppId, 0);
  objc_storeStrong((id *)&self->_mapLaunchReferringWebsite, 0);
  objc_storeStrong((id *)&self->_mapLaunchLaunchUri, 0);
  objc_storeStrong((id *)&self->_lookAroundLocation, 0);
  objc_storeStrong((id *)&self->_impressionObjectState, 0);
  objc_storeStrong((id *)&self->_deviceOutputLocale, 0);
  objc_storeStrong((id *)&self->_deviceInputLocale, 0);
  objc_storeStrong((id *)&self->_curatedCollectionState, 0);
  objc_storeStrong((id *)&self->_carPlayInfo, 0);
  objc_storeStrong((id *)&self->_actionButtonDetailsState, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
