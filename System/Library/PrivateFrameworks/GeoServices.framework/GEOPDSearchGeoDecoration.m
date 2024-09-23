@implementation GEOPDSearchGeoDecoration

- (GEOPDSearchGeoDecoration)init
{
  GEOPDSearchGeoDecoration *v2;
  GEOPDSearchGeoDecoration *v3;
  GEOPDSearchGeoDecoration *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchGeoDecoration;
  v2 = -[GEOPDSearchGeoDecoration init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchGeoDecoration)initWithData:(id)a3
{
  GEOPDSearchGeoDecoration *v3;
  GEOPDSearchGeoDecoration *v4;
  GEOPDSearchGeoDecoration *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchGeoDecoration;
  v3 = -[GEOPDSearchGeoDecoration initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readAlternatives
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 73) & 0x10) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAlternatives_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
}

- (void)addAlternative:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchGeoDecoration _readAlternatives]((uint64_t)a1);
    -[GEOPDSearchGeoDecoration _addNoFlagsAlternative:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[18]._os_unfair_lock_opaque |= 0x1000u;
    os_unfair_lock_unlock(a1 + 14);
    a1[18]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsAlternative:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchGeoDecoration;
  -[GEOPDSearchGeoDecoration description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchGeoDecoration dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchGeoDecoration _dictionaryRepresentation:]((uint64_t)self, 0);
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
  id v13;
  id v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  id v19;
  id v20;
  const __CFString *v21;
  int v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v27;
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  const __CFString *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;

  if (!a1)
  {
    v4 = 0;
    return v4;
  }
  -[GEOPDSearchGeoDecoration readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 73) & 0x20) == 0)
  {
    v5 = *(void **)(a1 + 8);
    if (v5)
    {
      v6 = v5;
      objc_sync_enter(v6);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCanonicalForm_tags);
      objc_sync_exit(v6);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v7 = *(id *)(a1 + 24);
  if (v7)
  {
    if (a2)
      v8 = CFSTR("canonicalForm");
    else
      v8 = CFSTR("canonical_form");
    objc_msgSend(v4, "setObject:forKey:", v7, v8);
  }

  v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 0x200) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 69));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v28 = CFSTR("isStopWord");
    else
      v28 = CFSTR("is_stop_word");
    objc_msgSend(v4, "setObject:forKey:", v27, v28);

    v9 = *(_DWORD *)(a1 + 72);
    if ((v9 & 1) == 0)
    {
LABEL_12:
      if ((v9 & 4) == 0)
        goto LABEL_13;
      goto LABEL_61;
    }
  }
  else if ((v9 & 1) == 0)
  {
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 60));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v30 = CFSTR("isArticle");
  else
    v30 = CFSTR("is_article");
  objc_msgSend(v4, "setObject:forKey:", v29, v30);

  v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 4) == 0)
  {
LABEL_13:
    if ((v9 & 0x800) == 0)
      goto LABEL_14;
    goto LABEL_65;
  }
LABEL_61:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 62));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v32 = CFSTR("isDirection");
  else
    v32 = CFSTR("is_direction");
  objc_msgSend(v4, "setObject:forKey:", v31, v32);

  v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 0x800) == 0)
  {
LABEL_14:
    if ((v9 & 0x400) == 0)
      goto LABEL_15;
    goto LABEL_69;
  }
LABEL_65:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 71));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v34 = CFSTR("isType");
  else
    v34 = CFSTR("is_type");
  objc_msgSend(v4, "setObject:forKey:", v33, v34);

  v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 0x400) == 0)
  {
LABEL_15:
    if ((v9 & 8) == 0)
      goto LABEL_16;
    goto LABEL_73;
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 70));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v36 = CFSTR("isTitle");
  else
    v36 = CFSTR("is_title");
  objc_msgSend(v4, "setObject:forKey:", v35, v36);

  v9 = *(_DWORD *)(a1 + 72);
  if ((v9 & 8) == 0)
  {
LABEL_16:
    if ((v9 & 2) == 0)
      goto LABEL_21;
    goto LABEL_17;
  }
LABEL_73:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 63));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v38 = CFSTR("isDropped");
  else
    v38 = CFSTR("is_dropped");
  objc_msgSend(v4, "setObject:forKey:", v37, v38);

  if ((*(_DWORD *)(a1 + 72) & 2) != 0)
  {
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 61));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v11 = CFSTR("isCardinal");
    else
      v11 = CFSTR("is_cardinal");
    objc_msgSend(v4, "setObject:forKey:", v10, v11);

  }
