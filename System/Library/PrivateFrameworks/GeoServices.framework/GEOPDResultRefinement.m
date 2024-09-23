@implementation GEOPDResultRefinement

- (GEOPDResultRefinement)init
{
  GEOPDResultRefinement *v2;
  GEOPDResultRefinement *v3;
  GEOPDResultRefinement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDResultRefinement;
  v2 = -[GEOPDResultRefinement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDResultRefinement)initWithData:(id)a3
{
  GEOPDResultRefinement *v3;
  GEOPDResultRefinement *v4;
  GEOPDResultRefinement *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDResultRefinement;
  v3 = -[GEOPDResultRefinement initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
}

- (uint64_t)resultRefinementType
{
  uint64_t v1;
  __int16 v2;

  if (result)
  {
    v1 = result;
    os_unfair_lock_lock_with_options();
    v2 = *(_WORD *)(v1 + 88);
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 80));
    if ((v2 & 1) != 0)
      return *(unsigned int *)(v1 + 84);
    else
      return 0;
  }
  return result;
}

- (void)_readToggle
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readToggle_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)toggle
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinement _readToggle]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setToggle:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 0x80u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)_readMultiSelect
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 8) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readMultiSelect_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)multiSelect
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinement _readMultiSelect]((uint64_t)a1);
    a1 = (id *)v1[4];
  }
  return a1;
}

- (void)setMultiSelect:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 8u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 32), a2);
  }

}

- (void)_readSort
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x40) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSort_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)sort
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinement _readSort]((uint64_t)a1);
    a1 = (id *)v1[7];
  }
  return a1;
}

- (void)setSort:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 0x40u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 56), a2);
  }

}

- (void)_readGuidesHome
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 4) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGuidesHome_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (void)_readOpenOptions
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
    if ((*(_WORD *)(a1 + 88) & 0x10) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOpenOptions_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

- (id)openOptions
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDResultRefinement _readOpenOptions]((uint64_t)a1);
    a1 = (id *)v1[5];
  }
  return a1;
}

- (void)setOpenOptions:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_WORD *)(a1 + 88) |= 0x10u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    objc_storeStrong((id *)(a1 + 40), a2);
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
  v8.super_class = (Class)GEOPDResultRefinement;
  -[GEOPDResultRefinement description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDResultRefinement dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDResultRefinement _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  uint64_t v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v38[4];
  id v39;

  if (!a1)
    return 0;
  -[GEOPDResultRefinement readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_WORD *)(a1 + 88) & 1) != 0)
  {
    v5 = *(int *)(a1 + 84);
    if (v5 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 84));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E1C0DD20[v5];
    }
    if (a2)
      v7 = CFSTR("resultRefinementType");
    else
      v7 = CFSTR("result_refinement_type");
    objc_msgSend(v4, "setObject:forKey:", v6, v7);

  }
  -[GEOPDResultRefinement toggle]((id *)a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v8, "jsonRepresentation");
    else
      objc_msgSend(v8, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("toggle"));

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 80));
  if ((*(_WORD *)(a1 + 88) & 0x20) == 0)
  {
    v11 = *(void **)(a1 + 8);
    if (v11)
    {
      v12 = v11;
      objc_sync_enter(v12);
      GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRange_tags);
      objc_sync_exit(v12);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  v13 = *(id *)(a1 + 48);
  v14 = v13;
  if (v13)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v13, "jsonRepresentation");
    else
      objc_msgSend(v13, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("range"));

  }
  -[GEOPDResultRefinement multiSelect]((id *)a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v16, "jsonRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("multiSelect");
    }
    else
    {
      objc_msgSend(v16, "dictionaryRepresentation");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("multi_select");
    }
    objc_msgSend(v4, "setObject:forKey:", v18, v19);

  }
  -[GEOPDResultRefinement sort]((id *)a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    if ((a2 & 1) != 0)
      objc_msgSend(v20, "jsonRepresentation");
    else
      objc_msgSend(v20, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("sort"));

  }
  -[GEOPDResultRefinement _readGuidesHome](a1);
  v23 = *(id *)(a1 + 24);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("guidesHome");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("guides_home");
    }
    objc_msgSend(v4, "setObject:forKey:", v25, v26);

  }
  -[GEOPDResultRefinement openOptions]((id *)a1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v27, "jsonRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("openOptions");
    }
    else
    {
      objc_msgSend(v27, "dictionaryRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("open_options");
    }
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
      v38[2] = __51__GEOPDResultRefinement__dictionaryRepresentation___block_invoke;
      v38[3] = &unk_1E1C00600;
      v35 = v34;
      v39 = v35;
      objc_msgSend(v33, "enumerateKeysAndObjectsUsingBlock:", v38);
      v36 = v35;

      v33 = v36;
    }
    objc_msgSend(v4, "setObject:forKey:", v33, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDResultRefinement _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_338_0;
      else
        v6 = (int *)&readAll__nonRecursiveTag_339_0;
      GEOPDResultRefinementReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDResultRefinementCallReadAllRecursiveWithoutSynchronized((uint64_t *)a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
  }
}

