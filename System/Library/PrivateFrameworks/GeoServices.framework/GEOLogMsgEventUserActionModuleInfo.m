@implementation GEOLogMsgEventUserActionModuleInfo

- (int)type
{
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 1u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3;
}

- (BOOL)hasType
{
  return *(_BYTE *)&self->_flags & 1;
}

- (id)typeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E1C23678[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_TITLE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_BUTTONS")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_INLINE_MAP")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_PHOTOS")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_INFOS")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_DEPARTURE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_ATTRIBUTION")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ENCYCLOPEDIC")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_HOURS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_BUSINESS_INFOS")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEWS")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ACTIONS_ROW")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_RESERVATIONS")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_OFFICIAL_APPS")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_BROWSE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_INFO")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_INFO_PARENT")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_LIST")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_PICTURE")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE_HOURS")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ACTION_FOOTER")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ATTRIBUTION")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_WEB_CONTENT")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_RELATED_PLACE_LIST")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_SERVICE_HOURS")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_QUICK_LINKS")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_COLLECTIONS")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_CURATED_COLLECTIONS")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_APPLE_RATINGS")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_RIBBON")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEW_AND_RATING")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_ABOUT")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_TEMPLATE_PLACE")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_LABELS")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_UNIFIED_ACTION_ROW")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_QUESTIONNAIRE_SUGGESTION")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_EV_CHARGER")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_HIKING_ASSOCIATION")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_NOTE")) & 1) != 0)
  {
    v4 = 45;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("MODULE_TYPE_HIKE_SUGGESTION")))
  {
    v4 = 46;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)hasModuleMetadata
{
  return self->_moduleMetadata != 0;
}

- (NSString)moduleMetadata
{
  return self->_moduleMetadata;
}