LABEL_21:
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 73) & 0x40) == 0)
  {
    v12 = *(void **)(a1 + 8);
    if (v12)
    {
      v13 = v12;
      objc_sync_enter(v13);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCardinalWord_tags);
      objc_sync_exit(v13);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v14 = *(id *)(a1 + 32);
  if (v14)
  {
    if (a2)
      v15 = CFSTR("cardinalWord");
    else
      v15 = CFSTR("cardinal_word");
    objc_msgSend(v4, "setObject:forKey:", v14, v15);
  }

  if ((*(_BYTE *)(a1 + 72) & 0x80) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 67));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v17 = CFSTR("isOrdinal");
    else
      v17 = CFSTR("is_ordinal");
    objc_msgSend(v4, "setObject:forKey:", v16, v17);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 73) & 0x80) == 0)
  {
    v18 = *(void **)(a1 + 8);
    if (v18)
    {
      v19 = v18;
      objc_sync_enter(v19);
      GEOPDSearchGeoDecorationReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOrdinalWord_tags);
      objc_sync_exit(v19);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v20 = *(id *)(a1 + 40);
  if (v20)
  {
    if (a2)
      v21 = CFSTR("ordinalWord");
    else
      v21 = CFSTR("ordinal_word");
    objc_msgSend(v4, "setObject:forKey:", v20, v21);
  }

  v22 = *(_DWORD *)(a1 + 72);
  if ((v22 & 0x40) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 66));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v40 = CFSTR("isMultiTokenType");
    else
      v40 = CFSTR("is_multi_token_type");
    objc_msgSend(v4, "setObject:forKey:", v39, v40);

    v22 = *(_DWORD *)(a1 + 72);
    if ((v22 & 0x10) == 0)
    {
LABEL_44:
      if ((v22 & 0x20) == 0)
        goto LABEL_45;
LABEL_86:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 65));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v44 = CFSTR("isMultiTokenTitle");
      else
        v44 = CFSTR("is_multi_token_title");
      objc_msgSend(v4, "setObject:forKey:", v43, v44);

      if ((*(_DWORD *)(a1 + 72) & 0x100) == 0)
        goto LABEL_50;
      goto LABEL_46;
    }
  }
  else if ((v22 & 0x10) == 0)
  {
    goto LABEL_44;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 64));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
    v42 = CFSTR("isMultiTokenDirection");
  else
    v42 = CFSTR("is_multi_token_direction");
  objc_msgSend(v4, "setObject:forKey:", v41, v42);

  v22 = *(_DWORD *)(a1 + 72);
  if ((v22 & 0x20) != 0)
    goto LABEL_86;
LABEL_45:
  if ((v22 & 0x100) != 0)
  {
LABEL_46:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 68));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v24 = CFSTR("isPersonalName");
    else
      v24 = CFSTR("is_personal_name");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);

  }