void __51__GEOPDResultRefinement__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v4;
  const __CFString *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  GEOPDResultRefinementToggle *v10;
  void *v11;
  void *v12;
  GEOPDResultRefinementRange *v13;
  GEOPDResultRefinementRange *v14;
  id v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  int *v19;
  id v20;
  int v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  GEOPDResultRefinementRangeContinuous *v28;
  id v29;
  const __CFString *v30;
  void *v31;
  id v32;
  GEOPDResultRefinementRangeElement *v33;
  id v34;
  void *v35;
  id v36;
  const __CFString *v37;
  void *v38;
  id v39;
  GEOPDResultRefinementRangeElement *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  const __CFString *v46;
  void *v47;
  double v48;
  const __CFString *v49;
  void *v50;
  double v51;
  GEOPDResultRefinementRangeContinuous *v52;
  const __CFString *v53;
  void *v54;
  GEOPDResultRefinementRangeDiscrete *v55;
  id v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  GEOPDResultRefinementRangeElement *v64;
  void *v65;
  uint64_t v66;
  const __CFString *v67;
  void *v68;
  unsigned int v69;
  const __CFString *v70;
  void *v71;
  unsigned int v72;
  GEOPDResultRefinementRangeDiscrete *v73;
  id v74;
  const __CFString *v75;
  void *v76;
  GEOPDResultRefinementMultiSelect *v77;
  GEOPDResultRefinementMultiSelect *v78;
  id v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  uint64_t i;
  void *v94;
  GEOPDResultRefinementMultiSelectElement *v95;
  id v96;
  void *v97;
  void *v98;
  void *v99;
  char v100;
  void *v101;
  GEOStyleAttributes *v102;
  GEOStyleAttributes *v103;
  GEOStyleAttributes *v104;
  GEOStyleAttributes *v105;
  void *v106;
  GEOPDResultRefinementMetadata *v107;
  GEOPDResultRefinementMetadata *v108;
  GEOPDResultRefinementMetadata *v109;
  void *v110;
  id v111;
  int v112;
  void *v113;
  id v114;
  int v115;
  void *v116;
  unsigned int v117;
  const __CFString *v118;
  void *v119;
  int v120;
  const __CFString *v121;
  void *v122;
  id v123;
  int v124;
  const __CFString *v125;
  void *v126;
  char v127;
  const __CFString *v128;
  void *v129;
  void *v130;
  const __CFString *v131;
  void *v132;
  void *v133;
  void *v134;
  GEOPDResultRefinementSort *v135;
  GEOPDResultRefinementSort *v136;
  id v137;
  uint64_t v138;
  const __CFString *v139;
  void *v140;
  void *v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  const __CFString *v147;
  const __CFString *v148;
  uint64_t j;
  void *v150;
  GEOPDResultRefinementSortElement *v151;
  id v152;
  void *v153;
  void *v154;
  void *v155;
  GEOStyleAttributes *v156;
  GEOStyleAttributes *v157;
  GEOStyleAttributes *v158;
  GEOStyleAttributes *v159;
  void *v160;
  GEOPDResultRefinementMetadata *v161;
  GEOPDResultRefinementMetadata *v162;
  GEOPDResultRefinementMetadata *v163;
  void *v164;
  void *v165;
  id v166;
  const __CFString *v167;
  void *v168;
  int v169;
  const __CFString *v170;
  void *v171;
  int v172;
  const __CFString *v173;
  void *v174;
  GEOPDResultRefinementGuidesHome *v175;
  void *v176;
  id v177;
  const __CFString *v178;
  void *v179;
  GEOPDResultRefinementOpenOptions *v180;
  id v181;
  const __CFString *v182;
  void *v183;
  void *v184;
  const __CFString *v185;
  void *v186;
  GEOPDResultRefinementToggle *v187;
  void *v188;
  const __CFString *v189;
  void *v190;
  GEOPDResultRefinementTime *v191;
  id v192;
  void *v193;
  void *v194;
  void *v195;
  double v196;
  const __CFString *v197;
  void *v198;
  char v199;
  void *v200;
  GEOPDResultRefinementMetadata *v201;
  GEOPDResultRefinementMetadata *v202;
  GEOPDResultRefinementMetadata *v203;
  const __CFString *v204;
  void *v205;
  char v206;
  void *v208;
  id v209;
  void *v210;
  id v211;
  id v212;
  id v213;
  uint64_t v214;
  const __CFString *v215;
  const __CFString *v216;
  void *v217;
  const __CFString *v218;
  id v219;
  const __CFString *v220;
  void *v221;
  const __CFString *v222;
  const __CFString *v223;
  id v224;
  const __CFString *v225;
  const __CFString *v226;
  id v227;
  uint64_t v228;
  const __CFString *v229;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  _BYTE v235[128];
  uint64_t v236;

  v236 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1 || (v214 = objc_msgSend(a1, "init")) == 0)
  {
    v214 = 0;
    goto LABEL_362;
  }
  if (a3)
    v5 = CFSTR("resultRefinementType");
  else
    v5 = CFSTR("result_refinement_type");
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_UNKNOWN")) & 1) != 0)
    {
      v8 = 0;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_TOGGLE")) & 1) != 0)
    {
      v8 = 1;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_RANGE")) & 1) != 0)
    {
      v8 = 2;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_MULTI_SELECT")) & 1) != 0)
    {
      v8 = 3;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_SORT")) & 1) != 0)
    {
      v8 = 4;
    }
    else if ((objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_GUIDES_HOME")) & 1) != 0)
    {
      v8 = 5;
    }
    else if (objc_msgSend(v7, "isEqualToString:", CFSTR("RESULT_REFINEMENT_TYPE_OPEN_OPTIONS")))
    {
      v8 = 6;
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
      goto LABEL_27;
    v8 = objc_msgSend(v6, "intValue");
  }
  *(_WORD *)(v214 + 88) |= 0x100u;
  *(_WORD *)(v214 + 88) |= 1u;
  *(_DWORD *)(v214 + 84) = v8;
LABEL_27:

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("toggle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = [GEOPDResultRefinementToggle alloc];
    if (v10)
      v11 = (void *)-[GEOPDResultRefinementToggle _initWithDictionary:isJSON:](v10, v9, a3);
    else
      v11 = 0;
    -[GEOPDResultRefinement setToggle:](v214, v11);

  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("range"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = [GEOPDResultRefinementRange alloc];
    if (!v13)
    {
      v16 = 0;
      goto LABEL_125;
    }
    v14 = v13;
    v15 = v12;
    v16 = -[GEOPDResultRefinementRange init](v14, "init");
    if (!v16)
    {
LABEL_124:

LABEL_125:
      v74 = (id)v16;
      *(_WORD *)(v214 + 88) |= 0x20u;
      *(_WORD *)(v214 + 88) |= 0x100u;
      objc_storeStrong((id *)(v214 + 48), (id)v16);

      goto LABEL_126;
    }
    if (a3)
      v17 = CFSTR("rangeType");
    else
      v17 = CFSTR("range_type");
    objc_msgSend(v15, "objectForKeyedSubscript:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v19 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v18;
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RESULT_REFINEMENT_RANGE_TYPE_UNKNOWN")) & 1) != 0)
      {
        v21 = 0;
      }
      else if ((objc_msgSend(v20, "isEqualToString:", CFSTR("RESULT_REFINEMENT_RANGE_TYPE_CONTINUOUS")) & 1) != 0)
      {
        v21 = 1;
      }
      else if (objc_msgSend(v20, "isEqualToString:", CFSTR("RESULT_REFINEMENT_RANGE_TYPE_DISCRETE")))
      {
        v21 = 2;
      }
      else
      {
        v21 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_49:

        if (a3)
          v22 = CFSTR("displayName");
        else
          v22 = CFSTR("display_name");
        objc_msgSend(v15, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = (void *)objc_msgSend(v23, "copy");
          v25 = v24;
          *(_BYTE *)(v16 + 64) |= 4u;
          *(_BYTE *)(v16 + 64) |= 0x20u;
          objc_storeStrong((id *)(v16 + 24), v24);

        }
        if (a3)
          v26 = CFSTR("rangeContinuous");
        else
          v26 = CFSTR("range_continuous");
        objc_msgSend(v15, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v28 = [GEOPDResultRefinementRangeContinuous alloc];
          if (v28)
          {
            v29 = v27;
            v28 = -[GEOPDResultRefinementRangeContinuous init](v28, "init");
            if (v28)
            {
              if (a3)
                v30 = CFSTR("elementMinimum");
              else
                v30 = CFSTR("element_minimum");
              objc_msgSend(v29, "objectForKeyedSubscript:", v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = v15;
                v33 = [GEOPDResultRefinementRangeElement alloc];
                v34 = v4;
                if (v33)
                  v35 = (void *)-[GEOPDResultRefinementRangeElement _initWithDictionary:isJSON:](v33, v31, a3);
                else
                  v35 = 0;
                v36 = v35;
                *(_BYTE *)&v28->_flags |= 0x20u;
                *(_BYTE *)&v28->_flags |= 0x40u;
                objc_storeStrong((id *)&v28->_elementMinimum, v35);

                v4 = v34;
                v15 = v32;
                v19 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
              }

              if (a3)
                v37 = CFSTR("elementMaximum");
              else
                v37 = CFSTR("element_maximum");
              objc_msgSend(v29, "objectForKeyedSubscript:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v39 = v15;
                v40 = [GEOPDResultRefinementRangeElement alloc];
                v41 = v4;
                if (v40)
                  v42 = (void *)-[GEOPDResultRefinementRangeElement _initWithDictionary:isJSON:](v40, v38, a3);
                else
                  v42 = 0;
                v43 = v42;
                *(_BYTE *)&v28->_flags |= 0x10u;
                *(_BYTE *)&v28->_flags |= 0x40u;
                objc_storeStrong((id *)&v28->_elementMaximum, v42);

                v4 = v41;
                v15 = v39;
                v19 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
              }

              objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("increment"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v44, "doubleValue");
                *(_BYTE *)&v28->_flags |= 0x40u;
                *(_BYTE *)&v28->_flags |= 4u;
                v28->_increment = v45;
              }

              if (a3)
                v46 = CFSTR("currentMinValue");
              else
                v46 = CFSTR("current_min_value");
              objc_msgSend(v29, "objectForKeyedSubscript:", v46);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v47, "doubleValue");
                *(_BYTE *)&v28->_flags |= 0x40u;
                *(_BYTE *)&v28->_flags |= 2u;
                v28->_currentMinValue = v48;
              }

              if (a3)
                v49 = CFSTR("currentMaxValue");
              else
                v49 = CFSTR("current_max_value");
              objc_msgSend(v29, "objectForKeyedSubscript:", v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v50, "doubleValue");
                *(_BYTE *)&v28->_flags |= 0x40u;
                *(_BYTE *)&v28->_flags |= 1u;
                v28->_currentMaxValue = v51;
              }

            }
          }
          v52 = v28;
          *(_BYTE *)(v16 + v19[78]) |= 8u;
          *(_BYTE *)(v16 + v19[78]) |= 0x20u;
          objc_storeStrong((id *)(v16 + 32), v28);

        }
        if (a3)
          v53 = CFSTR("rangeDiscrete");
        else
          v53 = CFSTR("range_discrete");
        objc_msgSend(v15, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v55 = [GEOPDResultRefinementRangeDiscrete alloc];
          if (v55)
          {
            v56 = v54;
            v55 = -[GEOPDResultRefinementRangeDiscrete init](v55, "init");
            if (v55)
            {
              objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("element"));
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v224 = v56;
                v227 = v15;
                v211 = v4;
                v233 = 0u;
                v234 = 0u;
                v231 = 0u;
                v232 = 0u;
                v58 = v57;
                v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v231, v235, 16);
                if (v59)
                {
                  v60 = v59;
                  v61 = *(_QWORD *)v232;
                  do
                  {
                    v62 = 0;
                    do
                    {
                      if (*(_QWORD *)v232 != v61)
                        objc_enumerationMutation(v58);
                      v63 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * v62);
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v64 = [GEOPDResultRefinementRangeElement alloc];
                        if (v64)
                          v65 = (void *)-[GEOPDResultRefinementRangeElement _initWithDictionary:isJSON:](v64, v63, a3);
                        else
                          v65 = 0;
                        -[GEOPDResultRefinementRangeDiscrete addElement:]((uint64_t)v55, v65);

                      }
                      ++v62;
                    }
                    while (v60 != v62);
                    v66 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v231, v235, 16);
                    v60 = v66;
                  }
                  while (v66);
                }

                v4 = v211;
                v56 = v224;
                v15 = v227;
                v19 = &OBJC_IVAR___GEOPDRelatedEntitySection__reader;
              }

              if (a3)
                v67 = CFSTR("selectedMinElementIndex");
              else
                v67 = CFSTR("selected_min_element_index");
              objc_msgSend(v56, "objectForKeyedSubscript:", v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v69 = objc_msgSend(v68, "unsignedIntValue");
                *(_BYTE *)&v55->_flags |= 2u;
                v55->_selectedMinElementIndex = v69;
              }

              if (a3)
                v70 = CFSTR("selectedMaxElementIndex");
              else
                v70 = CFSTR("selected_max_element_index");
              objc_msgSend(v56, "objectForKeyedSubscript:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v72 = objc_msgSend(v71, "unsignedIntValue");
                *(_BYTE *)&v55->_flags |= 1u;
                v55->_selectedMaxElementIndex = v72;
              }

            }
          }
          v73 = v55;
          *(_BYTE *)(v16 + v19[78]) |= 0x10u;
          *(_BYTE *)(v16 + v19[78]) |= 0x20u;
          objc_storeStrong((id *)(v16 + 40), v55);

        }
        goto LABEL_124;
      }
      v21 = objc_msgSend(v18, "intValue");
    }
    *(_BYTE *)(v16 + 64) |= 0x20u;
    *(_BYTE *)(v16 + 64) |= 1u;
    *(_DWORD *)(v16 + 60) = v21;
    goto LABEL_49;
  }
