@implementation GEOCoarseLocationTerritoryInfo

- (GEOCoarseLocationTerritoryInfo)init
{
  GEOCoarseLocationTerritoryInfo *v2;
  GEOCoarseLocationTerritoryInfo *v3;
  GEOCoarseLocationTerritoryInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  v2 = -[GEOCoarseLocationTerritoryInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (BOOL)shouldRandomize
{
  return self->_shouldRandomize;
}

- (GEOCoarseLocationLatLng)representativePoint
{
  double lat;
  double lng;
  GEOCoarseLocationLatLng result;

  lat = self->_representativePoint._lat;
  lng = self->_representativePoint._lng;
  result._lng = lng;
  result._lat = lat;
  return result;
}

- (double)maxDistanceMeters
{
  return self->_maxDistanceMeters;
}

- (BOOL)hasPolygon
{
  -[GEOCoarseLocationTerritoryInfo _readPolygon]((uint64_t)self);
  return self->_polygon != 0;
}

- (GEOCoarseLocationPolygon)polygon
{
  -[GEOCoarseLocationTerritoryInfo _readPolygon]((uint64_t)self);
  return self->_polygon;
}

- (void)_readPolygon
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 149) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPolygon_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  -[GEOCoarseLocationTerritoryInfo dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionNameStr, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_countryNameStr, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (GEOCoarseLocationTerritoryInfo)initWithData:(id)a3
{
  GEOCoarseLocationTerritoryInfo *v3;
  GEOCoarseLocationTerritoryInfo *v4;
  GEOCoarseLocationTerritoryInfo *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  v3 = -[GEOCoarseLocationTerritoryInfo initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)territoryType
{
  os_unfair_lock_s *p_readerLock;
  $76592BEDE77795F2213850FEF5437C34 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_WORD *)&flags & 0x200) != 0)
    return self->_territoryType;
  else
    return 0;
}

- (void)setTerritoryType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  self->_territoryType = a3;
}

- (void)setHasTerritoryType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 66048;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFDFF | v3);
}

- (BOOL)hasTerritoryType
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 1) & 1;
}

- (id)territoryTypeAsString:(int)a3
{
  if (a3 < 9)
    return off_1E1BFFE48[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsTerritoryType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TERRITORY")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STATISTICAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DISPUTED_AREA")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unsigned)regionName
{
  return self->_regionName;
}

- (void)setRegionName:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10040u;
  self->_regionName = a3;
}

- (void)setHasRegionName:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65600;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFBF | v3);
}

- (BOOL)hasRegionName
{
  return (*(_BYTE *)&self->_flags >> 6) & 1;
}

- (unsigned)countryName
{
  return self->_countryName;
}

- (void)setCountryName:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10020u;
  self->_countryName = a3;
}

- (void)setHasCountryName:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65568;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFDF | v3);
}

- (BOOL)hasCountryName
{
  return (*(_BYTE *)&self->_flags >> 5) & 1;
}

- (void)_readCoordinates
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 149) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCoordinates_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (unint64_t)coordinatesCount
{
  -[GEOCoarseLocationTerritoryInfo _readCoordinates]((uint64_t)self);
  return self->_coordinates.count;
}

- (unsigned)coordinates
{
  -[GEOCoarseLocationTerritoryInfo _readCoordinates]((uint64_t)self);
  return self->_coordinates.list;
}

- (void)clearCoordinates
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedUInt32Clear();
}

- (void)addCoordinates:(unsigned int)a3
{
  -[GEOCoarseLocationTerritoryInfo _readCoordinates]((uint64_t)self);
  if (self)
    PBRepeatedUInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (unsigned)coordinatesAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_coordinates;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOCoarseLocationTerritoryInfo _readCoordinates]((uint64_t)self);
  p_coordinates = &self->_coordinates;
  count = self->_coordinates.count;
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
  return p_coordinates->list[a3];
}

- (void)setCoordinates:(unsigned int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x1000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedUInt32Set();
}

- (BOOL)precise
{
  return self->_precise;
}

- (void)setPrecise:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  self->_precise = a3;
}

- (void)setHasPrecise:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 66560;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFBFF | v3);
}

- (BOOL)hasPrecise
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 2) & 1;
}

- (unint64_t)featureId
{
  return self->_featureId;
}

- (void)setFeatureId:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_featureId = a3;
}

- (void)setHasFeatureId:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasFeatureId
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (void)setRepresentativePoint:(GEOCoarseLocationLatLng)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_representativePoint = a3;
}

- (void)setHasRepresentativePoint:(BOOL)a3
{
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasRepresentativePoint
{
  return *(_DWORD *)&self->_flags & 1;
}

- (double)areaDegrees
{
  return self->_areaDegrees;
}

- (void)setAreaDegrees:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_areaDegrees = a3;
}

