@implementation GEOPDSearchPlaceContextMetadata

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 8u;
    *(_WORD *)(a1 + 108) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDSearchPlaceContextMetadata readAll:](a1, 0);
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v5 = *(id *)(a1 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9++), "clearUnknownFields:", 1, (_QWORD)v14);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
      {
        v11 = *(void **)(v10 + 8);
        *(_QWORD *)(v10 + 8) = 0;

      }
      v12 = *(_QWORD *)(a1 + 64);
      if (v12)
      {
        v13 = *(void **)(v12 + 8);
        *(_QWORD *)(v12 + 8) = 0;

      }
    }
  }
}

- (GEOPDSearchPlaceContextMetadata)init
{
  GEOPDSearchPlaceContextMetadata *v2;
  GEOPDSearchPlaceContextMetadata *v3;
  GEOPDSearchPlaceContextMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchPlaceContextMetadata;
  v2 = -[GEOPDSearchPlaceContextMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchPlaceContextMetadata)initWithData:(id)a3
{
  GEOPDSearchPlaceContextMetadata *v3;
  GEOPDSearchPlaceContextMetadata *v4;
  GEOPDSearchPlaceContextMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchPlaceContextMetadata;
  v3 = -[GEOPDSearchPlaceContextMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addAlternateSearchableName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if ((*(_WORD *)(a1 + 108) & 0x10) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateSearchableNames_tags_6327);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    -[GEOPDSearchPlaceContextMetadata _addNoFlagsAlternateSearchableName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 108) |= 0x10u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    *(_WORD *)(a1 + 108) |= 0x1000u;
  }
}

- (void)_addNoFlagsAlternateSearchableName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
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
  v8.super_class = (Class)GEOPDSearchPlaceContextMetadata;
  -[GEOPDSearchPlaceContextMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchPlaceContextMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  id v13;
  const __CFString *v14;
  void *v15;
  id v16;
  id v17;
  const __CFString *v18;
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  id v32;
  id v33;
  const __CFString *v34;
  int v35;
  __CFString *v36;
  const __CFString *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v59[4];
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchPlaceContextMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x100) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMatchedDisplayName_tags_6325);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v7 = *(id *)(a1 + 56);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("matchedDisplayName");
    else
      v8 = CFSTR("matched_display_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  if ((*(_WORD *)(a1 + 108) & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v10 = CFSTR("isDefaultName");
    else
      v10 = CFSTR("is_default_name");
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x400) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNormalizedQuery_tags_0);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v13 = *(id *)(a1 + 72);
  if (v13)
  {
    if (a2)
      v14 = CFSTR("normalizedQuery");
    else
      v14 = CFSTR("normalized_query");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x40) == 0)
  {
    v15 = *(void **)(a1 + 8);
    if (v15)
    {
      v16 = v15;
      objc_sync_enter(v16);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInterpretedCategory_tags);
      objc_sync_exit(v16);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v17 = *(id *)(a1 + 40);
  if (v17)
  {
    if (a2)
      v18 = CFSTR("interpretedCategory");
    else
      v18 = CFSTR("interpreted_category");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x80) == 0)
  {
    v19 = *(void **)(a1 + 8);
    if (v19)
    {
      v20 = v19;
      objc_sync_enter(v20);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMatchedDisplayNameLanguageCode_tags_6326);
      objc_sync_exit(v20);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v21 = *(id *)(a1 + 48);
  if (v21)
  {
    if (a2)
      v22 = CFSTR("matchedDisplayNameLanguageCode");
    else
      v22 = CFSTR("matched_display_name_language_code");
    objc_msgSend(v4, "setObject:forKey:", v21, v22);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v24 = *(id *)(a1 + 24);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v25)
    {
      v26 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v62 != v26)
            objc_enumerationMutation(v24);
          v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v28, "jsonRepresentation");
          else
            objc_msgSend(v28, "dictionaryRepresentation");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "addObject:", v29);

        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v25);
    }

    if (a2)
      v30 = CFSTR("alternateSearchableName");
    else
      v30 = CFSTR("alternate_searchable_name");
    objc_msgSend(v4, "setObject:forKey:", v23, v30);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x800) == 0)
  {
    v31 = *(void **)(a1 + 8);
    if (v31)
    {
      v32 = v31;
      objc_sync_enter(v32);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSecondaryNameOverrideLanguage_tags);
      objc_sync_exit(v32);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v33 = *(id *)(a1 + 80);
  if (v33)
  {
    if (a2)
      v34 = CFSTR("secondaryNameOverrideLanguage");
    else
      v34 = CFSTR("secondary_name_override_language");
    objc_msgSend(v4, "setObject:forKey:", v33, v34);
  }

  if ((*(_WORD *)(a1 + 108) & 1) != 0)
  {
    v35 = *(_DWORD *)(a1 + 100);
    if (v35)
    {
      if (v35 == 1)
      {
        v36 = CFSTR("CATEGORY_TAXONOMY_TYPE_MODERN");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 100));
        v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v36 = CFSTR("CATEGORY_TAXONOMY_TYPE_DEFAULT");
    }
    if (a2)
      v37 = CFSTR("taxonomyTypeForClientization");
    else
      v37 = CFSTR("taxonomy_type_for_clientization");
    objc_msgSend(v4, "setObject:forKey:", v36, v37);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x20) == 0)
  {
    v38 = *(void **)(a1 + 8);
    if (v38)
    {
      v39 = v38;
      objc_sync_enter(v39);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readContextualPhotoMetadata_tags);
      objc_sync_exit(v39);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v40 = *(id *)(a1 + 32);
  v41 = v40;
  if (v40)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v40, "jsonRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("contextualPhotoMetadata");
    }
    else
    {
      objc_msgSend(v40, "dictionaryRepresentation");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = CFSTR("contextual_photo_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if ((*(_WORD *)(a1 + 108) & 0x200) == 0)
  {
    v44 = *(void **)(a1 + 8);
    if (v44)
    {
      v45 = v44;
      objc_sync_enter(v45);
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readNearbyPlacesMetadata_tags);
      objc_sync_exit(v45);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  v46 = *(id *)(a1 + 64);
  v47 = v46;
  if (v46)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v46, "jsonRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("nearbyPlacesMetadata");
    }
    else
    {
      objc_msgSend(v46, "dictionaryRepresentation");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = CFSTR("nearby_places_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

  }
  if ((*(_WORD *)(a1 + 108) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 105));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v51 = CFSTR("shouldPartiallyClientizeResult");
    else
      v51 = CFSTR("should_partially_clientize_result");
    objc_msgSend(v4, "setObject:forKey:", v50, v51);

  }
  v52 = *(void **)(a1 + 16);
  if (v52)
  {
    objc_msgSend(v52, "dictionaryRepresentation");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v53;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v53, "count"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __61__GEOPDSearchPlaceContextMetadata__dictionaryRepresentation___block_invoke;
      v59[3] = &unk_1E1C00600;
      v56 = v55;
      v60 = v56;
      objc_msgSend(v54, "enumerateKeysAndObjectsUsingBlock:", v59);
      v57 = v56;

    }
    else
    {
      v57 = v53;
    }
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_6354;
      else
        v6 = (int *)&readAll__nonRecursiveTag_6355;
      GEOPDSearchPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchPlaceContextMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

void __61__GEOPDSearchPlaceContextMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDSearchPlaceContextMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x1FF0) == 0))
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
    -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 0);
    if (self->_matchedDisplayName)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 2) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_normalizedQuery)
      PBDataWriterWriteStringField();
    if (self->_interpretedCategory)
      PBDataWriterWriteStringField();
    if (self->_matchedDisplayNameLanguageCode)
      PBDataWriterWriteStringField();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_alternateSearchableNames;
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
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

    if (self->_secondaryNameOverrideLanguage)
      PBDataWriterWriteStringField();
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_contextualPhotoMetadata)
      PBDataWriterWriteSubmessage();
    if (self->_nearbyPlacesMetadata)
      PBDataWriterWriteSubmessage();
    if ((*(_WORD *)&self->_flags & 4) != 0)
      PBDataWriterWriteBOOLField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v12);
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
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  PBUnknownFields *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x1000) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchPlaceContextMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_19;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_matchedDisplayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v9;

  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    *(_BYTE *)(v5 + 104) = self->_isDefaultName;
    *(_WORD *)(v5 + 108) |= 2u;
  }
  v11 = -[NSString copyWithZone:](self->_normalizedQuery, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v11;

  v13 = -[NSString copyWithZone:](self->_interpretedCategory, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  v15 = -[NSString copyWithZone:](self->_matchedDisplayNameLanguageCode, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v15;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v17 = self->_alternateSearchableNames;
  v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v17);
        v21 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v30);
        -[GEOPDSearchPlaceContextMetadata addAlternateSearchableName:](v5, v21);

      }
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  v22 = -[NSString copyWithZone:](self->_secondaryNameOverrideLanguage, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v22;

  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_taxonomyTypeForClientization;
    *(_WORD *)(v5 + 108) |= 1u;
  }
  v24 = -[GEOPDContextualPhotoMetadata copyWithZone:](self->_contextualPhotoMetadata, "copyWithZone:", a3, (_QWORD)v30);
  v25 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v24;

  v26 = -[GEOPDNearbyPlacesMetadata copyWithZone:](self->_nearbyPlacesMetadata, "copyWithZone:", a3);
  v27 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v26;

  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 105) = self->_shouldPartiallyClientizeResult;
    *(_WORD *)(v5 + 108) |= 4u;
  }
  v28 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v28;
