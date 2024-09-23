@implementation GEOPDAutocompleteParametersVenueSearch

- (GEOPDAutocompleteParametersVenueSearch)init
{
  GEOPDAutocompleteParametersVenueSearch *v2;
  GEOPDAutocompleteParametersVenueSearch *v3;
  GEOPDAutocompleteParametersVenueSearch *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteParametersVenueSearch;
  v2 = -[GEOPDAutocompleteParametersVenueSearch init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteParametersVenueSearch)initWithData:(id)a3
{
  GEOPDAutocompleteParametersVenueSearch *v3;
  GEOPDAutocompleteParametersVenueSearch *v4;
  GEOPDAutocompleteParametersVenueSearch *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteParametersVenueSearch;
  v3 = -[GEOPDAutocompleteParametersVenueSearch initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readQuery
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x100) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersVenueSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuery_tags_1174);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasQuery
{
  -[GEOPDAutocompleteParametersVenueSearch _readQuery]((uint64_t)self);
  return self->_query != 0;
}

- (NSString)query
{
  -[GEOPDAutocompleteParametersVenueSearch _readQuery]((uint64_t)self);
  return self->_query;
}

- (void)setQuery:(id)a3
{
  *(_WORD *)&self->_flags |= 0x500u;
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)_readViewportInfo
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x200) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersVenueSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readViewportInfo_tags_1175);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (BOOL)hasViewportInfo
{
  -[GEOPDAutocompleteParametersVenueSearch _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo != 0;
}

- (GEOPDViewportInfo)viewportInfo
{
  -[GEOPDAutocompleteParametersVenueSearch _readViewportInfo]((uint64_t)self);
  return self->_viewportInfo;
}

- (void)setViewportInfo:(id)a3
{
  *(_WORD *)&self->_flags |= 0x600u;
  objc_storeStrong((id *)&self->_viewportInfo, a3);
}

- (int)maxResults
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  if ((flags & 0x10) != 0)
    return self->_maxResults;
  else
    return 15;
}

- (void)setMaxResults:(int)a3
{
  *(_WORD *)&self->_flags |= 0x410u;
  self->_maxResults = a3;
}

- (void)setHasMaxResults:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1040;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFEF | v3;
}

- (BOOL)hasMaxResults
{
  return (*(_WORD *)&self->_flags >> 4) & 1;
}

- (BOOL)highlightDiff
{
  os_unfair_lock_s *p_readerLock;
  __int16 flags;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  flags = (__int16)self->_flags;
  os_unfair_lock_unlock(p_readerLock);
  return (flags & 0x20) != 0 && self->_highlightDiff;
}

- (void)setHighlightDiff:(BOOL)a3
{
  *(_WORD *)&self->_flags |= 0x420u;
  self->_highlightDiff = a3;
}

- (void)setHasHighlightDiff:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1056;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFDF | v3;
}

- (BOOL)hasHighlightDiff
{
  return (*(_WORD *)&self->_flags >> 5) & 1;
}

- (unint64_t)venueId
{
  return self->_venueId;
}

- (void)setVenueId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x408u;
  self->_venueId = a3;
}

- (void)setHasVenueId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1032;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFF7 | v3;
}

- (BOOL)hasVenueId
{
  return (*(_WORD *)&self->_flags >> 3) & 1;
}

- (unint64_t)levelId
{
  return self->_levelId;
}

- (void)setLevelId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x402u;
  self->_levelId = a3;
}

- (void)setHasLevelId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1026;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFD | v3;
}

- (BOOL)hasLevelId
{
  return (*(_WORD *)&self->_flags >> 1) & 1;
}

- (unint64_t)sectionId
{
  return self->_sectionId;
}

- (void)setSectionId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x404u;
  self->_sectionId = a3;
}

- (void)setHasSectionId:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1028;
  else
    v3 = 1024;
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFB | v3;
}

- (BOOL)hasSectionId
{
  return (*(_WORD *)&self->_flags >> 2) & 1;
}

- (unint64_t)buildingId
{
  return self->_buildingId;
}