- (void)setHasAreaDegrees:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasAreaDegrees
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (unsigned)revgeoRank
{
  return self->_revgeoRank;
}

- (void)setRevgeoRank:(unsigned int)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  self->_revgeoRank = a3;
}

- (void)setHasRevgeoRank:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65792;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFEFF | v3);
}

- (BOOL)hasRevgeoRank
{
  return *((_BYTE *)&self->_flags + 1) & 1;
}

- (double)areaRatio
{
  return self->_areaRatio;
}

- (void)setAreaRatio:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_areaRatio = a3;
}

- (void)setHasAreaRatio:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasAreaRatio
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)setMaxDistanceMeters:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_maxDistanceMeters = a3;
}

- (void)setHasMaxDistanceMeters:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasMaxDistanceMeters
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readRegionNameStr
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 149) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRegionNameStr_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasRegionNameStr
{
  -[GEOCoarseLocationTerritoryInfo _readRegionNameStr]((uint64_t)self);
  return self->_regionNameStr != 0;
}

- (NSString)regionNameStr
{
  -[GEOCoarseLocationTerritoryInfo _readRegionNameStr]((uint64_t)self);
  return self->_regionNameStr;
}

- (void)setRegionNameStr:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x18000u;
  objc_storeStrong((id *)&self->_regionNameStr, a3);
}

- (void)_readCountryNameStr
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_BYTE *)(a1 + 149) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOCoarseLocationTerritoryInfoReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCountryNameStr_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (BOOL)hasCountryNameStr
{
  -[GEOCoarseLocationTerritoryInfo _readCountryNameStr]((uint64_t)self);
  return self->_countryNameStr != 0;
}

- (NSString)countryNameStr
{
  -[GEOCoarseLocationTerritoryInfo _readCountryNameStr]((uint64_t)self);
  return self->_countryNameStr;
}

- (void)setCountryNameStr:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_countryNameStr, a3);
}

- (void)setPolygon:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_polygon, a3);
}

- (int)representativePointQuality
{
  os_unfair_lock_s *p_readerLock;
  $76592BEDE77795F2213850FEF5437C34 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 0x80) != 0)
    return self->_representativePointQuality;
  else
    return 0;
}

- (void)setRepresentativePointQuality:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10080u;
  self->_representativePointQuality = a3;
}

- (void)setHasRepresentativePointQuality:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65664;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFFF7F | v3);
}

- (BOOL)hasRepresentativePointQuality
{
  return *(_BYTE *)&self->_flags >> 7;
}

- (id)representativePointQualityAsString:(int)a3
{
  if (a3 < 5)
    return off_1E1BFFE90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRepresentativePointQuality:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXCELLENT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAIR")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POOR")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setShouldRandomize:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  self->_shouldRandomize = a3;
}

- (void)setHasShouldRandomize:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 67584;
  else
    v3 = 0x10000;
  self->_flags = ($76592BEDE77795F2213850FEF5437C34)(*(_DWORD *)&self->_flags & 0xFFFFF7FF | v3);
}

- (BOOL)hasShouldRandomize
{
  return (*((unsigned __int8 *)&self->_flags + 1) >> 3) & 1;
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
  v8.super_class = (Class)GEOCoarseLocationTerritoryInfo;
  -[GEOCoarseLocationTerritoryInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCoarseLocationTerritoryInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOCoarseLocationTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
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
  void *v23;
  int v24;
  uint64_t v25;
  __CFString *v26;
  void *v27;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_DWORD *)(a1 + 148);
  if ((v5 & 0x200) != 0)
  {
    v6 = *(int *)(a1 + 140);
    if (v6 >= 9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 140));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E1BFFE48[v6];
    }
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("territoryType"));

    v5 = *(_DWORD *)(a1 + 148);
  }
  if ((v5 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 128));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("regionName"));

    v5 = *(_DWORD *)(a1 + 148);
  }
  if ((v5 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 124));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("countryName"));

  }
  if (*(_QWORD *)(a1 + 24))
  {
    PBRepeatedUInt32NSArray();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("coordinates"));

  }
  v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 144));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("precise"));

    v11 = *(_DWORD *)(a1 + 148);
    if ((v11 & 8) == 0)
    {
LABEL_15:
      if ((v11 & 1) == 0)
        goto LABEL_16;
      goto LABEL_30;
    }
  }
  else if ((v11 & 8) == 0)
  {
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 80));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("featureId"));

  v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 1) == 0)
  {
LABEL_16:
    if ((v11 & 2) == 0)
      goto LABEL_17;
    goto LABEL_31;
  }