LABEL_19:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *matchedDisplayName;
  __int16 v6;
  NSString *normalizedQuery;
  NSString *interpretedCategory;
  NSString *matchedDisplayNameLanguageCode;
  NSMutableArray *alternateSearchableNames;
  NSString *secondaryNameOverrideLanguage;
  __int16 v12;
  GEOPDContextualPhotoMetadata *contextualPhotoMetadata;
  GEOPDNearbyPlacesMetadata *nearbyPlacesMetadata;
  __int16 v15;
  BOOL v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)v4, 1);
  matchedDisplayName = self->_matchedDisplayName;
  if ((unint64_t)matchedDisplayName | *((_QWORD *)v4 + 7))
  {
    if (!-[NSString isEqual:](matchedDisplayName, "isEqual:"))
      goto LABEL_33;
  }
  v6 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 2) != 0)
  {
    if ((v6 & 2) == 0)
      goto LABEL_33;
    if (self->_isDefaultName)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_33;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_33;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_33;
  }
  normalizedQuery = self->_normalizedQuery;
  if ((unint64_t)normalizedQuery | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](normalizedQuery, "isEqual:"))
  {
    goto LABEL_33;
  }
  interpretedCategory = self->_interpretedCategory;
  if ((unint64_t)interpretedCategory | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](interpretedCategory, "isEqual:"))
      goto LABEL_33;
  }
  matchedDisplayNameLanguageCode = self->_matchedDisplayNameLanguageCode;
  if ((unint64_t)matchedDisplayNameLanguageCode | *((_QWORD *)v4 + 6))
  {
    if (!-[NSString isEqual:](matchedDisplayNameLanguageCode, "isEqual:"))
      goto LABEL_33;
  }
  alternateSearchableNames = self->_alternateSearchableNames;
  if ((unint64_t)alternateSearchableNames | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](alternateSearchableNames, "isEqual:"))
      goto LABEL_33;
  }
  secondaryNameOverrideLanguage = self->_secondaryNameOverrideLanguage;
  if ((unint64_t)secondaryNameOverrideLanguage | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](secondaryNameOverrideLanguage, "isEqual:"))
      goto LABEL_33;
  }
  v12 = *((_WORD *)v4 + 54);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v12 & 1) == 0 || self->_taxonomyTypeForClientization != *((_DWORD *)v4 + 25))
      goto LABEL_33;
  }
  else if ((v12 & 1) != 0)
  {
    goto LABEL_33;
  }
  contextualPhotoMetadata = self->_contextualPhotoMetadata;
  if ((unint64_t)contextualPhotoMetadata | *((_QWORD *)v4 + 4)
    && !-[GEOPDContextualPhotoMetadata isEqual:](contextualPhotoMetadata, "isEqual:"))
  {
    goto LABEL_33;
  }
  nearbyPlacesMetadata = self->_nearbyPlacesMetadata;
  if ((unint64_t)nearbyPlacesMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDNearbyPlacesMetadata isEqual:](nearbyPlacesMetadata, "isEqual:"))
      goto LABEL_33;
  }
  v15 = *((_WORD *)v4 + 54);
  v16 = (v15 & 4) == 0;
  if ((*(_WORD *)&self->_flags & 4) != 0)
  {
    if ((v15 & 4) != 0)
    {
      if (self->_shouldPartiallyClientizeResult)
      {
        if (!*((_BYTE *)v4 + 105))
          goto LABEL_33;
      }
      else if (*((_BYTE *)v4 + 105))
      {
        goto LABEL_33;
      }
      v16 = 1;
      goto LABEL_34;
    }
LABEL_33:
    v16 = 0;
  }
