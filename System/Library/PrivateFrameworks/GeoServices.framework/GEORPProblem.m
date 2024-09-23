@implementation GEORPProblem

- (GEORPProblem)init
{
  GEORPProblem *v2;
  GEORPProblem *v3;
  GEORPProblem *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPProblem;
  v2 = -[GEORPProblem init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPProblem)initWithData:(id)a3
{
  GEORPProblem *v3;
  GEORPProblem *v4;
  GEORPProblem *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPProblem;
  v3 = -[GEORPProblem initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEORPProblem;
  -[GEORPProblem dealloc](&v3, sel_dealloc);
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_flags |= 0x22u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 34;
  else
    v3 = 32;
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFD | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_flags >> 1) & 1;
}

- (void)_readUserPaths
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUserPaths_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (unint64_t)userPathsCount
{
  -[GEORPProblem _readUserPaths]((uint64_t)self);
  return self->_userPaths.count;
}

- (int)userPaths
{
  -[GEORPProblem _readUserPaths]((uint64_t)self);
  return self->_userPaths.list;
}

- (void)clearUserPaths
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Clear();
}

- (void)addUserPath:(int)a3
{
  -[GEORPProblem _readUserPaths]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
}

- (int)userPathAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_userPaths;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEORPProblem _readUserPaths]((uint64_t)self);
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
  *(_BYTE *)&self->_flags |= 4u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x20u;
  PBRepeatedInt32Set();
}

- (id)userPathsAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E1C0ECC8[a3];
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

- (int)problemType
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_problemType;
  else
    return -1;
}

- (void)setProblemType:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x21u;
  self->_problemType = a3;
}

- (void)setHasProblemType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 0x20;
}