LABEL_30:
  _GEOCoarseLocationLatLngDictionaryRepresentation((double *)(a1 + 40));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("representativePoint"));

  v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 2) == 0)
  {
LABEL_17:
    if ((v11 & 0x100) == 0)
      goto LABEL_18;
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("areaDegrees"));

  v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 0x100) == 0)
  {
LABEL_18:
    if ((v11 & 4) == 0)
      goto LABEL_19;
LABEL_33:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 64));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("areaRatio"));

    if ((*(_DWORD *)(a1 + 148) & 0x10) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
LABEL_32:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 136));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("revgeoRank"));

  v11 = *(_DWORD *)(a1 + 148);
  if ((v11 & 4) != 0)
    goto LABEL_33;
LABEL_19:
  if ((v11 & 0x10) != 0)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 88));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("maxDistanceMeters"));

  }
LABEL_21:
  objc_msgSend((id)a1, "regionNameStr");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("regionNameStr"));

  objc_msgSend((id)a1, "countryNameStr");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v4, "setObject:forKey:", v14, CFSTR("countryNameStr"));

  objc_msgSend((id)a1, "polygon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v15, "jsonRepresentation");
    else
      objc_msgSend(v15, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v23, CFSTR("polygon"));

  }
  v24 = *(_DWORD *)(a1 + 148);
  if ((v24 & 0x80) != 0)
  {
    v25 = *(int *)(a1 + 132);
    if (v25 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = off_1E1BFFE90[v25];
    }
    objc_msgSend(v4, "setObject:forKey:", v26, CFSTR("representativePointQuality"));

    v24 = *(_DWORD *)(a1 + 148);
  }
  if ((v24 & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 145));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("shouldRandomize"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOCoarseLocationTerritoryInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOCoarseLocationTerritoryInfo)initWithDictionary:(id)a3
{
  return (GEOCoarseLocationTerritoryInfo *)-[GEOCoarseLocationTerritoryInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  GEOCoarseLocationPolygon *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  double v38;
  double v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_84;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_84;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("territoryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATE")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COUNTY")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CITY")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TERRITORY")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COUNTRY")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("POSTAL")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STATISTICAL")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("OTHER")) & 1) != 0)
    {
      v8 = 7;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("DISPUTED_AREA")))
    {
      v8 = 8;
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
      goto LABEL_27;
    v8 = objc_msgSend(v6, "intValue");
  }
  objc_msgSend(a1, "setTerritoryType:", v8);
