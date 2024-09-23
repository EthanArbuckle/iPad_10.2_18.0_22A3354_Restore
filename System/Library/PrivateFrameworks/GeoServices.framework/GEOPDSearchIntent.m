@implementation GEOPDSearchIntent

- (GEOPDSearchIntent)init
{
  GEOPDSearchIntent *v2;
  GEOPDSearchIntent *v3;
  GEOPDSearchIntent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchIntent;
  v2 = -[GEOPDSearchIntent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchIntent)initWithData:(id)a3
{
  GEOPDSearchIntent *v3;
  GEOPDSearchIntent *v4;
  GEOPDSearchIntent *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchIntent;
  v3 = -[GEOPDSearchIntent initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readBusinessIntent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 148) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readBusinessIntent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readGeoIntent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 1) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoIntent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readLocationIntent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLocationIntent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readSearchFilterIntent
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchFilterIntent_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (void)_readLanguageCodes
{
  void *v2;
  id v3;

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
  if ((*(_BYTE *)(a1 + 149) & 4) == 0)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = v2;
      objc_sync_enter(v3);
      GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readLanguageCodes_tags);
      objc_sync_exit(v3);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
}

- (void)addLanguageCode:(os_unfair_lock_s *)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDSearchIntent _readLanguageCodes]((uint64_t)a1);
    -[GEOPDSearchIntent _addNoFlagsLanguageCode:]((uint64_t)a1, v3);

    os_unfair_lock_lock_with_options();
    a1[37]._os_unfair_lock_opaque |= 0x400u;
    os_unfair_lock_unlock(a1 + 34);
    a1[37]._os_unfair_lock_opaque |= 0x10000u;
  }
}

