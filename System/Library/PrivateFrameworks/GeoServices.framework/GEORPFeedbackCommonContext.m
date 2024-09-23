@implementation GEORPFeedbackCommonContext

- (GEORPFeedbackCommonContext)init
{
  GEORPFeedbackCommonContext *v2;
  GEORPFeedbackCommonContext *v3;
  GEORPFeedbackCommonContext *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackCommonContext;
  v2 = -[GEORPFeedbackCommonContext init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackCommonContext)initWithData:(id)a3
{
  GEORPFeedbackCommonContext *v3;
  GEORPFeedbackCommonContext *v4;
  GEORPFeedbackCommonContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackCommonContext;
  v3 = -[GEORPFeedbackCommonContext initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEORPFeedbackCommonContext;
  -[GEORPFeedbackCommonContext dealloc](&v3, sel_dealloc);
}

- (int)pinType
{
  os_unfair_lock_s *p_readerLock;
  $B40C2BF14A359B44A88B8C46D0584055 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 8) != 0)
    return self->_pinType;
  else
    return -1;
}

- (void)setPinType:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10008u;
  self->_pinType = a3;
}

- (void)setHasPinType:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65544;
  else
    v3 = 0x10000;
  self->_flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPinType
{
  return (*(_BYTE *)&self->_flags >> 3) & 1;
}

- (id)pinTypeAsString:(int)a3
{
  if ((a3 + 1) < 0xB)
    return off_1E1C038C0[a3 + 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPinType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PIN_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULT")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("POI_ICON")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DROPPED_PIN")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BOOKMARK")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EXTERNAL")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PIN_TYPE_SEARCH_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_ICON")) & 1) != 0)
  {
    v4 = 8;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SHARED_LOCATION")))
  {
    v4 = 9;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)_readMapLocation
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMapLocation_tags_827);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasMapLocation
{
  -[GEORPFeedbackCommonContext _readMapLocation]((uint64_t)self);
  return self->_mapLocation != 0;
}

- (GEORPMapLocation)mapLocation
{
  -[GEORPFeedbackCommonContext _readMapLocation]((uint64_t)self);
  return self->_mapLocation;
}

- (void)setMapLocation:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10800u;
  objc_storeStrong((id *)&self->_mapLocation, a3);
}

- (void)_readVisibleTileSets
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readVisibleTileSets_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (NSMutableArray)visibleTileSets
{
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  return self->_visibleTileSets;
}

- (void)setVisibleTileSets:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *visibleTileSets;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  visibleTileSets = self->_visibleTileSets;
  self->_visibleTileSets = v4;

}

- (void)clearVisibleTileSets
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_visibleTileSets, "removeAllObjects");
}

- (void)addVisibleTileSet:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  -[GEORPFeedbackCommonContext _addNoFlagsVisibleTileSet:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x8000u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsVisibleTileSet:(uint64_t)a1
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

- (unint64_t)visibleTileSetsCount
{
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  return -[NSMutableArray count](self->_visibleTileSets, "count");
}

- (id)visibleTileSetAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackCommonContext _readVisibleTileSets]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_visibleTileSets, "objectAtIndex:", a3);
}

+ (Class)visibleTileSetType
{
  return (Class)objc_opt_class();
}

- (void)_readUserPaths
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 160) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserPaths_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (unint64_t)userPathsCount
{
  -[GEORPFeedbackCommonContext _readUserPaths]((uint64_t)self);
  return self->_userPaths.count;
}

- (int)userPaths
{
  -[GEORPFeedbackCommonContext _readUserPaths]((uint64_t)self);
  return self->_userPaths.list;
}

- (void)clearUserPaths
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedInt32Clear();
}

- (void)addUserPath:(int)a3
{
  -[GEORPFeedbackCommonContext _readUserPaths]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (int)userPathAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_userPaths;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPFeedbackCommonContext _readUserPaths]((uint64_t)self);
  p_userPaths = &self->_userPaths;
  count = self->_userPaths.count;
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
  return p_userPaths->list[a3];
}

- (void)setUserPaths:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x40u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  PBRepeatedInt32Set();
}

- (id)userPathsAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E1C03918[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsUserPaths:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_PATH_ITEM_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_PROBLEM")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MAP_PROBLEM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_EDIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_EDIT_LABEL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_PICKER_CORRECT_COORDINATE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_FEATURE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_COORDINATE")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_REGION")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_CLOSED")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("COMMENTS_AND_PHOTO")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_RESULTS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE_IMAGE")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEPS")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GUIDANCE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_ROUTE_PICKER")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_MAP_PROBLEM")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_DIRECTIONS_PROBLEM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_STATION_PROBLEM")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_TRANSFER_PICKER")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_PICKER")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_DISPLAY_PROBLEM")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_STATION_PICKER")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_SERVICE_CHANGE")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_SCHEDULES")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_BAD_ROUTE_SUGGESTIONS")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_SUBCATEGORY_PICKER")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_ADD")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IM_LOST")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_NAME_INCORRECT")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_SHAPE_INCORRECT")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAD_DIRECTIONS_ROUTE_WRONG")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAD_DIRECTIONS_INCORRECT_ETA")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT_PICKER")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_MAP_CORRECTION")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WHICH_PERSONALIZED_MAP_ADDRESS")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_MAP_PLACE_PROBLEM")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADD_A_PLACE_TYPE_SELECTION")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PLACE_CATEGORY_SELECTION")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TAKE_PHOTO")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROUTING_TRAY")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_PROBLEM")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BRAND_CORRECTIONS")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_INFO")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS_SEARCH")) & 1) != 0)
  {
    v4 = 59;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_COLLECTION_PROBLEM")))
  {
    v4 = 60;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (double)clientCreatedAt
{
  return self->_clientCreatedAt;
}

- (void)setClientCreatedAt:(double)a3
{
  *(_DWORD *)&self->_flags |= 0x10001u;
  self->_clientCreatedAt = a3;
}

- (void)setHasClientCreatedAt:(BOOL)a3
{
  self->_flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFEFFFE | a3 | 0x10000);
}

- (BOOL)hasClientCreatedAt
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readAuxiliaryControls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 160) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAuxiliaryControls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (NSMutableArray)auxiliaryControls
{
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  return self->_auxiliaryControls;
}

- (void)setAuxiliaryControls:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *auxiliaryControls;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  auxiliaryControls = self->_auxiliaryControls;
  self->_auxiliaryControls = v4;

}

- (void)clearAuxiliaryControls
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
  -[NSMutableArray removeAllObjects](self->_auxiliaryControls, "removeAllObjects");
}

- (void)addAuxiliaryControl:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  -[GEORPFeedbackCommonContext _addNoFlagsAuxiliaryControl:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_DWORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_DWORD *)&self->_flags |= 0x10000u;
}

- (void)_addNoFlagsAuxiliaryControl:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 48);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v5;

      v4 = *(void **)(a1 + 48);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)auxiliaryControlsCount
{
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  return -[NSMutableArray count](self->_auxiliaryControls, "count");
}

