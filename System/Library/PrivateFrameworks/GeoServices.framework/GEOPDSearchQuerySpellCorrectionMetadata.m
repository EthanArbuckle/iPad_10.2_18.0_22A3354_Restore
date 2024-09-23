@implementation GEOPDSearchQuerySpellCorrectionMetadata

- (GEOPDSearchQuerySpellCorrectionMetadata)init
{
  GEOPDSearchQuerySpellCorrectionMetadata *v2;
  GEOPDSearchQuerySpellCorrectionMetadata *v3;
  GEOPDSearchQuerySpellCorrectionMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQuerySpellCorrectionMetadata;
  v2 = -[GEOPDSearchQuerySpellCorrectionMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQuerySpellCorrectionMetadata)initWithData:(id)a3
{
  GEOPDSearchQuerySpellCorrectionMetadata *v3;
  GEOPDSearchQuerySpellCorrectionMetadata *v4;
  GEOPDSearchQuerySpellCorrectionMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQuerySpellCorrectionMetadata;
  v3 = -[GEOPDSearchQuerySpellCorrectionMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)addTokenCandidate:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x4000) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenCandidates_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQuerySpellCorrectionMetadata _addNoFlagsTokenCandidate:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x4000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 100) |= 0x8000u;
  }
}

- (void)_addNoFlagsTokenCandidate:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 56);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v5;

      v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addAllTokenCandidates:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x1000) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllTokenCandidates_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQuerySpellCorrectionMetadata _addNoFlagsAllTokenCandidates:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 100) |= 0x8000u;
  }
}

- (void)_addNoFlagsAllTokenCandidates:(uint64_t)a1
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

- (void)addAllSpellSuggestions:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    if ((*(_WORD *)(a1 + 100) & 0x800) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAllSpellSuggestions_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    -[GEOPDSearchQuerySpellCorrectionMetadata _addNoFlagsAllSpellSuggestions:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 100) |= 0x800u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
    *(_WORD *)(a1 + 100) |= 0x8000u;
  }
}