- (void)_addNoFlagsLanguageCode:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 80);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = v5;

      v4 = *(void **)(a1 + 80);
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
  v8.super_class = (Class)GEOPDSearchIntent;
  -[GEOPDSearchIntent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchIntent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchIntent _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  id v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  id v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  id v34;
  void *v35;
  void *v36;
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
  id v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  const __CFString *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  id v67;
  id v68;
  void *v69;
  void *v70;
  const __CFString *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  const __CFString *v79;
  id v80;
  const __CFString *v81;

  if (a1)
  {
    -[GEOPDSearchIntent readAll:](a1, 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(_BYTE *)(a1 + 148) & 2) != 0)
    {
      v5 = *(int *)(a1 + 144);
      if (v5 >= 0xE)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 144));
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v6 = off_1E1C0AA50[v5];
      }
      if (a2)
        v7 = CFSTR("intentType");
      else
        v7 = CFSTR("intent_type");
      objc_msgSend(v4, "setObject:forKey:", v6, v7);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 148) & 0x10) == 0)
    {
      v8 = *(void **)(a1 + 8);
      if (v8)
      {
        v9 = v8;
        objc_sync_enter(v9);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryIntent_tags);
        objc_sync_exit(v9);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v10 = *(id *)(a1 + 32);
    v11 = v10;
    if (v10)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v10, "jsonRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("categoryIntent");
      }
      else
      {
        objc_msgSend(v10, "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("category_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v12, v13);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 148) & 0x20) == 0)
    {
      v14 = *(void **)(a1 + 8);
      if (v14)
      {
        v15 = v14;
        objc_sync_enter(v15);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readChainIntent_tags);
        objc_sync_exit(v15);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v16 = *(id *)(a1 + 40);
    v17 = v16;
    if (v16)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v16, "jsonRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("chainIntent");
      }
      else
      {
        objc_msgSend(v16, "dictionaryRepresentation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = CFSTR("chain_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v18, v19);

    }
    -[GEOPDSearchIntent _readBusinessIntent](a1);
    v20 = *(id *)(a1 + 24);
    v21 = v20;
    if (v20)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v20, "jsonRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("businessIntent");
      }
      else
      {
        objc_msgSend(v20, "dictionaryRepresentation");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = CFSTR("business_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v22, v23);

    }
    -[GEOPDSearchIntent _readGeoIntent](a1);
    v24 = *(id *)(a1 + 64);
    v25 = v24;
    if (v24)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v24, "jsonRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CFSTR("geoIntent");
      }
      else
      {
        objc_msgSend(v24, "dictionaryRepresentation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = CFSTR("geo_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v26, v27);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 0x20) == 0)
    {
      v28 = *(void **)(a1 + 8);
      if (v28)
      {
        v29 = v28;
        objc_sync_enter(v29);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readProximityIntent_tags);
        objc_sync_exit(v29);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v30 = *(id *)(a1 + 104);
    v31 = v30;
    if (v30)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v30, "jsonRepresentation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = CFSTR("proximityIntent");
      }
      else
      {
        objc_msgSend(v30, "dictionaryRepresentation");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = CFSTR("proximity_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v32, v33);

    }
    -[GEOPDSearchIntent _readLocationIntent](a1);
    v34 = *(id *)(a1 + 88);
    v35 = v34;
    if (v34)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v34, "jsonRepresentation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = CFSTR("locationIntent");
      }
      else
      {
        objc_msgSend(v34, "dictionaryRepresentation");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = CFSTR("location_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v36, v37);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 148) & 4) == 0)
    {
      v38 = *(void **)(a1 + 8);
      if (v38)
      {
        v39 = v38;
        objc_sync_enter(v39);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAttributeIntent_tags);
        objc_sync_exit(v39);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v40 = *(id *)(a1 + 16);
    v41 = v40;
    if (v40)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v40, "jsonRepresentation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = CFSTR("attributeIntent");
      }
      else
      {
        objc_msgSend(v40, "dictionaryRepresentation");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = CFSTR("attribute_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v42, v43);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 148) & 0x40) == 0)
    {
      v44 = *(void **)(a1 + 8);
      if (v44)
      {
        v45 = v44;
        objc_sync_enter(v45);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readClientResolvedIntent_tags);
        objc_sync_exit(v45);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v46 = *(id *)(a1 + 48);
    v47 = v46;
    if (v46)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v46, "jsonRepresentation");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("clientResolvedIntent");
      }
      else
      {
        objc_msgSend(v46, "dictionaryRepresentation");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = CFSTR("client_resolved_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v48, v49);

    }
    -[GEOPDSearchIntent _readSearchFilterIntent](a1);
    v50 = *(id *)(a1 + 112);
    v51 = v50;
    if (v50)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v50, "jsonRepresentation");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = CFSTR("searchFilterIntent");
      }
      else
      {
        objc_msgSend(v50, "dictionaryRepresentation");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = CFSTR("search_filter_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v52, v53);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 148) & 0x80) == 0)
    {
      v54 = *(void **)(a1 + 8);
      if (v54)
      {
        v55 = v54;
        objc_sync_enter(v55);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readDirectionIntent_tags_1);
        objc_sync_exit(v55);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v56 = *(id *)(a1 + 56);
    v57 = v56;
    if (v56)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v56, "jsonRepresentation");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("directionIntent");
      }
      else
      {
        objc_msgSend(v56, "dictionaryRepresentation");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = CFSTR("direction_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v58, v59);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 0x80) == 0)
    {
      v60 = *(void **)(a1 + 8);
      if (v60)
      {
        v61 = v60;
        objc_sync_enter(v61);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTransitIntent_tags);
        objc_sync_exit(v61);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v62 = *(id *)(a1 + 120);
    v63 = v62;
    if (v62)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v62, "jsonRepresentation");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = CFSTR("transitIntent");
      }
      else
      {
        objc_msgSend(v62, "dictionaryRepresentation");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = CFSTR("transit_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v64, v65);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 0x10) == 0)
    {
      v66 = *(void **)(a1 + 8);
      if (v66)
      {
        v67 = v66;
        objc_sync_enter(v67);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readPhoneNumberIntent_tags);
        objc_sync_exit(v67);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v68 = *(id *)(a1 + 96);
    v69 = v68;
    if (v68)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v68, "jsonRepresentation");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = CFSTR("phoneNumberIntent");
      }
      else
      {
        objc_msgSend(v68, "dictionaryRepresentation");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = CFSTR("phone_number_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v70, v71);

    }
    if ((*(_BYTE *)(a1 + 148) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 140));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2)
        v73 = CFSTR("intentSpanIndex");
      else
        v73 = CFSTR("intent_span_index");
      objc_msgSend(v4, "setObject:forKey:", v72, v73);

    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    if ((*(_BYTE *)(a1 + 149) & 2) == 0)
    {
      v74 = *(void **)(a1 + 8);
      if (v74)
      {
        v75 = v74;
        objc_sync_enter(v75);
        GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readKeywordIntent_tags);
        objc_sync_exit(v75);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
    v76 = *(id *)(a1 + 72);
    v77 = v76;
    if (v76)
    {
      if ((a2 & 1) != 0)
      {
        objc_msgSend(v76, "jsonRepresentation");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = CFSTR("keywordIntent");
      }
      else
      {
        objc_msgSend(v76, "dictionaryRepresentation");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = CFSTR("keyword_intent");
      }
      objc_msgSend(v4, "setObject:forKey:", v78, v79);

    }
    if (*(_QWORD *)(a1 + 80))
    {
      -[GEOPDSearchIntent _readLanguageCodes](a1);
      v80 = *(id *)(a1 + 80);
      if (a2)
        v81 = CFSTR("languageCode");
      else
        v81 = CFSTR("language_code");
      objc_msgSend(v4, "setObject:forKey:", v80, v81);

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
  return -[GEOPDSearchIntent _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 136));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_726;
      else
        v6 = (int *)&readAll__nonRecursiveTag_727;
      GEOPDSearchIntentReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchIntentCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 136));
  }
}

- (id)_initWithDictionary:(unsigned int)a3 isJSON:
{
  id v4;
  const __CFString *v5;
  void *v6;
  id v7;
  int v8;
  const __CFString *v9;
  void *v10;
  GEOPDSearchCategoryIntent *v11;
  GEOPDSearchCategoryIntent *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  const __CFString *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  GEOPDSearchTokenSet *v27;
  void *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  GEOPDSearchKeyValueDoublePair *v45;
  void *v46;
  uint64_t v47;
  const __CFString *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t m;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  GEOPDSearchKeyValuePair *v71;
  void *v72;
  uint64_t v73;
  const __CFString *v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t n;
  void *v80;
  os_unfair_lock_s *v81;
  void *v82;
  id v83;
  const __CFString *v84;
  void *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t ii;
  void *v90;
  void *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  uint64_t v95;
  void *v96;
  GEOPDSearchCategoryMapping *v97;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  uint64_t v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  GEOPDSearchRelatedCategory *v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  const __CFString *v115;
  void *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  GEOPDSearchKeywordMapping *v122;
  void *v123;
  uint64_t v124;
  id v125;
  const __CFString *v126;
  void *v127;
  GEOPDSearchChainIntent *v128;
  GEOPDSearchChainIntent *v129;
  id v130;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  id v135;
  const __CFString *v136;
  void *v137;
  void *v138;
  id v139;
  const __CFString *v140;
  void *v141;
  void *v142;
  id v143;
  const __CFString *v144;
  void *v145;
  GEOPDSearchTokenSet *v146;
  void *v147;
  id v148;
  void *v149;
  char v150;
  void *v151;
  char v152;
  const __CFString *v153;
  void *v154;
  uint64_t v155;
  const __CFString *v156;
  void *v157;
  char v158;
  const __CFString *v159;
  void *v160;
  id v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t jj;
  void *v165;
  void *v166;
  const __CFString *v167;
  void *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  void *v173;
  GEOPDSearchKeyValueDoublePair *v174;
  void *v175;
  uint64_t v176;
  const __CFString *v177;
  id v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t kk;
  void *v182;
  void *v183;
  id v184;
  const __CFString *v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  GEOPDSearchBrandRelationship *v192;
  void *v193;
  uint64_t v194;
  const __CFString *v195;
  void *v196;
  id v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  GEOPDSearchChainInfo *v202;
  void *v203;
  uint64_t v204;
  const __CFString *v205;
  void *v206;
  id v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t mm;
  void *v211;
  void *v212;
  id v213;
  const __CFString *v214;
  void *v215;
  GEOPDSearchBusinessIntent *v216;
  GEOPDSearchBusinessIntent *v217;
  id v218;
  uint64_t v219;
  void *v220;
  void *v221;
  id v222;
  const __CFString *v223;
  void *v224;
  GEOPDSearchTokenSet *v225;
  void *v226;
  id v227;
  const __CFString *v228;
  void *v229;
  uint64_t v230;
  void *v231;
  GEOLatLng *v232;
  GEOLatLng *v233;
  GEOLatLng *v234;
  GEOLatLng *v235;
  void *v236;
  id v237;
  int v238;
  const __CFString *v239;
  void *v240;
  id v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t nn;
  void *v245;
  void *v246;
  id v247;
  const __CFString *v248;
  void *v249;
  id v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  GEOPDSearchKeywordMapping *v255;
  void *v256;
  uint64_t v257;
  id v258;
  const __CFString *v259;
  void *v260;
  GEOPDSearchGeoIntent *v261;
  GEOPDSearchGeoIntent *v262;
  id v263;
  uint64_t v264;
  void *v265;
  void *v266;
  id v267;
  const __CFString *v268;
  void *v269;
  GEOPDSearchTokenSet *v270;
  void *v271;
  id v272;
  const __CFString *v273;
  void *v274;
  uint64_t v275;
  const __CFString *v276;
  void *v277;
  int v278;
  const __CFString *v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  GEOLatLng *v284;
  GEOLatLng *v285;
  GEOLatLng *v286;
  GEOLatLng *v287;
  const __CFString *v288;
  void *v289;
  GEOMapRegion *v290;
  GEOMapRegion *v291;
  GEOMapRegion *v292;
  GEOMapRegion *v293;
  const __CFString *v294;
  void *v295;
  void *v296;
  id v297;
  const __CFString *v298;
  void *v299;
  void *v300;
  id v301;
  const __CFString *v302;
  void *v303;
  GEOMapRegion *v304;
  GEOMapRegion *v305;
  GEOMapRegion *v306;
  GEOMapRegion *v307;
  void *v308;
  GEOStructuredAddress *v309;
  GEOStructuredAddress *v310;
  GEOStructuredAddress *v311;
  GEOStructuredAddress *v312;
  id v313;
  const __CFString *v314;
  void *v315;
  GEOPDSearchProximityIntent *v316;
  GEOPDSearchProximityIntent *v317;
  id v318;
  uint64_t v319;
  void *v320;
  void *v321;
  id v322;
  const __CFString *v323;
  void *v324;
  GEOPDSearchTokenSet *v325;
  void *v326;
  id v327;
  id v328;
  const __CFString *v329;
  void *v330;
  GEOPDSearchLocationIntent *v331;
  GEOPDSearchLocationIntent *v332;
  id v333;
  uint64_t v334;
  const __CFString *v335;
  void *v336;
  GEOMapRegion *v337;
  GEOMapRegion *v338;
  GEOMapRegion *v339;
  GEOMapRegion *v340;
  void *v341;
  GEOLatLng *v342;
  GEOLatLng *v343;
  GEOLatLng *v344;
  GEOLatLng *v345;
  const __CFString *v346;
  void *v347;
  id v348;
  int v349;
  const __CFString *v350;
  void *v351;
  uint64_t v352;
  const __CFString *v353;
  void *v354;
  char v355;
  const __CFString *v356;
  void *v357;
  uint64_t v358;
  const __CFString *v359;
  void *v360;
  char v361;
  const __CFString *v362;
  void *v363;
  GEOMapRegion *v364;
  GEOMapRegion *v365;
  GEOMapRegion *v366;
  GEOMapRegion *v367;
  id v368;
  const __CFString *v369;
  void *v370;
  GEOPDSearchAttributeIntent *v371;
  GEOPDSearchAttributeIntent *v372;
  id v373;
  uint64_t v374;
  void *v375;
  void *v376;
  id v377;
  const __CFString *v378;
  void *v379;
  void *v380;
  id v381;
  const __CFString *v382;
  void *v383;
  GEOPDSearchTokenSet *v384;
  void *v385;
  id v386;
  const __CFString *v387;
  void *v388;
  void *v389;
  id v390;
  const __CFString *v391;
  void *v392;
  char v393;
  const __CFString *v394;
  void *v395;
  GEOPDSearchStructuredAttribute *v396;
  void *v397;
  id v398;
  id v399;
  const __CFString *v400;
  void *v401;
  GEOPDSearchClientResolvedIntent *v402;
  GEOPDSearchClientResolvedIntent *v403;
  id v404;
  uint64_t v405;
  void *v406;
  void *v407;
  id v408;
  const __CFString *v409;
  void *v410;
  id v411;
  int v412;
  id v413;
  const __CFString *v414;
  void *v415;
  GEOPDSearchSearchFilterIntent *v416;
  id v417;
  const __CFString *v418;
  void *v419;
  GEOPDSSearchFilter *v420;
  void *v421;
  id v422;
  GEOPDSearchSearchFilterIntent *v423;
  const __CFString *v424;
  void *v425;
  GEOPDSearchDirectionIntent *v426;
  id v427;
  void *v428;
  GEOPDDirectionIntent *v429;
  void *v430;
  id v431;
  GEOPDSearchDirectionIntent *v432;
  const __CFString *v433;
  void *v434;
  GEOPDSearchTransitIntent *v435;
  id v436;
  void *v437;
  void *v438;
  id v439;
  const __CFString *v440;
  void *v441;
  GEOPDSearchTokenSet *v442;
  void *v443;
  id v444;
  const __CFString *v445;
  void *v446;
  uint64_t v447;
  const __CFString *v448;
  void *v449;
  id v450;
  int v451;
  GEOPDSearchTransitIntent *v452;
  const __CFString *v453;
  void *v454;
  GEOPDSearchPhoneNumberIntent *v455;
  GEOPDSearchPhoneNumberIntent *v456;
  id v457;
  uint64_t v458;
  const __CFString *v459;
  void *v460;
  void *v461;
  id v462;
  const __CFString *v463;
  void *v464;
  GEOPDSearchTokenSet *v465;
  void *v466;
  id v467;
  id v468;
  const __CFString *v469;
  void *v470;
  int v471;
  const __CFString *v472;
  void *v473;
  GEOPDSearchKeywordIntent *v474;
  GEOPDSearchKeywordIntent *v475;
  id v476;
  uint64_t v477;
  void *v478;
  void *v479;
  id v480;
  const __CFString *v481;
  void *v482;
  GEOPDSearchTokenSet *v483;
  void *v484;
  id v485;
  const __CFString *v486;
  void *v487;
  char v488;
  id v489;
  const __CFString *v490;
  void *v491;
  id v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t i1;
  void *v496;
  void *v497;
  void *v499;
  void *v500;
  void *v501;
  id v502;
  const __CFString *v503;
  const __CFString *v504;
  const __CFString *v505;
  id obj;
  uint64_t v507;
  void *v508;
  uint64_t v509;
  void *v510;
  void *v511;
  id v512;
  uint64_t v513;
  void *v514;
  void *v515;
  __int128 v517;
  __int128 v518;
  __int128 v519;
  __int128 v520;
  __int128 v521;
  __int128 v522;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  __int128 v528;
  __int128 v529;
  __int128 v530;
  __int128 v531;
  __int128 v532;
  __int128 v533;
  __int128 v534;
  __int128 v535;
  __int128 v536;
  __int128 v537;
  __int128 v538;
  __int128 v539;
  __int128 v540;
  __int128 v541;
  __int128 v542;
  __int128 v543;
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  __int128 v548;
  __int128 v549;
  __int128 v550;
  __int128 v551;
  __int128 v552;
  __int128 v553;
  __int128 v554;
  __int128 v555;
  __int128 v556;
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  _BYTE v561[128];
  __int128 v562;
  __int128 v563;
  __int128 v564;
  __int128 v565;
  __int128 v566;
  __int128 v567;
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  _BYTE v578[128];
  _BYTE v579[128];
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  _BYTE v588[128];
  _BYTE v589[128];
  uint64_t v590;

  v590 = *MEMORY[0x1E0C80C00];
  v502 = a2;
  v4 = (id)objc_msgSend(a1, "init");

  v512 = v4;
  if (!v4)
    goto LABEL_817;
  if (a3)
    v5 = CFSTR("intentType");
  else
    v5 = CFSTR("intent_type");
  objc_msgSend(v502, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_CATEGORY")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_CHAIN")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_BUSINESS")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_GEO")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_PROXIMITY")) & 1) != 0)
    {
      v8 = 5;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_LOCATION")) & 1) != 0)
    {
      v8 = 6;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_ATTRIBUTE")) & 1) != 0)
    {
      v8 = 7;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_CLIENT_RESOLVED")) & 1) != 0)
    {
      v8 = 8;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_SEARCH_FILTER")) & 1) != 0)
    {
      v8 = 9;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_DIRECTION_INTENT")) & 1) != 0)
    {
      v8 = 10;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_TRANSIT")) & 1) != 0)
    {
      v8 = 11;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_PHONE_NUMBER")) & 1) != 0)
    {
      v8 = 12;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("INTENT_TYPE_KEYWORD")))
    {
      v8 = 13;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_39;
    v8 = objc_msgSend(v6, "intValue");
  }
  *((_DWORD *)v512 + 37) |= 0x10000u;
  *((_DWORD *)v512 + 37) |= 2u;
  *((_DWORD *)v512 + 36) = v8;
LABEL_39:

  if (a3)
    v9 = CFSTR("categoryIntent");
  else
    v9 = CFSTR("category_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v9);
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v10 = v500;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = [GEOPDSearchCategoryIntent alloc];
    if (v11)
    {
      v12 = v11;
      v13 = v500;
      v513 = -[GEOPDSearchCategoryIntent init](v12, "init");
      if (v513)
      {
        v501 = v13;
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("trigger"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = (void *)objc_msgSend(v14, "copy");
          v16 = v15;
          *(_WORD *)(v513 + 140) |= 0x800u;
          *(_WORD *)(v513 + 140) |= 0x1000u;
          objc_storeStrong((id *)(v513 + 120), v15);

        }
        if (a3)
          v17 = CFSTR("categoryId");
        else
          v17 = CFSTR("category_id");
        v505 = v17;
        objc_msgSend(v501, "objectForKeyedSubscript:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v555 = 0u;
          v556 = 0u;
          v553 = 0u;
          v554 = 0u;
          v19 = v18;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v553, v588, 16);
          if (v20)
          {
            v21 = *(_QWORD *)v554;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v554 != v21)
                  objc_enumerationMutation(v19);
                v23 = *(void **)(*((_QWORD *)&v553 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v24 = (void *)objc_msgSend(v23, "copy");
                  -[GEOPDSearchCategoryIntent addCategoryId:](v513, v24);

                }
              }
              v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v553, v588, 16);
            }
            while (v20);
          }

        }
        if (a3)
          v25 = CFSTR("tokenSet");
        else
          v25 = CFSTR("token_set");
        objc_msgSend(v501, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = [GEOPDSearchTokenSet alloc];
          if (v27)
            v28 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v27, v26, a3);
          else
            v28 = 0;
          v29 = v28;
          *(_WORD *)(v513 + 140) |= 0x400u;
          *(_WORD *)(v513 + 140) |= 0x1000u;
          objc_storeStrong((id *)(v513 + 112), v28);

        }
        if (a3)
          v30 = CFSTR("canonicalName");
        else
          v30 = CFSTR("canonical_name");
        objc_msgSend(v501, "objectForKeyedSubscript:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v551 = 0u;
          v552 = 0u;
          v549 = 0u;
          v550 = 0u;
          v32 = v31;
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v549, &v584, 16);
          if (v33)
          {
            v34 = *(_QWORD *)v550;
            do
            {
              for (j = 0; j != v33; ++j)
              {
                if (*(_QWORD *)v550 != v34)
                  objc_enumerationMutation(v32);
                v36 = *(void **)(*((_QWORD *)&v549 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v37 = (void *)objc_msgSend(v36, "copy");
                  -[GEOPDSearchCategoryIntent addCanonicalName:](v513, v37);

                }
              }
              v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v549, &v584, 16);
            }
            while (v33);
          }

        }
        if (a3)
          v38 = CFSTR("featureMap");
        else
          v38 = CFSTR("feature_map");
        objc_msgSend(v501, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v547 = 0u;
          v548 = 0u;
          v545 = 0u;
          v546 = 0u;
          v40 = v39;
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v545, &v580, 16);
          if (v41)
          {
            v42 = *(_QWORD *)v546;
            do
            {
              v43 = 0;
              do
              {
                if (*(_QWORD *)v546 != v42)
                  objc_enumerationMutation(v40);
                v44 = *(void **)(*((_QWORD *)&v545 + 1) + 8 * v43);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v45 = [GEOPDSearchKeyValueDoublePair alloc];
                  if (v45)
                    v46 = (void *)-[GEOPDSearchKeyValueDoublePair _initWithDictionary:isJSON:]((uint64_t)v45, v44);
                  else
                    v46 = 0;
                  -[GEOPDSearchCategoryIntent addFeatureMap:](v513, v46);

                }
                ++v43;
              }
              while (v41 != v43);
              v47 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v545, &v580, 16);
              v41 = v47;
            }
            while (v47);
          }

        }
        if (a3)
          v48 = CFSTR("expandedCategoryId");
        else
          v48 = CFSTR("expanded_category_id");
        objc_msgSend(v501, "objectForKeyedSubscript:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v543 = 0u;
          v544 = 0u;
          v541 = 0u;
          v542 = 0u;
          v50 = v49;
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v541, v579, 16);
          if (v51)
          {
            v52 = *(_QWORD *)v542;
            do
            {
              for (k = 0; k != v51; ++k)
              {
                if (*(_QWORD *)v542 != v52)
                  objc_enumerationMutation(v50);
                v54 = *(void **)(*((_QWORD *)&v541 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v55 = (void *)objc_msgSend(v54, "copy");
                  -[GEOPDSearchCategoryIntent addExpandedCategoryId:](v513, v55);

                }
              }
              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v541, v579, 16);
            }
            while (v51);
          }

        }
        if (a3)
          v56 = CFSTR("negativeCategory");
        else
          v56 = CFSTR("negative_category");
        objc_msgSend(v501, "objectForKeyedSubscript:", v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v539 = 0u;
          v540 = 0u;
          v537 = 0u;
          v538 = 0u;
          v58 = v57;
          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v537, v578, 16);
          if (v59)
          {
            v60 = *(_QWORD *)v538;
            do
            {
              for (m = 0; m != v59; ++m)
              {
                if (*(_QWORD *)v538 != v60)
                  objc_enumerationMutation(v58);
                v62 = *(void **)(*((_QWORD *)&v537 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v63 = (void *)objc_msgSend(v62, "copy");
                  -[GEOPDSearchCategoryIntent addNegativeCategory:](v513, v63);

                }
              }
              v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v537, v578, 16);
            }
            while (v59);
          }

        }
        if (a3)
          v64 = CFSTR("modernToLegacyIdMapping");
        else
          v64 = CFSTR("modern_to_legacy_id_mapping");
        objc_msgSend(v501, "objectForKeyedSubscript:", v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v535 = 0u;
          v536 = 0u;
          v533 = 0u;
          v534 = 0u;
          v66 = v65;
          v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v533, &v574, 16);
          if (v67)
          {
            v68 = *(_QWORD *)v534;
            do
            {
              v69 = 0;
              do
              {
                if (*(_QWORD *)v534 != v68)
                  objc_enumerationMutation(v66);
                v70 = *(void **)(*((_QWORD *)&v533 + 1) + 8 * v69);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v71 = [GEOPDSearchKeyValuePair alloc];
                  if (v71)
                    v72 = (void *)-[GEOPDSearchKeyValuePair _initWithDictionary:isJSON:]((uint64_t)v71, v70);
                  else
                    v72 = 0;
                  -[GEOPDSearchCategoryIntent addModernToLegacyIdMapping:](v513, v72);

                }
                ++v69;
              }
              while (v67 != v69);
              v73 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v533, &v574, 16);
              v67 = v73;
            }
            while (v73);
          }

        }
        if (a3)
          v74 = CFSTR("keywordMuid");
        else
          v74 = CFSTR("keyword_muid");
        objc_msgSend(v501, "objectForKeyedSubscript:", v74);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v531 = 0u;
          v532 = 0u;
          v529 = 0u;
          v530 = 0u;
          v76 = v75;
          v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v529, &v570, 16);
          if (v77)
          {
            v78 = *(_QWORD *)v530;
            do
            {
              for (n = 0; n != v77; ++n)
              {
                if (*(_QWORD *)v530 != v78)
                  objc_enumerationMutation(v76);
                v80 = *(void **)(*((_QWORD *)&v529 + 1) + 8 * n);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v80, "unsignedLongLongValue");
                  v81 = (os_unfair_lock_s *)v513;
                  os_unfair_lock_lock((os_unfair_lock_t)(v513 + 136));
                  if ((*(_WORD *)(v513 + 140) & 1) == 0)
                  {
                    v82 = *(void **)(v513 + 8);
                    if (v82)
                    {
                      v83 = v82;
                      objc_sync_enter(v83);
                      GEOPDSearchCategoryIntentReadSpecified(v513, *(_QWORD *)(v513 + 8), (int *)&_readKeywordMuids_tags_294);
                      objc_sync_exit(v83);

                      v81 = (os_unfair_lock_s *)v513;
                    }
                  }
                  os_unfair_lock_unlock(v81 + 34);
                  PBRepeatedUInt64Add();
                  os_unfair_lock_lock_with_options();
                  *(_WORD *)(v513 + 140) |= 1u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v513 + 136));
                  *(_WORD *)(v513 + 140) |= 0x1000u;
                }
              }
              v77 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v529, &v570, 16);
            }
            while (v77);
          }

        }
        if (a3)
          v84 = CFSTR("legacyCategoryId");
        else
          v84 = CFSTR("legacy_category_id");
        objc_msgSend(v501, "objectForKeyedSubscript:", v84);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v527 = 0u;
          v528 = 0u;
          v525 = 0u;
          v526 = 0u;
          v86 = v85;
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v525, &v566, 16);
          if (v87)
          {
            v88 = *(_QWORD *)v526;
            do
            {
              for (ii = 0; ii != v87; ++ii)
              {
                if (*(_QWORD *)v526 != v88)
                  objc_enumerationMutation(v86);
                v90 = *(void **)(*((_QWORD *)&v525 + 1) + 8 * ii);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v91 = (void *)objc_msgSend(v90, "copy");
                  -[GEOPDSearchCategoryIntent addLegacyCategoryId:](v513, v91);

                }
              }
              v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v525, &v566, 16);
            }
            while (v87);
          }

        }
        if (a3)
          v92 = CFSTR("categoryMappings");
        else
          v92 = CFSTR("category_mappings");
        objc_msgSend(v501, "objectForKeyedSubscript:", v92);
        v499 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v523 = 0u;
          v524 = 0u;
          v521 = 0u;
          v522 = 0u;
          obj = v499;
          v509 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v521, &v562, 16);
          if (v509)
          {
            v507 = *(_QWORD *)v522;
            if (a3)
              v93 = CFSTR("densityScore");
            else
              v93 = CFSTR("density_score");
            v94 = CFSTR("related_categories");
            if (a3)
              v94 = CFSTR("relatedCategories");
            v503 = v94;
            v504 = v93;
            do
            {
              v95 = 0;
              do
              {
                if (*(_QWORD *)v522 != v507)
                  objc_enumerationMutation(obj);
                v96 = *(void **)(*((_QWORD *)&v521 + 1) + 8 * v95);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v97 = [GEOPDSearchCategoryMapping alloc];
                  if (v97)
                  {
                    v98 = v96;
                    v99 = -[GEOPDSearchCategoryMapping init](v97, "init");
                    if (v99)
                    {
                      objc_msgSend(v98, "objectForKeyedSubscript:", v505);
                      v100 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v101 = (void *)objc_msgSend(v100, "copy");
                        v102 = v101;
                        *(_BYTE *)(v99 + 52) |= 2u;
                        *(_BYTE *)(v99 + 52) |= 8u;
                        objc_storeStrong((id *)(v99 + 16), v101);

                      }
                      objc_msgSend(v98, "objectForKeyedSubscript:", v504);
                      v103 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v104 = objc_msgSend(v103, "longLongValue");
                        *(_BYTE *)(v99 + 52) |= 8u;
                        *(_BYTE *)(v99 + 52) |= 1u;
                        *(_QWORD *)(v99 + 24) = v104;
                      }

                      objc_msgSend(v98, "objectForKeyedSubscript:", v503);
                      v105 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v559 = 0u;
                        v560 = 0u;
                        v557 = 0u;
                        v558 = 0u;
                        v106 = v105;
                        v107 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v557, v589, 16);
                        if (v107)
                        {
                          v108 = *(_QWORD *)v558;
                          do
                          {
                            v109 = 0;
                            do
                            {
                              if (*(_QWORD *)v558 != v108)
                                objc_enumerationMutation(v106);
                              v110 = *(void **)(*((_QWORD *)&v557 + 1) + 8 * v109);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v111 = [GEOPDSearchRelatedCategory alloc];
                                if (v111)
                                  v112 = (void *)-[GEOPDSearchRelatedCategory _initWithDictionary:isJSON:](v111, v110, a3);
                                else
                                  v112 = 0;
                                -[GEOPDSearchCategoryMapping addRelatedCategories:](v99, v112);

                              }
                              ++v109;
                            }
                            while (v107 != v109);
                            v113 = objc_msgSend(v106, "countByEnumeratingWithState:objects:count:", &v557, v589, 16);
                            v107 = v113;
                          }
                          while (v113);
                        }

                      }
                    }

                  }
                  else
                  {
                    v99 = 0;
                  }
                  -[GEOPDSearchCategoryIntent addCategoryMappings:](v513, (void *)v99);

                }
                ++v95;
              }
              while (v95 != v509);
              v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v521, &v562, 16);
              v509 = v114;
            }
            while (v114);
          }

        }
        if (a3)
          v115 = CFSTR("keywordMapping");
        else
          v115 = CFSTR("keyword_mapping");
        objc_msgSend(v501, "objectForKeyedSubscript:", v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v559 = 0u;
          v560 = 0u;
          v557 = 0u;
          v558 = 0u;
          v117 = v116;
          v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v557, v589, 16);
          if (v118)
          {
            v119 = *(_QWORD *)v558;
            do
            {
              v120 = 0;
              do
              {
                if (*(_QWORD *)v558 != v119)
                  objc_enumerationMutation(v117);
                v121 = *(void **)(*((_QWORD *)&v557 + 1) + 8 * v120);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v122 = [GEOPDSearchKeywordMapping alloc];
                  if (v122)
                    v123 = (void *)-[GEOPDSearchKeywordMapping _initWithDictionary:isJSON:](v122, v121, a3);
                  else
                    v123 = 0;
                  -[GEOPDSearchCategoryIntent addKeywordMapping:](v513, v123);

                }
                ++v120;
              }
              while (v118 != v120);
              v124 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v557, v589, 16);
              v118 = v124;
            }
            while (v124);
          }

        }
        v13 = v501;
      }

    }
    else
    {
      v513 = 0;
    }
    v125 = (id)v513;
    *((_DWORD *)v512 + 37) |= 0x10u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 4, (id)v513);

    v10 = v500;
  }

  if (a3)
    v126 = CFSTR("chainIntent");
  else
    v126 = CFSTR("chain_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v126);
  v514 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v127 = v514;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v128 = [GEOPDSearchChainIntent alloc];
    if (v128)
    {
      v129 = v128;
      v130 = v514;
      v131 = -[GEOPDSearchChainIntent init](v129, "init");
      if (v131)
      {
        v132 = v130;
        objc_msgSend(v130, "objectForKeyedSubscript:", CFSTR("trigger"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v134 = (void *)objc_msgSend(v133, "copy");
          v135 = v134;
          *(_WORD *)(v131 + 136) |= 0x2000u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 112), v134);

        }
        if (a3)
          v136 = CFSTR("chainId");
        else
          v136 = CFSTR("chain_id");
        objc_msgSend(v132, "objectForKeyedSubscript:", v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v138 = (void *)objc_msgSend(v137, "copy");
          v139 = v138;
          *(_WORD *)(v131 + 136) |= 0x80u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 64), v138);

        }
        if (a3)
          v140 = CFSTR("geminiBrand");
        else
          v140 = CFSTR("gemini_brand");
        objc_msgSend(v132, "objectForKeyedSubscript:", v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v142 = (void *)objc_msgSend(v141, "copy");
          v143 = v142;
          *(_WORD *)(v131 + 136) |= 0x200u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 80), v142);

        }
        if (a3)
          v144 = CFSTR("tokenSet");
        else
          v144 = CFSTR("token_set");
        objc_msgSend(v132, "objectForKeyedSubscript:", v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v146 = [GEOPDSearchTokenSet alloc];
          if (v146)
            v147 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v146, v145, a3);
          else
            v147 = 0;
          v148 = v147;
          *(_WORD *)(v131 + 136) |= 0x1000u;
          *(_WORD *)(v131 + 136) |= 0x4000u;
          objc_storeStrong((id *)(v131 + 104), v147);

        }
        objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("isLocalChain"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v150 = objc_msgSend(v149, "BOOLValue");
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 4u;
          *(_BYTE *)(v131 + 133) = v150;
        }

        objc_msgSend(v132, "objectForKeyedSubscript:", CFSTR("isChainInSameCountry"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v152 = objc_msgSend(v151, "BOOLValue");
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 2u;
          *(_BYTE *)(v131 + 132) = v152;
        }

        if (a3)
          v153 = CFSTR("brandMuid");
        else
          v153 = CFSTR("brand_muid");
        objc_msgSend(v132, "objectForKeyedSubscript:", v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v155 = objc_msgSend(v154, "unsignedLongLongValue");
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 1u;
          *(_QWORD *)(v131 + 40) = v155;
        }

        if (a3)
          v156 = CFSTR("isFromBrandProfile");
        else
          v156 = CFSTR("is_from_brand_profile");
        objc_msgSend(v132, "objectForKeyedSubscript:", v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v158 = objc_msgSend(v157, "BOOLValue");
          *(_WORD *)(v131 + 136) |= 0x4000u;
          *(_WORD *)(v131 + 136) |= 8u;
          *(_BYTE *)(v131 + 134) = v158;
        }

        if (a3)
          v159 = CFSTR("categoryId");
        else
          v159 = CFSTR("category_id");
        objc_msgSend(v132, "objectForKeyedSubscript:", v159);
        v160 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v577 = 0u;
          v576 = 0u;
          v575 = 0u;
          v574 = 0u;
          v161 = v160;
          v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v574, v589, 16);
          if (v162)
          {
            v163 = *(_QWORD *)v575;
            do
            {
              for (jj = 0; jj != v162; ++jj)
              {
                if (*(_QWORD *)v575 != v163)
                  objc_enumerationMutation(v161);
                v165 = *(void **)(*((_QWORD *)&v574 + 1) + 8 * jj);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v166 = (void *)objc_msgSend(v165, "copy");
                  -[GEOPDSearchChainIntent addCategoryId:](v131, v166);

                }
              }
              v162 = objc_msgSend(v161, "countByEnumeratingWithState:objects:count:", &v574, v589, 16);
            }
            while (v162);
          }

        }
        if (a3)
          v167 = CFSTR("featureMap");
        else
          v167 = CFSTR("feature_map");
        objc_msgSend(v132, "objectForKeyedSubscript:", v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v573 = 0u;
          v572 = 0u;
          v571 = 0u;
          v570 = 0u;
          v169 = v168;
          v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v570, v588, 16);
          if (v170)
          {
            v171 = *(_QWORD *)v571;
            do
            {
              v172 = 0;
              do
              {
                if (*(_QWORD *)v571 != v171)
                  objc_enumerationMutation(v169);
                v173 = *(void **)(*((_QWORD *)&v570 + 1) + 8 * v172);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v174 = [GEOPDSearchKeyValueDoublePair alloc];
                  if (v174)
                    v175 = (void *)-[GEOPDSearchKeyValueDoublePair _initWithDictionary:isJSON:]((uint64_t)v174, v173);
                  else
                    v175 = 0;
                  -[GEOPDSearchChainIntent addFeatureMap:](v131, v175);

                }
                ++v172;
              }
              while (v170 != v172);
              v176 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v570, v588, 16);
              v170 = v176;
            }
            while (v176);
          }

        }
        if (a3)
          v177 = CFSTR("brandMuids");
        else
          v177 = CFSTR("brand_muids");
        objc_msgSend(v132, "objectForKeyedSubscript:", v177);
        v510 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v569 = 0u;
          v568 = 0u;
          v567 = 0u;
          v566 = 0u;
          v178 = v510;
          v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v566, &v584, 16);
          if (v179)
          {
            v180 = *(_QWORD *)v567;
            do
            {
              for (kk = 0; kk != v179; ++kk)
              {
                if (*(_QWORD *)v567 != v180)
                  objc_enumerationMutation(v178);
                v182 = *(void **)(*((_QWORD *)&v566 + 1) + 8 * kk);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v182, "unsignedLongLongValue");
                  os_unfair_lock_lock((os_unfair_lock_t)(v131 + 128));
                  if ((*(_WORD *)(v131 + 136) & 0x10) == 0)
                  {
                    v183 = *(void **)(v131 + 8);
                    if (v183)
                    {
                      v184 = v183;
                      objc_sync_enter(v184);
                      GEOPDSearchChainIntentReadSpecified(v131, *(_QWORD *)(v131 + 8), (int *)&_readBrandMuids_tags);
                      objc_sync_exit(v184);

                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v131 + 128));
                  PBRepeatedUInt64Add();
                  os_unfair_lock_lock_with_options();
                  *(_WORD *)(v131 + 136) |= 0x10u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v131 + 128));
                  *(_WORD *)(v131 + 136) |= 0x4000u;
                }
              }
              v179 = objc_msgSend(v178, "countByEnumeratingWithState:objects:count:", &v566, &v584, 16);
            }
            while (v179);
          }

        }
        if (a3)
          v185 = CFSTR("relatedBrand");
        else
          v185 = CFSTR("related_brand");
        objc_msgSend(v132, "objectForKeyedSubscript:", v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v564 = 0u;
          v565 = 0u;
          v562 = 0u;
          v563 = 0u;
          v187 = v186;
          v188 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v562, &v580, 16);
          if (v188)
          {
            v189 = *(_QWORD *)v563;
            do
            {
              v190 = 0;
              do
              {
                if (*(_QWORD *)v563 != v189)
                  objc_enumerationMutation(v187);
                v191 = *(void **)(*((_QWORD *)&v562 + 1) + 8 * v190);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v192 = [GEOPDSearchBrandRelationship alloc];
                  if (v192)
                    v193 = (void *)-[GEOPDSearchBrandRelationship _initWithDictionary:isJSON:]((uint64_t)v192, v191, a3);
                  else
                    v193 = 0;
                  -[GEOPDSearchChainIntent addRelatedBrand:](v131, v193);

                }
                ++v190;
              }
              while (v188 != v190);
              v194 = objc_msgSend(v187, "countByEnumeratingWithState:objects:count:", &v562, &v580, 16);
              v188 = v194;
            }
            while (v194);
          }

        }
        if (a3)
          v195 = CFSTR("brandRelationshipInfo");
        else
          v195 = CFSTR("brand_relationship_info");
        objc_msgSend(v132, "objectForKeyedSubscript:", v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v559 = 0u;
          v560 = 0u;
          v557 = 0u;
          v558 = 0u;
          v197 = v196;
          v198 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v557, v579, 16);
          if (v198)
          {
            v199 = *(_QWORD *)v558;
            do
            {
              v200 = 0;
              do
              {
                if (*(_QWORD *)v558 != v199)
                  objc_enumerationMutation(v197);
                v201 = *(void **)(*((_QWORD *)&v557 + 1) + 8 * v200);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v202 = [GEOPDSearchChainInfo alloc];
                  if (v202)
                    v203 = (void *)-[GEOPDSearchChainInfo _initWithDictionary:isJSON:](v202, v201, a3);
                  else
                    v203 = 0;
                  -[GEOPDSearchChainIntent addBrandRelationshipInfo:](v131, v203);

                }
                ++v200;
              }
              while (v198 != v200);
              v204 = objc_msgSend(v197, "countByEnumeratingWithState:objects:count:", &v557, v579, 16);
              v198 = v204;
            }
            while (v204);
          }

        }
        if (a3)
          v205 = CFSTR("prefCategoryId");
        else
          v205 = CFSTR("pref_category_id");
        objc_msgSend(v132, "objectForKeyedSubscript:", v205);
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v555 = 0u;
          v556 = 0u;
          v553 = 0u;
          v554 = 0u;
          v207 = v206;
          v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v553, v578, 16);
          if (v208)
          {
            v209 = *(_QWORD *)v554;
            do
            {
              for (mm = 0; mm != v208; ++mm)
              {
                if (*(_QWORD *)v554 != v209)
                  objc_enumerationMutation(v207);
                v211 = *(void **)(*((_QWORD *)&v553 + 1) + 8 * mm);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v212 = (void *)objc_msgSend(v211, "copy");
                  -[GEOPDSearchChainIntent addPrefCategoryId:](v131, v212);

                }
              }
              v208 = objc_msgSend(v207, "countByEnumeratingWithState:objects:count:", &v553, v578, 16);
            }
            while (v208);
          }

        }
        v130 = v132;
      }

    }
    else
    {
      v131 = 0;
    }
    v213 = (id)v131;
    *((_DWORD *)v512 + 37) |= 0x20u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 5, (id)v131);

    v127 = v514;
  }

  if (a3)
    v214 = CFSTR("businessIntent");
  else
    v214 = CFSTR("business_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v214);
  v515 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v215 = v515;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v216 = [GEOPDSearchBusinessIntent alloc];
    if (!v216)
    {
      v219 = 0;
      goto LABEL_457;
    }
    v217 = v216;
    v218 = v515;
    v219 = -[GEOPDSearchBusinessIntent init](v217, "init");
    if (!v219)
    {
LABEL_456:

LABEL_457:
      v258 = (id)v219;
      *((_DWORD *)v512 + 37) |= 8u;
      *((_DWORD *)v512 + 37) |= 0x10000u;
      objc_storeStrong((id *)v512 + 3, (id)v219);

      v215 = v515;
      goto LABEL_458;
    }
    v511 = v218;
    objc_msgSend(v218, "objectForKeyedSubscript:", CFSTR("name"));
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v221 = (void *)objc_msgSend(v220, "copy");
      v222 = v221;
      *(_BYTE *)(v219 + 96) |= 0x20u;
      *(_BYTE *)(v219 + 96) |= 0x80u;
      objc_storeStrong((id *)(v219 + 64), v221);

    }
    if (a3)
      v223 = CFSTR("tokenSet");
    else
      v223 = CFSTR("token_set");
    objc_msgSend(v511, "objectForKeyedSubscript:", v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v225 = [GEOPDSearchTokenSet alloc];
      if (v225)
        v226 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v225, v224, a3);
      else
        v226 = 0;
      v227 = v226;
      *(_BYTE *)(v219 + 96) |= 0x40u;
      *(_BYTE *)(v219 + 96) |= 0x80u;
      objc_storeStrong((id *)(v219 + 72), v226);

    }
    if (a3)
      v228 = CFSTR("businessId");
    else
      v228 = CFSTR("business_id");
    objc_msgSend(v511, "objectForKeyedSubscript:", v228);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v230 = objc_msgSend(v229, "unsignedLongLongValue");
      *(_BYTE *)(v219 + 96) |= 0x80u;
      *(_BYTE *)(v219 + 96) |= 1u;
      *(_QWORD *)(v219 + 40) = v230;
    }

    objc_msgSend(v511, "objectForKeyedSubscript:", CFSTR("center"));
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v232 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v233 = -[GEOLatLng initWithJSON:](v232, "initWithJSON:", v231);
      else
        v233 = -[GEOLatLng initWithDictionary:](v232, "initWithDictionary:", v231);
      v234 = v233;
      v235 = v233;
      *(_BYTE *)(v219 + 96) |= 8u;
      *(_BYTE *)(v219 + 96) |= 0x80u;
      objc_storeStrong((id *)(v219 + 48), v234);

    }
    objc_msgSend(v511, "objectForKeyedSubscript:", CFSTR("businessType"));
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v237 = v236;
      if ((objc_msgSend(v237, "isEqualToString:", CFSTR("DEFAULT")) & 1) != 0)
      {
        v238 = 0;
      }
      else if ((objc_msgSend(v237, "isEqualToString:", CFSTR("LOCAL_NAVIGATIONAL")) & 1) != 0)
      {
        v238 = 1;
      }
      else if (objc_msgSend(v237, "isEqualToString:", CFSTR("GLOBAL_NAVIGATIONAL")))
      {
        v238 = 2;
      }
      else
      {
        v238 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_420:

        if (a3)
          v239 = CFSTR("keywordMuid");
        else
          v239 = CFSTR("keyword_muid");
        objc_msgSend(v511, "objectForKeyedSubscript:", v239);
        v508 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v240 = v508;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v587 = 0u;
          v586 = 0u;
          v585 = 0u;
          v584 = 0u;
          v241 = v508;
          v242 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v584, v589, 16);
          if (v242)
          {
            v243 = *(_QWORD *)v585;
            do
            {
              for (nn = 0; nn != v242; ++nn)
              {
                if (*(_QWORD *)v585 != v243)
                  objc_enumerationMutation(v241);
                v245 = *(void **)(*((_QWORD *)&v584 + 1) + 8 * nn);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v245, "unsignedLongLongValue");
                  os_unfair_lock_lock((os_unfair_lock_t)(v219 + 88));
                  if ((*(_BYTE *)(v219 + 96) & 4) == 0)
                  {
                    v246 = *(void **)(v219 + 8);
                    if (v246)
                    {
                      v247 = v246;
                      objc_sync_enter(v247);
                      GEOPDSearchBusinessIntentReadSpecified(v219, *(_QWORD *)(v219 + 8), (int *)&_readKeywordMuids_tags);
                      objc_sync_exit(v247);

                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v219 + 88));
                  PBRepeatedUInt64Add();
                  os_unfair_lock_lock_with_options();
                  *(_BYTE *)(v219 + 96) |= 4u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v219 + 88));
                  *(_BYTE *)(v219 + 96) |= 0x80u;
                }
              }
              v242 = objc_msgSend(v241, "countByEnumeratingWithState:objects:count:", &v584, v589, 16);
            }
            while (v242);
          }

          v240 = v508;
        }

        if (a3)
          v248 = CFSTR("keywordMapping");
        else
          v248 = CFSTR("keyword_mapping");
        objc_msgSend(v511, "objectForKeyedSubscript:", v248);
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v583 = 0u;
          v582 = 0u;
          v581 = 0u;
          v580 = 0u;
          v250 = v249;
          v251 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v580, v588, 16);
          if (v251)
          {
            v252 = *(_QWORD *)v581;
            do
            {
              v253 = 0;
              do
              {
                if (*(_QWORD *)v581 != v252)
                  objc_enumerationMutation(v250);
                v254 = *(void **)(*((_QWORD *)&v580 + 1) + 8 * v253);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v255 = [GEOPDSearchKeywordMapping alloc];
                  if (v255)
                    v256 = (void *)-[GEOPDSearchKeywordMapping _initWithDictionary:isJSON:](v255, v254, a3);
                  else
                    v256 = 0;
                  -[GEOPDSearchBusinessIntent addKeywordMapping:](v219, v256);

                }
                ++v253;
              }
              while (v251 != v253);
              v257 = objc_msgSend(v250, "countByEnumeratingWithState:objects:count:", &v580, v588, 16);
              v251 = v257;
            }
            while (v257);
          }

        }
        v218 = v511;
        goto LABEL_456;
      }
      v238 = objc_msgSend(v236, "intValue");
    }
    *(_BYTE *)(v219 + 96) |= 0x80u;
    *(_BYTE *)(v219 + 96) |= 2u;
    *(_DWORD *)(v219 + 92) = v238;
    goto LABEL_420;
  }