- (void)setBuildingId:(unint64_t)a3
{
  *(_WORD *)&self->_flags |= 0x401u;
  self->_buildingId = a3;
}

- (void)setHasBuildingId:(BOOL)a3
{
  *(_WORD *)&self->_flags = *(_WORD *)&self->_flags & 0xFFFE | a3 | 0x400;
}

- (BOOL)hasBuildingId
{
  return *(_WORD *)&self->_flags & 1;
}

- (void)_readCategorys
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_WORD *)(a1 + 100) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteParametersVenueSearchReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategorys_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

- (NSMutableArray)categorys
{
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  return self->_categorys;
}

- (void)setCategorys:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *categorys;

  v4 = (NSMutableArray *)a3;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  categorys = self->_categorys;
  self->_categorys = v4;

}

- (void)clearCategorys
{
  os_unfair_lock_s *p_readerLock;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(p_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
  -[NSMutableArray removeAllObjects](self->_categorys, "removeAllObjects");
}

- (void)addCategory:(id)a3
{
  id v4;

  v4 = a3;
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  -[GEOPDAutocompleteParametersVenueSearch _addNoFlagsCategory:]((uint64_t)self, v4);

  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x80u;
  os_unfair_lock_unlock(&self->_readerLock);
  *(_WORD *)&self->_flags |= 0x400u;
}

- (void)_addNoFlagsCategory:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (unint64_t)categorysCount
{
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  return -[NSMutableArray count](self->_categorys, "count");
}

- (id)categoryAtIndex:(unint64_t)a3
{
  -[GEOPDAutocompleteParametersVenueSearch _readCategorys]((uint64_t)self);
  return (id)-[NSMutableArray objectAtIndex:](self->_categorys, "objectAtIndex:", a3);
}

+ (Class)categoryType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOPDAutocompleteParametersVenueSearch;
  -[GEOPDAutocompleteParametersVenueSearch description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteParametersVenueSearch dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteParametersVenueSearch _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __int16 v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[4];
  id v32;

  if (!a1)
    return 0;
  objc_msgSend((id)a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)a1, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("query"));

  objc_msgSend((id)a1, "viewportInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v6, "jsonRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewportInfo");
    }
    else
    {
      objc_msgSend(v6, "dictionaryRepresentation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("viewport_info");
    }
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 92));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v22 = CFSTR("maxResults");
    else
      v22 = CFSTR("max_results");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);

    v10 = *(_WORD *)(a1 + 100);
    if ((v10 & 0x20) == 0)
    {
LABEL_11:
      if ((v10 & 8) == 0)
        goto LABEL_12;
      goto LABEL_35;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v24 = CFSTR("highlightDiff");
  else
    v24 = CFSTR("highlight_diff");
  objc_msgSend(v4, "setObject:forKey:", v23, v24);

  v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 8) == 0)
  {
LABEL_12:
    if ((v10 & 2) == 0)
      goto LABEL_13;
    goto LABEL_39;
  }
LABEL_35:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 64));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v26 = CFSTR("venueId");
  else
    v26 = CFSTR("venue_id");
  objc_msgSend(v4, "setObject:forKey:", v25, v26);

  v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 2) == 0)
  {
LABEL_13:
    if ((v10 & 4) == 0)
      goto LABEL_14;
LABEL_43:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v30 = CFSTR("sectionId");
    else
      v30 = CFSTR("section_id");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);

    if ((*(_WORD *)(a1 + 100) & 1) == 0)
      goto LABEL_19;
    goto LABEL_15;
  }
LABEL_39:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v28 = CFSTR("levelId");
  else
    v28 = CFSTR("level_id");
  objc_msgSend(v4, "setObject:forKey:", v27, v28);

  v10 = *(_WORD *)(a1 + 100);
  if ((v10 & 4) != 0)
    goto LABEL_43;
LABEL_14:
  if ((v10 & 1) != 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 24));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v12 = CFSTR("buildingId");
    else
      v12 = CFSTR("building_id");
    objc_msgSend(v4, "setObject:forKey:", v11, v12);

  }