LABEL_34:

  return v16;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;

  -[GEOPDSearchPlaceContextMetadata readAll:]((uint64_t)self, 1);
  v14 = -[NSString hash](self->_matchedDisplayName, "hash");
  if ((*(_WORD *)&self->_flags & 2) != 0)
    v13 = 2654435761 * self->_isDefaultName;
  else
    v13 = 0;
  v12 = -[NSString hash](self->_normalizedQuery, "hash");
  v3 = -[NSString hash](self->_interpretedCategory, "hash");
  v4 = -[NSString hash](self->_matchedDisplayNameLanguageCode, "hash");
  v5 = -[NSMutableArray hash](self->_alternateSearchableNames, "hash");
  v6 = -[NSString hash](self->_secondaryNameOverrideLanguage, "hash");
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v7 = 2654435761 * self->_taxonomyTypeForClientization;
  else
    v7 = 0;
  v8 = -[GEOPDContextualPhotoMetadata hash](self->_contextualPhotoMetadata, "hash");
  v9 = -[GEOPDNearbyPlacesMetadata hash](self->_nearbyPlacesMetadata, "hash");
  if ((*(_WORD *)&self->_flags & 4) != 0)
    v10 = 2654435761 * self->_shouldPartiallyClientizeResult;
  else
    v10 = 0;
  return v13 ^ v14 ^ v12 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryNameOverrideLanguage, 0);
  objc_storeStrong((id *)&self->_normalizedQuery, 0);
  objc_storeStrong((id *)&self->_nearbyPlacesMetadata, 0);
  objc_storeStrong((id *)&self->_matchedDisplayName, 0);
  objc_storeStrong((id *)&self->_matchedDisplayNameLanguageCode, 0);
  objc_storeStrong((id *)&self->_interpretedCategory, 0);
  objc_storeStrong((id *)&self->_contextualPhotoMetadata, 0);
  objc_storeStrong((id *)&self->_alternateSearchableNames, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