- (id)auxiliaryControlAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackCommonContext _readAuxiliaryControls]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_auxiliaryControls, "objectAtIndex:", a3);
}

+ (Class)auxiliaryControlType
{
  return (Class)objc_opt_class();
}

- (unint64_t)originatingAuxiliaryControlIndex
{
  return self->_originatingAuxiliaryControlIndex;
}

- (void)setOriginatingAuxiliaryControlIndex:(unint64_t)a3
{
  *(_DWORD *)&self->_flags |= 0x10002u;
  self->_originatingAuxiliaryControlIndex = a3;
}

- (void)setHasOriginatingAuxiliaryControlIndex:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65538;
  else
    v3 = 0x10000;
  self->_flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFFD | v3);
}

- (BOOL)hasOriginatingAuxiliaryControlIndex
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (int)deviceGmtOffset
{
  return self->_deviceGmtOffset;
}

- (void)setDeviceGmtOffset:(int)a3
{
  *(_DWORD *)&self->_flags |= 0x10004u;
  self->_deviceGmtOffset = a3;
}

- (void)setHasDeviceGmtOffset:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65540;
  else
    v3 = 0x10000;
  self->_flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFFB | v3);
}

- (BOOL)hasDeviceGmtOffset
{
  return (*(_BYTE *)&self->_flags >> 2) & 1;
}

- (void)_readCurrentEnvironmentManifestUrls
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentEnvironmentManifestUrls_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCurrentEnvironmentManifestUrls
{
  -[GEORPFeedbackCommonContext _readCurrentEnvironmentManifestUrls]((uint64_t)self);
  return self->_currentEnvironmentManifestUrls != 0;
}

- (GEORPCurrentEnvironmentManifestURLs)currentEnvironmentManifestUrls
{
  -[GEORPFeedbackCommonContext _readCurrentEnvironmentManifestUrls]((uint64_t)self);
  return self->_currentEnvironmentManifestUrls;
}

- (void)setCurrentEnvironmentManifestUrls:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10400u;
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, a3);
}

- (void)_readNavigationSettings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNavigationSettings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasNavigationSettings
{
  -[GEORPFeedbackCommonContext _readNavigationSettings]((uint64_t)self);
  return self->_navigationSettings != 0;
}

- (GEORPNavigationSettings)navigationSettings
{
  -[GEORPFeedbackCommonContext _readNavigationSettings]((uint64_t)self);
  return self->_navigationSettings;
}

- (void)setNavigationSettings:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x11000u;
  objc_storeStrong((id *)&self->_navigationSettings, a3);
}

- (void)_readSourceInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSourceInfo_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasSourceInfo
{
  -[GEORPFeedbackCommonContext _readSourceInfo]((uint64_t)self);
  return self->_sourceInfo != 0;
}

- (GEORPSourceInfo)sourceInfo
{
  -[GEORPFeedbackCommonContext _readSourceInfo]((uint64_t)self);
  return self->_sourceInfo;
}

- (void)setSourceInfo:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x14000u;
  objc_storeStrong((id *)&self->_sourceInfo, a3);
}

- (void)_readSearchCommon
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchCommon_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasSearchCommon
{
  -[GEORPFeedbackCommonContext _readSearchCommon]((uint64_t)self);
  return self->_searchCommon != 0;
}

- (GEORPSearchCommonContext)searchCommon
{
  -[GEORPFeedbackCommonContext _readSearchCommon]((uint64_t)self);
  return self->_searchCommon;
}

- (void)setSearchCommon:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x12000u;
  objc_storeStrong((id *)&self->_searchCommon, a3);
}

- (void)_readCurrentAbAssignmentResponse
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCurrentAbAssignmentResponse_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCurrentAbAssignmentResponse
{
  -[GEORPFeedbackCommonContext _readCurrentAbAssignmentResponse]((uint64_t)self);
  return self->_currentAbAssignmentResponse != 0;
}

- (GEOABAssignmentResponse)currentAbAssignmentResponse
{
  -[GEORPFeedbackCommonContext _readCurrentAbAssignmentResponse]((uint64_t)self);
  return self->_currentAbAssignmentResponse;
}

- (void)setCurrentAbAssignmentResponse:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10200u;
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, a3);
}

- (BOOL)isSprMap
{
  return self->_isSprMap;
}

- (void)setIsSprMap:(BOOL)a3
{
  *(_DWORD *)&self->_flags |= 0x10010u;
  self->_isSprMap = a3;
}

- (void)setHasIsSprMap:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 65552;
  else
    v3 = 0x10000;
  self->_flags = ($B40C2BF14A359B44A88B8C46D0584055)(*(_DWORD *)&self->_flags & 0xFFFFFFEF | v3);
}

- (BOOL)hasIsSprMap
{
  return (*(_BYTE *)&self->_flags >> 4) & 1;
}

- (void)_readCombinedUserPath
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 144));
    if ((*(_BYTE *)(a1 + 161) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackCommonContextReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCombinedUserPath_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 144));
  }
}

- (BOOL)hasCombinedUserPath
{
  -[GEORPFeedbackCommonContext _readCombinedUserPath]((uint64_t)self);
  return self->_combinedUserPath != 0;
}

- (GEORPUserPath)combinedUserPath
{
  -[GEORPFeedbackCommonContext _readCombinedUserPath]((uint64_t)self);
  return self->_combinedUserPath;
}