LABEL_50:
  if (*(_QWORD *)(a1 + 16))
  {
    -[GEOPDSearchGeoDecoration _readAlternatives](a1);
    v25 = *(id *)(a1 + 16);
    objc_msgSend(v4, "setObject:forKey:", v25, CFSTR("alternative"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchGeoDecoration _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_553;
      else
        v6 = (int *)&readAll__nonRecursiveTag_554;
      GEOPDSearchGeoDecorationReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  char v13;
  const __CFString *v14;
  void *v15;
  char v16;
  const __CFString *v17;
  void *v18;
  char v19;
  const __CFString *v20;
  void *v21;
  char v22;
  const __CFString *v23;
  void *v24;
  char v25;
  const __CFString *v26;
  void *v27;
  char v28;
  const __CFString *v29;
  void *v30;
  char v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  const __CFString *v36;
  void *v37;
  char v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  id v42;
  const __CFString *v43;
  void *v44;
  char v45;
  const __CFString *v46;
  void *v47;
  char v48;
  const __CFString *v49;
  void *v50;
  char v51;
  const __CFString *v52;
  void *v53;
  char v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    if (a3)
      v7 = CFSTR("canonicalForm");
    else
      v7 = CFSTR("canonical_form");
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      v10 = v9;
      *(_DWORD *)(v6 + 72) |= 0x2000u;
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      objc_storeStrong((id *)(v6 + 24), v9);

    }
    if (a3)
      v11 = CFSTR("isStopWord");
    else
      v11 = CFSTR("is_stop_word");
    objc_msgSend(v5, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = objc_msgSend(v12, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x200u;
      *(_BYTE *)(v6 + 69) = v13;
    }

    if (a3)
      v14 = CFSTR("isArticle");
    else
      v14 = CFSTR("is_article");
    objc_msgSend(v5, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(v15, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 1u;
      *(_BYTE *)(v6 + 60) = v16;
    }

    if (a3)
      v17 = CFSTR("isDirection");
    else
      v17 = CFSTR("is_direction");
    objc_msgSend(v5, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = objc_msgSend(v18, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 4u;
      *(_BYTE *)(v6 + 62) = v19;
    }

    if (a3)
      v20 = CFSTR("isType");
    else
      v20 = CFSTR("is_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = objc_msgSend(v21, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x800u;
      *(_BYTE *)(v6 + 71) = v22;
    }

    if (a3)
      v23 = CFSTR("isTitle");
    else
      v23 = CFSTR("is_title");
    objc_msgSend(v5, "objectForKeyedSubscript:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v25 = objc_msgSend(v24, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x400u;
      *(_BYTE *)(v6 + 70) = v25;
    }

    if (a3)
      v26 = CFSTR("isDropped");
    else
      v26 = CFSTR("is_dropped");
    objc_msgSend(v5, "objectForKeyedSubscript:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = objc_msgSend(v27, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 8u;
      *(_BYTE *)(v6 + 63) = v28;
    }

    if (a3)
      v29 = CFSTR("isCardinal");
    else
      v29 = CFSTR("is_cardinal");
    objc_msgSend(v5, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v31 = objc_msgSend(v30, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 2u;
      *(_BYTE *)(v6 + 61) = v31;
    }

    if (a3)
      v32 = CFSTR("cardinalWord");
    else
      v32 = CFSTR("cardinal_word");
    objc_msgSend(v5, "objectForKeyedSubscript:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v34 = (void *)objc_msgSend(v33, "copy");
      v35 = v34;
      *(_DWORD *)(v6 + 72) |= 0x4000u;
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      objc_storeStrong((id *)(v6 + 32), v34);

    }
    if (a3)
      v36 = CFSTR("isOrdinal");
    else
      v36 = CFSTR("is_ordinal");
    objc_msgSend(v5, "objectForKeyedSubscript:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v38 = objc_msgSend(v37, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x80u;
      *(_BYTE *)(v6 + 67) = v38;
    }

    if (a3)
      v39 = CFSTR("ordinalWord");
    else
      v39 = CFSTR("ordinal_word");
    objc_msgSend(v5, "objectForKeyedSubscript:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v41 = (void *)objc_msgSend(v40, "copy");
      v42 = v41;
      *(_DWORD *)(v6 + 72) |= 0x8000u;
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      objc_storeStrong((id *)(v6 + 40), v41);

    }
    if (a3)
      v43 = CFSTR("isMultiTokenType");
    else
      v43 = CFSTR("is_multi_token_type");
    objc_msgSend(v5, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v45 = objc_msgSend(v44, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x40u;
      *(_BYTE *)(v6 + 66) = v45;
    }

    if (a3)
      v46 = CFSTR("isMultiTokenDirection");
    else
      v46 = CFSTR("is_multi_token_direction");
    objc_msgSend(v5, "objectForKeyedSubscript:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v48 = objc_msgSend(v47, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x10u;
      *(_BYTE *)(v6 + 64) = v48;
    }

    if (a3)
      v49 = CFSTR("isMultiTokenTitle");
    else
      v49 = CFSTR("is_multi_token_title");
    objc_msgSend(v5, "objectForKeyedSubscript:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v51 = objc_msgSend(v50, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x20u;
      *(_BYTE *)(v6 + 65) = v51;
    }

    if (a3)
      v52 = CFSTR("isPersonalName");
    else
      v52 = CFSTR("is_personal_name");
    objc_msgSend(v5, "objectForKeyedSubscript:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v54 = objc_msgSend(v53, "BOOLValue");
      *(_DWORD *)(v6 + 72) |= 0x10000u;
      *(_DWORD *)(v6 + 72) |= 0x100u;
      *(_BYTE *)(v6 + 68) = v54;
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("alternative"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v56 = v55;
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      if (v57)
      {
        v58 = v57;
        v59 = *(_QWORD *)v65;
        do
        {
          v60 = 0;
          do
          {
            if (*(_QWORD *)v65 != v59)
              objc_enumerationMutation(v56);
            v61 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v60);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v62 = (void *)objc_msgSend(v61, "copy", (_QWORD)v64);
              -[GEOPDSearchGeoDecoration addAlternative:]((os_unfair_lock_s *)v6, v62);

            }
            ++v60;
          }
          while (v58 != v60);
          v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
        }
        while (v58);
      }

    }
  }

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchGeoDecorationReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags;
  $419EF5E8D35E0A6D374E5D517AED3A72 v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  PBDataReader *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader)
  {
    os_unfair_lock_assert_owner(&self->_readerLock);
    if ((*(_DWORD *)&self->_flags & 0x1F000) == 0)
    {
      v12 = self->_reader;
      objc_sync_enter(v12);
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeData:", v13);
      os_unfair_lock_unlock(p_readerLock);

      objc_sync_exit(v12);
      goto LABEL_44;
    }
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 0);
  if (self->_canonicalForm)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    PBDataWriterWriteBOOLField();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_8;
      goto LABEL_34;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_11;
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_flags & 2) != 0)
LABEL_12:
    PBDataWriterWriteBOOLField();
LABEL_13:
  if (self->_cardinalWord)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_ordinalWord)
    PBDataWriterWriteStringField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    v7 = self->_flags;
    if ((*(_BYTE *)&v7 & 0x10) == 0)
    {
LABEL_21:
      if ((*(_BYTE *)&v7 & 0x20) == 0)
        goto LABEL_22;
LABEL_41:
      PBDataWriterWriteBOOLField();
      if ((*(_DWORD *)&self->_flags & 0x100) == 0)
        goto LABEL_24;
      goto LABEL_23;
    }
  }
  else if ((*(_BYTE *)&v7 & 0x10) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  v7 = self->_flags;
  if ((*(_BYTE *)&v7 & 0x20) != 0)
    goto LABEL_41;
LABEL_22:
  if ((*(_WORD *)&v7 & 0x100) != 0)
LABEL_23:
    PBDataWriterWriteBOOLField();
LABEL_24:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_alternatives;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        PBDataWriterWriteStringField();
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

LABEL_44:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  void *v10;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  $419EF5E8D35E0A6D374E5D517AED3A72 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 2) & 1) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchGeoDecorationReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_27;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_canonicalForm, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v9;

  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    *(_BYTE *)(v5 + 69) = self->_isStopWord;
    *(_DWORD *)(v5 + 72) |= 0x200u;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 4) == 0)
        goto LABEL_8;
      goto LABEL_30;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(_BYTE *)(v5 + 60) = self->_isArticle;
  *(_DWORD *)(v5 + 72) |= 1u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 4) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&flags & 0x800) == 0)
      goto LABEL_9;
    goto LABEL_31;
  }