LABEL_126:

  if (a3)
    v75 = CFSTR("multiSelect");
  else
    v75 = CFSTR("multi_select");
  objc_msgSend(v4, "objectForKeyedSubscript:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_250;
  v77 = [GEOPDResultRefinementMultiSelect alloc];
  if (!v77)
  {
    v228 = 0;
    goto LABEL_249;
  }
  v78 = v77;
  v79 = v76;
  v228 = -[GEOPDResultRefinementMultiSelect init](v78, "init");
  if (v228)
  {
    if (a3)
      v80 = CFSTR("displayName");
    else
      v80 = CFSTR("display_name");
    v225 = v80;
    objc_msgSend(v79, "objectForKeyedSubscript:");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v82 = (void *)objc_msgSend(v81, "copy");
      -[GEOPDResultRefinementMultiSelect setDisplayName:](v228, v82);

    }
    objc_msgSend(v79, "objectForKeyedSubscript:", v75);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v209 = v79;
      v210 = v76;
      v212 = v4;
      v233 = 0u;
      v234 = 0u;
      v231 = 0u;
      v232 = 0u;
      v208 = v83;
      v84 = v83;
      v85 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v231, v235, 16);
      if (!v85)
        goto LABEL_215;
      v86 = v85;
      v87 = *(_QWORD *)v232;
      if (a3)
        v88 = CFSTR("isSelected");
      else
        v88 = CFSTR("is_selected");
      v89 = CFSTR("style_attributes");
      if (a3)
        v89 = CFSTR("styleAttributes");
      v220 = v89;
      v222 = v88;
      if (a3)
        v90 = CFSTR("elementType");
      else
        v90 = CFSTR("element_type");
      v91 = CFSTR("evChargingConnectorType");
      if (!a3)
        v91 = CFSTR("ev_charging_connector_type");
      v216 = v91;
      v218 = v90;
      v92 = CFSTR("selection_sequence_number");
      if (a3)
        v92 = CFSTR("selectionSequenceNumber");
      v215 = v92;
      while (1)
      {
        for (i = 0; i != v86; ++i)
        {
          if (*(_QWORD *)v232 != v87)
            objc_enumerationMutation(v84);
          v94 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v95 = [GEOPDResultRefinementMultiSelectElement alloc];
            if (v95)
            {
              v96 = v94;
              v95 = -[GEOPDResultRefinementMultiSelectElement init](v95, "init");
              if (v95)
              {
                objc_msgSend(v96, "objectForKeyedSubscript:", v225);
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v98 = (void *)objc_msgSend(v97, "copy");
                  -[GEOPDResultRefinementMultiSelectElement setDisplayName:]((uint64_t)v95, v98);

                }
                objc_msgSend(v96, "objectForKeyedSubscript:", v222);
                v99 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v100 = objc_msgSend(v99, "BOOLValue");
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 8u;
                  v95->_isSelected = v100;
                }

                objc_msgSend(v96, "objectForKeyedSubscript:", v220);
                v101 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v102 = [GEOStyleAttributes alloc];
                  if ((a3 & 1) != 0)
                    v103 = -[GEOStyleAttributes initWithJSON:](v102, "initWithJSON:", v101);
                  else
                    v103 = -[GEOStyleAttributes initWithDictionary:](v102, "initWithDictionary:", v101);
                  v104 = v103;
                  v105 = v103;
                  *(_WORD *)&v95->_flags |= 0x80u;
                  *(_WORD *)&v95->_flags |= 0x100u;
                  objc_storeStrong((id *)&v95->_styleAttributes, v104);

                }
                objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("metadata"));
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v107 = [GEOPDResultRefinementMetadata alloc];
                  if ((a3 & 1) != 0)
                    v108 = -[GEOPDResultRefinementMetadata initWithJSON:](v107, "initWithJSON:", v106);
                  else
                    v108 = -[GEOPDResultRefinementMetadata initWithDictionary:](v107, "initWithDictionary:", v106);
                  v109 = v108;
                  -[GEOPDResultRefinementMultiSelectElement setMetadata:]((uint64_t)v95, v108);

                }
                objc_msgSend(v96, "objectForKeyedSubscript:", v218);
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v111 = v110;
                  if ((objc_msgSend(v111, "isEqualToString:", CFSTR("RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_DEFAULT")) & 1) != 0)v112 = 0;
                  else
                    v112 = objc_msgSend(v111, "isEqualToString:", CFSTR("RESULT_REFINEMENT_MULTI_SELECT_ELEMENT_TYPE_EV_CHARGING"));

