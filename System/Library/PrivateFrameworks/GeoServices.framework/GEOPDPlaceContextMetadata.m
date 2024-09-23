@implementation GEOPDPlaceContextMetadata

- (GEOPDPlaceContextMetadata)init
{
  GEOPDPlaceContextMetadata *v2;
  GEOPDPlaceContextMetadata *v3;
  GEOPDPlaceContextMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDPlaceContextMetadata;
  v2 = -[GEOPDPlaceContextMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDPlaceContextMetadata)initWithData:(id)a3
{
  GEOPDPlaceContextMetadata *v3;
  GEOPDPlaceContextMetadata *v4;
  GEOPDPlaceContextMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDPlaceContextMetadata;
  v3 = -[GEOPDPlaceContextMetadata initWithData:](&v7, sel_initWithData_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_readerLock._os_unfair_lock_opaque = 0;
    v5 = v3;
  }

  return v4;
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
  v8.super_class = (Class)GEOPDPlaceContextMetadata;
  -[GEOPDPlaceContextMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceContextMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  const __CFString *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;

  if (!a1)
    return 0;
  -[GEOPDPlaceContextMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(a1 + 64);
  if ((v5 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("muid"));

    v5 = *(_BYTE *)(a1 + 64);
  }
  if ((v5 & 2) != 0)
  {
    v7 = *(int *)(a1 + 60);
    if (v7 >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(int *)(a1 + 60));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E1C0BF78[v7];
    }
    if (a2)
      v9 = CFSTR("placeContextMetadataType");
    else
      v9 = CFSTR("place_context_metadata_type");
    objc_msgSend(v4, "setObject:forKey:", v8, v9);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 0x10) == 0)
  {
    v10 = *(void **)(a1 + 8);
    if (v10)
    {
      v11 = v10;
      objc_sync_enter(v11);
      GEOPDPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readSearchPlaceContextMetadata_tags);
      objc_sync_exit(v11);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v12 = *(id *)(a1 + 40);
  v13 = v12;
  if (v12)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v12, "jsonRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("searchPlaceContextMetadata");
    }
    else
    {
      objc_msgSend(v12, "dictionaryRepresentation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = CFSTR("search_place_context_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v14, v15);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 56));
  if ((*(_BYTE *)(a1 + 64) & 8) == 0)
  {
    v16 = *(void **)(a1 + 8);
    if (v16)
    {
      v17 = v16;
      objc_sync_enter(v17);
      GEOPDPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAutocompletePlaceContextMetadata_tags);
      objc_sync_exit(v17);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  v18 = *(id *)(a1 + 24);
  v19 = v18;
  if (v18)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v18, "jsonRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("autocompletePlaceContextMetadata");
    }
    else
    {
      objc_msgSend(v18, "dictionaryRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = CFSTR("autocomplete_place_context_metadata");
    }
    objc_msgSend(v4, "setObject:forKey:", v20, v21);

  }
  v22 = *(void **)(a1 + 16);
  if (v22)
  {
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v23, "count"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __55__GEOPDPlaceContextMetadata__dictionaryRepresentation___block_invoke;
      v29[3] = &unk_1E1C00600;
      v26 = v25;
      v30 = v26;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v29);
      v27 = v26;

      v24 = v27;
    }
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceContextMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
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
        v6 = (int *)&readAll__recursiveTag_5688;
      else
        v6 = (int *)&readAll__nonRecursiveTag_5689;
      GEOPDPlaceContextMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
    {
      -[GEOPDSearchPlaceContextMetadata readAll:](*(_QWORD *)(a1 + 40), 1);
      -[GEOPDAutocompletePlaceContextMetadata readAll:](*(_QWORD *)(a1 + 24), 1);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
  }
}