LABEL_30:
  *(_BYTE *)(v5 + 62) = self->_isDirection;
  *(_DWORD *)(v5 + 72) |= 4u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x800) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&flags & 0x400) == 0)
      goto LABEL_10;
    goto LABEL_32;
  }
LABEL_31:
  *(_BYTE *)(v5 + 71) = self->_isType;
  *(_DWORD *)(v5 + 72) |= 0x800u;
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x400) == 0)
  {
LABEL_10:
    if ((*(_BYTE *)&flags & 8) == 0)
      goto LABEL_11;
    goto LABEL_33;
  }
LABEL_32:
  *(_BYTE *)(v5 + 70) = self->_isTitle;
  *(_DWORD *)(v5 + 72) |= 0x400u;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) == 0)
  {
LABEL_11:
    if ((*(_BYTE *)&flags & 2) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
LABEL_33:
  *(_BYTE *)(v5 + 63) = self->_isDropped;
  *(_DWORD *)(v5 + 72) |= 8u;
  if ((*(_DWORD *)&self->_flags & 2) != 0)
  {
LABEL_12:
    *(_BYTE *)(v5 + 61) = self->_isCardinal;
    *(_DWORD *)(v5 + 72) |= 2u;
  }
LABEL_13:
  v12 = -[NSString copyWithZone:](self->_cardinalWord, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v12;

  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
  {
    *(_BYTE *)(v5 + 67) = self->_isOrdinal;
    *(_DWORD *)(v5 + 72) |= 0x80u;
  }
  v14 = -[NSString copyWithZone:](self->_ordinalWord, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v14;

  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 0x40) != 0)
  {
    *(_BYTE *)(v5 + 66) = self->_isMultiTokenType;
    *(_DWORD *)(v5 + 72) |= 0x40u;
    v16 = self->_flags;
    if ((*(_BYTE *)&v16 & 0x10) == 0)
    {
LABEL_17:
      if ((*(_BYTE *)&v16 & 0x20) == 0)
        goto LABEL_18;
      goto LABEL_37;
    }
  }
  else if ((*(_BYTE *)&v16 & 0x10) == 0)
  {
    goto LABEL_17;
  }
  *(_BYTE *)(v5 + 64) = self->_isMultiTokenDirection;
  *(_DWORD *)(v5 + 72) |= 0x10u;
  v16 = self->_flags;
  if ((*(_BYTE *)&v16 & 0x20) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v16 & 0x100) == 0)
      goto LABEL_20;
    goto LABEL_19;
  }