LABEL_27:

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("regionName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRegionName:", objc_msgSend(v9, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countryName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setCountryName:", objc_msgSend(v10, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("coordinates"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v41 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(a1, "addCoordinates:", objc_msgSend(v17, "unsignedIntValue"));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v14);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("precise"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setPrecise:", objc_msgSend(v18, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("featureId"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setFeatureId:", objc_msgSend(v19, "unsignedLongLongValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("representativePoint"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = 0.0;
    v39 = 0.0;
    _GEOCoarseLocationLatLngFromDictionaryRepresentation(v20, &v38);
    objc_msgSend(a1, "setRepresentativePoint:", v38, v39);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("areaDegrees"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(a1, "setAreaDegrees:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("revgeoRank"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setRevgeoRank:", objc_msgSend(v22, "unsignedIntValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("areaRatio"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v23, "doubleValue");
    objc_msgSend(a1, "setAreaRatio:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("maxDistanceMeters"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(a1, "setMaxDistanceMeters:");
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("regionNameStr"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = (void *)objc_msgSend(v25, "copy");
    objc_msgSend(a1, "setRegionNameStr:", v26);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("countryNameStr"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v28 = (void *)objc_msgSend(v27, "copy");
    objc_msgSend(a1, "setCountryNameStr:", v28);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("polygon"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOCoarseLocationPolygon alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOCoarseLocationPolygon initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOCoarseLocationPolygon initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = (void *)v31;
    objc_msgSend(a1, "setPolygon:", v31);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("representativePointQuality"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    if ((objc_msgSend(v34, "isEqualToString:", CFSTR("EXCELLENT")) & 1) != 0)
    {
      v35 = 0;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("GOOD")) & 1) != 0)
    {
      v35 = 1;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("FAIR")) & 1) != 0)
    {
      v35 = 2;
    }
    else if ((objc_msgSend(v34, "isEqualToString:", CFSTR("POOR")) & 1) != 0)
    {
      v35 = 3;
    }
    else if (objc_msgSend(v34, "isEqualToString:", CFSTR("UNKNOWN")))
    {
      v35 = 4;
    }
    else
    {
      v35 = 0;
    }

    goto LABEL_80;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v35 = objc_msgSend(v33, "intValue");
LABEL_80:
    objc_msgSend(a1, "setRepresentativePointQuality:", v35);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("shouldRandomize"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setShouldRandomize:", objc_msgSend(v36, "BOOLValue"));

LABEL_84:
  return a1;
}

- (GEOCoarseLocationTerritoryInfo)initWithJSON:(id)a3
{
  return (GEOCoarseLocationTerritoryInfo *)-[GEOCoarseLocationTerritoryInfo _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_137;
    else
      v8 = (int *)&readAll__nonRecursiveTag_138;
    GEOCoarseLocationTerritoryInfoReadSpecified((uint64_t)self, (uint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOCoarseLocationPolygon readAll:](self->_polygon, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOCoarseLocationTerritoryInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOCoarseLocationTerritoryInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $76592BEDE77795F2213850FEF5437C34 flags;
  unint64_t v7;
  $76592BEDE77795F2213850FEF5437C34 v8;
  $76592BEDE77795F2213850FEF5437C34 v9;
  PBDataReader *v10;
  void *v11;

  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && !_GEOCoarseLocationTerritoryInfoIsDirty((uint64_t)self))
  {
    v10 = self->_reader;
    objc_sync_enter(v10);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v11);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v10);
    goto LABEL_39;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCoarseLocationTerritoryInfo readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_5:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
LABEL_6:
    PBDataWriterWriteUint32Field();
LABEL_7:
  if (self->_coordinates.count)
  {
    v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_coordinates.count);
  }
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    v8 = self->_flags;
    if ((*(_BYTE *)&v8 & 8) == 0)
    {
LABEL_12:
      if ((*(_BYTE *)&v8 & 1) == 0)
        goto LABEL_13;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&v8 & 8) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteUint64Field();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 1) == 0)
  {
LABEL_13:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_14;
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterPlaceMark();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteDoubleField();
  PBDataWriterRecallMark();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_15;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteDoubleField();
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_16;
LABEL_36:
    PBDataWriterWriteDoubleField();
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 4) != 0)
    goto LABEL_36;
LABEL_16:
  if ((*(_BYTE *)&v8 & 0x10) != 0)
LABEL_17:
    PBDataWriterWriteDoubleField();
LABEL_18:
  if (self->_regionNameStr)
    PBDataWriterWriteStringField();
  if (self->_countryNameStr)
    PBDataWriterWriteStringField();
  if (self->_polygon)
    PBDataWriterWriteSubmessage();
  v9 = self->_flags;
  if ((*(_BYTE *)&v9 & 0x80) != 0)
  {
    PBDataWriterWriteInt32Field();
    v9 = self->_flags;
  }
  if ((*(_WORD *)&v9 & 0x800) != 0)
    PBDataWriterWriteBOOLField();
LABEL_39:

}

- (void)copyTo:(id)a3
{
  $76592BEDE77795F2213850FEF5437C34 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  $76592BEDE77795F2213850FEF5437C34 v8;
  _DWORD *v9;
  $76592BEDE77795F2213850FEF5437C34 v10;
  char *v11;

  v11 = (char *)a3;
  -[GEOCoarseLocationTerritoryInfo readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v11 + 1, self->_reader);
  *((_DWORD *)v11 + 28) = self->_readerMarkPos;
  *((_DWORD *)v11 + 29) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
    if ((*(_BYTE *)&flags & 0x40) == 0)
      goto LABEL_3;
LABEL_29:
    *((_DWORD *)v11 + 32) = self->_regionName;
    *((_DWORD *)v11 + 37) |= 0x40u;
    if ((*(_DWORD *)&self->_flags & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  *((_DWORD *)v11 + 35) = self->_territoryType;
  *((_DWORD *)v11 + 37) |= 0x200u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x40) != 0)
    goto LABEL_29;
LABEL_3:
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_4:
    *((_DWORD *)v11 + 31) = self->_countryName;
    *((_DWORD *)v11 + 37) |= 0x20u;
  }
LABEL_5:
  if (-[GEOCoarseLocationTerritoryInfo coordinatesCount](self, "coordinatesCount"))
  {
    objc_msgSend(v11, "clearCoordinates");
    v5 = -[GEOCoarseLocationTerritoryInfo coordinatesCount](self, "coordinatesCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
        objc_msgSend(v11, "addCoordinates:", -[GEOCoarseLocationTerritoryInfo coordinatesAtIndex:](self, "coordinatesAtIndex:", i));
    }
  }
  v8 = self->_flags;
  v9 = v11;
  if ((*(_WORD *)&v8 & 0x400) != 0)
  {
    v11[144] = self->_precise;
    *((_DWORD *)v11 + 37) |= 0x400u;
    v8 = self->_flags;
    if ((*(_BYTE *)&v8 & 8) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v8 & 1) == 0)
        goto LABEL_12;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&v8 & 8) == 0)
  {
    goto LABEL_11;
  }
  *((_QWORD *)v11 + 10) = self->_featureId;
  *((_DWORD *)v11 + 37) |= 8u;
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v8 & 2) == 0)
      goto LABEL_13;
    goto LABEL_34;
  }
LABEL_33:
  *(GEOCoarseLocationLatLng *)(v11 + 40) = self->_representativePoint;
  *((_DWORD *)v11 + 37) |= 1u;
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v8 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_35;
  }