LABEL_458:

  if (a3)
    v259 = CFSTR("geoIntent");
  else
    v259 = CFSTR("geo_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v259);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v261 = [GEOPDSearchGeoIntent alloc];
    if (v261)
    {
      v262 = v261;
      v263 = v260;
      v264 = -[GEOPDSearchGeoIntent init](v262, "init");
      if (v264)
      {
        objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("name"));
        v265 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v266 = (void *)objc_msgSend(v265, "copy");
          v267 = v266;
          *(_WORD *)(v264 + 112) |= 0x200u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 80), v266);

        }
        if (a3)
          v268 = CFSTR("tokenSet");
        else
          v268 = CFSTR("token_set");
        objc_msgSend(v263, "objectForKeyedSubscript:", v268);
        v269 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v270 = [GEOPDSearchTokenSet alloc];
          if (v270)
            v271 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v270, v269, a3);
          else
            v271 = 0;
          v272 = v271;
          *(_WORD *)(v264 + 112) |= 0x400u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 88), v271);

        }
        if (a3)
          v273 = CFSTR("geoId");
        else
          v273 = CFSTR("geo_id");
        objc_msgSend(v263, "objectForKeyedSubscript:", v273);
        v274 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v275 = objc_msgSend(v274, "longLongValue");
          *(_WORD *)(v264 + 112) |= 0x800u;
          *(_WORD *)(v264 + 112) |= 1u;
          *(_QWORD *)(v264 + 64) = v275;
        }

        if (a3)
          v276 = CFSTR("geoTypeId");
        else
          v276 = CFSTR("geo_type_id");
        objc_msgSend(v263, "objectForKeyedSubscript:", v276);
        v277 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v278 = objc_msgSend(v277, "intValue");
          *(_WORD *)(v264 + 112) |= 0x800u;
          *(_WORD *)(v264 + 112) |= 2u;
          *(_DWORD *)(v264 + 108) = v278;
        }

        if (a3)
          v279 = CFSTR("countryCode");
        else
          v279 = CFSTR("country_code");
        objc_msgSend(v263, "objectForKeyedSubscript:", v279);
        v280 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v281 = (void *)objc_msgSend(v280, "copy");
          v282 = v281;
          *(_WORD *)(v264 + 112) |= 0x10u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 32), v281);

        }
        objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("center"));
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v284 = [GEOLatLng alloc];
          if ((a3 & 1) != 0)
            v285 = -[GEOLatLng initWithJSON:](v284, "initWithJSON:", v283);
          else
            v285 = -[GEOLatLng initWithDictionary:](v284, "initWithDictionary:", v283);
          v286 = v285;
          v287 = v285;
          *(_WORD *)(v264 + 112) |= 8u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 24), v286);

        }
        if (a3)
          v288 = CFSTR("mapRegion");
        else
          v288 = CFSTR("map_region");
        objc_msgSend(v263, "objectForKeyedSubscript:", v288);
        v289 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v290 = [GEOMapRegion alloc];
          if ((a3 & 1) != 0)
            v291 = -[GEOMapRegion initWithJSON:](v290, "initWithJSON:", v289);
          else
            v291 = -[GEOMapRegion initWithDictionary:](v290, "initWithDictionary:", v289);
          v292 = v291;
          v293 = v291;
          *(_WORD *)(v264 + 112) |= 0x100u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 72), v292);

        }
        if (a3)
          v294 = CFSTR("doorNumber");
        else
          v294 = CFSTR("door_number");
        objc_msgSend(v263, "objectForKeyedSubscript:", v294);
        v295 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v296 = (void *)objc_msgSend(v295, "copy");
          v297 = v296;
          *(_WORD *)(v264 + 112) |= 0x80u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 56), v296);

        }
        if (a3)
          v298 = CFSTR("displayName");
        else
          v298 = CFSTR("display_name");
        objc_msgSend(v263, "objectForKeyedSubscript:", v298);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v300 = (void *)objc_msgSend(v299, "copy");
          v301 = v300;
          *(_WORD *)(v264 + 112) |= 0x40u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 48), v300);

        }
        if (a3)
          v302 = CFSTR("displayMapRegion");
        else
          v302 = CFSTR("display_map_region");
        objc_msgSend(v263, "objectForKeyedSubscript:", v302);
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v304 = [GEOMapRegion alloc];
          if ((a3 & 1) != 0)
            v305 = -[GEOMapRegion initWithJSON:](v304, "initWithJSON:", v303);
          else
            v305 = -[GEOMapRegion initWithDictionary:](v304, "initWithDictionary:", v303);
          v306 = v305;
          v307 = v305;
          *(_WORD *)(v264 + 112) |= 0x20u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 40), v306);

        }
        objc_msgSend(v263, "objectForKeyedSubscript:", CFSTR("address"));
        v308 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v309 = [GEOStructuredAddress alloc];
          if ((a3 & 1) != 0)
            v310 = -[GEOStructuredAddress initWithJSON:](v309, "initWithJSON:", v308);
          else
            v310 = -[GEOStructuredAddress initWithDictionary:](v309, "initWithDictionary:", v308);
          v311 = v310;
          v312 = v310;
          *(_WORD *)(v264 + 112) |= 4u;
          *(_WORD *)(v264 + 112) |= 0x800u;
          objc_storeStrong((id *)(v264 + 16), v311);

        }
      }

    }
    else
    {
      v264 = 0;
    }
    v313 = (id)v264;
    *((_DWORD *)v512 + 37) |= 0x100u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 8, (id)v264);

  }
  if (a3)
    v314 = CFSTR("proximityIntent");
  else
    v314 = CFSTR("proximity_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v314);
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v316 = [GEOPDSearchProximityIntent alloc];
    if (v316)
    {
      v317 = v316;
      v318 = v315;
      v319 = -[GEOPDSearchProximityIntent init](v317, "init");
      if (v319)
      {
        objc_msgSend(v318, "objectForKeyedSubscript:", CFSTR("name"));
        v320 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v321 = (void *)objc_msgSend(v320, "copy");
          v322 = v321;
          *(_BYTE *)(v319 + 44) |= 1u;
          *(_BYTE *)(v319 + 44) |= 4u;
          objc_storeStrong((id *)(v319 + 16), v321);

        }
        if (a3)
          v323 = CFSTR("tokenSet");
        else
          v323 = CFSTR("token_set");
        objc_msgSend(v318, "objectForKeyedSubscript:", v323);
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v325 = [GEOPDSearchTokenSet alloc];
          if (v325)
            v326 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v325, v324, a3);
          else
            v326 = 0;
          v327 = v326;
          *(_BYTE *)(v319 + 44) |= 2u;
          *(_BYTE *)(v319 + 44) |= 4u;
          objc_storeStrong((id *)(v319 + 24), v326);

        }
      }

    }
    else
    {
      v319 = 0;
    }
    v328 = (id)v319;
    *((_DWORD *)v512 + 37) |= 0x2000u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 13, (id)v319);

  }
  if (a3)
    v329 = CFSTR("locationIntent");
  else
    v329 = CFSTR("location_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v329);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v331 = [GEOPDSearchLocationIntent alloc];
    if (!v331)
    {
      v334 = 0;
      goto LABEL_611;
    }
    v332 = v331;
    v333 = v330;
    v334 = -[GEOPDSearchLocationIntent init](v332, "init");
    if (!v334)
    {
LABEL_610:

LABEL_611:
      v368 = (id)v334;
      *((_DWORD *)v512 + 37) |= 0x800u;
      *((_DWORD *)v512 + 37) |= 0x10000u;
      objc_storeStrong((id *)v512 + 11, (id)v334);

      goto LABEL_612;
    }
    if (a3)
      v335 = CFSTR("mapRegion");
    else
      v335 = CFSTR("map_region");
    objc_msgSend(v333, "objectForKeyedSubscript:", v335);
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v337 = [GEOMapRegion alloc];
      if ((a3 & 1) != 0)
        v338 = -[GEOMapRegion initWithJSON:](v337, "initWithJSON:", v336);
      else
        v338 = -[GEOMapRegion initWithDictionary:](v337, "initWithDictionary:", v336);
      v339 = v338;
      v340 = v338;
      *(_WORD *)(v334 + 76) |= 0x80u;
      *(_WORD *)(v334 + 76) |= 0x100u;
      objc_storeStrong((id *)(v334 + 40), v339);

    }
    objc_msgSend(v333, "objectForKeyedSubscript:", CFSTR("center"));
    v341 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v342 = [GEOLatLng alloc];
      if ((a3 & 1) != 0)
        v343 = -[GEOLatLng initWithJSON:](v342, "initWithJSON:", v341);
      else
        v343 = -[GEOLatLng initWithDictionary:](v342, "initWithDictionary:", v341);
      v344 = v343;
      v345 = v343;
      *(_WORD *)(v334 + 76) |= 0x20u;
      *(_WORD *)(v334 + 76) |= 0x100u;
      objc_storeStrong((id *)(v334 + 16), v344);

    }
    if (a3)
      v346 = CFSTR("locationType");
    else
      v346 = CFSTR("location_type");
    objc_msgSend(v333, "objectForKeyedSubscript:", v346);
    v347 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v348 = v347;
      if ((objc_msgSend(v348, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v349 = 0;
      }
      else if ((objc_msgSend(v348, "isEqualToString:", CFSTR("MAP_REGION")) & 1) != 0)
      {
        v349 = 1;
      }
      else if ((objc_msgSend(v348, "isEqualToString:", CFSTR("CENTER")) & 1) != 0)
      {
        v349 = 2;
      }
      else if (objc_msgSend(v348, "isEqualToString:", CFSTR("NEARBY_VENUE")))
      {
        v349 = 3;
      }
      else
      {
        v349 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_581:

        if (a3)
          v350 = CFSTR("distanceInKm");
        else
          v350 = CFSTR("distance_in_km");
        objc_msgSend(v333, "objectForKeyedSubscript:", v350);
        v351 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v351, "doubleValue");
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 1u;
          *(_QWORD *)(v334 + 32) = v352;
        }

        if (a3)
          v353 = CFSTR("isDerivedFromGeoIntent");
        else
          v353 = CFSTR("is_derived_from_geo_intent");
        objc_msgSend(v333, "objectForKeyedSubscript:", v353);
        v354 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v355 = objc_msgSend(v354, "BOOLValue");
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 8u;
          *(_BYTE *)(v334 + 72) = v355;
        }

        if (a3)
          v356 = CFSTR("venueId");
        else
          v356 = CFSTR("venue_id");
        objc_msgSend(v333, "objectForKeyedSubscript:", v356);
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v358 = objc_msgSend(v357, "unsignedLongLongValue");
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 2u;
          *(_QWORD *)(v334 + 48) = v358;
        }

        if (a3)
          v359 = CFSTR("isDerivedFromPoiIntent");
        else
          v359 = CFSTR("is_derived_from_poi_intent");
        objc_msgSend(v333, "objectForKeyedSubscript:", v359);
        v360 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v361 = objc_msgSend(v360, "BOOLValue");
          *(_WORD *)(v334 + 76) |= 0x100u;
          *(_WORD *)(v334 + 76) |= 0x10u;
          *(_BYTE *)(v334 + 73) = v361;
        }

        if (a3)
          v362 = CFSTR("displayMapRegion");
        else
          v362 = CFSTR("display_map_region");
        objc_msgSend(v333, "objectForKeyedSubscript:", v362);
        v363 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v364 = [GEOMapRegion alloc];
          if ((a3 & 1) != 0)
            v365 = -[GEOMapRegion initWithJSON:](v364, "initWithJSON:", v363);
          else
            v365 = -[GEOMapRegion initWithDictionary:](v364, "initWithDictionary:", v363);
          v366 = v365;
          v367 = v365;
          *(_WORD *)(v334 + 76) |= 0x40u;
          *(_WORD *)(v334 + 76) |= 0x100u;
          objc_storeStrong((id *)(v334 + 24), v366);

        }
        goto LABEL_610;
      }
      v349 = objc_msgSend(v347, "intValue");
    }
    *(_WORD *)(v334 + 76) |= 0x100u;
    *(_WORD *)(v334 + 76) |= 4u;
    *(_DWORD *)(v334 + 68) = v349;
    goto LABEL_581;
  }
