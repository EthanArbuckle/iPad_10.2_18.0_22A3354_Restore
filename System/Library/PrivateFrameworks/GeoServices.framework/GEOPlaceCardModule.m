@implementation GEOPlaceCardModule

- (GEOPlaceCardModule)init
{
  GEOPlaceCardModule *v2;
  GEOPlaceCardModule *v3;
  GEOPlaceCardModule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPlaceCardModule;
  v2 = -[GEOPlaceCardModule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPlaceCardModule)initWithData:(id)a3
{
  GEOPlaceCardModule *v3;
  GEOPlaceCardModule *v4;
  GEOPlaceCardModule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPlaceCardModule;
  v3 = -[GEOPlaceCardModule initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPlaceCardModule;
  -[GEOPlaceCardModule dealloc](&v3, sel_dealloc);
}

- (int)type
{
  os_unfair_lock_s *p_readerLock;
  char flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (char)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 1) != 0)
    return self->_type;
  else
    return 0;
}

- (void)setType:(int)a3
{
  *(_BYTE *)&self->_flags |= 9u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0xFE | a3 | 8;
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

- (void)_readContents
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContents_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (unint64_t)contentsCount
{
  -[GEOPlaceCardModule _readContents]((uint64_t)self);
  return self->_contents.count;
}

- (int)contents
{
  -[GEOPlaceCardModule _readContents]((uint64_t)self);
  return self->_contents.list;
}

- (void)clearContents
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Clear();
}

- (void)addContent:(int)a3
{
  -[GEOPlaceCardModule _readContents]((uint64_t)self);
  if (self)
    PBRepeatedInt32Add();
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
}

- (int)contentAtIndex:(unint64_t)a3
{
  $27AAA0BB14FCB8642CC83DAEBE69EA4A *p_contents;
  unint64_t count;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  -[GEOPlaceCardModule _readContents]((uint64_t)self);
  p_contents = &self->_contents;
  count = self->_contents.count;
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
  return p_contents->list[a3];
}

- (void)setContents:(int *)a3 count:(unint64_t)a4
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_BYTE *)&self->_flags |= 2u;
  os_unfair_lock_unlock(p_readerLock);
  *(_BYTE *)&self->_flags |= 8u;
  PBRepeatedInt32Set();
}