LABEL_19:
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend((id)a1, "categorys");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("category"));

  }
  v14 = *(void **)(a1 + 16);
  if (v14)
  {
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v15, "count"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __68__GEOPDAutocompleteParametersVenueSearch__dictionaryRepresentation___block_invoke;
      v31[3] = &unk_1E1C00600;
      v18 = v17;
      v32 = v18;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v31);
      v19 = v18;

      v16 = v19;
    }
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteParametersVenueSearch _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __68__GEOPDAutocompleteParametersVenueSearch__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (GEOPDAutocompleteParametersVenueSearch)initWithDictionary:(id)a3
{
  return (GEOPDAutocompleteParametersVenueSearch *)-[GEOPDAutocompleteParametersVenueSearch _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  GEOPDViewportInfo *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    a1 = (void *)objc_msgSend(a1, "init");
    if (a1)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("query"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = (void *)objc_msgSend(v6, "copy");
        objc_msgSend(a1, "setQuery:", v7);

      }
      if (a3)
        v8 = CFSTR("viewportInfo");
      else
        v8 = CFSTR("viewport_info");
      objc_msgSend(v5, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = [GEOPDViewportInfo alloc];
        if ((a3 & 1) != 0)
          v11 = -[GEOPDViewportInfo initWithJSON:](v10, "initWithJSON:", v9);
        else
          v11 = -[GEOPDViewportInfo initWithDictionary:](v10, "initWithDictionary:", v9);
        v12 = (void *)v11;
        objc_msgSend(a1, "setViewportInfo:", v11);

      }
      if (a3)
        v13 = CFSTR("maxResults");
      else
        v13 = CFSTR("max_results");
      objc_msgSend(v5, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setMaxResults:", objc_msgSend(v14, "intValue"));

      if (a3)
        v15 = CFSTR("highlightDiff");
      else
        v15 = CFSTR("highlight_diff");
      objc_msgSend(v5, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setHighlightDiff:", objc_msgSend(v16, "BOOLValue"));

      if (a3)
        v17 = CFSTR("venueId");
      else
        v17 = CFSTR("venue_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setVenueId:", objc_msgSend(v18, "unsignedLongLongValue"));

      if (a3)
        v19 = CFSTR("levelId");
      else
        v19 = CFSTR("level_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setLevelId:", objc_msgSend(v20, "unsignedLongLongValue"));

      if (a3)
        v21 = CFSTR("sectionId");
      else
        v21 = CFSTR("section_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setSectionId:", objc_msgSend(v22, "unsignedLongLongValue"));

      if (a3)
        v23 = CFSTR("buildingId");
      else
        v23 = CFSTR("building_id");
      objc_msgSend(v5, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "setBuildingId:", objc_msgSend(v24, "unsignedLongLongValue"));

      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("category"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v26 = v25;
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v35 != v29)
                objc_enumerationMutation(v26);
              v31 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = (void *)objc_msgSend(v31, "copy", (_QWORD)v34);
                objc_msgSend(a1, "addCategory:", v32);

              }
            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v28);
        }

      }
    }
  }

  return a1;
}

- (GEOPDAutocompleteParametersVenueSearch)initWithJSON:(id)a3
{
  return (GEOPDAutocompleteParametersVenueSearch *)-[GEOPDAutocompleteParametersVenueSearch _initWithDictionary:isJSON:](self, a3, 1);
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
      v8 = (int *)&readAll__recursiveTag_1194;
    else
      v8 = (int *)&readAll__nonRecursiveTag_1195;
    GEOPDAutocompleteParametersVenueSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, v8);
    objc_sync_exit(v7);

  }
  if (v3)
    -[GEOPDViewportInfo readAll:](self->_viewportInfo, "readAll:", 1);
  os_unfair_lock_unlock(p_readerLock);
}