- (BOOL)hasProblemType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)problemTypeAsString:(int)a3
{
  __CFString *v3;

  v3 = CFSTR("PROBLEM_TYPE_UNKNOWN");
  switch(a3)
  {
    case -1:
      return v3;
    case 0:
      v3 = CFSTR("INCORRECT_INFO");
      return v3;
    case 1:
      return CFSTR("INCORRECT_MAP_LABEL");
    case 2:
      return CFSTR("MISSING_LOCATION");
    case 3:
      return CFSTR("INCORRECT_PIN_LOCATION");
    case 4:
      return CFSTR("CLOSED_PERMANENTLY");
    case 5:
      return CFSTR("DOES_NOT_EXIST_INCORRECT_PIN_LOCATION");
    case 6:
      return CFSTR("DOES_NOT_EXIST_NO_SUCH_PLACE");
    case 7:
      return CFSTR("DOES_NOT_EXIST_OTHER");
    case 8:
      return CFSTR("SEARCH_UNEXPECTED");
    case 9:
      return CFSTR("SEARCH_SELECTED_WRONG_PIN");
    case 10:
      return CFSTR("SEARCH_SHOULD_NOT_HAVE_MOVED_MAP");
    case 11:
      return CFSTR("SEARCH_SHOULD_HAVE_MOVED_MAP");
    case 12:
      return CFSTR("SEARCH_NOT_LISTED");
    case 13:
      return CFSTR("SATELLITE_OUTDATED");
    case 14:
      return CFSTR("SATELLITE_QUALITY");
    case 15:
      return CFSTR("SATELLITE_NOT_LISTED");
    case 16:
      return CFSTR("DIRECTIONS_PROBLEM_BASIC");
    case 17:
      return CFSTR("DIRECTIONS_DESTINATION_WRONG");
    case 20:
      return CFSTR("DIRECTIONS_THROUGH_TRAFFIC");
    case 21:
      return CFSTR("DIRECTIONS_THROUGH_CLOSURE");
    case 22:
      return CFSTR("DIRECTIONS_STEP_WRONG_WAY");
    case 23:
      return CFSTR("DIRECTIONS_STEP_PROHIBITED");
    case 24:
      return CFSTR("DIRECTIONS_STEP_CLOSED_ROAD");
    case 25:
      return CFSTR("DIRECTIONS_STEP_UNNEEDED");
    case 26:
      return CFSTR("DIRECTIONS_STEP_MISSING_BEFORE");
    case 27:
      return CFSTR("DIRECTIONS_STEP_MISSING_AFTER");
    case 28:
      return CFSTR("DIRECTIONS_STEP_NOT_LISTED");
    case 29:
      return CFSTR("DIRECTIONS_NOT_LISTED");
    case 30:
      return CFSTR("TRAFFIC_INCIDENT_INCORRECT");
    case 31:
      return CFSTR("TRAFFIC_INCIDENT_MISSING");
    case 32:
      return CFSTR("TRAFFIC_FLOW_INCORRECT");
    case 33:
      return CFSTR("TRAFFIC_FLOW_MISSING");
    case 34:
      return CFSTR("TRAFFIC_NOT_LISTED");
    case 35:
      return CFSTR("NOT_LISTED");
    case 36:
      return CFSTR("DIRECTIONS_INCORRECT_INSTRUCTIONS");
    case 37:
      return CFSTR("DIRECTIONS_ROUTE_WRONG");
    case 38:
      return CFSTR("DIRECTIONS_PROBLEM_WITH_TRANSFER");
    case 39:
      return CFSTR("DIRECTIONS_INCORRECT_ETA");
    case 40:
      return CFSTR("TRANSIT_DELAY");
    case 41:
      return CFSTR("TRANSIT_INCORRECT_SCHEDULE");
    case 43:
      return CFSTR("INCORRECT_ENTRY_OR_EXIT");
    case 45:
      return CFSTR("INCORRECT_SHAPE");
    case 46:
      return CFSTR("OTHER_FEEDBACK");
    case 47:
      return CFSTR("CLOSED_TEMPORARILY");
    case 48:
      return CFSTR("CLOSED_HOURS_CHANGED");
    case 49:
      return CFSTR("TRANSIT_CANCELATION");
    case 50:
      return CFSTR("TRANSIT_SERVICE_CHANGED");
    case 54:
      return CFSTR("SEARCH_AUTOCOMPLETE_POI");
    case 55:
      return CFSTR("SEARCH_AUTOCOMPLETE_POI_CATEGORY");
    case 56:
      return CFSTR("SEARCH_AUTOCOMPLETE_ADDRESS");
    case 57:
      return CFSTR("SEARCH_AUTOCOMPLETE_LOCALITY");
    case 58:
      return CFSTR("SEARCH_AUTOCOMPLETE_OTHER");
    case 59:
      return CFSTR("TRANSIT_LINE_INCORRECT_NAME");
    case 60:
      return CFSTR("DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT");
    case 61:
      return CFSTR("PERSONALIZED_MAP_LOCATION_INCORRECT");
    case 62:
      return CFSTR("MISSING_LOCATION_BUSINESS");
    case 63:
      return CFSTR("MISSING_LOCATION_STREET");
    case 64:
      return CFSTR("MISSING_LOCATION_OTHER");
    case 65:
      return CFSTR("MERCHANT_LOOKUP");
    case 66:
      return CFSTR("GROUND_VIEW_CENSOR_REQUEST");
    case 67:
      return CFSTR("GROUND_VIEW_IMAGE_QUALITY");
    case 68:
      return CFSTR("GROUND_VIEW_STOREFRONT");
    default:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

- (int)StringAsProblemType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PROBLEM_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = -1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCORRECT_INFO")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCORRECT_MAP_LABEL")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSING_LOCATION")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCORRECT_PIN_LOCATION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_UNEXPECTED")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_SELECTED_WRONG_PIN")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_SHOULD_NOT_HAVE_MOVED_MAP")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_SHOULD_HAVE_MOVED_MAP")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_NOT_LISTED")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE_OUTDATED")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE_QUALITY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SATELLITE_NOT_LISTED")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_PROBLEM_BASIC")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_DESTINATION_WRONG")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_THROUGH_TRAFFIC")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_THROUGH_CLOSURE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_WRONG_WAY")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_PROHIBITED")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_CLOSED_ROAD")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_UNNEEDED")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_MISSING_BEFORE")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_MISSING_AFTER")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_STEP_NOT_LISTED")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_NOT_LISTED")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_INCORRECT")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_MISSING")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_FLOW_INCORRECT")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_FLOW_MISSING")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRAFFIC_NOT_LISTED")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("NOT_LISTED")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_INCORRECT_INSTRUCTIONS")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_ROUTE_WRONG")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_PROBLEM_WITH_TRANSFER")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_INCORRECT_ETA")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_INCORRECT_SCHEDULE")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCORRECT_ENTRY_OR_EXIT")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INCORRECT_SHAPE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OTHER_FEEDBACK")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSED_PERMANENTLY")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSED_TEMPORARILY")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CLOSED_HOURS_CHANGED")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_DELAY")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_CANCELATION")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_SERVICE_CHANGED")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_POI")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_POI_CATEGORY")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_ADDRESS")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_LOCALITY")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_OTHER")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT_LINE_INCORRECT_NAME")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PERSONALIZED_MAP_LOCATION_INCORRECT")) & 1) != 0)
  {
    v4 = 61;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOES_NOT_EXIST_INCORRECT_PIN_LOCATION")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOES_NOT_EXIST_NO_SUCH_PLACE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOES_NOT_EXIST_OTHER")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSING_LOCATION_BUSINESS")) & 1) != 0)
  {
    v4 = 62;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSING_LOCATION_STREET")) & 1) != 0)
  {
    v4 = 63;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MISSING_LOCATION_OTHER")) & 1) != 0)
  {
    v4 = 64;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 65;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_CENSOR_REQUEST")) & 1) != 0)
  {
    v4 = 66;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_IMAGE_QUALITY")) & 1) != 0)
  {
    v4 = 67;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GROUND_VIEW_STOREFRONT")))
  {
    v4 = 68;
  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)_readProblemCorrections
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemCorrections_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemCorrections
{
  -[GEORPProblem _readProblemCorrections]((uint64_t)self);
  return self->_problemCorrections != 0;
}

- (GEORPProblemCorrections)problemCorrections
{
  -[GEORPProblem _readProblemCorrections]((uint64_t)self);
  return self->_problemCorrections;
}

- (void)setProblemCorrections:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x30u;
  objc_storeStrong((id *)&self->_problemCorrections, a3);
}

- (void)_readProblemContext
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
    if ((*(_BYTE *)(a1 + 76) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPProblemReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProblemContext_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 64));
  }
}

- (BOOL)hasProblemContext
{
  -[GEORPProblem _readProblemContext]((uint64_t)self);
  return self->_problemContext != 0;
}

- (GEORPProblemContext)problemContext
{
  -[GEORPProblem _readProblemContext]((uint64_t)self);
  return self->_problemContext;
}

- (void)setProblemContext:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x28u;
  objc_storeStrong((id *)&self->_problemContext, a3);
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
  v8.super_class = (Class)GEORPProblem;
  -[GEORPProblem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPProblem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPProblem _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 76) & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 72));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v6 = CFSTR("protocolVersion");
      else
        v6 = CFSTR("protocol_version");
      objc_msgSend(v4, "setObject:forKey:", v5, v6);

    }
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v9 = 0;
        do
        {
          v10 = *(unsigned int *)(*v8 + 4 * v9);
          if (v10 < 0x3D && ((0x1FFFFF03FFFFFFFFuLL >> v10) & 1) != 0)
          {
            v11 = off_1E1C0ECC8[(int)v10];
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
            v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v7, "addObject:", v11);

          ++v9;
          v8 = (_QWORD *)(a1 + 16);
        }
        while (v9 < *(_QWORD *)(a1 + 24));
      }
      if (a2)
        v12 = CFSTR("userPath");
      else
        v12 = CFSTR("user_path");
      objc_msgSend(v4, "setObject:forKey:", v7, v12);

    }
    if ((*(_BYTE *)(a1 + 76) & 1) != 0)
    {
      v13 = CFSTR("PROBLEM_TYPE_UNKNOWN");
      switch(*(_DWORD *)(a1 + 68))
      {
        case 0xFFFFFFFF:
          break;
        case 0:
          v13 = CFSTR("INCORRECT_INFO");
          break;
        case 1:
          v13 = CFSTR("INCORRECT_MAP_LABEL");
          break;
        case 2:
          v13 = CFSTR("MISSING_LOCATION");
          break;
        case 3:
          v13 = CFSTR("INCORRECT_PIN_LOCATION");
          break;
        case 4:
          v13 = CFSTR("CLOSED_PERMANENTLY");
          break;
        case 5:
          v13 = CFSTR("DOES_NOT_EXIST_INCORRECT_PIN_LOCATION");
          break;
        case 6:
          v13 = CFSTR("DOES_NOT_EXIST_NO_SUCH_PLACE");
          break;
        case 7:
          v13 = CFSTR("DOES_NOT_EXIST_OTHER");
          break;
        case 8:
          v13 = CFSTR("SEARCH_UNEXPECTED");
          break;
        case 9:
          v13 = CFSTR("SEARCH_SELECTED_WRONG_PIN");
          break;
        case 0xA:
          v13 = CFSTR("SEARCH_SHOULD_NOT_HAVE_MOVED_MAP");
          break;
        case 0xB:
          v13 = CFSTR("SEARCH_SHOULD_HAVE_MOVED_MAP");
          break;
        case 0xC:
          v13 = CFSTR("SEARCH_NOT_LISTED");
          break;
        case 0xD:
          v13 = CFSTR("SATELLITE_OUTDATED");
          break;
        case 0xE:
          v13 = CFSTR("SATELLITE_QUALITY");
          break;
        case 0xF:
          v13 = CFSTR("SATELLITE_NOT_LISTED");
          break;
        case 0x10:
          v13 = CFSTR("DIRECTIONS_PROBLEM_BASIC");
          break;
        case 0x11:
          v13 = CFSTR("DIRECTIONS_DESTINATION_WRONG");
          break;
        case 0x14:
          v13 = CFSTR("DIRECTIONS_THROUGH_TRAFFIC");
          break;
        case 0x15:
          v13 = CFSTR("DIRECTIONS_THROUGH_CLOSURE");
          break;
        case 0x16:
          v13 = CFSTR("DIRECTIONS_STEP_WRONG_WAY");
          break;
        case 0x17:
          v13 = CFSTR("DIRECTIONS_STEP_PROHIBITED");
          break;
        case 0x18:
          v13 = CFSTR("DIRECTIONS_STEP_CLOSED_ROAD");
          break;
        case 0x19:
          v13 = CFSTR("DIRECTIONS_STEP_UNNEEDED");
          break;
        case 0x1A:
          v13 = CFSTR("DIRECTIONS_STEP_MISSING_BEFORE");
          break;
        case 0x1B:
          v13 = CFSTR("DIRECTIONS_STEP_MISSING_AFTER");
          break;
        case 0x1C:
          v13 = CFSTR("DIRECTIONS_STEP_NOT_LISTED");
          break;
        case 0x1D:
          v13 = CFSTR("DIRECTIONS_NOT_LISTED");
          break;
        case 0x1E:
          v13 = CFSTR("TRAFFIC_INCIDENT_INCORRECT");
          break;
        case 0x1F:
          v13 = CFSTR("TRAFFIC_INCIDENT_MISSING");
          break;
        case 0x20:
          v13 = CFSTR("TRAFFIC_FLOW_INCORRECT");
          break;
        case 0x21:
          v13 = CFSTR("TRAFFIC_FLOW_MISSING");
          break;
        case 0x22:
          v13 = CFSTR("TRAFFIC_NOT_LISTED");
          break;
        case 0x23:
          v13 = CFSTR("NOT_LISTED");
          break;
        case 0x24:
          v13 = CFSTR("DIRECTIONS_INCORRECT_INSTRUCTIONS");
          break;
        case 0x25:
          v13 = CFSTR("DIRECTIONS_ROUTE_WRONG");
          break;
        case 0x26:
          v13 = CFSTR("DIRECTIONS_PROBLEM_WITH_TRANSFER");
          break;
        case 0x27:
          v13 = CFSTR("DIRECTIONS_INCORRECT_ETA");
          break;
        case 0x28:
          v13 = CFSTR("TRANSIT_DELAY");
          break;
        case 0x29:
          v13 = CFSTR("TRANSIT_INCORRECT_SCHEDULE");
          break;
        case 0x2B:
          v13 = CFSTR("INCORRECT_ENTRY_OR_EXIT");
          break;
        case 0x2D:
          v13 = CFSTR("INCORRECT_SHAPE");
          break;
        case 0x2E:
          v13 = CFSTR("OTHER_FEEDBACK");
          break;
        case 0x2F:
          v13 = CFSTR("CLOSED_TEMPORARILY");
          break;
        case 0x30:
          v13 = CFSTR("CLOSED_HOURS_CHANGED");
          break;
        case 0x31:
          v13 = CFSTR("TRANSIT_CANCELATION");
          break;
        case 0x32:
          v13 = CFSTR("TRANSIT_SERVICE_CHANGED");
          break;
        case 0x36:
          v13 = CFSTR("SEARCH_AUTOCOMPLETE_POI");
          break;
        case 0x37:
          v13 = CFSTR("SEARCH_AUTOCOMPLETE_POI_CATEGORY");
          break;
        case 0x38:
          v13 = CFSTR("SEARCH_AUTOCOMPLETE_ADDRESS");
          break;
        case 0x39:
          v13 = CFSTR("SEARCH_AUTOCOMPLETE_LOCALITY");
          break;
        case 0x3A:
          v13 = CFSTR("SEARCH_AUTOCOMPLETE_OTHER");
          break;
        case 0x3B:
          v13 = CFSTR("TRANSIT_LINE_INCORRECT_NAME");
          break;
        case 0x3C:
          v13 = CFSTR("DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT");
          break;
        case 0x3D:
          v13 = CFSTR("PERSONALIZED_MAP_LOCATION_INCORRECT");
          break;
        case 0x3E:
          v13 = CFSTR("MISSING_LOCATION_BUSINESS");
          break;
        case 0x3F:
          v13 = CFSTR("MISSING_LOCATION_STREET");
          break;
        case 0x40:
          v13 = CFSTR("MISSING_LOCATION_OTHER");
          break;
        case 0x41:
          v13 = CFSTR("MERCHANT_LOOKUP");
          break;
        case 0x42:
          v13 = CFSTR("GROUND_VIEW_CENSOR_REQUEST");
          break;
        case 0x43:
          v13 = CFSTR("GROUND_VIEW_IMAGE_QUALITY");
          break;
        case 0x44:
          v13 = CFSTR("GROUND_VIEW_STOREFRONT");
          break;
        default:
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 68));
          v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
          break;
      }
      if (a2)
        v14 = CFSTR("problemType");
      else
        v14 = CFSTR("problem_type");
      objc_msgSend(v4, "setObject:forKey:", v13, v14);

    }
    objc_msgSend((id)a1, "problemCorrections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v15, "jsonRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("problemCorrections");
      }
      else
      {
        objc_msgSend(v15, "dictionaryRepresentation");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = CFSTR("problem_corrections");
      }
      objc_msgSend(v4, "setObject:forKey:", v17, v18);

    }
    objc_msgSend((id)a1, "problemContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v19, "jsonRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("problemContext");
      }
      else
      {
        objc_msgSend(v19, "dictionaryRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = CFSTR("problem_context");
      }
      objc_msgSend(v4, "setObject:forKey:", v21, v22);

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
  return -[GEORPProblem _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPProblem)initWithDictionary:(id)a3
{
  return (GEORPProblem *)-[GEORPProblem _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  id v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  GEORPProblemCorrections *v25;
  uint64_t v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  GEORPProblemContext *v30;
  uint64_t v31;
  void *v32;
  void *v34;
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_289;
  }
  v6 = (void *)objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("protocolVersion");
    else
      v7 = CFSTR("protocol_version");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v6, "setProtocolVersion:", objc_msgSend(v8, "unsignedIntValue"));

    if (a3)
      v9 = CFSTR("userPath");
    else
      v9 = CFSTR("user_path");
    objc_msgSend(v5, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = a3;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v34 = v10;
      v11 = v10;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (!v12)
        goto LABEL_135;
      v13 = v12;
      v14 = *(_QWORD *)v37;
      while (1)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v37 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v16;
            if ((objc_msgSend(v17, "isEqualToString:", CFSTR("USER_PATH_ITEM_UNKNOWN")) & 1) != 0)
            {
              v18 = 0;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PLACE_PROBLEM")) & 1) != 0)
            {
              v18 = 1;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("MAP_PROBLEM")) & 1) != 0)
            {
              v18 = 2;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS_EDIT")) & 1) != 0)
            {
              v18 = 3;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS_EDIT_LABEL")) & 1) != 0)
            {
              v18 = 4;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_PICKER_CORRECT_COORDINATE")) & 1) != 0)
            {
              v18 = 5;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_FEATURE")) & 1) != 0)
            {
              v18 = 6;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_COORDINATE")) & 1) != 0)
            {
              v18 = 7;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_REGION")) & 1) != 0)
            {
              v18 = 8;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_CLOSED")) & 1) != 0)
            {
              v18 = 9;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("COMMENTS_AND_PHOTO")) & 1) != 0)
            {
              v18 = 10;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SEARCH_RESULTS")) & 1) != 0)
            {
              v18 = 11;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SATELLITE_IMAGE")) & 1) != 0)
            {
              v18 = 12;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRAFFIC")) & 1) != 0)
            {
              v18 = 13;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIRECTIONS")) & 1) != 0)
            {
              v18 = 14;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIRECTIONS_STEPS")) & 1) != 0)
            {
              v18 = 15;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("GUIDANCE")) & 1) != 0)
            {
              v18 = 16;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUTE_PLANNING")) & 1) != 0)
            {
              v18 = 17;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("DIRECTIONS_ROUTE_PICKER")) & 1) != 0)
            {
              v18 = 18;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_MAP_PROBLEM")) & 1) != 0)
            {
              v18 = 19;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_DIRECTIONS_PROBLEM")) & 1) != 0)
            {
              v18 = 20;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_STATION_PROBLEM")) & 1) != 0)
            {
              v18 = 21;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_TRANSFER_PICKER")) & 1) != 0)
            {
              v18 = 22;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_LINE_PICKER")) & 1) != 0)
            {
              v18 = 23;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_LINE_DISPLAY_PROBLEM")) & 1) != 0)
            {
              v18 = 24;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_STATION_PICKER")) & 1) != 0)
            {
              v18 = 25;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_LINE_SERVICE_CHANGE")) & 1) != 0)
            {
              v18 = 26;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_LINE_SCHEDULES")) & 1) != 0)
            {
              v18 = 27;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_BAD_ROUTE_SUGGESTIONS")) & 1) != 0)
            {
              v18 = 28;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT")) & 1) != 0)
            {
              v18 = 29;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_SUBCATEGORY_PICKER")) & 1) != 0)
            {
              v18 = 30;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_CORRECTABLE_LOCATION")) & 1) != 0)
            {
              v18 = 31;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_ADD")) & 1) != 0)
            {
              v18 = 32;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("IM_LOST")) & 1) != 0)
            {
              v18 = 33;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE")) & 1) != 0)
            {
              v18 = 40;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_LINE_NAME_INCORRECT")) & 1) != 0)
            {
              v18 = 41;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_LINE_SHAPE_INCORRECT")) & 1) != 0)
            {
              v18 = 42;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BAD_DIRECTIONS_INCORRECT_INSTRUCTIONS")) & 1) != 0)
            {
              v18 = 43;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BAD_DIRECTIONS_ROUTE_WRONG")) & 1) != 0)
            {
              v18 = 44;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BAD_DIRECTIONS_INCORRECT_ETA")) & 1) != 0)
            {
              v18 = 45;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BAD_DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT")) & 1) != 0)
            {
              v18 = 46;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TRANSIT_ACCESS_POINT_PICKER")) & 1) != 0)
            {
              v18 = 47;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PERSONALIZED_MAP_CORRECTION")) & 1) != 0)
            {
              v18 = 48;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("WHICH_PERSONALIZED_MAP_ADDRESS")) & 1) != 0)
            {
              v18 = 49;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PERSONALIZED_MAP_PLACE_PROBLEM")) & 1) != 0)
            {
              v18 = 50;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADD_A_PLACE_TYPE_SELECTION")) & 1) != 0)
            {
              v18 = 51;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("LOCATION_PICKER_CHOOSE_COORDINATE_WITH_NAME")) & 1) != 0)
            {
              v18 = 52;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("PLACE_CATEGORY_SELECTION")) & 1) != 0)
            {
              v18 = 53;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("TAKE_PHOTO")) & 1) != 0)
            {
              v18 = 54;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ROUTING_TRAY")) & 1) != 0)
            {
              v18 = 55;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BRAND_PROBLEM")) & 1) != 0)
            {
              v18 = 56;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("BRAND_CORRECTIONS")) & 1) != 0)
            {
              v18 = 57;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS_INFO")) & 1) != 0)
            {
              v18 = 58;
            }
            else if ((objc_msgSend(v17, "isEqualToString:", CFSTR("ADDRESS_SEARCH")) & 1) != 0)
            {
              v18 = 59;
            }
            else if (objc_msgSend(v17, "isEqualToString:", CFSTR("CURATED_COLLECTION_PROBLEM")))
            {
              v18 = 60;
            }
            else
            {
              v18 = 0;
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            v18 = objc_msgSend(v16, "intValue");
          }
          objc_msgSend(v6, "addUserPath:", v18);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (!v13)
        {
LABEL_135:

          a3 = v35;
          v10 = v34;
          break;
        }
      }
    }

    if (a3)
      v19 = CFSTR("problemType");
    else
      v19 = CFSTR("problem_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = v20;
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("PROBLEM_TYPE_UNKNOWN")) & 1) != 0)
      {
        v22 = 0xFFFFFFFFLL;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("INCORRECT_INFO")) & 1) != 0)
      {
        v22 = 0;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("INCORRECT_MAP_LABEL")) & 1) != 0)
      {
        v22 = 1;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MISSING_LOCATION")) & 1) != 0)
      {
        v22 = 2;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("INCORRECT_PIN_LOCATION")) & 1) != 0)
      {
        v22 = 3;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_UNEXPECTED")) & 1) != 0)
      {
        v22 = 8;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_SELECTED_WRONG_PIN")) & 1) != 0)
      {
        v22 = 9;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_SHOULD_NOT_HAVE_MOVED_MAP")) & 1) != 0)
      {
        v22 = 10;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_SHOULD_HAVE_MOVED_MAP")) & 1) != 0)
      {
        v22 = 11;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_NOT_LISTED")) & 1) != 0)
      {
        v22 = 12;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SATELLITE_OUTDATED")) & 1) != 0)
      {
        v22 = 13;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SATELLITE_QUALITY")) & 1) != 0)
      {
        v22 = 14;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SATELLITE_NOT_LISTED")) & 1) != 0)
      {
        v22 = 15;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_PROBLEM_BASIC")) & 1) != 0)
      {
        v22 = 16;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_DESTINATION_WRONG")) & 1) != 0)
      {
        v22 = 17;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_THROUGH_TRAFFIC")) & 1) != 0)
      {
        v22 = 20;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_THROUGH_CLOSURE")) & 1) != 0)
      {
        v22 = 21;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_WRONG_WAY")) & 1) != 0)
      {
        v22 = 22;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_PROHIBITED")) & 1) != 0)
      {
        v22 = 23;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_CLOSED_ROAD")) & 1) != 0)
      {
        v22 = 24;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_UNNEEDED")) & 1) != 0)
      {
        v22 = 25;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_MISSING_BEFORE")) & 1) != 0)
      {
        v22 = 26;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_MISSING_AFTER")) & 1) != 0)
      {
        v22 = 27;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_STEP_NOT_LISTED")) & 1) != 0)
      {
        v22 = 28;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_NOT_LISTED")) & 1) != 0)
      {
        v22 = 29;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_INCORRECT")) & 1) != 0)
      {
        v22 = 30;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRAFFIC_INCIDENT_MISSING")) & 1) != 0)
      {
        v22 = 31;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRAFFIC_FLOW_INCORRECT")) & 1) != 0)
      {
        v22 = 32;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRAFFIC_FLOW_MISSING")) & 1) != 0)
      {
        v22 = 33;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRAFFIC_NOT_LISTED")) & 1) != 0)
      {
        v22 = 34;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("NOT_LISTED")) & 1) != 0)
      {
        v22 = 35;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_INCORRECT_INSTRUCTIONS")) & 1) != 0)
      {
        v22 = 36;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_ROUTE_WRONG")) & 1) != 0)
      {
        v22 = 37;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_PROBLEM_WITH_TRANSFER")) & 1) != 0)
      {
        v22 = 38;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_INCORRECT_ETA")) & 1) != 0)
      {
        v22 = 39;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRANSIT_INCORRECT_SCHEDULE")) & 1) != 0)
      {
        v22 = 41;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("INCORRECT_ENTRY_OR_EXIT")) & 1) != 0)
      {
        v22 = 43;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("INCORRECT_SHAPE")) & 1) != 0)
      {
        v22 = 45;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("OTHER_FEEDBACK")) & 1) != 0)
      {
        v22 = 46;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CLOSED_PERMANENTLY")) & 1) != 0)
      {
        v22 = 4;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CLOSED_TEMPORARILY")) & 1) != 0)
      {
        v22 = 47;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CLOSED_HOURS_CHANGED")) & 1) != 0)
      {
        v22 = 48;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRANSIT_DELAY")) & 1) != 0)
      {
        v22 = 40;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRANSIT_CANCELATION")) & 1) != 0)
      {
        v22 = 49;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRANSIT_SERVICE_CHANGED")) & 1) != 0)
      {
        v22 = 50;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_POI")) & 1) != 0)
      {
        v22 = 54;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_POI_CATEGORY")) & 1) != 0)
      {
        v22 = 55;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_ADDRESS")) & 1) != 0)
      {
        v22 = 56;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_LOCALITY")) & 1) != 0)
      {
        v22 = 57;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("SEARCH_AUTOCOMPLETE_OTHER")) & 1) != 0)
      {
        v22 = 58;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("TRANSIT_LINE_INCORRECT_NAME")) & 1) != 0)
      {
        v22 = 59;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DIRECTIONS_ARRIVAL_ENTRY_POINT_INCORRECT")) & 1) != 0)
      {
        v22 = 60;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("PERSONALIZED_MAP_LOCATION_INCORRECT")) & 1) != 0)
      {
        v22 = 61;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DOES_NOT_EXIST_INCORRECT_PIN_LOCATION")) & 1) != 0)
      {
        v22 = 5;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DOES_NOT_EXIST_NO_SUCH_PLACE")) & 1) != 0)
      {
        v22 = 6;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("DOES_NOT_EXIST_OTHER")) & 1) != 0)
      {
        v22 = 7;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MISSING_LOCATION_BUSINESS")) & 1) != 0)
      {
        v22 = 62;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MISSING_LOCATION_STREET")) & 1) != 0)
      {
        v22 = 63;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MISSING_LOCATION_OTHER")) & 1) != 0)
      {
        v22 = 64;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MERCHANT_LOOKUP")) & 1) != 0)
      {
        v22 = 65;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("GROUND_VIEW_CENSOR_REQUEST")) & 1) != 0)
      {
        v22 = 66;
      }
      else if ((objc_msgSend(v21, "isEqualToString:", CFSTR("GROUND_VIEW_IMAGE_QUALITY")) & 1) != 0)
      {
        v22 = 67;
      }
      else if (objc_msgSend(v21, "isEqualToString:", CFSTR("GROUND_VIEW_STOREFRONT")))
      {
        v22 = 68;
      }
      else
      {
        v22 = 0xFFFFFFFFLL;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_272:

        if (a3)
          v23 = CFSTR("problemCorrections");
        else
          v23 = CFSTR("problem_corrections");
        objc_msgSend(v5, "objectForKeyedSubscript:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = [GEORPProblemCorrections alloc];
          if ((a3 & 1) != 0)
            v26 = -[GEORPProblemCorrections initWithJSON:](v25, "initWithJSON:", v24);
          else
            v26 = -[GEORPProblemCorrections initWithDictionary:](v25, "initWithDictionary:", v24);
          v27 = (void *)v26;
          objc_msgSend(v6, "setProblemCorrections:", v26);

        }
        if (a3)
          v28 = CFSTR("problemContext");
        else
          v28 = CFSTR("problem_context");
        objc_msgSend(v5, "objectForKeyedSubscript:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v30 = [GEORPProblemContext alloc];
          if ((a3 & 1) != 0)
            v31 = -[GEORPProblemContext initWithJSON:](v30, "initWithJSON:", v29);
          else
            v31 = -[GEORPProblemContext initWithDictionary:](v30, "initWithDictionary:", v29);
          v32 = (void *)v31;
          objc_msgSend(v6, "setProblemContext:", v31);

        }
        goto LABEL_289;
      }
      v22 = objc_msgSend(v20, "intValue");
    }
    objc_msgSend(v6, "setProblemType:", v22);
    goto LABEL_272;
  }
LABEL_289:

  return v6;
}

- (GEORPProblem)initWithJSON:(id)a3
{
  return (GEORPProblem *)-[GEORPProblem _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1683_0;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1684_0;
    GEORPProblemReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPProblemCorrections readAll:](self->_problemCorrections, "readAll:", 1);
    -[GEORPProblemContext readAll:](self->_problemContext, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPProblemIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPProblemReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  void *v5;
  unint64_t v6;
  PBDataReader *v7;
  void *v8;
  id v9;

  v9 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPProblemIsDirty((uint64_t)self) & 1) == 0)
  {
    v7 = self->_reader;
    objc_sync_enter(v7);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "writeData:", v8);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v7);
    goto LABEL_15;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblem readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    PBDataWriterWriteUint32Field();
  v5 = v9;
  if (self->_userPaths.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      ++v6;
    }
    while (v6 < self->_userPaths.count);
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v5 = v9;
  }
  if (self->_problemCorrections)
  {
    PBDataWriterWriteSubmessage();
    v5 = v9;
  }
  if (self->_problemContext)
  {
    PBDataWriterWriteSubmessage();
LABEL_15:
    v5 = v9;
  }

}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEORPProblemClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPProblem _readProblemContext]((uint64_t)self);
  if (-[GEORPProblemContext hasGreenTeaWithValue:](self->_problemContext, "hasGreenTeaWithValue:", v3))
    return 1;
  -[GEORPProblem _readProblemCorrections]((uint64_t)self);
  return -[GEORPProblemCorrections hasGreenTeaWithValue:](self->_problemCorrections, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPProblem readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 14) = self->_readerMarkPos;
  *((_DWORD *)v8 + 15) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *((_DWORD *)v8 + 18) = self->_protocolVersion;
    *((_BYTE *)v8 + 76) |= 2u;
  }
  if (-[GEORPProblem userPathsCount](self, "userPathsCount"))
  {
    objc_msgSend(v8, "clearUserPaths");
    v4 = -[GEORPProblem userPathsCount](self, "userPathsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v8, "addUserPath:", -[GEORPProblem userPathAtIndex:](self, "userPathAtIndex:", i));
    }
  }
  v7 = v8;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 17) = self->_problemType;
    *((_BYTE *)v8 + 76) |= 1u;
  }
  if (self->_problemCorrections)
  {
    objc_msgSend(v8, "setProblemCorrections:");
    v7 = v8;
  }
  if (self->_problemContext)
  {
    objc_msgSend(v8, "setProblemContext:");
    v7 = v8;
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEORPProblemReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPProblem readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_protocolVersion;
    *(_BYTE *)(v5 + 76) |= 2u;
  }
  PBRepeatedInt32Copy();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 68) = self->_problemType;
    *(_BYTE *)(v5 + 76) |= 1u;
  }
  v9 = -[GEORPProblemCorrections copyWithZone:](self->_problemCorrections, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEORPProblemContext copyWithZone:](self->_problemContext, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPProblemCorrections *problemCorrections;
  GEORPProblemContext *problemContext;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[GEORPProblem readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 2) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 18))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 76) & 2) != 0)
  {
    goto LABEL_17;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 76) & 1) == 0 || self->_problemType != *((_DWORD *)v4 + 17))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 76) & 1) != 0)
  {
    goto LABEL_17;
  }
  problemCorrections = self->_problemCorrections;
  if ((unint64_t)problemCorrections | *((_QWORD *)v4 + 6)
    && !-[GEORPProblemCorrections isEqual:](problemCorrections, "isEqual:"))
  {
    goto LABEL_17;
  }
  problemContext = self->_problemContext;
  if ((unint64_t)problemContext | *((_QWORD *)v4 + 5))
    v7 = -[GEORPProblemContext isEqual:](problemContext, "isEqual:");
  else
    v7 = 1;
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[GEORPProblem readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v3 = 2654435761 * self->_protocolVersion;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v5 = 2654435761 * self->_problemType;
  else
    v5 = 0;
  v6 = v4 ^ v3 ^ v5 ^ -[GEORPProblemCorrections hash](self->_problemCorrections, "hash");
  return v6 ^ -[GEORPProblemContext hash](self->_problemContext, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  _QWORD *v7;
  GEORPProblemCorrections *problemCorrections;
  uint64_t v9;
  GEORPProblemContext *problemContext;
  uint64_t v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "readAll:", 0);
  if ((*((_BYTE *)v12 + 76) & 2) != 0)
  {
    self->_protocolVersion = *((_DWORD *)v12 + 18);
    *(_BYTE *)&self->_flags |= 2u;
  }
  v4 = objc_msgSend(v12, "userPathsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEORPProblem addUserPath:](self, "addUserPath:", objc_msgSend(v12, "userPathAtIndex:", i));
  }
  v7 = v12;
  if ((*((_BYTE *)v12 + 76) & 1) != 0)
  {
    self->_problemType = *((_DWORD *)v12 + 17);
    *(_BYTE *)&self->_flags |= 1u;
  }
  problemCorrections = self->_problemCorrections;
  v9 = *((_QWORD *)v12 + 6);
  if (problemCorrections)
  {
    if (!v9)
      goto LABEL_14;
    -[GEORPProblemCorrections mergeFrom:](problemCorrections, "mergeFrom:");
  }
  else
  {
    if (!v9)
      goto LABEL_14;
    -[GEORPProblem setProblemCorrections:](self, "setProblemCorrections:");
  }
  v7 = v12;
LABEL_14:
  problemContext = self->_problemContext;
  v11 = v7[5];
  if (problemContext)
  {
    if (v11)
    {
      -[GEORPProblemContext mergeFrom:](problemContext, "mergeFrom:");
LABEL_19:
      v7 = v12;
    }
  }
  else if (v11)
  {
    -[GEORPProblem setProblemContext:](self, "setProblemContext:");
    goto LABEL_19;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_problemCorrections, 0);
  objc_storeStrong((id *)&self->_problemContext, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
