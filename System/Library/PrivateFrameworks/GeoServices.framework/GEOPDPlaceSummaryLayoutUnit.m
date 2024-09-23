@implementation GEOPDPlaceSummaryLayoutUnit

- (GEOPDPlaceSummaryLayoutUnit)init
{
  GEOPDPlaceSummaryLayoutUnit *v2;
  GEOPDPlaceSummaryLayoutUnit *v3;
  GEOPDPlaceSummaryLayoutUnit *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceSummaryLayoutUnit;
  v2 = -[GEOPDPlaceSummaryLayoutUnit init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceSummaryLayoutUnit)initWithData:(id)a3
{
  GEOPDPlaceSummaryLayoutUnit *v3;
  GEOPDPlaceSummaryLayoutUnit *v4;
  GEOPDPlaceSummaryLayoutUnit *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceSummaryLayoutUnit;
  v3 = -[GEOPDPlaceSummaryLayoutUnit initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  $DCB87D87C041D9304E9B2281701D2ADF flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((*(_BYTE *)&flags & 2) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000002uLL;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (a3)
    v3 = 0x4000000002;
  self->_flags = ($DCB87D87C041D9304E9B2281701D2ADF)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasType
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (id)typeAsString:(int)a3
{
  if (a3 < 0x24)
    return off_1E1C0E3A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NAME")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOURS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RATINGS")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_SHIELDS")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_GENERATED_GUIDES")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CURATED_GUIDES")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("EV_CHARGERS_NUMBER")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UGC_USER_SUBMITTED_RECOMMENDATIONS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SERVER_OVERRIDE")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTAINMENT")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("RECENT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHLIGHT_MAIN")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHLIGHT_EXTRA")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_NAME_FOR_GUIDE")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NUM_PLACES_IN_GUIDE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PUBLISHER_DESCRIPTION")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECONDARY_NAME")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FACTOID")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ARP_RATINGS")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAL_TIME_EV_CHARGER_AVAILABILITY")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DETOUR_TIME")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKING_TRAIL_LENGTH")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PHOTO_CAROUSEL")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IN_USER_LIBRARY")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_NOTE")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_TYPE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_DURATION")) & 1) != 0)
  {
    v4 = 34;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIKE_ROUTE_LENGTH")))
  {
    v4 = 35;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_13);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasName
{
  -[GEOPDPlaceSummaryLayoutUnit _readName]((uint64_t)self);
  return self->_name != 0;
}

- (GEOPDPlaceSummaryLayoutUnitName)name
{
  -[GEOPDPlaceSummaryLayoutUnit _readName]((uint64_t)self);
  return self->_name;
}

- (void)setName:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000400000uLL;
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)_readCategory
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 324) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategory_tags_3);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasCategory
{
  -[GEOPDPlaceSummaryLayoutUnit _readCategory]((uint64_t)self);
  return self->_category != 0;
}

- (GEOPDPlaceSummaryLayoutUnitCategory)category
{
  -[GEOPDPlaceSummaryLayoutUnit _readCategory]((uint64_t)self);
  return self->_category;
}

- (void)setCategory:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000020uLL;
  objc_storeStrong((id *)&self->_category, a3);
}

- (void)_readDistance
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDistance_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasDistance
{
  -[GEOPDPlaceSummaryLayoutUnit _readDistance]((uint64_t)self);
  return self->_distance != 0;
}

- (GEOPDPlaceSummaryLayoutUnitDistance)distance
{
  -[GEOPDPlaceSummaryLayoutUnit _readDistance]((uint64_t)self);
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000200uLL;
  objc_storeStrong((id *)&self->_distance, a3);
}

- (void)_readPrice
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPrice_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPrice
{
  -[GEOPDPlaceSummaryLayoutUnit _readPrice]((uint64_t)self);
  return self->_price != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPrice)price
{
  -[GEOPDPlaceSummaryLayoutUnit _readPrice]((uint64_t)self);
  return self->_price;
}

- (void)setPrice:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4002000000uLL;
  objc_storeStrong((id *)&self->_price, a3);
}

- (void)_readHours
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHours_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHours
{
  -[GEOPDPlaceSummaryLayoutUnit _readHours]((uint64_t)self);
  return self->_hours != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHours)hours
{
  -[GEOPDPlaceSummaryLayoutUnit _readHours]((uint64_t)self);
  return self->_hours;
}

- (void)setHours:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000100000uLL;
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void)_readAddress
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 324) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAddress_tags_6);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasAddress
{
  -[GEOPDPlaceSummaryLayoutUnit _readAddress]((uint64_t)self);
  return self->_address != 0;
}

- (GEOPDPlaceSummaryLayoutUnitAddress)address
{
  -[GEOPDPlaceSummaryLayoutUnit _readAddress]((uint64_t)self);
  return self->_address;
}

- (void)setAddress:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000004uLL;
  objc_storeStrong((id *)&self->_address, a3);
}

- (void)_readRatings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRatings_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasRatings
{
  -[GEOPDPlaceSummaryLayoutUnit _readRatings]((uint64_t)self);
  return self->_ratings != 0;
}

- (GEOPDPlaceSummaryLayoutUnitRatings)ratings
{
  -[GEOPDPlaceSummaryLayoutUnit _readRatings]((uint64_t)self);
  return self->_ratings;
}

- (void)setRatings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4010000000uLL;
  objc_storeStrong((id *)&self->_ratings, a3);
}

- (void)_readTransitShields
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 328) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitShields_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasTransitShields
{
  -[GEOPDPlaceSummaryLayoutUnit _readTransitShields]((uint64_t)self);
  return self->_transitShields != 0;
}

- (GEOPDPlaceSummaryLayoutUnitTransitShields)transitShields
{
  -[GEOPDPlaceSummaryLayoutUnit _readTransitShields]((uint64_t)self);
  return self->_transitShields;
}

- (void)setTransitShields:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4400000000uLL;
  objc_storeStrong((id *)&self->_transitShields, a3);
}

- (void)_readUserGeneratedGuides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 328) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserGeneratedGuides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasUserGeneratedGuides
{
  -[GEOPDPlaceSummaryLayoutUnit _readUserGeneratedGuides]((uint64_t)self);
  return self->_userGeneratedGuides != 0;
}

- (GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides)userGeneratedGuides
{
  -[GEOPDPlaceSummaryLayoutUnit _readUserGeneratedGuides]((uint64_t)self);
  return self->_userGeneratedGuides;
}

- (void)setUserGeneratedGuides:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x5000000000uLL;
  objc_storeStrong((id *)&self->_userGeneratedGuides, a3);
}

- (void)_readCuratedGuides
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 324) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCuratedGuides_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasCuratedGuides
{
  -[GEOPDPlaceSummaryLayoutUnit _readCuratedGuides]((uint64_t)self);
  return self->_curatedGuides != 0;
}

- (GEOPDPlaceSummaryLayoutUnitCuratedGuides)curatedGuides
{
  -[GEOPDPlaceSummaryLayoutUnit _readCuratedGuides]((uint64_t)self);
  return self->_curatedGuides;
}

- (void)setCuratedGuides:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000080uLL;
  objc_storeStrong((id *)&self->_curatedGuides, a3);
}

- (void)_readEvChargersNumber
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEvChargersNumber_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasEvChargersNumber
{
  -[GEOPDPlaceSummaryLayoutUnit _readEvChargersNumber]((uint64_t)self);
  return self->_evChargersNumber != 0;
}

- (GEOPDPlaceSummaryLayoutUnitEVChargersNumber)evChargersNumber
{
  -[GEOPDPlaceSummaryLayoutUnit _readEvChargersNumber]((uint64_t)self);
  return self->_evChargersNumber;
}

- (void)setEvChargersNumber:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000400uLL;
  objc_storeStrong((id *)&self->_evChargersNumber, a3);
}

- (void)_readUgcUserSubmittedRecommendations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 328) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUgcUserSubmittedRecommendations_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasUgcUserSubmittedRecommendations
{
  -[GEOPDPlaceSummaryLayoutUnit _readUgcUserSubmittedRecommendations]((uint64_t)self);
  return self->_ugcUserSubmittedRecommendations != 0;
}

- (GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations)ugcUserSubmittedRecommendations
{
  -[GEOPDPlaceSummaryLayoutUnit _readUgcUserSubmittedRecommendations]((uint64_t)self);
  return self->_ugcUserSubmittedRecommendations;
}

- (void)setUgcUserSubmittedRecommendations:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4800000000uLL;
  objc_storeStrong((id *)&self->_ugcUserSubmittedRecommendations, a3);
}

- (void)_readString
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 328) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readString_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasString
{
  -[GEOPDPlaceSummaryLayoutUnit _readString]((uint64_t)self);
  return self->_string != 0;
}

- (GEOPDPlaceSummaryLayoutUnitString)string
{
  -[GEOPDPlaceSummaryLayoutUnit _readString]((uint64_t)self);
  return self->_string;
}

- (void)setString:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4200000000uLL;
  objc_storeStrong((id *)&self->_string, a3);
}

- (void)_readServerOverride
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 328) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readServerOverride_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasServerOverride
{
  -[GEOPDPlaceSummaryLayoutUnit _readServerOverride]((uint64_t)self);
  return self->_serverOverride != 0;
}

- (GEOPDPlaceSummaryLayoutUnitServerOverride)serverOverride
{
  -[GEOPDPlaceSummaryLayoutUnit _readServerOverride]((uint64_t)self);
  return self->_serverOverride;
}

- (void)setServerOverride:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4100000000uLL;
  objc_storeStrong((id *)&self->_serverOverride, a3);
}

- (void)_readContainment
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 324) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContainment_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasContainment
{
  -[GEOPDPlaceSummaryLayoutUnit _readContainment]((uint64_t)self);
  return self->_containment != 0;
}

- (GEOPDPlaceSummaryLayoutUnitContainment)containment
{
  -[GEOPDPlaceSummaryLayoutUnit _readContainment]((uint64_t)self);
  return self->_containment;
}

- (void)setContainment:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000040uLL;
  objc_storeStrong((id *)&self->_containment, a3);
}

- (void)_readRecent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRecent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasRecent
{
  -[GEOPDPlaceSummaryLayoutUnit _readRecent]((uint64_t)self);
  return self->_recent != 0;
}

- (GEOPDPlaceSummaryLayoutUnitRecent)recent
{
  -[GEOPDPlaceSummaryLayoutUnit _readRecent]((uint64_t)self);
  return self->_recent;
}

- (void)setRecent:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4040000000uLL;
  objc_storeStrong((id *)&self->_recent, a3);
}

- (void)_readHighlightMain
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHighlightMain_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHighlightMain
{
  -[GEOPDPlaceSummaryLayoutUnit _readHighlightMain]((uint64_t)self);
  return self->_highlightMain != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHighlightMain)highlightMain
{
  -[GEOPDPlaceSummaryLayoutUnit _readHighlightMain]((uint64_t)self);
  return self->_highlightMain;
}

- (void)setHighlightMain:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000002000uLL;
  objc_storeStrong((id *)&self->_highlightMain, a3);
}

- (void)_readHighlightExtra
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHighlightExtra_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHighlightExtra
{
  -[GEOPDPlaceSummaryLayoutUnit _readHighlightExtra]((uint64_t)self);
  return self->_highlightExtra != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHighlightExtra)highlightExtra
{
  -[GEOPDPlaceSummaryLayoutUnit _readHighlightExtra]((uint64_t)self);
  return self->_highlightExtra;
}

- (void)setHighlightExtra:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000001000uLL;
  objc_storeStrong((id *)&self->_highlightExtra, a3);
}

- (void)_readPublisherNameForGuide
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherNameForGuide_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPublisherNameForGuide
{
  -[GEOPDPlaceSummaryLayoutUnit _readPublisherNameForGuide]((uint64_t)self);
  return self->_publisherNameForGuide != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide)publisherNameForGuide
{
  -[GEOPDPlaceSummaryLayoutUnit _readPublisherNameForGuide]((uint64_t)self);
  return self->_publisherNameForGuide;
}

- (void)setPublisherNameForGuide:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4008000000uLL;
  objc_storeStrong((id *)&self->_publisherNameForGuide, a3);
}

- (void)_readNumPlacesInGuide
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNumPlacesInGuide_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasNumPlacesInGuide
{
  -[GEOPDPlaceSummaryLayoutUnit _readNumPlacesInGuide]((uint64_t)self);
  return self->_numPlacesInGuide != 0;
}

- (GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide)numPlacesInGuide
{
  -[GEOPDPlaceSummaryLayoutUnit _readNumPlacesInGuide]((uint64_t)self);
  return self->_numPlacesInGuide;
}

- (void)setNumPlacesInGuide:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000800000uLL;
  objc_storeStrong((id *)&self->_numPlacesInGuide, a3);
}

- (void)_readPublisherDescription
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPublisherDescription_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPublisherDescription
{
  -[GEOPDPlaceSummaryLayoutUnit _readPublisherDescription]((uint64_t)self);
  return self->_publisherDescription != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPublisherDescription)publisherDescription
{
  -[GEOPDPlaceSummaryLayoutUnit _readPublisherDescription]((uint64_t)self);
  return self->_publisherDescription;
}

- (void)setPublisherDescription:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4004000000uLL;
  objc_storeStrong((id *)&self->_publisherDescription, a3);
}

- (void)_readSecondaryName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryName_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasSecondaryName
{
  -[GEOPDPlaceSummaryLayoutUnit _readSecondaryName]((uint64_t)self);
  return self->_secondaryName != 0;
}

- (GEOPDPlaceSummaryLayoutUnitSecondaryName)secondaryName
{
  -[GEOPDPlaceSummaryLayoutUnit _readSecondaryName]((uint64_t)self);
  return self->_secondaryName;
}

- (void)setSecondaryName:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4080000000uLL;
  objc_storeStrong((id *)&self->_secondaryName, a3);
}

- (void)_readFactoid
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFactoid_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasFactoid
{
  -[GEOPDPlaceSummaryLayoutUnit _readFactoid]((uint64_t)self);
  return self->_factoid != 0;
}

- (GEOPDPlaceSummaryLayoutUnitFactoid)factoid
{
  -[GEOPDPlaceSummaryLayoutUnit _readFactoid]((uint64_t)self);
  return self->_factoid;
}

- (void)setFactoid:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000800uLL;
  objc_storeStrong((id *)&self->_factoid, a3);
}

- (void)_readArpRatings
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 324) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readArpRatings_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasArpRatings
{
  -[GEOPDPlaceSummaryLayoutUnit _readArpRatings]((uint64_t)self);
  return self->_arpRatings != 0;
}

