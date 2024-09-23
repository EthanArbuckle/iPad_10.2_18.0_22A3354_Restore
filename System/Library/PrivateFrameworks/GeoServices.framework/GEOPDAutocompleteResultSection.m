@implementation GEOPDAutocompleteResultSection

- (GEOPDAutocompleteResultSection)init
{
  GEOPDAutocompleteResultSection *v2;
  GEOPDAutocompleteResultSection *v3;
  GEOPDAutocompleteResultSection *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDAutocompleteResultSection;
  v2 = -[GEOPDAutocompleteResultSection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDAutocompleteResultSection)initWithData:(id)a3
{
  GEOPDAutocompleteResultSection *v3;
  GEOPDAutocompleteResultSection *v4;
  GEOPDAutocompleteResultSection *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDAutocompleteResultSection;
  v3 = -[GEOPDAutocompleteResultSection initWithData:](&v7, sel_initWithData_, a3);
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
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)GEOPDAutocompleteResultSection;
  -[GEOPDAutocompleteResultSection dealloc](&v3, sel_dealloc);
}

- (void)_readName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x2000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readName_tags_1);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)name
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResultSection _readName]((uint64_t)a1);
    a1 = (id *)v1[13];
  }
  return a1;
}

- (void)_readEntries
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x1000) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readEntries_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (id)entries
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDAutocompleteResultSection _readEntries]((uint64_t)a1);
    a1 = (id *)v1[12];
  }
  return a1;
}

- (void)addEntries:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDAutocompleteResultSection _readEntries](a1);
    -[GEOPDAutocompleteResultSection _addNoFlagsEntries:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 144) |= 0x1000u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
    *(_WORD *)(a1 + 144) |= 0x4000u;
  }
}

- (void)_addNoFlagsEntries:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 96);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 96);
      *(_QWORD *)(a1 + 96) = v5;

      v4 = *(void **)(a1 + 96);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readIncludedClientResultTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x800) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readIncludedClientResultTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)includedClientResultTypeAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDAutocompleteResultSection _readIncludedClientResultTypes](result);
    v4 = *(_QWORD *)(v3 + 80);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 72) + 4 * a2);
  }
  return result;
}

- (void)_readExcludedClientResultTypes
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    if ((*(_WORD *)(a1 + 144) & 0x400) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDAutocompleteResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readExcludedClientResultTypes_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

- (uint64_t)excludedClientResultTypeAtIndex:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (result)
  {
    v3 = result;
    -[GEOPDAutocompleteResultSection _readExcludedClientResultTypes](result);
    v4 = *(_QWORD *)(v3 + 56);
    if (v4 <= a2)
    {
      v5 = (void *)MEMORY[0x1E0C99DA0];
      v6 = *MEMORY[0x1E0C99858];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%tu) is out of range (%tu)"), a2, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "raise");

    }
    return *(unsigned int *)(*(_QWORD *)(v3 + 48) + 4 * a2);
  }
  return result;
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
  v8.super_class = (Class)GEOPDAutocompleteResultSection;
  -[GEOPDAutocompleteResultSection description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDAutocompleteResultSection dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDAutocompleteResultSection _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v25;
  __CFString *v26;
  const __CFString *v27;
  void *v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  __CFString *v32;
  const __CFString *v33;
  void *v34;
  _QWORD *v35;
  unint64_t v36;
  uint64_t v37;
  __CFString *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v48;
  const __CFString *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  const __CFString *v55;
  uint64_t v56;
  __CFString *v57;
  const __CFString *v58;
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
  -[GEOPDAutocompleteResultSection readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 144) & 8) != 0)
  {
    v5 = *(int *)(a1 + 136);
    if (v5 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 136));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C04720[v5];
    }
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("type"));

  }
  -[GEOPDAutocompleteResultSection name]((id *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("name"));

  if (objc_msgSend(*(id *)(a1 + 96), "count"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 96), "count"));
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v9 = *(id *)(a1 + 96);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v62 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v14, "jsonRepresentation");
          else
            objc_msgSend(v14, "dictionaryRepresentation");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v11);
    }

    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("entries"));
  }
  v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 4) != 0)
  {
    v17 = *(int *)(a1 + 132);
    if (v17 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 132));
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E1C04770[v17];
    }
    if (a2)
      v19 = CFSTR("suggestionType");
    else
      v19 = CFSTR("suggestion_type");
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

    v16 = *(_WORD *)(a1 + 144);
  }
  if ((v16 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 128));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v49 = CFSTR("numVisibleResults");
    else
      v49 = CFSTR("num_visible_results");
    objc_msgSend(v4, "setObject:forKey:", v48, v49);

    v16 = *(_WORD *)(a1 + 144);
    if ((v16 & 0x80) == 0)
    {
LABEL_31:
      if ((v16 & 0x20) == 0)
        goto LABEL_32;
      goto LABEL_85;
    }
  }
  else if ((v16 & 0x80) == 0)
  {
    goto LABEL_31;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 143));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v51 = CFSTR("shouldInterleaveClientResults");
  else
    v51 = CFSTR("should_interleave_client_results");
  objc_msgSend(v4, "setObject:forKey:", v50, v51);

  v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 0x20) == 0)
  {
LABEL_32:
    if ((v16 & 0x10) == 0)
      goto LABEL_33;
    goto LABEL_89;
  }