- (void)setCombinedUserPath:(id)a3
{
  *(_DWORD *)&self->_flags |= 0x10100u;
  objc_storeStrong((id *)&self->_combinedUserPath, a3);
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
  v8.super_class = (Class)GEORPFeedbackCommonContext;
  -[GEORPFeedbackCommonContext description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackCommonContext dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackCommonContext _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  __CFString *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  const __CFString *v37;
  int v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  void *v67;
  const __CFString *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  _QWORD v76[4];
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 160) & 8) != 0)
  {
    v5 = *(_DWORD *)(a1 + 152) + 1;
    if (v5 >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 152));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C038C0[v5];
    }
    if (a2)
      v7 = CFSTR("pinType");
    else
      v7 = CFSTR("pin_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  objc_msgSend((id)a1, "mapLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v8, "jsonRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("mapLocation");
    }
    else
    {
      objc_msgSend(v8, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("map_location");
    }
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v82 = 0u;
    v83 = 0u;
    v84 = 0u;
    v85 = 0u;
    v13 = *(id *)(a1 + 128);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v83;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v83 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v18, "jsonRepresentation");
          else
            objc_msgSend(v18, "dictionaryRepresentation");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v19);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
      }
      while (v15);
    }

    if (a2)
      v20 = CFSTR("visibleTileSet");
    else
      v20 = CFSTR("visible_tile_set");
    objc_msgSend(v4, "setObject:forKey:", v12, v20);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v23 = 0;
      do
      {
        v24 = *(unsigned int *)(*v22 + 4 * v23);
        if (v24 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> v24) & 1) != 0)
        {
          v25 = off_1E1C03918[(int)v24];
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v21, "addObject:", v25);

        ++v23;
        v22 = (_QWORD *)(a1 + 24);
      }
      while (v23 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v26 = CFSTR("userPath");
    else
      v26 = CFSTR("user_path");
    objc_msgSend(v4, "setObject:forKey:", v21, v26);

  }
  if ((*(_BYTE *)(a1 + 160) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 56));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("clientCreatedAt");
    else
      v28 = CFSTR("client_created_at");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v30 = *(id *)(a1 + 48);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v79;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v79 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v35, "jsonRepresentation");
          else
            objc_msgSend(v35, "dictionaryRepresentation");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v78, v86, 16);
      }
      while (v32);
    }

    if (a2)
      v37 = CFSTR("auxiliaryControl");
    else
      v37 = CFSTR("auxiliary_control");
    objc_msgSend(v4, "setObject:forKey:", v29, v37);

  }
  v38 = *(_DWORD *)(a1 + 160);
  if ((v38 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 104));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("originatingAuxiliaryControlIndex");
    else
      v40 = CFSTR("originating_auxiliary_control_index");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    v38 = *(_DWORD *)(a1 + 160);
  }
  if ((v38 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 148));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v42 = CFSTR("deviceGmtOffset");
    else
      v42 = CFSTR("device_gmt_offset");
    objc_msgSend(v4, "setObject:forKey:", v41, v42);

  }
  objc_msgSend((id)a1, "currentEnvironmentManifestUrls");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = v43;
  if (v43)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v43, "jsonRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("currentEnvironmentManifestUrls");
    }
    else
    {
      objc_msgSend(v43, "dictionaryRepresentation");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = CFSTR("current_environment_manifest_urls");
    }
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

  }
  objc_msgSend((id)a1, "navigationSettings");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("navigationSettings");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("navigation_settings");
    }
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  objc_msgSend((id)a1, "sourceInfo");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v51;
  if (v51)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v51, "jsonRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("sourceInfo");
    }
    else
    {
      objc_msgSend(v51, "dictionaryRepresentation");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = CFSTR("source_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v53, v54);

  }
  objc_msgSend((id)a1, "searchCommon");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v55;
  if (v55)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v55, "jsonRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("searchCommon");
    }
    else
    {
      objc_msgSend(v55, "dictionaryRepresentation");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = CFSTR("search_common");
    }
    objc_msgSend(v4, "setObject:forKey:", v57, v58);

  }
  objc_msgSend((id)a1, "currentAbAssignmentResponse");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v59;
  if (v59)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v59, "jsonRepresentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = CFSTR("currentAbAssignmentResponse");
    }
    else
    {
      objc_msgSend(v59, "dictionaryRepresentation");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = CFSTR("current_ab_assignment_response");
    }
    objc_msgSend(v4, "setObject:forKey:", v61, v62);

  }
  if ((*(_BYTE *)(a1 + 160) & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 156));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v64 = CFSTR("isSprMap");
    else
      v64 = CFSTR("is_spr_map");
    objc_msgSend(v4, "setObject:forKey:", v63, v64);

  }
  objc_msgSend((id)a1, "combinedUserPath");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v65;
  if (v65)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v65, "jsonRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("combinedUserPath");
    }
    else
    {
      objc_msgSend(v65, "dictionaryRepresentation");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = CFSTR("combined_user_path");
    }
    objc_msgSend(v4, "setObject:forKey:", v67, v68);

  }
  v69 = *(void **)(a1 + 16);
  if (v69)
  {
    objc_msgSend(v69, "dictionaryRepresentation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v70;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v70, "count"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = 3221225472;
      v76[2] = __56__GEORPFeedbackCommonContext__dictionaryRepresentation___block_invoke;
      v76[3] = &unk_1E1C00600;
      v73 = v72;
      v77 = v73;
      objc_msgSend(v71, "enumerateKeysAndObjectsUsingBlock:", v76);
      v74 = v73;

      v71 = v74;
    }
    objc_msgSend(v4, "setObject:forKey:", v71, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackCommonContext _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __56__GEORPFeedbackCommonContext__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEORPFeedbackCommonContext)initWithDictionary:(id)a3
{
  return (GEORPFeedbackCommonContext *)-[GEORPFeedbackCommonContext _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  GEORPMapLocation *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  GEORPVisibleTileSet *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  void *v34;
  id v35;
  uint64_t v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  GEORPAuxiliaryControl *v47;
  uint64_t v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  GEORPCurrentEnvironmentManifestURLs *v56;
  uint64_t v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  GEORPNavigationSettings *v61;
  uint64_t v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  GEORPSourceInfo *v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  void *v70;
  GEORPSearchCommonContext *v71;
  uint64_t v72;
  void *v73;
  const __CFString *v74;
  void *v75;
  GEOABAssignmentResponse *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  GEORPUserPath *v83;
  uint64_t v84;
  void *v85;
  void *v87;
  void *v88;
  id v89;
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
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_273;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("pinType");
    else
      v7 = CFSTR("pin_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PIN_TYPE_UNKNOWN")) & 1) != 0)
      {
        v10 = 0xFFFFFFFFLL;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SEARCH_RESULT")) & 1) != 0)
      {
        v10 = 0;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("POI_ICON")) & 1) != 0)
      {
        v10 = 1;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("DROPPED_PIN")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CONTACT")) & 1) != 0)
      {
        v10 = 3;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("CURRENT_LOCATION")) & 1) != 0)
      {
        v10 = 4;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BOOKMARK")) & 1) != 0)
      {
        v10 = 5;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("EXTERNAL")) & 1) != 0)
      {
        v10 = 6;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("PIN_TYPE_SEARCH_AUTOCOMPLETE")) & 1) != 0)
      {
        v10 = 7;
      }
      else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("BRAND_ICON")) & 1) != 0)
      {
        v10 = 8;
      }
      else if (objc_msgSend(v9, "isEqualToString:", CFSTR("SHARED_LOCATION")))
      {
        v10 = 9;
      }
      else
      {
        v10 = 0xFFFFFFFFLL;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_34:

        if (a3)
          v11 = CFSTR("mapLocation");
        else
          v11 = CFSTR("map_location");
        objc_msgSend(v5, "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = [GEORPMapLocation alloc];
          if ((a3 & 1) != 0)
            v14 = -[GEORPMapLocation initWithJSON:](v13, "initWithJSON:", v12);
          else
            v14 = -[GEORPMapLocation initWithDictionary:](v13, "initWithDictionary:", v12);
          v15 = (void *)v14;
          objc_msgSend(v6, "setMapLocation:", v14);

        }
        if (a3)
          v16 = CFSTR("visibleTileSet");
        else
          v16 = CFSTR("visible_tile_set");
        objc_msgSend(v5, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v89 = v5;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          v87 = v17;
          v18 = v17;
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v99;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v99 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(_QWORD *)(*((_QWORD *)&v98 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v24 = [GEORPVisibleTileSet alloc];
                  if ((a3 & 1) != 0)
                    v25 = -[GEORPVisibleTileSet initWithJSON:](v24, "initWithJSON:", v23);
                  else
                    v25 = -[GEORPVisibleTileSet initWithDictionary:](v24, "initWithDictionary:", v23);
                  v26 = (void *)v25;
                  objc_msgSend(v6, "addVisibleTileSet:", v25, v87);

                }
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v98, v104, 16);
            }
            while (v20);
          }

          v17 = v87;
          v5 = v89;
        }

        if (a3)
          v27 = CFSTR("userPath");
        else
          v27 = CFSTR("user_path");
        objc_msgSend(v5, "objectForKeyedSubscript:", v27, v87);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v88 = v28;
          v29 = v28;
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
          if (!v30)
            goto LABEL_186;
          v31 = v30;
          v32 = *(_QWORD *)v95;
          while (1)
          {
            for (j = 0; j != v31; ++j)
            {
              if (*(_QWORD *)v95 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v35 = v34;
                if ((objc_msgSend(v35, "isEqualToString:", CFSTR("USER_PATH_ITEM_UNKNOWN")) & 1) != 0)
                {
                  v36 = 0;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("PLACE_PROBLEM")) & 1) != 0)
                {
                  v36 = 1;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("MAP_PROBLEM")) & 1) != 0)
                {
                  v36 = 2;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADDRESS_EDIT")) & 1) != 0)
                {
                  v36 = 3;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADDRESS_EDIT_LABEL")) & 1) != 0)
                {
                  v36 = 4;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_PICKER_CORRECT_COORDINATE")) & 1) != 0)
                {
                  v36 = 5;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_FEATURE")) & 1) != 0)
                {
                  v36 = 6;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_COORDINATE")) & 1) != 0)
                {
                  v36 = 7;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_REGION")) & 1) != 0)
                {
                  v36 = 8;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_CLOSED")) & 1) != 0)
                {
                  v36 = 9;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("COMMENTS_AND_PHOTO")) & 1) != 0)
                {
                  v36 = 10;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_RESULTS")) & 1) != 0)
                {
                  v36 = 11;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SATELLITE_IMAGE")) & 1) != 0)
                {
                  v36 = 12;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
                {
                  v36 = 13;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
                {
                  v36 = 14;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("DIRECTIONS_STEPS")) & 1) != 0)
                {
                  v36 = 15;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("GUIDANCE")) & 1) != 0)
                {
                  v36 = 16;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
                {
                  v36 = 17;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("DIRECTIONS_ROUTE_PICKER")) & 1) != 0)
                {
                  v36 = 18;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_MAP_PROBLEM")) & 1) != 0)
                {
                  v36 = 19;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_DIRECTIONS_PROBLEM")) & 1) != 0)
                {
                  v36 = 20;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_STATION_PROBLEM")) & 1) != 0)
                {
                  v36 = 21;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_TRANSFER_PICKER")) & 1) != 0)
                {
                  v36 = 22;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_LINE_PICKER")) & 1) != 0)
                {
                  v36 = 23;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_LINE_DISPLAY_PROBLEM")) & 1) != 0)
                {
                  v36 = 24;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_STATION_PICKER")) & 1) != 0)
                {
                  v36 = 25;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_LINE_SERVICE_CHANGE")) & 1) != 0)
                {
                  v36 = 26;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_LINE_SCHEDULES")) & 1) != 0)
                {
                  v36 = 27;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_BAD_ROUTE_SUGGESTIONS")) & 1) != 0)
                {
                  v36 = 28;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT")) & 1) != 0)
                {
                  v36 = 29;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_SUBCATEGORY_PICKER")) & 1) != 0)
                {
                  v36 = 30;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION")) & 1) != 0)
                {
                  v36 = 31;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_ADD")) & 1) != 0)
                {
                  v36 = 32;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("IM_LOST")) & 1) != 0)
                {
                  v36 = 33;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE")) & 1) != 0)
                {
                  v36 = 40;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_LINE_NAME_INCORRECT")) & 1) != 0)
                {
                  v36 = 41;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_LINE_SHAPE_INCORRECT")) & 1) != 0)
                {
                  v36 = 42;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS")) & 1) != 0)
                {
                  v36 = 43;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BAD_DIRECTIONS_ROUTE_WRONG")) & 1) != 0)
                {
                  v36 = 44;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BAD_DIRECTIONS_INCORRECT_ETA")) & 1) != 0)
                {
                  v36 = 45;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT")) & 1) != 0)
                {
                  v36 = 46;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT_PICKER")) & 1) != 0)
                {
                  v36 = 47;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("PERSONALIZED_MAP_CORRECTION")) & 1) != 0)
                {
                  v36 = 48;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("WHICH_PERSONALIZED_MAP_ADDRESS")) & 1) != 0)
                {
                  v36 = 49;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("PERSONALIZED_MAP_PLACE_PROBLEM")) & 1) != 0)
                {
                  v36 = 50;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADD_A_PLACE_TYPE_SELECTION")) & 1) != 0)
                {
                  v36 = 51;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME")) & 1) != 0)
                {
                  v36 = 52;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("PLACE_CATEGORY_SELECTION")) & 1) != 0)
                {
                  v36 = 53;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("TAKE_PHOTO")) & 1) != 0)
                {
                  v36 = 54;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ROUTING_TRAY")) & 1) != 0)
                {
                  v36 = 55;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BRAND_PROBLEM")) & 1) != 0)
                {
                  v36 = 56;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("BRAND_CORRECTIONS")) & 1) != 0)
                {
                  v36 = 57;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADDRESS_INFO")) & 1) != 0)
                {
                  v36 = 58;
                }
                else if ((objc_msgSend(v35, "isEqualToString:", CFSTR("ADDRESS_SEARCH")) & 1) != 0)
                {
                  v36 = 59;
                }
                else if (objc_msgSend(v35, "isEqualToString:", CFSTR("CURATED_COLLECTION_PROBLEM")))
                {
                  v36 = 60;
                }
                else
                {
                  v36 = 0;
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                v36 = objc_msgSend(v34, "intValue");
              }
              objc_msgSend(v6, "addUserPath:", v36, v88);
            }
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v94, v103, 16);
            if (!v31)
            {
LABEL_186:

              v28 = v88;
              v5 = v89;
              break;
            }
          }
        }

        if (a3)
          v37 = CFSTR("clientCreatedAt");
        else
          v37 = CFSTR("client_created_at");
        objc_msgSend(v5, "objectForKeyedSubscript:", v37, v88);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v38, "doubleValue");
          objc_msgSend(v6, "setClientCreatedAt:");
        }

        if (a3)
          v39 = CFSTR("auxiliaryControl");
        else
          v39 = CFSTR("auxiliary_control");
        objc_msgSend(v5, "objectForKeyedSubscript:", v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v41 = v40;
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v91;
            do
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v91 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v47 = [GEORPAuxiliaryControl alloc];
                  if ((a3 & 1) != 0)
                    v48 = -[GEORPAuxiliaryControl initWithJSON:](v47, "initWithJSON:", v46);
                  else
                    v48 = -[GEORPAuxiliaryControl initWithDictionary:](v47, "initWithDictionary:", v46);
                  v49 = (void *)v48;
                  objc_msgSend(v6, "addAuxiliaryControl:", v48);

                }
              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v90, v102, 16);
            }
            while (v43);
          }

          v5 = v89;
        }

        if (a3)
          v50 = CFSTR("originatingAuxiliaryControlIndex");
        else
          v50 = CFSTR("originating_auxiliary_control_index");
        objc_msgSend(v5, "objectForKeyedSubscript:", v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setOriginatingAuxiliaryControlIndex:", objc_msgSend(v51, "unsignedLongLongValue"));

        if (a3)
          v52 = CFSTR("deviceGmtOffset");
        else
          v52 = CFSTR("device_gmt_offset");
        objc_msgSend(v5, "objectForKeyedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setDeviceGmtOffset:", objc_msgSend(v53, "intValue"));

        if (a3)
          v54 = CFSTR("currentEnvironmentManifestUrls");
        else
          v54 = CFSTR("current_environment_manifest_urls");
        objc_msgSend(v5, "objectForKeyedSubscript:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v56 = [GEORPCurrentEnvironmentManifestURLs alloc];
          if ((a3 & 1) != 0)
            v57 = -[GEORPCurrentEnvironmentManifestURLs initWithJSON:](v56, "initWithJSON:", v55);
          else
            v57 = -[GEORPCurrentEnvironmentManifestURLs initWithDictionary:](v56, "initWithDictionary:", v55);
          v58 = (void *)v57;
          objc_msgSend(v6, "setCurrentEnvironmentManifestUrls:", v57);

        }
        if (a3)
          v59 = CFSTR("navigationSettings");
        else
          v59 = CFSTR("navigation_settings");
        objc_msgSend(v5, "objectForKeyedSubscript:", v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v61 = [GEORPNavigationSettings alloc];
          if ((a3 & 1) != 0)
            v62 = -[GEORPNavigationSettings initWithJSON:](v61, "initWithJSON:", v60);
          else
            v62 = -[GEORPNavigationSettings initWithDictionary:](v61, "initWithDictionary:", v60);
          v63 = (void *)v62;
          objc_msgSend(v6, "setNavigationSettings:", v62);

        }
        if (a3)
          v64 = CFSTR("sourceInfo");
        else
          v64 = CFSTR("source_info");
        objc_msgSend(v5, "objectForKeyedSubscript:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v66 = [GEORPSourceInfo alloc];
          if ((a3 & 1) != 0)
            v67 = -[GEORPSourceInfo initWithJSON:](v66, "initWithJSON:", v65);
          else
            v67 = -[GEORPSourceInfo initWithDictionary:](v66, "initWithDictionary:", v65);
          v68 = (void *)v67;
          objc_msgSend(v6, "setSourceInfo:", v67);

        }
        if (a3)
          v69 = CFSTR("searchCommon");
        else
          v69 = CFSTR("search_common");
        objc_msgSend(v5, "objectForKeyedSubscript:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v71 = [GEORPSearchCommonContext alloc];
          if ((a3 & 1) != 0)
            v72 = -[GEORPSearchCommonContext initWithJSON:](v71, "initWithJSON:", v70);
          else
            v72 = -[GEORPSearchCommonContext initWithDictionary:](v71, "initWithDictionary:", v70);
          v73 = (void *)v72;
          objc_msgSend(v6, "setSearchCommon:", v72);

        }
        if (a3)
          v74 = CFSTR("currentAbAssignmentResponse");
        else
          v74 = CFSTR("current_ab_assignment_response");
        objc_msgSend(v5, "objectForKeyedSubscript:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v76 = [GEOABAssignmentResponse alloc];
          if ((a3 & 1) != 0)
            v77 = -[GEOABAssignmentResponse initWithJSON:](v76, "initWithJSON:", v75);
          else
            v77 = -[GEOABAssignmentResponse initWithDictionary:](v76, "initWithDictionary:", v75);
          v78 = (void *)v77;
          objc_msgSend(v6, "setCurrentAbAssignmentResponse:", v77);

        }
        if (a3)
          v79 = CFSTR("isSprMap");
        else
          v79 = CFSTR("is_spr_map");
        objc_msgSend(v5, "objectForKeyedSubscript:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v6, "setIsSprMap:", objc_msgSend(v80, "BOOLValue"));

        if (a3)
          v81 = CFSTR("combinedUserPath");
        else
          v81 = CFSTR("combined_user_path");
        objc_msgSend(v5, "objectForKeyedSubscript:", v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v83 = [GEORPUserPath alloc];
          if ((a3 & 1) != 0)
            v84 = -[GEORPUserPath initWithJSON:](v83, "initWithJSON:", v82);
          else
            v84 = -[GEORPUserPath initWithDictionary:](v83, "initWithDictionary:", v82);
          v85 = (void *)v84;
          objc_msgSend(v6, "setCombinedUserPath:", v84);

        }
        goto LABEL_273;
      }
      v10 = objc_msgSend(v8, "intValue");
    }
    objc_msgSend(v6, "setPinType:", v10);
    goto LABEL_34;
  }
LABEL_273:

  return v6;
}

- (GEORPFeedbackCommonContext)initWithJSON:(id)a3
{
  return (GEORPFeedbackCommonContext *)-[GEORPFeedbackCommonContext _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_892;
    else
      v8 = (int *)&readAll__nonRecursiveTag_893;
    GEORPFeedbackCommonContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORPFeedbackCommonContextCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackCommonContextIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackCommonContextReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  unint64_t v10;
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  $B40C2BF14A359B44A88B8C46D0584055 flags;
  PBDataReader *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackCommonContextIsDirty((uint64_t)self) & 1) == 0)
  {
    v16 = self->_reader;
    objc_sync_enter(v16);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v17);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v16);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackCommonContext readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_mapLocation)
      PBDataWriterWriteSubmessage();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = self->_visibleTileSets;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v23 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v7);
    }

    if (self->_userPaths.count)
    {
      v10 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v10;
      }
      while (v10 < self->_userPaths.count);
    }
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteDoubleField();
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = self->_auxiliaryControls;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v11);
          PBDataWriterWriteSubmessage();
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v12);
    }

    flags = self->_flags;
    if ((*(_BYTE *)&flags & 2) != 0)
    {
      PBDataWriterWriteUint64Field();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 4) != 0)
      PBDataWriterWriteSint32Field();
    if (self->_currentEnvironmentManifestUrls)
      PBDataWriterWriteSubmessage();
    if (self->_navigationSettings)
      PBDataWriterWriteSubmessage();
    if (self->_sourceInfo)
      PBDataWriterWriteSubmessage();
    if (self->_searchCommon)
      PBDataWriterWriteSubmessage();
    if (self->_currentAbAssignmentResponse)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 0x10) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_combinedUserPath)
      PBDataWriterWriteSubmessage();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v18);
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackCommonContext _readMapLocation]((uint64_t)self);
  return -[GEORPMapLocation hasGreenTeaWithValue:](self->_mapLocation, "hasGreenTeaWithValue:", v3);
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
  unint64_t v11;
  unint64_t v12;
  uint64_t k;
  void *v14;
  $B40C2BF14A359B44A88B8C46D0584055 flags;
  id *v16;
  id *v17;

  v17 = (id *)a3;
  -[GEORPFeedbackCommonContext readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v17 + 1, self->_reader);
  *((_DWORD *)v17 + 34) = self->_readerMarkPos;
  *((_DWORD *)v17 + 35) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *((_DWORD *)v17 + 38) = self->_pinType;
    *((_DWORD *)v17 + 40) |= 8u;
  }
  if (self->_mapLocation)
    objc_msgSend(v17, "setMapLocation:");
  if (-[GEORPFeedbackCommonContext visibleTileSetsCount](self, "visibleTileSetsCount"))
  {
    objc_msgSend(v17, "clearVisibleTileSets");
    v4 = -[GEORPFeedbackCommonContext visibleTileSetsCount](self, "visibleTileSetsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackCommonContext visibleTileSetAtIndex:](self, "visibleTileSetAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addVisibleTileSet:", v7);

      }
    }
  }
  if (-[GEORPFeedbackCommonContext userPathsCount](self, "userPathsCount"))
  {
    objc_msgSend(v17, "clearUserPaths");
    v8 = -[GEORPFeedbackCommonContext userPathsCount](self, "userPathsCount");
    if (v8)
    {
      v9 = v8;
      for (j = 0; j != v9; ++j)
        objc_msgSend(v17, "addUserPath:", -[GEORPFeedbackCommonContext userPathAtIndex:](self, "userPathAtIndex:", j));
    }
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v17[7] = *(id *)&self->_clientCreatedAt;
    *((_DWORD *)v17 + 40) |= 1u;
  }
  if (-[GEORPFeedbackCommonContext auxiliaryControlsCount](self, "auxiliaryControlsCount"))
  {
    objc_msgSend(v17, "clearAuxiliaryControls");
    v11 = -[GEORPFeedbackCommonContext auxiliaryControlsCount](self, "auxiliaryControlsCount");
    if (v11)
    {
      v12 = v11;
      for (k = 0; k != v12; ++k)
      {
        -[GEORPFeedbackCommonContext auxiliaryControlAtIndex:](self, "auxiliaryControlAtIndex:", k);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addAuxiliaryControl:", v14);

      }
    }
  }
  flags = self->_flags;
  v16 = v17;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v17[13] = (id)self->_originatingAuxiliaryControlIndex;
    *((_DWORD *)v17 + 40) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *((_DWORD *)v17 + 37) = self->_deviceGmtOffset;
    *((_DWORD *)v17 + 40) |= 4u;
  }
  if (self->_currentEnvironmentManifestUrls)
  {
    objc_msgSend(v17, "setCurrentEnvironmentManifestUrls:");
    v16 = v17;
  }
  if (self->_navigationSettings)
  {
    objc_msgSend(v17, "setNavigationSettings:");
    v16 = v17;
  }
  if (self->_sourceInfo)
  {
    objc_msgSend(v17, "setSourceInfo:");
    v16 = v17;
  }
  if (self->_searchCommon)
  {
    objc_msgSend(v17, "setSearchCommon:");
    v16 = v17;
  }
  if (self->_currentAbAssignmentResponse)
  {
    objc_msgSend(v17, "setCurrentAbAssignmentResponse:");
    v16 = v17;
  }
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *((_BYTE *)v16 + 156) = self->_isSprMap;
    *((_DWORD *)v16 + 40) |= 0x10u;
  }
  if (self->_combinedUserPath)
  {
    objc_msgSend(v17, "setCombinedUserPath:");
    v16 = v17;
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
  $B40C2BF14A359B44A88B8C46D0584055 flags;
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
  PBUnknownFields *v34;
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
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
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
      GEORPFeedbackCommonContextReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackCommonContext readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    *(_DWORD *)(v5 + 152) = self->_pinType;
    *(_DWORD *)(v5 + 160) |= 8u;
  }
  v9 = -[GEORPMapLocation copyWithZone:](self->_mapLocation, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v9;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v11 = self->_visibleTileSets;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v41 != v13)
          objc_enumerationMutation(v11);
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend((id)v5, "addVisibleTileSet:", v15);

      }
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v12);
  }

  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(double *)(v5 + 56) = self->_clientCreatedAt;
    *(_DWORD *)(v5 + 160) |= 1u;
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v16 = self->_auxiliaryControls;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v37 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v36);
        objc_msgSend((id)v5, "addAuxiliaryControl:", v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v17);
  }

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_QWORD *)(v5 + 104) = self->_originatingAuxiliaryControlIndex;
    *(_DWORD *)(v5 + 160) |= 2u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 148) = self->_deviceGmtOffset;
    *(_DWORD *)(v5 + 160) |= 4u;
  }
  v22 = -[GEORPCurrentEnvironmentManifestURLs copyWithZone:](self->_currentEnvironmentManifestUrls, "copyWithZone:", a3, (_QWORD)v36);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  v24 = -[GEORPNavigationSettings copyWithZone:](self->_navigationSettings, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v24;

  v26 = -[GEORPSourceInfo copyWithZone:](self->_sourceInfo, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v26;

  v28 = -[GEORPSearchCommonContext copyWithZone:](self->_searchCommon, "copyWithZone:", a3);
  v29 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v28;

  v30 = -[GEOABAssignmentResponse copyWithZone:](self->_currentAbAssignmentResponse, "copyWithZone:", a3);
  v31 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v30;

  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    *(_BYTE *)(v5 + 156) = self->_isSprMap;
    *(_DWORD *)(v5 + 160) |= 0x10u;
  }
  v32 = -[GEORPUserPath copyWithZone:](self->_combinedUserPath, "copyWithZone:", a3);
  v33 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v32;

  v34 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v34;
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  GEORPMapLocation *mapLocation;
  NSMutableArray *visibleTileSets;
  $B40C2BF14A359B44A88B8C46D0584055 flags;
  int v9;
  NSMutableArray *auxiliaryControls;
  GEORPCurrentEnvironmentManifestURLs *currentEnvironmentManifestUrls;
  GEORPNavigationSettings *navigationSettings;
  GEORPSourceInfo *sourceInfo;
  GEORPSearchCommonContext *searchCommon;
  GEOABAssignmentResponse *currentAbAssignmentResponse;
  int v16;
  char v17;
  GEORPUserPath *combinedUserPath;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  -[GEORPFeedbackCommonContext readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_pinType != *((_DWORD *)v4 + 38))
      goto LABEL_44;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_44;
  }
  mapLocation = self->_mapLocation;
  if ((unint64_t)mapLocation | *((_QWORD *)v4 + 11) && !-[GEORPMapLocation isEqual:](mapLocation, "isEqual:"))
    goto LABEL_44;
  visibleTileSets = self->_visibleTileSets;
  if ((unint64_t)visibleTileSets | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](visibleTileSets, "isEqual:"))
      goto LABEL_44;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_44;
  flags = self->_flags;
  v9 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_clientCreatedAt != *((double *)v4 + 7))
      goto LABEL_44;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_44;
  }
  auxiliaryControls = self->_auxiliaryControls;
  if ((unint64_t)auxiliaryControls | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](auxiliaryControls, "isEqual:"))
      goto LABEL_44;
    flags = self->_flags;
    v9 = *((_DWORD *)v4 + 40);
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_originatingAuxiliaryControlIndex != *((_QWORD *)v4 + 13))
      goto LABEL_44;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_deviceGmtOffset != *((_DWORD *)v4 + 37))
      goto LABEL_44;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_44;
  }
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  if ((unint64_t)currentEnvironmentManifestUrls | *((_QWORD *)v4 + 10)
    && !-[GEORPCurrentEnvironmentManifestURLs isEqual:](currentEnvironmentManifestUrls, "isEqual:"))
  {
    goto LABEL_44;
  }
  navigationSettings = self->_navigationSettings;
  if ((unint64_t)navigationSettings | *((_QWORD *)v4 + 12))
  {
    if (!-[GEORPNavigationSettings isEqual:](navigationSettings, "isEqual:"))
      goto LABEL_44;
  }
  sourceInfo = self->_sourceInfo;
  if ((unint64_t)sourceInfo | *((_QWORD *)v4 + 15))
  {
    if (!-[GEORPSourceInfo isEqual:](sourceInfo, "isEqual:"))
      goto LABEL_44;
  }
  searchCommon = self->_searchCommon;
  if ((unint64_t)searchCommon | *((_QWORD *)v4 + 14))
  {
    if (!-[GEORPSearchCommonContext isEqual:](searchCommon, "isEqual:"))
      goto LABEL_44;
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  if ((unint64_t)currentAbAssignmentResponse | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOABAssignmentResponse isEqual:](currentAbAssignmentResponse, "isEqual:"))
      goto LABEL_44;
  }
  v16 = *((_DWORD *)v4 + 40);
  if ((*(_BYTE *)&self->_flags & 0x10) == 0)
  {
    if ((v16 & 0x10) == 0)
      goto LABEL_50;
LABEL_44:
    v17 = 0;
    goto LABEL_45;
  }
  if ((v16 & 0x10) == 0)
    goto LABEL_44;
  if (!self->_isSprMap)
  {
    if (!*((_BYTE *)v4 + 156))
      goto LABEL_50;
    goto LABEL_44;
  }
  if (!*((_BYTE *)v4 + 156))
    goto LABEL_44;