LABEL_37:
  *(_BYTE *)(v5 + 65) = self->_isMultiTokenTitle;
  *(_DWORD *)(v5 + 72) |= 0x20u;
  if ((*(_DWORD *)&self->_flags & 0x100) != 0)
  {
LABEL_19:
    *(_BYTE *)(v5 + 68) = self->_isPersonalName;
    *(_DWORD *)(v5 + 72) |= 0x100u;
  }
LABEL_20:
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = self->_alternatives;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v8);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v22);
        -[GEOPDSearchGeoDecoration addAlternative:]((os_unfair_lock_s *)v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v17);
  }
LABEL_27:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *canonicalForm;
  $419EF5E8D35E0A6D374E5D517AED3A72 flags;
  int v7;
  NSString *cardinalWord;
  NSString *ordinalWord;
  char v10;
  NSMutableArray *alternatives;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_102;
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 1);
  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)v4, 1);
  canonicalForm = self->_canonicalForm;
  if ((unint64_t)canonicalForm | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](canonicalForm, "isEqual:"))
      goto LABEL_102;
  }
  flags = self->_flags;
  v7 = *((_DWORD *)v4 + 18);
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0)
      goto LABEL_102;
    if (self->_isStopWord)
    {
      if (!*((_BYTE *)v4 + 69))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 69))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v7 & 1) == 0)
      goto LABEL_102;
    if (self->_isArticle)
    {
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 60))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 1) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&flags & 4) != 0)
  {
    if ((v7 & 4) == 0)
      goto LABEL_102;
    if (self->_isDirection)
    {
      if (!*((_BYTE *)v4 + 62))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 62))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0)
      goto LABEL_102;
    if (self->_isType)
    {
      if (!*((_BYTE *)v4 + 71))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 71))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0)
      goto LABEL_102;
    if (self->_isTitle)
    {
      if (!*((_BYTE *)v4 + 70))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 70))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v7 & 8) == 0)
      goto LABEL_102;
    if (self->_isDropped)
    {
      if (!*((_BYTE *)v4 + 63))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 63))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v7 & 2) == 0)
      goto LABEL_102;
    if (self->_isCardinal)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_102;
  }
  cardinalWord = self->_cardinalWord;
  if ((unint64_t)cardinalWord | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](cardinalWord, "isEqual:"))
      goto LABEL_102;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 18);
  }
  if ((*(_BYTE *)&flags & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0)
      goto LABEL_102;
    if (self->_isOrdinal)
    {
      if (!*((_BYTE *)v4 + 67))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 67))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_102;
  }
  ordinalWord = self->_ordinalWord;
  if ((unint64_t)ordinalWord | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](ordinalWord, "isEqual:"))
      goto LABEL_102;
    flags = self->_flags;
    v7 = *((_DWORD *)v4 + 18);
  }
  if ((*(_BYTE *)&flags & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_102;
    if (self->_isMultiTokenType)
    {
      if (!*((_BYTE *)v4 + 66))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 66))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0)
      goto LABEL_102;
    if (self->_isMultiTokenDirection)
    {
      if (!*((_BYTE *)v4 + 64))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 64))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_BYTE *)&flags & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0)
      goto LABEL_102;
    if (self->_isMultiTokenTitle)
    {
      if (!*((_BYTE *)v4 + 65))
        goto LABEL_102;
    }
    else if (*((_BYTE *)v4 + 65))
    {
      goto LABEL_102;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_102;
  }
  if ((*(_WORD *)&flags & 0x100) == 0)
  {
    if ((v7 & 0x100) == 0)
      goto LABEL_108;
LABEL_102:
    v10 = 0;
    goto LABEL_103;
  }
  if ((v7 & 0x100) == 0)
    goto LABEL_102;
  if (!self->_isPersonalName)
  {
    if (!*((_BYTE *)v4 + 68))
      goto LABEL_108;
    goto LABEL_102;
  }
  if (!*((_BYTE *)v4 + 68))
    goto LABEL_102;