LABEL_85:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 141));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v53 = CFSTR("enforceServerResultsOrder");
  else
    v53 = CFSTR("enforce_server_results_order");
  objc_msgSend(v4, "setObject:forKey:", v52, v53);

  v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 0x10) == 0)
  {
LABEL_33:
    if ((v16 & 1) == 0)
      goto LABEL_34;
LABEL_93:
    v56 = *(int *)(a1 + 124);
    if (v56 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 124));
      v57 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v57 = off_1E1C047C0[v56];
    }
    if (a2)
      v58 = CFSTR("contentType");
    else
      v58 = CFSTR("content_type");
    objc_msgSend(v4, "setObject:forKey:", v57, v58);

    if ((*(_WORD *)(a1 + 144) & 0x40) == 0)
      goto LABEL_39;
    goto LABEL_35;
  }
LABEL_89:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 140));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v55 = CFSTR("enableMapsSuggestServerReranking");
  else
    v55 = CFSTR("enable_maps_suggest_server_reranking");
  objc_msgSend(v4, "setObject:forKey:", v54, v55);

  v16 = *(_WORD *)(a1 + 144);
  if ((v16 & 1) != 0)
    goto LABEL_93;
LABEL_34:
  if ((v16 & 0x40) != 0)
  {
LABEL_35:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 142));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v21 = CFSTR("isSectionForClientOnlyResults");
    else
      v21 = CFSTR("is_section_for_client_only_results");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
