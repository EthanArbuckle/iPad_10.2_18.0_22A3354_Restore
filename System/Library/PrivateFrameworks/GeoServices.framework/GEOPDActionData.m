@implementation GEOPDActionData

- (id)actionName
{
  void *v2;
  void *v3;

  -[GEOPDActionData actionTitles]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOLocalizedString bestStringForCurrentLocale:fallbackToFirstAvailable:](GEOLocalizedString, "bestStringForCurrentLocale:fallbackToFirstAvailable:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GEOPDActionData)init
{
  GEOPDActionData *v2;
  GEOPDActionData *v3;
  GEOPDActionData *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDActionData;
  v2 = -[GEOPDActionData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDActionData)initWithData:(id)a3
{
  GEOPDActionData *v3;
  GEOPDActionData *v4;
  GEOPDActionData *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDActionData;
  v3 = -[GEOPDActionData initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (void)_readActionTitles
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionTitles_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)actionTitles
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDActionData _readActionTitles]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)addActionTitle:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDActionData _readActionTitles](a1);
    -[GEOPDActionData _addNoFlagsActionTitle:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 8u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsActionTitle:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 40);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = v5;

      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readActionSymbolImageName
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionSymbolImageName_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)actionSymbolImageName
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDActionData _readActionSymbolImageName]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)_readActionLinks
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 2) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readActionLinks_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)actionLinks
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDActionData _readActionLinks]((uint64_t)a1);
    a1 = (id *)v1[3];
  }
  return a1;
}

- (void)addActionLink:(uint64_t)a1
{
  id v3;

  if (a1)
  {
    v3 = a2;
    -[GEOPDActionData _readActionLinks](a1);
    -[GEOPDActionData _addNoFlagsActionLink:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 84) |= 2u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    *(_BYTE *)(a1 + 84) |= 0x80u;
  }
}

- (void)_addNoFlagsActionLink:(uint64_t)a1
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