+ (BOOL)isValid:(id)a3
{
  return GEOPDAutocompleteParametersVenueSearchIsValid((char *)a3);
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDAutocompleteParametersVenueSearchReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  __int16 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  PBDataReader *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_WORD *)&self->_flags & 0x780) == 0)
    {
      v11 = self->_reader;
      objc_sync_enter(v11);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v12);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v11);
      goto LABEL_29;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParametersVenueSearch readAll:](self, "readAll:", 0);
  if (self->_query)
    PBDataWriterWriteStringField();
  if (self->_viewportInfo)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_9:
      if ((flags & 8) == 0)
        goto LABEL_10;
      goto LABEL_24;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteBOOLField();
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_10:
    if ((flags & 2) == 0)
      goto LABEL_11;
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_11:
    if ((flags & 4) == 0)
      goto LABEL_12;
LABEL_26:
    PBDataWriterWriteUint64Field();
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_25:
  PBDataWriterWriteUint64Field();
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_26;
LABEL_12:
  if ((flags & 1) != 0)
LABEL_13:
    PBDataWriterWriteUint64Field();
LABEL_14:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_categorys;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v13);
LABEL_29:

}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[GEOPDAutocompleteParametersVenueSearch _readViewportInfo]((uint64_t)self);
  return -[GEOPDViewportInfo hasGreenTeaWithValue:](self->_viewportInfo, "hasGreenTeaWithValue:", v3);
}

- (void)copyTo:(id)a3
{
  __int16 flags;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  id *v9;

  v9 = (id *)a3;
  -[GEOPDAutocompleteParametersVenueSearch readAll:](self, "readAll:", 0);
  os_unfair_lock_lock_with_options();
  objc_storeStrong(v9 + 1, self->_reader);
  *((_DWORD *)v9 + 20) = self->_readerMarkPos;
  *((_DWORD *)v9 + 21) = self->_readerMarkLength;
  os_unfair_lock_unlock(&self->_readerLock);
  if (self->_query)
    objc_msgSend(v9, "setQuery:");
  if (self->_viewportInfo)
    objc_msgSend(v9, "setViewportInfo:");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *((_DWORD *)v9 + 23) = self->_maxResults;
    *((_WORD *)v9 + 50) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_19;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *((_BYTE *)v9 + 96) = self->_highlightDiff;
  *((_WORD *)v9 + 50) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_20;
  }
LABEL_19:
  v9[8] = (id)self->_venueId;
  *((_WORD *)v9 + 50) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 4) == 0)
      goto LABEL_10;
LABEL_21:
    v9[7] = (id)self->_sectionId;
    *((_WORD *)v9 + 50) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_20:
  v9[5] = (id)self->_levelId;
  *((_WORD *)v9 + 50) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_21;
LABEL_10:
  if ((flags & 1) != 0)
  {
LABEL_11:
    v9[3] = (id)self->_buildingId;
    *((_WORD *)v9 + 50) |= 1u;
  }