LABEL_34:
  *((_QWORD *)v11 + 7) = *(_QWORD *)&self->_areaDegrees;
  *((_DWORD *)v11 + 37) |= 2u;
  v8 = self->_flags;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v8 & 4) == 0)
      goto LABEL_15;
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)v11 + 34) = self->_revgeoRank;
  *((_DWORD *)v11 + 37) |= 0x100u;
  v8 = self->_flags;
  if ((*(_BYTE *)&v8 & 4) == 0)
  {
LABEL_15:
    if ((*(_BYTE *)&v8 & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_36:
  *((_QWORD *)v11 + 8) = *(_QWORD *)&self->_areaRatio;
  *((_DWORD *)v11 + 37) |= 4u;
  if ((*(_DWORD *)&self->_flags & 0x10) != 0)
  {
LABEL_16:
    *((_QWORD *)v11 + 11) = *(_QWORD *)&self->_maxDistanceMeters;
    *((_DWORD *)v11 + 37) |= 0x10u;
  }
LABEL_17:
  if (self->_regionNameStr)
  {
    objc_msgSend(v11, "setRegionNameStr:");
    v9 = v11;
  }
  if (self->_countryNameStr)
  {
    objc_msgSend(v11, "setCountryNameStr:");
    v9 = v11;
  }
  if (self->_polygon)
  {
    objc_msgSend(v11, "setPolygon:");
    v9 = v11;
  }
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 0x80) != 0)
  {
    v9[33] = self->_representativePointQuality;
    v9[37] |= 0x80u;
    v10 = self->_flags;
  }
  if ((*(_WORD *)&v10 & 0x800) != 0)
  {
    *((_BYTE *)v9 + 145) = self->_shouldRandomize;
    v9[37] |= 0x800u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  $76592BEDE77795F2213850FEF5437C34 flags;
  $76592BEDE77795F2213850FEF5437C34 v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  $76592BEDE77795F2213850FEF5437C34 v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOCoarseLocationTerritoryInfoReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOCoarseLocationTerritoryInfo readAll:](self, "readAll:", 0);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_territoryType;
    *(_DWORD *)(v5 + 148) |= 0x200u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x40) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 0x20) == 0)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  else if ((*(_BYTE *)&flags & 0x40) == 0)
  {
    goto LABEL_7;
  }
  *(_DWORD *)(v5 + 128) = self->_regionName;
  *(_DWORD *)(v5 + 148) |= 0x40u;
  if ((*(_DWORD *)&self->_flags & 0x20) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 124) = self->_countryName;
    *(_DWORD *)(v5 + 148) |= 0x20u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 144) = self->_precise;
    *(_DWORD *)(v5 + 148) |= 0x400u;
    v10 = self->_flags;
    if ((*(_BYTE *)&v10 & 8) == 0)
    {
LABEL_11:
      if ((*(_BYTE *)&v10 & 1) == 0)
        goto LABEL_12;
      goto LABEL_27;
    }
  }
  else if ((*(_BYTE *)&v10 & 8) == 0)
  {
    goto LABEL_11;
  }
  *(_QWORD *)(v5 + 80) = self->_featureId;
  *(_DWORD *)(v5 + 148) |= 8u;
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 1) == 0)
  {
LABEL_12:
    if ((*(_BYTE *)&v10 & 2) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  *(GEOCoarseLocationLatLng *)(v5 + 40) = self->_representativePoint;
  *(_DWORD *)(v5 + 148) |= 1u;
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 2) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&v10 & 0x100) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 56) = self->_areaDegrees;
  *(_DWORD *)(v5 + 148) |= 2u;
  v10 = self->_flags;
  if ((*(_WORD *)&v10 & 0x100) == 0)
  {
LABEL_14:
    if ((*(_BYTE *)&v10 & 4) == 0)
      goto LABEL_15;
LABEL_30:
    *(double *)(v5 + 64) = self->_areaRatio;
    *(_DWORD *)(v5 + 148) |= 4u;
    if ((*(_DWORD *)&self->_flags & 0x10) == 0)
      goto LABEL_17;
    goto LABEL_16;
  }
LABEL_29:
  *(_DWORD *)(v5 + 136) = self->_revgeoRank;
  *(_DWORD *)(v5 + 148) |= 0x100u;
  v10 = self->_flags;
  if ((*(_BYTE *)&v10 & 4) != 0)
    goto LABEL_30;
LABEL_15:
  if ((*(_BYTE *)&v10 & 0x10) != 0)
  {
LABEL_16:
    *(double *)(v5 + 88) = self->_maxDistanceMeters;
    *(_DWORD *)(v5 + 148) |= 0x10u;
  }
