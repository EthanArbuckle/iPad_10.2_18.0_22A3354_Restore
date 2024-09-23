@implementation GEOPDExternalActionFilter

- (void)dealloc
{
  objc_super v3;

  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDExternalActionFilter;
  -[GEOPDExternalActionFilter dealloc](&v3, sel_dealloc);
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
  v8.super_class = (Class)GEOPDExternalActionFilter;
  -[GEOPDExternalActionFilter description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDExternalActionFilter dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDExternalActionFilter _dictionaryRepresentation:](self, 0);
}

- (id)_dictionaryRepresentation:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1[3])
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = a1 + 2;
    if (a1[3])
    {
      v7 = 0;
      do
      {
        v8 = *(unsigned int *)(*v6 + 4 * v7);
        v9 = CFSTR("COMPONENT_TYPE_UNKNOWN");
        switch((int)v8)
        {
          case 0:
            break;
          case 1:
            v9 = CFSTR("COMPONENT_TYPE_ENTITY");
            break;
          case 2:
            v9 = CFSTR("COMPONENT_TYPE_PLACE_INFO");
            break;
          case 3:
            v9 = CFSTR("COMPONENT_TYPE_ROAD_ACCESS_INFO");
            break;
          case 4:
            v9 = CFSTR("COMPONENT_TYPE_BOUNDS");
            break;
          case 5:
            v9 = CFSTR("COMPONENT_TYPE_ADDRESS");
            break;
          case 6:
            v9 = CFSTR("COMPONENT_TYPE_RATING");
            break;
          case 7:
            v9 = CFSTR("COMPONENT_TYPE_REVIEW");
            break;
          case 8:
            v9 = CFSTR("COMPONENT_TYPE_PHOTO");
            break;
          case 9:
            v9 = CFSTR("COMPONENT_TYPE_HOURS");
            break;
          case 10:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO");
            break;
          case 11:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_SCHEDULE");
            break;
          case 12:
            v9 = CFSTR("COMPONENT_TYPE_ETA");
            break;
          case 13:
            v9 = CFSTR("COMPONENT_TYPE_FLYOVER");
            break;
          case 14:
            v9 = CFSTR("COMPONENT_TYPE_RAW_ATTRIBUTE");
            break;
          case 15:
            v9 = CFSTR("COMPONENT_TYPE_AMENITIES");
            break;
          case 16:
            v9 = CFSTR("COMPONENT_TYPE_STYLE_ATTRIBUTES");
            break;
          case 20:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_INCIDENT");
            break;
          case 21:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_ASSOCIATED_INFO");
            break;
          case 22:
            v9 = CFSTR("COMPONENT_TYPE_TEXT_BLOCK");
            break;
          case 23:
            v9 = CFSTR("COMPONENT_TYPE_FACTOID");
            break;
          case 24:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_ATTRIBUTION");
            break;
          case 25:
            v9 = CFSTR("COMPONENT_TYPE_BUSINESS_CLAIM");
            break;
          case 26:
            v9 = CFSTR("COMPONENT_TYPE_CAPTIONED_PHOTO");
            break;
          case 27:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_INFO_SNIPPET");
            break;
          case 29:
            v9 = CFSTR("COMPONENT_TYPE_EXTERNAL_ACTION");
            break;
          case 30:
            v9 = CFSTR("COMPONENT_TYPE_RESULT_SNIPPET");
            break;
          case 31:
            v9 = CFSTR("COMPONENT_TYPE_ADDRESS_OBJECT");
            break;
          case 32:
            v9 = CFSTR("COMPONENT_TYPE_SIMPLE_RESTAURANT_MENU_TEXT");
            break;
          case 33:
            v9 = CFSTR("COMPONENT_TYPE_RESTAURANT_RESERVATION_LINK");
            break;
          case 34:
            v9 = CFSTR("COMPONENT_TYPE_SPATIAL_LOOKUP_RESULT");
            break;
          case 36:
            v9 = CFSTR("COMPONENT_TYPE_TIP");
            break;
          case 37:
            v9 = CFSTR("COMPONENT_TYPE_PLACECARD_URL");
            break;
          case 38:
            v9 = CFSTR("COMPONENT_TYPE_ASSOCIATED_APP");
            break;
          case 39:
            v9 = CFSTR("COMPONENT_TYPE_MESSAGE_LINK");
            break;
          case 40:
            v9 = CFSTR("COMPONENT_TYPE_QUICK_LINK");
            break;
          case 41:
            v9 = CFSTR("COMPONENT_TYPE_RAP");
            break;
          case 42:
            v9 = CFSTR("COMPONENT_TYPE_OFFLINE_AREA");
            break;
          case 43:
            v9 = CFSTR("COMPONENT_TYPE_LOCATION_EVENT");
            break;
          case 44:
            v9 = CFSTR("COMPONENT_TYPE_SUPPORTS_OFFLINE_MAPS");
            break;
          case 45:
            v9 = CFSTR("COMPONENT_TYPE_OFFLINE_IDENTIFIER");
            break;
          case 46:
            v9 = CFSTR("COMPONENT_TYPE_OFFLINE_QUAD_NODES");
            break;
          case 47:
            v9 = CFSTR("COMPONENT_TYPE_OFFLINE_SIZE");
            break;
          case 48:
            v9 = CFSTR("COMPONENT_TYPE_VENUE_INFO");
            break;
          case 49:
            v9 = CFSTR("COMPONENT_TYPE_OFFLINE_UPDATE_MANIFEST");
            break;
          case 50:
            v9 = CFSTR("COMPONENT_TYPE_CONTAINED_PLACE");
            break;
          case 51:
            v9 = CFSTR("COMPONENT_TYPE_WIFI_FINGERPRINT");
            break;
          case 52:
            v9 = CFSTR("COMPONENT_TYPE_ICON");
            break;
          case 53:
            v9 = CFSTR("COMPONENT_TYPE_PRICE_DESCRIPTION");
            break;
          case 54:
            v9 = CFSTR("COMPONENT_TYPE_BROWSE_CATEGORIES");
            break;
          case 55:
            v9 = CFSTR("COMPONENT_TYPE_STOREFRONT");
            break;
          case 56:
            v9 = CFSTR("COMPONENT_TYPE_GROUND_VIEW_LABEL");
            break;
          case 57:
            v9 = CFSTR("COMPONENT_TYPE_ANNOTATED_ITEM_LIST");
            break;
          case 58:
            v9 = CFSTR("COMPONENT_TYPE_POI_EVENT");
            break;
          case 59:
            v9 = CFSTR("COMPONENT_TYPE_STOREFRONT_PRESENTATION");
            break;
          case 60:
            v9 = CFSTR("COMPONENT_TYPE_PLACECARD_LAYOUT");
            break;
          case 61:
            v9 = CFSTR("COMPONENT_TYPE_PROTOTYPE_CONTAINER");
            break;
          case 62:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_VEHICLE_POSITION");
            break;
          case 63:
            v9 = CFSTR("COMPONENT_TYPE_LINKED_SERVICE");
            break;
          case 64:
            v9 = CFSTR("COMPONENT_TYPE_BUSINESS_HOURS");
            break;
          case 65:
            v9 = CFSTR("COMPONENT_TYPE_COLLECTION");
            break;
          case 66:
            v9 = CFSTR("COMPONENT_TYPE_RELATED_PLACE");
            break;
          case 67:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP");
            break;
          case 68:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_STOP_TIME");
            break;
          case 69:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_TRIP_GEOMETRY");
            break;
          case 70:
            v9 = CFSTR("COMPONENT_TYPE_PLACE_BROWSE_CATEGORIES");
            break;
          case 71:
            v9 = CFSTR("COMPONENT_TYPE_PUBLISHER");
            break;
          case 72:
            v9 = CFSTR("COMPONENT_TYPE_MINI_PLACE_BROWSE_CATEGORIES");
            break;
          case 73:
            v9 = CFSTR("COMPONENT_TYPE_PLACE_QUESTIONNAIRE");
            break;
          case 74:
            v9 = CFSTR("COMPONENT_TYPE_PLACE_COLLECTION_ITEM");
            break;
          case 76:
            v9 = CFSTR("COMPONENT_TYPE_COLLECTION_IDS");
            break;
          case 77:
            v9 = CFSTR("COMPONENT_TYPE_ISO_3166_CODE");
            break;
          case 78:
            v9 = CFSTR("COMPONENT_TYPE_VENDOR_AMENITIES");
            break;
          case 79:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_NEARBY_SCHEDULE");
            break;
          case 81:
            v9 = CFSTR("COMPONENT_TYPE_STOREFRONT_FACES");
            break;
          case 82:
            v9 = CFSTR("COMPONENT_TYPE_GUIDE_GROUP");
            break;
          case 83:
            v9 = CFSTR("COMPONENT_TYPE_CONTAINMENT_PLACE");
            break;
          case 84:
            v9 = CFSTR("COMPONENT_TYPE_CATEGORIZED_PHOTOS");
            break;
          case 85:
            v9 = CFSTR("COMPONENT_TYPE_EXPLORE_GUIDES");
            break;
          case 86:
            v9 = CFSTR("COMPONENT_TYPE_ABOUT");
            break;
          case 87:
            v9 = CFSTR("COMPONENT_TYPE_LABEL_GEOMETRY");
            break;
          case 88:
            v9 = CFSTR("COMPONENT_TYPE_ENHANCED_PLACEMENT");
            break;
          case 89:
            v9 = CFSTR("COMPONENT_TYPE_TEMPLATE_PLACE");
            break;
          case 90:
            v9 = CFSTR("COMPONENT_TYPE_SEARCH_ENRICHMENT");
            break;
          case 91:
            v9 = CFSTR("COMPONENT_TYPE_TRANSIT_PAYMENT_METHOD_INFO");
            break;
          case 92:
            v9 = CFSTR("COMPONENT_TYPE_BUSINESS_ASSETS");
            break;
          case 93:
            v9 = CFSTR("COMPONENT_TYPE_ENRICHMENT_INFO");
            break;
          case 94:
            v9 = CFSTR("COMPONENT_TYPE_ACTION_DATA");
            break;
          case 95:
            v9 = CFSTR("COMPONENT_TYPE_ENRICHMENT_DATA");
            break;
          case 96:
            v9 = CFSTR("COMPONENT_TYPE_POI_CLAIM");
            break;
          case 97:
            v9 = CFSTR("COMPONENT_TYPE_EV_CHARGER");
            break;
          case 98:
            v9 = CFSTR("COMPONENT_TYPE_TRAIL_HEAD");
            break;
          case 99:
            v9 = CFSTR("COMPONENT_TYPE_TOOL_TIP");
            break;
          case 100:
            v9 = CFSTR("COMPONENT_TYPE_REFRESH_ID");
            break;
          case 101:
            v9 = CFSTR("COMPONENT_TYPE_ADDRESS_COMPONENTS");
            break;
          case 102:
            v9 = CFSTR("COMPONENT_TYPE_SEARCH_RESULT_PLACE_PHOTO");
            break;
          case 103:
            v9 = CFSTR("COMPONENT_TYPE_FORWARD_INFO");
            break;
          case 104:
            v9 = CFSTR("COMPONENT_TYPE_HIKE_ASSOCIATED_INFO");
            break;
          case 105:
            v9 = CFSTR("COMPONENT_TYPE_HIKE_SUMMARY");
            break;
          case 106:
            v9 = CFSTR("COMPONENT_TYPE_HIKE_GEOMETRY");
            break;
          default:
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
            break;
        }
        objc_msgSend(v5, "addObject:", v9);

        ++v7;
        v6 = a1 + 2;
      }
      while (v7 < a1[3]);
    }
    if (a2)
      v10 = CFSTR("componentType");
    else
      v10 = CFSTR("component_type");
    objc_msgSend(v4, "setObject:forKey:", v5, v10);

  }
  v11 = (void *)a1[1];
  if (v11)
  {
    objc_msgSend(v11, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __55__GEOPDExternalActionFilter__dictionaryRepresentation___block_invoke;
      v18[3] = &unk_1E1C00600;
      v15 = v14;
      v19 = v15;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v18);
      v16 = v15;

      v13 = v16;
    }
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDExternalActionFilter _dictionaryRepresentation:](self, 1);
}

void __55__GEOPDExternalActionFilter__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDExternalActionFilterReadAllFrom((uint64_t)self, a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_componentTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_componentTypes.count);
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  objc_storeStrong(v4 + 1, self->_unknownFields);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char IsEqual;

  v3 = a3;
  if (objc_msgSend(v3, "isMemberOfClass:", objc_opt_class()))
    IsEqual = PBRepeatedInt32IsEqual();
  else
    IsEqual = 0;

  return IsEqual;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
