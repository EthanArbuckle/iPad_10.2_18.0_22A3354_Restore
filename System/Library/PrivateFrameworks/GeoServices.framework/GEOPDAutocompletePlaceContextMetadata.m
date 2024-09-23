@implementation GEOPDAutocompletePlaceContextMetadata

- (GEOPDAutocompletePlaceContextMetadata)init
{
  GEOPDAutocompletePlaceContextMetadata *v2;
  GEOPDAutocompletePlaceContextMetadata *v3;
  GEOPDAutocompletePlaceContextMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  v2 = -[GEOPDAutocompletePlaceContextMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompletePlaceContextMetadata)initWithData:(id)a3
{
  GEOPDAutocompletePlaceContextMetadata *v3;
  GEOPDAutocompletePlaceContextMetadata *v4;
  GEOPDAutocompletePlaceContextMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  v3 = -[GEOPDAutocompletePlaceContextMetadata initWithData:](&v7, sel_initWithData_, a3);
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
  v3.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  -[GEOPDAutocompletePlaceContextMetadata dealloc](&v3, sel_dealloc);
}

- (void)addAlternateSearchableName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    if ((*(_BYTE *)(a1 + 113) & 0x20) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternateSearchableNames_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    -[GEOPDAutocompletePlaceContextMetadata _addNoFlagsAlternateSearchableName:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 112) |= 0x2000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    *(_DWORD *)(a1 + 112) |= 0x20000u;
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

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)GEOPDAutocompletePlaceContextMetadata;
  -[GEOPDAutocompletePlaceContextMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompletePlaceContextMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompletePlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFString *v8;
  int v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  id v21;
  id v22;
  const __CFString *v23;
  int v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  const __CFString *v36;
  int v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  const __CFString *v43;
  uint64_t v44;
  __CFString *v45;
  const __CFString *v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  id v52;
  id v53;
  const __CFString *v54;
  int v55;
  __CFString *v56;
  const __CFString *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  _QWORD v65[4];
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDAutocompletePlaceContextMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 114) & 1) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMatchedDisplayName_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v7 = *(id *)(a1 + 72);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("matchedDisplayName");
    else
      v8 = CFSTR("matched_display_name");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(_DWORD *)(a1 + 112);
  if ((v9 & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 106));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isDefaultName");
    else
      v11 = CFSTR("is_default_name");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

    v9 = *(_DWORD *)(a1 + 112);
  }
  if ((v9 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 108));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("isProminentResult");
    else
      v13 = CFSTR("is_prominent_result");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

  }
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v16 = 0;
      do
      {
        v17 = *(int *)(*v15 + 4 * v16);
        if (v17 >= 5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v17);
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v18 = off_1E1C0B720[v17];
        }
        objc_msgSend(v14, "addObject:", v18);

        ++v16;
        v15 = (_QWORD *)(a1 + 24);
      }
      while (v16 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v19 = CFSTR("clientizationFeature");
    else
      v19 = CFSTR("clientization_feature");
    objc_msgSend(v4, "setObject:forKey:", v14, v19);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 113) & 0x80) == 0)
  {
    v20 = *(void **)(a1 + 8);
    if (v20)
    {
      v21 = v20;
      objc_sync_enter(v21);
      GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMatchedDisplayNameLanguageCode_tags);
      objc_sync_exit(v21);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v22 = *(id *)(a1 + 64);
  if (v22)
  {
    if (a2)
      v23 = CFSTR("matchedDisplayNameLanguageCode");
    else
      v23 = CFSTR("matched_display_name_language_code");
    objc_msgSend(v4, "setObject:forKey:", v22, v23);
  }

  v24 = *(_DWORD *)(a1 + 112);
  if ((v24 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 111));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v26 = CFSTR("shouldSuppressDirectionsAction");
    else
      v26 = CFSTR("should_suppress_directions_action");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

    v24 = *(_DWORD *)(a1 + 112);
  }
  if ((v24 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 107));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("isLookAroundActionAllowed");
    else
      v28 = CFSTR("is_look_around_action_allowed");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

  }
  if (objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v30 = *(id *)(a1 + 48);
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v68 != v32)
            objc_enumerationMutation(v30);
          v34 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v34, "jsonRepresentation");
          else
            objc_msgSend(v34, "dictionaryRepresentation");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "addObject:", v35);

        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v67, v71, 16);
      }
      while (v31);
    }

    if (a2)
      v36 = CFSTR("alternateSearchableName");
    else
      v36 = CFSTR("alternate_searchable_name");
    objc_msgSend(v4, "setObject:forKey:", v29, v36);

  }
  v37 = *(_DWORD *)(a1 + 112);
  if ((v37 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 92));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v39 = CFSTR("distanceDisplayThreshold");
    else
      v39 = CFSTR("distance_display_threshold");
    objc_msgSend(v4, "setObject:forKey:", v38, v39);

    v37 = *(_DWORD *)(a1 + 112);
  }
  if ((v37 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 105));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v41 = CFSTR("enableLookInsideActionForVenuePois");
    else
      v41 = CFSTR("enable_look_inside_action_for_venue_pois");
    objc_msgSend(v4, "setObject:forKey:", v40, v41);

    v37 = *(_DWORD *)(a1 + 112);
  }
  if ((v37 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 104));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v43 = CFSTR("enableChildPoisWithoutAcRank");
    else
      v43 = CFSTR("enable_child_pois_without_ac_rank");
    objc_msgSend(v4, "setObject:forKey:", v42, v43);

    v37 = *(_DWORD *)(a1 + 112);
  }
  if ((v37 & 2) != 0)
  {
    v44 = *(int *)(a1 + 96);
    if (v44 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 96));
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v45 = off_1E1C0B748[v44];
    }
    if (a2)
      v46 = CFSTR("requestedShortAddressType");
    else
      v46 = CFSTR("requested_short_address_type");
    objc_msgSend(v4, "setObject:forKey:", v45, v46);

    v37 = *(_DWORD *)(a1 + 112);
  }
  if ((v37 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 109));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v48 = CFSTR("shouldEnableCallAction");
    else
      v48 = CFSTR("should_enable_call_action");
    objc_msgSend(v4, "setObject:forKey:", v47, v48);

    v37 = *(_DWORD *)(a1 + 112);
  }
  if ((v37 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 110));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v50 = CFSTR("shouldEnableWebsiteAction");
    else
      v50 = CFSTR("should_enable_website_action");
    objc_msgSend(v4, "setObject:forKey:", v49, v50);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
  if ((*(_BYTE *)(a1 + 113) & 0x40) == 0)
  {
    v51 = *(void **)(a1 + 8);
    if (v51)
    {
      v52 = v51;
      objc_sync_enter(v52);
      GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readInferredCategory_tags);
      objc_sync_exit(v52);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  v53 = *(id *)(a1 + 56);
  if (v53)
  {
    if (a2)
      v54 = CFSTR("inferredCategory");
    else
      v54 = CFSTR("inferred_category");
    objc_msgSend(v4, "setObject:forKey:", v53, v54);
  }

  if ((*(_BYTE *)(a1 + 112) & 4) != 0)
  {
    v55 = *(_DWORD *)(a1 + 100);
    if (v55)
    {
      if (v55 == 1)
      {
        v56 = CFSTR("CATEGORY_TAXONOMY_TYPE_MODERN");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 100));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v56 = CFSTR("CATEGORY_TAXONOMY_TYPE_DEFAULT");
    }
    if (a2)
      v57 = CFSTR("taxonomyTypeForClientization");
    else
      v57 = CFSTR("taxonomy_type_for_clientization");
    objc_msgSend(v4, "setObject:forKey:", v56, v57);

  }
  v58 = *(void **)(a1 + 16);
  if (v58)
  {
    objc_msgSend(v58, "dictionaryRepresentation");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v59;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v59, "count"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x1E0C809B0];
      v65[1] = 3221225472;
      v65[2] = __67__GEOPDAutocompletePlaceContextMetadata__dictionaryRepresentation___block_invoke;
      v65[3] = &unk_1E1C00600;
      v62 = v61;
      v66 = v62;
      objc_msgSend(v60, "enumerateKeysAndObjectsUsingBlock:", v65);
      v63 = v62;

    }
    else
    {
      v63 = v59;
    }
    objc_msgSend(v4, "setObject:forKey:", v63, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompletePlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_547;
      else
        v6 = (int *)&readAll__nonRecursiveTag_548;
      GEOPDAutocompletePlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDAutocompletePlaceContextMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
  }
}

void __67__GEOPDAutocompletePlaceContextMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDAutocompletePlaceContextMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $203C1FB2D65701EB3B32EE8DA255F10E flags;
  unint64_t v7;
  $203C1FB2D65701EB3B32EE8DA255F10E v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  $203C1FB2D65701EB3B32EE8DA255F10E v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_DWORD *)&self->_flags & 0x3F000) == 0))
  {
    v14 = self->_reader;
    objc_sync_enter(v14);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v15);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v14);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 0);
    if (self->_matchedDisplayName)
      PBDataWriterWriteStringField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = self->_flags;
    }
    if ((*(_BYTE *)&flags & 0x80) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_clientizationFeatures.count)
    {
      v7 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v7;
      }
      while (v7 < self->_clientizationFeatures.count);
    }
    if (self->_matchedDisplayNameLanguageCode)
      PBDataWriterWriteStringField();
    v8 = self->_flags;
    if ((*(_WORD *)&v8 & 0x400) != 0)
    {
      PBDataWriterWriteBOOLField();
      v8 = self->_flags;
    }
    if ((*(_BYTE *)&v8 & 0x40) != 0)
      PBDataWriterWriteBOOLField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = self->_alternateSearchableNames;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v9);
          PBDataWriterWriteSubmessage();
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v13 = self->_flags;
    if ((*(_BYTE *)&v13 & 1) != 0)
    {
      PBDataWriterWriteUint32Field();
      v13 = self->_flags;
    }
    if ((*(_BYTE *)&v13 & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      v13 = self->_flags;
    }
    if ((*(_BYTE *)&v13 & 8) != 0)
    {
      PBDataWriterWriteBOOLField();
      v13 = self->_flags;
    }
    if ((*(_BYTE *)&v13 & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      v13 = self->_flags;
    }
    if ((*(_WORD *)&v13 & 0x100) != 0)
    {
      PBDataWriterWriteBOOLField();
      v13 = self->_flags;
    }
    if ((*(_WORD *)&v13 & 0x200) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_inferredCategory)
      PBDataWriterWriteStringField();
    if ((*(_BYTE *)&self->_flags & 4) != 0)
      PBDataWriterWriteInt32Field();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
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
  $203C1FB2D65701EB3B32EE8DA255F10E flags;
  uint64_t v12;
  void *v13;
  $203C1FB2D65701EB3B32EE8DA255F10E v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  $203C1FB2D65701EB3B32EE8DA255F10E v20;
  uint64_t v21;
  void *v22;
  PBUnknownFields *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 2) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDAutocompletePlaceContextMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_30;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_matchedDisplayName, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v9;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    *(_BYTE *)(v5 + 106) = self->_isDefaultName;
    *(_DWORD *)(v5 + 112) |= 0x20u;
    flags = self->_flags;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 108) = self->_isProminentResult;
    *(_DWORD *)(v5 + 112) |= 0x80u;
  }
  PBRepeatedInt32Copy();
  v12 = -[NSString copyWithZone:](self->_matchedDisplayNameLanguageCode, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v12;

  v14 = self->_flags;
  if ((*(_WORD *)&v14 & 0x400) != 0)
  {
    *(_BYTE *)(v5 + 111) = self->_shouldSuppressDirectionsAction;
    *(_DWORD *)(v5 + 112) |= 0x400u;
    v14 = self->_flags;
  }
  if ((*(_BYTE *)&v14 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 107) = self->_isLookAroundActionAllowed;
    *(_DWORD *)(v5 + 112) |= 0x40u;
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_alternateSearchableNames;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v25);
        -[GEOPDAutocompletePlaceContextMetadata addAlternateSearchableName:](v5, v19);

      }
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 1) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_distanceDisplayThreshold;
    *(_DWORD *)(v5 + 112) |= 1u;
    v20 = self->_flags;
    if ((*(_BYTE *)&v20 & 0x10) == 0)
    {
LABEL_22:
      if ((*(_BYTE *)&v20 & 8) == 0)
        goto LABEL_23;
      goto LABEL_33;
    }
  }
  else if ((*(_BYTE *)&v20 & 0x10) == 0)
  {
    goto LABEL_22;
  }
  *(_BYTE *)(v5 + 105) = self->_enableLookInsideActionForVenuePois;
  *(_DWORD *)(v5 + 112) |= 0x10u;
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 8) == 0)
  {
LABEL_23:
    if ((*(_BYTE *)&v20 & 2) == 0)
      goto LABEL_24;
    goto LABEL_34;
  }