- (GEOPDPlaceSummaryLayoutUnitArpRatings)arpRatings
{
  -[GEOPDPlaceSummaryLayoutUnit _readArpRatings]((uint64_t)self);
  return self->_arpRatings;
}

- (void)setArpRatings:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000010uLL;
  objc_storeStrong((id *)&self->_arpRatings, a3);
}

- (void)_readRealTimeEvChargerAvailability
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRealTimeEvChargerAvailability_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasRealTimeEvChargerAvailability
{
  -[GEOPDPlaceSummaryLayoutUnit _readRealTimeEvChargerAvailability]((uint64_t)self);
  return self->_realTimeEvChargerAvailability != 0;
}

- (GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability)realTimeEvChargerAvailability
{
  -[GEOPDPlaceSummaryLayoutUnit _readRealTimeEvChargerAvailability]((uint64_t)self);
  return self->_realTimeEvChargerAvailability;
}

- (void)setRealTimeEvChargerAvailability:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4020000000uLL;
  objc_storeStrong((id *)&self->_realTimeEvChargerAvailability, a3);
}

- (void)_readDetourTime
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDetourTime_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasDetourTime
{
  -[GEOPDPlaceSummaryLayoutUnit _readDetourTime]((uint64_t)self);
  return self->_detourTime != 0;
}

- (GEOPDPlaceSummaryLayoutUnitDetourTime)detourTime
{
  -[GEOPDPlaceSummaryLayoutUnit _readDetourTime]((uint64_t)self);
  return self->_detourTime;
}

- (void)setDetourTime:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000100uLL;
  objc_storeStrong((id *)&self->_detourTime, a3);
}

- (void)_readHikingDifficulty
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikingDifficulty_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikingDifficulty
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikingDifficulty]((uint64_t)self);
  return self->_hikingDifficulty != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikingDifficulty)hikingDifficulty
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikingDifficulty]((uint64_t)self);
  return self->_hikingDifficulty;
}

- (void)setHikingDifficulty:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000040000uLL;
  objc_storeStrong((id *)&self->_hikingDifficulty, a3);
}

- (void)_readHikingTrailLength
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikingTrailLength_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikingTrailLength
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikingTrailLength]((uint64_t)self);
  return self->_hikingTrailLength != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikingTrailLength)hikingTrailLength
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikingTrailLength]((uint64_t)self);
  return self->_hikingTrailLength;
}

- (void)setHikingTrailLength:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000080000uLL;
  objc_storeStrong((id *)&self->_hikingTrailLength, a3);
}

- (void)_readPhotoCarousel
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 327) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotoCarousel_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasPhotoCarousel
{
  -[GEOPDPlaceSummaryLayoutUnit _readPhotoCarousel]((uint64_t)self);
  return self->_photoCarousel != 0;
}

- (GEOPDPlaceSummaryLayoutUnitPhotoCarousel)photoCarousel
{
  -[GEOPDPlaceSummaryLayoutUnit _readPhotoCarousel]((uint64_t)self);
  return self->_photoCarousel;
}

- (void)setPhotoCarousel:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4001000000uLL;
  objc_storeStrong((id *)&self->_photoCarousel, a3);
}

- (void)_readUserNote
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 328) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserNote_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasUserNote
{
  -[GEOPDPlaceSummaryLayoutUnit _readUserNote]((uint64_t)self);
  return self->_userNote != 0;
}

- (GEOPDPlaceSummaryLayoutUnitUserNote)userNote
{
  -[GEOPDPlaceSummaryLayoutUnit _readUserNote]((uint64_t)self);
  return self->_userNote;
}

- (void)setUserNote:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x6000000000uLL;
  objc_storeStrong((id *)&self->_userNote, a3);
}

- (void)_readInUserLibrary
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInUserLibrary_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasInUserLibrary
{
  -[GEOPDPlaceSummaryLayoutUnit _readInUserLibrary]((uint64_t)self);
  return self->_inUserLibrary != 0;
}

- (GEOPDPlaceSummaryLayoutUnitInUserLibrary)inUserLibrary
{
  -[GEOPDPlaceSummaryLayoutUnit _readInUserLibrary]((uint64_t)self);
  return self->_inUserLibrary;
}

- (void)setInUserLibrary:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000200000uLL;
  objc_storeStrong((id *)&self->_inUserLibrary, a3);
}

- (void)_readHikeRouteElevationGainLoss
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikeRouteElevationGainLoss_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteElevationGainLoss
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteElevationGainLoss]((uint64_t)self);
  return self->_hikeRouteElevationGainLoss != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss)hikeRouteElevationGainLoss
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteElevationGainLoss]((uint64_t)self);
  return self->_hikeRouteElevationGainLoss;
}

- (void)setHikeRouteElevationGainLoss:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000008000uLL;
  objc_storeStrong((id *)&self->_hikeRouteElevationGainLoss, a3);
}

- (void)_readHikeRouteType
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikeRouteType_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteType
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteType]((uint64_t)self);
  return self->_hikeRouteType != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteType)hikeRouteType
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteType]((uint64_t)self);
  return self->_hikeRouteType;
}

- (void)setHikeRouteType:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000020000uLL;
  objc_storeStrong((id *)&self->_hikeRouteType, a3);
}

- (void)_readHikeRouteDuration
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 325) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikeRouteDuration_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteDuration
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteDuration]((uint64_t)self);
  return self->_hikeRouteDuration != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteDuration)hikeRouteDuration
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteDuration]((uint64_t)self);
  return self->_hikeRouteDuration;
}

- (void)setHikeRouteDuration:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000004000uLL;
  objc_storeStrong((id *)&self->_hikeRouteDuration, a3);
}

- (void)_readHikeRouteLength
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 326) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHikeRouteLength_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasHikeRouteLength
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteLength]((uint64_t)self);
  return self->_hikeRouteLength != 0;
}

- (GEOPDPlaceSummaryLayoutUnitHikeRouteLength)hikeRouteLength
{
  -[GEOPDPlaceSummaryLayoutUnit _readHikeRouteLength]((uint64_t)self);
  return self->_hikeRouteLength;
}

- (void)setHikeRouteLength:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000010000uLL;
  objc_storeStrong((id *)&self->_hikeRouteLength, a3);
}

- (int)layoutPriority
{
  return self->_layoutPriority;
}

- (void)setLayoutPriority:(int)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000001uLL;
  self->_layoutPriority = a3;
}

- (void)setHasLayoutPriority:(BOOL)a3
{
  self->_flags = ($DCB87D87C041D9304E9B2281701D2ADF)(*(_QWORD *)&self->_flags & 0xFFFFFFFFFFFFFFFELL | a3 | 0x4000000000);
}

- (BOOL)hasLayoutPriority
{
  return *(_DWORD *)&self->_flags & 1;
}

- (void)_readAlternativeUnit
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 312));
    if ((*(_BYTE *)(a1 + 324) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDPlaceSummaryLayoutUnitReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternativeUnit_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 312));
  }
}

- (BOOL)hasAlternativeUnit
{
  -[GEOPDPlaceSummaryLayoutUnit _readAlternativeUnit]((uint64_t)self);
  return self->_alternativeUnit != 0;
}

- (GEOPDPlaceSummaryLayoutUnit)alternativeUnit
{
  -[GEOPDPlaceSummaryLayoutUnit _readAlternativeUnit]((uint64_t)self);
  return self->_alternativeUnit;
}

- (void)setAlternativeUnit:(id)a3
{
  *(_QWORD *)&self->_flags |= 0x4000000008uLL;
  objc_storeStrong((id *)&self->_alternativeUnit, a3);
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
  v8.super_class = (Class)GEOPDPlaceSummaryLayoutUnit;
  -[GEOPDPlaceSummaryLayoutUnit description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceSummaryLayoutUnit dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnit _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
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
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  const __CFString *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  const __CFString *v75;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  id v86;
  void *v87;
  void *v88;
  void *v89;
  const __CFString *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  const __CFString *v95;
  id v96;
  void *v97;
  void *v98;
  id v99;
  void *v100;
  void *v101;
  void *v102;
  const __CFString *v103;
  id v104;
  void *v105;
  void *v106;
  void *v107;
  const __CFString *v108;
  id v109;
  void *v110;
  void *v111;
  void *v112;
  const __CFString *v113;
  id v114;
  void *v115;
  void *v116;
  void *v117;
  const __CFString *v118;
  id v119;
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
  void *v136;
  void *v137;
  const __CFString *v138;
  id v139;
  void *v140;
  void *v141;
  void *v142;
  const __CFString *v143;
  id v144;
  void *v145;
  void *v146;
  void *v147;
  const __CFString *v148;
  id v149;
  void *v150;
  void *v151;
  void *v152;
  const __CFString *v153;
  id v154;
  void *v155;
  void *v156;
  void *v157;
  const __CFString *v158;
  id v159;
  void *v160;
  const __CFString *v161;
  void *v162;
  void *v163;
  void *v164;
  const __CFString *v165;
  id v166;
  id v167;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 324) & 2) != 0)
    {
      v5 = *(int *)(a1 + 320);
      if (v5 >= 0x24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 320));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0E3A0[v5];
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    objc_msgSend((id)a1, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("name"));
    }

    objc_msgSend((id)a1, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v10, "jsonRepresentation");
      else
        objc_msgSend(v10, "dictionaryRepresentation");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("category"));
    }

    objc_msgSend((id)a1, "distance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v13, "jsonRepresentation");
      else
        objc_msgSend(v13, "dictionaryRepresentation");
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("distance"));
    }

    objc_msgSend((id)a1, "price");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v16, "jsonRepresentation");
      else
        objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("price"));
    }

    objc_msgSend((id)a1, "hours");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v19, "jsonRepresentation");
      else
        objc_msgSend(v19, "dictionaryRepresentation");
      v21 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("hours"));
    }

    objc_msgSend((id)a1, "address");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v22, "jsonRepresentation");
      else
        objc_msgSend(v22, "dictionaryRepresentation");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("address"));
    }

    objc_msgSend((id)a1, "ratings");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v25, "jsonRepresentation");
      else
        objc_msgSend(v25, "dictionaryRepresentation");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v27, CFSTR("ratings"));
    }

    objc_msgSend((id)a1, "transitShields");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v28;
    if (v28)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v28, "jsonRepresentation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("transitShields");
      }
      else
      {
        objc_msgSend(v28, "dictionaryRepresentation");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = CFSTR("transit_shields");
      }
      v32 = v30;

      objc_msgSend(v4, "setObject:forKey:", v32, v31);
    }

    objc_msgSend((id)a1, "userGeneratedGuides");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v33, "jsonRepresentation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = CFSTR("userGeneratedGuides");
      }
      else
      {
        objc_msgSend(v33, "dictionaryRepresentation");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = CFSTR("user_generated_guides");
      }
      v37 = v35;

      objc_msgSend(v4, "setObject:forKey:", v37, v36);
    }

    objc_msgSend((id)a1, "curatedGuides");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v38, "jsonRepresentation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("curatedGuides");
      }
      else
      {
        objc_msgSend(v38, "dictionaryRepresentation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = CFSTR("curated_guides");
      }
      v42 = v40;

      objc_msgSend(v4, "setObject:forKey:", v42, v41);
    }

    objc_msgSend((id)a1, "evChargersNumber");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (v43)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v43, "jsonRepresentation");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = CFSTR("evChargersNumber");
      }
      else
      {
        objc_msgSend(v43, "dictionaryRepresentation");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = CFSTR("ev_chargers_number");
      }
      v47 = v45;

      objc_msgSend(v4, "setObject:forKey:", v47, v46);
    }

    objc_msgSend((id)a1, "ugcUserSubmittedRecommendations");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = v48;
    if (v48)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v48, "jsonRepresentation");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = CFSTR("ugcUserSubmittedRecommendations");
      }
      else
      {
        objc_msgSend(v48, "dictionaryRepresentation");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = CFSTR("ugc_user_submitted_recommendations");
      }
      v52 = v50;

      objc_msgSend(v4, "setObject:forKey:", v52, v51);
    }

    objc_msgSend((id)a1, "string");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (v53)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v53, "jsonRepresentation");
      else
        objc_msgSend(v53, "dictionaryRepresentation");
      v55 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("string"));
    }

    objc_msgSend((id)a1, "serverOverride");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56;
    if (v56)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v56, "jsonRepresentation");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("serverOverride");
      }
      else
      {
        objc_msgSend(v56, "dictionaryRepresentation");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("server_override");
      }
      v60 = v58;

      objc_msgSend(v4, "setObject:forKey:", v60, v59);
    }

    objc_msgSend((id)a1, "containment");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v61)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v61, "jsonRepresentation");
      else
        objc_msgSend(v61, "dictionaryRepresentation");
      v63 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("containment"));
    }

    objc_msgSend((id)a1, "recent");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = v64;
    if (v64)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v64, "jsonRepresentation");
      else
        objc_msgSend(v64, "dictionaryRepresentation");
      v66 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v66, CFSTR("recent"));
    }

    objc_msgSend((id)a1, "highlightMain");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v67;
    if (v67)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v67, "jsonRepresentation");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = CFSTR("highlightMain");
      }
      else
      {
        objc_msgSend(v67, "dictionaryRepresentation");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = CFSTR("highlight_main");
      }
      v71 = v69;

      objc_msgSend(v4, "setObject:forKey:", v71, v70);
    }

    objc_msgSend((id)a1, "highlightExtra");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v72, "jsonRepresentation");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = CFSTR("highlightExtra");
      }
      else
      {
        objc_msgSend(v72, "dictionaryRepresentation");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = CFSTR("highlight_extra");
      }
      v76 = v74;

      objc_msgSend(v4, "setObject:forKey:", v76, v75);
    }

    objc_msgSend((id)a1, "publisherNameForGuide");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v77;
    if (v77)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v77, "jsonRepresentation");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = CFSTR("publisherNameForGuide");
      }
      else
      {
        objc_msgSend(v77, "dictionaryRepresentation");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = CFSTR("publisher_name_for_guide");
      }
      v81 = v79;

      objc_msgSend(v4, "setObject:forKey:", v81, v80);
    }

    objc_msgSend((id)a1, "numPlacesInGuide");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v82;
    if (v82)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v82, "jsonRepresentation");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = CFSTR("numPlacesInGuide");
      }
      else
      {
        objc_msgSend(v82, "dictionaryRepresentation");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = CFSTR("num_places_in_guide");
      }
      v86 = v84;

      objc_msgSend(v4, "setObject:forKey:", v86, v85);
    }

    objc_msgSend((id)a1, "publisherDescription");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v88 = v87;
    if (v87)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v87, "jsonRepresentation");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = CFSTR("publisherDescription");
      }
      else
      {
        objc_msgSend(v87, "dictionaryRepresentation");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = CFSTR("publisher_description");
      }
      v91 = v89;

      objc_msgSend(v4, "setObject:forKey:", v91, v90);
    }

    objc_msgSend((id)a1, "secondaryName");
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = v92;
    if (v92)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v92, "jsonRepresentation");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = CFSTR("secondaryName");
      }
      else
      {
        objc_msgSend(v92, "dictionaryRepresentation");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = CFSTR("secondary_name");
      }
      v96 = v94;

      objc_msgSend(v4, "setObject:forKey:", v96, v95);
    }

    objc_msgSend((id)a1, "factoid");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = v97;
    if (v97)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v97, "jsonRepresentation");
      else
        objc_msgSend(v97, "dictionaryRepresentation");
      v99 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKey:", v99, CFSTR("factoid"));
    }

    objc_msgSend((id)a1, "arpRatings");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v100;
    if (v100)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v100, "jsonRepresentation");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = CFSTR("arpRatings");
      }
      else
      {
        objc_msgSend(v100, "dictionaryRepresentation");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = CFSTR("arp_ratings");
      }
      v104 = v102;

      objc_msgSend(v4, "setObject:forKey:", v104, v103);
    }

    objc_msgSend((id)a1, "realTimeEvChargerAvailability");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = v105;
    if (v105)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v105, "jsonRepresentation");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = CFSTR("realTimeEvChargerAvailability");
      }
      else
      {
        objc_msgSend(v105, "dictionaryRepresentation");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v108 = CFSTR("real_time_ev_charger_availability");
      }
      v109 = v107;

      objc_msgSend(v4, "setObject:forKey:", v109, v108);
    }

    objc_msgSend((id)a1, "detourTime");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v110;
    if (v110)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v110, "jsonRepresentation");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = CFSTR("detourTime");
      }
      else
      {
        objc_msgSend(v110, "dictionaryRepresentation");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = CFSTR("detour_time");
      }
      v114 = v112;

      objc_msgSend(v4, "setObject:forKey:", v114, v113);
    }

    objc_msgSend((id)a1, "hikingDifficulty");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v115;
    if (v115)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v115, "jsonRepresentation");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = CFSTR("hikingDifficulty");
      }
      else
      {
        objc_msgSend(v115, "dictionaryRepresentation");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = CFSTR("hiking_difficulty");
      }
      v119 = v117;

      objc_msgSend(v4, "setObject:forKey:", v119, v118);
    }

    objc_msgSend((id)a1, "hikingTrailLength");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120;
    if (v120)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v120, "jsonRepresentation");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = CFSTR("hikingTrailLength");
      }
      else
      {
        objc_msgSend(v120, "dictionaryRepresentation");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        v123 = CFSTR("hiking_trail_length");
      }
      v124 = v122;

      objc_msgSend(v4, "setObject:forKey:", v124, v123);
    }

    objc_msgSend((id)a1, "photoCarousel");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = v125;
    if (v125)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v125, "jsonRepresentation");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = CFSTR("photoCarousel");
      }
      else
      {
        objc_msgSend(v125, "dictionaryRepresentation");
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = CFSTR("photo_carousel");
      }
      v129 = v127;

      objc_msgSend(v4, "setObject:forKey:", v129, v128);
    }

    objc_msgSend((id)a1, "userNote");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = v130;
    if (v130)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v130, "jsonRepresentation");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = CFSTR("userNote");
      }
      else
      {
        objc_msgSend(v130, "dictionaryRepresentation");
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = CFSTR("user_note");
      }
      v134 = v132;

      objc_msgSend(v4, "setObject:forKey:", v134, v133);
    }

    objc_msgSend((id)a1, "inUserLibrary");
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v136 = v135;
    if (v135)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v135, "jsonRepresentation");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = CFSTR("inUserLibrary");
      }
      else
      {
        objc_msgSend(v135, "dictionaryRepresentation");
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        v138 = CFSTR("in_user_library");
      }
      v139 = v137;

      objc_msgSend(v4, "setObject:forKey:", v139, v138);
    }

    objc_msgSend((id)a1, "hikeRouteElevationGainLoss");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v141 = v140;
    if (v140)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v140, "jsonRepresentation");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = CFSTR("hikeRouteElevationGainLoss");
      }
      else
      {
        objc_msgSend(v140, "dictionaryRepresentation");
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = CFSTR("hike_route_elevation_gain_loss");
      }
      v144 = v142;

      objc_msgSend(v4, "setObject:forKey:", v144, v143);
    }

    objc_msgSend((id)a1, "hikeRouteType");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = v145;
    if (v145)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v145, "jsonRepresentation");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = CFSTR("hikeRouteType");
      }
      else
      {
        objc_msgSend(v145, "dictionaryRepresentation");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        v148 = CFSTR("hike_route_type");
      }
      v149 = v147;

      objc_msgSend(v4, "setObject:forKey:", v149, v148);
    }

    objc_msgSend((id)a1, "hikeRouteDuration");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = v150;
    if (v150)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v150, "jsonRepresentation");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = CFSTR("hikeRouteDuration");
      }
      else
      {
        objc_msgSend(v150, "dictionaryRepresentation");
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v153 = CFSTR("hike_route_duration");
      }
      v154 = v152;

      objc_msgSend(v4, "setObject:forKey:", v154, v153);
    }

    objc_msgSend((id)a1, "hikeRouteLength");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = v155;
    if (v155)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v155, "jsonRepresentation");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = CFSTR("hikeRouteLength");
      }
      else
      {
        objc_msgSend(v155, "dictionaryRepresentation");
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = CFSTR("hike_route_length");
      }
      v159 = v157;

      objc_msgSend(v4, "setObject:forKey:", v159, v158);
    }

    if ((*(_BYTE *)(a1 + 324) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 316));
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v161 = CFSTR("layoutPriority");
      else
        v161 = CFSTR("layout_priority");
      objc_msgSend(v4, "setObject:forKey:", v160, v161);

    }
    objc_msgSend((id)a1, "alternativeUnit");
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v163 = v162;
    if (v162)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v162, "jsonRepresentation");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = CFSTR("alternativeUnit");
      }
      else
      {
        objc_msgSend(v162, "dictionaryRepresentation");
        v164 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = CFSTR("alternative_unit");
      }
      v166 = v164;

      objc_msgSend(v4, "setObject:forKey:", v166, v165);
    }

    v167 = v4;
  }
  else
  {
    v167 = 0;
  }
  return v167;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceSummaryLayoutUnit _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOPDPlaceSummaryLayoutUnit)initWithDictionary:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnit *)-[GEOPDPlaceSummaryLayoutUnit _initWithDictionary:isJSON:](self, a3, 0);
}