- (void)_addNoFlagsAllSpellSuggestions:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchQuerySpellCorrectionMetadata;
  -[GEOPDSearchQuerySpellCorrectionMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQuerySpellCorrectionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQuerySpellCorrectionMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  __int16 v11;
  void *v12;
  const __CFString *v13;
  unsigned int v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  const __CFString *v49;
  __int16 v50;
  uint64_t v51;
  __CFString *v52;
  const __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
  if ((*(_WORD *)(a1 + 100) & 0x2000) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSpellSuggestion_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  v7 = *(id *)(a1 + 48);
  v8 = v7;
  if (v7)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v7, "jsonRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("spellSuggestion");
    }
    else
    {
      objc_msgSend(v7, "dictionaryRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("spell_suggestion");
    }
    objc_msgSend(v4, "setObject:forKey:", v9, v10);

  }
  v11 = *(_WORD *)(a1 + 100);
  if ((v11 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 95));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v13 = CFSTR("isFromPoiSearchSpeller");
    else
      v13 = CFSTR("is_from_poi_search_speller");
    objc_msgSend(v4, "setObject:forKey:", v12, v13);

    v11 = *(_WORD *)(a1 + 100);
  }
  if ((v11 & 0x10) != 0)
  {
    v14 = *(_DWORD *)(a1 + 84) - 1;
    if (v14 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(unsigned int *)(a1 + 84));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E1C0A8C0[v14];
    }
    if (a2)
      v16 = CFSTR("resultStatus");
    else
      v16 = CFSTR("result_status");
    objc_msgSend(v4, "setObject:forKey:", v15, v16);

    v11 = *(_WORD *)(a1 + 100);
  }
  if ((v11 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("decileId");
    else
      v18 = CFSTR("decile_id");
    objc_msgSend(v4, "setObject:forKey:", v17, v18);

    v11 = *(_WORD *)(a1 + 100);
  }
  if ((v11 & 0x400) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 96));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("isSpellCorrectionSameAsOrgQuery");
    else
      v20 = CFSTR("is_spell_correction_same_as_org_query");
    objc_msgSend(v4, "setObject:forKey:", v19, v20);

  }
  if (objc_msgSend(*(id *)(a1 + 56), "count"))
  {
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v22 = *(id *)(a1 + 56);
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v68 != v24)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v26, "jsonRepresentation");
          else
            objc_msgSend(v26, "dictionaryRepresentation");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "addObject:", v27);

        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v67, v73, 16);
      }
      while (v23);
    }

    if (a2)
      v28 = CFSTR("tokenCandidate");
    else
      v28 = CFSTR("token_candidate");
    objc_msgSend(v4, "setObject:forKey:", v21, v28);

  }
  v29 = *(_WORD *)(a1 + 100);
  if ((v29 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v31 = CFSTR("misspellScore");
    else
      v31 = CFSTR("misspell_score");
    objc_msgSend(v4, "setObject:forKey:", v30, v31);

    v29 = *(_WORD *)(a1 + 100);
  }
  if ((v29 & 0x100) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 94));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v33 = CFSTR("isConfidentSpellCorrection");
    else
      v33 = CFSTR("is_confident_spell_correction");
    objc_msgSend(v4, "setObject:forKey:", v32, v33);

  }
  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v35 = *(id *)(a1 + 24);
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v64;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(_QWORD *)v64 != v37)
            objc_enumerationMutation(v35);
          v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v39, "jsonRepresentation");
          else
            objc_msgSend(v39, "dictionaryRepresentation");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addObject:", v40);

        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v63, v72, 16);
      }
      while (v36);
    }

    if (a2)
      v41 = CFSTR("allTokenCandidates");
    else
      v41 = CFSTR("all_token_candidates");
    objc_msgSend(v4, "setObject:forKey:", v34, v41);

  }
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v43 = *(id *)(a1 + 16);
    v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
    if (v44)
    {
      v45 = *(_QWORD *)v60;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v60 != v45)
            objc_enumerationMutation(v43);
          v47 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * k);
          if ((a2 & 1) != 0)
            objc_msgSend(v47, "jsonRepresentation");
          else
            objc_msgSend(v47, "dictionaryRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "addObject:", v48);

        }
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v59, v71, 16);
      }
      while (v44);
    }

    if (a2)
      v49 = CFSTR("allSpellSuggestions");
    else
      v49 = CFSTR("all_spell_suggestions");
    objc_msgSend(v4, "setObject:forKey:", v42, v49);

  }
  v50 = *(_WORD *)(a1 + 100);
  if ((v50 & 0x20) != 0)
  {
    v51 = *(int *)(a1 + 88);
    if (v51 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 88));
      v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v52 = off_1E1C0A8F0[v51];
    }
    if (a2)
      v53 = CFSTR("spellerRankerModelType");
    else
      v53 = CFSTR("speller_ranker_model_type");
    objc_msgSend(v4, "setObject:forKey:", v52, v53);

    v50 = *(_WORD *)(a1 + 100);
  }
  if ((v50 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 92));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v54, CFSTR("isFromDLCacheModel"));

    v50 = *(_WORD *)(a1 + 100);
  }
  if ((v50 & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 93));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v55, CFSTR("isFromDLRuntimeModel"));

    v50 = *(_WORD *)(a1 + 100);
  }
  if ((v50 & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 76));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v56, CFSTR("modelNumberMajor"));

    v50 = *(_WORD *)(a1 + 100);
  }
  if ((v50 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v57, CFSTR("modelNumberMinor"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQuerySpellCorrectionMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 72));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1480;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1481;
      GEOPDSearchQuerySpellCorrectionMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQuerySpellCorrectionMetadataCallReadAllRecursiveWithoutSynchronized((id *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 72));
  }
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQuerySpellCorrectionMetadataReadAllFrom((uint64_t)self, a3, 0);
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
  __int16 v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  __int16 v20;
  PBDataReader *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if (*(_WORD *)&self->_flags <= 0x7FFu)
    {
      v21 = self->_reader;
      objc_sync_enter(v21);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v22);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v21);
      goto LABEL_50;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 0);
  if (self->_spellSuggestion)
    PBDataWriterWriteSubmessage();
  flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_7:
      if ((flags & 1) == 0)
        goto LABEL_8;