LABEL_179:
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 1u;
                  v95->_elementType = v112;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v112 = objc_msgSend(v110, "intValue");
                    goto LABEL_179;
                  }
                }

                objc_msgSend(v96, "objectForKeyedSubscript:", v216);
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v114 = v113;
                  if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_UNKNOWN")) & 1) != 0)
                  {
                    v115 = 0;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CHADEMO")) & 1) != 0)
                  {
                    v115 = 1;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_J1772")) & 1) != 0)
                  {
                    v115 = 2;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_TESLA")) & 1) != 0)
                  {
                    v115 = 3;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS1")) & 1) != 0)
                  {
                    v115 = 4;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_CCS2")) & 1) != 0)
                  {
                    v115 = 5;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT1")) & 1) != 0)
                  {
                    v115 = 6;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_GBT2")) & 1) != 0)
                  {
                    v115 = 7;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_MENNEKES")) & 1) != 0)
                  {
                    v115 = 8;
                  }
                  else if ((objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_AC")) & 1) != 0)
                  {
                    v115 = 9;
                  }
                  else if (objc_msgSend(v114, "isEqualToString:", CFSTR("CONNECTOR_TYPE_NACS_DC")))
                  {
                    v115 = 10;
                  }
                  else
                  {
                    v115 = 0;
                  }

LABEL_207:
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 2u;
                  v95->_evChargingConnectorType = v115;
                }
                else
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v115 = objc_msgSend(v113, "intValue");
                    goto LABEL_207;
                  }
                }

                objc_msgSend(v96, "objectForKeyedSubscript:", v215);
                v116 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v117 = objc_msgSend(v116, "unsignedIntValue");
                  *(_WORD *)&v95->_flags |= 0x100u;
                  *(_WORD *)&v95->_flags |= 4u;
                  v95->_selectionSequenceNumber = v117;
                }

              }
            }
            -[GEOPDResultRefinementMultiSelect addMultiSelect:](v228, v95);

            continue;
          }
        }
        v86 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v231, v235, 16);
        if (!v86)
        {
LABEL_215:

          v76 = v210;
          v4 = v212;
          v83 = v208;
          v79 = v209;
          break;
        }
      }
    }

    if (a3)
      v118 = CFSTR("maxNumSelectElements");
    else
      v118 = CFSTR("max_num_select_elements");
    objc_msgSend(v79, "objectForKeyedSubscript:", v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v120 = objc_msgSend(v119, "unsignedIntValue");
      *(_WORD *)(v228 + 80) |= 0x100u;
      *(_WORD *)(v228 + 80) |= 2u;
      *(_DWORD *)(v228 + 72) = v120;
    }

    if (a3)
      v121 = CFSTR("clauseType");
    else
      v121 = CFSTR("clause_type");
    objc_msgSend(v79, "objectForKeyedSubscript:", v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v123 = v122;
      if ((objc_msgSend(v123, "isEqualToString:", CFSTR("RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ANY")) & 1) != 0)
        v124 = 0;
      else
        v124 = objc_msgSend(v123, "isEqualToString:", CFSTR("RESULT_REFINEMENT_MULTI_SELECT_CLAUSE_TYPE_ALL"));

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_232:

        if (a3)
          v125 = CFSTR("showEqualWidthButtonsOnFilterView");
        else
          v125 = CFSTR("show_equal_width_buttons_on_filter_view");
        objc_msgSend(v79, "objectForKeyedSubscript:", v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v127 = objc_msgSend(v126, "BOOLValue");
          *(_WORD *)(v228 + 80) |= 0x100u;
          *(_WORD *)(v228 + 80) |= 4u;
          *(_BYTE *)(v228 + 76) = v127;
        }

        if (a3)
          v128 = CFSTR("displayNameForMultiSelected");
        else
          v128 = CFSTR("display_name_for_multi_selected");
        objc_msgSend(v79, "objectForKeyedSubscript:", v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v130 = (void *)objc_msgSend(v129, "copy");
          -[GEOPDResultRefinementMultiSelect setDisplayNameForMultiSelected:](v228, v130);

        }
        if (a3)
          v131 = CFSTR("multiSelectIdentifier");
        else
          v131 = CFSTR("multi_select_identifier");
        objc_msgSend(v79, "objectForKeyedSubscript:", v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v133 = (void *)objc_msgSend(v132, "copy");
          -[GEOPDResultRefinementMultiSelect setMultiSelectIdentifier:](v228, v133);

        }
        goto LABEL_248;
      }
      v124 = objc_msgSend(v122, "intValue");
    }
    *(_WORD *)(v228 + 80) |= 0x100u;
    *(_WORD *)(v228 + 80) |= 1u;
    *(_DWORD *)(v228 + 68) = v124;
    goto LABEL_232;
  }
