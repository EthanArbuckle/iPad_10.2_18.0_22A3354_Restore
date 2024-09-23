@implementation GEOPDComponentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_BYTE *)&self->_flags & 4) == 0)
  {
    v3 = 0;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_6:
    v4 = 0;
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v3 = 2654435761 * self->_type;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_6;
LABEL_3:
  v4 = 2654435761 * self->_startIndex;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    v5 = 2654435761 * self->_count;
    goto LABEL_8;
  }
LABEL_7:
  v5 = 0;
LABEL_8:
  v6 = -[GEOPDComponentFilter hash](self->_filter, "hash");
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    v7 = 2654435761 * self->_includeSource;
    if ((*(_BYTE *)&self->_flags & 8) != 0)
      goto LABEL_10;
LABEL_12:
    v8 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_flags & 8) == 0)
    goto LABEL_12;
LABEL_10:
  v8 = 2654435761 * self->_urgency;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char flags;
  char v6;
  GEOPDComponentFilter *filter;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  flags = (char)self->_flags;
  v6 = *((_BYTE *)v4 + 44);
  if ((flags & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 8))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 4) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 2) == 0 || self->_startIndex != *((_DWORD *)v4 + 7))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 2) != 0)
  {
    goto LABEL_32;
  }
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_count != *((_DWORD *)v4 + 6))
      goto LABEL_32;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
    goto LABEL_32;
  }
  filter = self->_filter;
  if ((unint64_t)filter | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDComponentFilter isEqual:](filter, "isEqual:"))
      goto LABEL_32;
    flags = (char)self->_flags;
    v6 = *((_BYTE *)v4 + 44);
  }
  if ((flags & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_includeSource)
      {
        if (!*((_BYTE *)v4 + 40))
          goto LABEL_32;
        goto LABEL_28;
      }
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_28;
    }
LABEL_32:
    v8 = 0;
    goto LABEL_33;
  }
  if ((v6 & 0x10) != 0)
    goto LABEL_32;
LABEL_28:
  v8 = (v6 & 8) == 0;
  if ((flags & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_urgency != *((_DWORD *)v4 + 9))
      goto LABEL_32;
    v8 = 1;
  }
LABEL_33:

  return v8;
}

- (void)writeTo:(id)a3
{
  char flags;
  char v5;
  id v6;

  v6 = a3;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(_BYTE *)&self->_flags & 1) != 0)
LABEL_4:
    PBDataWriterWriteUint32Field();
LABEL_5:
  if (self->_filter)
    PBDataWriterWriteSubmessage();
  v5 = (char)self->_flags;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = (char)self->_flags;
  }
  if ((v5 & 8) != 0)
    PBDataWriterWriteInt32Field();
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v6);

}

- (GEOPDComponentInfo)initWithType:(int)a3 count:(unsigned int)a4
{
  GEOPDComponentInfo *v6;
  GEOPDComponentInfo *v7;
  GEOPDComponentInfo *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOPDComponentInfo;
  v6 = -[GEOPDComponentInfo init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    *(_BYTE *)&v6->_flags |= 4u;
    v6->_type = a3;
    if (a4)
    {
      *(_BYTE *)&v6->_flags |= 1u;
      v6->_count = a4;
    }
    v8 = v6;
  }

  return v7;
}

- (void)setFilter:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);

}