LABEL_47:
      PBDataWriterWriteUint64Field();
      if ((*(_WORD *)&self->_flags & 0x400) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((flags & 0x10) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  flags = (__int16)self->_flags;
  if ((flags & 1) != 0)
    goto LABEL_47;
LABEL_8:
  if ((flags & 0x400) != 0)
LABEL_9:
    PBDataWriterWriteBOOLField();
LABEL_10:
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = self->_tokenCandidates;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v11 = (__int16)self->_flags;
  if ((v11 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v11 = (__int16)self->_flags;
  }
  if ((v11 & 0x100) != 0)
    PBDataWriterWriteBOOLField();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = self->_allTokenCandidates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v12);
        PBDataWriterWriteSubmessage();
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v13);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v16 = self->_allSpellSuggestions;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v24;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v16);
        PBDataWriterWriteSubmessage();
      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    }
    while (v17);
  }

  v20 = (__int16)self->_flags;
  if ((v20 & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    v20 = (__int16)self->_flags;
  }
  if ((v20 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (__int16)self->_flags;
  }
  if ((v20 & 0x80) != 0)
  {
    PBDataWriterWriteBOOLField();
    v20 = (__int16)self->_flags;
  }
  if ((v20 & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v20 = (__int16)self->_flags;
  }
  if ((v20 & 8) != 0)
    PBDataWriterWriteUint32Field();
LABEL_50:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  id v9;
  void *v10;
  __int16 flags;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int16 v17;
  NSMutableArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  NSMutableArray *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  __int16 v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 0);
    v9 = -[GEOPDSearchSpellSuggestion copyWithZone:](self->_spellSuggestion, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 48);
    *(_QWORD *)(v5 + 48) = v9;

    flags = (__int16)self->_flags;
    if ((flags & 0x200) != 0)
    {
      *(_BYTE *)(v5 + 95) = self->_isFromPoiSearchSpeller;
      *(_WORD *)(v5 + 100) |= 0x200u;
      flags = (__int16)self->_flags;
      if ((flags & 0x10) == 0)
      {
LABEL_7:
        if ((flags & 1) == 0)
          goto LABEL_8;
        goto LABEL_44;
      }
    }
    else if ((flags & 0x10) == 0)
    {
      goto LABEL_7;
    }
    *(_DWORD *)(v5 + 84) = self->_resultStatus;
    *(_WORD *)(v5 + 100) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_8:
      if ((flags & 0x400) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
LABEL_44:
    *(_QWORD *)(v5 + 32) = self->_decileId;
    *(_WORD *)(v5 + 100) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x400) == 0)
    {
LABEL_10:
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v12 = self->_tokenCandidates;
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v39 != v14)
              objc_enumerationMutation(v12);
            v16 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "copyWithZone:", a3);
            -[GEOPDSearchQuerySpellCorrectionMetadata addTokenCandidate:](v5, v16);

          }
          v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        }
        while (v13);
      }

      v17 = (__int16)self->_flags;
      if ((v17 & 2) != 0)
      {
        *(double *)(v5 + 40) = self->_misspellScore;
        *(_WORD *)(v5 + 100) |= 2u;
        v17 = (__int16)self->_flags;
      }
      if ((v17 & 0x100) != 0)
      {
        *(_BYTE *)(v5 + 94) = self->_isConfidentSpellCorrection;
        *(_WORD *)(v5 + 100) |= 0x100u;
      }
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = self->_allTokenCandidates;
      v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v19)
      {
        v20 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v18);
            v22 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "copyWithZone:", a3);
            -[GEOPDSearchQuerySpellCorrectionMetadata addAllTokenCandidates:](v5, v22);

          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v19);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v23 = self->_allSpellSuggestions;
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v31;
        do
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v31 != v25)
              objc_enumerationMutation(v23);
            v27 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * k), "copyWithZone:", a3, (_QWORD)v30);
            -[GEOPDSearchQuerySpellCorrectionMetadata addAllSpellSuggestions:](v5, v27);

          }
          v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        }
        while (v24);
      }

      v28 = (__int16)self->_flags;
      if ((v28 & 0x20) != 0)
      {
        *(_DWORD *)(v5 + 88) = self->_spellerRankerModelType;
        *(_WORD *)(v5 + 100) |= 0x20u;
        v28 = (__int16)self->_flags;
        if ((v28 & 0x40) == 0)
        {
LABEL_37:
          if ((v28 & 0x80) == 0)
            goto LABEL_38;
          goto LABEL_48;
        }
      }
      else if ((v28 & 0x40) == 0)
      {
        goto LABEL_37;
      }
      *(_BYTE *)(v5 + 92) = self->_isFromDLCacheModel;
      *(_WORD *)(v5 + 100) |= 0x40u;
      v28 = (__int16)self->_flags;
      if ((v28 & 0x80) == 0)
      {
LABEL_38:
        if ((v28 & 4) == 0)
          goto LABEL_39;
        goto LABEL_49;
      }