- (void)_readWinningAdamId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readWinningAdamId_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)winningAdamId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDActionData _readWinningAdamId]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)_readCategoryId
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_BYTE *)(a1 + 84) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readCategoryId_tags_0);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)categoryId
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDActionData _readCategoryId]((uint64_t)a1);
    a1 = (id *)v1[6];
  }
  return a1;
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
  v8.super_class = (Class)GEOPDActionData;
  -[GEOPDActionData description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDActionData dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDActionData _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  id v28;
  id v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDActionData readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v6 = *(id *)(a1 + 40);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v45 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v10, "jsonRepresentation");
          else
            objc_msgSend(v10, "dictionaryRepresentation");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v7);
    }

    if (a2)
      v12 = CFSTR("actionTitle");
    else
      v12 = CFSTR("action_title");
    objc_msgSend(v4, "setObject:forKey:", v5, v12);

  }
  -[GEOPDActionData actionSymbolImageName]((id *)a1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a2)
      v14 = CFSTR("actionSymbolImageName");
    else
      v14 = CFSTR("action_symbol_image_name");
    objc_msgSend(v4, "setObject:forKey:", v13, v14);
  }

  if (objc_msgSend(*(id *)(a1 + 24), "count"))
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 24), "count"));
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v16 = *(id *)(a1 + 24);
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v20, "jsonRepresentation");
          else
            objc_msgSend(v20, "dictionaryRepresentation");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v21);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v17);
    }

    if (a2)
      v22 = CFSTR("actionLink");
    else
      v22 = CFSTR("action_link");
    objc_msgSend(v4, "setObject:forKey:", v15, v22);

  }
  -[GEOPDActionData winningAdamId]((id *)a1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    if (a2)
      v24 = CFSTR("winningAdamId");
    else
      v24 = CFSTR("winning_adam_id");
    objc_msgSend(v4, "setObject:forKey:", v23, v24);
  }

  -[GEOPDActionData categoryId]((id *)a1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    if (a2)
      v26 = CFSTR("categoryId");
    else
      v26 = CFSTR("category_id");
    objc_msgSend(v4, "setObject:forKey:", v25, v26);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_BYTE *)(a1 + 84) & 0x20) == 0)
  {
    v27 = *(void **)(a1 + 8);
    if (v27)
    {
      v28 = v27;
      objc_sync_enter(v28);
      GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOwnerAdamId_tags);
      objc_sync_exit(v28);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v29 = *(id *)(a1 + 56);
  if (v29)
  {
    if (a2)
      v30 = CFSTR("ownerAdamId");
    else
      v30 = CFSTR("owner_adam_id");
    objc_msgSend(v4, "setObject:forKey:", v29, v30);
  }

  v31 = *(void **)(a1 + 16);
  if (v31)
  {
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v32, "count"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __45__GEOPDActionData__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

    }
    else
    {
      v36 = v32;
    }
    objc_msgSend(v4, "setObject:forKey:", v36, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDActionData _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_35;
      else
        v6 = (int *)&readAll__nonRecursiveTag_35;
      GEOPDActionDataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDActionDataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __45__GEOPDActionData__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v5;
  const __CFString *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  GEOLocalizedString *v13;
  GEOLocalizedString *v14;
  GEOLocalizedString *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  GEOPDActionLink *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  GEOPDLink *v44;
  void *v45;
  id v46;
  int v47;
  void *v48;
  GEOPDQuickLinkActionDataParams *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  GEOPDAppClipParams *v66;
  id v67;
  uint64_t v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  id v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  id v83;
  id v84;
  GEOPDExtensionParams *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t j;
  void *v97;
  id v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  void *v105;
  GEOPDWebLinkParams *v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  id v111;
  void *v112;
  void *v113;
  id v114;
  void *v115;
  GEOPDIcon *v116;
  void *v117;
  id v118;
  void *v119;
  char v120;
  id v121;
  void *v122;
  int v123;
  uint64_t v124;
  uint64_t v125;
  const __CFString *v126;
  void *v127;
  void *v128;
  id v129;
  const __CFString *v130;
  void *v131;
  void *v132;
  id v133;
  const __CFString *v134;
  void *v135;
  void *v136;
  id v137;
  void *v139;
  void *v140;
  id obj;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  id v145;
  uint64_t v146;
  const __CFString *v147;
  const __CFString *v148;
  const __CFString *v149;
  const __CFString *v150;
  const __CFString *v151;
  uint64_t v152;
  int v153;
  const __CFString *v154;
  const __CFString *v155;
  const __CFString *v156;
  const __CFString *v157;
  const __CFString *v158;
  const __CFString *v159;
  const __CFString *v160;
  const __CFString *v161;
  void *v162;
  uint64_t v163;
  id v164;
  id v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  _BYTE v188[128];
  _BYTE v189[128];
  _BYTE v190[128];
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v152 = objc_msgSend(a1, "init");
  if (v152)
  {
    v153 = a3;
    if (a3)
      v6 = CFSTR("actionTitle");
    else
      v6 = CFSTR("action_title");
    v140 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v178 = 0u;
      v179 = 0u;
      v176 = 0u;
      v177 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v176, v189, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v177;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v177 != v10)
              objc_enumerationMutation(v8);
            v12 = *(_QWORD *)(*((_QWORD *)&v176 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = [GEOLocalizedString alloc];
              if ((v153 & 1) != 0)
                v14 = -[GEOLocalizedString initWithJSON:](v13, "initWithJSON:", v12);
              else
                v14 = -[GEOLocalizedString initWithDictionary:](v13, "initWithDictionary:", v12);
              v15 = v14;
              -[GEOPDActionData addActionTitle:](v152, v14);

            }
          }
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v176, v189, 16);
        }
        while (v9);
      }

    }
    if (v153)
      v16 = CFSTR("actionSymbolImageName");
    else
      v16 = CFSTR("action_symbol_image_name");
    objc_msgSend(v140, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = (void *)objc_msgSend(v17, "copy");
      v19 = v18;
      *(_BYTE *)(v152 + 84) |= 4u;
      *(_BYTE *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 32), v18);

    }
    if (v153)
      v20 = CFSTR("actionLink");
    else
      v20 = CFSTR("action_link");
    objc_msgSend(v140, "objectForKeyedSubscript:", v20);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v174 = 0u;
      v175 = 0u;
      v172 = 0u;
      v173 = 0u;
      obj = v139;
      v144 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v188, 16);
      if (!v144)
        goto LABEL_195;
      v142 = *(_QWORD *)v173;
      if (v153)
        v21 = CFSTR("appAdamId");
      else
        v21 = CFSTR("app_adam_id");
      if (v153)
        v22 = CFSTR("linkType");
      else
        v22 = CFSTR("link_type");
      v23 = CFSTR("quick_link_params");
      if (v153)
        v23 = CFSTR("quickLinkParams");
      v160 = v23;
      v161 = v22;
      v24 = CFSTR("symbol_image_name");
      if (v153)
        v24 = CFSTR("symbolImageName");
      v154 = v24;
      v155 = v21;
      v25 = CFSTR("appClipParams");
      if (!v153)
        v25 = CFSTR("app_clip_params");
      v159 = v25;
      v26 = CFSTR("bundle_id");
      if (v153)
        v26 = CFSTR("bundleId");
      v151 = v26;
      if (v153)
        v27 = CFSTR("extensionParams");
      else
        v27 = CFSTR("extension_params");
      v158 = v27;
      if (v153)
        v28 = CFSTR("vendorId");
      else
        v28 = CFSTR("vendor_id");
      v29 = CFSTR("external_item_id");
      if (v153)
        v29 = CFSTR("externalItemId");
      v149 = v29;
      v150 = v28;
      v30 = CFSTR("extension_type");
      if (v153)
        v30 = CFSTR("extensionType");
      v148 = v30;
      v31 = CFSTR("webLinkParams");
      if (!v153)
        v31 = CFSTR("web_link_params");
      v157 = v31;
      v32 = CFSTR("supports_embedded_web_browser");
      if (v153)
        v32 = CFSTR("supportsEmbeddedWebBrowser");
      v147 = v32;
      if (v153)
        v33 = CFSTR("ownerProvidedRank");
      else
        v33 = CFSTR("owner_provided_rank");
      v156 = v33;
      while (1)
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v173 != v142)
          {
            v35 = v34;
            objc_enumerationMutation(obj);
            v34 = v35;
          }
          v146 = v34;
          v36 = *(void **)(*((_QWORD *)&v172 + 1) + 8 * v34);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v37 = [GEOPDActionLink alloc];
            if (v37)
            {
              v145 = v36;
              v163 = -[GEOPDActionLink init](v37, "init");
              if (v163)
              {
                objc_msgSend(v145, "objectForKeyedSubscript:", v155);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v39 = (void *)objc_msgSend(v38, "copy");
                  v40 = v39;
                  *(_BYTE *)(v163 + 52) |= 2u;
                  *(_BYTE *)(v163 + 52) |= 8u;
                  objc_storeStrong((id *)(v163 + 24), v39);

                }
                objc_msgSend(v145, "objectForKeyedSubscript:", CFSTR("link"));
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v182 = 0u;
                  v183 = 0u;
                  v180 = 0u;
                  v181 = 0u;
                  v164 = v143;
                  v167 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v180, v190, 16);
                  if (v167)
                  {
                    v166 = *(_QWORD *)v181;
                    do
                    {
                      v41 = 0;
                      do
                      {
                        if (*(_QWORD *)v181 != v166)
                        {
                          v42 = v41;
                          objc_enumerationMutation(v164);
                          v41 = v42;
                        }
                        v169 = v41;
                        v43 = *(void **)(*((_QWORD *)&v180 + 1) + 8 * v41);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v44 = [GEOPDLink alloc];
                          if (v44)
                          {
                            v170 = v43;
                            v171 = -[GEOPDLink init](v44, "init");
                            if (v171)
                            {
                              objc_msgSend(v170, "objectForKeyedSubscript:", v161);
                              v45 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v46 = v45;
                                if ((objc_msgSend(v46, "isEqualToString:", CFSTR("LINK_TYPE_UNKNOWN")) & 1) != 0)
                                {
                                  v47 = 0;
                                }
                                else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("LINK_TYPE_QUICK_LINK")) & 1) != 0)
                                {
                                  v47 = 1;
                                }
                                else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("LINK_TYPE_APP_CLIP")) & 1) != 0)
                                {
                                  v47 = 2;
                                }
                                else if ((objc_msgSend(v46, "isEqualToString:", CFSTR("LINK_TYPE_EXTENSION")) & 1) != 0)
                                {
                                  v47 = 3;
                                }
                                else if (objc_msgSend(v46, "isEqualToString:", CFSTR("LINK_TYPE_WEB_LINK")))
                                {
                                  v47 = 4;
                                }
                                else
                                {
                                  v47 = 0;
                                }