LABEL_612:

  if (a3)
    v369 = CFSTR("attributeIntent");
  else
    v369 = CFSTR("attribute_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v369);
  v370 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v371 = [GEOPDSearchAttributeIntent alloc];
    if (v371)
    {
      v372 = v371;
      v373 = v370;
      v374 = -[GEOPDSearchAttributeIntent init](v372, "init");
      if (v374)
      {
        objc_msgSend(v373, "objectForKeyedSubscript:", CFSTR("name"));
        v375 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v376 = (void *)objc_msgSend(v375, "copy");
          v377 = v376;
          *(_BYTE *)(v374 + 72) |= 8u;
          *(_BYTE *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 32), v376);

        }
        if (a3)
          v378 = CFSTR("attributeId");
        else
          v378 = CFSTR("attribute_id");
        objc_msgSend(v373, "objectForKeyedSubscript:", v378);
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v380 = (void *)objc_msgSend(v379, "copy");
          v381 = v380;
          *(_BYTE *)(v374 + 72) |= 2u;
          *(_BYTE *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 16), v380);

        }
        if (a3)
          v382 = CFSTR("tokenSet");
        else
          v382 = CFSTR("token_set");
        objc_msgSend(v373, "objectForKeyedSubscript:", v382);
        v383 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v384 = [GEOPDSearchTokenSet alloc];
          if (v384)
            v385 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v384, v383, a3);
          else
            v385 = 0;
          v386 = v385;
          *(_BYTE *)(v374 + 72) |= 0x20u;
          *(_BYTE *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 48), v385);

        }
        if (a3)
          v387 = CFSTR("attributeValue");
        else
          v387 = CFSTR("attribute_value");
        objc_msgSend(v373, "objectForKeyedSubscript:", v387);
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v389 = (void *)objc_msgSend(v388, "copy");
          v390 = v389;
          *(_BYTE *)(v374 + 72) |= 4u;
          *(_BYTE *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 24), v389);

        }
        if (a3)
          v391 = CFSTR("isOptionalAttribute");
        else
          v391 = CFSTR("is_optional_attribute");
        objc_msgSend(v373, "objectForKeyedSubscript:", v391);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v393 = objc_msgSend(v392, "BOOLValue");
          *(_BYTE *)(v374 + 72) |= 0x40u;
          *(_BYTE *)(v374 + 72) |= 1u;
          *(_BYTE *)(v374 + 68) = v393;
        }

        if (a3)
          v394 = CFSTR("structuredAttribute");
        else
          v394 = CFSTR("structured_attribute");
        objc_msgSend(v373, "objectForKeyedSubscript:", v394);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v396 = [GEOPDSearchStructuredAttribute alloc];
          if (v396)
            v397 = (void *)-[GEOPDSearchStructuredAttribute _initWithDictionary:isJSON:](v396, v395, a3);
          else
            v397 = 0;
          v398 = v397;
          *(_BYTE *)(v374 + 72) |= 0x10u;
          *(_BYTE *)(v374 + 72) |= 0x40u;
          objc_storeStrong((id *)(v374 + 40), v397);

        }
      }

    }
    else
    {
      v374 = 0;
    }
    v399 = (id)v374;
    *((_DWORD *)v512 + 37) |= 4u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 2, (id)v374);

  }
  if (a3)
    v400 = CFSTR("clientResolvedIntent");
  else
    v400 = CFSTR("client_resolved_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v400);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v402 = [GEOPDSearchClientResolvedIntent alloc];
    if (!v402)
    {
      v405 = 0;
      goto LABEL_685;
    }
    v403 = v402;
    v404 = v401;
    v405 = -[GEOPDSearchClientResolvedIntent init](v403, "init");
    if (!v405)
    {
LABEL_684:

LABEL_685:
      v413 = (id)v405;
      *((_DWORD *)v512 + 37) |= 0x40u;
      *((_DWORD *)v512 + 37) |= 0x10000u;
      objc_storeStrong((id *)v512 + 6, (id)v405);

      goto LABEL_686;
    }
    objc_msgSend(v404, "objectForKeyedSubscript:", CFSTR("name"));
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v407 = (void *)objc_msgSend(v406, "copy");
      v408 = v407;
      objc_storeStrong((id *)(v405 + 8), v407);

    }
    if (a3)
      v409 = CFSTR("resolvedItemType");
    else
      v409 = CFSTR("resolved_item_type");
    objc_msgSend(v404, "objectForKeyedSubscript:", v409);
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v411 = v410;
      if ((objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_UNKNOWN")) & 1) != 0)
      {
        v412 = 0;
      }
      else if ((objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_HOME")) & 1) != 0)
      {
        v412 = 1;
      }
      else if ((objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_WORK")) & 1) != 0)
      {
        v412 = 2;
      }
      else if ((objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_PARKED_CAR")) & 1) != 0)
      {
        v412 = 3;
      }
      else if ((objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_CURRENT_LOCATION")) & 1) != 0)
      {
        v412 = 4;
      }
      else if ((objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SERVER")) & 1) != 0)
      {
        v412 = 5;
      }
      else if (objc_msgSend(v411, "isEqualToString:", CFSTR("RESOLVED_ITEM_TYPE_SCHOOL")))
      {
        v412 = 6;
      }
      else
      {
        v412 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_683:

        goto LABEL_684;
      }
      v412 = objc_msgSend(v410, "intValue");
    }
    *(_BYTE *)(v405 + 20) |= 1u;
    *(_DWORD *)(v405 + 16) = v412;
    goto LABEL_683;
  }
LABEL_686:

  if (a3)
    v414 = CFSTR("searchFilterIntent");
  else
    v414 = CFSTR("search_filter_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v414);
  v415 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v416 = [GEOPDSearchSearchFilterIntent alloc];
    if (v416)
    {
      v417 = v415;
      v416 = -[GEOPDSearchSearchFilterIntent init](v416, "init");
      if (v416)
      {
        if (a3)
          v418 = CFSTR("searchFilter");
        else
          v418 = CFSTR("search_filter");
        objc_msgSend(v417, "objectForKeyedSubscript:", v418);
        v419 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v420 = [GEOPDSSearchFilter alloc];
          if (v420)
            v421 = (void *)-[GEOPDSSearchFilter _initWithDictionary:isJSON:](v420, v419, a3);
          else
            v421 = 0;
          v422 = v421;
          objc_storeStrong((id *)&v416->_searchFilter, v421);

        }
      }

    }
    v423 = v416;
    *((_DWORD *)v512 + 37) |= 0x4000u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 14, v416);

  }
  if (a3)
    v424 = CFSTR("directionIntent");
  else
    v424 = CFSTR("direction_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v424);
  v425 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v426 = [GEOPDSearchDirectionIntent alloc];
    if (v426)
    {
      v427 = v425;
      v426 = -[GEOPDSearchDirectionIntent init](v426, "init");
      if (v426)
      {
        objc_msgSend(v427, "objectForKeyedSubscript:", v424);
        v428 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v429 = [GEOPDDirectionIntent alloc];
          if (v429)
            v430 = (void *)-[GEOPDDirectionIntent _initWithDictionary:isJSON:]((uint64_t)v429, v428, a3);
          else
            v430 = 0;
          v431 = v430;
          objc_storeStrong((id *)&v426->_directionIntent, v430);

        }
      }

    }
    v432 = v426;
    *((_DWORD *)v512 + 37) |= 0x80u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 7, v426);

  }
  if (a3)
    v433 = CFSTR("transitIntent");
  else
    v433 = CFSTR("transit_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v433);
  v434 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_753;
  v435 = [GEOPDSearchTransitIntent alloc];
  if (v435)
  {
    v436 = v434;
    v435 = -[GEOPDSearchTransitIntent init](v435, "init");
    if (!v435)
    {
LABEL_751:

      goto LABEL_752;
    }
    objc_msgSend(v436, "objectForKeyedSubscript:", CFSTR("name"));
    v437 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v438 = (void *)objc_msgSend(v437, "copy");
      v439 = v438;
      *(_BYTE *)&v435->_flags |= 4u;
      *(_BYTE *)&v435->_flags |= 0x10u;
      objc_storeStrong((id *)&v435->_name, v438);

    }
    if (a3)
      v440 = CFSTR("tokenSet");
    else
      v440 = CFSTR("token_set");
    objc_msgSend(v436, "objectForKeyedSubscript:", v440);
    v441 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v442 = [GEOPDSearchTokenSet alloc];
      if (v442)
        v443 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v442, v441, a3);
      else
        v443 = 0;
      v444 = v443;
      *(_BYTE *)&v435->_flags |= 8u;
      *(_BYTE *)&v435->_flags |= 0x10u;
      objc_storeStrong((id *)&v435->_tokenSet, v443);

    }
    if (a3)
      v445 = CFSTR("transitId");
    else
      v445 = CFSTR("transit_id");
    objc_msgSend(v436, "objectForKeyedSubscript:", v445);
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v447 = objc_msgSend(v446, "unsignedLongLongValue");
      *(_BYTE *)&v435->_flags |= 0x10u;
      *(_BYTE *)&v435->_flags |= 1u;
      v435->_transitId = v447;
    }

    if (a3)
      v448 = CFSTR("transitType");
    else
      v448 = CFSTR("transit_type");
    objc_msgSend(v436, "objectForKeyedSubscript:", v448);
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v450 = v449;
      if ((objc_msgSend(v450, "isEqualToString:", CFSTR("TRANSIT_NONE")) & 1) != 0)
      {
        v451 = 0;
      }
      else if ((objc_msgSend(v450, "isEqualToString:", CFSTR("TRANSIT_SYSTEM")) & 1) != 0)
      {
        v451 = 1;
      }
      else if (objc_msgSend(v450, "isEqualToString:", CFSTR("TRANSIT_BRAND")))
      {
        v451 = 2;
      }
      else
      {
        v451 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_750:

        goto LABEL_751;
      }
      v451 = objc_msgSend(v449, "intValue");
    }
    *(_BYTE *)&v435->_flags |= 0x10u;
    *(_BYTE *)&v435->_flags |= 2u;
    v435->_transitType = v451;
    goto LABEL_750;
  }
LABEL_752:
  v452 = v435;
  *((_DWORD *)v512 + 37) |= 0x8000u;
  *((_DWORD *)v512 + 37) |= 0x10000u;
  objc_storeStrong((id *)v512 + 15, v435);

LABEL_753:
  if (a3)
    v453 = CFSTR("phoneNumberIntent");
  else
    v453 = CFSTR("phone_number_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v453);
  v454 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v455 = [GEOPDSearchPhoneNumberIntent alloc];
    if (v455)
    {
      v456 = v455;
      v457 = v454;
      v458 = -[GEOPDSearchPhoneNumberIntent init](v456, "init");
      if (v458)
      {
        if (a3)
          v459 = CFSTR("phoneNumber");
        else
          v459 = CFSTR("phone_number");
        objc_msgSend(v457, "objectForKeyedSubscript:", v459);
        v460 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v461 = (void *)objc_msgSend(v460, "copy");
          v462 = v461;
          *(_BYTE *)(v458 + 44) |= 1u;
          *(_BYTE *)(v458 + 44) |= 4u;
          objc_storeStrong((id *)(v458 + 16), v461);

        }
        if (a3)
          v463 = CFSTR("tokenSet");
        else
          v463 = CFSTR("token_set");
        objc_msgSend(v457, "objectForKeyedSubscript:", v463);
        v464 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v465 = [GEOPDSearchTokenSet alloc];
          if (v465)
            v466 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v465, v464, a3);
          else
            v466 = 0;
          v467 = v466;
          *(_BYTE *)(v458 + 44) |= 2u;
          *(_BYTE *)(v458 + 44) |= 4u;
          objc_storeStrong((id *)(v458 + 24), v466);

        }
      }

    }
    else
    {
      v458 = 0;
    }
    v468 = (id)v458;
    *((_DWORD *)v512 + 37) |= 0x1000u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 12, (id)v458);

  }
  if (a3)
    v469 = CFSTR("intentSpanIndex");
  else
    v469 = CFSTR("intent_span_index");
  objc_msgSend(v502, "objectForKeyedSubscript:", v469);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v471 = objc_msgSend(v470, "unsignedIntValue");
    *((_DWORD *)v512 + 37) |= 0x10000u;
    *((_DWORD *)v512 + 37) |= 1u;
    *((_DWORD *)v512 + 35) = v471;
  }

  if (a3)
    v472 = CFSTR("keywordIntent");
  else
    v472 = CFSTR("keyword_intent");
  objc_msgSend(v502, "objectForKeyedSubscript:", v472);
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v474 = [GEOPDSearchKeywordIntent alloc];
    if (v474)
    {
      v475 = v474;
      v476 = v473;
      v477 = -[GEOPDSearchKeywordIntent init](v475, "init");
      if (v477)
      {
        objc_msgSend(v476, "objectForKeyedSubscript:", CFSTR("keyword"));
        v478 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v479 = (void *)objc_msgSend(v478, "copy");
          v480 = v479;
          *(_BYTE *)(v477 + 48) |= 2u;
          *(_BYTE *)(v477 + 48) |= 8u;
          objc_storeStrong((id *)(v477 + 16), v479);

        }
        if (a3)
          v481 = CFSTR("tokenSet");
        else
          v481 = CFSTR("token_set");
        objc_msgSend(v476, "objectForKeyedSubscript:", v481);
        v482 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v483 = [GEOPDSearchTokenSet alloc];
          if (v483)
            v484 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v483, v482, a3);
          else
            v484 = 0;
          v485 = v484;
          *(_BYTE *)(v477 + 48) |= 4u;
          *(_BYTE *)(v477 + 48) |= 8u;
          objc_storeStrong((id *)(v477 + 24), v484);

        }
        if (a3)
          v486 = CFSTR("isOptionalKeyword");
        else
          v486 = CFSTR("is_optional_keyword");
        objc_msgSend(v476, "objectForKeyedSubscript:", v486);
        v487 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v488 = objc_msgSend(v487, "BOOLValue");
          *(_BYTE *)(v477 + 48) |= 8u;
          *(_BYTE *)(v477 + 48) |= 1u;
          *(_BYTE *)(v477 + 44) = v488;
        }

      }
    }
    else
    {
      v477 = 0;
    }
    v489 = (id)v477;
    *((_DWORD *)v512 + 37) |= 0x200u;
    *((_DWORD *)v512 + 37) |= 0x10000u;
    objc_storeStrong((id *)v512 + 9, (id)v477);

  }
  if (a3)
    v490 = CFSTR("languageCode");
  else
    v490 = CFSTR("language_code");
  objc_msgSend(v502, "objectForKeyedSubscript:", v490);
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v519 = 0u;
    v520 = 0u;
    v517 = 0u;
    v518 = 0u;
    v492 = v491;
    v493 = objc_msgSend(v492, "countByEnumeratingWithState:objects:count:", &v517, v561, 16);
    if (v493)
    {
      v494 = *(_QWORD *)v518;
      do
      {
        for (i1 = 0; i1 != v493; ++i1)
        {
          if (*(_QWORD *)v518 != v494)
            objc_enumerationMutation(v492);
          v496 = *(void **)(*((_QWORD *)&v517 + 1) + 8 * i1);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v497 = (void *)objc_msgSend(v496, "copy");
            -[GEOPDSearchIntent addLanguageCode:]((os_unfair_lock_s *)v512, v497);

          }
        }
        v493 = objc_msgSend(v492, "countByEnumeratingWithState:objects:count:", &v517, v561, 16);
      }
      while (v493);
    }

  }