- (id)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEOPDPlaceSummaryLayoutUnitName *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  GEOPDPlaceSummaryLayoutUnitCategory *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  GEOPDPlaceSummaryLayoutUnitDistance *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  GEOPDPlaceSummaryLayoutUnitPrice *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  GEOPDPlaceSummaryLayoutUnitHours *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  GEOPDPlaceSummaryLayoutUnitAddress *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  GEOPDPlaceSummaryLayoutUnitRatings *v34;
  uint64_t v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  GEOPDPlaceSummaryLayoutUnitTransitShields *v39;
  uint64_t v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *v44;
  uint64_t v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  GEOPDPlaceSummaryLayoutUnitCuratedGuides *v49;
  uint64_t v50;
  void *v51;
  const __CFString *v52;
  void *v53;
  GEOPDPlaceSummaryLayoutUnitEVChargersNumber *v54;
  uint64_t v55;
  void *v56;
  const __CFString *v57;
  void *v58;
  GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  GEOPDPlaceSummaryLayoutUnitString *v63;
  uint64_t v64;
  void *v65;
  const __CFString *v66;
  void *v67;
  GEOPDPlaceSummaryLayoutUnitServerOverride *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  GEOPDPlaceSummaryLayoutUnitContainment *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  GEOPDPlaceSummaryLayoutUnitRecent *v76;
  uint64_t v77;
  void *v78;
  const __CFString *v79;
  void *v80;
  GEOPDPlaceSummaryLayoutUnitHighlightMain *v81;
  uint64_t v82;
  void *v83;
  const __CFString *v84;
  void *v85;
  GEOPDPlaceSummaryLayoutUnitHighlightExtra *v86;
  uint64_t v87;
  void *v88;
  const __CFString *v89;
  void *v90;
  GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *v91;
  uint64_t v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *v96;
  uint64_t v97;
  void *v98;
  const __CFString *v99;
  void *v100;
  GEOPDPlaceSummaryLayoutUnitPublisherDescription *v101;
  uint64_t v102;
  void *v103;
  const __CFString *v104;
  void *v105;
  GEOPDPlaceSummaryLayoutUnitSecondaryName *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  GEOPDPlaceSummaryLayoutUnitFactoid *v110;
  uint64_t v111;
  void *v112;
  const __CFString *v113;
  void *v114;
  GEOPDPlaceSummaryLayoutUnitArpRatings *v115;
  uint64_t v116;
  void *v117;
  const __CFString *v118;
  void *v119;
  GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *v120;
  uint64_t v121;
  void *v122;
  const __CFString *v123;
  void *v124;
  GEOPDPlaceSummaryLayoutUnitDetourTime *v125;
  uint64_t v126;
  void *v127;
  const __CFString *v128;
  void *v129;
  GEOPDPlaceSummaryLayoutUnitHikingDifficulty *v130;
  uint64_t v131;
  void *v132;
  const __CFString *v133;
  void *v134;
  GEOPDPlaceSummaryLayoutUnitHikingTrailLength *v135;
  uint64_t v136;
  void *v137;
  const __CFString *v138;
  void *v139;
  GEOPDPlaceSummaryLayoutUnitPhotoCarousel *v140;
  uint64_t v141;
  void *v142;
  const __CFString *v143;
  void *v144;
  GEOPDPlaceSummaryLayoutUnitUserNote *v145;
  uint64_t v146;
  void *v147;
  const __CFString *v148;
  void *v149;
  GEOPDPlaceSummaryLayoutUnitInUserLibrary *v150;
  uint64_t v151;
  void *v152;
  const __CFString *v153;
  void *v154;
  GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *v155;
  uint64_t v156;
  void *v157;
  const __CFString *v158;
  void *v159;
  GEOPDPlaceSummaryLayoutUnitHikeRouteType *v160;
  uint64_t v161;
  void *v162;
  const __CFString *v163;
  void *v164;
  GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *v165;
  uint64_t v166;
  void *v167;
  const __CFString *v168;
  void *v169;
  GEOPDPlaceSummaryLayoutUnitHikeRouteLength *v170;
  uint64_t v171;
  void *v172;
  const __CFString *v173;
  void *v174;
  const __CFString *v175;
  void *v176;
  GEOPDPlaceSummaryLayoutUnit *v177;
  uint64_t v178;
  void *v179;

  v5 = a2;
  if (!a1)
    goto LABEL_342;
  a1 = (id)objc_msgSend(a1, "init");

  if (!a1)
    goto LABEL_342;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NAME")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CATEGORY")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DISTANCE")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PRICE")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HOURS")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ADDRESS")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RATINGS")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("TRANSIT_SHIELDS")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("USER_GENERATED_GUIDES")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CURATED_GUIDES")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("EV_CHARGERS_NUMBER")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("UGC_USER_SUBMITTED_RECOMMENDATIONS")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("STRING")) & 1) != 0)
    {
      v8 = 13;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SERVER_OVERRIDE")) & 1) != 0)
    {
      v8 = 14;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("CONTAINMENT")) & 1) != 0)
    {
      v8 = 15;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RECENT")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIGHLIGHT_MAIN")) & 1) != 0)
    {
      v8 = 17;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIGHLIGHT_EXTRA")) & 1) != 0)
    {
      v8 = 18;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PUBLISHER_NAME_FOR_GUIDE")) & 1) != 0)
    {
      v8 = 19;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("NUM_PLACES_IN_GUIDE")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PUBLISHER_DESCRIPTION")) & 1) != 0)
    {
      v8 = 21;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("SECONDARY_NAME")) & 1) != 0)
    {
      v8 = 22;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FACTOID")) & 1) != 0)
    {
      v8 = 23;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("ARP_RATINGS")) & 1) != 0)
    {
      v8 = 24;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("REAL_TIME_EV_CHARGER_AVAILABILITY")) & 1) != 0)
    {
      v8 = 25;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("DETOUR_TIME")) & 1) != 0)
    {
      v8 = 26;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIKING_DIFFICULTY")) & 1) != 0)
    {
      v8 = 27;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIKING_TRAIL_LENGTH")) & 1) != 0)
    {
      v8 = 28;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PHOTO_CAROUSEL")) & 1) != 0)
    {
      v8 = 29;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("IN_USER_LIBRARY")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("USER_NOTE")) & 1) != 0)
    {
      v8 = 31;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIKE_ROUTE_FACTOID_ELEVATION_GAIN_LOSS")) & 1) != 0)
    {
      v8 = 32;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIKE_ROUTE_TYPE")) & 1) != 0)
    {
      v8 = 33;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("HIKE_ROUTE_DURATION")) & 1) != 0)
    {
      v8 = 34;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("HIKE_ROUTE_LENGTH")))
    {
      v8 = 35;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_80;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_80:
    objc_msgSend(a1, "setType:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDPlaceSummaryLayoutUnitName alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEOPDPlaceSummaryLayoutUnitName initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEOPDPlaceSummaryLayoutUnitName initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setName:", v11);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = [GEOPDPlaceSummaryLayoutUnitCategory alloc];
    if ((a3 & 1) != 0)
      v15 = -[GEOPDPlaceSummaryLayoutUnitCategory initWithJSON:](v14, "initWithJSON:", v13);
    else
      v15 = -[GEOPDPlaceSummaryLayoutUnitCategory initWithDictionary:](v14, "initWithDictionary:", v13);
    v16 = (void *)v15;
    objc_msgSend(a1, "setCategory:", v15);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("distance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = [GEOPDPlaceSummaryLayoutUnitDistance alloc];
    if ((a3 & 1) != 0)
      v19 = -[GEOPDPlaceSummaryLayoutUnitDistance initWithJSON:](v18, "initWithJSON:", v17);
    else
      v19 = -[GEOPDPlaceSummaryLayoutUnitDistance initWithDictionary:](v18, "initWithDictionary:", v17);
    v20 = (void *)v19;
    objc_msgSend(a1, "setDistance:", v19);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("price"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v22 = [GEOPDPlaceSummaryLayoutUnitPrice alloc];
    if ((a3 & 1) != 0)
      v23 = -[GEOPDPlaceSummaryLayoutUnitPrice initWithJSON:](v22, "initWithJSON:", v21);
    else
      v23 = -[GEOPDPlaceSummaryLayoutUnitPrice initWithDictionary:](v22, "initWithDictionary:", v21);
    v24 = (void *)v23;
    objc_msgSend(a1, "setPrice:", v23);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hours"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = [GEOPDPlaceSummaryLayoutUnitHours alloc];
    if ((a3 & 1) != 0)
      v27 = -[GEOPDPlaceSummaryLayoutUnitHours initWithJSON:](v26, "initWithJSON:", v25);
    else
      v27 = -[GEOPDPlaceSummaryLayoutUnitHours initWithDictionary:](v26, "initWithDictionary:", v25);
    v28 = (void *)v27;
    objc_msgSend(a1, "setHours:", v27);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("address"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = [GEOPDPlaceSummaryLayoutUnitAddress alloc];
    if ((a3 & 1) != 0)
      v31 = -[GEOPDPlaceSummaryLayoutUnitAddress initWithJSON:](v30, "initWithJSON:", v29);
    else
      v31 = -[GEOPDPlaceSummaryLayoutUnitAddress initWithDictionary:](v30, "initWithDictionary:", v29);
    v32 = (void *)v31;
    objc_msgSend(a1, "setAddress:", v31);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ratings"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = [GEOPDPlaceSummaryLayoutUnitRatings alloc];
    if ((a3 & 1) != 0)
      v35 = -[GEOPDPlaceSummaryLayoutUnitRatings initWithJSON:](v34, "initWithJSON:", v33);
    else
      v35 = -[GEOPDPlaceSummaryLayoutUnitRatings initWithDictionary:](v34, "initWithDictionary:", v33);
    v36 = (void *)v35;
    objc_msgSend(a1, "setRatings:", v35);

  }
  if (a3)
    v37 = CFSTR("transitShields");
  else
    v37 = CFSTR("transit_shields");
  objc_msgSend(v5, "objectForKeyedSubscript:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v39 = [GEOPDPlaceSummaryLayoutUnitTransitShields alloc];
    if ((a3 & 1) != 0)
      v40 = -[GEOPDPlaceSummaryLayoutUnitTransitShields initWithJSON:](v39, "initWithJSON:", v38);
    else
      v40 = -[GEOPDPlaceSummaryLayoutUnitTransitShields initWithDictionary:](v39, "initWithDictionary:", v38);
    v41 = (void *)v40;
    objc_msgSend(a1, "setTransitShields:", v40);

  }
  if (a3)
    v42 = CFSTR("userGeneratedGuides");
  else
    v42 = CFSTR("user_generated_guides");
  objc_msgSend(v5, "objectForKeyedSubscript:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = [GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides alloc];
    if ((a3 & 1) != 0)
      v45 = -[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides initWithJSON:](v44, "initWithJSON:", v43);
    else
      v45 = -[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides initWithDictionary:](v44, "initWithDictionary:", v43);
    v46 = (void *)v45;
    objc_msgSend(a1, "setUserGeneratedGuides:", v45);

  }
  if (a3)
    v47 = CFSTR("curatedGuides");
  else
    v47 = CFSTR("curated_guides");
  objc_msgSend(v5, "objectForKeyedSubscript:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v49 = [GEOPDPlaceSummaryLayoutUnitCuratedGuides alloc];
    if ((a3 & 1) != 0)
      v50 = -[GEOPDPlaceSummaryLayoutUnitCuratedGuides initWithJSON:](v49, "initWithJSON:", v48);
    else
      v50 = -[GEOPDPlaceSummaryLayoutUnitCuratedGuides initWithDictionary:](v49, "initWithDictionary:", v48);
    v51 = (void *)v50;
    objc_msgSend(a1, "setCuratedGuides:", v50);

  }
  if (a3)
    v52 = CFSTR("evChargersNumber");
  else
    v52 = CFSTR("ev_chargers_number");
  objc_msgSend(v5, "objectForKeyedSubscript:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v54 = [GEOPDPlaceSummaryLayoutUnitEVChargersNumber alloc];
    if ((a3 & 1) != 0)
      v55 = -[GEOPDPlaceSummaryLayoutUnitEVChargersNumber initWithJSON:](v54, "initWithJSON:", v53);
    else
      v55 = -[GEOPDPlaceSummaryLayoutUnitEVChargersNumber initWithDictionary:](v54, "initWithDictionary:", v53);
    v56 = (void *)v55;
    objc_msgSend(a1, "setEvChargersNumber:", v55);

  }
  if (a3)
    v57 = CFSTR("ugcUserSubmittedRecommendations");
  else
    v57 = CFSTR("ugc_user_submitted_recommendations");
  objc_msgSend(v5, "objectForKeyedSubscript:", v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v59 = [GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations alloc];
    if ((a3 & 1) != 0)
      v60 = -[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations initWithJSON:](v59, "initWithJSON:", v58);
    else
      v60 = -[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations initWithDictionary:](v59, "initWithDictionary:", v58);
    v61 = (void *)v60;
    objc_msgSend(a1, "setUgcUserSubmittedRecommendations:", v60);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("string"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v63 = [GEOPDPlaceSummaryLayoutUnitString alloc];
    if ((a3 & 1) != 0)
      v64 = -[GEOPDPlaceSummaryLayoutUnitString initWithJSON:](v63, "initWithJSON:", v62);
    else
      v64 = -[GEOPDPlaceSummaryLayoutUnitString initWithDictionary:](v63, "initWithDictionary:", v62);
    v65 = (void *)v64;
    objc_msgSend(a1, "setString:", v64);

  }
  if (a3)
    v66 = CFSTR("serverOverride");
  else
    v66 = CFSTR("server_override");
  objc_msgSend(v5, "objectForKeyedSubscript:", v66);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v68 = [GEOPDPlaceSummaryLayoutUnitServerOverride alloc];
    if ((a3 & 1) != 0)
      v69 = -[GEOPDPlaceSummaryLayoutUnitServerOverride initWithJSON:](v68, "initWithJSON:", v67);
    else
      v69 = -[GEOPDPlaceSummaryLayoutUnitServerOverride initWithDictionary:](v68, "initWithDictionary:", v67);
    v70 = (void *)v69;
    objc_msgSend(a1, "setServerOverride:", v69);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("containment"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v72 = [GEOPDPlaceSummaryLayoutUnitContainment alloc];
    if ((a3 & 1) != 0)
      v73 = -[GEOPDPlaceSummaryLayoutUnitContainment initWithJSON:](v72, "initWithJSON:", v71);
    else
      v73 = -[GEOPDPlaceSummaryLayoutUnitContainment initWithDictionary:](v72, "initWithDictionary:", v71);
    v74 = (void *)v73;
    objc_msgSend(a1, "setContainment:", v73);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("recent"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v76 = [GEOPDPlaceSummaryLayoutUnitRecent alloc];
    if ((a3 & 1) != 0)
      v77 = -[GEOPDPlaceSummaryLayoutUnitRecent initWithJSON:](v76, "initWithJSON:", v75);
    else
      v77 = -[GEOPDPlaceSummaryLayoutUnitRecent initWithDictionary:](v76, "initWithDictionary:", v75);
    v78 = (void *)v77;
    objc_msgSend(a1, "setRecent:", v77);

  }
  if (a3)
    v79 = CFSTR("highlightMain");
  else
    v79 = CFSTR("highlight_main");
  objc_msgSend(v5, "objectForKeyedSubscript:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v81 = [GEOPDPlaceSummaryLayoutUnitHighlightMain alloc];
    if ((a3 & 1) != 0)
      v82 = -[GEOPDPlaceSummaryLayoutUnitHighlightMain initWithJSON:](v81, "initWithJSON:", v80);
    else
      v82 = -[GEOPDPlaceSummaryLayoutUnitHighlightMain initWithDictionary:](v81, "initWithDictionary:", v80);
    v83 = (void *)v82;
    objc_msgSend(a1, "setHighlightMain:", v82);

  }
  if (a3)
    v84 = CFSTR("highlightExtra");
  else
    v84 = CFSTR("highlight_extra");
  objc_msgSend(v5, "objectForKeyedSubscript:", v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v86 = [GEOPDPlaceSummaryLayoutUnitHighlightExtra alloc];
    if ((a3 & 1) != 0)
      v87 = -[GEOPDPlaceSummaryLayoutUnitHighlightExtra initWithJSON:](v86, "initWithJSON:", v85);
    else
      v87 = -[GEOPDPlaceSummaryLayoutUnitHighlightExtra initWithDictionary:](v86, "initWithDictionary:", v85);
    v88 = (void *)v87;
    objc_msgSend(a1, "setHighlightExtra:", v87);

  }
  if (a3)
    v89 = CFSTR("publisherNameForGuide");
  else
    v89 = CFSTR("publisher_name_for_guide");
  objc_msgSend(v5, "objectForKeyedSubscript:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v91 = [GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide alloc];
    if ((a3 & 1) != 0)
      v92 = -[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide initWithJSON:](v91, "initWithJSON:", v90);
    else
      v92 = -[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide initWithDictionary:](v91, "initWithDictionary:", v90);
    v93 = (void *)v92;
    objc_msgSend(a1, "setPublisherNameForGuide:", v92);

  }
  if (a3)
    v94 = CFSTR("numPlacesInGuide");
  else
    v94 = CFSTR("num_places_in_guide");
  objc_msgSend(v5, "objectForKeyedSubscript:", v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v96 = [GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide alloc];
    if ((a3 & 1) != 0)
      v97 = -[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide initWithJSON:](v96, "initWithJSON:", v95);
    else
      v97 = -[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide initWithDictionary:](v96, "initWithDictionary:", v95);
    v98 = (void *)v97;
    objc_msgSend(a1, "setNumPlacesInGuide:", v97);

  }
  if (a3)
    v99 = CFSTR("publisherDescription");
  else
    v99 = CFSTR("publisher_description");
  objc_msgSend(v5, "objectForKeyedSubscript:", v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v101 = [GEOPDPlaceSummaryLayoutUnitPublisherDescription alloc];
    if ((a3 & 1) != 0)
      v102 = -[GEOPDPlaceSummaryLayoutUnitPublisherDescription initWithJSON:](v101, "initWithJSON:", v100);
    else
      v102 = -[GEOPDPlaceSummaryLayoutUnitPublisherDescription initWithDictionary:](v101, "initWithDictionary:", v100);
    v103 = (void *)v102;
    objc_msgSend(a1, "setPublisherDescription:", v102);

  }
  if (a3)
    v104 = CFSTR("secondaryName");
  else
    v104 = CFSTR("secondary_name");
  objc_msgSend(v5, "objectForKeyedSubscript:", v104);
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v106 = [GEOPDPlaceSummaryLayoutUnitSecondaryName alloc];
    if ((a3 & 1) != 0)
      v107 = -[GEOPDPlaceSummaryLayoutUnitSecondaryName initWithJSON:](v106, "initWithJSON:", v105);
    else
      v107 = -[GEOPDPlaceSummaryLayoutUnitSecondaryName initWithDictionary:](v106, "initWithDictionary:", v105);
    v108 = (void *)v107;
    objc_msgSend(a1, "setSecondaryName:", v107);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("factoid"));
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v110 = [GEOPDPlaceSummaryLayoutUnitFactoid alloc];
    if ((a3 & 1) != 0)
      v111 = -[GEOPDPlaceSummaryLayoutUnitFactoid initWithJSON:](v110, "initWithJSON:", v109);
    else
      v111 = -[GEOPDPlaceSummaryLayoutUnitFactoid initWithDictionary:](v110, "initWithDictionary:", v109);
    v112 = (void *)v111;
    objc_msgSend(a1, "setFactoid:", v111);

  }
  if (a3)
    v113 = CFSTR("arpRatings");
  else
    v113 = CFSTR("arp_ratings");
  objc_msgSend(v5, "objectForKeyedSubscript:", v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v115 = [GEOPDPlaceSummaryLayoutUnitArpRatings alloc];
    if ((a3 & 1) != 0)
      v116 = -[GEOPDPlaceSummaryLayoutUnitArpRatings initWithJSON:](v115, "initWithJSON:", v114);
    else
      v116 = -[GEOPDPlaceSummaryLayoutUnitArpRatings initWithDictionary:](v115, "initWithDictionary:", v114);
    v117 = (void *)v116;
    objc_msgSend(a1, "setArpRatings:", v116);

  }
  if (a3)
    v118 = CFSTR("realTimeEvChargerAvailability");
  else
    v118 = CFSTR("real_time_ev_charger_availability");
  objc_msgSend(v5, "objectForKeyedSubscript:", v118);
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v120 = [GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability alloc];
    if ((a3 & 1) != 0)
      v121 = -[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability initWithJSON:](v120, "initWithJSON:", v119);
    else
      v121 = -[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability initWithDictionary:](v120, "initWithDictionary:", v119);
    v122 = (void *)v121;
    objc_msgSend(a1, "setRealTimeEvChargerAvailability:", v121);

  }
  if (a3)
    v123 = CFSTR("detourTime");
  else
    v123 = CFSTR("detour_time");
  objc_msgSend(v5, "objectForKeyedSubscript:", v123);
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v125 = [GEOPDPlaceSummaryLayoutUnitDetourTime alloc];
    if ((a3 & 1) != 0)
      v126 = -[GEOPDPlaceSummaryLayoutUnitDetourTime initWithJSON:](v125, "initWithJSON:", v124);
    else
      v126 = -[GEOPDPlaceSummaryLayoutUnitDetourTime initWithDictionary:](v125, "initWithDictionary:", v124);
    v127 = (void *)v126;
    objc_msgSend(a1, "setDetourTime:", v126);

  }
  if (a3)
    v128 = CFSTR("hikingDifficulty");
  else
    v128 = CFSTR("hiking_difficulty");
  objc_msgSend(v5, "objectForKeyedSubscript:", v128);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v130 = [GEOPDPlaceSummaryLayoutUnitHikingDifficulty alloc];
    if ((a3 & 1) != 0)
      v131 = -[GEOPDPlaceSummaryLayoutUnitHikingDifficulty initWithJSON:](v130, "initWithJSON:", v129);
    else
      v131 = -[GEOPDPlaceSummaryLayoutUnitHikingDifficulty initWithDictionary:](v130, "initWithDictionary:", v129);
    v132 = (void *)v131;
    objc_msgSend(a1, "setHikingDifficulty:", v131);

  }
  if (a3)
    v133 = CFSTR("hikingTrailLength");
  else
    v133 = CFSTR("hiking_trail_length");
  objc_msgSend(v5, "objectForKeyedSubscript:", v133);
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v135 = [GEOPDPlaceSummaryLayoutUnitHikingTrailLength alloc];
    if ((a3 & 1) != 0)
      v136 = -[GEOPDPlaceSummaryLayoutUnitHikingTrailLength initWithJSON:](v135, "initWithJSON:", v134);
    else
      v136 = -[GEOPDPlaceSummaryLayoutUnitHikingTrailLength initWithDictionary:](v135, "initWithDictionary:", v134);
    v137 = (void *)v136;
    objc_msgSend(a1, "setHikingTrailLength:", v136);

  }
  if (a3)
    v138 = CFSTR("photoCarousel");
  else
    v138 = CFSTR("photo_carousel");
  objc_msgSend(v5, "objectForKeyedSubscript:", v138);
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v140 = [GEOPDPlaceSummaryLayoutUnitPhotoCarousel alloc];
    if ((a3 & 1) != 0)
      v141 = -[GEOPDPlaceSummaryLayoutUnitPhotoCarousel initWithJSON:](v140, "initWithJSON:", v139);
    else
      v141 = -[GEOPDPlaceSummaryLayoutUnitPhotoCarousel initWithDictionary:](v140, "initWithDictionary:", v139);
    v142 = (void *)v141;
    objc_msgSend(a1, "setPhotoCarousel:", v141);

  }
  if (a3)
    v143 = CFSTR("userNote");
  else
    v143 = CFSTR("user_note");
  objc_msgSend(v5, "objectForKeyedSubscript:", v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v145 = [GEOPDPlaceSummaryLayoutUnitUserNote alloc];
    if ((a3 & 1) != 0)
      v146 = -[GEOPDPlaceSummaryLayoutUnitUserNote initWithJSON:](v145, "initWithJSON:", v144);
    else
      v146 = -[GEOPDPlaceSummaryLayoutUnitUserNote initWithDictionary:](v145, "initWithDictionary:", v144);
    v147 = (void *)v146;
    objc_msgSend(a1, "setUserNote:", v146);

  }
  if (a3)
    v148 = CFSTR("inUserLibrary");
  else
    v148 = CFSTR("in_user_library");
  objc_msgSend(v5, "objectForKeyedSubscript:", v148);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v150 = [GEOPDPlaceSummaryLayoutUnitInUserLibrary alloc];
    if ((a3 & 1) != 0)
      v151 = -[GEOPDPlaceSummaryLayoutUnitInUserLibrary initWithJSON:](v150, "initWithJSON:", v149);
    else
      v151 = -[GEOPDPlaceSummaryLayoutUnitInUserLibrary initWithDictionary:](v150, "initWithDictionary:", v149);
    v152 = (void *)v151;
    objc_msgSend(a1, "setInUserLibrary:", v151);

  }
  if (a3)
    v153 = CFSTR("hikeRouteElevationGainLoss");
  else
    v153 = CFSTR("hike_route_elevation_gain_loss");
  objc_msgSend(v5, "objectForKeyedSubscript:", v153);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v155 = [GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss alloc];
    if ((a3 & 1) != 0)
      v156 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss initWithJSON:](v155, "initWithJSON:", v154);
    else
      v156 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss initWithDictionary:](v155, "initWithDictionary:", v154);
    v157 = (void *)v156;
    objc_msgSend(a1, "setHikeRouteElevationGainLoss:", v156);

  }
  if (a3)
    v158 = CFSTR("hikeRouteType");
  else
    v158 = CFSTR("hike_route_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v158);
  v159 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v160 = [GEOPDPlaceSummaryLayoutUnitHikeRouteType alloc];
    if ((a3 & 1) != 0)
      v161 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteType initWithJSON:](v160, "initWithJSON:", v159);
    else
      v161 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteType initWithDictionary:](v160, "initWithDictionary:", v159);
    v162 = (void *)v161;
    objc_msgSend(a1, "setHikeRouteType:", v161);

  }
  if (a3)
    v163 = CFSTR("hikeRouteDuration");
  else
    v163 = CFSTR("hike_route_duration");
  objc_msgSend(v5, "objectForKeyedSubscript:", v163);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v165 = [GEOPDPlaceSummaryLayoutUnitHikeRouteDuration alloc];
    if ((a3 & 1) != 0)
      v166 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration initWithJSON:](v165, "initWithJSON:", v164);
    else
      v166 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration initWithDictionary:](v165, "initWithDictionary:", v164);
    v167 = (void *)v166;
    objc_msgSend(a1, "setHikeRouteDuration:", v166);

  }
  if (a3)
    v168 = CFSTR("hikeRouteLength");
  else
    v168 = CFSTR("hike_route_length");
  objc_msgSend(v5, "objectForKeyedSubscript:", v168);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v170 = [GEOPDPlaceSummaryLayoutUnitHikeRouteLength alloc];
    if ((a3 & 1) != 0)
      v171 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteLength initWithJSON:](v170, "initWithJSON:", v169);
    else
      v171 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteLength initWithDictionary:](v170, "initWithDictionary:", v169);
    v172 = (void *)v171;
    objc_msgSend(a1, "setHikeRouteLength:", v171);

  }
  if (a3)
    v173 = CFSTR("layoutPriority");
  else
    v173 = CFSTR("layout_priority");
  objc_msgSend(v5, "objectForKeyedSubscript:", v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setLayoutPriority:", objc_msgSend(v174, "intValue"));

  if (a3)
    v175 = CFSTR("alternativeUnit");
  else
    v175 = CFSTR("alternative_unit");
  objc_msgSend(v5, "objectForKeyedSubscript:", v175);
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v177 = [GEOPDPlaceSummaryLayoutUnit alloc];
    if ((a3 & 1) != 0)
      v178 = -[GEOPDPlaceSummaryLayoutUnit initWithJSON:](v177, "initWithJSON:", v176);
    else
      v178 = -[GEOPDPlaceSummaryLayoutUnit initWithDictionary:](v177, "initWithDictionary:", v176);
    v179 = (void *)v178;
    objc_msgSend(a1, "setAlternativeUnit:", v178);

  }
  a1 = a1;

