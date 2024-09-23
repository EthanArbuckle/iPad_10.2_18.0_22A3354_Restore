@implementation GEOPDExternalAction

- (void)addExternalActionDetail:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 16);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v5;

      v4 = *(void **)(a1 + 16);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

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
  v8.super_class = (Class)GEOPDExternalAction;
  -[GEOPDExternalAction description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExternalAction dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExternalAction _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)(a1 + 28) & 1) != 0)
  {
    v5 = CFSTR("COMPONENT_TYPE_UNKNOWN");
    switch(*(_DWORD *)(a1 + 24))
    {
      case 0:
        break;
      case 1:
        v5 = CFSTR("COMPONENT_TYPE_ENTITY");
        break;
      case 2:
        v5 = CFSTR("COMPONENT_TYPE_PLACE_INFO");
        break;
      case 3:
        v5 = CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO");
        break;
      case 4:
        v5 = CFSTR("COMPONENT_TYPE_BOUNDS");
        break;
      case 5:
        v5 = CFSTR("COMPONENT_TYPE_ADDRESS");
        break;
      case 6:
        v5 = CFSTR("COMPONENT_TYPE_RATING");
        break;
      case 7:
        v5 = CFSTR("COMPONENT_TYPE_REVIEW");
        break;
      case 8:
        v5 = CFSTR("COMPONENT_TYPE_PHOTO");
        break;
      case 9:
        v5 = CFSTR("COMPONENT_TYPE_HOURS");
        break;
      case 0xA:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO");
        break;
      case 0xB:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE");
        break;
      case 0xC:
        v5 = CFSTR("COMPONENT_TYPE_ETA");
        break;
      case 0xD:
        v5 = CFSTR("COMPONENT_TYPE_FLYOVER");
        break;
      case 0xE:
        v5 = CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE");
        break;
      case 0xF:
        v5 = CFSTR("COMPONENT_TYPE_AMENITIES");
        break;
      case 0x10:
        v5 = CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES");
        break;
      case 0x14:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT");
        break;
      case 0x15:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO");
        break;
      case 0x16:
        v5 = CFSTR("COMPONENT_TYPE_TEXT_BLOCK");
        break;
      case 0x17:
        v5 = CFSTR("COMPONENT_TYPE_FACTOID");
        break;
      case 0x18:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION");
        break;
      case 0x19:
        v5 = CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM");
        break;
      case 0x1A:
        v5 = CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO");
        break;
      case 0x1B:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET");
        break;
      case 0x1D:
        v5 = CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION");
        break;
      case 0x1E:
        v5 = CFSTR("COMPONENT_TYPE_RESULT_SNIPPET");
        break;
      case 0x1F:
        v5 = CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT");
        break;
      case 0x20:
        v5 = CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT");
        break;
      case 0x21:
        v5 = CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK");
        break;
      case 0x22:
        v5 = CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT");
        break;
      case 0x24:
        v5 = CFSTR("COMPONENT_TYPE_TIP");
        break;
      case 0x25:
        v5 = CFSTR("COMPONENT_TYPE_PLACECARD_URL");
        break;
      case 0x26:
        v5 = CFSTR("COMPONENT_TYPE_ASSOCIATED_APP");
        break;
      case 0x27:
        v5 = CFSTR("COMPONENT_TYPE_MESSAGE_LINK");
        break;
      case 0x28:
        v5 = CFSTR("COMPONENT_TYPE_QUICK_LINK");
        break;
      case 0x29:
        v5 = CFSTR("COMPONENT_TYPE_RAP");
        break;
      case 0x2A:
        v5 = CFSTR("COMPONENT_TYPE_OFFLINE_AREA");
        break;
      case 0x2B:
        v5 = CFSTR("COMPONENT_TYPE_LOCATION_EVENT");
        break;
      case 0x2C:
        v5 = CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS");
        break;
      case 0x2D:
        v5 = CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER");
        break;
      case 0x2E:
        v5 = CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES");
        break;
      case 0x2F:
        v5 = CFSTR("COMPONENT_TYPE_OFFLINE_SIZE");
        break;
      case 0x30:
        v5 = CFSTR("COMPONENT_TYPE_VENUE_INFO");
        break;
      case 0x31:
        v5 = CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST");
        break;
      case 0x32:
        v5 = CFSTR("COMPONENT_TYPE_CONTAINED_PLACE");
        break;
      case 0x33:
        v5 = CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT");
        break;
      case 0x34:
        v5 = CFSTR("COMPONENT_TYPE_ICON");
        break;
      case 0x35:
        v5 = CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION");
        break;
      case 0x36:
        v5 = CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES");
        break;
      case 0x37:
        v5 = CFSTR("COMPONENT_TYPE_STOREFRONT");
        break;
      case 0x38:
        v5 = CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL");
        break;
      case 0x39:
        v5 = CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST");
        break;
      case 0x3A:
        v5 = CFSTR("COMPONENT_TYPE_POI_EVENT");
        break;
      case 0x3B:
        v5 = CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION");
        break;
      case 0x3C:
        v5 = CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT");
        break;
      case 0x3D:
        v5 = CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER");
        break;
      case 0x3E:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION");
        break;
      case 0x3F:
        v5 = CFSTR("COMPONENT_TYPE_LINKED_SERVICE");
        break;
      case 0x40:
        v5 = CFSTR("COMPONENT_TYPE_BUSINESS_HOURS");
        break;
      case 0x41:
        v5 = CFSTR("COMPONENT_TYPE_COLLECTION");
        break;
      case 0x42:
        v5 = CFSTR("COMPONENT_TYPE_RELATED_PLACE");
        break;
      case 0x43:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP");
        break;
      case 0x44:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME");
        break;
      case 0x45:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY");
        break;
      case 0x46:
        v5 = CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES");
        break;
      case 0x47:
        v5 = CFSTR("COMPONENT_TYPE_PUBLISHER");
        break;
      case 0x48:
        v5 = CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES");
        break;
      case 0x49:
        v5 = CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE");
        break;
      case 0x4A:
        v5 = CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM");
        break;
      case 0x4C:
        v5 = CFSTR("COMPONENT_TYPE_COLLECTION_IDS");
        break;
      case 0x4D:
        v5 = CFSTR("COMPONENT_TYPE_ISO_3166_CODE");
        break;
      case 0x4E:
        v5 = CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES");
        break;
      case 0x4F:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE");
        break;
      case 0x51:
        v5 = CFSTR("COMPONENT_TYPE_STOREFRONT_FACES");
        break;
      case 0x52:
        v5 = CFSTR("COMPONENT_TYPE_GUIDE_GROUP");
        break;
      case 0x53:
        v5 = CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE");
        break;
      case 0x54:
        v5 = CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS");
        break;
      case 0x55:
        v5 = CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES");
        break;
      case 0x56:
        v5 = CFSTR("COMPONENT_TYPE_ABOUT");
        break;
      case 0x57:
        v5 = CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY");
        break;
      case 0x58:
        v5 = CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT");
        break;
      case 0x59:
        v5 = CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE");
        break;
      case 0x5A:
        v5 = CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT");
        break;
      case 0x5B:
        v5 = CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO");
        break;
      case 0x5C:
        v5 = CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS");
        break;
      case 0x5D:
        v5 = CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO");
        break;
      case 0x5E:
        v5 = CFSTR("COMPONENT_TYPE_ACTION_DATA");
        break;
      case 0x5F:
        v5 = CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA");
        break;
      case 0x60:
        v5 = CFSTR("COMPONENT_TYPE_POI_CLAIM");
        break;
      case 0x61:
        v5 = CFSTR("COMPONENT_TYPE_EV_CHARGER");
        break;
      case 0x62:
        v5 = CFSTR("COMPONENT_TYPE_TRAIL_HEAD");
        break;
      case 0x63:
        v5 = CFSTR("COMPONENT_TYPE_TOOL_TIP");
        break;
      case 0x64:
        v5 = CFSTR("COMPONENT_TYPE_REFRESH_ID");
        break;
      case 0x65:
        v5 = CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS");
        break;
      case 0x66:
        v5 = CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO");
        break;
      case 0x67:
        v5 = CFSTR("COMPONENT_TYPE_FORWARD_INFO");
        break;
      case 0x68:
        v5 = CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO");
        break;
      case 0x69:
        v5 = CFSTR("COMPONENT_TYPE_HIKE_SUMMARY");
        break;
      case 0x6A:
        v5 = CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY");
        break;
      default:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 24));
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        break;
    }
    if (a2)
      v6 = CFSTR("componentType");
    else
      v6 = CFSTR("component_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v6);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v8 = *(id *)(a1 + 16);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v13, "jsonRepresentation");
          else
            objc_msgSend(v13, "dictionaryRepresentation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    if (a2)
      v15 = CFSTR("externalActionDetail");
    else
      v15 = CFSTR("external_action_detail");
    objc_msgSend(v4, "setObject:forKey:", v7, v15);

  }
  v16 = *(void **)(a1 + 8);
  if (v16)
  {
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v17, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __49__GEOPDExternalAction__dictionaryRepresentation___block_invoke;
      v23[3] = &unk_1E1C00600;
      v20 = v19;
      v24 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v23);
      v21 = v20;

      v18 = v21;
    }
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExternalAction _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __49__GEOPDExternalAction__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (BOOL)readFrom:(id)a3
{
  return GEOPDExternalActionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_externalActionDetails;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (id *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_componentType;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_externalActionDetails;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3, (_QWORD)v14);
        -[GEOPDExternalAction addExternalActionDetail:]((uint64_t)v6, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  objc_storeStrong(v6 + 1, self->_unknownFields);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *externalActionDetails;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_componentType != *((_DWORD *)v4 + 6))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  externalActionDetails = self->_externalActionDetails;
  if ((unint64_t)externalActionDetails | *((_QWORD *)v4 + 2))
    v6 = -[NSMutableArray isEqual:](externalActionDetails, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v2 = 2654435761 * self->_componentType;
  else
    v2 = 0;
  return -[NSMutableArray hash](self->_externalActionDetails, "hash") ^ v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalActionDetails, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