LABEL_39:
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (_QWORD *)(a1 + 24);
    if (*(_QWORD *)(a1 + 32))
    {
      v24 = 0;
      do
      {
        v25 = *(int *)(*v23 + 4 * v24);
        if (v25 >= 0xF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v25);
          v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = off_1E1C047E0[v25];
        }
        objc_msgSend(v22, "addObject:", v26);

        ++v24;
        v23 = (_QWORD *)(a1 + 24);
      }
      while (v24 < *(_QWORD *)(a1 + 32));
    }
    if (a2)
      v27 = CFSTR("allowedTypeClientOnlySection");
    else
      v27 = CFSTR("allowed_type_client_only_section");
    objc_msgSend(v4, "setObject:forKey:", v22, v27);

  }
  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (_QWORD *)(a1 + 72);
    if (*(_QWORD *)(a1 + 80))
    {
      v30 = 0;
      do
      {
        v31 = *(int *)(*v29 + 4 * v30);
        if (v31 >= 0xF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v31);
          v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v32 = off_1E1C047E0[v31];
        }
        objc_msgSend(v28, "addObject:", v32);

        ++v30;
        v29 = (_QWORD *)(a1 + 72);
      }
      while (v30 < *(_QWORD *)(a1 + 80));
    }
    if (a2)
      v33 = CFSTR("includedClientResultType");
    else
      v33 = CFSTR("included_client_result_type");
    objc_msgSend(v4, "setObject:forKey:", v28, v33);

  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (_QWORD *)(a1 + 48);
    if (*(_QWORD *)(a1 + 56))
    {
      v36 = 0;
      do
      {
        v37 = *(int *)(*v35 + 4 * v36);
        if (v37 >= 0xF)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v37);
          v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = off_1E1C047E0[v37];
        }
        objc_msgSend(v34, "addObject:", v38);

        ++v36;
        v35 = (_QWORD *)(a1 + 48);
      }
      while (v36 < *(_QWORD *)(a1 + 56));
    }
    if (a2)
      v39 = CFSTR("excludedClientResultType");
    else
      v39 = CFSTR("excluded_client_result_type");
    objc_msgSend(v4, "setObject:forKey:", v34, v39);

  }
  v40 = *(void **)(a1 + 16);
  if (v40)
  {
    objc_msgSend(v40, "dictionaryRepresentation");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v41, "count"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __60__GEOPDAutocompleteResultSection__dictionaryRepresentation___block_invoke;
      v59[3] = &unk_1E1C00600;
      v44 = v43;
      v60 = v44;
      objc_msgSend(v42, "enumerateKeysAndObjectsUsingBlock:", v59);
      v45 = v44;

      v42 = v45;
    }
    objc_msgSend(v4, "setObject:forKey:", v42, CFSTR("Unknown Fields"));

  }
  v46 = v4;

  return v46;
}

- (id)jsonRepresentation
{
  return -[GEOPDAutocompleteResultSection _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 120));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1383;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1384;
      GEOPDAutocompleteResultSectionReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDAutocompleteResultSectionCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 120));
  }
}