LABEL_342:
  return a1;
}

- (GEOPDPlaceSummaryLayoutUnit)initWithJSON:(id)a3
{
  return (GEOPDPlaceSummaryLayoutUnit *)-[GEOPDPlaceSummaryLayoutUnit _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_497;
    else
      v8 = (int *)&readAll__nonRecursiveTag_498;
    GEOPDPlaceSummaryLayoutUnitReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEOPDPlaceSummaryLayoutUnitCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceSummaryLayoutUnitReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEOPDPlaceSummaryLayoutUnitIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDPlaceSummaryLayoutUnit readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_name)
      PBDataWriterWriteSubmessage();
    if (self->_category)
      PBDataWriterWriteSubmessage();
    if (self->_distance)
      PBDataWriterWriteSubmessage();
    if (self->_price)
      PBDataWriterWriteSubmessage();
    if (self->_hours)
      PBDataWriterWriteSubmessage();
    if (self->_address)
      PBDataWriterWriteSubmessage();
    if (self->_ratings)
      PBDataWriterWriteSubmessage();
    if (self->_transitShields)
      PBDataWriterWriteSubmessage();
    if (self->_userGeneratedGuides)
      PBDataWriterWriteSubmessage();
    if (self->_curatedGuides)
      PBDataWriterWriteSubmessage();
    if (self->_evChargersNumber)
      PBDataWriterWriteSubmessage();
    if (self->_ugcUserSubmittedRecommendations)
      PBDataWriterWriteSubmessage();
    if (self->_string)
      PBDataWriterWriteSubmessage();
    if (self->_serverOverride)
      PBDataWriterWriteSubmessage();
    if (self->_containment)
      PBDataWriterWriteSubmessage();
    if (self->_recent)
      PBDataWriterWriteSubmessage();
    if (self->_highlightMain)
      PBDataWriterWriteSubmessage();
    if (self->_highlightExtra)
      PBDataWriterWriteSubmessage();
    if (self->_publisherNameForGuide)
      PBDataWriterWriteSubmessage();
    if (self->_numPlacesInGuide)
      PBDataWriterWriteSubmessage();
    if (self->_publisherDescription)
      PBDataWriterWriteSubmessage();
    if (self->_secondaryName)
      PBDataWriterWriteSubmessage();
    if (self->_factoid)
      PBDataWriterWriteSubmessage();
    if (self->_arpRatings)
      PBDataWriterWriteSubmessage();
    if (self->_realTimeEvChargerAvailability)
      PBDataWriterWriteSubmessage();
    if (self->_detourTime)
      PBDataWriterWriteSubmessage();
    if (self->_hikingDifficulty)
      PBDataWriterWriteSubmessage();
    if (self->_hikingTrailLength)
      PBDataWriterWriteSubmessage();
    if (self->_photoCarousel)
      PBDataWriterWriteSubmessage();
    if (self->_userNote)
      PBDataWriterWriteSubmessage();
    if (self->_inUserLibrary)
      PBDataWriterWriteSubmessage();
    if (self->_hikeRouteElevationGainLoss)
      PBDataWriterWriteSubmessage();
    if (self->_hikeRouteType)
      PBDataWriterWriteSubmessage();
    if (self->_hikeRouteDuration)
      PBDataWriterWriteSubmessage();
    if (self->_hikeRouteLength)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_alternativeUnit)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDPlaceSummaryLayoutUnit _readAlternativeUnit]((uint64_t)self);
  if (-[GEOPDPlaceSummaryLayoutUnit hasGreenTeaWithValue:](self->_alternativeUnit, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEOPDPlaceSummaryLayoutUnit _readString]((uint64_t)self);
  return -[GEOPDPlaceSummaryLayoutUnitString hasGreenTeaWithValue:](self->_string, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  char *v4;
  char *v5;

  v5 = (char *)a3;
  -[GEOPDPlaceSummaryLayoutUnit readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong((id *)v5 + 1, self->_reader);
  *((_DWORD *)v5 + 76) = self->_readerMarkPos;
  *((_DWORD *)v5 + 77) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v5 + 80) = self->_type;
    *(_QWORD *)(v5 + 324) |= 2uLL;
  }
  if (self->_name)
  {
    objc_msgSend(v5, "setName:");
    v4 = v5;
  }
  if (self->_category)
  {
    objc_msgSend(v5, "setCategory:");
    v4 = v5;
  }
  if (self->_distance)
  {
    objc_msgSend(v5, "setDistance:");
    v4 = v5;
  }
  if (self->_price)
  {
    objc_msgSend(v5, "setPrice:");
    v4 = v5;
  }
  if (self->_hours)
  {
    objc_msgSend(v5, "setHours:");
    v4 = v5;
  }
  if (self->_address)
  {
    objc_msgSend(v5, "setAddress:");
    v4 = v5;
  }
  if (self->_ratings)
  {
    objc_msgSend(v5, "setRatings:");
    v4 = v5;
  }
  if (self->_transitShields)
  {
    objc_msgSend(v5, "setTransitShields:");
    v4 = v5;
  }
  if (self->_userGeneratedGuides)
  {
    objc_msgSend(v5, "setUserGeneratedGuides:");
    v4 = v5;
  }
  if (self->_curatedGuides)
  {
    objc_msgSend(v5, "setCuratedGuides:");
    v4 = v5;
  }
  if (self->_evChargersNumber)
  {
    objc_msgSend(v5, "setEvChargersNumber:");
    v4 = v5;
  }
  if (self->_ugcUserSubmittedRecommendations)
  {
    objc_msgSend(v5, "setUgcUserSubmittedRecommendations:");
    v4 = v5;
  }
  if (self->_string)
  {
    objc_msgSend(v5, "setString:");
    v4 = v5;
  }
  if (self->_serverOverride)
  {
    objc_msgSend(v5, "setServerOverride:");
    v4 = v5;
  }
  if (self->_containment)
  {
    objc_msgSend(v5, "setContainment:");
    v4 = v5;
  }
  if (self->_recent)
  {
    objc_msgSend(v5, "setRecent:");
    v4 = v5;
  }
  if (self->_highlightMain)
  {
    objc_msgSend(v5, "setHighlightMain:");
    v4 = v5;
  }
  if (self->_highlightExtra)
  {
    objc_msgSend(v5, "setHighlightExtra:");
    v4 = v5;
  }
  if (self->_publisherNameForGuide)
  {
    objc_msgSend(v5, "setPublisherNameForGuide:");
    v4 = v5;
  }
  if (self->_numPlacesInGuide)
  {
    objc_msgSend(v5, "setNumPlacesInGuide:");
    v4 = v5;
  }
  if (self->_publisherDescription)
  {
    objc_msgSend(v5, "setPublisherDescription:");
    v4 = v5;
  }
  if (self->_secondaryName)
  {
    objc_msgSend(v5, "setSecondaryName:");
    v4 = v5;
  }
  if (self->_factoid)
  {
    objc_msgSend(v5, "setFactoid:");
    v4 = v5;
  }
  if (self->_arpRatings)
  {
    objc_msgSend(v5, "setArpRatings:");
    v4 = v5;
  }
  if (self->_realTimeEvChargerAvailability)
  {
    objc_msgSend(v5, "setRealTimeEvChargerAvailability:");
    v4 = v5;
  }
  if (self->_detourTime)
  {
    objc_msgSend(v5, "setDetourTime:");
    v4 = v5;
  }
  if (self->_hikingDifficulty)
  {
    objc_msgSend(v5, "setHikingDifficulty:");
    v4 = v5;
  }
  if (self->_hikingTrailLength)
  {
    objc_msgSend(v5, "setHikingTrailLength:");
    v4 = v5;
  }
  if (self->_photoCarousel)
  {
    objc_msgSend(v5, "setPhotoCarousel:");
    v4 = v5;
  }
  if (self->_userNote)
  {
    objc_msgSend(v5, "setUserNote:");
    v4 = v5;
  }
  if (self->_inUserLibrary)
  {
    objc_msgSend(v5, "setInUserLibrary:");
    v4 = v5;
  }
  if (self->_hikeRouteElevationGainLoss)
  {
    objc_msgSend(v5, "setHikeRouteElevationGainLoss:");
    v4 = v5;
  }
  if (self->_hikeRouteType)
  {
    objc_msgSend(v5, "setHikeRouteType:");
    v4 = v5;
  }
  if (self->_hikeRouteDuration)
  {
    objc_msgSend(v5, "setHikeRouteDuration:");
    v4 = v5;
  }
  if (self->_hikeRouteLength)
  {
    objc_msgSend(v5, "setHikeRouteLength:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v4 + 79) = self->_layoutPriority;
    *(_QWORD *)(v4 + 324) |= 1uLL;
  }
  if (self->_alternativeUnit)
  {
    objc_msgSend(v5, "setAlternativeUnit:");
    v4 = v5;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 0x40) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceSummaryLayoutUnitReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceSummaryLayoutUnit readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 320) = self->_type;
    *(_QWORD *)(v5 + 324) |= 2uLL;
  }
  v9 = -[GEOPDPlaceSummaryLayoutUnitName copyWithZone:](self->_name, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v9;

  v11 = -[GEOPDPlaceSummaryLayoutUnitCategory copyWithZone:](self->_category, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOPDPlaceSummaryLayoutUnitDistance copyWithZone:](self->_distance, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v13;

  v15 = -[GEOPDPlaceSummaryLayoutUnitPrice copyWithZone:](self->_price, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v15;

  v17 = -[GEOPDPlaceSummaryLayoutUnitHours copyWithZone:](self->_hours, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v17;

  v19 = -[GEOPDPlaceSummaryLayoutUnitAddress copyWithZone:](self->_address, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;

  v21 = -[GEOPDPlaceSummaryLayoutUnitRatings copyWithZone:](self->_ratings, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v21;

  v23 = -[GEOPDPlaceSummaryLayoutUnitTransitShields copyWithZone:](self->_transitShields, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v23;

  v25 = -[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides copyWithZone:](self->_userGeneratedGuides, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 288);
  *(_QWORD *)(v5 + 288) = v25;

  v27 = -[GEOPDPlaceSummaryLayoutUnitCuratedGuides copyWithZone:](self->_curatedGuides, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v27;

  v29 = -[GEOPDPlaceSummaryLayoutUnitEVChargersNumber copyWithZone:](self->_evChargersNumber, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v29;

  v31 = -[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations copyWithZone:](self->_ugcUserSubmittedRecommendations, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v31;

  v33 = -[GEOPDPlaceSummaryLayoutUnitString copyWithZone:](self->_string, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v33;

  v35 = -[GEOPDPlaceSummaryLayoutUnitServerOverride copyWithZone:](self->_serverOverride, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v35;

  v37 = -[GEOPDPlaceSummaryLayoutUnitContainment copyWithZone:](self->_containment, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v37;

  v39 = -[GEOPDPlaceSummaryLayoutUnitRecent copyWithZone:](self->_recent, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v39;

  v41 = -[GEOPDPlaceSummaryLayoutUnitHighlightMain copyWithZone:](self->_highlightMain, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v41;

  v43 = -[GEOPDPlaceSummaryLayoutUnitHighlightExtra copyWithZone:](self->_highlightExtra, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v43;

  v45 = -[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide copyWithZone:](self->_publisherNameForGuide, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v45;

  v47 = -[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide copyWithZone:](self->_numPlacesInGuide, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v47;

  v49 = -[GEOPDPlaceSummaryLayoutUnitPublisherDescription copyWithZone:](self->_publisherDescription, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v49;

  v51 = -[GEOPDPlaceSummaryLayoutUnitSecondaryName copyWithZone:](self->_secondaryName, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v51;

  v53 = -[GEOPDPlaceSummaryLayoutUnitFactoid copyWithZone:](self->_factoid, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v53;

  v55 = -[GEOPDPlaceSummaryLayoutUnitArpRatings copyWithZone:](self->_arpRatings, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v55;

  v57 = -[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability copyWithZone:](self->_realTimeEvChargerAvailability, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v57;

  v59 = -[GEOPDPlaceSummaryLayoutUnitDetourTime copyWithZone:](self->_detourTime, "copyWithZone:", a3);
  v60 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v59;

  v61 = -[GEOPDPlaceSummaryLayoutUnitHikingDifficulty copyWithZone:](self->_hikingDifficulty, "copyWithZone:", a3);
  v62 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v61;

  v63 = -[GEOPDPlaceSummaryLayoutUnitHikingTrailLength copyWithZone:](self->_hikingTrailLength, "copyWithZone:", a3);
  v64 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v63;

  v65 = -[GEOPDPlaceSummaryLayoutUnitPhotoCarousel copyWithZone:](self->_photoCarousel, "copyWithZone:", a3);
  v66 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v65;

  v67 = -[GEOPDPlaceSummaryLayoutUnitUserNote copyWithZone:](self->_userNote, "copyWithZone:", a3);
  v68 = *(void **)(v5 + 296);
  *(_QWORD *)(v5 + 296) = v67;

  v69 = -[GEOPDPlaceSummaryLayoutUnitInUserLibrary copyWithZone:](self->_inUserLibrary, "copyWithZone:", a3);
  v70 = *(void **)(v5 + 168);
  *(_QWORD *)(v5 + 168) = v69;

  v71 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss copyWithZone:](self->_hikeRouteElevationGainLoss, "copyWithZone:", a3);
  v72 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v71;

  v73 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteType copyWithZone:](self->_hikeRouteType, "copyWithZone:", a3);
  v74 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v73;

  v75 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration copyWithZone:](self->_hikeRouteDuration, "copyWithZone:", a3);
  v76 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v75;

  v77 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteLength copyWithZone:](self->_hikeRouteLength, "copyWithZone:", a3);
  v78 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v77;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 316) = self->_layoutPriority;
    *(_QWORD *)(v5 + 324) |= 1uLL;
  }
  v79 = -[GEOPDPlaceSummaryLayoutUnit copyWithZone:](self->_alternativeUnit, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v79;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  uint64_t v5;
  GEOPDPlaceSummaryLayoutUnitName *name;
  GEOPDPlaceSummaryLayoutUnitCategory *category;
  GEOPDPlaceSummaryLayoutUnitDistance *distance;
  GEOPDPlaceSummaryLayoutUnitPrice *price;
  GEOPDPlaceSummaryLayoutUnitHours *hours;
  GEOPDPlaceSummaryLayoutUnitAddress *address;
  GEOPDPlaceSummaryLayoutUnitRatings *ratings;
  GEOPDPlaceSummaryLayoutUnitTransitShields *transitShields;
  GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *userGeneratedGuides;
  GEOPDPlaceSummaryLayoutUnitCuratedGuides *curatedGuides;
  GEOPDPlaceSummaryLayoutUnitEVChargersNumber *evChargersNumber;
  GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *ugcUserSubmittedRecommendations;
  GEOPDPlaceSummaryLayoutUnitString *string;
  GEOPDPlaceSummaryLayoutUnitServerOverride *serverOverride;
  GEOPDPlaceSummaryLayoutUnitContainment *containment;
  GEOPDPlaceSummaryLayoutUnitRecent *recent;
  GEOPDPlaceSummaryLayoutUnitHighlightMain *highlightMain;
  GEOPDPlaceSummaryLayoutUnitHighlightExtra *highlightExtra;
  GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *publisherNameForGuide;
  GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *numPlacesInGuide;
  GEOPDPlaceSummaryLayoutUnitPublisherDescription *publisherDescription;
  GEOPDPlaceSummaryLayoutUnitSecondaryName *secondaryName;
  GEOPDPlaceSummaryLayoutUnitFactoid *factoid;
  GEOPDPlaceSummaryLayoutUnitArpRatings *arpRatings;
  GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *realTimeEvChargerAvailability;
  GEOPDPlaceSummaryLayoutUnitDetourTime *detourTime;
  GEOPDPlaceSummaryLayoutUnitHikingDifficulty *hikingDifficulty;
  GEOPDPlaceSummaryLayoutUnitHikingTrailLength *hikingTrailLength;
  GEOPDPlaceSummaryLayoutUnitPhotoCarousel *photoCarousel;
  GEOPDPlaceSummaryLayoutUnitUserNote *userNote;
  GEOPDPlaceSummaryLayoutUnitInUserLibrary *inUserLibrary;
  GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *hikeRouteElevationGainLoss;
  GEOPDPlaceSummaryLayoutUnitHikeRouteType *hikeRouteType;
  GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *hikeRouteDuration;
  GEOPDPlaceSummaryLayoutUnitHikeRouteLength *hikeRouteLength;
  uint64_t v41;
  GEOPDPlaceSummaryLayoutUnit *alternativeUnit;
  char v43;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_84;
  -[GEOPDPlaceSummaryLayoutUnit readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  v5 = *(_QWORD *)(v4 + 324);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_type != *((_DWORD *)v4 + 80))
      goto LABEL_84;
  }
  else if ((v5 & 2) != 0)
  {
LABEL_84:
    v43 = 0;
    goto LABEL_85;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 22) && !-[GEOPDPlaceSummaryLayoutUnitName isEqual:](name, "isEqual:"))
    goto LABEL_84;
  category = self->_category;
  if ((unint64_t)category | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitCategory isEqual:](category, "isEqual:"))
      goto LABEL_84;
  }
  distance = self->_distance;
  if ((unint64_t)distance | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitDistance isEqual:](distance, "isEqual:"))
      goto LABEL_84;
  }
  price = self->_price;
  if ((unint64_t)price | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPrice isEqual:](price, "isEqual:"))
      goto LABEL_84;
  }
  hours = self->_hours;
  if ((unint64_t)hours | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHours isEqual:](hours, "isEqual:"))
      goto LABEL_84;
  }
  address = self->_address;
  if ((unint64_t)address | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitAddress isEqual:](address, "isEqual:"))
      goto LABEL_84;
  }
  ratings = self->_ratings;
  if ((unint64_t)ratings | *((_QWORD *)v4 + 28))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitRatings isEqual:](ratings, "isEqual:"))
      goto LABEL_84;
  }
  transitShields = self->_transitShields;
  if ((unint64_t)transitShields | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitTransitShields isEqual:](transitShields, "isEqual:"))
      goto LABEL_84;
  }
  userGeneratedGuides = self->_userGeneratedGuides;
  if ((unint64_t)userGeneratedGuides | *((_QWORD *)v4 + 36))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides isEqual:](userGeneratedGuides, "isEqual:"))
      goto LABEL_84;
  }
  curatedGuides = self->_curatedGuides;
  if ((unint64_t)curatedGuides | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitCuratedGuides isEqual:](curatedGuides, "isEqual:"))
      goto LABEL_84;
  }
  evChargersNumber = self->_evChargersNumber;
  if ((unint64_t)evChargersNumber | *((_QWORD *)v4 + 10))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitEVChargersNumber isEqual:](evChargersNumber, "isEqual:"))
      goto LABEL_84;
  }
  ugcUserSubmittedRecommendations = self->_ugcUserSubmittedRecommendations;
  if ((unint64_t)ugcUserSubmittedRecommendations | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations isEqual:](ugcUserSubmittedRecommendations, "isEqual:"))goto LABEL_84;
  }
  string = self->_string;
  if ((unint64_t)string | *((_QWORD *)v4 + 33))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitString isEqual:](string, "isEqual:"))
      goto LABEL_84;
  }
  serverOverride = self->_serverOverride;
  if ((unint64_t)serverOverride | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitServerOverride isEqual:](serverOverride, "isEqual:"))
      goto LABEL_84;
  }
  containment = self->_containment;
  if ((unint64_t)containment | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitContainment isEqual:](containment, "isEqual:"))
      goto LABEL_84;
  }
  recent = self->_recent;
  if ((unint64_t)recent | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitRecent isEqual:](recent, "isEqual:"))
      goto LABEL_84;
  }
  highlightMain = self->_highlightMain;
  if ((unint64_t)highlightMain | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHighlightMain isEqual:](highlightMain, "isEqual:"))
      goto LABEL_84;
  }
  highlightExtra = self->_highlightExtra;
  if ((unint64_t)highlightExtra | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHighlightExtra isEqual:](highlightExtra, "isEqual:"))
      goto LABEL_84;
  }
  publisherNameForGuide = self->_publisherNameForGuide;
  if ((unint64_t)publisherNameForGuide | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide isEqual:](publisherNameForGuide, "isEqual:"))
      goto LABEL_84;
  }
  numPlacesInGuide = self->_numPlacesInGuide;
  if ((unint64_t)numPlacesInGuide | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide isEqual:](numPlacesInGuide, "isEqual:"))
      goto LABEL_84;
  }
  publisherDescription = self->_publisherDescription;
  if ((unint64_t)publisherDescription | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPublisherDescription isEqual:](publisherDescription, "isEqual:"))
      goto LABEL_84;
  }
  secondaryName = self->_secondaryName;
  if ((unint64_t)secondaryName | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitSecondaryName isEqual:](secondaryName, "isEqual:"))
      goto LABEL_84;
  }
  factoid = self->_factoid;
  if ((unint64_t)factoid | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitFactoid isEqual:](factoid, "isEqual:"))
      goto LABEL_84;
  }
  arpRatings = self->_arpRatings;
  if ((unint64_t)arpRatings | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitArpRatings isEqual:](arpRatings, "isEqual:"))
      goto LABEL_84;
  }
  realTimeEvChargerAvailability = self->_realTimeEvChargerAvailability;
  if ((unint64_t)realTimeEvChargerAvailability | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability isEqual:](realTimeEvChargerAvailability, "isEqual:"))goto LABEL_84;
  }
  detourTime = self->_detourTime;
  if ((unint64_t)detourTime | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitDetourTime isEqual:](detourTime, "isEqual:"))
      goto LABEL_84;
  }
  hikingDifficulty = self->_hikingDifficulty;
  if ((unint64_t)hikingDifficulty | *((_QWORD *)v4 + 18))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikingDifficulty isEqual:](hikingDifficulty, "isEqual:"))
      goto LABEL_84;
  }
  hikingTrailLength = self->_hikingTrailLength;
  if ((unint64_t)hikingTrailLength | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikingTrailLength isEqual:](hikingTrailLength, "isEqual:"))
      goto LABEL_84;
  }
  photoCarousel = self->_photoCarousel;
  if ((unint64_t)photoCarousel | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitPhotoCarousel isEqual:](photoCarousel, "isEqual:"))
      goto LABEL_84;
  }
  userNote = self->_userNote;
  if ((unint64_t)userNote | *((_QWORD *)v4 + 37))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitUserNote isEqual:](userNote, "isEqual:"))
      goto LABEL_84;
  }
  inUserLibrary = self->_inUserLibrary;
  if ((unint64_t)inUserLibrary | *((_QWORD *)v4 + 21))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitInUserLibrary isEqual:](inUserLibrary, "isEqual:"))
      goto LABEL_84;
  }
  hikeRouteElevationGainLoss = self->_hikeRouteElevationGainLoss;
  if ((unint64_t)hikeRouteElevationGainLoss | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss isEqual:](hikeRouteElevationGainLoss, "isEqual:"))goto LABEL_84;
  }
  hikeRouteType = self->_hikeRouteType;
  if ((unint64_t)hikeRouteType | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteType isEqual:](hikeRouteType, "isEqual:"))
      goto LABEL_84;
  }
  hikeRouteDuration = self->_hikeRouteDuration;
  if ((unint64_t)hikeRouteDuration | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration isEqual:](hikeRouteDuration, "isEqual:"))
      goto LABEL_84;
  }
  hikeRouteLength = self->_hikeRouteLength;
  if ((unint64_t)hikeRouteLength | *((_QWORD *)v4 + 16))
  {
    if (!-[GEOPDPlaceSummaryLayoutUnitHikeRouteLength isEqual:](hikeRouteLength, "isEqual:"))
      goto LABEL_84;
  }
  v41 = *(_QWORD *)(v4 + 324);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v41 & 1) == 0 || self->_layoutPriority != *((_DWORD *)v4 + 79))
      goto LABEL_84;
  }
  else if ((v41 & 1) != 0)
  {
    goto LABEL_84;
  }
  alternativeUnit = self->_alternativeUnit;
  if ((unint64_t)alternativeUnit | *((_QWORD *)v4 + 3))
    v43 = -[GEOPDPlaceSummaryLayoutUnit isEqual:](alternativeUnit, "isEqual:");
  else
    v43 = 1;