LABEL_817:

  return v512;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchIntentReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  if (self->_reader && (_GEOPDSearchIntentIsDirty((uint64_t)self) & 1) == 0)
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
    -[GEOPDSearchIntent readAll:]((uint64_t)self, 0);
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      PBDataWriterWriteInt32Field();
    if (self->_categoryIntent)
      PBDataWriterWriteSubmessage();
    if (self->_chainIntent)
      PBDataWriterWriteSubmessage();
    if (self->_businessIntent)
      PBDataWriterWriteSubmessage();
    if (self->_geoIntent)
      PBDataWriterWriteSubmessage();
    if (self->_proximityIntent)
      PBDataWriterWriteSubmessage();
    if (self->_locationIntent)
      PBDataWriterWriteSubmessage();
    if (self->_attributeIntent)
      PBDataWriterWriteSubmessage();
    if (self->_clientResolvedIntent)
      PBDataWriterWriteSubmessage();
    if (self->_searchFilterIntent)
      PBDataWriterWriteSubmessage();
    if (self->_directionIntent)
      PBDataWriterWriteSubmessage();
    if (self->_transitIntent)
      PBDataWriterWriteSubmessage();
    if (self->_phoneNumberIntent)
      PBDataWriterWriteSubmessage();
    if ((*(_BYTE *)&self->_flags & 1) != 0)
      PBDataWriterWriteUint32Field();
    if (self->_keywordIntent)
      PBDataWriterWriteSubmessage();
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = self->_languageCodes;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v13;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteStringField();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v7);
    }

  }
}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  if (result)
  {
    v3 = (uint64_t *)result;
    -[GEOPDSearchIntent _readBusinessIntent](result);
    v4 = v3[3];
    result = 1;
    if (!v4
      || (-[GEOPDSearchBusinessIntent _readCenter](v3[3]),
          (objc_msgSend(*(id *)(v4 + 48), "hasGreenTeaWithValue:", a2) & 1) == 0))
    {
      -[GEOPDSearchIntent _readGeoIntent]((uint64_t)v3);
      if ((-[GEOPDSearchGeoIntent hasGreenTeaWithValue:](v3[8], a2) & 1) == 0)
      {
        -[GEOPDSearchIntent _readLocationIntent]((uint64_t)v3);
        if ((-[GEOPDSearchLocationIntent hasGreenTeaWithValue:](v3[11], a2) & 1) == 0)
        {
          -[GEOPDSearchIntent _readSearchFilterIntent]((uint64_t)v3);
          v5 = v3[14];
          if (!v5 || (-[GEOPDSSearchFilter hasGreenTeaWithValue:](*(_QWORD *)(v5 + 8), a2) & 1) == 0)
            return 0;
        }
      }
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
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
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
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
      GEOPDSearchIntentReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (NSMutableArray *)(id)v5;
      objc_sync_exit(v7);

      goto LABEL_16;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchIntent readAll:]((uint64_t)self, 0);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 144) = self->_intentType;
    *(_DWORD *)(v5 + 148) |= 2u;
  }
  v9 = -[GEOPDSearchCategoryIntent copyWithZone:](self->_categoryIntent, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[GEOPDSearchChainIntent copyWithZone:](self->_chainIntent, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  v13 = -[GEOPDSearchBusinessIntent copyWithZone:](self->_businessIntent, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v13;

  v15 = -[GEOPDSearchGeoIntent copyWithZone:](self->_geoIntent, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v15;

  v17 = -[GEOPDSearchProximityIntent copyWithZone:](self->_proximityIntent, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v17;

  v19 = -[GEOPDSearchLocationIntent copyWithZone:](self->_locationIntent, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 88);
  *(_QWORD *)(v5 + 88) = v19;

  v21 = -[GEOPDSearchAttributeIntent copyWithZone:](self->_attributeIntent, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;

  v23 = -[GEOPDSearchClientResolvedIntent copyWithZone:](self->_clientResolvedIntent, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v23;

  v25 = -[GEOPDSearchSearchFilterIntent copyWithZone:](self->_searchFilterIntent, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v25;

  v27 = -[GEOPDSearchDirectionIntent copyWithZone:](self->_directionIntent, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v27;

  v29 = -[GEOPDSearchTransitIntent copyWithZone:](self->_transitIntent, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v29;

  v31 = -[GEOPDSearchPhoneNumberIntent copyWithZone:](self->_phoneNumberIntent, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v31;

  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 140) = self->_intentSpanIndex;
    *(_DWORD *)(v5 + 148) |= 1u;
  }
  v33 = -[GEOPDSearchKeywordIntent copyWithZone:](self->_keywordIntent, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v33;

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = self->_languageCodes;
  v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v41 != v36)
          objc_enumerationMutation(v8);
        v38 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "copyWithZone:", a3, (_QWORD)v40);
        -[GEOPDSearchIntent addLanguageCode:]((os_unfair_lock_s *)v5, v38);

      }
      v35 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v35);
  }
LABEL_16:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  GEOPDSearchCategoryIntent *categoryIntent;
  GEOPDSearchChainIntent *chainIntent;
  GEOPDSearchBusinessIntent *businessIntent;
  GEOPDSearchGeoIntent *geoIntent;
  GEOPDSearchProximityIntent *proximityIntent;
  GEOPDSearchLocationIntent *locationIntent;
  GEOPDSearchAttributeIntent *attributeIntent;
  GEOPDSearchClientResolvedIntent *clientResolvedIntent;
  GEOPDSearchSearchFilterIntent *searchFilterIntent;
  GEOPDSearchDirectionIntent *directionIntent;
  GEOPDSearchTransitIntent *transitIntent;
  GEOPDSearchPhoneNumberIntent *phoneNumberIntent;
  int v18;
  GEOPDSearchKeywordIntent *keywordIntent;
  NSMutableArray *languageCodes;
  char v21;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_40;
  -[GEOPDSearchIntent readAll:]((uint64_t)self, 1);
  -[GEOPDSearchIntent readAll:]((uint64_t)v4, 1);
  v5 = *((_DWORD *)v4 + 37);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((v5 & 2) == 0 || self->_intentType != *((_DWORD *)v4 + 36))
      goto LABEL_40;
  }
  else if ((v5 & 2) != 0)
  {
LABEL_40:
    v21 = 0;
    goto LABEL_41;
  }
  categoryIntent = self->_categoryIntent;
  if ((unint64_t)categoryIntent | *((_QWORD *)v4 + 4)
    && !-[GEOPDSearchCategoryIntent isEqual:](categoryIntent, "isEqual:"))
  {
    goto LABEL_40;
  }
  chainIntent = self->_chainIntent;
  if ((unint64_t)chainIntent | *((_QWORD *)v4 + 5))
  {
    if (!-[GEOPDSearchChainIntent isEqual:](chainIntent, "isEqual:"))
      goto LABEL_40;
  }
  businessIntent = self->_businessIntent;
  if ((unint64_t)businessIntent | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDSearchBusinessIntent isEqual:](businessIntent, "isEqual:"))
      goto LABEL_40;
  }
  geoIntent = self->_geoIntent;
  if ((unint64_t)geoIntent | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDSearchGeoIntent isEqual:](geoIntent, "isEqual:"))
      goto LABEL_40;
  }
  proximityIntent = self->_proximityIntent;
  if ((unint64_t)proximityIntent | *((_QWORD *)v4 + 13))
  {
    if (!-[GEOPDSearchProximityIntent isEqual:](proximityIntent, "isEqual:"))
      goto LABEL_40;
  }
  locationIntent = self->_locationIntent;
  if ((unint64_t)locationIntent | *((_QWORD *)v4 + 11))
  {
    if (!-[GEOPDSearchLocationIntent isEqual:](locationIntent, "isEqual:"))
      goto LABEL_40;
  }
  attributeIntent = self->_attributeIntent;
  if ((unint64_t)attributeIntent | *((_QWORD *)v4 + 2))
  {
    if (!-[GEOPDSearchAttributeIntent isEqual:](attributeIntent, "isEqual:"))
      goto LABEL_40;
  }
  clientResolvedIntent = self->_clientResolvedIntent;
  if ((unint64_t)clientResolvedIntent | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDSearchClientResolvedIntent isEqual:](clientResolvedIntent, "isEqual:"))
      goto LABEL_40;
  }
  searchFilterIntent = self->_searchFilterIntent;
  if ((unint64_t)searchFilterIntent | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOPDSearchSearchFilterIntent isEqual:](searchFilterIntent, "isEqual:"))
      goto LABEL_40;
  }
  directionIntent = self->_directionIntent;
  if ((unint64_t)directionIntent | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDSearchDirectionIntent isEqual:](directionIntent, "isEqual:"))
      goto LABEL_40;
  }
  transitIntent = self->_transitIntent;
  if ((unint64_t)transitIntent | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPDSearchTransitIntent isEqual:](transitIntent, "isEqual:"))
      goto LABEL_40;
  }
  phoneNumberIntent = self->_phoneNumberIntent;
  if ((unint64_t)phoneNumberIntent | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDSearchPhoneNumberIntent isEqual:](phoneNumberIntent, "isEqual:"))
      goto LABEL_40;
  }
  v18 = *((_DWORD *)v4 + 37);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((v18 & 1) == 0 || self->_intentSpanIndex != *((_DWORD *)v4 + 35))
      goto LABEL_40;
  }
  else if ((v18 & 1) != 0)
  {
    goto LABEL_40;
  }
  keywordIntent = self->_keywordIntent;
  if ((unint64_t)keywordIntent | *((_QWORD *)v4 + 9)
    && !-[GEOPDSearchKeywordIntent isEqual:](keywordIntent, "isEqual:"))
  {
    goto LABEL_40;
  }
  languageCodes = self->_languageCodes;
  if ((unint64_t)languageCodes | *((_QWORD *)v4 + 10))
    v21 = -[NSMutableArray isEqual:](languageCodes, "isEqual:");
  else
    v21 = 1;