void __60__GEOPDAutocompleteResultSection__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  return GEOPDAutocompleteResultSectionReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int16 flags;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
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
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), (*(_WORD *)&self->_flags & 0x7E00) == 0))
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
    -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 8) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_name)
      PBDataWriterWriteStringField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = self->_entries;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 2) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x80) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x20) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x10) != 0)
    {
      PBDataWriterWriteBOOLField();
      flags = (__int16)self->_flags;
    }
    if ((flags & 1) != 0)
    {
      PBDataWriterWriteInt32Field();
      flags = (__int16)self->_flags;
    }
    if ((flags & 0x40) != 0)
      PBDataWriterWriteBOOLField();
    if (self->_allowedTypeClientOnlySections.count)
    {
      v11 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v11;
      }
      while (v11 < self->_allowedTypeClientOnlySections.count);
    }
    if (self->_includedClientResultTypes.count)
    {
      v12 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v12;
      }
      while (v12 < self->_includedClientResultTypes.count);
    }
    if (self->_excludedClientResultTypes.count)
    {
      v13 = 0;
      do
      {
        PBDataWriterWriteInt32Field();
        ++v13;
      }
      while (v13 < self->_excludedClientResultTypes.count);
    }
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
  NSMutableArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int16 flags;
  PBUnknownFields *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (!reader)
  {
LABEL_5:
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 8) != 0)
    {
      *(_DWORD *)(v5 + 136) = self->_type;
      *(_WORD *)(v5 + 144) |= 8u;
    }
    v9 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v10 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v9;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = self->_entries;
    v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v11);
          v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v19);
          -[GEOPDAutocompleteResultSection addEntries:](v5, v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v12);
    }

    flags = (__int16)self->_flags;
    if ((flags & 4) != 0)
    {
      *(_DWORD *)(v5 + 132) = self->_suggestionType;
      *(_WORD *)(v5 + 144) |= 4u;
      flags = (__int16)self->_flags;
      if ((flags & 2) == 0)
      {
LABEL_16:
        if ((flags & 0x80) == 0)
          goto LABEL_17;
        goto LABEL_26;
      }
    }
    else if ((flags & 2) == 0)
    {
      goto LABEL_16;
    }
    *(_DWORD *)(v5 + 128) = self->_numVisibleResults;
    *(_WORD *)(v5 + 144) |= 2u;
    flags = (__int16)self->_flags;
    if ((flags & 0x80) == 0)
    {
LABEL_17:
      if ((flags & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_27;
    }
LABEL_26:
    *(_BYTE *)(v5 + 143) = self->_shouldInterleaveClientResults;
    *(_WORD *)(v5 + 144) |= 0x80u;
    flags = (__int16)self->_flags;
    if ((flags & 0x20) == 0)
    {
LABEL_18:
      if ((flags & 0x10) == 0)
        goto LABEL_19;
      goto LABEL_28;
    }
LABEL_27:
    *(_BYTE *)(v5 + 141) = self->_enforceServerResultsOrder;
    *(_WORD *)(v5 + 144) |= 0x20u;
    flags = (__int16)self->_flags;
    if ((flags & 0x10) == 0)
    {
LABEL_19:
      if ((flags & 1) == 0)
        goto LABEL_20;
      goto LABEL_29;
    }
LABEL_28:
    *(_BYTE *)(v5 + 140) = self->_enableMapsSuggestServerReranking;
    *(_WORD *)(v5 + 144) |= 0x10u;
    flags = (__int16)self->_flags;
    if ((flags & 1) == 0)
    {
LABEL_20:
      if ((flags & 0x40) == 0)
      {
LABEL_22:
        PBRepeatedInt32Copy();
        PBRepeatedInt32Copy();
        PBRepeatedInt32Copy();
        v17 = self->_unknownFields;
        v8 = *(id *)(v5 + 16);
        *(_QWORD *)(v5 + 16) = v17;
        goto LABEL_23;
      }
LABEL_21:
      *(_BYTE *)(v5 + 142) = self->_isSectionForClientOnlyResults;
      *(_WORD *)(v5 + 144) |= 0x40u;
      goto LABEL_22;
    }
LABEL_29:
    *(_DWORD *)(v5 + 124) = self->_contentType;
    *(_WORD *)(v5 + 144) |= 1u;
    if ((*(_WORD *)&self->_flags & 0x40) == 0)
      goto LABEL_22;
    goto LABEL_21;
  }
  v7 = reader;
  objc_sync_enter(v7);
  if ((*(_WORD *)&self->_flags & 0x4000) != 0)
  {
    objc_sync_exit(v7);

    goto LABEL_5;
  }
  *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
  -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
  GEOPDAutocompleteResultSectionReadAllFrom(v5, self->_reader, 0);
  os_unfair_lock_unlock(&self->_readerLock);
  v8 = (id)v5;
  objc_sync_exit(v7);

LABEL_23:
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  NSString *name;
  NSMutableArray *entries;
  __int16 flags;
  __int16 v9;
  char IsEqual;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_61;
  -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 1);
  -[GEOPDAutocompleteResultSection readAll:]((uint64_t)v4, 1);
  v5 = *((_WORD *)v4 + 72);
  if ((*(_WORD *)&self->_flags & 8) != 0)
  {
    if ((v5 & 8) == 0 || self->_type != *((_DWORD *)v4 + 34))
      goto LABEL_61;
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_61;
  }
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)v4 + 13) && !-[NSString isEqual:](name, "isEqual:"))
    goto LABEL_61;
  entries = self->_entries;
  if ((unint64_t)entries | *((_QWORD *)v4 + 12))
  {
    if (!-[NSMutableArray isEqual:](entries, "isEqual:"))
      goto LABEL_61;
  }
  flags = (__int16)self->_flags;
  v9 = *((_WORD *)v4 + 72);
  if ((flags & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_suggestionType != *((_DWORD *)v4 + 33))
      goto LABEL_61;
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_numVisibleResults != *((_DWORD *)v4 + 32))
      goto LABEL_61;
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0)
      goto LABEL_61;
    if (self->_shouldInterleaveClientResults)
    {
      if (!*((_BYTE *)v4 + 143))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 143))
    {
      goto LABEL_61;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0)
      goto LABEL_61;
    if (self->_enforceServerResultsOrder)
    {
      if (!*((_BYTE *)v4 + 141))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 141))
    {
      goto LABEL_61;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0)
      goto LABEL_61;
    if (self->_enableMapsSuggestServerReranking)
    {
      if (!*((_BYTE *)v4 + 140))
        goto LABEL_61;
    }
    else if (*((_BYTE *)v4 + 140))
    {
      goto LABEL_61;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 1) != 0)
  {
    if ((v9 & 1) == 0 || self->_contentType != *((_DWORD *)v4 + 31))
      goto LABEL_61;
  }
  else if ((v9 & 1) != 0)
  {
    goto LABEL_61;
  }
  if ((flags & 0x40) != 0)
  {
    if ((v9 & 0x40) != 0)
    {
      if (self->_isSectionForClientOnlyResults)
      {
        if (!*((_BYTE *)v4 + 142))
          goto LABEL_61;
        goto LABEL_58;
      }
      if (!*((_BYTE *)v4 + 142))
        goto LABEL_58;
    }
LABEL_61:
    IsEqual = 0;
    goto LABEL_62;
  }
  if ((v9 & 0x40) != 0)
    goto LABEL_61;