LABEL_17:
  v11 = -[NSString copyWithZone:](self->_regionNameStr, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v11;

  v13 = -[NSString copyWithZone:](self->_countryNameStr, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[GEOCoarseLocationPolygon copyWithZone:](self->_polygon, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v15;

  v17 = self->_flags;
  if ((*(_BYTE *)&v17 & 0x80) != 0)
  {
    *(_DWORD *)(v5 + 132) = self->_representativePointQuality;
    *(_DWORD *)(v5 + 148) |= 0x80u;
    v17 = self->_flags;
  }
  if ((*(_WORD *)&v17 & 0x800) != 0)
  {
    *(_BYTE *)(v5 + 145) = self->_shouldRandomize;
    *(_DWORD *)(v5 + 148) |= 0x800u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  $76592BEDE77795F2213850FEF5437C34 flags;
  int v6;
  $76592BEDE77795F2213850FEF5437C34 v7;
  int v8;
  NSString *regionNameStr;
  NSString *countryNameStr;
  GEOCoarseLocationPolygon *polygon;
  $76592BEDE77795F2213850FEF5437C34 v13;
  int v14;
  BOOL v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_74;
  -[GEOCoarseLocationTerritoryInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  flags = self->_flags;
  v6 = *((_DWORD *)v4 + 37);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v6 & 0x200) == 0 || self->_territoryType != *((_DWORD *)v4 + 35))
      goto LABEL_74;
  }
  else if ((v6 & 0x200) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_regionName != *((_DWORD *)v4 + 32))
      goto LABEL_74;
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_countryName != *((_DWORD *)v4 + 31))
      goto LABEL_74;
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_74;
  }
  if (!PBRepeatedUInt32IsEqual())
    goto LABEL_74;
  v7 = self->_flags;
  v8 = *((_DWORD *)v4 + 37);
  if ((*(_WORD *)&v7 & 0x400) != 0)
  {
    if ((v8 & 0x400) == 0)
      goto LABEL_74;
    if (self->_precise)
    {
      if (!*((_BYTE *)v4 + 144))
        goto LABEL_74;
    }
    else if (*((_BYTE *)v4 + 144))
    {
      goto LABEL_74;
    }
  }
  else if ((v8 & 0x400) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&v7 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_featureId != *((_QWORD *)v4 + 10))
      goto LABEL_74;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&v7 & 1) != 0)
  {
    if ((v8 & 1) == 0)
      goto LABEL_74;
    if (*(_QWORD *)&self->_representativePoint._lat != *((_QWORD *)v4 + 5)
      || *(_QWORD *)&self->_representativePoint._lng != *((_QWORD *)v4 + 6))
    {
      goto LABEL_74;
    }
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&v7 & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_areaDegrees != *((double *)v4 + 7))
      goto LABEL_74;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&v7 & 0x100) != 0)
  {
    if ((v8 & 0x100) == 0 || self->_revgeoRank != *((_DWORD *)v4 + 34))
      goto LABEL_74;
  }
  else if ((v8 & 0x100) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&v7 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_areaRatio != *((double *)v4 + 8))
      goto LABEL_74;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_BYTE *)&v7 & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_maxDistanceMeters != *((double *)v4 + 11))
      goto LABEL_74;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_74;
  }
  regionNameStr = self->_regionNameStr;
  if ((unint64_t)regionNameStr | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](regionNameStr, "isEqual:"))
  {
    goto LABEL_74;
  }
  countryNameStr = self->_countryNameStr;
  if ((unint64_t)countryNameStr | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](countryNameStr, "isEqual:"))
      goto LABEL_74;
  }
  polygon = self->_polygon;
  if ((unint64_t)polygon | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOCoarseLocationPolygon isEqual:](polygon, "isEqual:"))
      goto LABEL_74;
  }
  v13 = self->_flags;
  v14 = *((_DWORD *)v4 + 37);
  if ((*(_BYTE *)&v13 & 0x80) != 0)
  {
    if ((v14 & 0x80) == 0 || self->_representativePointQuality != *((_DWORD *)v4 + 33))
      goto LABEL_74;
  }
  else if ((v14 & 0x80) != 0)
  {
    goto LABEL_74;
  }
  if ((*(_WORD *)&v13 & 0x800) != 0)
  {
    if ((v14 & 0x800) != 0)
    {
      if (self->_shouldRandomize)
      {
        if (!*((_BYTE *)v4 + 145))
          goto LABEL_74;
      }
      else if (*((_BYTE *)v4 + 145))
      {
        goto LABEL_74;
      }
      v15 = 1;
      goto LABEL_75;
    }
LABEL_74:
    v15 = 0;
    goto LABEL_75;
  }
  v15 = (*((_DWORD *)v4 + 37) & 0x800) == 0;
LABEL_75:

  return v15;
}