LABEL_248:

LABEL_249:
  -[GEOPDResultRefinement setMultiSelect:](v214, (void *)v228);

LABEL_250:
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sort"));
  v134 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v135 = [GEOPDResultRefinementSort alloc];
    if (v135)
    {
      v136 = v135;
      v137 = v134;
      v138 = -[GEOPDResultRefinementSort init](v136, "init");
      if (v138)
      {
        if (a3)
          v139 = CFSTR("displayName");
        else
          v139 = CFSTR("display_name");
        v229 = v139;
        objc_msgSend(v137, "objectForKeyedSubscript:");
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v141 = (void *)objc_msgSend(v140, "copy");
          -[GEOPDResultRefinementSort setDisplayName:](v138, v141);

        }
        objc_msgSend(v137, "objectForKeyedSubscript:", CFSTR("sort"));
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v219 = v137;
          v221 = v134;
          v213 = v4;
          v233 = 0u;
          v234 = 0u;
          v231 = 0u;
          v232 = 0u;
          v217 = v142;
          v143 = v142;
          v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v231, v235, 16);
          if (v144)
          {
            v145 = v144;
            v146 = *(_QWORD *)v232;
            if (a3)
              v147 = CFSTR("styleAttributes");
            else
              v147 = CFSTR("style_attributes");
            v148 = CFSTR("displayNameInBar");
            if (!a3)
              v148 = CFSTR("display_name_in_bar");
            v223 = v148;
            v226 = v147;
            do
            {
              for (j = 0; j != v145; ++j)
              {
                if (*(_QWORD *)v232 != v146)
                  objc_enumerationMutation(v143);
                v150 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v151 = [GEOPDResultRefinementSortElement alloc];
                  if (v151)
                  {
                    v152 = v150;
                    v151 = -[GEOPDResultRefinementSortElement init](v151, "init");
                    if (v151)
                    {
                      objc_msgSend(v152, "objectForKeyedSubscript:", v229);
                      v153 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v154 = (void *)objc_msgSend(v153, "copy");
                        -[GEOPDResultRefinementSortElement setDisplayName:]((uint64_t)v151, v154);

                      }
                      objc_msgSend(v152, "objectForKeyedSubscript:", v226);
                      v155 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v156 = [GEOStyleAttributes alloc];
                        if ((a3 & 1) != 0)
                          v157 = -[GEOStyleAttributes initWithJSON:](v156, "initWithJSON:", v155);
                        else
                          v157 = -[GEOStyleAttributes initWithDictionary:](v156, "initWithDictionary:", v155);
                        v158 = v157;
                        v159 = v157;
                        *(_BYTE *)&v151->_flags |= 0x10u;
                        *(_BYTE *)&v151->_flags |= 0x20u;
                        objc_storeStrong((id *)&v151->_styleAttributes, v158);

                      }
                      objc_msgSend(v152, "objectForKeyedSubscript:", CFSTR("metadata"));
                      v160 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v161 = [GEOPDResultRefinementMetadata alloc];
                        if ((a3 & 1) != 0)
                          v162 = -[GEOPDResultRefinementMetadata initWithJSON:](v161, "initWithJSON:", v160);
                        else
                          v162 = -[GEOPDResultRefinementMetadata initWithDictionary:](v161, "initWithDictionary:", v160);
                        v163 = v162;
                        -[GEOPDResultRefinementSortElement setMetadata:]((uint64_t)v151, v162);

                      }
                      objc_msgSend(v152, "objectForKeyedSubscript:", v223);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v165 = (void *)objc_msgSend(v164, "copy");
                        v166 = v165;
                        *(_BYTE *)&v151->_flags |= 2u;
                        *(_BYTE *)&v151->_flags |= 0x20u;
                        objc_storeStrong((id *)&v151->_displayNameInBar, v165);

                      }
                    }

                  }
                  -[GEOPDResultRefinementSort addSort:](v138, v151);

                }
              }
              v145 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v231, v235, 16);
            }
            while (v145);
          }

          v4 = v213;
          v137 = v219;
          v134 = v221;
          v142 = v217;
        }

        if (a3)
          v167 = CFSTR("selectedElementIndex");
        else
          v167 = CFSTR("selected_element_index");
        objc_msgSend(v137, "objectForKeyedSubscript:", v167);
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v169 = objc_msgSend(v168, "unsignedIntValue");
          *(_BYTE *)(v138 + 60) |= 0x20u;
          *(_BYTE *)(v138 + 60) |= 2u;
          *(_DWORD *)(v138 + 56) = v169;
        }

        if (a3)
          v170 = CFSTR("defaultSelectedElementIndex");
        else
          v170 = CFSTR("default_selected_element_index");
        objc_msgSend(v137, "objectForKeyedSubscript:", v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v172 = objc_msgSend(v171, "unsignedIntValue");
          *(_BYTE *)(v138 + 60) |= 0x20u;
          *(_BYTE *)(v138 + 60) |= 1u;
          *(_DWORD *)(v138 + 52) = v172;
        }

      }
    }
    else
    {
      v138 = 0;
    }
    -[GEOPDResultRefinement setSort:](v214, (void *)v138);

  }
  if (a3)
    v173 = CFSTR("guidesHome");
  else
    v173 = CFSTR("guides_home");
  objc_msgSend(v4, "objectForKeyedSubscript:", v173);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v175 = [GEOPDResultRefinementGuidesHome alloc];
    if (v175)
      v176 = (void *)-[GEOPDResultRefinementGuidesHome _initWithDictionary:isJSON:]((uint64_t)v175, v174, a3);
    else
      v176 = 0;
    v177 = v176;
    *(_WORD *)(v214 + 88) |= 4u;
    *(_WORD *)(v214 + 88) |= 0x100u;
    objc_storeStrong((id *)(v214 + 24), v176);

  }
  if (a3)
    v178 = CFSTR("openOptions");
  else
    v178 = CFSTR("open_options");
  objc_msgSend(v4, "objectForKeyedSubscript:", v178);
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v180 = [GEOPDResultRefinementOpenOptions alloc];
    if (v180)
    {
      v181 = v179;
      v180 = -[GEOPDResultRefinementOpenOptions init](v180, "init");
      if (v180)
      {
        if (a3)
          v182 = CFSTR("displayName");
        else
          v182 = CFSTR("display_name");
        objc_msgSend(v181, "objectForKeyedSubscript:", v182);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v184 = (void *)objc_msgSend(v183, "copy");
          -[GEOPDResultRefinementOpenOptions setDisplayName:]((uint64_t)v180, v184);

        }
        if (a3)
          v185 = CFSTR("openNow");
        else
          v185 = CFSTR("open_now");
        objc_msgSend(v181, "objectForKeyedSubscript:", v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v187 = [GEOPDResultRefinementToggle alloc];
          if (v187)
            v188 = (void *)-[GEOPDResultRefinementToggle _initWithDictionary:isJSON:](v187, v186, a3);
          else
            v188 = 0;
          -[GEOPDResultRefinementOpenOptions setOpenNow:]((uint64_t)v180, v188);

        }
        if (a3)
          v189 = CFSTR("openAt");
        else
          v189 = CFSTR("open_at");
        objc_msgSend(v181, "objectForKeyedSubscript:", v189);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v191 = [GEOPDResultRefinementTime alloc];
          if (v191)
          {
            v192 = v190;
            v191 = -[GEOPDResultRefinementTime init](v191, "init");
            if (v191)
            {
              objc_msgSend(v192, "objectForKeyedSubscript:", v182);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v194 = (void *)objc_msgSend(v193, "copy");
                -[GEOPDResultRefinementTime setDisplayName:]((uint64_t)v191, v194);

              }
              objc_msgSend(v192, "objectForKeyedSubscript:", CFSTR("timestamp"));
              v195 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v195, "doubleValue");
                *(_BYTE *)&v191->_flags |= 0x40u;
                *(_BYTE *)&v191->_flags |= 1u;
                v191->_timestamp = v196;
              }

              if (a3)
                v197 = CFSTR("isSelected");
              else
                v197 = CFSTR("is_selected");
              objc_msgSend(v192, "objectForKeyedSubscript:", v197);
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v199 = objc_msgSend(v198, "BOOLValue");
                *(_BYTE *)&v191->_flags |= 0x40u;
                *(_BYTE *)&v191->_flags |= 2u;
                v191->_isSelected = v199;
              }

              objc_msgSend(v192, "objectForKeyedSubscript:", CFSTR("metadata"));
              v200 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v201 = [GEOPDResultRefinementMetadata alloc];
                if ((a3 & 1) != 0)
                  v202 = -[GEOPDResultRefinementMetadata initWithJSON:](v201, "initWithJSON:", v200);
                else
                  v202 = -[GEOPDResultRefinementMetadata initWithDictionary:](v201, "initWithDictionary:", v200);
                v203 = v202;
                -[GEOPDResultRefinementTime setMetadata:]((uint64_t)v191, v202);

              }
              if (a3)
                v204 = CFSTR("usedNextDayForFilteration");
              else
                v204 = CFSTR("used_next_day_for_filteration");
              objc_msgSend(v192, "objectForKeyedSubscript:", v204);
              v205 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v206 = objc_msgSend(v205, "BOOLValue");
                *(_BYTE *)&v191->_flags |= 0x40u;
                *(_BYTE *)&v191->_flags |= 4u;
                v191->_usedNextDayForFilteration = v206;
              }

            }
          }
          -[GEOPDResultRefinementOpenOptions setOpenAt:]((uint64_t)v180, v191);

        }
      }

    }
    -[GEOPDResultRefinement setOpenOptions:](v214, v180);

  }