void __55__GEOPDPlaceContextMetadata__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  void *v7;
  id v8;
  int v9;
  const __CFString *v10;
  void *v11;
  GEOPDSearchPlaceContextMetadata *v12;
  GEOPDSearchPlaceContextMetadata *v13;
  id v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  const __CFString *v20;
  void *v21;
  char v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  id v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  uint64_t v41;
  GEOLocalizedString *v42;
  GEOLocalizedString *v43;
  GEOLocalizedString *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  const __CFString *v49;
  void *v50;
  id v51;
  int v52;
  const __CFString *v53;
  void *v54;
  GEOPDContextualPhotoMetadata *v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t m;
  void *v63;
  void *v64;
  const __CFString *v65;
  void *v66;
  int v67;
  const __CFString *v68;
  void *v69;
  int v70;
  const __CFString *v71;
  void *v72;
  char v73;
  const __CFString *v74;
  void *v75;
  char v76;
  const __CFString *v77;
  void *v78;
  char v79;
  id v80;
  const __CFString *v81;
  void *v82;
  GEOPDNearbyPlacesMetadata *v83;
  const __CFString *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t n;
  void *v89;
  GEOPDNearbyPlacesMetadata *v90;
  const __CFString *v91;
  void *v92;
  char v93;
  id v94;
  const __CFString *v95;
  void *v96;
  GEOPDAutocompletePlaceContextMetadata *v97;
  GEOPDAutocompletePlaceContextMetadata *v98;
  id v99;
  uint64_t v100;
  const __CFString *v101;
  void *v102;
  void *v103;
  id v104;
  const __CFString *v105;
  void *v106;
  char v107;
  const __CFString *v108;
  void *v109;
  char v110;
  const __CFString *v111;
  void *v112;
  id v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t i;
  void *v117;
  id v118;
  void *v119;
  id v120;
  const __CFString *v121;
  void *v122;
  void *v123;
  id v124;
  const __CFString *v125;
  void *v126;
  char v127;
  const __CFString *v128;
  void *v129;
  char v130;
  const __CFString *v131;
  void *v132;
  id v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t j;
  uint64_t v137;
  GEOLocalizedString *v138;
  GEOLocalizedString *v139;
  GEOLocalizedString *v140;
  const __CFString *v141;
  void *v142;
  int v143;
  const __CFString *v144;
  void *v145;
  char v146;
  const __CFString *v147;
  void *v148;
  char v149;
  const __CFString *v150;
  void *v151;
  id v152;
  int v153;
  const __CFString *v154;
  void *v155;
  char v156;
  const __CFString *v157;
  void *v158;
  char v159;
  const __CFString *v160;
  void *v161;
  void *v162;
  id v163;
  const __CFString *v164;
  void *v165;
  id v166;
  int v167;
  id v168;
  void *v170;
  void *v171;
  id v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  uint64_t v177;
  id v178;
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
  uint64_t v190;

  v190 = *MEMORY[0x1E0C80C00];
  v178 = a2;
  if (a1)
  {
    v177 = objc_msgSend(a1, "init");
    if (v177)
    {
      objc_msgSend(v178, "objectForKeyedSubscript:", CFSTR("muid"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = objc_msgSend(v4, "unsignedLongLongValue");
        *(_BYTE *)(v177 + 64) |= 0x20u;
        *(_BYTE *)(v177 + 64) |= 1u;
        *(_QWORD *)(v177 + 32) = v5;
      }

      if (a3)
        v6 = CFSTR("placeContextMetadataType");
      else
        v6 = CFSTR("place_context_metadata_type");
      objc_msgSend(v178, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_CONTEXT_METADATA_UNKNOWN")) & 1) != 0)
        {
          v9 = 0;
        }
        else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_CONTEXT_METADATA_SEARCH")) & 1) != 0)
        {
          v9 = 1;
        }
        else if (objc_msgSend(v8, "isEqualToString:", CFSTR("PLACE_CONTEXT_METADATA_AUTOCOMPLETE")))
        {
          v9 = 2;
        }
        else
        {
          v9 = 0;
        }

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_21;
        v9 = objc_msgSend(v7, "intValue");
      }
      *(_BYTE *)(v177 + 64) |= 0x20u;
      *(_BYTE *)(v177 + 64) |= 2u;
      *(_DWORD *)(v177 + 60) = v9;
LABEL_21:

      if (a3)
        v10 = CFSTR("searchPlaceContextMetadata");
      else
        v10 = CFSTR("search_place_context_metadata");
      objc_msgSend(v178, "objectForKeyedSubscript:", v10);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = v175;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_164:

        if (a3)
          v95 = CFSTR("autocompletePlaceContextMetadata");
        else
          v95 = CFSTR("autocomplete_place_context_metadata");
        objc_msgSend(v178, "objectForKeyedSubscript:", v95);
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v96 = v174;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_304;
        v97 = [GEOPDAutocompletePlaceContextMetadata alloc];
        if (!v97)
        {
          v100 = 0;
          goto LABEL_303;
        }
        v98 = v97;
        v99 = v174;
        v100 = -[GEOPDAutocompletePlaceContextMetadata init](v98, "init");
        if (!v100)
        {
LABEL_302:

LABEL_303:
          v168 = (id)v100;
          *(_BYTE *)(v177 + 64) |= 8u;
          *(_BYTE *)(v177 + 64) |= 0x20u;
          objc_storeStrong((id *)(v177 + 24), (id)v100);

          v96 = v174;
LABEL_304:

          goto LABEL_305;
        }
        if (a3)
          v101 = CFSTR("matchedDisplayName");
        else
          v101 = CFSTR("matched_display_name");
        v176 = v99;
        objc_msgSend(v99, "objectForKeyedSubscript:", v101);
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v103 = (void *)objc_msgSend(v102, "copy");
          v104 = v103;
          *(_DWORD *)(v100 + 112) |= 0x10000u;
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          objc_storeStrong((id *)(v100 + 72), v103);

        }
        if (a3)
          v105 = CFSTR("isDefaultName");
        else
          v105 = CFSTR("is_default_name");
        objc_msgSend(v176, "objectForKeyedSubscript:", v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v107 = objc_msgSend(v106, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x20u;
          *(_BYTE *)(v100 + 106) = v107;
        }

        if (a3)
          v108 = CFSTR("isProminentResult");
        else
          v108 = CFSTR("is_prominent_result");
        objc_msgSend(v176, "objectForKeyedSubscript:", v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v110 = objc_msgSend(v109, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x80u;
          *(_BYTE *)(v100 + 108) = v110;
        }

        if (a3)
          v111 = CFSTR("clientizationFeature");
        else
          v111 = CFSTR("clientization_feature");
        objc_msgSend(v176, "objectForKeyedSubscript:", v111);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v112 = v171;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v186 = 0u;
          v187 = 0u;
          v184 = 0u;
          v185 = 0u;
          v113 = v171;
          v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
          if (!v114)
            goto LABEL_210;
          v115 = *(_QWORD *)v185;
          while (1)
          {
            for (i = 0; i != v114; ++i)
            {
              if (*(_QWORD *)v185 != v115)
                objc_enumerationMutation(v113);
              v117 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v118 = v117;
                if ((objc_msgSend(v118, "isEqualToString:", CFSTR("CLIENTIZATION_FEATURE_UNKNOWN")) & 1) == 0
                  && (objc_msgSend(v118, "isEqualToString:", CFSTR("CLIENTIZATION_FEATURE_IS_AIRPORT")) & 1) == 0
                  && (objc_msgSend(v118, "isEqualToString:", CFSTR("CLIENTIZATION_FEATURE_IS_LANDMARK")) & 1) == 0
                  && (objc_msgSend(v118, "isEqualToString:", CFSTR("CLIENTIZATION_FEATURE_IS_POPULAR")) & 1) == 0)
                {
                  objc_msgSend(v118, "isEqualToString:", CFSTR("CLIENTIZATION_FEATURE_SUMMARY_EXPERIENCE"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v117, "intValue");
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v100 + 88));
              if ((*(_BYTE *)(v100 + 113) & 0x10) == 0)
              {
                v119 = *(void **)(v100 + 8);
                if (v119)
                {
                  v120 = v119;
                  objc_sync_enter(v120);
                  GEOPDAutocompletePlaceContextMetadataReadSpecified(v100, *(_QWORD *)(v100 + 8), (int *)&_readClientizationFeatures_tags);
                  objc_sync_exit(v120);

                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 88));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(_DWORD *)(v100 + 112) |= 0x1000u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v100 + 88));
              *(_DWORD *)(v100 + 112) |= 0x20000u;
            }
            v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
            if (!v114)
            {
LABEL_210:

              v112 = v171;
              break;
            }
          }
        }

        if (a3)
          v121 = CFSTR("matchedDisplayNameLanguageCode");
        else
          v121 = CFSTR("matched_display_name_language_code");
        objc_msgSend(v176, "objectForKeyedSubscript:", v121, v171);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v123 = (void *)objc_msgSend(v122, "copy");
          v124 = v123;
          *(_DWORD *)(v100 + 112) |= 0x8000u;
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          objc_storeStrong((id *)(v100 + 64), v123);

        }
        if (a3)
          v125 = CFSTR("shouldSuppressDirectionsAction");
        else
          v125 = CFSTR("should_suppress_directions_action");
        objc_msgSend(v176, "objectForKeyedSubscript:", v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v127 = objc_msgSend(v126, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x400u;
          *(_BYTE *)(v100 + 111) = v127;
        }

        if (a3)
          v128 = CFSTR("isLookAroundActionAllowed");
        else
          v128 = CFSTR("is_look_around_action_allowed");
        objc_msgSend(v176, "objectForKeyedSubscript:", v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v130 = objc_msgSend(v129, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x40u;
          *(_BYTE *)(v100 + 107) = v130;
        }

        if (a3)
          v131 = CFSTR("alternateSearchableName");
        else
          v131 = CFSTR("alternate_searchable_name");
        objc_msgSend(v176, "objectForKeyedSubscript:", v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v182 = 0u;
          v183 = 0u;
          v180 = 0u;
          v181 = 0u;
          v133 = v132;
          v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
          if (v134)
          {
            v135 = *(_QWORD *)v181;
            do
            {
              for (j = 0; j != v134; ++j)
              {
                if (*(_QWORD *)v181 != v135)
                  objc_enumerationMutation(v133);
                v137 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * j);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v138 = [GEOLocalizedString alloc];
                  if ((a3 & 1) != 0)
                    v139 = -[GEOLocalizedString initWithJSON:](v138, "initWithJSON:", v137);
                  else
                    v139 = -[GEOLocalizedString initWithDictionary:](v138, "initWithDictionary:", v137);
                  v140 = v139;
                  -[GEOPDAutocompletePlaceContextMetadata addAlternateSearchableName:](v100, v139);

                }
              }
              v134 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
            }
            while (v134);
          }

        }
        if (a3)
          v141 = CFSTR("distanceDisplayThreshold");
        else
          v141 = CFSTR("distance_display_threshold");
        objc_msgSend(v176, "objectForKeyedSubscript:", v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v143 = objc_msgSend(v142, "unsignedIntValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 1u;
          *(_DWORD *)(v100 + 92) = v143;
        }

        if (a3)
          v144 = CFSTR("enableLookInsideActionForVenuePois");
        else
          v144 = CFSTR("enable_look_inside_action_for_venue_pois");
        objc_msgSend(v176, "objectForKeyedSubscript:", v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v146 = objc_msgSend(v145, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x10u;
          *(_BYTE *)(v100 + 105) = v146;
        }

        if (a3)
          v147 = CFSTR("enableChildPoisWithoutAcRank");
        else
          v147 = CFSTR("enable_child_pois_without_ac_rank");
        objc_msgSend(v176, "objectForKeyedSubscript:", v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v149 = objc_msgSend(v148, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 8u;
          *(_BYTE *)(v100 + 104) = v149;
        }

        if (a3)
          v150 = CFSTR("requestedShortAddressType");
        else
          v150 = CFSTR("requested_short_address_type");
        objc_msgSend(v176, "objectForKeyedSubscript:", v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v152 = v151;
          if ((objc_msgSend(v152, "isEqualToString:", CFSTR("REQUESTED_SHORT_ADDRESS_TYPE_DEFAULT")) & 1) != 0)
          {
            v153 = 0;
          }
          else if ((objc_msgSend(v152, "isEqualToString:", CFSTR("REQUESTED_SHORT_ADDRESS_TYPE_CITY_AND_ABOVE")) & 1) != 0)
          {
            v153 = 1;
          }
          else if ((objc_msgSend(v152, "isEqualToString:", CFSTR("REQUESTED_SHORT_ADDRESS_TYPE_CITY")) & 1) != 0)
          {
            v153 = 2;
          }
          else if (objc_msgSend(v152, "isEqualToString:", CFSTR("REQUESTED_SHORT_ADDRESS_TYPE_COUNTRY")))
          {
            v153 = 3;
          }
          else
          {
            v153 = 0;
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_275;
          v153 = objc_msgSend(v151, "intValue");
        }
        *(_DWORD *)(v100 + 112) |= 0x20000u;
        *(_DWORD *)(v100 + 112) |= 2u;
        *(_DWORD *)(v100 + 96) = v153;
LABEL_275:

        if (a3)
          v154 = CFSTR("shouldEnableCallAction");
        else
          v154 = CFSTR("should_enable_call_action");
        objc_msgSend(v176, "objectForKeyedSubscript:", v154);
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v156 = objc_msgSend(v155, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x100u;
          *(_BYTE *)(v100 + 109) = v156;
        }

        if (a3)
          v157 = CFSTR("shouldEnableWebsiteAction");
        else
          v157 = CFSTR("should_enable_website_action");
        objc_msgSend(v176, "objectForKeyedSubscript:", v157);
        v158 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v159 = objc_msgSend(v158, "BOOLValue");
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          *(_DWORD *)(v100 + 112) |= 0x200u;
          *(_BYTE *)(v100 + 110) = v159;
        }

        if (a3)
          v160 = CFSTR("inferredCategory");
        else
          v160 = CFSTR("inferred_category");
        objc_msgSend(v176, "objectForKeyedSubscript:", v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v162 = (void *)objc_msgSend(v161, "copy");
          v163 = v162;
          *(_DWORD *)(v100 + 112) |= 0x4000u;
          *(_DWORD *)(v100 + 112) |= 0x20000u;
          objc_storeStrong((id *)(v100 + 56), v162);

        }
        if (a3)
          v164 = CFSTR("taxonomyTypeForClientization");
        else
          v164 = CFSTR("taxonomy_type_for_clientization");
        objc_msgSend(v176, "objectForKeyedSubscript:", v164);
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v166 = v165;
          if ((objc_msgSend(v166, "isEqualToString:", CFSTR("CATEGORY_TAXONOMY_TYPE_DEFAULT")) & 1) != 0)
            v167 = 0;
          else
            v167 = objc_msgSend(v166, "isEqualToString:", CFSTR("CATEGORY_TAXONOMY_TYPE_MODERN"));

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
LABEL_301:

            v99 = v176;
            goto LABEL_302;
          }
          v167 = objc_msgSend(v165, "intValue");
        }
        *(_DWORD *)(v100 + 112) |= 0x20000u;
        *(_DWORD *)(v100 + 112) |= 4u;
        *(_DWORD *)(v100 + 100) = v167;
        goto LABEL_301;
      }
      v12 = [GEOPDSearchPlaceContextMetadata alloc];
      if (!v12)
      {
        v15 = 0;
        goto LABEL_163;
      }
      v13 = v12;
      v14 = v175;
      v15 = -[GEOPDSearchPlaceContextMetadata init](v13, "init");
      if (!v15)
      {
LABEL_162:

LABEL_163:
        v94 = (id)v15;
        *(_BYTE *)(v177 + 64) |= 0x10u;
        *(_BYTE *)(v177 + 64) |= 0x20u;
        objc_storeStrong((id *)(v177 + 40), (id)v15);

        v11 = v175;
        goto LABEL_164;
      }
      if (a3)
        v16 = CFSTR("matchedDisplayName");
      else
        v16 = CFSTR("matched_display_name");
      objc_msgSend(v14, "objectForKeyedSubscript:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v18 = (void *)objc_msgSend(v17, "copy");
        v19 = v18;
        *(_WORD *)(v15 + 108) |= 0x100u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 56), v18);

      }
      if (a3)
        v20 = CFSTR("isDefaultName");
      else
        v20 = CFSTR("is_default_name");
      objc_msgSend(v14, "objectForKeyedSubscript:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v22 = objc_msgSend(v21, "BOOLValue");
        *(_WORD *)(v15 + 108) |= 0x1000u;
        *(_WORD *)(v15 + 108) |= 2u;
        *(_BYTE *)(v15 + 104) = v22;
      }

      if (a3)
        v23 = CFSTR("normalizedQuery");
      else
        v23 = CFSTR("normalized_query");
      objc_msgSend(v14, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v25 = (void *)objc_msgSend(v24, "copy");
        v26 = v25;
        *(_WORD *)(v15 + 108) |= 0x400u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 72), v25);

      }
      if (a3)
        v27 = CFSTR("interpretedCategory");
      else
        v27 = CFSTR("interpreted_category");
      objc_msgSend(v14, "objectForKeyedSubscript:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v29 = (void *)objc_msgSend(v28, "copy");
        v30 = v29;
        *(_WORD *)(v15 + 108) |= 0x40u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 40), v29);

      }
      if (a3)
        v31 = CFSTR("matchedDisplayNameLanguageCode");
      else
        v31 = CFSTR("matched_display_name_language_code");
      objc_msgSend(v14, "objectForKeyedSubscript:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v33 = (void *)objc_msgSend(v32, "copy");
        v34 = v33;
        *(_WORD *)(v15 + 108) |= 0x80u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 48), v33);

      }
      if (a3)
        v35 = CFSTR("alternateSearchableName");
      else
        v35 = CFSTR("alternate_searchable_name");
      objc_msgSend(v14, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v182 = 0u;
        v183 = 0u;
        v180 = 0u;
        v181 = 0u;
        v37 = v36;
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v181;
          do
          {
            for (k = 0; k != v38; ++k)
            {
              if (*(_QWORD *)v181 != v39)
                objc_enumerationMutation(v37);
              v41 = *(_QWORD *)(*((_QWORD *)&v180 + 1) + 8 * k);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v42 = [GEOLocalizedString alloc];
                if ((a3 & 1) != 0)
                  v43 = -[GEOLocalizedString initWithJSON:](v42, "initWithJSON:", v41);
                else
                  v43 = -[GEOLocalizedString initWithDictionary:](v42, "initWithDictionary:", v41);
                v44 = v43;
                -[GEOPDSearchPlaceContextMetadata addAlternateSearchableName:](v15, v43);

              }
            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v180, v188, 16);
          }
          while (v38);
        }

      }
      if (a3)
        v45 = CFSTR("secondaryNameOverrideLanguage");
      else
        v45 = CFSTR("secondary_name_override_language");
      objc_msgSend(v14, "objectForKeyedSubscript:", v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = (void *)objc_msgSend(v46, "copy");
        v48 = v47;
        *(_WORD *)(v15 + 108) |= 0x800u;
        *(_WORD *)(v15 + 108) |= 0x1000u;
        objc_storeStrong((id *)(v15 + 80), v47);

      }
      if (a3)
        v49 = CFSTR("taxonomyTypeForClientization");
      else
        v49 = CFSTR("taxonomy_type_for_clientization");
      objc_msgSend(v14, "objectForKeyedSubscript:", v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v51 = v50;
        if ((objc_msgSend(v51, "isEqualToString:", CFSTR("CATEGORY_TAXONOMY_TYPE_DEFAULT")) & 1) != 0)
          v52 = 0;
        else
          v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("CATEGORY_TAXONOMY_TYPE_MODERN"));

      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_85:

          if (a3)
            v53 = CFSTR("contextualPhotoMetadata");
          else
            v53 = CFSTR("contextual_photo_metadata");
          objc_msgSend(v14, "objectForKeyedSubscript:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v55 = [GEOPDContextualPhotoMetadata alloc];
            if (v55)
            {
              v172 = v54;
              v56 = -[GEOPDContextualPhotoMetadata init](v55, "init");
              if (v56)
              {
                if (a3)
                  v57 = CFSTR("contextualPhotoLabel");
                else
                  v57 = CFSTR("contextual_photo_label");
                objc_msgSend(v172, "objectForKeyedSubscript:", v57);
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v186 = 0u;
                  v187 = 0u;
                  v184 = 0u;
                  v185 = 0u;
                  v59 = v58;
                  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
                  if (v60)
                  {
                    v61 = *(_QWORD *)v185;
                    do
                    {
                      for (m = 0; m != v60; ++m)
                      {
                        if (*(_QWORD *)v185 != v61)
                          objc_enumerationMutation(v59);
                        v63 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * m);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v64 = (void *)objc_msgSend(v63, "copy");
                          -[GEOPDContextualPhotoMetadata addContextualPhotoLabel:](v56, v64);

                        }
                      }
                      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
                    }
                    while (v60);
                  }

                }
                if (a3)
                  v65 = CFSTR("maxNumContextualPhotos");
                else
                  v65 = CFSTR("max_num_contextual_photos");
                objc_msgSend(v172, "objectForKeyedSubscript:", v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v67 = objc_msgSend(v66, "unsignedIntValue");
                  *(_BYTE *)(v56 + 36) |= 1u;
                  *(_DWORD *)(v56 + 24) = v67;
                }

                if (a3)
                  v68 = CFSTR("maxNumPhotos");
                else
                  v68 = CFSTR("max_num_photos");
                objc_msgSend(v172, "objectForKeyedSubscript:", v68);
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v70 = objc_msgSend(v69, "unsignedIntValue");
                  *(_BYTE *)(v56 + 36) |= 2u;
                  *(_DWORD *)(v56 + 28) = v70;
                }

                if (a3)
                  v71 = CFSTR("shouldLimitToPoisWithVendorTopPhoto");
                else
                  v71 = CFSTR("should_limit_to_pois_with_vendor_top_photo");
                objc_msgSend(v172, "objectForKeyedSubscript:", v71);
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v73 = objc_msgSend(v72, "BOOLValue");
                  *(_BYTE *)(v56 + 36) |= 0x10u;
                  *(_BYTE *)(v56 + 34) = v73;
                }

                if (a3)
                  v74 = CFSTR("shouldApplyContextualizationSearch");
                else
                  v74 = CFSTR("should_apply_contextualization_search");
                objc_msgSend(v172, "objectForKeyedSubscript:", v74);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v76 = objc_msgSend(v75, "BOOLValue");
                  *(_BYTE *)(v56 + 36) |= 8u;
                  *(_BYTE *)(v56 + 33) = v76;
                }

                if (a3)
                  v77 = CFSTR("shouldApplyContextualizationPlacecard");
                else
                  v77 = CFSTR("should_apply_contextualization_placecard");
                objc_msgSend(v172, "objectForKeyedSubscript:", v77);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v79 = objc_msgSend(v78, "BOOLValue");
                  *(_BYTE *)(v56 + 36) |= 4u;
                  *(_BYTE *)(v56 + 32) = v79;
                }

              }
            }
            else
            {
              v56 = 0;
            }
            v80 = (id)v56;
            *(_WORD *)(v15 + 108) |= 0x20u;
            *(_WORD *)(v15 + 108) |= 0x1000u;
            objc_storeStrong((id *)(v15 + 32), (id)v56);

          }
          if (a3)
            v81 = CFSTR("nearbyPlacesMetadata");
          else
            v81 = CFSTR("nearby_places_metadata");
          objc_msgSend(v14, "objectForKeyedSubscript:", v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v83 = [GEOPDNearbyPlacesMetadata alloc];
            if (v83)
            {
              v173 = v82;
              v83 = -[GEOPDNearbyPlacesMetadata init](v83, "init");
              if (v83)
              {
                if (a3)
                  v84 = CFSTR("encryptedNearbyPlacesMuid");
                else
                  v84 = CFSTR("encrypted_nearby_places_muid");
                objc_msgSend(v173, "objectForKeyedSubscript:", v84);
                v170 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v186 = 0u;
                  v187 = 0u;
                  v184 = 0u;
                  v185 = 0u;
                  v85 = v170;
                  v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
                  if (v86)
                  {
                    v87 = *(_QWORD *)v185;
                    do
                    {
                      for (n = 0; n != v86; ++n)
                      {
                        if (*(_QWORD *)v185 != v87)
                          objc_enumerationMutation(v85);
                        v89 = *(void **)(*((_QWORD *)&v184 + 1) + 8 * n);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v89, "unsignedLongLongValue");
                          PBRepeatedUInt64Add();
                        }
                      }
                      v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v184, v189, 16);
                    }
                    while (v86);
                  }

                }
              }

            }
            v90 = v83;
            *(_WORD *)(v15 + 108) |= 0x200u;
            *(_WORD *)(v15 + 108) |= 0x1000u;
            objc_storeStrong((id *)(v15 + 64), v83);

          }
          if (a3)
            v91 = CFSTR("shouldPartiallyClientizeResult");
          else
            v91 = CFSTR("should_partially_clientize_result");
          objc_msgSend(v14, "objectForKeyedSubscript:", v91, v170);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v93 = objc_msgSend(v92, "BOOLValue");
            *(_WORD *)(v15 + 108) |= 0x1000u;
            *(_WORD *)(v15 + 108) |= 4u;
            *(_BYTE *)(v15 + 105) = v93;
          }

          goto LABEL_162;
        }
        v52 = objc_msgSend(v50, "intValue");
      }
      *(_WORD *)(v15 + 108) |= 0x1000u;
      *(_WORD *)(v15 + 108) |= 1u;
      *(_DWORD *)(v15 + 100) = v52;
      goto LABEL_85;
    }
  }
  v177 = 0;