- (unint64_t)hash
{
  $76592BEDE77795F2213850FEF5437C34 flags;
  $76592BEDE77795F2213850FEF5437C34 v4;
  double areaDegrees;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  double areaRatio;
  double v12;
  long double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double maxDistanceMeters;
  double v18;
  long double v19;
  double v20;
  NSUInteger v21;
  NSUInteger v22;
  unint64_t v23;
  $76592BEDE77795F2213850FEF5437C34 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  -[GEOCoarseLocationTerritoryInfo readAll:](self, "readAll:", 1);
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) == 0)
  {
    v34 = 0;
    if ((*(_BYTE *)&flags & 0x40) != 0)
      goto LABEL_3;
LABEL_6:
    v33 = 0;
    if ((*(_BYTE *)&flags & 0x20) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v34 = 2654435761 * self->_territoryType;
  if ((*(_BYTE *)&flags & 0x40) == 0)
    goto LABEL_6;
LABEL_3:
  v33 = 2654435761 * self->_regionName;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
LABEL_4:
    v32 = 2654435761 * self->_countryName;
    goto LABEL_8;
  }
LABEL_7:
  v32 = 0;
LABEL_8:
  v31 = PBRepeatedUInt32Hash();
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
    v30 = 2654435761 * self->_precise;
    if ((*(_BYTE *)&v4 & 8) != 0)
    {
LABEL_10:
      v29 = 2654435761u * self->_featureId;
      if ((*(_BYTE *)&v4 & 1) != 0)
        goto LABEL_11;
LABEL_18:
      v28 = 0;
      if ((*(_BYTE *)&v4 & 2) != 0)
        goto LABEL_12;
LABEL_19:
      v9 = 0;
      goto LABEL_22;
    }
  }
  else
  {
    v30 = 0;
    if ((*(_BYTE *)&v4 & 8) != 0)
      goto LABEL_10;
  }
  v29 = 0;
  if ((*(_BYTE *)&v4 & 1) == 0)
    goto LABEL_18;
LABEL_11:
  v28 = PBHashBytes();
  v4 = self->_flags;
  if ((*(_BYTE *)&v4 & 2) == 0)
    goto LABEL_19;
LABEL_12:
  areaDegrees = self->_areaDegrees;
  v6 = -areaDegrees;
  if (areaDegrees >= 0.0)
    v6 = self->_areaDegrees;
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
LABEL_22:
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
    v10 = 2654435761 * self->_revgeoRank;
    if ((*(_BYTE *)&v4 & 4) != 0)
      goto LABEL_24;
LABEL_29:
    v15 = 0;
    goto LABEL_32;
  }
  v10 = 0;
  if ((*(_BYTE *)&v4 & 4) == 0)
    goto LABEL_29;
LABEL_24:
  areaRatio = self->_areaRatio;
  v12 = -areaRatio;
  if (areaRatio >= 0.0)
    v12 = self->_areaRatio;
  v13 = floor(v12 + 0.5);
  v14 = (v12 - v13) * 1.84467441e19;
  v15 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
  if (v14 >= 0.0)
  {
    if (v14 > 0.0)
      v15 += (unint64_t)v14;
  }
  else
  {
    v15 -= (unint64_t)fabs(v14);
  }
LABEL_32:
  if ((*(_BYTE *)&v4 & 0x10) != 0)
  {
    maxDistanceMeters = self->_maxDistanceMeters;
    v18 = -maxDistanceMeters;
    if (maxDistanceMeters >= 0.0)
      v18 = self->_maxDistanceMeters;
    v19 = floor(v18 + 0.5);
    v20 = (v18 - v19) * 1.84467441e19;
    v16 = 2654435761u * (unint64_t)fmod(v19, 1.84467441e19);
    if (v20 >= 0.0)
    {
      if (v20 > 0.0)
        v16 += (unint64_t)v20;
    }
    else
    {
      v16 -= (unint64_t)fabs(v20);
    }
  }
  else
  {
    v16 = 0;
  }
  v21 = -[NSString hash](self->_regionNameStr, "hash");
  v22 = -[NSString hash](self->_countryNameStr, "hash");
  v23 = -[GEOCoarseLocationPolygon hash](self->_polygon, "hash");
  v24 = self->_flags;
  if ((*(_BYTE *)&v24 & 0x80) != 0)
  {
    v25 = 2654435761 * self->_representativePointQuality;
    if ((*(_WORD *)&v24 & 0x800) != 0)
      goto LABEL_42;
LABEL_44:
    v26 = 0;
    return v33 ^ v34 ^ v32 ^ v30 ^ v29 ^ v28 ^ v9 ^ v10 ^ v31 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v25 ^ v26;
  }
  v25 = 0;
  if ((*(_WORD *)&v24 & 0x800) == 0)
    goto LABEL_44;
