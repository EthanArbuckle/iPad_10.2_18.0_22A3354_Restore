@implementation GEORevealedPlaceCardModule

+ (id)moduleWithType:(int)a3
{
  GEORevealedPlaceCardModule *v4;

  v4 = objc_alloc_init(GEORevealedPlaceCardModule);
  -[GEORevealedPlaceCardModule setType:](v4, "setType:", GEOPDPlaceDataLayoutConfigurationFromGEOModuleType(a3));
  return v4;
}

- (GEORevealedPlaceCardModule)init
{
  GEORevealedPlaceCardModule *v2;
  GEORevealedPlaceCardModule *v3;
  GEORevealedPlaceCardModule *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEORevealedPlaceCardModule;
  v2 = -[GEORevealedPlaceCardModule init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEORevealedPlaceCardModule)initWithData:(id)a3
{
  GEORevealedPlaceCardModule *v3;
  GEORevealedPlaceCardModule *v4;
  GEORevealedPlaceCardModule *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEORevealedPlaceCardModule;
  v3 = -[GEORevealedPlaceCardModule initWithData:](&v7, sel_initWithData_, a3);
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
  *(_BYTE *)&self->_flags |= 0x81u;
  self->_type = a3;
}

- (void)setHasType:(BOOL)a3
{
  *(_BYTE *)&self->_flags = *(_BYTE *)&self->_flags & 0x7E | a3 | 0x80;
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

- (void)_readTitle
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
        GEORevealedPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTitle_tags_7);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasTitle
{
  -[GEORevealedPlaceCardModule _readTitle]((uint64_t)self);
  return self->_title != 0;
}

- (GEORevealedPlaceCardModuleTypeTitle)title
{
  -[GEORevealedPlaceCardModule _readTitle]((uint64_t)self);
  return self->_title;
}

- (void)setTitle:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xA0u;
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)_readUnifiedActionRow
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
        GEORevealedPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readUnifiedActionRow_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasUnifiedActionRow
{
  -[GEORevealedPlaceCardModule _readUnifiedActionRow]((uint64_t)self);
  return self->_unifiedActionRow != 0;
}

- (GEORevealedPlaceCardModuleTypeUnifiedActionRow)unifiedActionRow
{
  -[GEORevealedPlaceCardModule _readUnifiedActionRow]((uint64_t)self);
  return self->_unifiedActionRow;
}

- (void)setUnifiedActionRow:(id)a3
{
  *(_BYTE *)&self->_flags |= 0xC0u;
  objc_storeStrong((id *)&self->_unifiedActionRow, a3);
}

- (void)_readPhotos
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
        GEORevealedPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhotos_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasPhotos
{
  -[GEORevealedPlaceCardModule _readPhotos]((uint64_t)self);
  return self->_photos != 0;
}

- (GEORevealedPlaceCardModuleTypePhotos)photos
{
  -[GEORevealedPlaceCardModule _readPhotos]((uint64_t)self);
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x88u;
  objc_storeStrong((id *)&self->_photos, a3);
}

- (void)_readShowcase
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
        GEORevealedPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readShowcase_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasShowcase
{
  -[GEORevealedPlaceCardModule _readShowcase]((uint64_t)self);
  return self->_showcase != 0;
}

- (GEORevealedPlaceCardModuleTypeShowcase)showcase
{
  -[GEORevealedPlaceCardModule _readShowcase]((uint64_t)self);
  return self->_showcase;
}

- (void)setShowcase:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x90u;
  objc_storeStrong((id *)&self->_showcase, a3);
}

- (void)_readHours
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
        GEORevealedPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readHours_tags_2);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasHours
{
  -[GEORevealedPlaceCardModule _readHours]((uint64_t)self);
  return self->_hours != 0;
}

- (GEORevealedPlaceCardModuleTypeHours)hours
{
  -[GEORevealedPlaceCardModule _readHours]((uint64_t)self);
  return self->_hours;
}

- (void)setHours:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x82u;
  objc_storeStrong((id *)&self->_hours, a3);
}