LABEL_85:

  return v43;
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
  uint64_t v40;

  -[GEOPDPlaceSummaryLayoutUnit readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v40 = 2654435761 * self->_type;
  else
    v40 = 0;
  v39 = -[GEOPDPlaceSummaryLayoutUnitName hash](self->_name, "hash");
  v38 = -[GEOPDPlaceSummaryLayoutUnitCategory hash](self->_category, "hash");
  v37 = -[GEOPDPlaceSummaryLayoutUnitDistance hash](self->_distance, "hash");
  v36 = -[GEOPDPlaceSummaryLayoutUnitPrice hash](self->_price, "hash");
  v35 = -[GEOPDPlaceSummaryLayoutUnitHours hash](self->_hours, "hash");
  v34 = -[GEOPDPlaceSummaryLayoutUnitAddress hash](self->_address, "hash");
  v33 = -[GEOPDPlaceSummaryLayoutUnitRatings hash](self->_ratings, "hash");
  v32 = -[GEOPDPlaceSummaryLayoutUnitTransitShields hash](self->_transitShields, "hash");
  v31 = -[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides hash](self->_userGeneratedGuides, "hash");
  v30 = -[GEOPDPlaceSummaryLayoutUnitCuratedGuides hash](self->_curatedGuides, "hash");
  v29 = -[GEOPDPlaceSummaryLayoutUnitEVChargersNumber hash](self->_evChargersNumber, "hash");
  v28 = -[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations hash](self->_ugcUserSubmittedRecommendations, "hash");
  v27 = -[GEOPDPlaceSummaryLayoutUnitString hash](self->_string, "hash");
  v26 = -[GEOPDPlaceSummaryLayoutUnitServerOverride hash](self->_serverOverride, "hash");
  v25 = -[GEOPDPlaceSummaryLayoutUnitContainment hash](self->_containment, "hash");
  v24 = -[GEOPDPlaceSummaryLayoutUnitRecent hash](self->_recent, "hash");
  v23 = -[GEOPDPlaceSummaryLayoutUnitHighlightMain hash](self->_highlightMain, "hash");
  v22 = -[GEOPDPlaceSummaryLayoutUnitHighlightExtra hash](self->_highlightExtra, "hash");
  v21 = -[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide hash](self->_publisherNameForGuide, "hash");
  v20 = -[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide hash](self->_numPlacesInGuide, "hash");
  v19 = -[GEOPDPlaceSummaryLayoutUnitPublisherDescription hash](self->_publisherDescription, "hash");
  v18 = -[GEOPDPlaceSummaryLayoutUnitSecondaryName hash](self->_secondaryName, "hash");
  v17 = -[GEOPDPlaceSummaryLayoutUnitFactoid hash](self->_factoid, "hash");
  v16 = -[GEOPDPlaceSummaryLayoutUnitArpRatings hash](self->_arpRatings, "hash");
  v15 = -[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability hash](self->_realTimeEvChargerAvailability, "hash");
  v14 = -[GEOPDPlaceSummaryLayoutUnitDetourTime hash](self->_detourTime, "hash");
  v3 = -[GEOPDPlaceSummaryLayoutUnitHikingDifficulty hash](self->_hikingDifficulty, "hash");
  v4 = -[GEOPDPlaceSummaryLayoutUnitHikingTrailLength hash](self->_hikingTrailLength, "hash");
  v5 = -[GEOPDPlaceSummaryLayoutUnitPhotoCarousel hash](self->_photoCarousel, "hash");
  v6 = -[GEOPDPlaceSummaryLayoutUnitUserNote hash](self->_userNote, "hash");
  v7 = -[GEOPDPlaceSummaryLayoutUnitInUserLibrary hash](self->_inUserLibrary, "hash");
  v8 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss hash](self->_hikeRouteElevationGainLoss, "hash");
  v9 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteType hash](self->_hikeRouteType, "hash");
  v10 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration hash](self->_hikeRouteDuration, "hash");
  v11 = -[GEOPDPlaceSummaryLayoutUnitHikeRouteLength hash](self->_hikeRouteLength, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v12 = 2654435761 * self->_layoutPriority;
  else
    v12 = 0;
  return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[GEOPDPlaceSummaryLayoutUnit hash](self->_alternativeUnit, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDPlaceSummaryLayoutUnitName *name;
  uint64_t v6;
  GEOPDPlaceSummaryLayoutUnitCategory *category;
  uint64_t v8;
  GEOPDPlaceSummaryLayoutUnitDistance *distance;
  uint64_t v10;
  GEOPDPlaceSummaryLayoutUnitPrice *price;
  uint64_t v12;
  GEOPDPlaceSummaryLayoutUnitHours *hours;
  uint64_t v14;
  GEOPDPlaceSummaryLayoutUnitAddress *address;
  uint64_t v16;
  GEOPDPlaceSummaryLayoutUnitRatings *ratings;
  uint64_t v18;
  GEOPDPlaceSummaryLayoutUnitTransitShields *transitShields;
  uint64_t v20;
  GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides *userGeneratedGuides;
  uint64_t v22;
  GEOPDPlaceSummaryLayoutUnitCuratedGuides *curatedGuides;
  uint64_t v24;
  GEOPDPlaceSummaryLayoutUnitEVChargersNumber *evChargersNumber;
  uint64_t v26;
  GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations *ugcUserSubmittedRecommendations;
  uint64_t v28;
  GEOPDPlaceSummaryLayoutUnitString *string;
  uint64_t v30;
  GEOPDPlaceSummaryLayoutUnitServerOverride *serverOverride;
  uint64_t v32;
  GEOPDPlaceSummaryLayoutUnitContainment *containment;
  uint64_t v34;
  GEOPDPlaceSummaryLayoutUnitRecent *recent;
  uint64_t v36;
  GEOPDPlaceSummaryLayoutUnitHighlightMain *highlightMain;
  uint64_t v38;
  GEOPDPlaceSummaryLayoutUnitHighlightExtra *highlightExtra;
  uint64_t v40;
  GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide *publisherNameForGuide;
  uint64_t v42;
  GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide *numPlacesInGuide;
  uint64_t v44;
  GEOPDPlaceSummaryLayoutUnitPublisherDescription *publisherDescription;
  uint64_t v46;
  GEOPDPlaceSummaryLayoutUnitSecondaryName *secondaryName;
  uint64_t v48;
  GEOPDPlaceSummaryLayoutUnitFactoid *factoid;
  uint64_t v50;
  GEOPDPlaceSummaryLayoutUnitArpRatings *arpRatings;
  uint64_t v52;
  GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability *realTimeEvChargerAvailability;
  uint64_t v54;
  GEOPDPlaceSummaryLayoutUnitDetourTime *detourTime;
  uint64_t v56;
  GEOPDPlaceSummaryLayoutUnitHikingDifficulty *hikingDifficulty;
  uint64_t v58;
  GEOPDPlaceSummaryLayoutUnitHikingTrailLength *hikingTrailLength;
  uint64_t v60;
  GEOPDPlaceSummaryLayoutUnitPhotoCarousel *photoCarousel;
  uint64_t v62;
  GEOPDPlaceSummaryLayoutUnitUserNote *userNote;
  uint64_t v64;
  GEOPDPlaceSummaryLayoutUnitInUserLibrary *inUserLibrary;
  uint64_t v66;
  GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss *hikeRouteElevationGainLoss;
  uint64_t v68;
  GEOPDPlaceSummaryLayoutUnitHikeRouteType *hikeRouteType;
  uint64_t v70;
  GEOPDPlaceSummaryLayoutUnitHikeRouteDuration *hikeRouteDuration;
  uint64_t v72;
  GEOPDPlaceSummaryLayoutUnitHikeRouteLength *hikeRouteLength;
  uint64_t v74;
  GEOPDPlaceSummaryLayoutUnit *alternativeUnit;
  uint64_t v76;
  int *v77;

  v77 = (int *)a3;
  objc_msgSend(v77, "readAll:", 0);
  v4 = v77;
  if ((v77[81] & 2) != 0)
  {
    self->_type = v77[80];
    *(_QWORD *)&self->_flags |= 2uLL;
  }
  name = self->_name;
  v6 = *((_QWORD *)v77 + 22);
  if (name)
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDPlaceSummaryLayoutUnitName mergeFrom:](name, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEOPDPlaceSummaryLayoutUnit setName:](self, "setName:");
  }
  v4 = v77;