LABEL_33:
  *(_BYTE *)(v5 + 104) = self->_enableChildPoisWithoutAcRank;
  *(_DWORD *)(v5 + 112) |= 8u;
  v20 = self->_flags;
  if ((*(_BYTE *)&v20 & 2) == 0)
  {
LABEL_24:
    if ((*(_WORD *)&v20 & 0x100) == 0)
      goto LABEL_25;
LABEL_35:
    *(_BYTE *)(v5 + 109) = self->_shouldEnableCallAction;
    *(_DWORD *)(v5 + 112) |= 0x100u;
    if ((*(_DWORD *)&self->_flags & 0x200) == 0)
      goto LABEL_27;
    goto LABEL_26;
  }
LABEL_34:
  *(_DWORD *)(v5 + 96) = self->_requestedShortAddressType;
  *(_DWORD *)(v5 + 112) |= 2u;
  v20 = self->_flags;
  if ((*(_WORD *)&v20 & 0x100) != 0)
    goto LABEL_35;
LABEL_25:
  if ((*(_WORD *)&v20 & 0x200) != 0)
  {
LABEL_26:
    *(_BYTE *)(v5 + 110) = self->_shouldEnableWebsiteAction;
    *(_DWORD *)(v5 + 112) |= 0x200u;
  }