- (id)filter
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
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
  v8.super_class = (Class)GEOPDComponentInfo;
  -[GEOPDComponentInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDComponentInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDComponentInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  const __CFString *v15;
  int v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 44);
  if ((v5 & 4) != 0)
  {
    v6 = CFSTR("COMPONENT_TYPE_UNKNOWN");
    switch(*(_DWORD *)(a1 + 32))
    {
      case 0:
        break;
      case 1:
        v6 = CFSTR("COMPONENT_TYPE_ENTITY");
        break;
      case 2:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_INFO");
        break;
      case 3:
        v6 = CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO");
        break;
      case 4:
        v6 = CFSTR("COMPONENT_TYPE_BOUNDS");
        break;
      case 5:
        v6 = CFSTR("COMPONENT_TYPE_ADDRESS");
        break;
      case 6:
        v6 = CFSTR("COMPONENT_TYPE_RATING");
        break;
      case 7:
        v6 = CFSTR("COMPONENT_TYPE_REVIEW");
        break;
      case 8:
        v6 = CFSTR("COMPONENT_TYPE_PHOTO");
        break;
      case 9:
        v6 = CFSTR("COMPONENT_TYPE_HOURS");
        break;
      case 0xA:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO");
        break;
      case 0xB:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE");
        break;
      case 0xC:
        v6 = CFSTR("COMPONENT_TYPE_ETA");
        break;
      case 0xD:
        v6 = CFSTR("COMPONENT_TYPE_FLYOVER");
        break;
      case 0xE:
        v6 = CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE");
        break;
      case 0xF:
        v6 = CFSTR("COMPONENT_TYPE_AMENITIES");
        break;
      case 0x10:
        v6 = CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES");
        break;
      case 0x14:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT");
        break;
      case 0x15:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO");
        break;
      case 0x16:
        v6 = CFSTR("COMPONENT_TYPE_TEXT_BLOCK");
        break;
      case 0x17:
        v6 = CFSTR("COMPONENT_TYPE_FACTOID");
        break;
      case 0x18:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION");
        break;
      case 0x19:
        v6 = CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM");
        break;
      case 0x1A:
        v6 = CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO");
        break;
      case 0x1B:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET");
        break;
      case 0x1D:
        v6 = CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION");
        break;
      case 0x1E:
        v6 = CFSTR("COMPONENT_TYPE_RESULT_SNIPPET");
        break;
      case 0x1F:
        v6 = CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT");
        break;
      case 0x20:
        v6 = CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT");
        break;
      case 0x21:
        v6 = CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK");
        break;
      case 0x22:
        v6 = CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT");
        break;
      case 0x24:
        v6 = CFSTR("COMPONENT_TYPE_TIP");
        break;
      case 0x25:
        v6 = CFSTR("COMPONENT_TYPE_PLACECARD_URL");
        break;
      case 0x26:
        v6 = CFSTR("COMPONENT_TYPE_ASSOCIATED_APP");
        break;
      case 0x27:
        v6 = CFSTR("COMPONENT_TYPE_MESSAGE_LINK");
        break;
      case 0x28:
        v6 = CFSTR("COMPONENT_TYPE_QUICK_LINK");
        break;
      case 0x29:
        v6 = CFSTR("COMPONENT_TYPE_RAP");
        break;
      case 0x2A:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_AREA");
        break;
      case 0x2B:
        v6 = CFSTR("COMPONENT_TYPE_LOCATION_EVENT");
        break;
      case 0x2C:
        v6 = CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS");
        break;
      case 0x2D:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER");
        break;
      case 0x2E:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES");
        break;
      case 0x2F:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_SIZE");
        break;
      case 0x30:
        v6 = CFSTR("COMPONENT_TYPE_VENUE_INFO");
        break;
      case 0x31:
        v6 = CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST");
        break;
      case 0x32:
        v6 = CFSTR("COMPONENT_TYPE_CONTAINED_PLACE");
        break;
      case 0x33:
        v6 = CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT");
        break;
      case 0x34:
        v6 = CFSTR("COMPONENT_TYPE_ICON");
        break;
      case 0x35:
        v6 = CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION");
        break;
      case 0x36:
        v6 = CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES");
        break;
      case 0x37:
        v6 = CFSTR("COMPONENT_TYPE_STOREFRONT");
        break;
      case 0x38:
        v6 = CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL");
        break;
      case 0x39:
        v6 = CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST");
        break;
      case 0x3A:
        v6 = CFSTR("COMPONENT_TYPE_POI_EVENT");
        break;
      case 0x3B:
        v6 = CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION");
        break;
      case 0x3C:
        v6 = CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT");
        break;
      case 0x3D:
        v6 = CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER");
        break;
      case 0x3E:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION");
        break;
      case 0x3F:
        v6 = CFSTR("COMPONENT_TYPE_LINKED_SERVICE");
        break;
      case 0x40:
        v6 = CFSTR("COMPONENT_TYPE_BUSINESS_HOURS");
        break;
      case 0x41:
        v6 = CFSTR("COMPONENT_TYPE_COLLECTION");
        break;
      case 0x42:
        v6 = CFSTR("COMPONENT_TYPE_RELATED_PLACE");
        break;
      case 0x43:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP");
        break;
      case 0x44:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME");
        break;
      case 0x45:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY");
        break;
      case 0x46:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES");
        break;
      case 0x47:
        v6 = CFSTR("COMPONENT_TYPE_PUBLISHER");
        break;
      case 0x48:
        v6 = CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES");
        break;
      case 0x49:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE");
        break;
      case 0x4A:
        v6 = CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM");
        break;
      case 0x4C:
        v6 = CFSTR("COMPONENT_TYPE_COLLECTION_IDS");
        break;
      case 0x4D:
        v6 = CFSTR("COMPONENT_TYPE_ISO_3166_CODE");
        break;
      case 0x4E:
        v6 = CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES");
        break;
      case 0x4F:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE");
        break;
      case 0x51:
        v6 = CFSTR("COMPONENT_TYPE_STOREFRONT_FACES");
        break;
      case 0x52:
        v6 = CFSTR("COMPONENT_TYPE_GUIDE_GROUP");
        break;
      case 0x53:
        v6 = CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE");
        break;
      case 0x54:
        v6 = CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS");
        break;
      case 0x55:
        v6 = CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES");
        break;
      case 0x56:
        v6 = CFSTR("COMPONENT_TYPE_ABOUT");
        break;
      case 0x57:
        v6 = CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY");
        break;
      case 0x58:
        v6 = CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT");
        break;
      case 0x59:
        v6 = CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE");
        break;
      case 0x5A:
        v6 = CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT");
        break;
      case 0x5B:
        v6 = CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO");
        break;
      case 0x5C:
        v6 = CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS");
        break;
      case 0x5D:
        v6 = CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO");
        break;
      case 0x5E:
        v6 = CFSTR("COMPONENT_TYPE_ACTION_DATA");
        break;
      case 0x5F:
        v6 = CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA");
        break;
      case 0x60:
        v6 = CFSTR("COMPONENT_TYPE_POI_CLAIM");
        break;
      case 0x61:
        v6 = CFSTR("COMPONENT_TYPE_EV_CHARGER");
        break;
      case 0x62:
        v6 = CFSTR("COMPONENT_TYPE_TRAIL_HEAD");
        break;
      case 0x63:
        v6 = CFSTR("COMPONENT_TYPE_TOOL_TIP");
        break;
      case 0x64:
        v6 = CFSTR("COMPONENT_TYPE_REFRESH_ID");
        break;
      case 0x65:
        v6 = CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS");
        break;
      case 0x66:
        v6 = CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO");
        break;
      case 0x67:
        v6 = CFSTR("COMPONENT_TYPE_FORWARD_INFO");
        break;
      case 0x68:
        v6 = CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO");
        break;
      case 0x69:
        v6 = CFSTR("COMPONENT_TYPE_HIKE_SUMMARY");
        break;
      case 0x6A:
        v6 = CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 32));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    v5 = *(_BYTE *)(a1 + 44);
  }
  if ((v5 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 28));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v8 = CFSTR("startIndex");
    else
      v8 = CFSTR("start_index");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);

    v5 = *(_BYTE *)(a1 + 44);
  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("count"));

  }
  v10 = *(id *)(a1 + 16);
  v11 = v10;
  if (v10)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v10, "jsonRepresentation");
    else
      objc_msgSend(v10, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("filter"));

  }
  v13 = *(_BYTE *)(a1 + 44);
  if ((v13 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v15 = CFSTR("includeSource");
    else
      v15 = CFSTR("include_source");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

    v13 = *(_BYTE *)(a1 + 44);
  }
  if ((v13 & 8) != 0)
  {
    v16 = *(_DWORD *)(a1 + 36);
    if (v16)
    {
      if (v16 == 1)
      {
        v17 = CFSTR("DYNAMIC");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 36));
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v17 = CFSTR("CACHED");
    }
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("urgency"));

  }
  v18 = *(void **)(a1 + 8);
  if (v18)
  {
    objc_msgSend(v18, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v19, "count"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48__GEOPDComponentInfo__dictionaryRepresentation___block_invoke;
      v25[3] = &unk_1E1C00600;
      v22 = v21;
      v26 = v22;
      objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v25);
      v23 = v22;

      v20 = v23;
    }
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDComponentInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __48__GEOPDComponentInfo__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  int v8;
  const __CFString *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  GEOPDComponentFilter *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  int v22;

  v5 = a2;
  if (a1)
  {
    a1 = objc_msgSend((id)a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;
        if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_UNKNOWN")) & 1) != 0)
        {
          v8 = 0;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENTITY")) & 1) != 0)
        {
          v8 = 1;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_INFO")) & 1) != 0)
        {
          v8 = 2;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO")) & 1) != 0)
        {
          v8 = 3;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_BOUNDS")) & 1) != 0)
        {
          v8 = 4;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ADDRESS")) & 1) != 0)
        {
          v8 = 5;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_RATING")) & 1) != 0)
        {
          v8 = 6;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_REVIEW")) & 1) != 0)
        {
          v8 = 7;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PHOTO")) & 1) != 0)
        {
          v8 = 8;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_HOURS")) & 1) != 0)
        {
          v8 = 9;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_INFO")) & 1) != 0)
        {
          v8 = 10;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE")) & 1) != 0)
        {
          v8 = 11;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ETA")) & 1) != 0)
        {
          v8 = 12;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_FLYOVER")) & 1) != 0)
        {
          v8 = 13;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE")) & 1) != 0)
        {
          v8 = 14;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_AMENITIES")) & 1) != 0)
        {
          v8 = 15;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES")) & 1) != 0)
        {
          v8 = 16;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT")) & 1) != 0)
        {
          v8 = 20;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO")) & 1) != 0)
        {
          v8 = 21;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TEXT_BLOCK")) & 1) != 0)
        {
          v8 = 22;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_FACTOID")) & 1) != 0)
        {
          v8 = 23;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION")) & 1) != 0)
        {
          v8 = 24;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM")) & 1) != 0)
        {
          v8 = 25;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO")) & 1) != 0)
        {
          v8 = 26;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET")) & 1) != 0)
        {
          v8 = 27;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION")) & 1) != 0)
        {
          v8 = 29;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_RESULT_SNIPPET")) & 1) != 0)
        {
          v8 = 30;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT")) & 1) != 0)
        {
          v8 = 31;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT")) & 1) != 0)
        {
          v8 = 32;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK")) & 1) != 0)
        {
          v8 = 33;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT")) & 1) != 0)
        {
          v8 = 34;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TIP")) & 1) != 0)
        {
          v8 = 36;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACECARD_URL")) & 1) != 0)
        {
          v8 = 37;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ASSOCIATED_APP")) & 1) != 0)
        {
          v8 = 38;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_MESSAGE_LINK")) & 1) != 0)
        {
          v8 = 39;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_QUICK_LINK")) & 1) != 0)
        {
          v8 = 40;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_RAP")) & 1) != 0)
        {
          v8 = 41;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_AREA")) & 1) != 0)
        {
          v8 = 42;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_LOCATION_EVENT")) & 1) != 0)
        {
          v8 = 43;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS")) & 1) != 0)
        {
          v8 = 44;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER")) & 1) != 0)
        {
          v8 = 45;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES")) & 1) != 0)
        {
          v8 = 46;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_SIZE")) & 1) != 0)
        {
          v8 = 47;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_VENUE_INFO")) & 1) != 0)
        {
          v8 = 48;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
        {
          v8 = 49;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_CONTAINED_PLACE")) & 1) != 0)
        {
          v8 = 50;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT")) & 1) != 0)
        {
          v8 = 51;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ICON")) & 1) != 0)
        {
          v8 = 52;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION")) & 1) != 0)
        {
          v8 = 53;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES")) & 1) != 0)
        {
          v8 = 54;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_STOREFRONT")) & 1) != 0)
        {
          v8 = 55;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
        {
          v8 = 56;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST")) & 1) != 0)
        {
          v8 = 57;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_POI_EVENT")) & 1) != 0)
        {
          v8 = 58;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION")) & 1) != 0)
        {
          v8 = 59;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT")) & 1) != 0)
        {
          v8 = 60;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER")) & 1) != 0)
        {
          v8 = 61;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
        {
          v8 = 62;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_LINKED_SERVICE")) & 1) != 0)
        {
          v8 = 63;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_BUSINESS_HOURS")) & 1) != 0)
        {
          v8 = 64;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_COLLECTION")) & 1) != 0)
        {
          v8 = 65;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_RELATED_PLACE")) & 1) != 0)
        {
          v8 = 66;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP")) & 1) != 0)
        {
          v8 = 67;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME")) & 1) != 0)
        {
          v8 = 68;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY")) & 1) != 0)
        {
          v8 = 69;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
        {
          v8 = 70;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PUBLISHER")) & 1) != 0)
        {
          v8 = 71;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
        {
          v8 = 72;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
        {
          v8 = 73;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM")) & 1) != 0)
        {
          v8 = 74;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_COLLECTION_IDS")) & 1) != 0)
        {
          v8 = 76;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ISO_3166_CODE")) & 1) != 0)
        {
          v8 = 77;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES")) & 1) != 0)
        {
          v8 = 78;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE")) & 1) != 0)
        {
          v8 = 79;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_STOREFRONT_FACES")) & 1) != 0)
        {
          v8 = 81;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_GUIDE_GROUP")) & 1) != 0)
        {
          v8 = 82;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE")) & 1) != 0)
        {
          v8 = 83;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS")) & 1) != 0)
        {
          v8 = 84;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES")) & 1) != 0)
        {
          v8 = 85;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ABOUT")) & 1) != 0)
        {
          v8 = 86;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY")) & 1) != 0)
        {
          v8 = 87;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT")) & 1) != 0)
        {
          v8 = 88;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE")) & 1) != 0)
        {
          v8 = 89;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT")) & 1) != 0)
        {
          v8 = 90;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO")) & 1) != 0)
        {
          v8 = 91;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS")) & 1) != 0)
        {
          v8 = 92;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO")) & 1) != 0)
        {
          v8 = 93;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ACTION_DATA")) & 1) != 0)
        {
          v8 = 94;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA")) & 1) != 0)
        {
          v8 = 95;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_POI_CLAIM")) & 1) != 0)
        {
          v8 = 96;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_EV_CHARGER")) & 1) != 0)
        {
          v8 = 97;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TRAIL_HEAD")) & 1) != 0)
        {
          v8 = 98;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_TOOL_TIP")) & 1) != 0)
        {
          v8 = 99;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_REFRESH_ID")) & 1) != 0)
        {
          v8 = 100;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS")) & 1) != 0)
        {
          v8 = 101;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO")) & 1) != 0)
        {
          v8 = 102;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_FORWARD_INFO")) & 1) != 0)
        {
          v8 = 103;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO")) & 1) != 0)
        {
          v8 = 104;
        }
        else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_HIKE_SUMMARY")) & 1) != 0)
        {
          v8 = 105;
        }
        else if (objc_msgSend(v7, "isEqualToString:", CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY")))
        {
          v8 = 106;
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
          goto LABEL_209;
        v8 = objc_msgSend(v6, "intValue");
      }
      *(_BYTE *)(a1 + 44) |= 4u;
      *(_DWORD *)(a1 + 32) = v8;
LABEL_209:

      if (a3)
        v9 = CFSTR("startIndex");
      else
        v9 = CFSTR("start_index");
      objc_msgSend(v5, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "unsignedIntValue");
        *(_BYTE *)(a1 + 44) |= 2u;
        *(_DWORD *)(a1 + 28) = v11;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = objc_msgSend(v12, "unsignedIntValue");
        *(_BYTE *)(a1 + 44) |= 1u;
        *(_DWORD *)(a1 + 24) = v13;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("filter"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v15 = [GEOPDComponentFilter alloc];
        if (v15)
          v16 = (void *)-[GEOPDComponentFilter _initWithDictionary:isJSON:](v15, v14, a3);
        else
          v16 = 0;
        -[GEOPDComponentInfo setFilter:](a1, v16);

      }
      if (a3)
        v17 = CFSTR("includeSource");
      else
        v17 = CFSTR("include_source");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = objc_msgSend(v18, "BOOLValue");
        *(_BYTE *)(a1 + 44) |= 0x10u;
        *(_BYTE *)(a1 + 40) = v19;
      }

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("urgency"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v21 = v20;
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("CACHED")) & 1) != 0)
          v22 = 0;
        else
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("DYNAMIC"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_233:

          goto LABEL_234;
        }
        v22 = objc_msgSend(v20, "intValue");
      }
      *(_BYTE *)(a1 + 44) |= 8u;
      *(_DWORD *)(a1 + 36) = v22;
      goto LABEL_233;
    }
  }
LABEL_234:

  return a1;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDComponentInfoReadAllFrom((uint64_t)self, a3, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char flags;
  id v8;
  void *v9;
  char v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  flags = (char)self->_flags;
  if ((flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_type;
    *(_BYTE *)(v5 + 44) |= 4u;
    flags = (char)self->_flags;
    if ((flags & 2) == 0)
    {
LABEL_3:
      if ((flags & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_flags & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 28) = self->_startIndex;
  *(_BYTE *)(v5 + 44) |= 2u;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 24) = self->_count;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
LABEL_5:
  v8 = -[GEOPDComponentFilter copyWithZone:](self->_filter, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v8;

  v10 = (char)self->_flags;
  if ((v10 & 0x10) != 0)
  {
    *(_BYTE *)(v6 + 40) = self->_includeSource;
    *(_BYTE *)(v6 + 44) |= 0x10u;
    v10 = (char)self->_flags;
  }
  if ((v10 & 8) != 0)
  {
    *(_DWORD *)(v6 + 36) = self->_urgency;
    *(_BYTE *)(v6 + 44) |= 8u;
  }
  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    if (a2)
      -[GEOPDComponentFilter clearUnknownFields:](*(_QWORD *)(a1 + 16), 1);
  }
}

@end