LABEL_9:
  category = self->_category;
  v8 = *((_QWORD *)v4 + 5);
  if (category)
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDPlaceSummaryLayoutUnitCategory mergeFrom:](category, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEOPDPlaceSummaryLayoutUnit setCategory:](self, "setCategory:");
  }
  v4 = v77;
LABEL_15:
  distance = self->_distance;
  v10 = *((_QWORD *)v4 + 9);
  if (distance)
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDPlaceSummaryLayoutUnitDistance mergeFrom:](distance, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEOPDPlaceSummaryLayoutUnit setDistance:](self, "setDistance:");
  }
  v4 = v77;
LABEL_21:
  price = self->_price;
  v12 = *((_QWORD *)v4 + 25);
  if (price)
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPDPlaceSummaryLayoutUnitPrice mergeFrom:](price, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEOPDPlaceSummaryLayoutUnit setPrice:](self, "setPrice:");
  }
  v4 = v77;
LABEL_27:
  hours = self->_hours;
  v14 = *((_QWORD *)v4 + 20);
  if (hours)
  {
    if (!v14)
      goto LABEL_33;
    -[GEOPDPlaceSummaryLayoutUnitHours mergeFrom:](hours, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEOPDPlaceSummaryLayoutUnit setHours:](self, "setHours:");
  }
  v4 = v77;