- (void)_readInfos
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
        GEORevealedPlaceCardModuleReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInfos_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)hasInfos
{
  -[GEORevealedPlaceCardModule _readInfos]((uint64_t)self);
  return self->_infos != 0;
}

- (GEORevealedPlaceCardModuleTypeInfos)infos
{
  -[GEORevealedPlaceCardModule _readInfos]((uint64_t)self);
  return self->_infos;
}

- (void)setInfos:(id)a3
{
  *(_BYTE *)&self->_flags |= 0x84u;
  objc_storeStrong((id *)&self->_infos, a3);
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
  v8.super_class = (Class)GEORevealedPlaceCardModule;
  -[GEORevealedPlaceCardModule description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEORevealedPlaceCardModule dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEORevealedPlaceCardModule _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  unsigned int v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  if (a1)
  {
    objc_msgSend((id)a1, "readAll:", 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 80) & 1) != 0)
    {
      v5 = *(_DWORD *)(a1 + 76);
      if (v5 < 0x2F && ((0x7FFFFFFFDFFFuLL >> v5) & 1) != 0)
      {
        v6 = off_1E1C23678[v5];
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 76));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

    }
    objc_msgSend((id)a1, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v7, "jsonRepresentation");
      else
        objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("title"));

    }
    objc_msgSend((id)a1, "unifiedActionRow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("unifiedActionRow");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("unified_action_row");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    objc_msgSend((id)a1, "photos");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v14, "jsonRepresentation");
      else
        objc_msgSend(v14, "dictionaryRepresentation");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("photos"));

    }
    objc_msgSend((id)a1, "showcase");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v17, "jsonRepresentation");
      else
        objc_msgSend(v17, "dictionaryRepresentation");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("showcase"));

    }
    objc_msgSend((id)a1, "hours");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v20)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v20, "jsonRepresentation");
      else
        objc_msgSend(v20, "dictionaryRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("hours"));

    }
    objc_msgSend((id)a1, "infos");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v23)
    {
      if ((a2 & 1) != 0)
        objc_msgSend(v23, "jsonRepresentation");
      else
        objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("infos"));

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
  return -[GEORevealedPlaceCardModule _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (GEORevealedPlaceCardModule)initWithDictionary:(id)a3
{
  return (GEORevealedPlaceCardModule *)-[GEORevealedPlaceCardModule _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  GEORevealedPlaceCardModuleTypeTitle *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  GEORevealedPlaceCardModuleTypeUnifiedActionRow *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  GEORevealedPlaceCardModuleTypePhotos *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  GEORevealedPlaceCardModuleTypeShowcase *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  GEORevealedPlaceCardModuleTypeHours *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  GEORevealedPlaceCardModuleTypeInfos *v31;
  uint64_t v32;
  void *v33;

  v5 = a2;
  if (!a1)
    goto LABEL_135;
  a1 = (void *)objc_msgSend(a1, "init");
  if (!a1)
    goto LABEL_135;
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

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEORevealedPlaceCardModuleTypeTitle alloc];
    if ((a3 & 1) != 0)
      v11 = -[GEORevealedPlaceCardModuleTypeTitle initWithJSON:](v10, "initWithJSON:", v9);
    else
      v11 = -[GEORevealedPlaceCardModuleTypeTitle initWithDictionary:](v10, "initWithDictionary:", v9);
    v12 = (void *)v11;
    objc_msgSend(a1, "setTitle:", v11);

  }
  if (a3)
    v13 = CFSTR("unifiedActionRow");
  else
    v13 = CFSTR("unified_action_row");
  objc_msgSend(v5, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = [GEORevealedPlaceCardModuleTypeUnifiedActionRow alloc];
    if ((a3 & 1) != 0)
      v16 = -[GEORevealedPlaceCardModuleTypeUnifiedActionRow initWithJSON:](v15, "initWithJSON:", v14);
    else
      v16 = -[GEORevealedPlaceCardModuleTypeUnifiedActionRow initWithDictionary:](v15, "initWithDictionary:", v14);
    v17 = (void *)v16;
    objc_msgSend(a1, "setUnifiedActionRow:", v16);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("photos"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = [GEORevealedPlaceCardModuleTypePhotos alloc];
    if ((a3 & 1) != 0)
      v20 = -[GEORevealedPlaceCardModuleTypePhotos initWithJSON:](v19, "initWithJSON:", v18);
    else
      v20 = -[GEORevealedPlaceCardModuleTypePhotos initWithDictionary:](v19, "initWithDictionary:", v18);
    v21 = (void *)v20;
    objc_msgSend(a1, "setPhotos:", v20);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("showcase"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = [GEORevealedPlaceCardModuleTypeShowcase alloc];
    if ((a3 & 1) != 0)
      v24 = -[GEORevealedPlaceCardModuleTypeShowcase initWithJSON:](v23, "initWithJSON:", v22);
    else
      v24 = -[GEORevealedPlaceCardModuleTypeShowcase initWithDictionary:](v23, "initWithDictionary:", v22);
    v25 = (void *)v24;
    objc_msgSend(a1, "setShowcase:", v24);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hours"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEORevealedPlaceCardModuleTypeHours alloc];
    if ((a3 & 1) != 0)
      v28 = -[GEORevealedPlaceCardModuleTypeHours initWithJSON:](v27, "initWithJSON:", v26);
    else
      v28 = -[GEORevealedPlaceCardModuleTypeHours initWithDictionary:](v27, "initWithDictionary:", v26);
    v29 = (void *)v28;
    objc_msgSend(a1, "setHours:", v28);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("infos"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v31 = [GEORevealedPlaceCardModuleTypeInfos alloc];
    if ((a3 & 1) != 0)
      v32 = -[GEORevealedPlaceCardModuleTypeInfos initWithJSON:](v31, "initWithJSON:", v30);
    else
      v32 = -[GEORevealedPlaceCardModuleTypeInfos initWithDictionary:](v31, "initWithDictionary:", v30);
    v33 = (void *)v32;
    objc_msgSend(a1, "setInfos:", v32);

  }
LABEL_135:

  return a1;
}

- (GEORevealedPlaceCardModule)initWithJSON:(id)a3
{
  return (GEORevealedPlaceCardModule *)-[GEORevealedPlaceCardModule _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_8970;
    else
      v8 = (int *)&readAll__nonRecursiveTag_8971;
    GEORevealedPlaceCardModuleReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    _GEORevealedPlaceCardModuleCallReadAllRecursiveWithoutSynchronized((id *)&self->super.super.isa);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEORevealedPlaceCardModuleIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEORevealedPlaceCardModuleReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (_GEORevealedPlaceCardModuleIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEORevealedPlaceCardModule readAll:](self, "readAll:", 0);
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_title)
      PBDataWriterWriteSubmessage();
    if (self->_unifiedActionRow)
      PBDataWriterWriteSubmessage();
    if (self->_photos)
      PBDataWriterWriteSubmessage();
    if (self->_showcase)
      PBDataWriterWriteSubmessage();
    if (self->_hours)
      PBDataWriterWriteSubmessage();
    if (self->_infos)
      PBDataWriterWriteSubmessage();
  }

}

- (void)copyTo:(id)a3
{
  id *v4;
  id *v5;

  v5 = (id *)a3;
  -[GEORevealedPlaceCardModule readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v5 + 1, self->_reader);
  *((_DWORD *)v5 + 16) = self->_readerMarkPos;
  *((_DWORD *)v5 + 17) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  v4 = v5;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *((_DWORD *)v5 + 19) = self->_type;
    *((_BYTE *)v5 + 80) |= 1u;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    v4 = v5;
  }
  if (self->_unifiedActionRow)
  {
    objc_msgSend(v5, "setUnifiedActionRow:");
    v4 = v5;
  }
  if (self->_photos)
  {
    objc_msgSend(v5, "setPhotos:");
    v4 = v5;
  }
  if (self->_showcase)
  {
    objc_msgSend(v5, "setShowcase:");
    v4 = v5;
  }
  if (self->_hours)
  {
    objc_msgSend(v5, "setHours:");
    v4 = v5;
  }
  if (self->_infos)
  {
    objc_msgSend(v5, "setInfos:");
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
      GEORevealedPlaceCardModuleReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEORevealedPlaceCardModule readAll:](self, "readAll:", 0);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 76) = self->_type;
    *(_BYTE *)(v5 + 80) |= 1u;
  }
  v9 = -[GEORevealedPlaceCardModuleTypeTitle copyWithZone:](self->_title, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEORevealedPlaceCardModuleTypeUnifiedActionRow copyWithZone:](self->_unifiedActionRow, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v11;

  v13 = -[GEORevealedPlaceCardModuleTypePhotos copyWithZone:](self->_photos, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEORevealedPlaceCardModuleTypeShowcase copyWithZone:](self->_showcase, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v15;

  v17 = -[GEORevealedPlaceCardModuleTypeHours copyWithZone:](self->_hours, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v17;

  v19 = -[GEORevealedPlaceCardModuleTypeInfos copyWithZone:](self->_infos, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v19;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEORevealedPlaceCardModuleTypeTitle *title;
  GEORevealedPlaceCardModuleTypeUnifiedActionRow *unifiedActionRow;
  GEORevealedPlaceCardModuleTypePhotos *photos;
  GEORevealedPlaceCardModuleTypeShowcase *showcase;
  GEORevealedPlaceCardModuleTypeHours *hours;
  GEORevealedPlaceCardModuleTypeInfos *infos;
  char v11;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEORevealedPlaceCardModule readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 80) & 1) == 0 || self->_type != *((_DWORD *)v4 + 19))
      goto LABEL_19;
  }
  else if ((*((_BYTE *)v4 + 80) & 1) != 0)
  {
LABEL_19:
    v11 = 0;
    goto LABEL_20;
  }
  title = self->_title;
  if ((unint64_t)title | *((_QWORD *)v4 + 6)
    && !-[GEORevealedPlaceCardModuleTypeTitle isEqual:](title, "isEqual:"))
  {
    goto LABEL_19;
  }
  unifiedActionRow = self->_unifiedActionRow;
  if ((unint64_t)unifiedActionRow | *((_QWORD *)v4 + 7))
  {
    if (!-[GEORevealedPlaceCardModuleTypeUnifiedActionRow isEqual:](unifiedActionRow, "isEqual:"))
      goto LABEL_19;
  }
  photos = self->_photos;
  if ((unint64_t)photos | *((_QWORD *)v4 + 4))
  {
    if (!-[GEORevealedPlaceCardModuleTypePhotos isEqual:](photos, "isEqual:"))
      goto LABEL_19;
  }
  showcase = self->_showcase;
  if ((unint64_t)showcase | *((_QWORD *)v4 + 5))
  {
    if (!-[GEORevealedPlaceCardModuleTypeShowcase isEqual:](showcase, "isEqual:"))
      goto LABEL_19;
  }
  hours = self->_hours;
  if ((unint64_t)hours | *((_QWORD *)v4 + 2))
  {
    if (!-[GEORevealedPlaceCardModuleTypeHours isEqual:](hours, "isEqual:"))
      goto LABEL_19;
  }
  infos = self->_infos;
  if ((unint64_t)infos | *((_QWORD *)v4 + 3))
    v11 = -[GEORevealedPlaceCardModuleTypeInfos isEqual:](infos, "isEqual:");
  else
    v11 = 1;
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEORevealedPlaceCardModule readAll:](self, "readAll:", 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[GEORevealedPlaceCardModuleTypeTitle hash](self->_title, "hash") ^ v3;
  v5 = -[GEORevealedPlaceCardModuleTypeUnifiedActionRow hash](self->_unifiedActionRow, "hash");
  v6 = v4 ^ v5 ^ -[GEORevealedPlaceCardModuleTypePhotos hash](self->_photos, "hash");
  v7 = -[GEORevealedPlaceCardModuleTypeShowcase hash](self->_showcase, "hash");
  v8 = v7 ^ -[GEORevealedPlaceCardModuleTypeHours hash](self->_hours, "hash");
  return v6 ^ v8 ^ -[GEORevealedPlaceCardModuleTypeInfos hash](self->_infos, "hash");
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  GEORevealedPlaceCardModuleTypeTitle *title;
  uint64_t v6;
  GEORevealedPlaceCardModuleTypeUnifiedActionRow *unifiedActionRow;
  uint64_t v8;
  GEORevealedPlaceCardModuleTypePhotos *photos;
  uint64_t v10;
  GEORevealedPlaceCardModuleTypeShowcase *showcase;
  uint64_t v12;
  GEORevealedPlaceCardModuleTypeHours *hours;
  uint64_t v14;
  GEORevealedPlaceCardModuleTypeInfos *infos;
  uint64_t v16;
  int *v17;

  v17 = (int *)a3;
  objc_msgSend(v17, "readAll:", 0);
  v4 = v17;
  if ((v17[20] & 1) != 0)
  {
    self->_type = v17[19];
    *(_BYTE *)&self->_flags |= 1u;
  }
  title = self->_title;
  v6 = *((_QWORD *)v17 + 6);
  if (title)
  {
    if (!v6)
      goto LABEL_9;
    -[GEORevealedPlaceCardModuleTypeTitle mergeFrom:](title, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    -[GEORevealedPlaceCardModule setTitle:](self, "setTitle:");
  }
  v4 = v17;
LABEL_9:
  unifiedActionRow = self->_unifiedActionRow;
  v8 = *((_QWORD *)v4 + 7);
  if (unifiedActionRow)
  {
    if (!v8)
      goto LABEL_15;
    -[GEORevealedPlaceCardModuleTypeUnifiedActionRow mergeFrom:](unifiedActionRow, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_15;
    -[GEORevealedPlaceCardModule setUnifiedActionRow:](self, "setUnifiedActionRow:");
  }
  v4 = v17;
LABEL_15:
  photos = self->_photos;
  v10 = *((_QWORD *)v4 + 4);
  if (photos)
  {
    if (!v10)
      goto LABEL_21;
    -[GEORevealedPlaceCardModuleTypePhotos mergeFrom:](photos, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_21;
    -[GEORevealedPlaceCardModule setPhotos:](self, "setPhotos:");
  }
  v4 = v17;
LABEL_21:
  showcase = self->_showcase;
  v12 = *((_QWORD *)v4 + 5);
  if (showcase)
  {
    if (!v12)
      goto LABEL_27;
    -[GEORevealedPlaceCardModuleTypeShowcase mergeFrom:](showcase, "mergeFrom:");
  }
  else
  {
    if (!v12)
      goto LABEL_27;
    -[GEORevealedPlaceCardModule setShowcase:](self, "setShowcase:");
  }
  v4 = v17;
LABEL_27:
  hours = self->_hours;
  v14 = *((_QWORD *)v4 + 2);
  if (hours)
  {
    if (!v14)
      goto LABEL_33;
    -[GEORevealedPlaceCardModuleTypeHours mergeFrom:](hours, "mergeFrom:");
  }
  else
  {
    if (!v14)
      goto LABEL_33;
    -[GEORevealedPlaceCardModule setHours:](self, "setHours:");
  }
  v4 = v17;
LABEL_33:
  infos = self->_infos;
  v16 = *((_QWORD *)v4 + 3);
  if (infos)
  {
    if (v16)
    {
      -[GEORevealedPlaceCardModuleTypeInfos mergeFrom:](infos, "mergeFrom:");
LABEL_38:
      v4 = v17;
    }
  }
  else if (v16)
  {
    -[GEORevealedPlaceCardModule setInfos:](self, "setInfos:");
    goto LABEL_38;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedActionRow, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_showcase, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_infos, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