LABEL_50:
  combinedUserPath = self->_combinedUserPath;
  if ((unint64_t)combinedUserPath | *((_QWORD *)v4 + 8))
    v17 = -[GEORPUserPath isEqual:](combinedUserPath, "isEqual:");
  else
    v17 = 1;
LABEL_45:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  double clientCreatedAt;
  double v5;
  long double v6;
  double v7;
  $B40C2BF14A359B44A88B8C46D0584055 flags;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;

  -[GEORPFeedbackCommonContext readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v24 = 2654435761 * self->_pinType;
  else
    v24 = 0;
  v23 = -[GEORPMapLocation hash](self->_mapLocation, "hash");
  v22 = -[NSMutableArray hash](self->_visibleTileSets, "hash");
  v21 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    clientCreatedAt = self->_clientCreatedAt;
    v5 = -clientCreatedAt;
    if (clientCreatedAt >= 0.0)
      v5 = self->_clientCreatedAt;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v20 = v3;
  v18 = -[NSMutableArray hash](self->_auxiliaryControls, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    v9 = 2654435761u * self->_originatingAuxiliaryControlIndex;
    if ((*(_BYTE *)&flags & 4) != 0)
      goto LABEL_14;
  }
  else
  {
    v9 = 0;
    if ((*(_BYTE *)&flags & 4) != 0)
    {
LABEL_14:
      v10 = 2654435761 * self->_deviceGmtOffset;
      goto LABEL_17;
    }
  }
  v10 = 0;
LABEL_17:
  v11 = -[GEORPCurrentEnvironmentManifestURLs hash](self->_currentEnvironmentManifestUrls, "hash", v18);
  v12 = -[GEORPNavigationSettings hash](self->_navigationSettings, "hash");
  v13 = -[GEORPSourceInfo hash](self->_sourceInfo, "hash");
  v14 = -[GEORPSearchCommonContext hash](self->_searchCommon, "hash");
  v15 = -[GEOABAssignmentResponse hash](self->_currentAbAssignmentResponse, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
    v16 = 2654435761 * self->_isSprMap;
  else
    v16 = 0;
  return v23 ^ v24 ^ v22 ^ v21 ^ v20 ^ v19 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[GEORPUserPath hash](self->_combinedUserPath, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPMapLocation *mapLocation;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  int v20;
  GEORPCurrentEnvironmentManifestURLs *currentEnvironmentManifestUrls;
  uint64_t v22;
  GEORPNavigationSettings *navigationSettings;
  uint64_t v24;
  GEORPSourceInfo *sourceInfo;
  uint64_t v26;
  GEORPSearchCommonContext *searchCommon;
  uint64_t v28;
  GEOABAssignmentResponse *currentAbAssignmentResponse;
  uint64_t v30;
  GEORPUserPath *combinedUserPath;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 160) & 8) != 0)
  {
    self->_pinType = *((_DWORD *)v4 + 38);
    *(_DWORD *)&self->_flags |= 8u;
  }
  mapLocation = self->_mapLocation;
  v6 = *((_QWORD *)v4 + 11);
  if (mapLocation)
  {
    if (v6)
      -[GEORPMapLocation mergeFrom:](mapLocation, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPFeedbackCommonContext setMapLocation:](self, "setMapLocation:");
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = *((id *)v4 + 16);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v38 != v10)
          objc_enumerationMutation(v7);
        -[GEORPFeedbackCommonContext addVisibleTileSet:](self, "addVisibleTileSet:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v9);
  }

  v12 = objc_msgSend(v4, "userPathsCount");
  if (v12)
  {
    v13 = v12;
    for (j = 0; j != v13; ++j)
      -[GEORPFeedbackCommonContext addUserPath:](self, "addUserPath:", objc_msgSend(v4, "userPathAtIndex:", j));
  }
  if ((*((_BYTE *)v4 + 160) & 1) != 0)
  {
    self->_clientCreatedAt = *((double *)v4 + 7);
    *(_DWORD *)&self->_flags |= 1u;
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = *((id *)v4 + 6);
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        -[GEORPFeedbackCommonContext addAuxiliaryControl:](self, "addAuxiliaryControl:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * k), (_QWORD)v33);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v17);
  }

  v20 = *((_DWORD *)v4 + 40);
  if ((v20 & 2) != 0)
  {
    self->_originatingAuxiliaryControlIndex = *((_QWORD *)v4 + 13);
    *(_DWORD *)&self->_flags |= 2u;
    v20 = *((_DWORD *)v4 + 40);
  }
  if ((v20 & 4) != 0)
  {
    self->_deviceGmtOffset = *((_DWORD *)v4 + 37);
    *(_DWORD *)&self->_flags |= 4u;
  }
  currentEnvironmentManifestUrls = self->_currentEnvironmentManifestUrls;
  v22 = *((_QWORD *)v4 + 10);
  if (currentEnvironmentManifestUrls)
  {
    if (v22)
      -[GEORPCurrentEnvironmentManifestURLs mergeFrom:](currentEnvironmentManifestUrls, "mergeFrom:");
  }
  else if (v22)
  {
    -[GEORPFeedbackCommonContext setCurrentEnvironmentManifestUrls:](self, "setCurrentEnvironmentManifestUrls:");
  }
  navigationSettings = self->_navigationSettings;
  v24 = *((_QWORD *)v4 + 12);
  if (navigationSettings)
  {
    if (v24)
      -[GEORPNavigationSettings mergeFrom:](navigationSettings, "mergeFrom:");
  }
  else if (v24)
  {
    -[GEORPFeedbackCommonContext setNavigationSettings:](self, "setNavigationSettings:");
  }
  sourceInfo = self->_sourceInfo;
  v26 = *((_QWORD *)v4 + 15);
  if (sourceInfo)
  {
    if (v26)
      -[GEORPSourceInfo mergeFrom:](sourceInfo, "mergeFrom:");
  }
  else if (v26)
  {
    -[GEORPFeedbackCommonContext setSourceInfo:](self, "setSourceInfo:");
  }
  searchCommon = self->_searchCommon;
  v28 = *((_QWORD *)v4 + 14);
  if (searchCommon)
  {
    if (v28)
      -[GEORPSearchCommonContext mergeFrom:](searchCommon, "mergeFrom:");
  }
  else if (v28)
  {
    -[GEORPFeedbackCommonContext setSearchCommon:](self, "setSearchCommon:");
  }
  currentAbAssignmentResponse = self->_currentAbAssignmentResponse;
  v30 = *((_QWORD *)v4 + 9);
  if (currentAbAssignmentResponse)
  {
    if (v30)
      -[GEOABAssignmentResponse mergeFrom:](currentAbAssignmentResponse, "mergeFrom:");
  }
  else if (v30)
  {
    -[GEORPFeedbackCommonContext setCurrentAbAssignmentResponse:](self, "setCurrentAbAssignmentResponse:");
  }
  if ((*((_BYTE *)v4 + 160) & 0x10) != 0)
  {
    self->_isSprMap = *((_BYTE *)v4 + 156);
    *(_DWORD *)&self->_flags |= 0x10u;
  }
  combinedUserPath = self->_combinedUserPath;
  v32 = *((_QWORD *)v4 + 8);
  if (combinedUserPath)
  {
    if (v32)
      -[GEORPUserPath mergeFrom:](combinedUserPath, "mergeFrom:");
  }
  else if (v32)
  {
    -[GEORPFeedbackCommonContext setCombinedUserPath:](self, "setCombinedUserPath:");
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 0x20) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEORPFeedbackCommonContextReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_896);
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
  *(_DWORD *)&self->_flags |= 0x10020u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEORPFeedbackCommonContext readAll:](self, "readAll:", 0);
    -[GEORPSourceInfo clearUnknownFields:](self->_sourceInfo, "clearUnknownFields:", 1);
    -[GEORPSearchCommonContext clearUnknownFields:](self->_searchCommon, "clearUnknownFields:", 1);
    -[GEOABAssignmentResponse clearUnknownFields:](self->_currentAbAssignmentResponse, "clearUnknownFields:", 1);
    -[GEORPUserPath clearUnknownFields:](self->_combinedUserPath, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleTileSets, 0);
  objc_storeStrong((id *)&self->_sourceInfo, 0);
  objc_storeStrong((id *)&self->_searchCommon, 0);
  objc_storeStrong((id *)&self->_navigationSettings, 0);
  objc_storeStrong((id *)&self->_mapLocation, 0);
  objc_storeStrong((id *)&self->_currentEnvironmentManifestUrls, 0);
  objc_storeStrong((id *)&self->_currentAbAssignmentResponse, 0);
  objc_storeStrong((id *)&self->_combinedUserPath, 0);
  objc_storeStrong((id *)&self->_auxiliaryControls, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

- (void)recordEnvironmentAndManifestURLs
{
  GEORPCurrentEnvironmentManifestURLs *v3;
  void *v4;
  id v5;

  v3 = objc_alloc_init(GEORPCurrentEnvironmentManifestURLs);
  -[GEORPFeedbackCommonContext setCurrentEnvironmentManifestUrls:](self, "setCurrentEnvironmentManifestUrls:", v3);

  -[GEORPFeedbackCommonContext currentEnvironmentManifestUrls](self, "currentEnvironmentManifestUrls");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackCommonContext _recordCurrentEnvironment:](self, "_recordCurrentEnvironment:", v4);

  -[GEORPFeedbackCommonContext currentEnvironmentManifestUrls](self, "currentEnvironmentManifestUrls");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackCommonContext _recordManifestURLs:](self, "_recordManifestURLs:", v5);

}

- (void)_recordCurrentEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  +[GEOResourceManifestConfiguration defaultConfiguration](GEOResourceManifestConfiguration, "defaultConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "environment");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTileGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "releaseInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeTileGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%i"), objc_msgSend(v10, "identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "setEnvironmentDisplayName:", v11);
  objc_msgSend(v3, "setEnvironmentReleaseName:", v7);

}

- (void)_recordManifestURLs:(id)a3
{
  unint64_t i;
  GEORPManifestURL *v4;
  GEORPManifestURL *v5;
  __CFString *v6;
  void *v7;
  id v8;

  v8 = a3;
  for (i = 0; i != 66; ++i)
  {
    if (i - 23 < 0x2B || i <= 0x15 && ((1 << i) & 0x3DDE27) != 0)
    {
      v4 = objc_alloc_init(GEORPManifestURL);
      v5 = v4;
      if (i > 0x41)
        v6 = 0;
      else
        v6 = off_1E1C21110[i];
      -[GEORPManifestURL setUrlName:](v4, "setUrlName:", v6);
      _GEOGetURLWithSource(i, 0, 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEORPManifestURL setUrlValue:](v5, "setUrlValue:", v7);

      objc_msgSend(v8, "addUrl:", v5);
    }
  }

}

@end