LABEL_305:

  return v177;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceContextMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  os_unfair_lock_s *p_readerLock;
  char flags;
  GEOPDSearchPlaceContextMetadata *searchPlaceContextMetadata;
  int v7;
  os_unfair_lock_s *autocompletePlaceContextMetadata;
  int v9;
  char v10;
  id v11;
  PBDataReader *v12;
  void *v13;
  id v14;

  v14 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (!self->_reader)
    goto LABEL_10;
  os_unfair_lock_assert_owner(&self->_readerLock);
  flags = (char)self->_flags;
  if ((flags & 0x20) != 0)
    goto LABEL_10;
  if ((*(_BYTE *)&self->_flags & 0x10) != 0)
  {
    searchPlaceContextMetadata = self->_searchPlaceContextMetadata;
    if (searchPlaceContextMetadata)
    {
      os_unfair_lock_lock_with_options();
      os_unfair_lock_assert_owner(&searchPlaceContextMetadata->_readerLock);
      v7 = *(_WORD *)&searchPlaceContextMetadata->_flags & 0x1FF0;
      os_unfair_lock_unlock(&searchPlaceContextMetadata->_readerLock);
      if (v7)
        goto LABEL_10;
      flags = (char)self->_flags;
    }
  }
  if ((flags & 8) == 0
    || (autocompletePlaceContextMetadata = (os_unfair_lock_s *)self->_autocompletePlaceContextMetadata) == 0
    || (os_unfair_lock_lock_with_options(),
        os_unfair_lock_assert_owner(autocompletePlaceContextMetadata + 22),
        v9 = autocompletePlaceContextMetadata[28]._os_unfair_lock_opaque & 0x3F000,
        os_unfair_lock_unlock(autocompletePlaceContextMetadata + 22),
        !v9))
  {
    v12 = self->_reader;
    objc_sync_enter(v12);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "writeData:", v13);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v12);
    goto LABEL_20;
  }