LABEL_33:
  address = self->_address;
  v16 = *((_QWORD *)v4 + 2);
  if (address)
  {
    if (!v16)
      goto LABEL_39;
    -[GEOPDPlaceSummaryLayoutUnitAddress mergeFrom:](address, "mergeFrom:");
  }
  else
  {
    if (!v16)
      goto LABEL_39;
    -[GEOPDPlaceSummaryLayoutUnit setAddress:](self, "setAddress:");
  }
  v4 = v77;
LABEL_39:
  ratings = self->_ratings;
  v18 = *((_QWORD *)v4 + 28);
  if (ratings)
  {
    if (!v18)
      goto LABEL_45;
    -[GEOPDPlaceSummaryLayoutUnitRatings mergeFrom:](ratings, "mergeFrom:");
  }
  else
  {
    if (!v18)
      goto LABEL_45;
    -[GEOPDPlaceSummaryLayoutUnit setRatings:](self, "setRatings:");
  }
  v4 = v77;
LABEL_45:
  transitShields = self->_transitShields;
  v20 = *((_QWORD *)v4 + 34);
  if (transitShields)
  {
    if (!v20)
      goto LABEL_51;
    -[GEOPDPlaceSummaryLayoutUnitTransitShields mergeFrom:](transitShields, "mergeFrom:");
  }
  else
  {
    if (!v20)
      goto LABEL_51;
    -[GEOPDPlaceSummaryLayoutUnit setTransitShields:](self, "setTransitShields:");
  }
  v4 = v77;
LABEL_51:
  userGeneratedGuides = self->_userGeneratedGuides;
  v22 = *((_QWORD *)v4 + 36);
  if (userGeneratedGuides)
  {
    if (!v22)
      goto LABEL_57;
    -[GEOPDPlaceSummaryLayoutUnitUserGeneratedGuides mergeFrom:](userGeneratedGuides, "mergeFrom:");
  }
  else
  {
    if (!v22)
      goto LABEL_57;
    -[GEOPDPlaceSummaryLayoutUnit setUserGeneratedGuides:](self, "setUserGeneratedGuides:");
  }
  v4 = v77;
LABEL_57:
  curatedGuides = self->_curatedGuides;
  v24 = *((_QWORD *)v4 + 7);
  if (curatedGuides)
  {
    if (!v24)
      goto LABEL_63;
    -[GEOPDPlaceSummaryLayoutUnitCuratedGuides mergeFrom:](curatedGuides, "mergeFrom:");
  }
  else
  {
    if (!v24)
      goto LABEL_63;
    -[GEOPDPlaceSummaryLayoutUnit setCuratedGuides:](self, "setCuratedGuides:");
  }
  v4 = v77;
LABEL_63:
  evChargersNumber = self->_evChargersNumber;
  v26 = *((_QWORD *)v4 + 10);
  if (evChargersNumber)
  {
    if (!v26)
      goto LABEL_69;
    -[GEOPDPlaceSummaryLayoutUnitEVChargersNumber mergeFrom:](evChargersNumber, "mergeFrom:");
  }
  else
  {
    if (!v26)
      goto LABEL_69;
    -[GEOPDPlaceSummaryLayoutUnit setEvChargersNumber:](self, "setEvChargersNumber:");
  }
  v4 = v77;
LABEL_69:
  ugcUserSubmittedRecommendations = self->_ugcUserSubmittedRecommendations;
  v28 = *((_QWORD *)v4 + 35);
  if (ugcUserSubmittedRecommendations)
  {
    if (!v28)
      goto LABEL_75;
    -[GEOPDPlaceSummaryLayoutUnitUGCUserSubmittedRecommendations mergeFrom:](ugcUserSubmittedRecommendations, "mergeFrom:");
  }
  else
  {
    if (!v28)
      goto LABEL_75;
    -[GEOPDPlaceSummaryLayoutUnit setUgcUserSubmittedRecommendations:](self, "setUgcUserSubmittedRecommendations:");
  }
  v4 = v77;
LABEL_75:
  string = self->_string;
  v30 = *((_QWORD *)v4 + 33);
  if (string)
  {
    if (!v30)
      goto LABEL_81;
    -[GEOPDPlaceSummaryLayoutUnitString mergeFrom:](string, "mergeFrom:");
  }
  else
  {
    if (!v30)
      goto LABEL_81;
    -[GEOPDPlaceSummaryLayoutUnit setString:](self, "setString:");
  }
  v4 = v77;