LABEL_108:
  alternatives = self->_alternatives;
  if ((unint64_t)alternatives | *((_QWORD *)v4 + 2))
    v10 = -[NSMutableArray isEqual:](alternatives, "isEqual:");
  else
    v10 = 1;
LABEL_103:

  return v10;
}

- (unint64_t)hash
{
  $419EF5E8D35E0A6D374E5D517AED3A72 flags;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  NSUInteger v11;
  $419EF5E8D35E0A6D374E5D517AED3A72 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  NSUInteger v20;

  -[GEOPDSearchGeoDecoration readAll:]((uint64_t)self, 1);
  v20 = -[NSString hash](self->_canonicalForm, "hash");
  flags = self->_flags;
  if ((*(_WORD *)&flags & 0x200) != 0)
  {
    v19 = 2654435761 * self->_isStopWord;
    if ((*(_BYTE *)&flags & 1) != 0)
    {
LABEL_3:
      v18 = 2654435761 * self->_isArticle;
      if ((*(_BYTE *)&flags & 4) != 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else
  {
    v19 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
  }
  v18 = 0;
  if ((*(_BYTE *)&flags & 4) != 0)
  {
LABEL_4:
    v4 = 2654435761 * self->_isDirection;
    if ((*(_WORD *)&flags & 0x800) != 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  v4 = 0;
  if ((*(_WORD *)&flags & 0x800) != 0)
  {
LABEL_5:
    v5 = 2654435761 * self->_isType;
    if ((*(_WORD *)&flags & 0x400) != 0)
      goto LABEL_6;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
  if ((*(_WORD *)&flags & 0x400) != 0)
  {
LABEL_6:
    v6 = 2654435761 * self->_isTitle;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_7;
LABEL_14:
    v7 = 0;
    if ((*(_BYTE *)&flags & 2) != 0)
      goto LABEL_8;
    goto LABEL_15;
  }
LABEL_13:
  v6 = 0;
  if ((*(_BYTE *)&flags & 8) == 0)
    goto LABEL_14;
LABEL_7:
  v7 = 2654435761 * self->_isDropped;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
LABEL_8:
    v8 = 2654435761 * self->_isCardinal;
    goto LABEL_16;
  }
LABEL_15:
  v8 = 0;
LABEL_16:
  v9 = -[NSString hash](self->_cardinalWord, "hash");
  if ((*(_BYTE *)&self->_flags & 0x80) != 0)
    v10 = 2654435761 * self->_isOrdinal;
  else
    v10 = 0;
  v11 = -[NSString hash](self->_ordinalWord, "hash");
  v12 = self->_flags;
  if ((*(_BYTE *)&v12 & 0x40) != 0)
  {
    v13 = 2654435761 * self->_isMultiTokenType;
    if ((*(_BYTE *)&v12 & 0x10) != 0)
    {
LABEL_21:
      v14 = 2654435761 * self->_isMultiTokenDirection;
      if ((*(_BYTE *)&v12 & 0x20) != 0)
        goto LABEL_22;
LABEL_26:
      v15 = 0;
      if ((*(_WORD *)&v12 & 0x100) != 0)
        goto LABEL_23;
LABEL_27:
      v16 = 0;
      return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSMutableArray hash](self->_alternatives, "hash");
    }
  }
  else
  {
    v13 = 0;
    if ((*(_BYTE *)&v12 & 0x10) != 0)
      goto LABEL_21;
  }
  v14 = 0;
  if ((*(_BYTE *)&v12 & 0x20) == 0)
    goto LABEL_26;
LABEL_22:
  v15 = 2654435761 * self->_isMultiTokenTitle;
  if ((*(_WORD *)&v12 & 0x100) == 0)
    goto LABEL_27;
LABEL_23:
  v16 = 2654435761 * self->_isPersonalName;
  return v19 ^ v20 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ -[NSMutableArray hash](self->_alternatives, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ordinalWord, 0);
  objc_storeStrong((id *)&self->_cardinalWord, 0);
  objc_storeStrong((id *)&self->_canonicalForm, 0);
  objc_storeStrong((id *)&self->_alternatives, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