LABEL_27:
  v21 = -[NSString copyWithZone:](self->_inferredCategory, "copyWithZone:", a3, (_QWORD)v25);
  v22 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v21;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_DWORD *)(v5 + 100) = self->_taxonomyTypeForClientization;
    *(_DWORD *)(v5 + 112) |= 4u;
  }
  v23 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v23;
LABEL_30:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *matchedDisplayName;
  $203C1FB2D65701EB3B32EE8DA255F10E flags;
  int v7;
  NSString *matchedDisplayNameLanguageCode;
  $203C1FB2D65701EB3B32EE8DA255F10E v9;
  int v10;
  NSMutableArray *alternateSearchableNames;
  NSString *inferredCategory;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_92;
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)v4, 1);
  matchedDisplayName = self->_matchedDisplayName;
  if ((unint64_t)matchedDisplayName | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](matchedDisplayName, "isEqual:"))
      goto LABEL_92;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 28);
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_92;
    if (self->_isDefaultName)
    {
      if (!*((_BYTE *)v4 + 106))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 106))
    {
      goto LABEL_92;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_92;
    if (self->_isProminentResult)
    {
      if (!*((_BYTE *)v4 + 108))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 108))
    {
      goto LABEL_92;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_92;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_92;
  matchedDisplayNameLanguageCode = self->_matchedDisplayNameLanguageCode;
  if ((unint64_t)matchedDisplayNameLanguageCode | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](matchedDisplayNameLanguageCode, "isEqual:"))
      goto LABEL_92;
  }
  v9 = self->_flags;
  v10 = *((_DWORD *)v4 + 28);
  if ((*(_WORD *)&v9 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0)
      goto LABEL_92;
    if (self->_shouldSuppressDirectionsAction)
    {
      if (!*((_BYTE *)v4 + 111))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 111))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&v9 & 0x40) != 0)
  {
    if ((v10 & 0x40) == 0)
      goto LABEL_92;
    if (self->_isLookAroundActionAllowed)
    {
      if (!*((_BYTE *)v4 + 107))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 107))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x40) != 0)
  {
    goto LABEL_92;
  }
  alternateSearchableNames = self->_alternateSearchableNames;
  if ((unint64_t)alternateSearchableNames | *((_QWORD *)v4 + 6))
  {
    if (!-[NSMutableArray isEqual:](alternateSearchableNames, "isEqual:"))
      goto LABEL_92;
    v9 = self->_flags;
    v10 = *((_DWORD *)v4 + 28);
  }
  if ((*(_BYTE *)&v9 & 1) != 0)
  {
    if ((v10 & 1) == 0 || self->_distanceDisplayThreshold != *((_DWORD *)v4 + 23))
      goto LABEL_92;
  }
  else if ((v10 & 1) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&v9 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0)
      goto LABEL_92;
    if (self->_enableLookInsideActionForVenuePois)
    {
      if (!*((_BYTE *)v4 + 105))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 105))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&v9 & 8) != 0)
  {
    if ((v10 & 8) == 0)
      goto LABEL_92;
    if (self->_enableChildPoisWithoutAcRank)
    {
      if (!*((_BYTE *)v4 + 104))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 104))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 8) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&v9 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_requestedShortAddressType != *((_DWORD *)v4 + 24))
      goto LABEL_92;
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_WORD *)&v9 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0)
      goto LABEL_92;
    if (self->_shouldEnableCallAction)
    {
      if (!*((_BYTE *)v4 + 109))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 109))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0)
      goto LABEL_92;
    if (self->_shouldEnableWebsiteAction)
    {
      if (!*((_BYTE *)v4 + 110))
        goto LABEL_92;
    }
    else if (*((_BYTE *)v4 + 110))
    {
      goto LABEL_92;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_92;
  }
  inferredCategory = self->_inferredCategory;
  if (!((unint64_t)inferredCategory | *((_QWORD *)v4 + 7)))
    goto LABEL_87;
  if (!-[NSString isEqual:](inferredCategory, "isEqual:"))
  {
LABEL_92:
    v13 = 0;
    goto LABEL_93;
  }
  v9 = self->_flags;
  v10 = *((_DWORD *)v4 + 28);