LABEL_12:
  if (-[GEOPDAutocompleteParametersVenueSearch categorysCount](self, "categorysCount"))
  {
    objc_msgSend(v9, "clearCategorys");
    v5 = -[GEOPDAutocompleteParametersVenueSearch categorysCount](self, "categorysCount");
    if (v5)
    {
      v6 = v5;
      for (i = 0; i != v6; ++i)
      {
        -[GEOPDAutocompleteParametersVenueSearch categoryAtIndex:](self, "categoryAtIndex:", i);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addCategory:", v8);

      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int16 flags;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  PBUnknownFields *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompleteParametersVenueSearchReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_20;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompleteParametersVenueSearch readAll:](self, "readAll:", 0);
  v9 = -[NSString copyWithZone:](self->_query, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[GEOPDViewportInfo copyWithZone:](self->_viewportInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_maxResults;
    *(_WORD *)(v5 + 100) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_7:
      if ((flags & 8) == 0)
        goto LABEL_8;
      goto LABEL_23;
    }
  }
  else if ((flags & 0x20) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 96) = self->_highlightDiff;
  *(_WORD *)(v5 + 100) |= 0x20u;
  flags = (__int16)self->_flags;
  if ((flags & 8) == 0)
  {
LABEL_8:
    if ((flags & 2) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  *(_QWORD *)(v5 + 64) = self->_venueId;
  *(_WORD *)(v5 + 100) |= 8u;
  flags = (__int16)self->_flags;
  if ((flags & 2) == 0)
  {
LABEL_9:
    if ((flags & 4) == 0)
      goto LABEL_10;
LABEL_25:
    *(_QWORD *)(v5 + 56) = self->_sectionId;
    *(_WORD *)(v5 + 100) |= 4u;
    if ((*(_WORD *)&self->_flags & 1) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_24:
  *(_QWORD *)(v5 + 40) = self->_levelId;
  *(_WORD *)(v5 + 100) |= 2u;
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
    goto LABEL_25;
LABEL_10:
  if ((flags & 1) != 0)
  {
LABEL_11:
    *(_QWORD *)(v5 + 24) = self->_buildingId;
    *(_WORD *)(v5 + 100) |= 1u;
  }
LABEL_12:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = self->_categorys;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        v18 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v21);
        objc_msgSend((id)v5, "addCategory:", v18);

      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v15);
  }

  v19 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v19;
LABEL_20:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *query;
  GEOPDViewportInfo *viewportInfo;
  __int16 flags;
  __int16 v8;
  NSMutableArray *categorys;
  char v10;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_41;
  -[GEOPDAutocompleteParametersVenueSearch readAll:](self, "readAll:", 1);
  objc_msgSend(v4, "readAll:", 1);
  query = self->_query;
  if ((unint64_t)query | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](query, "isEqual:"))
      goto LABEL_41;
  }
  viewportInfo = self->_viewportInfo;
  if ((unint64_t)viewportInfo | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDViewportInfo isEqual:](viewportInfo, "isEqual:"))
      goto LABEL_41;
  }
  flags = (__int16)self->_flags;
  v8 = *((_WORD *)v4 + 50);
  if ((flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0 || self->_maxResults != *((_DWORD *)v4 + 23))
      goto LABEL_41;
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_highlightDiff)
      {
        if (!*((_BYTE *)v4 + 96))
          goto LABEL_41;
        goto LABEL_19;
      }
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_19;
    }
LABEL_41:
    v10 = 0;
    goto LABEL_42;
  }
  if ((v8 & 0x20) != 0)
    goto LABEL_41;
LABEL_19:
  if ((flags & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_venueId != *((_QWORD *)v4 + 8))
      goto LABEL_41;
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_levelId != *((_QWORD *)v4 + 5))
      goto LABEL_41;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_sectionId != *((_QWORD *)v4 + 7))
      goto LABEL_41;
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_41;
  }
  if ((flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_buildingId != *((_QWORD *)v4 + 3))
      goto LABEL_41;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_41;
  }
  categorys = self->_categorys;
  if ((unint64_t)categorys | *((_QWORD *)v4 + 4))
    v10 = -[NSMutableArray isEqual:](categorys, "isEqual:");
  else
    v10 = 1;