LABEL_48:
      *(_BYTE *)(v5 + 93) = self->_isFromDLRuntimeModel;
      *(_WORD *)(v5 + 100) |= 0x80u;
      v28 = (__int16)self->_flags;
      if ((v28 & 4) == 0)
      {
LABEL_39:
        if ((v28 & 8) == 0)
          return (id)v5;
LABEL_40:
        *(_DWORD *)(v5 + 80) = self->_modelNumberMinor;
        *(_WORD *)(v5 + 100) |= 8u;
        return (id)v5;
      }
LABEL_49:
      *(_DWORD *)(v5 + 76) = self->_modelNumberMajor;
      *(_WORD *)(v5 + 100) |= 4u;
      if ((*(_WORD *)&self->_flags & 8) == 0)
        return (id)v5;
      goto LABEL_40;
    }
LABEL_9:
    *(_BYTE *)(v5 + 96) = self->_isSpellCorrectionSameAsOrgQuery;
    *(_WORD *)(v5 + 100) |= 0x400u;
    goto LABEL_10;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x80000000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDSearchQuerySpellCorrectionMetadataReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchSpellSuggestion *spellSuggestion;
  __int16 flags;
  __int16 v7;
  NSMutableArray *tokenCandidates;
  NSMutableArray *allTokenCandidates;
  NSMutableArray *allSpellSuggestions;
  __int16 v11;
  __int16 v12;
  BOOL v13;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_81;
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)v4, 1);
  spellSuggestion = self->_spellSuggestion;
  if ((unint64_t)spellSuggestion | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDSearchSpellSuggestion isEqual:](spellSuggestion, "isEqual:"))
      goto LABEL_81;
  }
  flags = (__int16)self->_flags;
  v7 = *((_WORD *)v4 + 50);
  if ((flags & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x200) == 0)
      goto LABEL_81;
    if (self->_isFromPoiSearchSpeller)
    {
      if (!*((_BYTE *)v4 + 95))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 95))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x200) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_resultStatus != *((_DWORD *)v4 + 21))
      goto LABEL_81;
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 1) != 0)
  {
    if ((v7 & 1) == 0 || self->_decileId != *((_QWORD *)v4 + 4))
      goto LABEL_81;
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_81;
  }
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 50) & 0x400) == 0)
      goto LABEL_81;
    if (self->_isSpellCorrectionSameAsOrgQuery)
    {
      if (!*((_BYTE *)v4 + 96))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 96))
    {
      goto LABEL_81;
    }
  }
  else if ((*((_WORD *)v4 + 50) & 0x400) != 0)
  {
    goto LABEL_81;
  }
  tokenCandidates = self->_tokenCandidates;
  if ((unint64_t)tokenCandidates | *((_QWORD *)v4 + 7))
  {
    if (!-[NSMutableArray isEqual:](tokenCandidates, "isEqual:"))
      goto LABEL_81;
    flags = (__int16)self->_flags;
    v7 = *((_WORD *)v4 + 50);
  }
  if ((flags & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_misspellScore != *((double *)v4 + 5))
      goto LABEL_81;
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_81;
  }
  if ((flags & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_81;
    if (self->_isConfidentSpellCorrection)
    {
      if (!*((_BYTE *)v4 + 94))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 94))
    {
      goto LABEL_81;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_81;
  }
  allTokenCandidates = self->_allTokenCandidates;
  if ((unint64_t)allTokenCandidates | *((_QWORD *)v4 + 3)
    && !-[NSMutableArray isEqual:](allTokenCandidates, "isEqual:"))
  {
    goto LABEL_81;
  }
  allSpellSuggestions = self->_allSpellSuggestions;
  if ((unint64_t)allSpellSuggestions | *((_QWORD *)v4 + 2))
  {
    if (!-[NSMutableArray isEqual:](allSpellSuggestions, "isEqual:"))
      goto LABEL_81;
  }
  v11 = (__int16)self->_flags;
  v12 = *((_WORD *)v4 + 50);
  if ((v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_spellerRankerModelType != *((_DWORD *)v4 + 22))
      goto LABEL_81;
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_81;
  }
  if ((v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0)
      goto LABEL_81;
    if (self->_isFromDLCacheModel)
    {
      if (!*((_BYTE *)v4 + 92))
        goto LABEL_81;
    }
    else if (*((_BYTE *)v4 + 92))
    {
      goto LABEL_81;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_81;
  }
  if ((v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) != 0)
    {
      if (self->_isFromDLRuntimeModel)
      {
        if (!*((_BYTE *)v4 + 93))
          goto LABEL_81;
        goto LABEL_71;
      }
      if (!*((_BYTE *)v4 + 93))
        goto LABEL_71;
    }
LABEL_81:
    v13 = 0;
    goto LABEL_82;
  }
  if ((v12 & 0x80) != 0)
    goto LABEL_81;
LABEL_71:
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_modelNumberMajor != *((_DWORD *)v4 + 19))
      goto LABEL_81;
  }
  else if ((v12 & 4) != 0)
  {
    goto LABEL_81;
  }
  if ((v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_modelNumberMinor != *((_DWORD *)v4 + 20))
      goto LABEL_81;
    v13 = 1;
  }
  else
  {
    v13 = (v12 & 8) == 0;
  }
