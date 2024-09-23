@implementation GEOLogMsgStatePlaceRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeDataRequest, 0);
}

- (void)setPlaceRequestType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_placeRequestType = a3;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_placeDataRequest)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (int)placeRequestType
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_placeRequestType;
  else
    return 0;
}

- (void)setHasPlaceRequestType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasPlaceRequestType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)placeRequestTypeAsString:(int)a3
{
  if (a3 < 0x3F)
    return off_1E1C23380[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsPlaceRequestType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
  {
    v4 = 48;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
  {
    v4 = 49;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
  {
    v4 = 50;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
  {
    v4 = 51;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
  {
    v4 = 52;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
  {
    v4 = 53;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
  {
    v4 = 54;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
  {
    v4 = 55;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
  {
    v4 = 56;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
  {
    v4 = 57;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
  {
    v4 = 58;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
  {
    v4 = 59;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
  {
    v4 = 60;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
  {
    v4 = 61;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
  {
    v4 = 62;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasPlaceDataRequest
{
  return self->_placeDataRequest != 0;
}

- (GEOPDPlaceRequest)placeDataRequest
{
  return self->_placeDataRequest;
}

- (void)setPlaceDataRequest:(id)a3
{
  objc_storeStrong((id *)&self->_placeDataRequest, a3);
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
  v8.super_class = (Class)GEOLogMsgStatePlaceRequest;
  -[GEOLogMsgStatePlaceRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgStatePlaceRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgStatePlaceRequest _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(int *)(a1 + 16);
      if (v5 >= 0x3F)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C23380[v5];
      }
      if (a2)
        v7 = CFSTR("placeRequestType");
      else
        v7 = CFSTR("place_request_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    objc_msgSend((id)a1, "placeDataRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v8, "jsonRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("placeDataRequest");
      }
      else
      {
        objc_msgSend(v8, "dictionaryRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = CFSTR("place_data_request");
      }
      objc_msgSend(v4, "setObject:forKey:", v10, v11);

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
  return -[GEOLogMsgStatePlaceRequest _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgStatePlaceRequest)initWithDictionary:(id)a3
{
  return (GEOLogMsgStatePlaceRequest *)-[GEOLogMsgStatePlaceRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;
  GEOPDPlaceRequest *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  if (!a1)
    goto LABEL_147;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_147;
  if (a3)
    v6 = CFSTR("placeRequestType");
  else
    v6 = CFSTR("place_request_type");
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_UNKNOWN")) & 1) != 0)
    {
      v9 = 0;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH")) & 1) != 0)
    {
      v9 = 1;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_GEOCODING")) & 1) != 0)
    {
      v9 = 2;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_CANONICAL_LOCATION_SEARCH")) & 1) != 0)
    {
      v9 = 3;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_REVERSE_GEOCODING")) & 1) != 0)
    {
      v9 = 4;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_LOOKUP")) & 1) != 0)
    {
      v9 = 5;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_MERCHANT_LOOKUP")) & 1) != 0)
    {
      v9 = 6;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_REFINEMENT")) & 1) != 0)
    {
      v9 = 7;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_SIRI_SEARCH")) & 1) != 0)
    {
      v9 = 8;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_LOCATION_DIRECTED_SEARCH")) & 1) != 0)
    {
      v9 = 9;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_AUTOCOMPLETE")) & 1) != 0)
    {
      v9 = 10;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BROWSE_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v9 = 11;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_CATEGORY_SEARCH")) & 1) != 0)
    {
      v9 = 12;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v9 = 13;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_CATEGORY_SUGGESTION")) & 1) != 0)
    {
      v9 = 14;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_FIELD_PLACEHOLDER")) & 1) != 0)
    {
      v9 = 15;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_POPULAR_NEARBY_SEARCH")) & 1) != 0)
    {
      v9 = 16;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_VENDOR_SPECIFIC_PLACE_REFINEMENT")) & 1) != 0)
    {
      v9 = 17;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_NEARBY_SEARCH")) & 1) != 0)
    {
      v9 = 18;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_OBJECT_GEOCODING")) & 1) != 0)
    {
      v9 = 19;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_ZERO_KEYWORD_WITH_SEARCH_RESULTS_SUGGESTION")) & 1) != 0)
    {
      v9 = 20;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTERNAL_TRANSIT_LOOKUP")) & 1) != 0)
    {
      v9 = 21;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_FEATURE_ID_GEOCODING")) & 1) != 0)
    {
      v9 = 22;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_IDENTIFIER_PLACE_LOOKUP")) & 1) != 0)
    {
      v9 = 23;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_DATASET_STATUS_CHECK")) & 1) != 0)
    {
      v9 = 24;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_AREA_LOOKUP")) & 1) != 0)
    {
      v9 = 25;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_REVERSE_GEOCODING")) & 1) != 0)
    {
      v9 = 26;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_SUGGESTED_REGIONS")) & 1) != 0)
    {
      v9 = 27;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_POLYGON_QUAD_NODES")) & 1) != 0)
    {
      v9 = 28;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_PROACTIVE_REGIONS")) & 1) != 0)
    {
      v9 = 29;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BRAND_LOOKUP")) & 1) != 0)
    {
      v9 = 30;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_UPDATE_MANIFEST")) & 1) != 0)
    {
      v9 = 31;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_WIFI_FINGERPRINT_LOOKUP")) & 1) != 0)
    {
      v9 = 32;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_INITIAL_OFFLINE_SUGGESTION")) & 1) != 0)
    {
      v9 = 33;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_IP_GEO_LOOKUP")) & 1) != 0)
    {
      v9 = 34;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_GROUND_VIEW_LABEL")) & 1) != 0)
    {
      v9 = 35;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_SPATIAL_LOOKUP")) & 1) != 0)
    {
      v9 = 36;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_VEHICLE_POSITION")) & 1) != 0)
    {
      v9 = 37;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_COLLECTION_LOOKUP")) & 1) != 0)
    {
      v9 = 38;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v9 = 39;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_CATEGORY_LOOKUP")) & 1) != 0)
    {
      v9 = 40;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_BATCH_MERCHANT_LOOKUP_BRAND")) & 1) != 0)
    {
      v9 = 41;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_CHILD_PLACE_LOOKUP_BY_CATEGORY")) & 1) != 0)
    {
      v9 = 42;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_COLLECTION_SUGGESTION")) & 1) != 0)
    {
      v9 = 43;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_SEARCH_HOME")) & 1) != 0)
    {
      v9 = 44;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACE_QUESTIONNAIRE_LOOKUP")) & 1) != 0)
    {
      v9 = 45;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_PUBLISHER_VIEW")) & 1) != 0)
    {
      v9 = 46;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_COLLECTIONS_VIEW")) & 1) != 0)
    {
      v9 = 47;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_AIRPORT_ENTITY_PLACE_LOOKUP")) & 1) != 0)
    {
      v9 = 48;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_TERRITORY_LOOKUP")) & 1) != 0)
    {
      v9 = 49;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_SCHEDULE_LOOKUP")) & 1) != 0)
    {
      v9 = 50;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_MAPS_HOME")) & 1) != 0)
    {
      v9 = 51;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_ALL_GUIDES_LOCATIONS")) & 1) != 0)
    {
      v9 = 52;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_GUIDES_HOME")) & 1) != 0)
    {
      v9 = 53;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_EXTENDED_GEO_LOOKUP")) & 1) != 0)
    {
      v9 = 54;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_QUERY_UNDERSTANDING")) & 1) != 0)
    {
      v9 = 55;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_POI_AT_ADDRESS_LOOKUP")) & 1) != 0)
    {
      v9 = 56;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_TRANSIT_NEARBY_PAYMENT_METHOD_LOOKUP")) & 1) != 0)
    {
      v9 = 57;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
    {
      v9 = 58;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_OFFLINE_REGION_NAME")) & 1) != 0)
    {
      v9 = 59;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_SEARCH_CAPABILITIES")) & 1) != 0)
    {
      v9 = 60;
    }
    else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_REFRESH_ID_LOOKUP")) & 1) != 0)
    {
      v9 = 61;
    }
    else if (objc_msgSend(v8, "isEqualToString:", CFSTR("REQUEST_TYPE_ADDRESS_RECOMMENDATION")))
    {
      v9 = 62;
    }
    else
    {
      v9 = 0;
    }

    goto LABEL_137;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = objc_msgSend(v7, "intValue");
LABEL_137:
    objc_msgSend(a1, "setPlaceRequestType:", v9);
  }

  if (a3)
    v10 = CFSTR("placeDataRequest");
  else
    v10 = CFSTR("place_data_request");
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = [GEOPDPlaceRequest alloc];
    if ((a3 & 1) != 0)
      v13 = -[GEOPDPlaceRequest initWithJSON:](v12, "initWithJSON:", v11);
    else
      v13 = -[GEOPDPlaceRequest initWithDictionary:](v12, "initWithDictionary:", v11);
    v14 = (void *)v13;
    objc_msgSend(a1, "setPlaceDataRequest:", v13);

  }
LABEL_147:

  return a1;
}

- (GEOLogMsgStatePlaceRequest)initWithJSON:(id)a3
{
  return (GEOLogMsgStatePlaceRequest *)-[GEOLogMsgStatePlaceRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgStatePlaceRequestIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgStatePlaceRequestReadAllFrom((uint64_t)self, a3, 0);
}

- (void)clearSensitiveFields:(unint64_t)a3
{
  GEOLogMsgStatePlaceRequestClearSensitiveFields(self, a3, 1);
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  return -[GEOPDPlaceRequest hasGreenTeaWithValue:](self->_placeDataRequest, "hasGreenTeaWithValue:", a3);
}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOLogMsgStatePlaceRequest readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_placeRequestType;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_placeDataRequest)
  {
    objc_msgSend(v5, "setPlaceDataRequest:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_placeRequestType;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[GEOPDPlaceRequest copyWithZone:](self->_placeDataRequest, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDPlaceRequest *placeDataRequest;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOLogMsgStatePlaceRequest readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_placeRequestType != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  placeDataRequest = self->_placeDataRequest;
  if ((unint64_t)placeDataRequest | *((_QWORD *)v4 + 1))
    v6 = -[GEOPDPlaceRequest isEqual:](placeDataRequest, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOLogMsgStatePlaceRequest readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_placeRequestType;
  else
    v3 = 0;
  return -[GEOPDPlaceRequest hash](self->_placeDataRequest, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEOPDPlaceRequest *placeDataRequest;
  uint64_t v6;
  int *v7;

  v7 = (int *)a3;
  objc_msgSend(v7, "readAll:", 0);
  v4 = v7;
  if ((v7[5] & 1) != 0)
  {
    self->_placeRequestType = v7[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  placeDataRequest = self->_placeDataRequest;
  v6 = *((_QWORD *)v7 + 1);
  if (placeDataRequest)
  {
    if (v6)
    {
      -[GEOPDPlaceRequest mergeFrom:](placeDataRequest, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[GEOLogMsgStatePlaceRequest setPlaceDataRequest:](self, "setPlaceDataRequest:");
    goto LABEL_8;
  }

}

@end