LABEL_42:

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  __int16 flags;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  -[GEOPDAutocompleteParametersVenueSearch readAll:](self, "readAll:", 1);
  v3 = -[NSString hash](self->_query, "hash");
  v4 = -[GEOPDViewportInfo hash](self->_viewportInfo, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x10) != 0)
  {
    v6 = 2654435761 * self->_maxResults;
    if ((flags & 0x20) != 0)
    {
LABEL_3:
      v7 = 2654435761 * self->_highlightDiff;
      if ((flags & 8) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else
  {
    v6 = 0;
    if ((flags & 0x20) != 0)
      goto LABEL_3;
  }
  v7 = 0;
  if ((flags & 8) != 0)
  {
LABEL_4:
    v8 = 2654435761u * self->_venueId;
    if ((flags & 2) != 0)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v8 = 0;
  if ((flags & 2) != 0)
  {
LABEL_5:
    v9 = 2654435761u * self->_levelId;
    if ((flags & 4) != 0)
      goto LABEL_6;
LABEL_12:
    v10 = 0;
    if ((flags & 1) != 0)
      goto LABEL_7;
LABEL_13:
    v11 = 0;
    return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_categorys, "hash");
  }
LABEL_11:
  v9 = 0;
  if ((flags & 4) == 0)
    goto LABEL_12;
LABEL_6:
  v10 = 2654435761u * self->_sectionId;
  if ((flags & 1) == 0)
    goto LABEL_13;
LABEL_7:
  v11 = 2654435761u * self->_buildingId;
  return v4 ^ v3 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[NSMutableArray hash](self->_categorys, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  GEOPDViewportInfo *viewportInfo;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "readAll:", 0);
  if (*((_QWORD *)v4 + 6))
    -[GEOPDAutocompleteParametersVenueSearch setQuery:](self, "setQuery:");
  viewportInfo = self->_viewportInfo;
  v6 = *((_QWORD *)v4 + 9);
  if (viewportInfo)
  {
    if (v6)
      -[GEOPDViewportInfo mergeFrom:](viewportInfo, "mergeFrom:");
  }
  else if (v6)
  {
    -[GEOPDAutocompleteParametersVenueSearch setViewportInfo:](self, "setViewportInfo:");
  }
  v7 = *((_WORD *)v4 + 50);
  if ((v7 & 0x10) != 0)
  {
    self->_maxResults = *((_DWORD *)v4 + 23);
    *(_WORD *)&self->_flags |= 0x10u;
    v7 = *((_WORD *)v4 + 50);
    if ((v7 & 0x20) == 0)
    {
LABEL_10:
      if ((v7 & 8) == 0)
        goto LABEL_11;
      goto LABEL_25;
    }
  }
  else if ((v7 & 0x20) == 0)
  {
    goto LABEL_10;
  }
  self->_highlightDiff = *((_BYTE *)v4 + 96);
  *(_WORD *)&self->_flags |= 0x20u;
  v7 = *((_WORD *)v4 + 50);
  if ((v7 & 8) == 0)
  {
LABEL_11:
    if ((v7 & 2) == 0)
      goto LABEL_12;
    goto LABEL_26;
  }
LABEL_25:
  self->_venueId = *((_QWORD *)v4 + 8);
  *(_WORD *)&self->_flags |= 8u;
  v7 = *((_WORD *)v4 + 50);
  if ((v7 & 2) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0)
      goto LABEL_13;
    goto LABEL_27;
  }
LABEL_26:
  self->_levelId = *((_QWORD *)v4 + 5);
  *(_WORD *)&self->_flags |= 2u;
  v7 = *((_WORD *)v4 + 50);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 1) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_27:
  self->_sectionId = *((_QWORD *)v4 + 7);
  *(_WORD *)&self->_flags |= 4u;
  if ((*((_WORD *)v4 + 50) & 1) != 0)
  {
LABEL_14:
    self->_buildingId = *((_QWORD *)v4 + 3);
    *(_WORD *)&self->_flags |= 1u;
  }
LABEL_15:
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *((id *)v4 + 4);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        -[GEOPDAutocompleteParametersVenueSearch addCategory:](self, "addCategory:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (PBUnknownFields)unknownFields
{
  os_unfair_lock_s *p_readerLock;
  PBDataReader *reader;
  PBDataReader *v5;

  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if ((*(_WORD *)&self->_flags & 0x40) == 0)
  {
    reader = self->_reader;
    if (reader)
    {
      v5 = reader;
      objc_sync_enter(v5);
      GEOPDAutocompleteParametersVenueSearchReadSpecified((uint64_t)self, (unint64_t)self->_reader, (int *)&unknownFields_tags_1198);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock(p_readerLock);
  return self->_unknownFields;
}

- (void)clearUnknownFields:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_readerLock;
  PBUnknownFields *unknownFields;

  v3 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock_with_options();
  *(_WORD *)&self->_flags |= 0x440u;
  os_unfair_lock_unlock(p_readerLock);
  unknownFields = self->_unknownFields;
  self->_unknownFields = 0;

  if (v3)
  {
    -[GEOPDAutocompleteParametersVenueSearch readAll:](self, "readAll:", 0);
    -[GEOPDViewportInfo clearUnknownFields:](self->_viewportInfo, "clearUnknownFields:", 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewportInfo, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_categorys, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