LABEL_362:

  return v214;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDResultRefinementReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  id v5;
  PBDataReader *v6;
  void *v7;
  id v8;

  v8 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDResultRefinementIsDirty((uint64_t)self) & 1) == 0)
  {
    v6 = self->_reader;
    objc_sync_enter(v6);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "writeData:", v7);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_readerLock);
    -[GEOPDResultRefinement readAll:]((uint64_t)self, 0);
    if ((*(_WORD *)&self->_flags & 1) != 0)
      PBDataWriterWriteInt32Field();
    v5 = v8;
    if (self->_toggle)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_range)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_multiSelect)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_sort)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_guidesHome)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    if (self->_openOptions)
    {
      PBDataWriterWriteSubmessage();
      v5 = v8;
    }
    -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);
  }

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDResultRefinement _readGuidesHome](result);
    return -[GEOPDResultRefinementGuidesHome hasGreenTeaWithValue:](*(_QWORD *)(v3 + 24), a2);
  }
  return result;
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
  void *v20;
  PBUnknownFields *v21;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_WORD *)&self->_flags & 0x100) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDResultRefinementReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_8;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDResultRefinement readAll:]((uint64_t)self, 0);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    *(_DWORD *)(v5 + 84) = self->_resultRefinementType;
    *(_WORD *)(v5 + 88) |= 1u;
  }
  v9 = -[GEOPDResultRefinementToggle copyWithZone:](self->_toggle, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v9;

  v11 = -[GEOPDResultRefinementRange copyWithZone:](self->_range, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v11;

  v13 = -[GEOPDResultRefinementMultiSelect copyWithZone:](self->_multiSelect, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v13;

  v15 = -[GEOPDResultRefinementSort copyWithZone:](self->_sort, "copyWithZone:", a3);
  v16 = *(void **)(v5 + 56);
  *(_QWORD *)(v5 + 56) = v15;

  v17 = -[GEOPDResultRefinementGuidesHome copyWithZone:](self->_guidesHome, "copyWithZone:", a3);
  v18 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v17;

  v19 = -[GEOPDResultRefinementOpenOptions copyWithZone:](self->_openOptions, "copyWithZone:", a3);
  v20 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v19;

  v21 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v21;
LABEL_8:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  __int16 v5;
  GEOPDResultRefinementToggle *toggle;
  GEOPDResultRefinementRange *range;
  GEOPDResultRefinementMultiSelect *multiSelect;
  GEOPDResultRefinementSort *sort;
  GEOPDResultRefinementGuidesHome *guidesHome;
  GEOPDResultRefinementOpenOptions *openOptions;
  char v12;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_19;
  -[GEOPDResultRefinement readAll:]((uint64_t)self, 1);
  -[GEOPDResultRefinement readAll:]((uint64_t)v4, 1);
  v5 = *((_WORD *)v4 + 44);
  if ((*(_WORD *)&self->_flags & 1) != 0)
  {
    if ((v5 & 1) == 0 || self->_resultRefinementType != *((_DWORD *)v4 + 21))
      goto LABEL_19;
  }
  else if ((v5 & 1) != 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  toggle = self->_toggle;
  if ((unint64_t)toggle | *((_QWORD *)v4 + 8) && !-[GEOPDResultRefinementToggle isEqual:](toggle, "isEqual:"))
    goto LABEL_19;
  range = self->_range;
  if ((unint64_t)range | *((_QWORD *)v4 + 6))
  {
    if (!-[GEOPDResultRefinementRange isEqual:](range, "isEqual:"))
      goto LABEL_19;
  }
  multiSelect = self->_multiSelect;
  if ((unint64_t)multiSelect | *((_QWORD *)v4 + 4))
  {
    if (!-[GEOPDResultRefinementMultiSelect isEqual:](multiSelect, "isEqual:"))
      goto LABEL_19;
  }
  sort = self->_sort;
  if ((unint64_t)sort | *((_QWORD *)v4 + 7))
  {
    if (!-[GEOPDResultRefinementSort isEqual:](sort, "isEqual:"))
      goto LABEL_19;
  }
  guidesHome = self->_guidesHome;
  if ((unint64_t)guidesHome | *((_QWORD *)v4 + 3))
  {
    if (!-[GEOPDResultRefinementGuidesHome isEqual:](guidesHome, "isEqual:"))
      goto LABEL_19;
  }
  openOptions = self->_openOptions;
  if ((unint64_t)openOptions | *((_QWORD *)v4 + 5))
    v12 = -[GEOPDResultRefinementOpenOptions isEqual:](openOptions, "isEqual:");
  else
    v12 = 1;
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  -[GEOPDResultRefinement readAll:]((uint64_t)self, 1);
  if ((*(_WORD *)&self->_flags & 1) != 0)
    v3 = 2654435761 * self->_resultRefinementType;
  else
    v3 = 0;
  v4 = -[GEOPDResultRefinementToggle hash](self->_toggle, "hash") ^ v3;
  v5 = -[GEOPDResultRefinementRange hash](self->_range, "hash");
  v6 = v4 ^ v5 ^ -[GEOPDResultRefinementMultiSelect hash](self->_multiSelect, "hash");
  v7 = -[GEOPDResultRefinementSort hash](self->_sort, "hash");
  v8 = v7 ^ -[GEOPDResultRefinementGuidesHome hash](self->_guidesHome, "hash");
  return v6 ^ v8 ^ -[GEOPDResultRefinementOpenOptions hash](self->_openOptions, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_WORD *)(a1 + 88) |= 2u;
    *(_WORD *)(a1 + 88) |= 0x100u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 80));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDResultRefinement readAll:](a1, 0);
      -[GEOPDResultRefinementToggle clearUnknownFields:](*(_QWORD *)(a1 + 64), 1);
      -[GEOPDResultRefinementRange clearUnknownFields:](*(_QWORD *)(a1 + 48), 1);
      -[GEOPDResultRefinementMultiSelect clearUnknownFields:](*(_QWORD *)(a1 + 32), 1);
      -[GEOPDResultRefinementSort clearUnknownFields:](*(_QWORD *)(a1 + 56), 1);
      -[GEOPDResultRefinementGuidesHome clearUnknownFields:](*(_QWORD *)(a1 + 24), 1);
      -[GEOPDResultRefinementOpenOptions clearUnknownFields:](*(_QWORD *)(a1 + 40), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggle, 0);
  objc_storeStrong((id *)&self->_sort, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_openOptions, 0);
  objc_storeStrong((id *)&self->_multiSelect, 0);
  objc_storeStrong((id *)&self->_guidesHome, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