LABEL_87:
  if ((*(_BYTE *)&v9 & 4) != 0)
  {
    if ((v10 & 4) == 0 || self->_taxonomyTypeForClientization != *((_DWORD *)v4 + 25))
      goto LABEL_92;
    v13 = 1;
  }
  else
  {
    v13 = (v10 & 4) == 0;
  }
LABEL_93:

  return v13;
}

- (unint64_t)hash
{
  $203C1FB2D65701EB3B32EE8DA255F10E flags;
  $203C1FB2D65701EB3B32EE8DA255F10E v4;
  uint64_t v5;
  $203C1FB2D65701EB3B32EE8DA255F10E v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;

  -[GEOPDAutocompletePlaceContextMetadata readAll:]((uint64_t)self, 1);
  v22 = -[NSString hash](self->_matchedDisplayName, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    v21 = 2654435761 * self->_isDefaultName;
    if ((*(_BYTE *)&flags & 0x80) != 0)
      goto LABEL_3;
  }
  else
  {
    v21 = 0;
    if ((*(_BYTE *)&flags & 0x80) != 0)
    {
LABEL_3:
      v20 = 2654435761 * self->_isProminentResult;
      goto LABEL_6;
    }
  }
  v20 = 0;
LABEL_6:
  v19 = PBRepeatedInt32Hash();
  v18 = -[NSString hash](self->_matchedDisplayNameLanguageCode, "hash");
  v4 = self->_flags;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
    v17 = 2654435761 * self->_shouldSuppressDirectionsAction;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
      goto LABEL_8;
  }
  else
  {
    v17 = 0;
    if ((*(_BYTE *)&v4 & 0x40) != 0)
    {
LABEL_8:
      v16 = 2654435761 * self->_isLookAroundActionAllowed;
      goto LABEL_11;
    }
  }
  v16 = 0;
LABEL_11:
  v5 = -[NSMutableArray hash](self->_alternateSearchableNames, "hash");
  v6 = self->_flags;
  if ((*(_BYTE *)&v6 & 1) != 0)
  {
    v7 = 2654435761 * self->_distanceDisplayThreshold;
    if ((*(_BYTE *)&v6 & 0x10) != 0)
    {
LABEL_13:
      v8 = 2654435761 * self->_enableLookInsideActionForVenuePois;
      if ((*(_BYTE *)&v6 & 8) != 0)
        goto LABEL_14;
      goto LABEL_20;
    }
  }
  else
  {
    v7 = 0;
    if ((*(_BYTE *)&v6 & 0x10) != 0)
      goto LABEL_13;
  }
  v8 = 0;
  if ((*(_BYTE *)&v6 & 8) != 0)
  {
LABEL_14:
    v9 = 2654435761 * self->_enableChildPoisWithoutAcRank;
    if ((*(_BYTE *)&v6 & 2) != 0)
      goto LABEL_15;
    goto LABEL_21;
  }
LABEL_20:
  v9 = 0;
  if ((*(_BYTE *)&v6 & 2) != 0)
  {
LABEL_15:
    v10 = 2654435761 * self->_requestedShortAddressType;
    if ((*(_WORD *)&v6 & 0x100) != 0)
      goto LABEL_16;
LABEL_22:
    v11 = 0;
    if ((*(_WORD *)&v6 & 0x200) != 0)
      goto LABEL_17;
    goto LABEL_23;
  }
LABEL_21:
  v10 = 0;
  if ((*(_WORD *)&v6 & 0x100) == 0)
    goto LABEL_22;
LABEL_16:
  v11 = 2654435761 * self->_shouldEnableCallAction;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
LABEL_17:
    v12 = 2654435761 * self->_shouldEnableWebsiteAction;
    goto LABEL_24;
  }
LABEL_23:
  v12 = 0;
LABEL_24:
  v13 = -[NSString hash](self->_inferredCategory, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v14 = 2654435761 * self->_taxonomyTypeForClientization;
  else
    v14 = 0;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;
  id v5;
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
  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_DWORD *)(a1 + 112) |= 0x800u;
    *(_DWORD *)(a1 + 112) |= 0x20000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 88));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDAutocompletePlaceContextMetadata readAll:](a1, 0);
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 48);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "clearUnknownFields:", 1, (_QWORD)v10);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchedDisplayName, 0);
  objc_storeStrong((id *)&self->_matchedDisplayNameLanguageCode, 0);
  objc_storeStrong((id *)&self->_inferredCategory, 0);
  objc_storeStrong((id *)&self->_alternateSearchableNames, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
