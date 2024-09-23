@implementation GEORPFeedbackFormField

- (GEORPFeedbackFormField)init
{
  GEORPFeedbackFormField *v2;
  GEORPFeedbackFormField *v3;
  GEORPFeedbackFormField *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORPFeedbackFormField;
  v2 = -[GEORPFeedbackFormField init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORPFeedbackFormField)initWithData:(id)a3
{
  GEORPFeedbackFormField *v3;
  GEORPFeedbackFormField *v4;
  GEORPFeedbackFormField *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORPFeedbackFormField;
  v3 = -[GEORPFeedbackFormField initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (int)name
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_name;
  else
    return 0;
}

- (void)setName:(int)a3
{
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_name = a3;
}

- (void)setHasName:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
}

- (BOOL)hasName
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)nameAsString:(int)a3
{
  __CFString *v3;
  id result;

  if (a3 <= 1200)
  {
    if (a3 <= 600)
    {
      switch(a3)
      {
        case 'e':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_NAME");
          break;
        case 'f':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_PHONE");
          break;
        case 'g':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_WEBSITE");
          break;
        case 'h':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_HOURS");
          break;
        case 'i':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_CATEGORY");
          break;
        case 'j':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_LOCATION");
          break;
        case 'k':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_AMENITIES");
          break;
        case 'l':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT");
          break;
        case 'm':
          result = CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD");
          break;
        default:
          if (a3)
          {
            if (a3 != 1)
              goto LABEL_68;
            result = CFSTR("FEEDBACK_FIELD_KEY_COMMENTS");
          }
          else
          {
            result = CFSTR("FEEDBACK_FIELD_KEY_UNKNOWN");
          }
          break;
      }
    }
    else
    {
      switch(a3)
      {
        case 601:
          v3 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION");
          return v3;
        case 602:
          result = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT");
          break;
        case 603:
          result = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_BLDG");
          break;
        case 604:
          result = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE");
          break;
        case 605:
          result = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY");
          break;
        case 606:
          result = CFSTR("FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA");
          break;
        case 607:
          result = CFSTR("FEEDBACK_FIELD_KEY_POST_CODE");
          break;
        case 608:
          result = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL");
          break;
        default:
          switch(a3)
          {
            case 1101:
              result = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME");
              break;
            case 1102:
              result = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION");
              break;
            case 1103:
              result = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE");
              break;
            case 1104:
              result = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT");
              break;
            case 1105:
              result = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS");
              break;
            case 1106:
              result = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_LINE");
              break;
            default:
              goto LABEL_68;
          }
          break;
      }
    }
    return result;
  }
  if (a3 <= 1501)
  {
    if (a3 > 1301)
    {
      if (a3 > 1400)
      {
        if (a3 == 1401)
          return CFSTR("FEEDBACK_FIELD_KEY_TRAIL_NAME");
        if (a3 == 1501)
          return CFSTR("FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE");
      }
      else
      {
        if (a3 == 1302)
          return CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION");
        if (a3 == 1303)
          return CFSTR("FEEDBACK_FIELD_KEY_LOCALITY_NAME");
      }
      goto LABEL_68;
    }
    switch(a3)
    {
      case 1201:
        result = CFSTR("FEEDBACK_FIELD_KEY_STREET_NAME");
        break;
      case 1202:
        result = CFSTR("FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME");
        break;
      case 1203:
        result = CFSTR("FEEDBACK_FIELD_KEY_STREET_TILE_INFO");
        break;
      case 1204:
        result = CFSTR("FEEDBACK_FIELD_KEY_STREET_LOCATION");
        break;
      default:
        if (a3 != 1301)
          goto LABEL_68;
        result = CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME");
        break;
    }
  }
  else
  {
    if (a3 <= 2000)
    {
      if (a3 > 1801)
      {
        if (a3 == 1802)
          return CFSTR("FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME");
        if (a3 == 1901)
          return CFSTR("FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO");
      }
      else
      {
        if (a3 == 1502)
          return CFSTR("FEEDBACK_FIELD_KEY_ROUTE_STEP");
        if (a3 == 1801)
          return CFSTR("FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT");
      }
LABEL_68:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    switch(a3)
    {
      case 10001:
        result = CFSTR("FEEDBACK_FIELD_KEY_ISSUE_TYPE");
        break;
      case 10002:
        result = CFSTR("FEEDBACK_FIELD_KEY_OPTIONS_MENU");
        break;
      case 10003:
        result = CFSTR("FEEDBACK_FIELD_KEY_LOCATION");
        break;
      case 10004:
        result = CFSTR("FEEDBACK_FIELD_KEY_PHOTOS");
        break;
      default:
        if (a3 == 2001)
        {
          result = CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME");
        }
        else
        {
          if (a3 != 2002)
            goto LABEL_68;
          result = CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT");
        }
        break;
    }
  }
  return result;
}

- (int)StringAsName:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_COMMENTS")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_NAME")) & 1) != 0)
  {
    v4 = 101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_PHONE")) & 1) != 0)
  {
    v4 = 102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_WEBSITE")) & 1) != 0)
  {
    v4 = 103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_HOURS")) & 1) != 0)
  {
    v4 = 104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_CATEGORY")) & 1) != 0)
  {
    v4 = 105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_LOCATION")) & 1) != 0)
  {
    v4 = 106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_AMENITIES")) & 1) != 0)
  {
    v4 = 107;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT")) & 1) != 0)
  {
    v4 = 108;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD")) & 1) != 0)
  {
    v4 = 109;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION")) & 1) != 0)
  {
    v4 = 601;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT")) & 1) != 0)
  {
    v4 = 602;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_BLDG")) & 1) != 0)
  {
    v4 = 603;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE")) & 1) != 0)
  {
    v4 = 604;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY")) & 1) != 0)
  {
    v4 = 605;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA")) & 1) != 0)
  {
    v4 = 606;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POST_CODE")) & 1) != 0)
  {
    v4 = 607;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL")) & 1) != 0)
  {
    v4 = 608;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME")) & 1) != 0)
  {
    v4 = 1101;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION")) & 1) != 0)
  {
    v4 = 1102;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE")) & 1) != 0)
  {
    v4 = 1103;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT")) & 1) != 0)
  {
    v4 = 1104;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS")) & 1) != 0)
  {
    v4 = 1105;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_LINE")) & 1) != 0)
  {
    v4 = 1106;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_STREET_NAME")) & 1) != 0)
  {
    v4 = 1201;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME")) & 1) != 0)
  {
    v4 = 1202;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_STREET_TILE_INFO")) & 1) != 0)
  {
    v4 = 1203;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_STREET_LOCATION")) & 1) != 0)
  {
    v4 = 1204;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME")) & 1) != 0)
  {
    v4 = 1301;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION")) & 1) != 0)
  {
    v4 = 1302;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_LOCALITY_NAME")) & 1) != 0)
  {
    v4 = 1303;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRAIL_NAME")) & 1) != 0)
  {
    v4 = 1401;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE")) & 1) != 0)
  {
    v4 = 1501;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ROUTE_STEP")) & 1) != 0)
  {
    v4 = 1502;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT")) & 1) != 0)
  {
    v4 = 1801;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME")) & 1) != 0)
  {
    v4 = 1802;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO")) & 1) != 0)
  {
    v4 = 1901;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME")) & 1) != 0)
  {
    v4 = 2001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT")) & 1) != 0)
  {
    v4 = 2002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ISSUE_TYPE")) & 1) != 0)
  {
    v4 = 10001;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_OPTIONS_MENU")) & 1) != 0)
  {
    v4 = 10002;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_LOCATION")) & 1) != 0)
  {
    v4 = 10003;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_PHOTOS")))
  {
    v4 = 10004;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readValue
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readValue_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasValue
{
  -[GEORPFeedbackFormField _readValue]((uint64_t)self);
  return self->_value != 0;
}

- (GEORPFeedbackFieldValue)value
{
  -[GEORPFeedbackFormField _readValue]((uint64_t)self);
  return self->_value;
}

- (void)setValue:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_value, a3);
}

- (void)_readFormId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFormId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFormId
{
  -[GEORPFeedbackFormField _readFormId]((uint64_t)self);
  return self->_formId != 0;
}

- (NSString)formId
{
  -[GEORPFeedbackFormField _readFormId]((uint64_t)self);
  return self->_formId;
}

- (void)setFormId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_formId, a3);
}

- (void)_readFieldId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readFieldId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasFieldId
{
  -[GEORPFeedbackFormField _readFieldId]((uint64_t)self);
  return self->_fieldId != 0;
}

- (NSString)fieldId
{
  -[GEORPFeedbackFormField _readFieldId]((uint64_t)self);
  return self->_fieldId;
}

- (void)setFieldId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_fieldId, a3);
}

- (void)_readParentFieldId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readParentFieldId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasParentFieldId
{
  -[GEORPFeedbackFormField _readParentFieldId]((uint64_t)self);
  return self->_parentFieldId != 0;
}

- (NSString)parentFieldId
{
  -[GEORPFeedbackFormField _readParentFieldId]((uint64_t)self);
  return self->_parentFieldId;
}

- (void)setParentFieldId:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_parentFieldId, a3);
}

- (void)_readTags
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 0x20) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTags_tags_571);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (NSMutableArray)tags
{
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  return self->_tags;
}

- (void)setTags:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *tags;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  tags = self->_tags;
  self->_tags = v4;

}

- (void)clearTags
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
  -[NSMutableArray removeAllObjects](self->_tags, "removeAllObjects");
}

- (void)addTag:(id)a3
{
  id v4;

  v4 = a3;
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  -[GEORPFeedbackFormField _addNoFlagsTag:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 0x20u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 0x80u;
}

- (void)_addNoFlagsTag:(uint64_t)a1
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

- (unint64_t)tagsCount
{
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  return -[NSMutableArray count](self->_tags, "count");
}

- (id)tagAtIndex:(unint64_t)a3
{
  -[GEORPFeedbackFormField _readTags]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_tags, "objectAtIndex:", a3);
}

+ (Class)tagType
{
  return (Class)objc_opt_class();
}

- (void)_readAnnotations
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_BYTE *)(a1 + 80) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEORPFeedbackFormFieldReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAnnotations_tags_572);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasAnnotations
{
  -[GEORPFeedbackFormField _readAnnotations]((uint64_t)self);
  return self->_annotations != 0;
}

- (GEORPFeedbackFormFieldAnnotations)annotations
{
  -[GEORPFeedbackFormField _readAnnotations]((uint64_t)self);
  return self->_annotations;
}

- (void)setAnnotations:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_annotations, a3);
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
  v8.super_class = (Class)GEORPFeedbackFormField;
  -[GEORPFeedbackFormField description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORPFeedbackFormField dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORPFeedbackFormField _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 80) & 1) != 0)
  {
    v5 = *(_DWORD *)(a1 + 76);
    if (v5 <= 1200)
    {
      if (v5 <= 600)
      {
        switch(v5)
        {
          case 'e':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_NAME");
            break;
          case 'f':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_PHONE");
            break;
          case 'g':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_WEBSITE");
            break;
          case 'h':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_HOURS");
            break;
          case 'i':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_CATEGORY");
            break;
          case 'j':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_LOCATION");
            break;
          case 'k':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_AMENITIES");
            break;
          case 'l':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT");
            break;
          case 'm':
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD");
            break;
          default:
            if (v5)
            {
              if (v5 != 1)
                goto LABEL_42;
              v6 = CFSTR("FEEDBACK_FIELD_KEY_COMMENTS");
            }
            else
            {
              v6 = CFSTR("FEEDBACK_FIELD_KEY_UNKNOWN");
            }
            break;
        }
      }
      else
      {
        switch(v5)
        {
          case 601:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION");
            break;
          case 602:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT");
            break;
          case 603:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_BLDG");
            break;
          case 604:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE");
            break;
          case 605:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY");
            break;
          case 606:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA");
            break;
          case 607:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_POST_CODE");
            break;
          case 608:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL");
            break;
          default:
            switch(v5)
            {
              case 1101:
                v6 = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME");
                break;
              case 1102:
                v6 = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION");
                break;
              case 1103:
                v6 = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE");
                break;
              case 1104:
                v6 = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT");
                break;
              case 1105:
                v6 = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS");
                break;
              case 1106:
                v6 = CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_LINE");
                break;
              default:
                goto LABEL_42;
            }
            break;
        }
      }
      goto LABEL_73;
    }
    if (v5 <= 1501)
    {
      if (v5 <= 1301)
      {
        switch(v5)
        {
          case 1201:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_STREET_NAME");
            break;
          case 1202:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME");
            break;
          case 1203:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_STREET_TILE_INFO");
            break;
          case 1204:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_STREET_LOCATION");
            break;
          default:
            if (v5 != 1301)
              goto LABEL_42;
            v6 = CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME");
            break;
        }
        goto LABEL_73;
      }
      if (v5 > 1400)
      {
        if (v5 == 1401)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_TRAIL_NAME");
          goto LABEL_73;
        }
        if (v5 == 1501)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE");
          goto LABEL_73;
        }
      }
      else
      {
        if (v5 == 1302)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION");
          goto LABEL_73;
        }
        if (v5 == 1303)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_LOCALITY_NAME");
          goto LABEL_73;
        }
      }
    }
    else
    {
      if (v5 > 2000)
      {
        switch(v5)
        {
          case 10001:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_ISSUE_TYPE");
            break;
          case 10002:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_OPTIONS_MENU");
            break;
          case 10003:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_LOCATION");
            break;
          case 10004:
            v6 = CFSTR("FEEDBACK_FIELD_KEY_PHOTOS");
            break;
          default:
            if (v5 == 2001)
            {
              v6 = CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME");
            }
            else
            {
              if (v5 != 2002)
                goto LABEL_42;
              v6 = CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT");
            }
            break;
        }
        goto LABEL_73;
      }
      if (v5 > 1801)
      {
        if (v5 == 1802)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME");
          goto LABEL_73;
        }
        if (v5 == 1901)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO");
          goto LABEL_73;
        }
      }
      else
      {
        if (v5 == 1502)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_ROUTE_STEP");
          goto LABEL_73;
        }
        if (v5 == 1801)
        {
          v6 = CFSTR("FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT");
LABEL_73:
          objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("name"));

          goto LABEL_74;
        }
      }
    }
LABEL_42:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_73;
  }
LABEL_74:
  objc_msgSend((id)a1, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v7, "jsonRepresentation");
    else
      objc_msgSend(v7, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("value"));

  }
  objc_msgSend((id)a1, "formId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (a2)
      v11 = CFSTR("formId");
    else
      v11 = CFSTR("form_id");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);
  }

  objc_msgSend((id)a1, "fieldId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    if (a2)
      v13 = CFSTR("fieldId");
    else
      v13 = CFSTR("field_id");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);
  }

  objc_msgSend((id)a1, "parentFieldId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    if (a2)
      v15 = CFSTR("parentFieldId");
    else
      v15 = CFSTR("parent_field_id");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend((id)a1, "tags");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("tag"));

  }
  objc_msgSend((id)a1, "annotations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v17, "jsonRepresentation");
    else
      objc_msgSend(v17, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("annotations"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEORPFeedbackFormField _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORPFeedbackFormField)initWithDictionary:(id)a3
{
  return (GEORPFeedbackFormField *)-[GEORPFeedbackFormField _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEORPFeedbackFieldValue *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  GEORPFeedbackFormFieldAnnotations *v31;
  uint64_t v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_134;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_134;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_COMMENTS")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_NAME")) & 1) != 0)
    {
      v8 = 101;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_PHONE")) & 1) != 0)
    {
      v8 = 102;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_WEBSITE")) & 1) != 0)
    {
      v8 = 103;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_HOURS")) & 1) != 0)
    {
      v8 = 104;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_CATEGORY")) & 1) != 0)
    {
      v8 = 105;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_LOCATION")) & 1) != 0)
    {
      v8 = 106;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_AMENITIES")) & 1) != 0)
    {
      v8 = 107;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_PARENT")) & 1) != 0)
    {
      v8 = 108;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POI_CONTAINMENT_CHILD")) & 1) != 0)
    {
      v8 = 109;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION")) & 1) != 0)
    {
      v8 = 601;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCATION_ENTRY_POINT")) & 1) != 0)
    {
      v8 = 602;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_BLDG")) & 1) != 0)
    {
      v8 = 603;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL_THOROUGHFARE")) & 1) != 0)
    {
      v8 = 604;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_LOCALITY")) & 1) != 0)
    {
      v8 = 605;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADMINISTRATIVE_AREA")) & 1) != 0)
    {
      v8 = 606;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_POST_CODE")) & 1) != 0)
    {
      v8 = 607;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ADDRESS_FULL")) & 1) != 0)
    {
      v8 = 608;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_NAME")) & 1) != 0)
    {
      v8 = 1101;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_LOCATION")) & 1) != 0)
    {
      v8 = 1102;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_ENTRANCE")) & 1) != 0)
    {
      v8 = 1103;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_EXIT")) & 1) != 0)
    {
      v8 = 1104;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_POI_HOURS")) & 1) != 0)
    {
      v8 = 1105;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRANSIT_LINE")) & 1) != 0)
    {
      v8 = 1106;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_STREET_NAME")) & 1) != 0)
    {
      v8 = 1201;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_BIKE_WALKING_PATH_NAME")) & 1) != 0)
    {
      v8 = 1202;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_STREET_TILE_INFO")) & 1) != 0)
    {
      v8 = 1203;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_STREET_LOCATION")) & 1) != 0)
    {
      v8 = 1204;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_NAME")) & 1) != 0)
    {
      v8 = 1301;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_NEIGHBORHOOD_LOCATION")) & 1) != 0)
    {
      v8 = 1302;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_LOCALITY_NAME")) & 1) != 0)
    {
      v8 = 1303;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_TRAIL_NAME")) & 1) != 0)
    {
      v8 = 1401;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_LANE_GUIDANCE_CORRECT_LANE")) & 1) != 0)
    {
      v8 = 1501;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ROUTE_STEP")) & 1) != 0)
    {
      v8 = 1502;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_IS_NEW_DEVELOPMENT")) & 1) != 0)
    {
      v8 = 1801;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_MISSING_PATH_OR_TRAIL_NAME")) & 1) != 0)
    {
      v8 = 1802;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_BUSINESS_POI_ENRICHMENT_LEGAL_CONTACT_INFO")) & 1) != 0)
    {
      v8 = 1901;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_NAME")) & 1) != 0)
    {
      v8 = 2001;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_RUNNING_TRACK_LANE_COUNT")) & 1) != 0)
    {
      v8 = 2002;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_ISSUE_TYPE")) & 1) != 0)
    {
      v8 = 10001;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_OPTIONS_MENU")) & 1) != 0)
    {
      v8 = 10002;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_LOCATION")) & 1) != 0)
    {
      v8 = 10003;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("FEEDBACK_FIELD_KEY_PHOTOS")))
    {
      v8 = 10004;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_96;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_96:
    objc_msgSend(a1, "setName:", v8);
  }

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("value"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEORPFeedbackFieldValue alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEORPFeedbackFieldValue initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEORPFeedbackFieldValue initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setValue:", v11);

  }
  if (a3)
    v13 = CFSTR("formId");
  else
    v13 = CFSTR("form_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(a1, "setFormId:", v15);

  }
  if (a3)
    v16 = CFSTR("fieldId");
  else
    v16 = CFSTR("field_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(a1, "setFieldId:", v18);

  }
  if (a3)
    v19 = CFSTR("parentFieldId");
  else
    v19 = CFSTR("parent_field_id");
  objc_msgSend(v5, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (void *)objc_msgSend(v20, "copy");
    objc_msgSend(a1, "setParentFieldId:", v21);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("tag"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v29 = (void *)objc_msgSend(v28, "copy", (_QWORD)v35);
            objc_msgSend(a1, "addTag:", v29);

          }
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v25);
    }

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("annotations"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEORPFeedbackFormFieldAnnotations alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEORPFeedbackFormFieldAnnotations initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEORPFeedbackFormFieldAnnotations initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setAnnotations:", v32, (_QWORD)v35);

  }
LABEL_134:

  return a1;
}

- (GEORPFeedbackFormField)initWithJSON:(id)a3
{
  return (GEORPFeedbackFormField *)-[GEORPFeedbackFormField _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_591;
    else
      v8 = (int *)&readAll__nonRecursiveTag_592;
    GEORPFeedbackFormFieldReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
  {
    -[GEORPFeedbackFieldValue readAll:](self->_value, "readAll:", 1);
    -[GEORPFeedbackFormFieldAnnotations readAll:](self->_annotations, "readAll:", 1);
  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORPFeedbackFormFieldIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORPFeedbackFormFieldReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  PBDataReader *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEORPFeedbackFormFieldIsDirty((uint64_t)self) & 1) == 0)
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
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEORPFeedbackFormField readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_value)
      PBDataWriterWriteSubmessage();
    if (self->_formId)
      PBDataWriterWriteStringField();
    if (self->_fieldId)
      PBDataWriterWriteStringField();
    if (self->_parentFieldId)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_tags;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_annotations)
      PBDataWriterWriteSubmessage();
  }

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEORPFeedbackFormField _readValue]((uint64_t)self);
  return -[GEORPFeedbackFieldValue hasGreenTeaWithValue:](self->_value, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id *v8;

  v8 = (id *)a3;
  -[GEORPFeedbackFormField readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v8 + 1, self->_reader);
  *((_DWORD *)v8 + 16) = self->_readerMarkPos;
  *((_DWORD *)v8 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v8 + 19) = self->_name;
    *((_BYTE *)v8 + 80) |= 1u;
  }
  if (self->_value)
    objc_msgSend(v8, "setValue:");
  if (self->_formId)
    objc_msgSend(v8, "setFormId:");
  if (self->_fieldId)
    objc_msgSend(v8, "setFieldId:");
  if (self->_parentFieldId)
    objc_msgSend(v8, "setParentFieldId:");
  if (-[GEORPFeedbackFormField tagsCount](self, "tagsCount"))
  {
    objc_msgSend(v8, "clearTags");
    v4 = -[GEORPFeedbackFormField tagsCount](self, "tagsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEORPFeedbackFormField tagAtIndex:](self, "tagAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addTag:", v7);

      }
    }
  }
  if (self->_annotations)
    objc_msgSend(v8, "setAnnotations:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      GEORPFeedbackFormFieldReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_15;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORPFeedbackFormField readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_name;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEORPFeedbackFieldValue copyWithZone:](self->_value, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  v11 = -[NSString copyWithZone:](self->_formId, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSString copyWithZone:](self->_fieldId, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[NSString copyWithZone:](self->_parentFieldId, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = self->_tags;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v24);
        objc_msgSend((id)v5, "addTag:", v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v18);
  }

  v22 = -[GEORPFeedbackFormFieldAnnotations copyWithZone:](self->_annotations, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v22;
LABEL_15:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORPFeedbackFieldValue *value;
  NSString *formId;
  NSString *fieldId;
  NSString *parentFieldId;
  NSMutableArray *tags;
  GEORPFeedbackFormFieldAnnotations *annotations;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORPFeedbackFormField readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_name != *((_DWORD *)v4 + 19))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  value = self->_value;
  if ((unint64_t)value | *((_QWORD *)v4 + 7) && !-[GEORPFeedbackFieldValue isEqual:](value, "isEqual:"))
    goto LABEL_19;
  formId = self->_formId;
  if ((unint64_t)formId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](formId, "isEqual:"))
      goto LABEL_19;
  }
  fieldId = self->_fieldId;
  if ((unint64_t)fieldId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](fieldId, "isEqual:"))
      goto LABEL_19;
  }
  parentFieldId = self->_parentFieldId;
  if ((unint64_t)parentFieldId | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](parentFieldId, "isEqual:"))
      goto LABEL_19;
  }
  tags = self->_tags;
  if ((unint64_t)tags | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](tags, "isEqual:"))
      goto LABEL_19;
  }
  annotations = self->_annotations;
  if ((unint64_t)annotations | *((_QWORD *)v4 + 2))
    v11 = -[GEORPFeedbackFormFieldAnnotations isEqual:](annotations, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;

  -[GEORPFeedbackFormField readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_name;
  else
    v3 = 0;
  v4 = -[GEORPFeedbackFieldValue hash](self->_value, "hash") ^ v3;
  v5 = -[NSString hash](self->_formId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_fieldId, "hash");
  v7 = -[NSString hash](self->_parentFieldId, "hash");
  v8 = v7 ^ -[NSMutableArray hash](self->_tags, "hash");
  return v6 ^ v8 ^ -[GEORPFeedbackFormFieldAnnotations hash](self->_annotations, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEORPFeedbackFieldValue *value;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  GEORPFeedbackFormFieldAnnotations *annotations;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
    self->_name = *((_DWORD *)v4 + 19);
    *(_BYTE *)&self->_flags |= 1u;
  }
  value = self->_value;
  v6 = *((_QWORD *)v4 + 7);
  if (value)
  {
    if (v6)
      -[GEORPFeedbackFieldValue mergeFrom:](value, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEORPFeedbackFormField setValue:](self, "setValue:");
  }
  if (*((_QWORD *)v4 + 4))
    -[GEORPFeedbackFormField setFormId:](self, "setFormId:");
  if (*((_QWORD *)v4 + 3))
    -[GEORPFeedbackFormField setFieldId:](self, "setFieldId:");
  if (*((_QWORD *)v4 + 5))
    -[GEORPFeedbackFormField setParentFieldId:](self, "setParentFieldId:");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *((id *)v4 + 6);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        -[GEORPFeedbackFormField addTag:](self, "addTag:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  annotations = self->_annotations;
  v13 = *((_QWORD *)v4 + 2);
  if (annotations)
  {
    if (v13)
      -[GEORPFeedbackFormFieldAnnotations mergeFrom:](annotations, "mergeFrom:");
  }
  else if (v13)
  {
    -[GEORPFeedbackFormField setAnnotations:](self, "setAnnotations:");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_tags, 0);
  objc_storeStrong((id *)&self->_parentFieldId, 0);
  objc_storeStrong((id *)&self->_formId, 0);
  objc_storeStrong((id *)&self->_fieldId, 0);
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