LABEL_42:
  v26 = 2654435761 * self->_shouldRandomize;
  return v33 ^ v34 ^ v32 ^ v30 ^ v29 ^ v28 ^ v9 ^ v10 ^ v31 ^ v15 ^ v16 ^ v21 ^ v22 ^ v23 ^ v25 ^ v26;
}

- (void)mergeFrom:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  char *v8;
  int v9;
  GEOCoarseLocationPolygon *polygon;
  uint64_t v11;
  int v12;
  char *v13;

  v13 = (char *)a3;
  objc_msgSend(v13, "readAll:", 0);
  v4 = *((_DWORD *)v13 + 37);
  if ((v4 & 0x200) != 0)
  {
    self->_territoryType = *((_DWORD *)v13 + 35);
    *(_DWORD *)&self->_flags |= 0x200u;
    v4 = *((_DWORD *)v13 + 37);
    if ((v4 & 0x40) == 0)
    {
LABEL_3:
      if ((v4 & 0x20) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((v4 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_regionName = *((_DWORD *)v13 + 32);
  *(_DWORD *)&self->_flags |= 0x40u;
  if ((*((_DWORD *)v13 + 37) & 0x20) != 0)
  {
LABEL_4:
    self->_countryName = *((_DWORD *)v13 + 31);
    *(_DWORD *)&self->_flags |= 0x20u;
  }
LABEL_5:
  v5 = objc_msgSend(v13, "coordinatesCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
      -[GEOCoarseLocationTerritoryInfo addCoordinates:](self, "addCoordinates:", objc_msgSend(v13, "coordinatesAtIndex:", i));
  }
  v8 = v13;
  v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 0x400) != 0)
  {
    self->_precise = v13[144];
    *(_DWORD *)&self->_flags |= 0x400u;
    v9 = *((_DWORD *)v13 + 37);
    if ((v9 & 8) == 0)
    {
LABEL_10:
      if ((v9 & 1) == 0)
        goto LABEL_11;
      goto LABEL_28;
    }
  }
  else if ((v9 & 8) == 0)
  {
    goto LABEL_10;
  }
  self->_featureId = *((_QWORD *)v13 + 10);
  *(_DWORD *)&self->_flags |= 8u;
  v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 1) == 0)
  {
LABEL_11:
    if ((v9 & 2) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  self->_representativePoint = *(GEOCoarseLocationLatLng *)(v13 + 40);
  *(_DWORD *)&self->_flags |= 1u;
  v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 2) == 0)
  {
LABEL_12:
    if ((v9 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  self->_areaDegrees = *((double *)v13 + 7);
  *(_DWORD *)&self->_flags |= 2u;
  v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 0x100) == 0)
  {
LABEL_13:
    if ((v9 & 4) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  self->_revgeoRank = *((_DWORD *)v13 + 34);
  *(_DWORD *)&self->_flags |= 0x100u;
  v9 = *((_DWORD *)v13 + 37);
  if ((v9 & 4) == 0)
  {
LABEL_14:
    if ((v9 & 0x10) == 0)
      goto LABEL_16;
    goto LABEL_15;
  }
LABEL_31:
  self->_areaRatio = *((double *)v13 + 8);
  *(_DWORD *)&self->_flags |= 4u;
  if ((*((_DWORD *)v13 + 37) & 0x10) != 0)
  {
LABEL_15:
    self->_maxDistanceMeters = *((double *)v13 + 11);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
LABEL_16:
  if (*((_QWORD *)v13 + 13))
  {
    -[GEOCoarseLocationTerritoryInfo setRegionNameStr:](self, "setRegionNameStr:");
    v8 = v13;
  }
  if (*((_QWORD *)v8 + 9))
  {
    -[GEOCoarseLocationTerritoryInfo setCountryNameStr:](self, "setCountryNameStr:");
    v8 = v13;
  }
  polygon = self->_polygon;
  v11 = *((_QWORD *)v8 + 12);
  if (polygon)
  {
    if (!v11)
      goto LABEL_36;
    -[GEOCoarseLocationPolygon mergeFrom:](polygon, "mergeFrom:");
  }
  else
  {
    if (!v11)
      goto LABEL_36;
    -[GEOCoarseLocationTerritoryInfo setPolygon:](self, "setPolygon:");
  }
  v8 = v13;
LABEL_36:
  v12 = *((_DWORD *)v8 + 37);
  if ((v12 & 0x80) != 0)
  {
    self->_representativePointQuality = *((_DWORD *)v8 + 33);
    *(_DWORD *)&self->_flags |= 0x80u;
    v12 = *((_DWORD *)v8 + 37);
  }
  if ((v12 & 0x800) != 0)
  {
    self->_shouldRandomize = v8[145];
    *(_DWORD *)&self->_flags |= 0x800u;
  }

}

@end