LABEL_82:

  return v13;
}

- (unint64_t)hash
{
  __int16 flags;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  unint64_t v8;
  double misspellScore;
  double v10;
  long double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  -[GEOPDSearchQuerySpellCorrectionMetadata readAll:]((uint64_t)self, 1);
  v25 = -[GEOPDSearchSpellSuggestion hash](self->_spellSuggestion, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 0x200) != 0)
  {
    v24 = 2654435761 * self->_isFromPoiSearchSpeller;
    if ((flags & 0x10) != 0)
    {
LABEL_3:
      v23 = 2654435761 * self->_resultStatus;
      if ((flags & 1) != 0)
        goto LABEL_4;
LABEL_8:
      v4 = 0;
      if ((*(_WORD *)&self->_flags & 0x400) != 0)
        goto LABEL_5;
      goto LABEL_9;
    }
  }
  else
  {
    v24 = 0;
    if ((flags & 0x10) != 0)
      goto LABEL_3;
  }
  v23 = 0;
  if ((flags & 1) == 0)
    goto LABEL_8;
LABEL_4:
  v4 = 2654435761u * self->_decileId;
  if ((*(_WORD *)&self->_flags & 0x400) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isSpellCorrectionSameAsOrgQuery;
    goto LABEL_10;
  }
LABEL_9:
  v5 = 0;
LABEL_10:
  v6 = -[NSMutableArray hash](self->_tokenCandidates, "hash");
  v7 = (__int16)self->_flags;
  if ((v7 & 2) != 0)
  {
    misspellScore = self->_misspellScore;
    v10 = -misspellScore;
    if (misspellScore >= 0.0)
      v10 = self->_misspellScore;
    v11 = floor(v10 + 0.5);
    v12 = (v10 - v11) * 1.84467441e19;
    v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0)
        v8 += (unint64_t)v12;
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    v8 = 0;
  }
  if ((v7 & 0x100) != 0)
    v13 = 2654435761 * self->_isConfidentSpellCorrection;
  else
    v13 = 0;
  v14 = -[NSMutableArray hash](self->_allTokenCandidates, "hash");
  v15 = -[NSMutableArray hash](self->_allSpellSuggestions, "hash");
  v16 = (__int16)self->_flags;
  if ((v16 & 0x20) != 0)
  {
    v17 = 2654435761 * self->_spellerRankerModelType;
    if ((v16 & 0x40) != 0)
    {
LABEL_23:
      v18 = 2654435761 * self->_isFromDLCacheModel;
      if ((v16 & 0x80) != 0)
        goto LABEL_24;
      goto LABEL_29;
    }
  }
  else
  {
    v17 = 0;
    if ((v16 & 0x40) != 0)
      goto LABEL_23;
  }
  v18 = 0;
  if ((v16 & 0x80) != 0)
  {
LABEL_24:
    v19 = 2654435761 * self->_isFromDLRuntimeModel;
    if ((v16 & 4) != 0)
      goto LABEL_25;
LABEL_30:
    v20 = 0;
    if ((v16 & 8) != 0)
      goto LABEL_26;
LABEL_31:
    v21 = 0;
    return v24 ^ v25 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_29:
  v19 = 0;
  if ((v16 & 4) == 0)
    goto LABEL_30;
LABEL_25:
  v20 = 2654435761 * self->_modelNumberMajor;
  if ((v16 & 8) == 0)
    goto LABEL_31;
LABEL_26:
  v21 = 2654435761 * self->_modelNumberMinor;
  return v24 ^ v25 ^ v23 ^ v4 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14 ^ v15 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCandidates, 0);
  objc_storeStrong((id *)&self->_spellSuggestion, 0);
  objc_storeStrong((id *)&self->_allTokenCandidates, 0);
  objc_storeStrong((id *)&self->_allSpellSuggestions, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