LABEL_81:
  serverOverride = self->_serverOverride;
  v32 = *((_QWORD *)v4 + 32);
  if (serverOverride)
  {
    if (!v32)
      goto LABEL_87;
    -[GEOPDPlaceSummaryLayoutUnitServerOverride mergeFrom:](serverOverride, "mergeFrom:");
  }
  else
  {
    if (!v32)
      goto LABEL_87;
    -[GEOPDPlaceSummaryLayoutUnit setServerOverride:](self, "setServerOverride:");
  }
  v4 = v77;
LABEL_87:
  containment = self->_containment;
  v34 = *((_QWORD *)v4 + 6);
  if (containment)
  {
    if (!v34)
      goto LABEL_93;
    -[GEOPDPlaceSummaryLayoutUnitContainment mergeFrom:](containment, "mergeFrom:");
  }
  else
  {
    if (!v34)
      goto LABEL_93;
    -[GEOPDPlaceSummaryLayoutUnit setContainment:](self, "setContainment:");
  }
  v4 = v77;
LABEL_93:
  recent = self->_recent;
  v36 = *((_QWORD *)v4 + 30);
  if (recent)
  {
    if (!v36)
      goto LABEL_99;
    -[GEOPDPlaceSummaryLayoutUnitRecent mergeFrom:](recent, "mergeFrom:");
  }
  else
  {
    if (!v36)
      goto LABEL_99;
    -[GEOPDPlaceSummaryLayoutUnit setRecent:](self, "setRecent:");
  }
  v4 = v77;
LABEL_99:
  highlightMain = self->_highlightMain;
  v38 = *((_QWORD *)v4 + 13);
  if (highlightMain)
  {
    if (!v38)
      goto LABEL_105;
    -[GEOPDPlaceSummaryLayoutUnitHighlightMain mergeFrom:](highlightMain, "mergeFrom:");
  }
  else
  {
    if (!v38)
      goto LABEL_105;
    -[GEOPDPlaceSummaryLayoutUnit setHighlightMain:](self, "setHighlightMain:");
  }
  v4 = v77;
LABEL_105:
  highlightExtra = self->_highlightExtra;
  v40 = *((_QWORD *)v4 + 12);
  if (highlightExtra)
  {
    if (!v40)
      goto LABEL_111;
    -[GEOPDPlaceSummaryLayoutUnitHighlightExtra mergeFrom:](highlightExtra, "mergeFrom:");
  }
  else
  {
    if (!v40)
      goto LABEL_111;
    -[GEOPDPlaceSummaryLayoutUnit setHighlightExtra:](self, "setHighlightExtra:");
  }
  v4 = v77;
LABEL_111:
  publisherNameForGuide = self->_publisherNameForGuide;
  v42 = *((_QWORD *)v4 + 27);
  if (publisherNameForGuide)
  {
    if (!v42)
      goto LABEL_117;
    -[GEOPDPlaceSummaryLayoutUnitPublisherNameForGuide mergeFrom:](publisherNameForGuide, "mergeFrom:");
  }
  else
  {
    if (!v42)
      goto LABEL_117;
    -[GEOPDPlaceSummaryLayoutUnit setPublisherNameForGuide:](self, "setPublisherNameForGuide:");
  }
  v4 = v77;
LABEL_117:
  numPlacesInGuide = self->_numPlacesInGuide;
  v44 = *((_QWORD *)v4 + 23);
  if (numPlacesInGuide)
  {
    if (!v44)
      goto LABEL_123;
    -[GEOPDPlaceSummaryLayoutUnitNumPlacesInGuide mergeFrom:](numPlacesInGuide, "mergeFrom:");
  }
  else
  {
    if (!v44)
      goto LABEL_123;
    -[GEOPDPlaceSummaryLayoutUnit setNumPlacesInGuide:](self, "setNumPlacesInGuide:");
  }
  v4 = v77;
LABEL_123:
  publisherDescription = self->_publisherDescription;
  v46 = *((_QWORD *)v4 + 26);
  if (publisherDescription)
  {
    if (!v46)
      goto LABEL_129;
    -[GEOPDPlaceSummaryLayoutUnitPublisherDescription mergeFrom:](publisherDescription, "mergeFrom:");
  }
  else
  {
    if (!v46)
      goto LABEL_129;
    -[GEOPDPlaceSummaryLayoutUnit setPublisherDescription:](self, "setPublisherDescription:");
  }
  v4 = v77;
LABEL_129:
  secondaryName = self->_secondaryName;
  v48 = *((_QWORD *)v4 + 31);
  if (secondaryName)
  {
    if (!v48)
      goto LABEL_135;
    -[GEOPDPlaceSummaryLayoutUnitSecondaryName mergeFrom:](secondaryName, "mergeFrom:");
  }
  else
  {
    if (!v48)
      goto LABEL_135;
    -[GEOPDPlaceSummaryLayoutUnit setSecondaryName:](self, "setSecondaryName:");
  }
  v4 = v77;
LABEL_135:
  factoid = self->_factoid;
  v50 = *((_QWORD *)v4 + 11);
  if (factoid)
  {
    if (!v50)
      goto LABEL_141;
    -[GEOPDPlaceSummaryLayoutUnitFactoid mergeFrom:](factoid, "mergeFrom:");
  }
  else
  {
    if (!v50)
      goto LABEL_141;
    -[GEOPDPlaceSummaryLayoutUnit setFactoid:](self, "setFactoid:");
  }
  v4 = v77;
LABEL_141:
  arpRatings = self->_arpRatings;
  v52 = *((_QWORD *)v4 + 4);
  if (arpRatings)
  {
    if (!v52)
      goto LABEL_147;
    -[GEOPDPlaceSummaryLayoutUnitArpRatings mergeFrom:](arpRatings, "mergeFrom:");
  }
  else
  {
    if (!v52)
      goto LABEL_147;
    -[GEOPDPlaceSummaryLayoutUnit setArpRatings:](self, "setArpRatings:");
  }
  v4 = v77;
LABEL_147:
  realTimeEvChargerAvailability = self->_realTimeEvChargerAvailability;
  v54 = *((_QWORD *)v4 + 29);
  if (realTimeEvChargerAvailability)
  {
    if (!v54)
      goto LABEL_153;
    -[GEOPDPlaceSummaryLayoutUnitRealTimeEVChargerAvailability mergeFrom:](realTimeEvChargerAvailability, "mergeFrom:");
  }
  else
  {
    if (!v54)
      goto LABEL_153;
    -[GEOPDPlaceSummaryLayoutUnit setRealTimeEvChargerAvailability:](self, "setRealTimeEvChargerAvailability:");
  }
  v4 = v77;
LABEL_153:
  detourTime = self->_detourTime;
  v56 = *((_QWORD *)v4 + 8);
  if (detourTime)
  {
    if (!v56)
      goto LABEL_159;
    -[GEOPDPlaceSummaryLayoutUnitDetourTime mergeFrom:](detourTime, "mergeFrom:");
  }
  else
  {
    if (!v56)
      goto LABEL_159;
    -[GEOPDPlaceSummaryLayoutUnit setDetourTime:](self, "setDetourTime:");
  }
  v4 = v77;
LABEL_159:
  hikingDifficulty = self->_hikingDifficulty;
  v58 = *((_QWORD *)v4 + 18);
  if (hikingDifficulty)
  {
    if (!v58)
      goto LABEL_165;
    -[GEOPDPlaceSummaryLayoutUnitHikingDifficulty mergeFrom:](hikingDifficulty, "mergeFrom:");
  }
  else
  {
    if (!v58)
      goto LABEL_165;
    -[GEOPDPlaceSummaryLayoutUnit setHikingDifficulty:](self, "setHikingDifficulty:");
  }
  v4 = v77;
LABEL_165:
  hikingTrailLength = self->_hikingTrailLength;
  v60 = *((_QWORD *)v4 + 19);
  if (hikingTrailLength)
  {
    if (!v60)
      goto LABEL_171;
    -[GEOPDPlaceSummaryLayoutUnitHikingTrailLength mergeFrom:](hikingTrailLength, "mergeFrom:");
  }
  else
  {
    if (!v60)
      goto LABEL_171;
    -[GEOPDPlaceSummaryLayoutUnit setHikingTrailLength:](self, "setHikingTrailLength:");
  }
  v4 = v77;
LABEL_171:
  photoCarousel = self->_photoCarousel;
  v62 = *((_QWORD *)v4 + 24);
  if (photoCarousel)
  {
    if (!v62)
      goto LABEL_177;
    -[GEOPDPlaceSummaryLayoutUnitPhotoCarousel mergeFrom:](photoCarousel, "mergeFrom:");
  }
  else
  {
    if (!v62)
      goto LABEL_177;
    -[GEOPDPlaceSummaryLayoutUnit setPhotoCarousel:](self, "setPhotoCarousel:");
  }
  v4 = v77;
LABEL_177:
  userNote = self->_userNote;
  v64 = *((_QWORD *)v4 + 37);
  if (userNote)
  {
    if (!v64)
      goto LABEL_183;
    -[GEOPDPlaceSummaryLayoutUnitUserNote mergeFrom:](userNote, "mergeFrom:");
  }
  else
  {
    if (!v64)
      goto LABEL_183;
    -[GEOPDPlaceSummaryLayoutUnit setUserNote:](self, "setUserNote:");
  }
  v4 = v77;
LABEL_183:
  inUserLibrary = self->_inUserLibrary;
  v66 = *((_QWORD *)v4 + 21);
  if (inUserLibrary)
  {
    if (!v66)
      goto LABEL_189;
    -[GEOPDPlaceSummaryLayoutUnitInUserLibrary mergeFrom:](inUserLibrary, "mergeFrom:");
  }
  else
  {
    if (!v66)
      goto LABEL_189;
    -[GEOPDPlaceSummaryLayoutUnit setInUserLibrary:](self, "setInUserLibrary:");
  }
  v4 = v77;
LABEL_189:
  hikeRouteElevationGainLoss = self->_hikeRouteElevationGainLoss;
  v68 = *((_QWORD *)v4 + 15);
  if (hikeRouteElevationGainLoss)
  {
    if (!v68)
      goto LABEL_195;
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteFactoidElevationGainLoss mergeFrom:](hikeRouteElevationGainLoss, "mergeFrom:");
  }
  else
  {
    if (!v68)
      goto LABEL_195;
    -[GEOPDPlaceSummaryLayoutUnit setHikeRouteElevationGainLoss:](self, "setHikeRouteElevationGainLoss:");
  }
  v4 = v77;
LABEL_195:
  hikeRouteType = self->_hikeRouteType;
  v70 = *((_QWORD *)v4 + 17);
  if (hikeRouteType)
  {
    if (!v70)
      goto LABEL_201;
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteType mergeFrom:](hikeRouteType, "mergeFrom:");
  }
  else
  {
    if (!v70)
      goto LABEL_201;
    -[GEOPDPlaceSummaryLayoutUnit setHikeRouteType:](self, "setHikeRouteType:");
  }
  v4 = v77;
LABEL_201:
  hikeRouteDuration = self->_hikeRouteDuration;
  v72 = *((_QWORD *)v4 + 14);
  if (hikeRouteDuration)
  {
    if (!v72)
      goto LABEL_207;
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteDuration mergeFrom:](hikeRouteDuration, "mergeFrom:");
  }
  else
  {
    if (!v72)
      goto LABEL_207;
    -[GEOPDPlaceSummaryLayoutUnit setHikeRouteDuration:](self, "setHikeRouteDuration:");
  }
  v4 = v77;
LABEL_207:
  hikeRouteLength = self->_hikeRouteLength;
  v74 = *((_QWORD *)v4 + 16);
  if (hikeRouteLength)
  {
    if (!v74)
      goto LABEL_213;
    -[GEOPDPlaceSummaryLayoutUnitHikeRouteLength mergeFrom:](hikeRouteLength, "mergeFrom:");
  }
  else
  {
    if (!v74)
      goto LABEL_213;
    -[GEOPDPlaceSummaryLayoutUnit setHikeRouteLength:](self, "setHikeRouteLength:");
  }
  v4 = v77;
LABEL_213:
  if ((v4[81] & 1) != 0)
  {
    self->_layoutPriority = v4[79];
    *(_QWORD *)&self->_flags |= 1uLL;
  }
  alternativeUnit = self->_alternativeUnit;
  v76 = *((_QWORD *)v4 + 3);
  if (alternativeUnit)
  {
    if (v76)
    {
      -[GEOPDPlaceSummaryLayoutUnit mergeFrom:](alternativeUnit, "mergeFrom:");
LABEL_220:
      v4 = v77;
    }
  }
  else if (v76)
  {
    -[GEOPDPlaceSummaryLayoutUnit setAlternativeUnit:](self, "setAlternativeUnit:");
    goto LABEL_220;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userNote, 0);
  objc_storeStrong((id *)&self->_userGeneratedGuides, 0);
  objc_storeStrong((id *)&self->_ugcUserSubmittedRecommendations, 0);
  objc_storeStrong((id *)&self->_transitShields, 0);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_serverOverride, 0);
  objc_storeStrong((id *)&self->_secondaryName, 0);
  objc_storeStrong((id *)&self->_recent, 0);
  objc_storeStrong((id *)&self->_realTimeEvChargerAvailability, 0);
  objc_storeStrong((id *)&self->_ratings, 0);
  objc_storeStrong((id *)&self->_publisherNameForGuide, 0);
  objc_storeStrong((id *)&self->_publisherDescription, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_photoCarousel, 0);
  objc_storeStrong((id *)&self->_numPlacesInGuide, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_inUserLibrary, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_hikingTrailLength, 0);
  objc_storeStrong((id *)&self->_hikingDifficulty, 0);
  objc_storeStrong((id *)&self->_hikeRouteType, 0);
  objc_storeStrong((id *)&self->_hikeRouteLength, 0);
  objc_storeStrong((id *)&self->_hikeRouteElevationGainLoss, 0);
  objc_storeStrong((id *)&self->_hikeRouteDuration, 0);
  objc_storeStrong((id *)&self->_highlightMain, 0);
  objc_storeStrong((id *)&self->_highlightExtra, 0);
  objc_storeStrong((id *)&self->_factoid, 0);
  objc_storeStrong((id *)&self->_evChargersNumber, 0);
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_detourTime, 0);
  objc_storeStrong((id *)&self->_curatedGuides, 0);
  objc_storeStrong((id *)&self->_containment, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_arpRatings, 0);
  objc_storeStrong((id *)&self->_alternativeUnit, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