LABEL_41:

  return v21;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;

  -[GEOPDSearchIntent readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 2) != 0)
    v18 = 2654435761 * self->_intentType;
  else
    v18 = 0;
  v17 = -[GEOPDSearchCategoryIntent hash](self->_categoryIntent, "hash");
  v16 = -[GEOPDSearchChainIntent hash](self->_chainIntent, "hash");
  v15 = -[GEOPDSearchBusinessIntent hash](self->_businessIntent, "hash");
  v14 = -[GEOPDSearchGeoIntent hash](self->_geoIntent, "hash");
  v3 = -[GEOPDSearchProximityIntent hash](self->_proximityIntent, "hash");
  v4 = -[GEOPDSearchLocationIntent hash](self->_locationIntent, "hash");
  v5 = -[GEOPDSearchAttributeIntent hash](self->_attributeIntent, "hash");
  v6 = -[GEOPDSearchClientResolvedIntent hash](self->_clientResolvedIntent, "hash");
  v7 = -[GEOPDSearchSearchFilterIntent hash](self->_searchFilterIntent, "hash");
  v8 = -[GEOPDSearchDirectionIntent hash](self->_directionIntent, "hash");
  v9 = -[GEOPDSearchTransitIntent hash](self->_transitIntent, "hash");
  v10 = -[GEOPDSearchPhoneNumberIntent hash](self->_phoneNumberIntent, "hash");
  if ((*(_BYTE *)&self->_flags & 1) != 0)
    v11 = 2654435761 * self->_intentSpanIndex;
  else
    v11 = 0;
  v12 = v9 ^ v10 ^ v11 ^ -[GEOPDSearchKeywordIntent hash](self->_keywordIntent, "hash");
  return v17 ^ v18 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v12 ^ -[NSMutableArray hash](self->_languageCodes, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitIntent, 0);
  objc_storeStrong((id *)&self->_searchFilterIntent, 0);
  objc_storeStrong((id *)&self->_proximityIntent, 0);
  objc_storeStrong((id *)&self->_phoneNumberIntent, 0);
  objc_storeStrong((id *)&self->_locationIntent, 0);
  objc_storeStrong((id *)&self->_languageCodes, 0);
  objc_storeStrong((id *)&self->_keywordIntent, 0);
  objc_storeStrong((id *)&self->_geoIntent, 0);
  objc_storeStrong((id *)&self->_directionIntent, 0);
  objc_storeStrong((id *)&self->_clientResolvedIntent, 0);
  objc_storeStrong((id *)&self->_chainIntent, 0);
  objc_storeStrong((id *)&self->_categoryIntent, 0);
  objc_storeStrong((id *)&self->_businessIntent, 0);
  objc_storeStrong((id *)&self->_attributeIntent, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