LABEL_93:
                                *(_BYTE *)(v171 + 76) |= 0x80u;
                                *(_BYTE *)(v171 + 76) |= 1u;
                                *(_DWORD *)(v171 + 68) = v47;
                              }
                              else
                              {
                                objc_opt_class();
                                if ((objc_opt_isKindOfClass() & 1) != 0)
                                {
                                  v47 = objc_msgSend(v45, "intValue");
                                  goto LABEL_93;
                                }
                              }

                              objc_msgSend(v170, "objectForKeyedSubscript:", v160);
                              v48 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v49 = [GEOPDQuickLinkActionDataParams alloc];
                                if (v49)
                                {
                                  v50 = v48;
                                  v51 = -[GEOPDQuickLinkActionDataParams init](v49, "init");
                                  if (v51)
                                  {
                                    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("title"));
                                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v53 = (void *)objc_msgSend(v52, "copy");
                                      v54 = v53;
                                      *(_BYTE *)(v51 + 68) |= 8u;
                                      *(_BYTE *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 40), v53);

                                    }
                                    objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("url"));
                                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v56 = (void *)objc_msgSend(v55, "copy");
                                      v57 = v56;
                                      *(_BYTE *)(v51 + 68) |= 0x10u;
                                      *(_BYTE *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 48), v56);

                                    }
                                    objc_msgSend(v50, "objectForKeyedSubscript:", v155);
                                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v59 = (void *)objc_msgSend(v58, "copy");
                                      v60 = v59;
                                      *(_BYTE *)(v51 + 68) |= 2u;
                                      *(_BYTE *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 24), v59);

                                    }
                                    objc_msgSend(v50, "objectForKeyedSubscript:", v154);
                                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v62 = (void *)objc_msgSend(v61, "copy");
                                      v63 = v62;
                                      *(_BYTE *)(v51 + 68) |= 4u;
                                      *(_BYTE *)(v51 + 68) |= 0x20u;
                                      objc_storeStrong((id *)(v51 + 32), v62);

                                    }
                                  }

                                }
                                else
                                {
                                  v51 = 0;
                                }
                                v64 = (id)v51;
                                *(_BYTE *)(v171 + 76) |= 0x20u;
                                *(_BYTE *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 40), (id)v51);

                              }
                              objc_msgSend(v170, "objectForKeyedSubscript:", v159);
                              v65 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v66 = [GEOPDAppClipParams alloc];
                                if (v66)
                                {
                                  v67 = v65;
                                  v68 = -[GEOPDAppClipParams init](v66, "init");
                                  if (v68)
                                  {
                                    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("title"));
                                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v70 = (void *)objc_msgSend(v69, "copy");
                                      v71 = v70;
                                      *(_BYTE *)(v68 + 76) |= 0x10u;
                                      *(_BYTE *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 48), v70);

                                    }
                                    objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("url"));
                                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v73 = (void *)objc_msgSend(v72, "copy");
                                      v74 = v73;
                                      *(_BYTE *)(v68 + 76) |= 0x20u;
                                      *(_BYTE *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 56), v73);

                                    }
                                    objc_msgSend(v67, "objectForKeyedSubscript:", v151);
                                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v76 = (void *)objc_msgSend(v75, "copy");
                                      v77 = v76;
                                      *(_BYTE *)(v68 + 76) |= 4u;
                                      *(_BYTE *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 32), v76);

                                    }
                                    objc_msgSend(v67, "objectForKeyedSubscript:", v154);
                                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v79 = (void *)objc_msgSend(v78, "copy");
                                      v80 = v79;
                                      *(_BYTE *)(v68 + 76) |= 8u;
                                      *(_BYTE *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 40), v79);

                                    }
                                    objc_msgSend(v67, "objectForKeyedSubscript:", v155);
                                    v81 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v82 = (void *)objc_msgSend(v81, "copy");
                                      v83 = v82;
                                      *(_BYTE *)(v68 + 76) |= 2u;
                                      *(_BYTE *)(v68 + 76) |= 0x40u;
                                      objc_storeStrong((id *)(v68 + 24), v82);

                                    }
                                  }

                                }
                                else
                                {
                                  v68 = 0;
                                }
                                v84 = (id)v68;
                                *(_BYTE *)(v171 + 76) |= 8u;
                                *(_BYTE *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 24), (id)v68);

                              }
                              objc_msgSend(v170, "objectForKeyedSubscript:", v158);
                              v168 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v85 = [GEOPDExtensionParams alloc];
                                if (v85)
                                {
                                  v165 = v168;
                                  v86 = -[GEOPDExtensionParams init](v85, "init");
                                  if (v86)
                                  {
                                    objc_msgSend(v165, "objectForKeyedSubscript:", v150);
                                    v87 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v88 = (void *)objc_msgSend(v87, "copy");
                                      v89 = v88;
                                      *(_BYTE *)(v86 + 84) |= 0x10u;
                                      *(_BYTE *)(v86 + 84) |= 0x20u;
                                      objc_storeStrong((id *)(v86 + 64), v88);

                                    }
                                    objc_msgSend(v165, "objectForKeyedSubscript:", v149);
                                    v90 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v91 = (void *)objc_msgSend(v90, "copy");
                                      v92 = v91;
                                      *(_BYTE *)(v86 + 84) |= 8u;
                                      *(_BYTE *)(v86 + 84) |= 0x20u;
                                      objc_storeStrong((id *)(v86 + 56), v91);

                                    }
                                    objc_msgSend(v165, "objectForKeyedSubscript:", v148);
                                    v162 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v186 = 0u;
                                      v187 = 0u;
                                      v184 = 0u;
                                      v185 = 0u;
                                      v93 = v162;
                                      v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v184, v191, 16);
                                      if (!v94)
                                        goto LABEL_151;
                                      v95 = *(_QWORD *)v185;
                                      while (1)
                                      {
                                        for (j = 0; j != v94; ++j)
                                        {
                                          if (*(_QWORD *)v185 != v95)
                                            objc_enumerationMutation(v93);
                                          v97 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * j);
                                          objc_opt_class();
                                          if ((objc_opt_isKindOfClass() & 1) != 0)
                                          {
                                            v98 = v97;
                                            if ((objc_msgSend(v98, "isEqualToString:", CFSTR("EXTENSION_TYPE_UNKNOWN")) & 1) == 0
                                              && (objc_msgSend(v98, "isEqualToString:", CFSTR("EXTENSION_TYPE_RESERVATION")) & 1) == 0)
                                            {
                                              objc_msgSend(v98, "isEqualToString:", CFSTR("EXTENSION_TYPE_QUEUING"));
                                            }

                                          }
                                          else
                                          {
                                            objc_opt_class();
                                            if ((objc_opt_isKindOfClass() & 1) == 0)
                                              continue;
                                            objc_msgSend(v97, "intValue");
                                          }
                                          os_unfair_lock_lock((os_unfair_lock_t)(v86 + 80));
                                          if ((*(_BYTE *)(v86 + 84) & 2) == 0)
                                          {
                                            v99 = *(void **)(v86 + 8);
                                            if (v99)
                                            {
                                              v100 = v99;
                                              objc_sync_enter(v100);
                                              GEOPDExtensionParamsReadSpecified(v86, *(_QWORD *)(v86 + 8), (int *)&_readExtensionTypes_tags);
                                              objc_sync_exit(v100);

                                            }
                                          }
                                          os_unfair_lock_unlock((os_unfair_lock_t)(v86 + 80));
                                          PBRepeatedInt32Add();
                                          os_unfair_lock_lock_with_options();
                                          *(_BYTE *)(v86 + 84) |= 2u;
                                          os_unfair_lock_unlock((os_unfair_lock_t)(v86 + 80));
                                          *(_BYTE *)(v86 + 84) |= 0x20u;
                                        }
                                        v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v184, v191, 16);
                                        if (!v94)
                                        {
LABEL_151:

                                          break;
                                        }
                                      }
                                    }

                                    objc_msgSend(v165, "objectForKeyedSubscript:", v155);
                                    v101 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v102 = (void *)objc_msgSend(v101, "copy");
                                      v103 = v102;
                                      *(_BYTE *)(v86 + 84) |= 4u;
                                      *(_BYTE *)(v86 + 84) |= 0x20u;
                                      objc_storeStrong((id *)(v86 + 48), v102);

                                    }
                                  }

                                }
                                else
                                {
                                  v86 = 0;
                                }
                                v104 = (id)v86;
                                *(_BYTE *)(v171 + 76) |= 0x10u;
                                *(_BYTE *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 32), (id)v86);

                              }
                              objc_msgSend(v170, "objectForKeyedSubscript:", v157);
                              v105 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v106 = [GEOPDWebLinkParams alloc];
                                if (v106)
                                {
                                  v107 = v105;
                                  v108 = -[GEOPDWebLinkParams init](v106, "init");
                                  if (v108)
                                  {
                                    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("title"));
                                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v110 = (void *)objc_msgSend(v109, "copy");
                                      v111 = v110;
                                      *(_BYTE *)(v108 + 64) |= 8u;
                                      *(_BYTE *)(v108 + 64) |= 0x20u;
                                      objc_storeStrong((id *)(v108 + 32), v110);

                                    }
                                    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("url"));
                                    v112 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v113 = (void *)objc_msgSend(v112, "copy");
                                      v114 = v113;
                                      *(_BYTE *)(v108 + 64) |= 0x10u;
                                      *(_BYTE *)(v108 + 64) |= 0x20u;
                                      objc_storeStrong((id *)(v108 + 40), v113);

                                    }
                                    objc_msgSend(v107, "objectForKeyedSubscript:", CFSTR("icon"));
                                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v116 = [GEOPDIcon alloc];
                                      if (v116)
                                        v117 = (void *)-[GEOPDIcon _initWithDictionary:isJSON:](v116, v115, v153);
                                      else
                                        v117 = 0;
                                      v118 = v117;
                                      *(_BYTE *)(v108 + 64) |= 4u;
                                      *(_BYTE *)(v108 + 64) |= 0x20u;
                                      objc_storeStrong((id *)(v108 + 24), v117);

                                    }
                                    objc_msgSend(v107, "objectForKeyedSubscript:", v147);
                                    v119 = (void *)objc_claimAutoreleasedReturnValue();
                                    objc_opt_class();
                                    if ((objc_opt_isKindOfClass() & 1) != 0)
                                    {
                                      v120 = objc_msgSend(v119, "BOOLValue");
                                      *(_BYTE *)(v108 + 64) |= 0x20u;
                                      *(_BYTE *)(v108 + 64) |= 1u;
                                      *(_BYTE *)(v108 + 60) = v120;
                                    }

                                  }
                                }
                                else
                                {
                                  v108 = 0;
                                }
                                v121 = (id)v108;
                                *(_BYTE *)(v171 + 76) |= 0x40u;
                                *(_BYTE *)(v171 + 76) |= 0x80u;
                                objc_storeStrong((id *)(v171 + 48), (id)v108);

                              }
                              objc_msgSend(v170, "objectForKeyedSubscript:", v156);
                              v122 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v123 = objc_msgSend(v122, "unsignedIntValue");
                                *(_BYTE *)(v171 + 76) |= 0x80u;
                                *(_BYTE *)(v171 + 76) |= 2u;
                                *(_DWORD *)(v171 + 72) = v123;
                              }

                            }
                            -[GEOPDActionLink addLink:](v163, (void *)v171);
                          }
                          else
                          {
                            v171 = 0;
                            -[GEOPDActionLink addLink:](v163, 0);
                          }

                        }
                        v41 = v169 + 1;
                      }
                      while (v169 + 1 != v167);
                      v124 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v180, v190, 16);
                      v167 = v124;
                    }
                    while (v124);
                  }

                }
              }

              -[GEOPDActionData addActionLink:](v152, (void *)v163);
            }
            else
            {
              v163 = 0;
              -[GEOPDActionData addActionLink:](v152, 0);
            }

          }
          v34 = v146 + 1;
        }
        while (v146 + 1 != v144);
        v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v172, v188, 16);
        v144 = v125;
        if (!v125)
        {
LABEL_195:

          break;
        }
      }
    }

    if (v153)
      v126 = CFSTR("winningAdamId");
    else
      v126 = CFSTR("winning_adam_id");
    objc_msgSend(v140, "objectForKeyedSubscript:", v126);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v128 = (void *)objc_msgSend(v127, "copy");
      v129 = v128;
      *(_BYTE *)(v152 + 84) |= 0x40u;
      *(_BYTE *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 64), v128);

    }
    if (v153)
      v130 = CFSTR("categoryId");
    else
      v130 = CFSTR("category_id");
    objc_msgSend(v140, "objectForKeyedSubscript:", v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v132 = (void *)objc_msgSend(v131, "copy");
      v133 = v132;
      *(_BYTE *)(v152 + 84) |= 0x10u;
      *(_BYTE *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 48), v132);

    }
    if (v153)
      v134 = CFSTR("ownerAdamId");
    else
      v134 = CFSTR("owner_adam_id");
    objc_msgSend(v140, "objectForKeyedSubscript:", v134);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v136 = (void *)objc_msgSend(v135, "copy");
      v137 = v136;
      *(_BYTE *)(v152 + 84) |= 0x20u;
      *(_BYTE *)(v152 + 84) |= 0x80u;
      objc_storeStrong((id *)(v152 + 56), v136);

    }
    v5 = v140;
  }

  return v152;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDActionDataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PBDataReader *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (os_unfair_lock_assert_owner(&self->_readerLock), *(_BYTE *)&self->_flags <= 1u))
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
    -[GEOPDActionData readAll:]((uint64_t)self, 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = self->_actionTitles;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v21;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v21 != v8)
            objc_enumerationMutation(v6);
          PBDataWriterWriteSubmessage();
          ++v9;
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v7);
    }

    if (self->_actionSymbolImageName)
      PBDataWriterWriteStringField();
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = self->_actionLinks;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v17;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v10);
          PBDataWriterWriteSubmessage();
          ++v13;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v11);
    }

    if (self->_winningAdamId)
      PBDataWriterWriteStringField();
    if (self->_categoryId)
      PBDataWriterWriteStringField();
    if (self->_ownerAdamId)
      PBDataWriterWriteStringField();
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v16);
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  NSMutableArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
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
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
      GEOPDActionDataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      objc_sync_exit(v7);

      return (id)v5;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDActionData readAll:]((uint64_t)self, 0);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v8 = self->_actionTitles;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v32;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v11), "copyWithZone:", a3);
        -[GEOPDActionData addActionTitle:](v5, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v9);
  }

  v13 = -[NSString copyWithZone:](self->_actionSymbolImageName, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = self->_actionLinks;
  v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v15);
        v19 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (_QWORD)v27);
        -[GEOPDActionData addActionLink:](v5, v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }

  v20 = -[NSString copyWithZone:](self->_winningAdamId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v20;

  v22 = -[NSString copyWithZone:](self->_categoryId, "copyWithZone:", a3);
  v23 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v22;

  v24 = -[NSString copyWithZone:](self->_ownerAdamId, "copyWithZone:", a3);
  v25 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v24;

  objc_storeStrong((id *)(v5 + 16), self->_unknownFields);
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *actionTitles;
  NSString *actionSymbolImageName;
  NSMutableArray *actionLinks;
  NSString *winningAdamId;
  NSString *categoryId;
  NSString *ownerAdamId;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((-[GEOPDActionData readAll:]((uint64_t)self, 1),
         -[GEOPDActionData readAll:]((uint64_t)v4, 1),
         actionTitles = self->_actionTitles,
         !((unint64_t)actionTitles | v4[5]))
     || -[NSMutableArray isEqual:](actionTitles, "isEqual:"))
    && ((actionSymbolImageName = self->_actionSymbolImageName, !((unint64_t)actionSymbolImageName | v4[4]))
     || -[NSString isEqual:](actionSymbolImageName, "isEqual:"))
    && ((actionLinks = self->_actionLinks, !((unint64_t)actionLinks | v4[3]))
     || -[NSMutableArray isEqual:](actionLinks, "isEqual:"))
    && ((winningAdamId = self->_winningAdamId, !((unint64_t)winningAdamId | v4[8]))
     || -[NSString isEqual:](winningAdamId, "isEqual:"))
    && ((categoryId = self->_categoryId, !((unint64_t)categoryId | v4[6]))
     || -[NSString isEqual:](categoryId, "isEqual:")))
  {
    ownerAdamId = self->_ownerAdamId;
    if ((unint64_t)ownerAdamId | v4[7])
      v11 = -[NSString isEqual:](ownerAdamId, "isEqual:");
    else
      v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  -[GEOPDActionData readAll:]((uint64_t)self, 1);
  v3 = -[NSMutableArray hash](self->_actionTitles, "hash");
  v4 = -[NSString hash](self->_actionSymbolImageName, "hash") ^ v3;
  v5 = -[NSMutableArray hash](self->_actionLinks, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_winningAdamId, "hash");
  v7 = -[NSString hash](self->_categoryId, "hash");
  return v6 ^ v7 ^ -[NSString hash](self->_ownerAdamId, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_winningAdamId, 0);
  objc_storeStrong((id *)&self->_ownerAdamId, 0);
  objc_storeStrong((id *)&self->_categoryId, 0);
  objc_storeStrong((id *)&self->_actionTitles, 0);
  objc_storeStrong((id *)&self->_actionSymbolImageName, 0);
  objc_storeStrong((id *)&self->_actionLinks, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