- (void)setModuleMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_moduleMetadata, a3);
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
  v8.super_class = (Class)GEOLogMsgEventUserActionModuleInfo;
  -[GEOLogMsgEventUserActionModuleInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgEventUserActionModuleInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOLogMsgEventUserActionModuleInfo _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  const __CFString *v8;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 20) & 1) != 0)
    {
      v5 = *(_DWORD *)(a1 + 16);
      if (v5 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v5) & 1) != 0)
      {
        v6 = off_1E1C23678[v5];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 16));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    objc_msgSend((id)a1, "moduleMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a2)
        v8 = CFSTR("moduleMetadata");
      else
        v8 = CFSTR("module_metadata");
      objc_msgSend(v4, "setObject:forKey:", v7, v8);
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
  return -[GEOLogMsgEventUserActionModuleInfo _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEOLogMsgEventUserActionModuleInfo)initWithDictionary:(id)a3
{
  return (GEOLogMsgEventUserActionModuleInfo *)-[GEOLogMsgEventUserActionModuleInfo _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;

  v5 = a2;
  if (!a1)
    goto LABEL_107;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_107;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_TITLE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_BUTTONS")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_INLINE_MAP")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_PHOTOS")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_INFOS")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_DEPARTURE")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_ATTRIBUTION")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ENCYCLOPEDIC")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_HOURS")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_BUSINESS_INFOS")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEWS")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ACTIONS_ROW")) & 1) != 0)
    {
      v8 = 12;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_RESERVATIONS")) & 1) != 0)
    {
      v8 = 14;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_OFFICIAL_APPS")) & 1) != 0)
    {
      v8 = 15;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_BROWSE")) & 1) != 0)
    {
      v8 = 16;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_VENUE_INFO")) & 1) != 0)
    {
      v8 = 17;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_INFO_PARENT")) & 1) != 0)
    {
      v8 = 18;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_LIST")) & 1) != 0)
    {
      v8 = 19;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ANNOTATED_PICTURE")) & 1) != 0)
    {
      v8 = 20;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE")) & 1) != 0)
    {
      v8 = 21;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_MESSAGE_HOURS")) & 1) != 0)
    {
      v8 = 22;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ACTION_FOOTER")) & 1) != 0)
    {
      v8 = 23;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ATTRIBUTION")) & 1) != 0)
    {
      v8 = 24;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_WEB_CONTENT")) & 1) != 0)
    {
      v8 = 25;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_RELATED_PLACE_LIST")) & 1) != 0)
    {
      v8 = 26;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_SERVICE_HOURS")) & 1) != 0)
    {
      v8 = 27;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_QUICK_LINKS")) & 1) != 0)
    {
      v8 = 28;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_COLLECTIONS")) & 1) != 0)
    {
      v8 = 29;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
    {
      v8 = 30;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_MINI_PLACE_BROWSE_CATEGORIES")) & 1) != 0)
    {
      v8 = 31;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_CURATED_COLLECTIONS")) & 1) != 0)
    {
      v8 = 32;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_QUESTIONNAIRE")) & 1) != 0)
    {
      v8 = 33;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_APPLE_RATINGS")) & 1) != 0)
    {
      v8 = 34;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_PLACE_RIBBON")) & 1) != 0)
    {
      v8 = 35;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_REVIEW_AND_RATING")) & 1) != 0)
    {
      v8 = 36;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_ABOUT")) & 1) != 0)
    {
      v8 = 37;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_TEMPLATE_PLACE")) & 1) != 0)
    {
      v8 = 38;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_TRANSIT_LABELS")) & 1) != 0)
    {
      v8 = 39;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_PLACECARD_ENRICHMENT")) & 1) != 0)
    {
      v8 = 40;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_UNIFIED_ACTION_ROW")) & 1) != 0)
    {
      v8 = 41;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_QUESTIONNAIRE_SUGGESTION")) & 1) != 0)
    {
      v8 = 42;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_EV_CHARGER")) & 1) != 0)
    {
      v8 = 43;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_HIKING_ASSOCIATION")) & 1) != 0)
    {
      v8 = 44;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_NOTE")) & 1) != 0)
    {
      v8 = 45;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("MODULE_TYPE_HIKE_SUGGESTION")))
    {
      v8 = 46;
    }
    else
    {
      v8 = 0;
    }

    goto LABEL_100;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v6, "intValue");
LABEL_100:
    objc_msgSend(a1, "setType:", v8);
  }

  if (a3)
    v9 = CFSTR("moduleMetadata");
  else
    v9 = CFSTR("module_metadata");
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(a1, "setModuleMetadata:", v11);

  }
LABEL_107:

  return a1;
}

- (GEOLogMsgEventUserActionModuleInfo)initWithJSON:(id)a3
{
  return (GEOLogMsgEventUserActionModuleInfo *)-[GEOLogMsgEventUserActionModuleInfo _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  return GEOLogMsgEventUserActionModuleInfoIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOLogMsgEventUserActionModuleInfoReadAllFrom((uint64_t)self, a3);
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
  if (self->_moduleMetadata)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GEOLogMsgEventUserActionModuleInfo readAll:](self, "readAll:", 0);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_type;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  if (self->_moduleMetadata)
  {
    objc_msgSend(v5, "setModuleMetadata:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_type;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_moduleMetadata, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *moduleMetadata;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[GEOLogMsgEventUserActionModuleInfo readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_type != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  moduleMetadata = self->_moduleMetadata;
  if ((unint64_t)moduleMetadata | *((_QWORD *)v4 + 1))
    v6 = -[NSString isEqual:](moduleMetadata, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  -[GEOLogMsgEventUserActionModuleInfo readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  return -[NSString hash](self->_moduleMetadata, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v5 = (int *)a3;
  objc_msgSend(v5, "readAll:", 0);
  v4 = v5;
  if ((v5[5] & 1) != 0)
  {
    self->_type = v5[4];
    *(_BYTE *)&self->_flags |= 1u;
  }
  if (*((_QWORD *)v5 + 1))
  {
    -[GEOLogMsgEventUserActionModuleInfo setModuleMetadata:](self, "setModuleMetadata:");
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moduleMetadata, 0);
}

@end