LABEL_58:
  if (!PBRepeatedInt32IsEqual() || !PBRepeatedInt32IsEqual())
    goto LABEL_61;
  IsEqual = PBRepeatedInt32IsEqual();
LABEL_62:

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  __int16 flags;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  uint64_t v15;
  uint64_t v16;

  -[GEOPDAutocompleteResultSection readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 8) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_name, "hash");
  v5 = -[NSMutableArray hash](self->_entries, "hash");
  flags = (__int16)self->_flags;
  if ((flags & 4) != 0)
  {
    v7 = 2654435761 * self->_suggestionType;
    if ((flags & 2) != 0)
    {
LABEL_6:
      v8 = 2654435761 * self->_numVisibleResults;
      if ((flags & 0x80) != 0)
        goto LABEL_7;
      goto LABEL_14;
    }
  }
  else
  {
    v7 = 0;
    if ((flags & 2) != 0)
      goto LABEL_6;
  }
  v8 = 0;
  if ((flags & 0x80) != 0)
  {
LABEL_7:
    v9 = 2654435761 * self->_shouldInterleaveClientResults;
    if ((flags & 0x20) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_14:
  v9 = 0;
  if ((flags & 0x20) != 0)
  {
LABEL_8:
    v10 = 2654435761 * self->_enforceServerResultsOrder;
    if ((flags & 0x10) != 0)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  v10 = 0;
  if ((flags & 0x10) != 0)
  {
LABEL_9:
    v11 = 2654435761 * self->_enableMapsSuggestServerReranking;
    if ((flags & 1) != 0)
      goto LABEL_10;
LABEL_17:
    v12 = 0;
    if ((flags & 0x40) != 0)
      goto LABEL_11;
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
LABEL_16:
  v11 = 0;
  if ((flags & 1) == 0)
    goto LABEL_17;
LABEL_10:
  v12 = 2654435761 * self->_contentType;
  if ((flags & 0x40) == 0)
    goto LABEL_18;
LABEL_11:
  v13 = 2654435761 * self->_isSectionForClientOnlyResults;
LABEL_19:
  v14 = v4 ^ v3 ^ v5 ^ v7;
  v15 = v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ PBRepeatedInt32Hash();
  v16 = v15 ^ PBRepeatedInt32Hash();
  return v14 ^ v16 ^ PBRepeatedInt32Hash();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_entries, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