LABEL_10:
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 0);
  v10 = (char)self->_flags;
  if ((v10 & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v10 = (char)self->_flags;
  }
  v11 = v14;
  if ((v10 & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v11 = v14;
  }
  if (self->_searchPlaceContextMetadata)
  {
    PBDataWriterWriteSubmessage();
    v11 = v14;
  }
  if (self->_autocompletePlaceContextMetadata)
  {
    PBDataWriterWriteSubmessage();
    v11 = v14;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v11);
LABEL_20:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  PBDataReader *reader;
  PBDataReader *v7;
  id v8;
  char flags;
  id v10;
  void *v11;
  id v12;
  void *v13;
  PBUnknownFields *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*(_BYTE *)&self->_flags & 0x20) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDPlaceContextMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_10;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 0);
  flags = (char)self->_flags;
  if ((flags & 1) != 0)
  {
    *(_QWORD *)(v5 + 32) = self->_muid;
    *(_BYTE *)(v5 + 64) |= 1u;
    flags = (char)self->_flags;
  }
  if ((flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_placeContextMetadataType;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  v10 = -[GEOPDSearchPlaceContextMetadata copyWithZone:](self->_searchPlaceContextMetadata, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v10;

  v12 = -[GEOPDAutocompletePlaceContextMetadata copyWithZone:](self->_autocompletePlaceContextMetadata, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v12;

  v14 = self->_unknownFields;
  v8 = *(id *)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v14;
LABEL_10:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GEOPDSearchPlaceContextMetadata *searchPlaceContextMetadata;
  GEOPDAutocompletePlaceContextMetadata *autocompletePlaceContextMetadata;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)v4, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_muid != *((_QWORD *)v4 + 4))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if ((*(_BYTE *)&self->_flags & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_placeContextMetadataType != *((_DWORD *)v4 + 15))
      goto LABEL_16;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_16;
  }
  searchPlaceContextMetadata = self->_searchPlaceContextMetadata;
  if ((unint64_t)searchPlaceContextMetadata | *((_QWORD *)v4 + 5)
    && !-[GEOPDSearchPlaceContextMetadata isEqual:](searchPlaceContextMetadata, "isEqual:"))
  {
    goto LABEL_16;
  }
  autocompletePlaceContextMetadata = self->_autocompletePlaceContextMetadata;
  if ((unint64_t)autocompletePlaceContextMetadata | *((_QWORD *)v4 + 3))
    v7 = -[GEOPDAutocompletePlaceContextMetadata isEqual:](autocompletePlaceContextMetadata, "isEqual:");
  else
    v7 = 1;
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  -[GEOPDPlaceContextMetadata readAll:]((uint64_t)self, 1);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    v3 = 2654435761u * self->_muid;
    if ((*(_BYTE *)&self->_flags & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_flags & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_placeContextMetadataType;
LABEL_6:
  v5 = v4 ^ v3 ^ -[GEOPDSearchPlaceContextMetadata hash](self->_searchPlaceContextMetadata, "hash");
  return v5 ^ -[GEOPDAutocompletePlaceContextMetadata hash](self->_autocompletePlaceContextMetadata, "hash");
}

- (void)clearUnknownFields:(uint64_t)a1
{
  void *v4;

  if (a1)
  {
    os_unfair_lock_lock_with_options();
    *(_BYTE *)(a1 + 64) |= 4u;
    *(_BYTE *)(a1 + 64) |= 0x20u;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 56));
    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if (a2)
    {
      -[GEOPDPlaceContextMetadata readAll:](a1, 0);
      -[GEOPDSearchPlaceContextMetadata clearUnknownFields:](*(_QWORD *)(a1 + 40), 1);
      -[GEOPDAutocompletePlaceContextMetadata clearUnknownFields:](*(_QWORD *)(a1 + 24), 1);
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchPlaceContextMetadata, 0);
  objc_storeStrong((id *)&self->_autocompletePlaceContextMetadata, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