- (id)contentsAsString:(int)a3
{
  if (a3 < 0x10)
    return off_1E1C235D0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsContents:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_UNKNOWN")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_TO_GUIDES")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_REPORT_AN_ISSUE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_SHARE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_CALL")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_MESSAGE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_WEBSITE")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_QUICK_LINK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_GROUP")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_DIRECTIONS")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_FLYOVER")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_DOWNLOAD")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_PHOTOS")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_TO_FAVORITES")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_SAVE_TO_LIBRARY")) & 1) != 0)
  {
    v4 = 14;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("BUTTON_TYPE_ADD_A_NOTE")))
  {
    v4 = 15;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_readMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    if ((*(_BYTE *)(a1 + 64) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMetadata_tags_4);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (BOOL)hasMetadata
{
  -[GEOPlaceCardModule _readMetadata]((uint64_t)self);
  return self->_metadata != 0;
}

- (NSString)metadata
{
  -[GEOPlaceCardModule _readMetadata]((uint64_t)self);
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xCu;
  objc_storeStrong((id *)&self->_metadata, a3);
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
  v8.super_class = (Class)GEOPlaceCardModule;
  -[GEOPlaceCardModule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceCardModule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v2;
  unsigned int v3;
  __CFString *v4;
  void *v5;
  _QWORD *v6;
  unint64_t v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 64) & 1) != 0)
    {
      v3 = *(_DWORD *)(a1 + 60);
      if (v3 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v3) & 1) != 0)
      {
        v4 = off_1E1C23678[v3];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 60));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v2, "setObject:forKey:", v4, CFSTR("type"));

    }
    if (*(_QWORD *)(a1 + 24))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (_QWORD *)(a1 + 16);
      if (*(_QWORD *)(a1 + 24))
      {
        v7 = 0;
        do
        {
          v8 = *(int *)(*v6 + 4 * v7);
          if (v8 >= 0x10)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
            v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v9 = off_1E1C235D0[v8];
          }
          objc_msgSend(v5, "addObject:", v9);

          ++v7;
          v6 = (_QWORD *)(a1 + 16);
        }
        while (v7 < *(_QWORD *)(a1 + 24));
      }
      objc_msgSend(v2, "setObject:forKey:", v5, CFSTR("content"));

    }
    objc_msgSend((id)a1, "metadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v2, "setObject:forKey:", v10, CFSTR("metadata"));

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (GEOPlaceCardModule)initWithDictionary:(id)a3
{
  return (GEOPlaceCardModule *)-[GEOAPPlaceCardModule _initWithDictionary:isJSON:](self, a3);
}

- (GEOPlaceCardModule)initWithJSON:(id)a3
{
  return (GEOPlaceCardModule *)-[GEOAPPlaceCardModule _initWithDictionary:isJSON:](self, a3);
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
      v8 = (int *)&readAll__recursiveTag_8837;
    else
      v8 = (int *)&readAll__nonRecursiveTag_8838;
    GEOPlaceCardModuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPlaceCardModuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPlaceCardModuleReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_BYTE *)&self->_flags & 0xE) == 0)
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
      goto LABEL_11;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceCardModule readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    PBDataWriterWriteInt32Field();
  v5 = v9;
  if (self->_contents.count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      v5 = v9;
      ++v6;
    }
    while (v6 < self->_contents.count);
  }
  if (self->_metadata)
  {
    PBDataWriterWriteStringField();
LABEL_11:
    v5 = v9;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id *v7;

  v7 = (id *)a3;
  -[GEOPlaceCardModule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v7 + 1, self->_reader);
  *((_DWORD *)v7 + 12) = self->_readerMarkPos;
  *((_DWORD *)v7 + 13) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v7 + 15) = self->_type;
    *((_BYTE *)v7 + 64) |= 1u;
  }
  if (-[GEOPlaceCardModule contentsCount](self, "contentsCount"))
  {
    objc_msgSend(v7, "clearContents");
    v4 = -[GEOPlaceCardModule contentsCount](self, "contentsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addContent:", -[GEOPlaceCardModule contentAtIndex:](self, "contentAtIndex:", i));
    }
  }
  if (self->_metadata)
    objc_msgSend(v7, "setMetadata:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 8) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPlaceCardModuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPlaceCardModule readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_type;
    *(_BYTE *)(v5 + 64) |= 1u;
  }
  PBRepeatedInt32Copy();
  v9 = -[NSString copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *metadata;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  -[GEOPlaceCardModule readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_type != *((_DWORD *)v4 + 15))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_10;
  }
  if (!PBRepeatedInt32IsEqual())
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  metadata = self->_metadata;
  if ((unint64_t)metadata | *((_QWORD *)v4 + 5))
    v6 = -[NSString isEqual:](metadata, "isEqual:");
  else
    v6 = 1;
LABEL_11:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  -[GEOPlaceCardModule readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = PBRepeatedInt32Hash() ^ v3;
  return v4 ^ -[NSString hash](self->_metadata, "hash");
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  int *v7;
  int *v8;

  v8 = (int *)a3;
  objc_msgSend(v8, "readAll:", 0);
  if ((v8[16] & 1) != 0)
  {
    self->_type = v8[15];
    *(_BYTE *)&self->_flags |= 1u;
  }
  v4 = objc_msgSend(v8, "contentsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[GEOPlaceCardModule addContent:](self, "addContent:", objc_msgSend(v8, "contentAtIndex:", i));
  }
  v7 = v8;
  if (*((_QWORD *)v8 + 5))
  {
    -[GEOPlaceCardModule setMetadata:](self, "setMetadata:");
    v7 = v8;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
