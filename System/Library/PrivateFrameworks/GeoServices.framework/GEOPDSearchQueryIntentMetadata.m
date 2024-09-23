@implementation GEOPDSearchQueryIntentMetadata

- (uint64_t)hasGreenTeaWithValue:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    -[GEOPDSearchQueryIntentMetadata _readAcHintMetadata](result);
    return -[GEOPDSearchACHintMetadata hasGreenTeaWithValue:](*(_QWORD *)(v3 + 64), a2);
  }
  return result;
}

- (GEOPDSearchQueryIntentMetadata)init
{
  GEOPDSearchQueryIntentMetadata *v2;
  GEOPDSearchQueryIntentMetadata *v3;
  GEOPDSearchQueryIntentMetadata *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  v2 = -[GEOPDSearchQueryIntentMetadata init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_readerLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v3;
}

- (GEOPDSearchQueryIntentMetadata)initWithData:(id)a3
{
  GEOPDSearchQueryIntentMetadata *v3;
  GEOPDSearchQueryIntentMetadata *v4;
  GEOPDSearchQueryIntentMetadata *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  v3 = -[GEOPDSearchQueryIntentMetadata initWithData:](&v7, sel_initWithData_, a3);
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
  v3.receiver = self;
  v3.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  -[GEOPDSearchQueryIntentMetadata dealloc](&v3, sel_dealloc);
}

- (void)addQueryClassificationMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 309) & 4) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryClassificationMetadatas_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    -[GEOPDSearchQueryIntentMetadata _addNoFlagsQueryClassificationMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 308) |= 0x400uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    *(_QWORD *)(a1 + 308) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsQueryClassificationMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 88);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = v5;

      v4 = *(void **)(a1 + 88);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)_readAcHintMetadata
{
  void *v2;
  id v3;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 308) & 0x80) == 0)
    {
      v2 = *(void **)(a1 + 8);
      if (v2)
      {
        v3 = v2;
        objc_sync_enter(v3);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readAcHintMetadata_tags);
        objc_sync_exit(v3);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (id)acHintMetadata
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    -[GEOPDSearchQueryIntentMetadata _readAcHintMetadata]((uint64_t)a1);
    a1 = (id *)v1[8];
  }
  return a1;
}

- (void)setAcHintMetadata:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    *(_QWORD *)(a1 + 308) |= 0x400000080uLL;
    objc_storeStrong((id *)(a1 + 64), a2);
  }

}

- (void)addQueryEmbeddingMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;

  if (a1)
  {
    v3 = a2;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    if ((*(_BYTE *)(a1 + 309) & 0x80) == 0)
    {
      v4 = *(void **)(a1 + 8);
      if (v4)
      {
        v5 = v4;
        objc_sync_enter(v5);
        GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryEmbeddingMetadatas_tags);
        objc_sync_exit(v5);

      }
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    -[GEOPDSearchQueryIntentMetadata _addNoFlagsQueryEmbeddingMetadata:](a1, v3);

    os_unfair_lock_lock_with_options();
    *(_QWORD *)(a1 + 308) |= 0x8000uLL;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
    *(_QWORD *)(a1 + 308) |= 0x400000000uLL;
  }
}

- (void)_addNoFlagsQueryEmbeddingMetadata:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 128);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 128);
      *(_QWORD *)(a1 + 128) = v5;

      v4 = *(void **)(a1 + 128);
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
  v8.super_class = (Class)GEOPDSearchQueryIntentMetadata;
  -[GEOPDSearchQueryIntentMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchQueryIntentMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchQueryIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  id v5;
  id v6;
  const __CFString *v7;
  void *v8;
  id v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  const __CFString *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  const __CFString *v41;
  id v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  id v51;
  void *v52;
  _QWORD *v53;
  unint64_t v54;
  uint64_t v55;
  __CFString *v56;
  const __CFString *v57;
  void *v58;
  id v59;
  id v60;
  void *v61;
  void *v62;
  const __CFString *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  const __CFString *v70;
  id v71;
  void *v72;
  id v73;
  id v74;
  void *v75;
  void *v76;
  const __CFString *v77;
  id v78;
  void *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  const __CFString *v84;
  id v85;
  void *v86;
  id v87;
  id v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  id v92;
  void *v93;
  id v94;
  id v95;
  void *v96;
  void *v97;
  const __CFString *v98;
  id v99;
  void *v100;
  id v101;
  id v102;
  void *v103;
  void *v104;
  const __CFString *v105;
  id v106;
  void *v107;
  id v108;
  id v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  id v113;
  void *v114;
  id v115;
  id v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  id v120;
  void *v121;
  id v122;
  id v123;
  void *v124;
  void *v125;
  const __CFString *v126;
  id v127;
  void *v128;
  _QWORD *v129;
  unint64_t v130;
  uint64_t v131;
  __CFString *v132;
  const __CFString *v133;
  void *v134;
  id v135;
  id v136;
  void *v137;
  void *v138;
  const __CFString *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  const __CFString *v144;
  id v145;
  void *v146;
  id v147;
  id v148;
  void *v149;
  void *v150;
  const __CFString *v151;
  id v152;
  void *v153;
  id v154;
  id v155;
  void *v156;
  void *v157;
  const __CFString *v158;
  id v159;
  void *v160;
  id v161;
  id v162;
  void *v163;
  void *v164;
  const __CFString *v165;
  id v166;
  void *v167;
  id v168;
  id v169;
  void *v170;
  void *v171;
  const __CFString *v172;
  id v173;
  void *v174;
  id v175;
  id v176;
  void *v177;
  void *v178;
  const __CFString *v179;
  id v180;
  void *v181;
  id v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t j;
  void *v186;
  id v187;
  const __CFString *v188;
  void *v189;
  id v190;
  id v191;
  void *v192;
  void *v193;
  const __CFString *v194;
  id v195;
  void *v196;
  id v197;
  id v198;
  void *v199;
  void *v200;
  const __CFString *v201;
  id v202;
  void *v203;
  id v204;
  id v205;
  void *v206;
  void *v207;
  const __CFString *v208;
  id v209;
  id v210;
  void *v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _BYTE v221[128];
  _BYTE v222[128];
  uint64_t v223;

  v223 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[GEOPDSearchQueryIntentMetadata readAll:](a1, 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 309) & 2) == 0)
  {
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readOriginalQuery_tags_1138);
      objc_sync_exit(v5);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v6 = *(id *)(a1 + 80);
  if (v6)
  {
    if (a2)
      v7 = CFSTR("originalQuery");
    else
      v7 = CFSTR("original_query");
    objc_msgSend(v212, "setObject:forKey:", v6, v7);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 0x80) == 0)
  {
    v8 = *(void **)(a1 + 8);
    if (v8)
    {
      v9 = v8;
      objc_sync_enter(v9);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRewrittenQuery_tags);
      objc_sync_exit(v9);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v10 = *(id *)(a1 + 264);
  if (v10)
  {
    if (a2)
      v11 = CFSTR("rewrittenQuery");
    else
      v11 = CFSTR("rewritten_query");
    objc_msgSend(v212, "setObject:forKey:", v10, v11);
  }

  v12 = *(_QWORD *)(a1 + 308);
  if ((v12 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 300));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v14 = CFSTR("rewrittenQueryIndex");
    else
      v14 = CFSTR("rewritten_query_index");
    objc_msgSend(v212, "setObject:forKey:", v13, v14);

    v12 = *(_QWORD *)(a1 + 308);
  }
  if ((v12 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 168));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v16 = CFSTR("queryIntentWeight");
    else
      v16 = CFSTR("query_intent_weight");
    objc_msgSend(v212, "setObject:forKey:", v15, v16);

    v12 = *(_QWORD *)(a1 + 308);
  }
  if ((v12 & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 305));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v18 = CFSTR("isFromKnowledgeGraph");
    else
      v18 = CFSTR("is_from_knowledge_graph");
    objc_msgSend(v212, "setObject:forKey:", v17, v18);

    v12 = *(_QWORD *)(a1 + 308);
  }
  if ((v12 & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 306));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v20 = CFSTR("isFromSearchQu");
    else
      v20 = CFSTR("is_from_search_qu");
    objc_msgSend(v212, "setObject:forKey:", v19, v20);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 4) == 0)
  {
    v21 = *(void **)(a1 + 8);
    if (v21)
    {
      v22 = v21;
      objc_sync_enter(v22);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryTagMetadata_tags);
      objc_sync_exit(v22);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v23 = *(id *)(a1 + 224);
  v24 = v23;
  if (v23)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v23, "jsonRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("queryTagMetadata");
    }
    else
    {
      objc_msgSend(v23, "dictionaryRepresentation");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = CFSTR("query_tag_metadata");
    }
    v27 = v25;

    objc_msgSend(v212, "setObject:forKey:", v27, v26);
  }

  if (objc_msgSend(*(id *)(a1 + 88), "count"))
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 88), "count"));
    v217 = 0u;
    v218 = 0u;
    v219 = 0u;
    v220 = 0u;
    v29 = *(id *)(a1 + 88);
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v217, v222, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v218;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v218 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v217 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v33, "jsonRepresentation");
          else
            objc_msgSend(v33, "dictionaryRepresentation");
          v34 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v28, "addObject:", v34);
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v217, v222, 16);
      }
      while (v30);
    }

    if (a2)
      v35 = CFSTR("queryClassificationMetadata");
    else
      v35 = CFSTR("query_classification_metadata");
    objc_msgSend(v212, "setObject:forKey:", v28, v35);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 1) == 0)
  {
    v36 = *(void **)(a1 + 8);
    if (v36)
    {
      v37 = v36;
      objc_sync_enter(v37);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuerySpellCorrectionMetadata_tags);
      objc_sync_exit(v37);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v38 = *(id *)(a1 + 208);
  v39 = v38;
  if (v38)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v38, "jsonRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("querySpellCorrectionMetadata");
    }
    else
    {
      objc_msgSend(v38, "dictionaryRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = CFSTR("query_spell_correction_metadata");
    }
    v42 = v40;

    objc_msgSend(v212, "setObject:forKey:", v42, v41);
  }

  if ((*(_BYTE *)(a1 + 308) & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 304));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (a2)
      v44 = CFSTR("isFromDefinitiveQu");
    else
      v44 = CFSTR("is_from_definitive_qu");
    objc_msgSend(v212, "setObject:forKey:", v43, v44);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 2) == 0)
  {
    v45 = *(void **)(a1 + 8);
    if (v45)
    {
      v46 = v45;
      objc_sync_enter(v46);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryGeoMetadata_tags);
      objc_sync_exit(v46);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v47 = *(id *)(a1 + 144);
  v48 = v47;
  if (v47)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v47, "jsonRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("queryGeoMetadata");
    }
    else
    {
      objc_msgSend(v47, "dictionaryRepresentation");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = CFSTR("query_geo_metadata");
    }
    v51 = v49;

    objc_msgSend(v212, "setObject:forKey:", v51, v50);
  }

  if (*(_QWORD *)(a1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (_QWORD *)(a1 + 16);
    if (*(_QWORD *)(a1 + 24))
    {
      v54 = 0;
      do
      {
        v55 = *(int *)(*v53 + 4 * v54);
        if (v55 >= 7)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v55);
          v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v56 = off_1E1C0A888[v55];
        }
        objc_msgSend(v52, "addObject:", v56);

        ++v54;
        v53 = (_QWORD *)(a1 + 16);
      }
      while (v54 < *(_QWORD *)(a1 + 24));
    }
    if (a2)
      v57 = CFSTR("intentSource");
    else
      v57 = CFSTR("intent_source");
    objc_msgSend(v212, "setObject:forKey:", v52, v57);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 2) == 0)
  {
    v58 = *(void **)(a1 + 8);
    if (v58)
    {
      v59 = v58;
      objc_sync_enter(v59);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQuerySynonymMetadata_tags);
      objc_sync_exit(v59);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v60 = *(id *)(a1 + 216);
  v61 = v60;
  if (v60)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v60, "jsonRepresentation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("querySynonymMetadata");
    }
    else
    {
      objc_msgSend(v60, "dictionaryRepresentation");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = CFSTR("query_synonym_metadata");
    }
    v64 = v62;

    objc_msgSend(v212, "setObject:forKey:", v64, v63);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 309) & 0x40) == 0)
  {
    v65 = *(void **)(a1 + 8);
    if (v65)
    {
      v66 = v65;
      objc_sync_enter(v66);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryDymMetadata_tags);
      objc_sync_exit(v66);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v67 = *(id *)(a1 + 120);
  v68 = v67;
  if (v67)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v67, "jsonRepresentation");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = CFSTR("queryDymMetadata");
    }
    else
    {
      objc_msgSend(v67, "dictionaryRepresentation");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = CFSTR("query_dym_metadata");
    }
    v71 = v69;

    objc_msgSend(v212, "setObject:forKey:", v71, v70);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 309) & 8) == 0)
  {
    v72 = *(void **)(a1 + 8);
    if (v72)
    {
      v73 = v72;
      objc_sync_enter(v73);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryCompletionMetadata_tags);
      objc_sync_exit(v73);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v74 = *(id *)(a1 + 96);
  v75 = v74;
  if (v74)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v74, "jsonRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("queryCompletionMetadata");
    }
    else
    {
      objc_msgSend(v74, "dictionaryRepresentation");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = CFSTR("query_completion_metadata");
    }
    v78 = v76;

    objc_msgSend(v212, "setObject:forKey:", v78, v77);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 0x10) == 0)
  {
    v79 = *(void **)(a1 + 8);
    if (v79)
    {
      v80 = v79;
      objc_sync_enter(v80);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryInterpretationMetadata_tags);
      objc_sync_exit(v80);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v81 = *(id *)(a1 + 176);
  v82 = v81;
  if (v81)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v81, "jsonRepresentation");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = CFSTR("queryInterpretationMetadata");
    }
    else
    {
      objc_msgSend(v81, "dictionaryRepresentation");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = CFSTR("query_interpretation_metadata");
    }
    v85 = v83;

    objc_msgSend(v212, "setObject:forKey:", v85, v84);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 309) & 0x20) == 0)
  {
    v86 = *(void **)(a1 + 8);
    if (v86)
    {
      v87 = v86;
      objc_sync_enter(v87);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryDirectionsIntentMetadata_tags);
      objc_sync_exit(v87);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v88 = *(id *)(a1 + 112);
  v89 = v88;
  if (v88)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v88, "jsonRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("queryDirectionsIntentMetadata");
    }
    else
    {
      objc_msgSend(v88, "dictionaryRepresentation");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = CFSTR("query_directions_intent_metadata");
    }
    v92 = v90;

    objc_msgSend(v212, "setObject:forKey:", v92, v91);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 0x40) == 0)
  {
    v93 = *(void **)(a1 + 8);
    if (v93)
    {
      v94 = v93;
      objc_sync_enter(v94);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryNormalizerMetadata_tags);
      objc_sync_exit(v94);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v95 = *(id *)(a1 + 192);
  v96 = v95;
  if (v95)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v95, "jsonRepresentation");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CFSTR("queryNormalizerMetadata");
    }
    else
    {
      objc_msgSend(v95, "dictionaryRepresentation");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = CFSTR("query_normalizer_metadata");
    }
    v99 = v97;

    objc_msgSend(v212, "setObject:forKey:", v99, v98);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 4) == 0)
  {
    v100 = *(void **)(a1 + 8);
    if (v100)
    {
      v101 = v100;
      objc_sync_enter(v101);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryGeoNormalizerMetadata_tags);
      objc_sync_exit(v101);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v102 = *(id *)(a1 + 152);
  v103 = v102;
  if (v102)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v102, "jsonRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("queryGeoNormalizerMetadata");
    }
    else
    {
      objc_msgSend(v102, "dictionaryRepresentation");
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = CFSTR("query_geo_normalizer_metadata");
    }
    v106 = v104;

    objc_msgSend(v212, "setObject:forKey:", v106, v105);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 0x10) == 0)
  {
    v107 = *(void **)(a1 + 8);
    if (v107)
    {
      v108 = v107;
      objc_sync_enter(v108);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryTokenizerMetadata_tags);
      objc_sync_exit(v108);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v109 = *(id *)(a1 + 240);
  v110 = v109;
  if (v109)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v109, "jsonRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("queryTokenizerMetadata");
    }
    else
    {
      objc_msgSend(v109, "dictionaryRepresentation");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v112 = CFSTR("query_tokenizer_metadata");
    }
    v113 = v111;

    objc_msgSend(v212, "setObject:forKey:", v113, v112);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 0x20) == 0)
  {
    v114 = *(void **)(a1 + 8);
    if (v114)
    {
      v115 = v114;
      objc_sync_enter(v115);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryTransliterMetadata_tags);
      objc_sync_exit(v115);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v116 = *(id *)(a1 + 248);
  v117 = v116;
  if (v116)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v116, "jsonRepresentation");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = CFSTR("queryTransliterMetadata");
    }
    else
    {
      objc_msgSend(v116, "dictionaryRepresentation");
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = CFSTR("query_transliter_metadata");
    }
    v120 = v118;

    objc_msgSend(v212, "setObject:forKey:", v120, v119);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 1) == 0)
  {
    v121 = *(void **)(a1 + 8);
    if (v121)
    {
      v122 = v121;
      objc_sync_enter(v122);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryFuzzyMatchV2Metadata_tags);
      objc_sync_exit(v122);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v123 = *(id *)(a1 + 136);
  v124 = v123;
  if (v123)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v123, "jsonRepresentation");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = CFSTR("queryFuzzyMatchV2Metadata");
    }
    else
    {
      objc_msgSend(v123, "dictionaryRepresentation");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      v126 = CFSTR("query_fuzzy_match_v2_metadata");
    }
    v127 = v125;

    objc_msgSend(v212, "setObject:forKey:", v127, v126);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = (_QWORD *)(a1 + 40);
    if (*(_QWORD *)(a1 + 48))
    {
      v130 = 0;
      do
      {
        v131 = *(int *)(*v129 + 4 * v130);
        if (v131 >= 0x17)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v131);
          v132 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v132 = off_1E1C0A998[v131];
        }
        objc_msgSend(v128, "addObject:", v132);

        ++v130;
        v129 = (_QWORD *)(a1 + 40);
      }
      while (v130 < *(_QWORD *)(a1 + 48));
    }
    if (a2)
      v133 = CFSTR("rewrittenQueryType");
    else
      v133 = CFSTR("rewritten_query_type");
    objc_msgSend(v212, "setObject:forKey:", v128, v133);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 0x80) == 0)
  {
    v134 = *(void **)(a1 + 8);
    if (v134)
    {
      v135 = v134;
      objc_sync_enter(v135);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryPoiMetadata_tags);
      objc_sync_exit(v135);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v136 = *(id *)(a1 + 200);
  v137 = v136;
  if (v136)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v136, "jsonRepresentation");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = CFSTR("queryPoiMetadata");
    }
    else
    {
      objc_msgSend(v136, "dictionaryRepresentation");
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      v139 = CFSTR("query_poi_metadata");
    }
    v140 = v138;

    objc_msgSend(v212, "setObject:forKey:", v140, v139);
  }

  -[GEOPDSearchQueryIntentMetadata acHintMetadata]((id *)a1);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v142 = v141;
  if (v141)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v141, "jsonRepresentation");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = CFSTR("acHintMetadata");
    }
    else
    {
      objc_msgSend(v141, "dictionaryRepresentation");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = CFSTR("ac_hint_metadata");
    }
    v145 = v143;

    objc_msgSend(v212, "setObject:forKey:", v145, v144);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 8) == 0)
  {
    v146 = *(void **)(a1 + 8);
    if (v146)
    {
      v147 = v146;
      objc_sync_enter(v147);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryGeoTagMetadata_tags);
      objc_sync_exit(v147);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v148 = *(id *)(a1 + 160);
  v149 = v148;
  if (v148)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v148, "jsonRepresentation");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = CFSTR("queryGeoTagMetadata");
    }
    else
    {
      objc_msgSend(v148, "dictionaryRepresentation");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      v151 = CFSTR("query_geo_tag_metadata");
    }
    v152 = v150;

    objc_msgSend(v212, "setObject:forKey:", v152, v151);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 0x40) == 0)
  {
    v153 = *(void **)(a1 + 8);
    if (v153)
    {
      v154 = v153;
      objc_sync_enter(v154);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRawQueryTokenizerMetadata_tags);
      objc_sync_exit(v154);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v155 = *(id *)(a1 + 256);
  v156 = v155;
  if (v155)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v155, "jsonRepresentation");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = CFSTR("rawQueryTokenizerMetadata");
    }
    else
    {
      objc_msgSend(v155, "dictionaryRepresentation");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = CFSTR("raw_query_tokenizer_metadata");
    }
    v159 = v157;

    objc_msgSend(v212, "setObject:forKey:", v159, v158);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 311) & 8) == 0)
  {
    v160 = *(void **)(a1 + 8);
    if (v160)
    {
      v161 = v160;
      objc_sync_enter(v161);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryTokenImportanceMetadata_tags);
      objc_sync_exit(v161);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v162 = *(id *)(a1 + 232);
  v163 = v162;
  if (v162)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v162, "jsonRepresentation");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = CFSTR("queryTokenImportanceMetadata");
    }
    else
    {
      objc_msgSend(v162, "dictionaryRepresentation");
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      v165 = CFSTR("query_token_importance_metadata");
    }
    v166 = v164;

    objc_msgSend(v212, "setObject:forKey:", v166, v165);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 309) & 1) == 0)
  {
    v167 = *(void **)(a1 + 8);
    if (v167)
    {
      v168 = v167;
      objc_sync_enter(v168);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readGeoTokenImportanceMetadata_tags);
      objc_sync_exit(v168);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v169 = *(id *)(a1 + 72);
  v170 = v169;
  if (v169)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v169, "jsonRepresentation");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = CFSTR("geoTokenImportanceMetadata");
    }
    else
    {
      objc_msgSend(v169, "dictionaryRepresentation");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      v172 = CFSTR("geo_token_importance_metadata");
    }
    v173 = v171;

    objc_msgSend(v212, "setObject:forKey:", v173, v172);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 312) & 1) == 0)
  {
    v174 = *(void **)(a1 + 8);
    if (v174)
    {
      v175 = v174;
      objc_sync_enter(v175);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readRichBrandMetadata_tags);
      objc_sync_exit(v175);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v176 = *(id *)(a1 + 272);
  v177 = v176;
  if (v176)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v176, "jsonRepresentation");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = CFSTR("richBrandMetadata");
    }
    else
    {
      objc_msgSend(v176, "dictionaryRepresentation");
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = CFSTR("rich_brand_metadata");
    }
    v180 = v178;

    objc_msgSend(v212, "setObject:forKey:", v180, v179);
  }

  if (objc_msgSend(*(id *)(a1 + 128), "count"))
  {
    v181 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 128), "count"));
    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    v182 = *(id *)(a1 + 128);
    v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v213, v221, 16);
    if (v183)
    {
      v184 = *(_QWORD *)v214;
      do
      {
        for (j = 0; j != v183; ++j)
        {
          if (*(_QWORD *)v214 != v184)
            objc_enumerationMutation(v182);
          v186 = *(void **)(*((_QWORD *)&v213 + 1) + 8 * j);
          if ((a2 & 1) != 0)
            objc_msgSend(v186, "jsonRepresentation");
          else
            objc_msgSend(v186, "dictionaryRepresentation");
          v187 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v181, "addObject:", v187);
        }
        v183 = objc_msgSend(v182, "countByEnumeratingWithState:objects:count:", &v213, v221, 16);
      }
      while (v183);
    }

    if (a2)
      v188 = CFSTR("queryEmbeddingMetadata");
    else
      v188 = CFSTR("query_embedding_metadata");
    objc_msgSend(v212, "setObject:forKey:", v181, v188);

  }
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 312) & 2) == 0)
  {
    v189 = *(void **)(a1 + 8);
    if (v189)
    {
      v190 = v189;
      objc_sync_enter(v190);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readTokenSynonymMetadata_tags);
      objc_sync_exit(v190);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v191 = *(id *)(a1 + 280);
  v192 = v191;
  if (v191)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v191, "jsonRepresentation");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = CFSTR("tokenSynonymMetadata");
    }
    else
    {
      objc_msgSend(v191, "dictionaryRepresentation");
      v193 = (void *)objc_claimAutoreleasedReturnValue();
      v194 = CFSTR("token_synonym_metadata");
    }
    v195 = v193;

    objc_msgSend(v212, "setObject:forKey:", v195, v194);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 310) & 0x20) == 0)
  {
    v196 = *(void **)(a1 + 8);
    if (v196)
    {
      v197 = v196;
      objc_sync_enter(v197);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryNeuralRewriteMetadata_tags);
      objc_sync_exit(v197);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v198 = *(id *)(a1 + 184);
  v199 = v198;
  if (v198)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v198, "jsonRepresentation");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = CFSTR("queryNeuralRewriteMetadata");
    }
    else
    {
      objc_msgSend(v198, "dictionaryRepresentation");
      v200 = (void *)objc_claimAutoreleasedReturnValue();
      v201 = CFSTR("query_neural_rewrite_metadata");
    }
    v202 = v200;

    objc_msgSend(v212, "setObject:forKey:", v202, v201);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
  if ((*(_BYTE *)(a1 + 309) & 0x10) == 0)
  {
    v203 = *(void **)(a1 + 8);
    if (v203)
    {
      v204 = v203;
      objc_sync_enter(v204);
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), (int *)&_readQueryCtrMetadata_tags);
      objc_sync_exit(v204);

    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  v205 = *(id *)(a1 + 104);
  v206 = v205;
  if (v205)
  {
    if ((a2 & 1) != 0)
    {
      objc_msgSend(v205, "jsonRepresentation");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = CFSTR("queryCtrMetadata");
    }
    else
    {
      objc_msgSend(v205, "dictionaryRepresentation");
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      v208 = CFSTR("query_ctr_metadata");
    }
    v209 = v207;

    objc_msgSend(v212, "setObject:forKey:", v209, v208);
  }

  v210 = v212;
  return v210;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchQueryIntentMetadata _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (void)readAll:(uint64_t)a1
{
  void *v4;
  id v5;
  int *v6;

  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 296));
    v4 = *(void **)(a1 + 8);
    if (v4)
    {
      v5 = v4;
      objc_sync_enter(v5);
      if (a2)
        v6 = (int *)&readAll__recursiveTag_1293;
      else
        v6 = (int *)&readAll__nonRecursiveTag_1294;
      GEOPDSearchQueryIntentMetadataReadSpecified(a1, *(_QWORD *)(a1 + 8), v6);
      objc_sync_exit(v5);

    }
    if (a2)
      _GEOPDSearchQueryIntentMetadataCallReadAllRecursiveWithoutSynchronized(a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 296));
  }
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  const __CFString *v13;
  void *v14;
  int v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  char v21;
  const __CFString *v22;
  void *v23;
  char v24;
  const __CFString *v25;
  void *v26;
  GEOPDSearchQueryTagMetadata *v27;
  GEOPDSearchQueryTagMetadata *v28;
  id v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  const __CFString *v38;
  void *v39;
  uint64_t v40;
  const __CFString *v41;
  void *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  GEOPDSearchSpanScore *v48;
  id v49;
  uint64_t v50;
  void *v51;
  id v52;
  int v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  const __CFString *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  GEOPDSearchStringStringPair *v64;
  void *v65;
  uint64_t v66;
  id v67;
  const __CFString *v68;
  void *v69;
  const __CFString *v70;
  const __CFString *v71;
  uint64_t v72;
  void *v73;
  GEOPDSearchQueryClassificationMetadata *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  GEOPDSearchKeyValueFloatPair *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  int v89;
  void *v90;
  int v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  GEOPDSearchStringStringPair *v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  const __CFString *v102;
  void *v103;
  GEOPDSearchQuerySpellCorrectionMetadata *v104;
  id v105;
  uint64_t v106;
  const __CFString *v107;
  void *v108;
  GEOPDSearchSpellSuggestion *v109;
  void *v110;
  id v111;
  const __CFString *v112;
  void *v113;
  char v114;
  const __CFString *v115;
  void *v116;
  id v117;
  int v118;
  const __CFString *v119;
  void *v120;
  uint64_t v121;
  const __CFString *v122;
  void *v123;
  char v124;
  const __CFString *v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  GEOPDSearchTokenCandidates *v132;
  _BYTE *v133;
  uint64_t v134;
  const __CFString *v135;
  void *v136;
  uint64_t v137;
  const __CFString *v138;
  void *v139;
  char v140;
  const __CFString *v141;
  void *v142;
  id v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  GEOPDSearchTokenCandidates *v148;
  _BYTE *v149;
  uint64_t v150;
  const __CFString *v151;
  void *v152;
  id v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  GEOPDSearchSpellSuggestion *v158;
  void *v159;
  uint64_t v160;
  const __CFString *v161;
  void *v162;
  id v163;
  int v164;
  void *v165;
  char v166;
  void *v167;
  char v168;
  void *v169;
  int v170;
  void *v171;
  int v172;
  id v173;
  const __CFString *v174;
  void *v175;
  char v176;
  const __CFString *v177;
  void *v178;
  GEOPDSearchQueryGeoMetadata *v179;
  id v180;
  GEOPDSearchQueryGeoMetadata *v181;
  const __CFString *v182;
  void *v183;
  id v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t i;
  uint64_t v188;
  GEONamedFeature *v189;
  GEONamedFeature *v190;
  GEONamedFeature *v191;
  GEOPDSearchQueryGeoMetadata *v192;
  const __CFString *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t j;
  void *v198;
  id v199;
  os_unfair_lock_s *v200;
  void *v201;
  id v202;
  const __CFString *v203;
  void *v204;
  GEOPDSearchQuerySynonymMetadata *v205;
  void *v206;
  id v207;
  const __CFString *v208;
  void *v209;
  GEOPDSearchQueryDymMetadata *v210;
  id v211;
  uint64_t v212;
  void *v213;
  id v214;
  int v215;
  void *v216;
  void *v217;
  id v218;
  const __CFString *v219;
  void *v220;
  GEOPDSearchQuerySynonymMetadata *v221;
  void *v222;
  id v223;
  id v224;
  const __CFString *v225;
  GEOPDSearchQueryCompletionMetadata *v226;
  uint64_t v227;
  void *v228;
  void *v229;
  id v230;
  void *v231;
  int v232;
  void *v233;
  uint64_t v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t k;
  void *v239;
  void *v240;
  id v241;
  const __CFString *v242;
  void *v243;
  int v244;
  const __CFString *v245;
  void *v246;
  char v247;
  void *v248;
  id v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t m;
  void *v253;
  void *v254;
  const __CFString *v255;
  id v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t n;
  void *v260;
  id v261;
  void *v262;
  id v263;
  id v264;
  const __CFString *v265;
  GEOPDSearchQueryInterpretationMetadata *v266;
  void *v267;
  int v268;
  const __CFString *v269;
  void *v270;
  id v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  GEOPDSearchPair *v276;
  void *v277;
  uint64_t v278;
  const __CFString *v279;
  const __CFString *v280;
  const __CFString *v281;
  const __CFString *v282;
  const __CFString *v283;
  const __CFString *v284;
  const __CFString *v285;
  const __CFString *v286;
  const __CFString *v287;
  const __CFString *v288;
  const __CFString *v289;
  const __CFString *v290;
  const __CFString *v291;
  const __CFString *v292;
  const __CFString *v293;
  const __CFString *v294;
  const __CFString *v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  GEOPDSearchTriggerFeature *v299;
  uint64_t v300;
  void *v301;
  void *v302;
  id v303;
  void *v304;
  void *v305;
  id v306;
  void *v307;
  int v308;
  void *v309;
  void *v310;
  id v311;
  void *v312;
  uint64_t v313;
  void *v314;
  int v315;
  void *v316;
  int v317;
  void *v318;
  uint64_t v319;
  void *v320;
  uint64_t v321;
  void *v322;
  void *v323;
  id v324;
  void *v325;
  uint64_t v326;
  id v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t ii;
  void *v331;
  id v332;
  void *v333;
  id v334;
  void *v335;
  char v336;
  void *v337;
  uint64_t v338;
  void *v339;
  uint64_t v340;
  void *v341;
  uint64_t v342;
  void *v343;
  uint64_t v344;
  void *v345;
  id v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t jj;
  void *v350;
  void *v351;
  void *v352;
  id v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  GEOPDSearchKeyValuePair *v358;
  void *v359;
  uint64_t v360;
  void *v361;
  id v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  GEOPDSearchRelatedCategory *v367;
  void *v368;
  uint64_t v369;
  void *v370;
  uint64_t v371;
  uint64_t v372;
  const __CFString *v373;
  void *v374;
  char v375;
  void *v376;
  void *v377;
  id v378;
  const __CFString *v379;
  void *v380;
  void *v381;
  id v382;
  id v383;
  const __CFString *v384;
  void *v385;
  GEOPDSearchQueryDirectionsIntentMetadata *v386;
  id v387;
  uint64_t v388;
  const __CFString *v389;
  void *v390;
  id v391;
  int v392;
  const __CFString *v393;
  void *v394;
  void *v395;
  id v396;
  void *v397;
  id v398;
  int v399;
  void *v400;
  id v401;
  int v402;
  void *v403;
  void *v404;
  id v405;
  void *v406;
  id v407;
  int v408;
  void *v409;
  void *v410;
  id v411;
  id v412;
  const __CFString *v413;
  void *v414;
  GEOPDSearchQueryNormalizerMetadata *v415;
  id v416;
  uint64_t v417;
  void *v418;
  void *v419;
  id v420;
  const __CFString *v421;
  void *v422;
  void *v423;
  id v424;
  const __CFString *v425;
  void *v426;
  void *v427;
  id v428;
  id v429;
  const __CFString *v430;
  GEOPDSearchQueryGeoNormalizerMetadata *v431;
  uint64_t v432;
  const __CFString *v433;
  void *v434;
  void *v435;
  id v436;
  void *v437;
  void *v438;
  id v439;
  const __CFString *v440;
  void *v441;
  void *v442;
  id v443;
  const __CFString *v444;
  void *v445;
  void *v446;
  id v447;
  const __CFString *v448;
  void *v449;
  void *v450;
  id v451;
  id v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t kk;
  void *v456;
  id v457;
  void *v458;
  id v459;
  id v460;
  const __CFString *v461;
  void *v462;
  GEOPDSearchQueryTokenizerMetadata *v463;
  void *v464;
  id v465;
  const __CFString *v466;
  void *v467;
  GEOPDSearchQueryTransliteratorMetadata *v468;
  id v469;
  uint64_t v470;
  void *v471;
  void *v472;
  id v473;
  const __CFString *v474;
  void *v475;
  void *v476;
  id v477;
  const __CFString *v478;
  void *v479;
  id v480;
  int v481;
  id v482;
  const __CFString *v483;
  GEOPDSearchQueryFuzzyMatchV2Metadata *v484;
  uint64_t v485;
  void *v486;
  id v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t mm;
  void *v491;
  void *v492;
  void *v493;
  char v494;
  void *v495;
  char v496;
  id v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t nn;
  void *v501;
  void *v502;
  id v503;
  const __CFString *v504;
  id v505;
  uint64_t v506;
  const __CFString *v507;
  uint64_t v508;
  uint64_t i1;
  void *v510;
  id v511;
  void *v512;
  const __CFString *v513;
  id v514;
  void *v515;
  id v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  void *v520;
  GEOPDSearchTokenSet *v521;
  void *v522;
  uint64_t v523;
  id v524;
  const __CFString *v525;
  id v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t i2;
  void *v530;
  id v531;
  os_unfair_lock_s *v532;
  void *v533;
  id v534;
  const __CFString *v535;
  void *v536;
  GEOPDSearchQueryPoiMetadata *v537;
  id v538;
  GEOPDSearchQueryPoiMetadata *v539;
  const __CFString *v540;
  void *v541;
  id v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t i3;
  uint64_t v546;
  GEONamedFeature *v547;
  GEONamedFeature *v548;
  GEONamedFeature *v549;
  GEOPDSearchQueryPoiMetadata *v550;
  const __CFString *v551;
  GEOPDSearchACHintMetadata *v552;
  void *v553;
  id v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  void *v558;
  GEOPDSearchKeyValueFloatPair *v559;
  void *v560;
  uint64_t v561;
  const __CFString *v562;
  void *v563;
  id v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t i4;
  uint64_t v568;
  GEOPDAutocompleteEntry *v569;
  GEOPDAutocompleteEntry *v570;
  GEOPDAutocompleteEntry *v571;
  const __CFString *v572;
  const __CFString *v573;
  uint64_t v574;
  void *v575;
  GEOPDSearchAddressEntry *v576;
  id v577;
  uint64_t v578;
  void *v579;
  GEOPDSearchEntry *v580;
  void *v581;
  id v582;
  void *v583;
  id v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  void *v588;
  GEOPDSearchEntry *v589;
  void *v590;
  uint64_t v591;
  uint64_t v592;
  const __CFString *v593;
  id v594;
  uint64_t v595;
  uint64_t v596;
  const __CFString *v597;
  uint64_t v598;
  void *v599;
  GEOPDSearchBusinessEntry *v600;
  id v601;
  uint64_t v602;
  void *v603;
  uint64_t v604;
  uint64_t v605;
  const __CFString *v606;
  GEOPDSearchQueryGeoTagMetadata *v607;
  const __CFString *v608;
  id v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t i5;
  void *v613;
  id v614;
  os_unfair_lock_s *v615;
  PBDataReader *reader;
  PBDataReader *v617;
  const __CFString *v618;
  void *v619;
  GEOPDSearchGeoParsingResult *v620;
  id v621;
  uint64_t v622;
  void *v623;
  id v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  void *v628;
  GEOPDSearchAddressLabeledToken *v629;
  void *v630;
  uint64_t v631;
  const __CFString *v632;
  void *v633;
  uint64_t v634;
  const __CFString *v635;
  void *v636;
  id v637;
  int v638;
  const __CFString *v639;
  void *v640;
  id v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  void *v645;
  GEOPDSearchAddressLabeledToken *v646;
  void *v647;
  uint64_t v648;
  const __CFString *v649;
  void *v650;
  void *v651;
  id v652;
  id v653;
  const __CFString *v654;
  const __CFString *v655;
  void *v656;
  void *v657;
  GEOPDSearchStringGeoTypesPair *v658;
  uint64_t v659;
  void *v660;
  void *v661;
  id v662;
  id v663;
  uint64_t v664;
  uint64_t v665;
  uint64_t i6;
  void *v667;
  void *v668;
  id v669;
  uint64_t v670;
  const __CFString *v671;
  id v672;
  uint64_t v673;
  uint64_t v674;
  uint64_t i7;
  void *v676;
  id v677;
  os_unfair_lock_s *v678;
  PBDataReader *v679;
  PBDataReader *v680;
  GEOPDSearchQueryGeoTagMetadata *v681;
  const __CFString *v682;
  void *v683;
  GEOPDSearchQueryTokenizerMetadata *v684;
  void *v685;
  id v686;
  const __CFString *v687;
  void *v688;
  GEOPDSearchQueryTokenImportanceMetadata *v689;
  void *v690;
  id v691;
  const __CFString *v692;
  void *v693;
  GEOPDSearchQueryTokenImportanceMetadata *v694;
  void *v695;
  id v696;
  const __CFString *v697;
  GEOPDSearchRichBrandMetadata *v698;
  uint64_t v699;
  void *v700;
  uint64_t v701;
  const __CFString *v702;
  void *v703;
  id v704;
  uint64_t v705;
  uint64_t v706;
  uint64_t v707;
  void *v708;
  GEOPDSearchChainInfo *v709;
  void *v710;
  uint64_t v711;
  const __CFString *v712;
  void *v713;
  GEOPDSearchBrandDensity *v714;
  void *v715;
  id v716;
  const __CFString *v717;
  id v718;
  uint64_t v719;
  const __CFString *v720;
  uint64_t v721;
  uint64_t v722;
  void *v723;
  GEOPDSearchPreferredCategory *v724;
  id v725;
  uint64_t v726;
  void *v727;
  void *v728;
  id v729;
  void *v730;
  int v731;
  uint64_t v732;
  id v733;
  const __CFString *v734;
  const __CFString *v735;
  const __CFString *v736;
  char *v737;
  char *v738;
  void *v739;
  GEOPDSearchQueryEmbeddingMetadata *v740;
  uint64_t v741;
  void *v742;
  void *v743;
  id v744;
  id v745;
  uint64_t v746;
  uint64_t v747;
  uint64_t i8;
  void *v749;
  void *v750;
  id v751;
  void *v752;
  id v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  void *v757;
  GEOPDSearchStringStringPair *v758;
  void *v759;
  uint64_t v760;
  uint64_t v761;
  const __CFString *v762;
  GEOPDSearchTokenSynonymMetadata *v763;
  const __CFString *v764;
  const __CFString *v765;
  const __CFString *v766;
  const __CFString *v767;
  uint64_t v768;
  void *v769;
  GEOPDSearchSynonym *v770;
  uint64_t v771;
  void *v772;
  int v773;
  void *v774;
  id v775;
  uint64_t v776;
  uint64_t v777;
  uint64_t v778;
  void *v779;
  GEOPDSearchPair *v780;
  void *v781;
  uint64_t v782;
  void *v783;
  id v784;
  int v785;
  void *v786;
  id v787;
  uint64_t v788;
  uint64_t v789;
  uint64_t v790;
  void *v791;
  GEOPDSearchStringStringPair *v792;
  void *v793;
  uint64_t v794;
  void *v795;
  void *v796;
  id v797;
  uint64_t v798;
  GEOPDSearchTokenSynonymMetadata *v799;
  const __CFString *v800;
  void *v801;
  GEOPDSearchQueryNeuralRewriteMetadata *v802;
  id v803;
  uint64_t v804;
  const __CFString *v805;
  void *v806;
  void *v807;
  id v808;
  const __CFString *v809;
  void *v810;
  int v811;
  const __CFString *v812;
  void *v813;
  void *v814;
  id v815;
  void *v816;
  void *v817;
  id v818;
  id v819;
  const __CFString *v820;
  GEOPDSearchQueryCtrMetadata *v821;
  id v822;
  uint64_t v823;
  const __CFString *v824;
  uint64_t v825;
  BOOL v826;
  const __CFString *v827;
  const __CFString *v828;
  const __CFString *v829;
  const __CFString *v830;
  uint64_t v831;
  void *v832;
  GEOPDSearchCTRStoreKeyValuePair *v833;
  id v834;
  uint64_t v835;
  void *v836;
  int v837;
  void *v838;
  int v839;
  void *v840;
  int v841;
  void *v842;
  int v843;
  void *v844;
  int v845;
  void *v846;
  void *v847;
  id v848;
  void *v849;
  void *v850;
  id v851;
  void *v852;
  id v853;
  int v854;
  uint64_t v855;
  GEOPDSearchQueryCtrMetadata *v856;
  void *v858;
  const __CFString *v859;
  const __CFString *v860;
  id v861;
  void *v862;
  const __CFString *v863;
  const __CFString *v864;
  const __CFString *v865;
  const __CFString *v866;
  const __CFString *v867;
  const __CFString *v868;
  const __CFString *v869;
  const __CFString *v870;
  const __CFString *v871;
  const __CFString *v872;
  const __CFString *v873;
  const __CFString *v874;
  void *v875;
  const __CFString *v876;
  id v877;
  const __CFString *v878;
  void *v879;
  void *v880;
  const __CFString *v881;
  id v882;
  void *v883;
  const __CFString *v884;
  id v885;
  const __CFString *v886;
  void *v887;
  void *v888;
  const __CFString *v889;
  const __CFString *v890;
  void *v891;
  id v892;
  id v893;
  id v894;
  const __CFString *v895;
  const __CFString *v896;
  const __CFString *v897;
  id v898;
  const __CFString *v899;
  id v900;
  id v901;
  id v902;
  id v903;
  const __CFString *v904;
  id v905;
  void *v906;
  const __CFString *v907;
  uint64_t v908;
  const __CFString *v909;
  uint64_t v910;
  uint64_t v911;
  GEOPDSearchTokenSynonymMetadata *v912;
  const __CFString *v913;
  id v914;
  id v915;
  id v916;
  id v917;
  id v918;
  id v919;
  char *v920;
  id v921;
  const __CFString *v922;
  void *v923;
  uint64_t v924;
  void *v925;
  void *v926;
  uint64_t v927;
  void *v928;
  void *v929;
  void *v930;
  uint64_t v931;
  void *v932;
  id v933;
  void *v934;
  uint64_t v935;
  const __CFString *v936;
  const __CFString *v937;
  uint64_t v938;
  id v939;
  uint64_t v940;
  id v941;
  id v942;
  uint64_t v943;
  void *v944;
  void *v945;
  id v946;
  void *v947;
  void *v948;
  id v949;
  uint64_t v950;
  const __CFString *v951;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  id obje;
  id objf;
  id objg;
  GEOPDSearchACHintMetadata *objh;
  GEOPDSearchQueryGeoTagMetadata *obji;
  const __CFString *objj;
  char *objk;
  id objl;
  GEOPDSearchQueryCtrMetadata *objm;
  uint64_t v966;
  const __CFString *v968;
  __int128 v969;
  __int128 v970;
  __int128 v971;
  __int128 v972;
  __int128 v973;
  __int128 v974;
  __int128 v975;
  __int128 v976;
  __int128 v977;
  __int128 v978;
  __int128 v979;
  __int128 v980;
  __int128 v981;
  __int128 v982;
  __int128 v983;
  __int128 v984;
  __int128 v985;
  __int128 v986;
  __int128 v987;
  __int128 v988;
  __int128 v989;
  __int128 v990;
  __int128 v991;
  __int128 v992;
  __int128 v993;
  __int128 v994;
  __int128 v995;
  __int128 v996;
  __int128 v997;
  __int128 v998;
  __int128 v999;
  __int128 v1000;
  __int128 v1001;
  __int128 v1002;
  __int128 v1003;
  __int128 v1004;
  __int128 v1005;
  __int128 v1006;
  __int128 v1007;
  __int128 v1008;
  _BYTE v1009[128];
  _BYTE v1010[128];
  _BYTE v1011[128];
  _BYTE v1012[128];
  __int128 v1013;
  __int128 v1014;
  __int128 v1015;
  __int128 v1016;
  __int128 v1017;
  __int128 v1018;
  __int128 v1019;
  __int128 v1020;
  __int128 v1021;
  __int128 v1022;
  __int128 v1023;
  __int128 v1024;
  __int128 v1025;
  __int128 v1026;
  __int128 v1027;
  __int128 v1028;
  __int128 v1029;
  __int128 v1030;
  __int128 v1031;
  __int128 v1032;
  _BYTE v1033[128];
  uint64_t v1034;

  v1034 = *MEMORY[0x1E0C80C00];
  v885 = a2;
  v4 = (id)objc_msgSend(a1, "init");

  v966 = (uint64_t)v4;
  if (!v4)
    goto LABEL_1750;
  if (a3)
    v5 = CFSTR("originalQuery");
  else
    v5 = CFSTR("original_query");
  v860 = v5;
  objc_msgSend(v885, "objectForKeyedSubscript:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    v8 = v7;
    *(_QWORD *)(v966 + 308) |= 0x400000200uLL;
    objc_storeStrong((id *)(v966 + 80), v7);

  }
  if (a3)
    v9 = CFSTR("rewrittenQuery");
  else
    v9 = CFSTR("rewritten_query");
  v859 = v9;
  objc_msgSend(v885, "objectForKeyedSubscript:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (void *)objc_msgSend(v10, "copy");
    v12 = v11;
    *(_QWORD *)(v966 + 308) |= 0x480000000uLL;
    objc_storeStrong((id *)(v966 + 264), v11);

  }
  if (a3)
    v13 = CFSTR("rewrittenQueryIndex");
  else
    v13 = CFSTR("rewritten_query_index");
  objc_msgSend(v885, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = objc_msgSend(v14, "intValue");
    *(_QWORD *)(v966 + 308) |= 0x400000002uLL;
    *(_DWORD *)(v966 + 300) = v15;
  }

  if (a3)
    v16 = CFSTR("queryIntentWeight");
  else
    v16 = CFSTR("query_intent_weight");
  objc_msgSend(v885, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v17, "doubleValue");
    *(_QWORD *)(v966 + 308) |= 0x400000001uLL;
    *(_QWORD *)(v966 + 168) = v18;
  }

  if (a3)
    v19 = CFSTR("isFromKnowledgeGraph");
  else
    v19 = CFSTR("is_from_knowledge_graph");
  objc_msgSend(v885, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = objc_msgSend(v20, "BOOLValue");
    *(_QWORD *)(v966 + 308) |= 0x400000008uLL;
    *(_BYTE *)(v966 + 305) = v21;
  }

  if (a3)
    v22 = CFSTR("isFromSearchQu");
  else
    v22 = CFSTR("is_from_search_qu");
  objc_msgSend(v885, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = objc_msgSend(v23, "BOOLValue");
    *(_QWORD *)(v966 + 308) |= 0x400000010uLL;
    *(_BYTE *)(v966 + 306) = v24;
  }

  if (a3)
    v25 = CFSTR("queryTagMetadata");
  else
    v25 = CFSTR("query_tag_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v25);
  v923 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = v923;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = [GEOPDSearchQueryTagMetadata alloc];
    if (v27)
    {
      v28 = v27;
      v29 = v923;
      v30 = -[GEOPDSearchQueryTagMetadata init](v28, "init");
      if (v30)
      {
        v914 = v29;
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("rank"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v32 = objc_msgSend(v31, "unsignedIntValue");
          *(_BYTE *)(v30 + 72) |= 0x40u;
          *(_BYTE *)(v30 + 72) |= 8u;
          *(_DWORD *)(v30 + 68) = v32;
        }

        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("score"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v33, "doubleValue");
          *(_BYTE *)(v30 + 72) |= 0x40u;
          *(_BYTE *)(v30 + 72) |= 2u;
          *(_QWORD *)(v30 + 32) = v34;
        }

        if (a3)
          v35 = CFSTR("normalizedScore");
        else
          v35 = CFSTR("normalized_score");
        objc_msgSend(v29, "objectForKeyedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v36, "doubleValue");
          *(_BYTE *)(v30 + 72) |= 0x40u;
          *(_BYTE *)(v30 + 72) |= 1u;
          *(_QWORD *)(v30 + 24) = v37;
        }

        if (a3)
          v38 = CFSTR("sigmoidScore");
        else
          v38 = CFSTR("sigmoid_score");
        objc_msgSend(v29, "objectForKeyedSubscript:", v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v39, "doubleValue");
          *(_BYTE *)(v30 + 72) |= 0x40u;
          *(_BYTE *)(v30 + 72) |= 4u;
          *(_QWORD *)(v30 + 40) = v40;
        }

        if (a3)
          v41 = CFSTR("spanScore");
        else
          v41 = CFSTR("span_score");
        objc_msgSend(v29, "objectForKeyedSubscript:", v41);
        v906 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v42 = v906;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1028 = 0u;
          v1027 = 0u;
          v1026 = 0u;
          v1025 = 0u;
          obj = v906;
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
          if (!v43)
            goto LABEL_109;
          v44 = CFSTR("intent_type");
          v45 = *(_QWORD *)v1026;
          if (a3)
            v44 = CFSTR("intentType");
          v937 = v44;
          while (1)
          {
            v46 = 0;
            do
            {
              if (*(_QWORD *)v1026 != v45)
                objc_enumerationMutation(obj);
              v47 = *(void **)(*((_QWORD *)&v1025 + 1) + 8 * v46);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v48 = [GEOPDSearchSpanScore alloc];
                if (v48)
                {
                  v49 = v47;
                  v50 = -[GEOPDSearchSpanScore init](v48, "init");
                  if (v50)
                  {
                    objc_msgSend(v49, "objectForKeyedSubscript:", v937);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v52 = v51;
                      if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_UNKNOWN")) & 1) != 0)
                      {
                        v53 = 0;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_CATEGORY")) & 1) != 0)
                      {
                        v53 = 1;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_CHAIN")) & 1) != 0)
                      {
                        v53 = 2;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_BUSINESS")) & 1) != 0)
                      {
                        v53 = 3;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_GEO")) & 1) != 0)
                      {
                        v53 = 4;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_PROXIMITY")) & 1) != 0)
                      {
                        v53 = 5;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_LOCATION")) & 1) != 0)
                      {
                        v53 = 6;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_ATTRIBUTE")) & 1) != 0)
                      {
                        v53 = 7;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_CLIENT_RESOLVED")) & 1) != 0)
                      {
                        v53 = 8;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_SEARCH_FILTER")) & 1) != 0)
                      {
                        v53 = 9;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_DIRECTION_INTENT")) & 1) != 0)
                      {
                        v53 = 10;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_TRANSIT")) & 1) != 0)
                      {
                        v53 = 11;
                      }
                      else if ((objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_PHONE_NUMBER")) & 1) != 0)
                      {
                        v53 = 12;
                      }
                      else if (objc_msgSend(v52, "isEqualToString:", CFSTR("INTENT_TYPE_KEYWORD")))
                      {
                        v53 = 13;
                      }
                      else
                      {
                        v53 = 0;
                      }

LABEL_99:
                      *(_BYTE *)(v50 + 20) |= 2u;
                      *(_DWORD *)(v50 + 16) = v53;
                    }
                    else
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v53 = objc_msgSend(v51, "intValue");
                        goto LABEL_99;
                      }
                    }

                    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("score"));
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(v54, "doubleValue");
                      *(_BYTE *)(v50 + 20) |= 1u;
                      *(_QWORD *)(v50 + 8) = v55;
                    }

                  }
                }
                else
                {
                  v50 = 0;
                }
                -[GEOPDSearchQueryTagMetadata addSpanScore:](v30, (void *)v50);

              }
              ++v46;
            }
            while (v43 != v46);
            v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
            v43 = v56;
            if (!v56)
            {
LABEL_109:

              v42 = v906;
              break;
            }
          }
        }

        if (a3)
          v57 = CFSTR("modelVersion");
        else
          v57 = CFSTR("model_version");
        objc_msgSend(v914, "objectForKeyedSubscript:", v57);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1024 = 0u;
          v1023 = 0u;
          v1022 = 0u;
          v1021 = 0u;
          v59 = v58;
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
          if (v60)
          {
            v61 = *(_QWORD *)v1022;
            do
            {
              v62 = 0;
              do
              {
                if (*(_QWORD *)v1022 != v61)
                  objc_enumerationMutation(v59);
                v63 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v62);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v64 = [GEOPDSearchStringStringPair alloc];
                  if (v64)
                    v65 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v64, v63);
                  else
                    v65 = 0;
                  -[GEOPDSearchQueryTagMetadata addModelVersion:](v30, v65);

                }
                ++v62;
              }
              while (v60 != v62);
              v66 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
              v60 = v66;
            }
            while (v66);
          }

        }
        v29 = v914;
      }

    }
    else
    {
      v30 = 0;
    }
    v67 = (id)v30;
    *(_QWORD *)(v966 + 308) |= 0x404000000uLL;
    objc_storeStrong((id *)(v966 + 224), (id)v30);

    v26 = v923;
  }

  if (a3)
    v68 = CFSTR("queryClassificationMetadata");
  else
    v68 = CFSTR("query_classification_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v68);
  v892 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v69 = v892;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v983 = 0u;
    v984 = 0u;
    v981 = 0u;
    v982 = 0u;
    v915 = v892;
    v938 = objc_msgSend(v915, "countByEnumeratingWithState:objects:count:", &v981, v1012, 16);
    if (v938)
    {
      v924 = *(_QWORD *)v982;
      if (a3)
        v70 = CFSTR("classiferId");
      else
        v70 = CFSTR("classifer_id");
      v71 = CFSTR("model_version");
      if (a3)
        v71 = CFSTR("modelVersion");
      v899 = v71;
      v907 = v70;
      do
      {
        v72 = 0;
        do
        {
          if (*(_QWORD *)v982 != v924)
            objc_enumerationMutation(v915);
          v73 = *(void **)(*((_QWORD *)&v981 + 1) + 8 * v72);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v74 = [GEOPDSearchQueryClassificationMetadata alloc];
            if (v74)
            {
              obja = v73;
              v75 = -[GEOPDSearchQueryClassificationMetadata init](v74, "init");
              if (v75)
              {
                objc_msgSend(obja, "objectForKeyedSubscript:", v907);
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v77 = (void *)objc_msgSend(v76, "copy");
                  v78 = v77;
                  *(_BYTE *)(v75 + 60) |= 4u;
                  *(_BYTE *)(v75 + 60) |= 0x20u;
                  objc_storeStrong((id *)(v75 + 16), v77);

                }
                objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("prediction"));
                v79 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1028 = 0u;
                  v1027 = 0u;
                  v1026 = 0u;
                  v1025 = 0u;
                  v80 = v79;
                  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
                  if (v81)
                  {
                    v82 = *(_QWORD *)v1026;
                    do
                    {
                      v83 = 0;
                      do
                      {
                        if (*(_QWORD *)v1026 != v82)
                          objc_enumerationMutation(v80);
                        v84 = *(void **)(*((_QWORD *)&v1025 + 1) + 8 * v83);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v85 = [GEOPDSearchKeyValueFloatPair alloc];
                          if (v85)
                            v86 = (void *)-[GEOPDSearchKeyValueFloatPair _initWithDictionary:isJSON:]((uint64_t)v85, v84);
                          else
                            v86 = 0;
                          -[GEOPDSearchQueryClassificationMetadata addPrediction:](v75, v86);

                        }
                        ++v83;
                      }
                      while (v81 != v83);
                      v87 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
                      v81 = v87;
                    }
                    while (v87);
                  }

                }
                objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("poiGeoThreshold"));
                v88 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v88, "floatValue");
                  *(_BYTE *)(v75 + 60) |= 0x20u;
                  *(_BYTE *)(v75 + 60) |= 2u;
                  *(_DWORD *)(v75 + 56) = v89;
                }

                objc_msgSend(obja, "objectForKeyedSubscript:", CFSTR("localGlobalThreshold"));
                v90 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v90, "floatValue");
                  *(_BYTE *)(v75 + 60) |= 0x20u;
                  *(_BYTE *)(v75 + 60) |= 1u;
                  *(_DWORD *)(v75 + 52) = v91;
                }

                objc_msgSend(obja, "objectForKeyedSubscript:", v899);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1024 = 0u;
                  v1023 = 0u;
                  v1022 = 0u;
                  v1021 = 0u;
                  v93 = v92;
                  v94 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
                  if (v94)
                  {
                    v95 = *(_QWORD *)v1022;
                    do
                    {
                      v96 = 0;
                      do
                      {
                        if (*(_QWORD *)v1022 != v95)
                          objc_enumerationMutation(v93);
                        v97 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v96);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v98 = [GEOPDSearchStringStringPair alloc];
                          if (v98)
                            v99 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v98, v97);
                          else
                            v99 = 0;
                          -[GEOPDSearchQueryClassificationMetadata addModelVersion:](v75, v99);

                        }
                        ++v96;
                      }
                      while (v94 != v96);
                      v100 = objc_msgSend(v93, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
                      v94 = v100;
                    }
                    while (v100);
                  }

                }
              }

            }
            else
            {
              v75 = 0;
            }
            -[GEOPDSearchQueryIntentMetadata addQueryClassificationMetadata:](v966, (void *)v75);

          }
          ++v72;
        }
        while (v72 != v938);
        v101 = objc_msgSend(v915, "countByEnumeratingWithState:objects:count:", &v981, v1012, 16);
        v938 = v101;
      }
      while (v101);
    }

    v69 = v892;
  }

  if (a3)
    v102 = CFSTR("querySpellCorrectionMetadata");
  else
    v102 = CFSTR("query_spell_correction_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v102);
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v104 = [GEOPDSearchQuerySpellCorrectionMetadata alloc];
    if (!v104)
    {
      v106 = 0;
      goto LABEL_330;
    }
    v105 = v103;
    v106 = -[GEOPDSearchQuerySpellCorrectionMetadata init](v104, "init");
    if (!v106)
    {
LABEL_329:

LABEL_330:
      v173 = (id)v106;
      *(_QWORD *)(v966 + 308) |= 0x401000000uLL;
      objc_storeStrong((id *)(v966 + 208), (id)v106);

      goto LABEL_331;
    }
    if (a3)
      v107 = CFSTR("spellSuggestion");
    else
      v107 = CFSTR("spell_suggestion");
    objc_msgSend(v105, "objectForKeyedSubscript:", v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v109 = [GEOPDSearchSpellSuggestion alloc];
      if (v109)
        v110 = (void *)-[GEOPDSearchSpellSuggestion _initWithDictionary:isJSON:]((uint64_t)v109, v108, a3);
      else
        v110 = 0;
      v111 = v110;
      *(_WORD *)(v106 + 100) |= 0x2000u;
      *(_WORD *)(v106 + 100) |= 0x8000u;
      objc_storeStrong((id *)(v106 + 48), v110);

    }
    if (a3)
      v112 = CFSTR("isFromPoiSearchSpeller");
    else
      v112 = CFSTR("is_from_poi_search_speller");
    objc_msgSend(v105, "objectForKeyedSubscript:", v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v114 = objc_msgSend(v113, "BOOLValue");
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 0x200u;
      *(_BYTE *)(v106 + 95) = v114;
    }

    if (a3)
      v115 = CFSTR("resultStatus");
    else
      v115 = CFSTR("result_status");
    objc_msgSend(v105, "objectForKeyedSubscript:", v115);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v117 = v116;
      if ((objc_msgSend(v117, "isEqualToString:", CFSTR("NOT_IN_WHITE_LIST")) & 1) != 0)
      {
        v118 = 1;
      }
      else if ((objc_msgSend(v117, "isEqualToString:", CFSTR("SPELL_CORRECTION_NOT_ATTEMPTED")) & 1) != 0)
      {
        v118 = 2;
      }
      else if ((objc_msgSend(v117, "isEqualToString:", CFSTR("NO_SUGGESTIONS")) & 1) != 0)
      {
        v118 = 3;
      }
      else if ((objc_msgSend(v117, "isEqualToString:", CFSTR("SPELL_CORRECTION_NOT_REQUIRED")) & 1) != 0)
      {
        v118 = 4;
      }
      else if ((objc_msgSend(v117, "isEqualToString:", CFSTR("SPELL_CORRECTED")) & 1) != 0)
      {
        v118 = 5;
      }
      else if (objc_msgSend(v117, "isEqualToString:", CFSTR("NOT_PROCESSED")))
      {
        v118 = 6;
      }
      else
      {
        v118 = 1;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_231;
      v118 = objc_msgSend(v116, "intValue");
    }
    *(_WORD *)(v106 + 100) |= 0x8000u;
    *(_WORD *)(v106 + 100) |= 0x10u;
    *(_DWORD *)(v106 + 84) = v118;
LABEL_231:

    if (a3)
      v119 = CFSTR("decileId");
    else
      v119 = CFSTR("decile_id");
    objc_msgSend(v105, "objectForKeyedSubscript:", v119);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v121 = objc_msgSend(v120, "unsignedLongLongValue");
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 1u;
      *(_QWORD *)(v106 + 32) = v121;
    }

    if (a3)
      v122 = CFSTR("isSpellCorrectionSameAsOrgQuery");
    else
      v122 = CFSTR("is_spell_correction_same_as_org_query");
    objc_msgSend(v105, "objectForKeyedSubscript:", v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v124 = objc_msgSend(v123, "BOOLValue");
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 0x400u;
      *(_BYTE *)(v106 + 96) = v124;
    }

    if (a3)
      v125 = CFSTR("tokenCandidate");
    else
      v125 = CFSTR("token_candidate");
    objc_msgSend(v105, "objectForKeyedSubscript:", v125);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1024 = 0u;
      v1023 = 0u;
      v1022 = 0u;
      v1021 = 0u;
      v127 = v126;
      v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
      if (v128)
      {
        v129 = *(_QWORD *)v1022;
        do
        {
          v130 = 0;
          do
          {
            if (*(_QWORD *)v1022 != v129)
              objc_enumerationMutation(v127);
            v131 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v130);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v132 = [GEOPDSearchTokenCandidates alloc];
              if (v132)
                v133 = -[GEOPDSearchTokenCandidates _initWithDictionary:isJSON:](v132, v131, a3);
              else
                v133 = 0;
              -[GEOPDSearchQuerySpellCorrectionMetadata addTokenCandidate:](v106, v133);

            }
            ++v130;
          }
          while (v128 != v130);
          v134 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
          v128 = v134;
        }
        while (v134);
      }

    }
    if (a3)
      v135 = CFSTR("misspellScore");
    else
      v135 = CFSTR("misspell_score");
    objc_msgSend(v105, "objectForKeyedSubscript:", v135);
    v136 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v136, "doubleValue");
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 2u;
      *(_QWORD *)(v106 + 40) = v137;
    }

    if (a3)
      v138 = CFSTR("isConfidentSpellCorrection");
    else
      v138 = CFSTR("is_confident_spell_correction");
    objc_msgSend(v105, "objectForKeyedSubscript:", v138);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v140 = objc_msgSend(v139, "BOOLValue");
      *(_WORD *)(v106 + 100) |= 0x8000u;
      *(_WORD *)(v106 + 100) |= 0x100u;
      *(_BYTE *)(v106 + 94) = v140;
    }

    if (a3)
      v141 = CFSTR("allTokenCandidates");
    else
      v141 = CFSTR("all_token_candidates");
    objc_msgSend(v105, "objectForKeyedSubscript:", v141);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1020 = 0u;
      v1019 = 0u;
      v1018 = 0u;
      v1017 = 0u;
      v143 = v142;
      v144 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
      if (v144)
      {
        v145 = *(_QWORD *)v1018;
        do
        {
          v146 = 0;
          do
          {
            if (*(_QWORD *)v1018 != v145)
              objc_enumerationMutation(v143);
            v147 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * v146);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v148 = [GEOPDSearchTokenCandidates alloc];
              if (v148)
                v149 = -[GEOPDSearchTokenCandidates _initWithDictionary:isJSON:](v148, v147, a3);
              else
                v149 = 0;
              -[GEOPDSearchQuerySpellCorrectionMetadata addAllTokenCandidates:](v106, v149);

            }
            ++v146;
          }
          while (v144 != v146);
          v150 = objc_msgSend(v143, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
          v144 = v150;
        }
        while (v150);
      }

    }
    if (a3)
      v151 = CFSTR("allSpellSuggestions");
    else
      v151 = CFSTR("all_spell_suggestions");
    objc_msgSend(v105, "objectForKeyedSubscript:", v151);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1016 = 0u;
      v1015 = 0u;
      v1014 = 0u;
      v1013 = 0u;
      v153 = v152;
      v154 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
      if (v154)
      {
        v155 = *(_QWORD *)v1014;
        do
        {
          v156 = 0;
          do
          {
            if (*(_QWORD *)v1014 != v155)
              objc_enumerationMutation(v153);
            v157 = *(void **)(*((_QWORD *)&v1013 + 1) + 8 * v156);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v158 = [GEOPDSearchSpellSuggestion alloc];
              if (v158)
                v159 = (void *)-[GEOPDSearchSpellSuggestion _initWithDictionary:isJSON:]((uint64_t)v158, v157, a3);
              else
                v159 = 0;
              -[GEOPDSearchQuerySpellCorrectionMetadata addAllSpellSuggestions:](v106, v159);

            }
            ++v156;
          }
          while (v154 != v156);
          v160 = objc_msgSend(v153, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
          v154 = v160;
        }
        while (v160);
      }

    }
    if (a3)
      v161 = CFSTR("spellerRankerModelType");
    else
      v161 = CFSTR("speller_ranker_model_type");
    objc_msgSend(v105, "objectForKeyedSubscript:", v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v163 = v162;
      if ((objc_msgSend(v163, "isEqualToString:", CFSTR("MODEL_TYPE_UNKNOWN")) & 1) != 0)
      {
        v164 = 0;
      }
      else if ((objc_msgSend(v163, "isEqualToString:", CFSTR("MODEL_TYPE_XGBOOST")) & 1) != 0)
      {
        v164 = 1;
      }
      else if (objc_msgSend(v163, "isEqualToString:", CFSTR("MODEL_TYPE_DL_SEQ2SEQ")))
      {
        v164 = 2;
      }
      else
      {
        v164 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_320:

        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("isFromDLCacheModel"));
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v166 = objc_msgSend(v165, "BOOLValue");
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 0x40u;
          *(_BYTE *)(v106 + 92) = v166;
        }

        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("isFromDLRuntimeModel"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v168 = objc_msgSend(v167, "BOOLValue");
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 0x80u;
          *(_BYTE *)(v106 + 93) = v168;
        }

        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("modelNumberMajor"));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v170 = objc_msgSend(v169, "unsignedIntValue");
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 4u;
          *(_DWORD *)(v106 + 76) = v170;
        }

        objc_msgSend(v105, "objectForKeyedSubscript:", CFSTR("modelNumberMinor"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v172 = objc_msgSend(v171, "unsignedIntValue");
          *(_WORD *)(v106 + 100) |= 0x8000u;
          *(_WORD *)(v106 + 100) |= 8u;
          *(_DWORD *)(v106 + 80) = v172;
        }

        goto LABEL_329;
      }
      v164 = objc_msgSend(v162, "intValue");
    }
    *(_WORD *)(v106 + 100) |= 0x8000u;
    *(_WORD *)(v106 + 100) |= 0x20u;
    *(_DWORD *)(v106 + 88) = v164;
    goto LABEL_320;
  }
LABEL_331:

  if (a3)
    v174 = CFSTR("isFromDefinitiveQu");
  else
    v174 = CFSTR("is_from_definitive_qu");
  objc_msgSend(v885, "objectForKeyedSubscript:", v174);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v176 = objc_msgSend(v175, "BOOLValue");
    *(_QWORD *)(v966 + 308) |= 0x400000004uLL;
    *(_BYTE *)(v966 + 304) = v176;
  }

  if (a3)
    v177 = CFSTR("queryGeoMetadata");
  else
    v177 = CFSTR("query_geo_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v177);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v179 = [GEOPDSearchQueryGeoMetadata alloc];
    if (v179)
    {
      v180 = v178;
      v181 = -[GEOPDSearchQueryGeoMetadata init](v179, "init");
      if (v181)
      {
        if (a3)
          v182 = CFSTR("namedFeature");
        else
          v182 = CFSTR("named_feature");
        objc_msgSend(v180, "objectForKeyedSubscript:", v182);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1032 = 0u;
          v1031 = 0u;
          v1030 = 0u;
          v1029 = 0u;
          v184 = v183;
          v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
          if (v185)
          {
            v186 = *(_QWORD *)v1030;
            do
            {
              for (i = 0; i != v185; ++i)
              {
                if (*(_QWORD *)v1030 != v186)
                  objc_enumerationMutation(v184);
                v188 = *(_QWORD *)(*((_QWORD *)&v1029 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v189 = [GEONamedFeature alloc];
                  if ((a3 & 1) != 0)
                    v190 = -[GEONamedFeature initWithJSON:](v189, "initWithJSON:", v188);
                  else
                    v190 = -[GEONamedFeature initWithDictionary:](v189, "initWithDictionary:", v188);
                  v191 = v190;
                  -[GEOPDSearchQueryGeoMetadata addNamedFeature:]((uint64_t)v181, v190);

                }
              }
              v185 = objc_msgSend(v184, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
            }
            while (v185);
          }

        }
      }

    }
    else
    {
      v181 = 0;
    }
    v192 = v181;
    *(_QWORD *)(v966 + 308) |= 0x400020000uLL;
    objc_storeStrong((id *)(v966 + 144), v181);

  }
  if (a3)
    v193 = CFSTR("intentSource");
  else
    v193 = CFSTR("intent_source");
  objc_msgSend(v885, "objectForKeyedSubscript:", v193);
  objb = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v979 = 0u;
    v980 = 0u;
    v977 = 0u;
    v978 = 0u;
    v194 = objb;
    v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v977, v1011, 16);
    if (!v195)
      goto LABEL_389;
    v196 = *(_QWORD *)v978;
    while (1)
    {
      for (j = 0; j != v195; ++j)
      {
        if (*(_QWORD *)v978 != v196)
          objc_enumerationMutation(v194);
        v198 = *(void **)(*((_QWORD *)&v977 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v199 = v198;
          if ((objc_msgSend(v199, "isEqualToString:", CFSTR("NONE")) & 1) == 0
            && (objc_msgSend(v199, "isEqualToString:", CFSTR("PERCEPTRON")) & 1) == 0
            && (objc_msgSend(v199, "isEqualToString:", CFSTR("TREE_BASED")) & 1) == 0
            && (objc_msgSend(v199, "isEqualToString:", CFSTR("QIS")) & 1) == 0
            && (objc_msgSend(v199, "isEqualToString:", CFSTR("AC_TAP")) & 1) == 0
            && (objc_msgSend(v199, "isEqualToString:", CFSTR("NEURAL")) & 1) == 0)
          {
            objc_msgSend(v199, "isEqualToString:", CFSTR("GEO"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v198, "intValue");
        }
        v200 = (os_unfair_lock_s *)v966;
        os_unfair_lock_lock((os_unfair_lock_t)(v966 + 296));
        if ((*(_BYTE *)(v966 + 308) & 0x20) == 0)
        {
          v201 = *(void **)(v966 + 8);
          if (v201)
          {
            v202 = v201;
            objc_sync_enter(v202);
            GEOPDSearchQueryIntentMetadataReadSpecified(v966, *(_QWORD *)(v966 + 8), (int *)&_readIntentSources_tags);
            objc_sync_exit(v202);

            v200 = (os_unfair_lock_s *)v966;
          }
        }
        os_unfair_lock_unlock(v200 + 74);
        PBRepeatedInt32Add();
        os_unfair_lock_lock_with_options();
        *(_QWORD *)(v966 + 308) |= 0x20uLL;
        os_unfair_lock_unlock((os_unfair_lock_t)(v966 + 296));
        *(_QWORD *)(v966 + 308) |= 0x400000000uLL;
      }
      v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v977, v1011, 16);
      if (!v195)
      {
LABEL_389:

        break;
      }
    }
  }

  if (a3)
    v203 = CFSTR("querySynonymMetadata");
  else
    v203 = CFSTR("query_synonym_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v203);
  v204 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v205 = [GEOPDSearchQuerySynonymMetadata alloc];
    if (v205)
      v206 = (void *)-[GEOPDSearchQuerySynonymMetadata _initWithDictionary:isJSON:](v205, v204, a3);
    else
      v206 = 0;
    v207 = v206;
    *(_QWORD *)(v966 + 308) |= 0x402000000uLL;
    objc_storeStrong((id *)(v966 + 216), v206);

  }
  if (a3)
    v208 = CFSTR("queryDymMetadata");
  else
    v208 = CFSTR("query_dym_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v208);
  v209 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v210 = [GEOPDSearchQueryDymMetadata alloc];
    if (!v210)
    {
      v212 = 0;
      goto LABEL_428;
    }
    v211 = v209;
    v212 = -[GEOPDSearchQueryDymMetadata init](v210, "init");
    if (!v212)
    {
LABEL_427:

LABEL_428:
      v224 = (id)v212;
      *(_QWORD *)(v966 + 308) |= 0x400004000uLL;
      objc_storeStrong((id *)(v966 + 120), (id)v212);

      goto LABEL_429;
    }
    objc_msgSend(v211, "objectForKeyedSubscript:", CFSTR("type"));
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v214 = v213;
      if ((objc_msgSend(v214, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
      {
        v215 = 0;
      }
      else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("ORIGINAL")) & 1) != 0)
      {
        v215 = 1;
      }
      else if ((objc_msgSend(v214, "isEqualToString:", CFSTR("REFINED")) & 1) != 0)
      {
        v215 = 2;
      }
      else if (objc_msgSend(v214, "isEqualToString:", CFSTR("DISPLAY_ONLY")))
      {
        v215 = 3;
      }
      else
      {
        v215 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_417:

        objc_msgSend(v211, "objectForKeyedSubscript:", v860);
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v217 = (void *)objc_msgSend(v216, "copy");
          v218 = v217;
          *(_BYTE *)(v212 + 48) |= 2u;
          *(_BYTE *)(v212 + 48) |= 8u;
          objc_storeStrong((id *)(v212 + 16), v217);

        }
        if (a3)
          v219 = CFSTR("synonymMetadata");
        else
          v219 = CFSTR("synonym_metadata");
        objc_msgSend(v211, "objectForKeyedSubscript:", v219);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v221 = [GEOPDSearchQuerySynonymMetadata alloc];
          if (v221)
            v222 = (void *)-[GEOPDSearchQuerySynonymMetadata _initWithDictionary:isJSON:](v221, v220, a3);
          else
            v222 = 0;
          v223 = v222;
          *(_BYTE *)(v212 + 48) |= 4u;
          *(_BYTE *)(v212 + 48) |= 8u;
          objc_storeStrong((id *)(v212 + 24), v222);

        }
        goto LABEL_427;
      }
      v215 = objc_msgSend(v213, "intValue");
    }
    *(_BYTE *)(v212 + 48) |= 8u;
    *(_BYTE *)(v212 + 48) |= 1u;
    *(_DWORD *)(v212 + 44) = v215;
    goto LABEL_417;
  }
LABEL_429:

  if (a3)
    v225 = CFSTR("queryCompletionMetadata");
  else
    v225 = CFSTR("query_completion_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v225);
  objc = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v226 = [GEOPDSearchQueryCompletionMetadata alloc];
    if (v226)
    {
      v939 = objc;
      v227 = -[GEOPDSearchQueryCompletionMetadata init](v226, "init");
      if (v227)
      {
        objc_msgSend(v939, "objectForKeyedSubscript:", CFSTR("completion"));
        v228 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v229 = (void *)objc_msgSend(v228, "copy");
          v230 = v229;
          *(_WORD *)(v227 + 112) |= 0x40u;
          *(_WORD *)(v227 + 112) |= 0x100u;
          objc_storeStrong((id *)(v227 + 64), v229);

        }
        objc_msgSend(v939, "objectForKeyedSubscript:", CFSTR("score"));
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v231, "floatValue");
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 2u;
          *(_DWORD *)(v227 + 100) = v232;
        }

        objc_msgSend(v939, "objectForKeyedSubscript:", CFSTR("popularity"));
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v234 = objc_msgSend(v233, "longLongValue");
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 1u;
          *(_QWORD *)(v227 + 72) = v234;
        }

        objc_msgSend(v939, "objectForKeyedSubscript:", CFSTR("tags"));
        v925 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1024 = 0u;
          v1023 = 0u;
          v1022 = 0u;
          v1021 = 0u;
          v235 = v925;
          v236 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
          if (v236)
          {
            v237 = *(_QWORD *)v1022;
            do
            {
              for (k = 0; k != v236; ++k)
              {
                if (*(_QWORD *)v1022 != v237)
                  objc_enumerationMutation(v235);
                v239 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * k);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v239, "intValue");
                  os_unfair_lock_lock((os_unfair_lock_t)(v227 + 96));
                  if ((*(_WORD *)(v227 + 112) & 0x20) == 0)
                  {
                    v240 = *(void **)(v227 + 8);
                    if (v240)
                    {
                      v241 = v240;
                      objc_sync_enter(v241);
                      GEOPDSearchQueryCompletionMetadataReadSpecified(v227, *(_QWORD *)(v227 + 8), (int *)&_readTags_tags);
                      objc_sync_exit(v241);

                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
                  PBRepeatedInt32Add();
                  os_unfair_lock_lock_with_options();
                  *(_WORD *)(v227 + 112) |= 0x20u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
                  *(_WORD *)(v227 + 112) |= 0x100u;
                }
              }
              v236 = objc_msgSend(v235, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
            }
            while (v236);
          }

        }
        if (a3)
          v242 = CFSTR("tagConfidence");
        else
          v242 = CFSTR("tag_confidence");
        objc_msgSend(v939, "objectForKeyedSubscript:", v242);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v243, "floatValue");
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 4u;
          *(_DWORD *)(v227 + 104) = v244;
        }

        if (a3)
          v245 = CFSTR("isCompletematch");
        else
          v245 = CFSTR("is_completeMatch");
        objc_msgSend(v939, "objectForKeyedSubscript:", v245);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v247 = objc_msgSend(v246, "BOOLValue");
          *(_WORD *)(v227 + 112) |= 0x100u;
          *(_WORD *)(v227 + 112) |= 8u;
          *(_BYTE *)(v227 + 108) = v247;
        }

        objc_msgSend(v939, "objectForKeyedSubscript:", CFSTR("tokens"));
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1020 = 0u;
          v1019 = 0u;
          v1018 = 0u;
          v1017 = 0u;
          v249 = v248;
          v250 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
          if (v250)
          {
            v251 = *(_QWORD *)v1018;
            do
            {
              for (m = 0; m != v250; ++m)
              {
                if (*(_QWORD *)v1018 != v251)
                  objc_enumerationMutation(v249);
                v253 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * m);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v254 = (void *)objc_msgSend(v253, "copy");
                  -[GEOPDSearchQueryCompletionMetadata addTokens:](v227, v254);

                }
              }
              v250 = objc_msgSend(v249, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
            }
            while (v250);
          }

        }
        if (a3)
          v255 = CFSTR("completionSourceTypes");
        else
          v255 = CFSTR("completion_source_types");
        objc_msgSend(v939, "objectForKeyedSubscript:", v255);
        v926 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1016 = 0u;
          v1015 = 0u;
          v1014 = 0u;
          v1013 = 0u;
          v256 = v926;
          v257 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
          if (!v257)
            goto LABEL_511;
          v258 = *(_QWORD *)v1014;
          while (1)
          {
            for (n = 0; n != v257; ++n)
            {
              if (*(_QWORD *)v1014 != v258)
                objc_enumerationMutation(v256);
              v260 = *(void **)(*((_QWORD *)&v1013 + 1) + 8 * n);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v261 = v260;
                if ((objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_DEFAULT")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LOG")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EDITORIAL")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_CLUSTER")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LATENT_BRAND")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_GLOV")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EXPANSION")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EMBEDDING")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EMBEDDING_NNS")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LOCALIZATION")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_STRUCTURED")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LEGACY")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_RANKING")) & 1) == 0
                  && (objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_TRANSLATION")) & 1) == 0)
                {
                  objc_msgSend(v261, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_APPLE_LLM"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v260, "intValue");
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v227 + 96));
              if ((*(_WORD *)(v227 + 112) & 0x10) == 0)
              {
                v262 = *(void **)(v227 + 8);
                if (v262)
                {
                  v263 = v262;
                  objc_sync_enter(v263);
                  GEOPDSearchQueryCompletionMetadataReadSpecified(v227, *(_QWORD *)(v227 + 8), (int *)&_readCompletionSourceTypes_tags);
                  objc_sync_exit(v263);

                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(_WORD *)(v227 + 112) |= 0x10u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v227 + 96));
              *(_WORD *)(v227 + 112) |= 0x100u;
            }
            v257 = objc_msgSend(v256, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
            if (!v257)
            {
LABEL_511:

              break;
            }
          }
        }

      }
    }
    else
    {
      v227 = 0;
    }
    v264 = (id)v227;
    *(_QWORD *)(v966 + 308) |= 0x400000800uLL;
    objc_storeStrong((id *)(v966 + 96), (id)v227);

  }
  if (a3)
    v265 = CFSTR("queryInterpretationMetadata");
  else
    v265 = CFSTR("query_interpretation_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v265);
  v862 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v266 = [GEOPDSearchQueryInterpretationMetadata alloc];
    if (v266)
    {
      v861 = v862;
      v940 = -[GEOPDSearchQueryInterpretationMetadata init](v266, "init");
      if (v940)
      {
        objc_msgSend(v861, "objectForKeyedSubscript:", CFSTR("score"));
        v267 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v267, "floatValue");
          *(_BYTE *)(v940 + 68) |= 0x40u;
          *(_BYTE *)(v940 + 68) |= 1u;
          *(_DWORD *)(v940 + 60) = v268;
        }

        if (a3)
          v269 = CFSTR("featureMap");
        else
          v269 = CFSTR("feature_map");
        objc_msgSend(v861, "objectForKeyedSubscript:", v269);
        v270 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v991 = 0u;
          v992 = 0u;
          v989 = 0u;
          v990 = 0u;
          v271 = v270;
          v272 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v989, &v1017, 16);
          if (v272)
          {
            v273 = *(_QWORD *)v990;
            do
            {
              v274 = 0;
              do
              {
                if (*(_QWORD *)v990 != v273)
                  objc_enumerationMutation(v271);
                v275 = *(void **)(*((_QWORD *)&v989 + 1) + 8 * v274);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v276 = [GEOPDSearchPair alloc];
                  if (v276)
                    v277 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v276, v275);
                  else
                    v277 = 0;
                  -[GEOPDSearchQueryInterpretationMetadata addFeatureMap:](v940, v277);

                }
                ++v274;
              }
              while (v272 != v274);
              v278 = objc_msgSend(v271, "countByEnumeratingWithState:objects:count:", &v989, &v1017, 16);
              v272 = v278;
            }
            while (v278);
          }

        }
        if (a3)
          v279 = CFSTR("triggerFeatures");
        else
          v279 = CFSTR("trigger_features");
        objc_msgSend(v861, "objectForKeyedSubscript:", v279);
        v858 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v987 = 0u;
          v988 = 0u;
          v985 = 0u;
          v986 = 0u;
          v893 = v858;
          v908 = objc_msgSend(v893, "countByEnumeratingWithState:objects:count:", &v985, &v1013, 16);
          if (v908)
          {
            v280 = CFSTR("canonical_name");
            v900 = *(id *)v986;
            if (a3)
              v280 = CFSTR("canonicalName");
            v886 = v280;
            v281 = CFSTR("entityId");
            if (!a3)
              v281 = CFSTR("entity_id");
            v881 = v281;
            v282 = CFSTR("global_popularity");
            if (a3)
              v282 = CFSTR("globalPopularity");
            v878 = v282;
            if (a3)
              v283 = CFSTR("localPmiScore");
            else
              v283 = CFSTR("local_pmi_score");
            v876 = v283;
            if (a3)
              v284 = CFSTR("globalPmiScore");
            else
              v284 = CFSTR("global_pmi_Score");
            v285 = CFSTR("display_name");
            if (a3)
              v285 = CFSTR("displayName");
            v873 = v285;
            v874 = v284;
            if (a3)
              v286 = CFSTR("completionSourceTypes");
            else
              v286 = CFSTR("completion_source_types");
            v287 = CFSTR("isUseShowOnMapHighlightExtra");
            if (!a3)
              v287 = CFSTR("is_use_show_on_map_highlight_extra");
            v871 = v287;
            v872 = v286;
            v288 = CFSTR("similarity_score");
            if (a3)
              v288 = CFSTR("similarityScore");
            v870 = v288;
            if (a3)
              v289 = CFSTR("w2vSimilarityScore");
            else
              v289 = CFSTR("w2v_similarity_score");
            v869 = v289;
            if (a3)
              v290 = CFSTR("globalEntityPopularity");
            else
              v290 = CFSTR("global_entity_popularity");
            v291 = CFSTR("local_entity_popularity");
            if (a3)
              v291 = CFSTR("localEntityPopularity");
            v867 = v291;
            v868 = v290;
            if (a3)
              v292 = CFSTR("prefCategory");
            else
              v292 = CFSTR("pref_category");
            v293 = CFSTR("modernToLegacyIdMapping");
            if (!a3)
              v293 = CFSTR("modern_to_legacy_id_mapping");
            v865 = v293;
            v866 = v292;
            v294 = CFSTR("related_categories");
            if (a3)
              v294 = CFSTR("relatedCategories");
            v864 = v294;
            if (a3)
              v295 = CFSTR("densityScore");
            else
              v295 = CFSTR("density_score");
            v863 = v295;
            do
            {
              v296 = 0;
              do
              {
                if (*(id *)v986 != v900)
                {
                  v297 = v296;
                  objc_enumerationMutation(v893);
                  v296 = v297;
                }
                v927 = v296;
                v298 = *(void **)(*((_QWORD *)&v985 + 1) + 8 * v296);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v299 = [GEOPDSearchTriggerFeature alloc];
                  if (v299)
                  {
                    objd = v298;
                    v300 = -[GEOPDSearchTriggerFeature init](v299, "init");
                    if (v300)
                    {
                      objc_msgSend(objd, "objectForKeyedSubscript:", CFSTR("trigger"));
                      v301 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v302 = (void *)objc_msgSend(v301, "copy");
                        v303 = v302;
                        *(_DWORD *)(v300 + 196) |= 0x100000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 152), v302);

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", v886);
                      v304 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v305 = (void *)objc_msgSend(v304, "copy");
                        v306 = v305;
                        *(_DWORD *)(v300 + 196) |= 0x4000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 40), v305);

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", CFSTR("tag"));
                      v307 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v308 = objc_msgSend(v307, "intValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x800u;
                        *(_DWORD *)(v300 + 188) = v308;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v881);
                      v309 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v310 = (void *)objc_msgSend(v309, "copy");
                        v311 = v310;
                        *(_DWORD *)(v300 + 196) |= 0x10000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 64), v310);

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", v878);
                      v312 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v313 = objc_msgSend(v312, "longLongValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 4u;
                        *(_QWORD *)(v300 + 80) = v313;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v876);
                      v314 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v314, "floatValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x400u;
                        *(_DWORD *)(v300 + 184) = v315;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v874);
                      v316 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v316, "floatValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x200u;
                        *(_DWORD *)(v300 + 180) = v317;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", CFSTR("lat"));
                      v318 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v318, "doubleValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 8u;
                        *(_QWORD *)(v300 + 88) = v319;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", CFSTR("lng"));
                      v320 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v320, "doubleValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x10u;
                        *(_QWORD *)(v300 + 96) = v321;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v873);
                      v322 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v323 = (void *)objc_msgSend(v322, "copy");
                        v324 = v323;
                        *(_DWORD *)(v300 + 196) |= 0x8000u;
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        objc_storeStrong((id *)(v300 + 56), v323);

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", CFSTR("localPopularity"));
                      v325 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v326 = objc_msgSend(v325, "longLongValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x20u;
                        *(_QWORD *)(v300 + 104) = v326;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v872);
                      v916 = (id)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1007 = 0u;
                        v1008 = 0u;
                        v1005 = 0u;
                        v1006 = 0u;
                        v327 = v916;
                        v328 = objc_msgSend(v327, "countByEnumeratingWithState:objects:count:", &v1005, v1033, 16);
                        if (!v328)
                          goto LABEL_646;
                        v329 = *(_QWORD *)v1006;
                        while (1)
                        {
                          for (ii = 0; ii != v328; ++ii)
                          {
                            if (*(_QWORD *)v1006 != v329)
                              objc_enumerationMutation(v327);
                            v331 = *(void **)(*((_QWORD *)&v1005 + 1) + 8 * ii);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v332 = v331;
                              if ((objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_DEFAULT")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LOG")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EDITORIAL")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_CLUSTER")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LATENT_BRAND")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_GLOV")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EXPANSION")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EMBEDDING")) & 1) == 0
                                && (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_EMBEDDING_NNS")) & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LOCALIZATION")) & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_STRUCTURED")) & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_LEGACY")) & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_RANKING")) & 1) == 0&& (objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_TRANSLATION")) & 1) == 0)
                              {
                                objc_msgSend(v332, "isEqualToString:", CFSTR("COMPLETION_SOURCE_TYPE_APPLE_LLM"));
                              }

                            }
                            else
                            {
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) == 0)
                                continue;
                              objc_msgSend(v331, "intValue");
                            }
                            os_unfair_lock_lock((os_unfair_lock_t)(v300 + 176));
                            if ((*(_BYTE *)(v300 + 197) & 0x20) == 0)
                            {
                              v333 = *(void **)(v300 + 8);
                              if (v333)
                              {
                                v334 = v333;
                                objc_sync_enter(v334);
                                GEOPDSearchTriggerFeatureReadSpecified(v300, *(_QWORD *)(v300 + 8), (int *)&_readCompletionSourceTypes_tags_1818);
                                objc_sync_exit(v334);

                              }
                            }
                            os_unfair_lock_unlock((os_unfair_lock_t)(v300 + 176));
                            PBRepeatedInt32Add();
                            os_unfair_lock_lock_with_options();
                            *(_DWORD *)(v300 + 196) |= 0x2000u;
                            os_unfair_lock_unlock((os_unfair_lock_t)(v300 + 176));
                            *(_DWORD *)(v300 + 196) |= 0x200000u;
                          }
                          v328 = objc_msgSend(v327, "countByEnumeratingWithState:objects:count:", &v1005, v1033, 16);
                          if (!v328)
                          {
LABEL_646:

                            break;
                          }
                        }
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v871);
                      v335 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v336 = objc_msgSend(v335, "BOOLValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x1000u;
                        *(_BYTE *)(v300 + 192) = v336;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v870);
                      v337 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v337, "doubleValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x80u;
                        *(_QWORD *)(v300 + 144) = v338;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v869);
                      v339 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v339, "doubleValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x100u;
                        *(_QWORD *)(v300 + 160) = v340;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v868);
                      v341 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v342 = objc_msgSend(v341, "longLongValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 2u;
                        *(_QWORD *)(v300 + 72) = v342;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v867);
                      v343 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v344 = objc_msgSend(v343, "longLongValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 0x40u;
                        *(_QWORD *)(v300 + 112) = v344;
                      }

                      objc_msgSend(objd, "objectForKeyedSubscript:", v866);
                      v345 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1003 = 0u;
                        v1004 = 0u;
                        v1001 = 0u;
                        v1002 = 0u;
                        v346 = v345;
                        v347 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v1001, &v1029, 16);
                        if (v347)
                        {
                          v348 = *(_QWORD *)v1002;
                          do
                          {
                            for (jj = 0; jj != v347; ++jj)
                            {
                              if (*(_QWORD *)v1002 != v348)
                                objc_enumerationMutation(v346);
                              v350 = *(void **)(*((_QWORD *)&v1001 + 1) + 8 * jj);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v351 = (void *)objc_msgSend(v350, "copy");
                                -[GEOPDSearchTriggerFeature addPrefCategory:]((os_unfair_lock_s *)v300, v351);

                              }
                            }
                            v347 = objc_msgSend(v346, "countByEnumeratingWithState:objects:count:", &v1001, &v1029, 16);
                          }
                          while (v347);
                        }

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", v865);
                      v352 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v999 = 0u;
                        v1000 = 0u;
                        v997 = 0u;
                        v998 = 0u;
                        v353 = v352;
                        v354 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v997, &v1025, 16);
                        if (v354)
                        {
                          v355 = *(_QWORD *)v998;
                          do
                          {
                            v356 = 0;
                            do
                            {
                              if (*(_QWORD *)v998 != v355)
                                objc_enumerationMutation(v353);
                              v357 = *(void **)(*((_QWORD *)&v997 + 1) + 8 * v356);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v358 = [GEOPDSearchKeyValuePair alloc];
                                if (v358)
                                  v359 = (void *)-[GEOPDSearchKeyValuePair _initWithDictionary:isJSON:]((uint64_t)v358, v357);
                                else
                                  v359 = 0;
                                -[GEOPDSearchTriggerFeature addModernToLegacyIdMapping:](v300, v359);

                              }
                              ++v356;
                            }
                            while (v354 != v356);
                            v360 = objc_msgSend(v353, "countByEnumeratingWithState:objects:count:", &v997, &v1025, 16);
                            v354 = v360;
                          }
                          while (v360);
                        }

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", v864);
                      v361 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v995 = 0u;
                        v996 = 0u;
                        v993 = 0u;
                        v994 = 0u;
                        v362 = v361;
                        v363 = objc_msgSend(v362, "countByEnumeratingWithState:objects:count:", &v993, &v1021, 16);
                        if (v363)
                        {
                          v364 = *(_QWORD *)v994;
                          do
                          {
                            v365 = 0;
                            do
                            {
                              if (*(_QWORD *)v994 != v364)
                                objc_enumerationMutation(v362);
                              v366 = *(void **)(*((_QWORD *)&v993 + 1) + 8 * v365);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v367 = [GEOPDSearchRelatedCategory alloc];
                                if (v367)
                                  v368 = (void *)-[GEOPDSearchRelatedCategory _initWithDictionary:isJSON:](v367, v366, a3);
                                else
                                  v368 = 0;
                                -[GEOPDSearchTriggerFeature addRelatedCategories:](v300, v368);

                              }
                              ++v365;
                            }
                            while (v363 != v365);
                            v369 = objc_msgSend(v362, "countByEnumeratingWithState:objects:count:", &v993, &v1021, 16);
                            v363 = v369;
                          }
                          while (v369);
                        }

                      }
                      objc_msgSend(objd, "objectForKeyedSubscript:", v863);
                      v370 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v371 = objc_msgSend(v370, "longLongValue");
                        *(_DWORD *)(v300 + 196) |= 0x200000u;
                        *(_DWORD *)(v300 + 196) |= 1u;
                        *(_QWORD *)(v300 + 48) = v371;
                      }

                    }
                  }
                  else
                  {
                    v300 = 0;
                  }
                  -[GEOPDSearchQueryInterpretationMetadata addTriggerFeatures:](v940, (void *)v300);

                }
                v296 = v927 + 1;
              }
              while (v927 + 1 != v908);
              v372 = objc_msgSend(v893, "countByEnumeratingWithState:objects:count:", &v985, &v1013, 16);
              v908 = v372;
            }
            while (v372);
          }

        }
        if (a3)
          v373 = CFSTR("isFromRuntimeQueryTriggerStore");
        else
          v373 = CFSTR("is_from_runtime_query_trigger_store");
        objc_msgSend(v861, "objectForKeyedSubscript:", v373);
        v374 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v375 = objc_msgSend(v374, "BOOLValue");
          *(_BYTE *)(v940 + 68) |= 0x40u;
          *(_BYTE *)(v940 + 68) |= 2u;
          *(_BYTE *)(v940 + 64) = v375;
        }

        objc_msgSend(v861, "objectForKeyedSubscript:", CFSTR("completion"));
        v376 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v377 = (void *)objc_msgSend(v376, "copy");
          v378 = v377;
          *(_BYTE *)(v940 + 68) |= 8u;
          *(_BYTE *)(v940 + 68) |= 0x40u;
          objc_storeStrong((id *)(v940 + 24), v377);

        }
        if (a3)
          v379 = CFSTR("canonicalCompletion");
        else
          v379 = CFSTR("canonical_completion");
        objc_msgSend(v861, "objectForKeyedSubscript:", v379);
        v380 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v381 = (void *)objc_msgSend(v380, "copy");
          v382 = v381;
          *(_BYTE *)(v940 + 68) |= 4u;
          *(_BYTE *)(v940 + 68) |= 0x40u;
          objc_storeStrong((id *)(v940 + 16), v381);

        }
      }

    }
    else
    {
      v940 = 0;
    }
    v383 = (id)v940;
    *(_QWORD *)(v966 + 308) |= 0x400100000uLL;
    objc_storeStrong((id *)(v966 + 176), (id)v940);

  }
  if (a3)
    v384 = CFSTR("queryDirectionsIntentMetadata");
  else
    v384 = CFSTR("query_directions_intent_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v384);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v386 = [GEOPDSearchQueryDirectionsIntentMetadata alloc];
    if (!v386)
    {
      v388 = 0;
      goto LABEL_805;
    }
    v387 = v385;
    v388 = -[GEOPDSearchQueryDirectionsIntentMetadata init](v386, "init");
    if (!v388)
    {
LABEL_804:

LABEL_805:
      v412 = (id)v388;
      *(_QWORD *)(v966 + 308) |= 0x400002000uLL;
      objc_storeStrong((id *)(v966 + 112), (id)v388);

      goto LABEL_806;
    }
    if (a3)
      v389 = CFSTR("intentType");
    else
      v389 = CFSTR("intent_type");
    objc_msgSend(v387, "objectForKeyedSubscript:", v389);
    v390 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v391 = v390;
      if ((objc_msgSend(v391, "isEqualToString:", CFSTR("UNKNOWN")) & 1) != 0)
      {
        v392 = 0;
      }
      else if ((objc_msgSend(v391, "isEqualToString:", CFSTR("FROM_PLACE1")) & 1) != 0)
      {
        v392 = 1;
      }
      else if ((objc_msgSend(v391, "isEqualToString:", CFSTR("TO_PLACE1")) & 1) != 0)
      {
        v392 = 2;
      }
      else if ((objc_msgSend(v391, "isEqualToString:", CFSTR("FROM_PLACE1_TO_PLACE2")) & 1) != 0)
      {
        v392 = 3;
      }
      else if ((objc_msgSend(v391, "isEqualToString:", CFSTR("FROM_PLACE2_TO_PLACE1")) & 1) != 0)
      {
        v392 = 4;
      }
      else if (objc_msgSend(v391, "isEqualToString:", CFSTR("DIRECTIONS_PHRASE_ONLY")))
      {
        v392 = 5;
      }
      else
      {
        v392 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_750;
      v392 = objc_msgSend(v390, "intValue");
    }
    *(_BYTE *)(v388 + 68) |= 0x80u;
    *(_BYTE *)(v388 + 68) |= 1u;
    *(_DWORD *)(v388 + 52) = v392;
LABEL_750:

    if (a3)
      v393 = CFSTR("directionPhrase");
    else
      v393 = CFSTR("direction_phrase");
    objc_msgSend(v387, "objectForKeyedSubscript:", v393);
    v394 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v395 = (void *)objc_msgSend(v394, "copy");
      v396 = v395;
      *(_BYTE *)(v388 + 68) |= 0x10u;
      *(_BYTE *)(v388 + 68) |= 0x80u;
      objc_storeStrong((id *)(v388 + 16), v395);

    }
    objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("type"));
    v397 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v398 = v397;
      if ((objc_msgSend(v398, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
      {
        v399 = 0;
      }
      else if ((objc_msgSend(v398, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
      {
        v399 = 1;
      }
      else if ((objc_msgSend(v398, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
      {
        v399 = 2;
      }
      else if ((objc_msgSend(v398, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
      {
        v399 = 3;
      }
      else if ((objc_msgSend(v398, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
      {
        v399 = 4;
      }
      else if ((objc_msgSend(v398, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
      {
        v399 = 5;
      }
      else if (objc_msgSend(v398, "isEqualToString:", CFSTR("RIDESHARE")))
      {
        v399 = 6;
      }
      else
      {
        v399 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_775;
      v399 = objc_msgSend(v397, "intValue");
    }
    *(_BYTE *)(v388 + 68) |= 0x80u;
    *(_BYTE *)(v388 + 68) |= 8u;
    *(_DWORD *)(v388 + 64) = v399;
LABEL_775:

    objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("preposition1"));
    v400 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v401 = v400;
      if ((objc_msgSend(v401, "isEqualToString:", CFSTR("UNKNOWN_PREPOSITION")) & 1) != 0)
      {
        v402 = 0;
      }
      else if ((objc_msgSend(v401, "isEqualToString:", CFSTR("FROM")) & 1) != 0)
      {
        v402 = 1;
      }
      else if (objc_msgSend(v401, "isEqualToString:", CFSTR("TO")))
      {
        v402 = 2;
      }
      else
      {
        v402 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_787;
      v402 = objc_msgSend(v400, "intValue");
    }
    *(_BYTE *)(v388 + 68) |= 0x80u;
    *(_BYTE *)(v388 + 68) |= 2u;
    *(_DWORD *)(v388 + 56) = v402;
LABEL_787:

    objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("place1"));
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v404 = (void *)objc_msgSend(v403, "copy");
      v405 = v404;
      *(_BYTE *)(v388 + 68) |= 0x20u;
      *(_BYTE *)(v388 + 68) |= 0x80u;
      objc_storeStrong((id *)(v388 + 24), v404);

    }
    objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("preposition2"));
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v407 = v406;
      if ((objc_msgSend(v407, "isEqualToString:", CFSTR("UNKNOWN_PREPOSITION")) & 1) != 0)
      {
        v408 = 0;
      }
      else if ((objc_msgSend(v407, "isEqualToString:", CFSTR("FROM")) & 1) != 0)
      {
        v408 = 1;
      }
      else if (objc_msgSend(v407, "isEqualToString:", CFSTR("TO")))
      {
        v408 = 2;
      }
      else
      {
        v408 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_801:

        objc_msgSend(v387, "objectForKeyedSubscript:", CFSTR("place2"));
        v409 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v410 = (void *)objc_msgSend(v409, "copy");
          v411 = v410;
          *(_BYTE *)(v388 + 68) |= 0x40u;
          *(_BYTE *)(v388 + 68) |= 0x80u;
          objc_storeStrong((id *)(v388 + 32), v410);

        }
        goto LABEL_804;
      }
      v408 = objc_msgSend(v406, "intValue");
    }
    *(_BYTE *)(v388 + 68) |= 0x80u;
    *(_BYTE *)(v388 + 68) |= 4u;
    *(_DWORD *)(v388 + 60) = v408;
    goto LABEL_801;
  }
LABEL_806:

  if (a3)
    v413 = CFSTR("queryNormalizerMetadata");
  else
    v413 = CFSTR("query_normalizer_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v413);
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v415 = [GEOPDSearchQueryNormalizerMetadata alloc];
    if (v415)
    {
      v416 = v414;
      v417 = -[GEOPDSearchQueryNormalizerMetadata init](v415, "init");
      if (v417)
      {
        objc_msgSend(v416, "objectForKeyedSubscript:", v860);
        v418 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v419 = (void *)objc_msgSend(v418, "copy");
          v420 = v419;
          *(_BYTE *)(v417 + 52) |= 4u;
          *(_BYTE *)(v417 + 52) |= 8u;
          objc_storeStrong((id *)(v417 + 32), v419);

        }
        if (a3)
          v421 = CFSTR("normalizedQuery");
        else
          v421 = CFSTR("normalized_query");
        objc_msgSend(v416, "objectForKeyedSubscript:", v421);
        v422 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v423 = (void *)objc_msgSend(v422, "copy");
          v424 = v423;
          *(_BYTE *)(v417 + 52) |= 1u;
          *(_BYTE *)(v417 + 52) |= 8u;
          objc_storeStrong((id *)(v417 + 16), v423);

        }
        if (a3)
          v425 = CFSTR("normalizerName");
        else
          v425 = CFSTR("normalizer_name");
        objc_msgSend(v416, "objectForKeyedSubscript:", v425);
        v426 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v427 = (void *)objc_msgSend(v426, "copy");
          v428 = v427;
          *(_BYTE *)(v417 + 52) |= 2u;
          *(_BYTE *)(v417 + 52) |= 8u;
          objc_storeStrong((id *)(v417 + 24), v427);

        }
      }

    }
    else
    {
      v417 = 0;
    }
    v429 = (id)v417;
    *(_QWORD *)(v966 + 308) |= 0x400400000uLL;
    objc_storeStrong((id *)(v966 + 192), (id)v417);

  }
  if (a3)
    v430 = CFSTR("queryGeoNormalizerMetadata");
  else
    v430 = CFSTR("query_geo_normalizer_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v430);
  obje = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v431 = [GEOPDSearchQueryGeoNormalizerMetadata alloc];
    if (v431)
    {
      v941 = obje;
      v432 = -[GEOPDSearchQueryGeoNormalizerMetadata init](v431, "init");
      if (v432)
      {
        if (a3)
          v433 = CFSTR("unitNumber");
        else
          v433 = CFSTR("unit_number");
        objc_msgSend(v941, "objectForKeyedSubscript:", v433);
        v434 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v435 = (void *)objc_msgSend(v434, "copy");
          v436 = v435;
          *(_BYTE *)(v432 + 92) |= 0x10u;
          *(_BYTE *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 64), v435);

        }
        objc_msgSend(v941, "objectForKeyedSubscript:", CFSTR("floor"));
        v437 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v438 = (void *)objc_msgSend(v437, "copy");
          v439 = v438;
          *(_BYTE *)(v432 + 92) |= 2u;
          *(_BYTE *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 40), v438);

        }
        if (a3)
          v440 = CFSTR("poPox");
        else
          v440 = CFSTR("po_pox");
        objc_msgSend(v941, "objectForKeyedSubscript:", v440);
        v441 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v442 = (void *)objc_msgSend(v441, "copy");
          v443 = v442;
          *(_BYTE *)(v432 + 92) |= 8u;
          *(_BYTE *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 56), v442);

        }
        if (a3)
          v444 = CFSTR("mailStop");
        else
          v444 = CFSTR("mail_stop");
        objc_msgSend(v941, "objectForKeyedSubscript:", v444);
        v445 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v446 = (void *)objc_msgSend(v445, "copy");
          v447 = v446;
          *(_BYTE *)(v432 + 92) |= 4u;
          *(_BYTE *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 48), v446);

        }
        if (a3)
          v448 = CFSTR("unitTypeId");
        else
          v448 = CFSTR("unit_type_id");
        objc_msgSend(v941, "objectForKeyedSubscript:", v448);
        v449 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v450 = (void *)objc_msgSend(v449, "copy");
          v451 = v450;
          *(_BYTE *)(v432 + 92) |= 0x20u;
          *(_BYTE *)(v432 + 92) |= 0x40u;
          objc_storeStrong((id *)(v432 + 72), v450);

        }
        objc_msgSend(v941, "objectForKeyedSubscript:", CFSTR("normalizers"));
        v928 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1032 = 0u;
          v1031 = 0u;
          v1030 = 0u;
          v1029 = 0u;
          v452 = v928;
          v453 = objc_msgSend(v452, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
          if (!v453)
            goto LABEL_877;
          v454 = *(_QWORD *)v1030;
          while (1)
          {
            for (kk = 0; kk != v453; ++kk)
            {
              if (*(_QWORD *)v1030 != v454)
                objc_enumerationMutation(v452);
              v456 = *(void **)(*((_QWORD *)&v1029 + 1) + 8 * kk);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v457 = v456;
                if ((objc_msgSend(v457, "isEqualToString:", CFSTR("NORMALIZE")) & 1) == 0
                  && (objc_msgSend(v457, "isEqualToString:", CFSTR("TOKEN_DROP")) & 1) == 0
                  && (objc_msgSend(v457, "isEqualToString:", CFSTR("SEGMENTATION")) & 1) == 0
                  && (objc_msgSend(v457, "isEqualToString:", CFSTR("NUMERICS_REPLACEMENT")) & 1) == 0)
                {
                  objc_msgSend(v457, "isEqualToString:", CFSTR("RBO"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v456, "intValue");
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v432 + 88));
              if ((*(_BYTE *)(v432 + 92) & 1) == 0)
              {
                v458 = *(void **)(v432 + 8);
                if (v458)
                {
                  v459 = v458;
                  objc_sync_enter(v459);
                  GEOPDSearchQueryGeoNormalizerMetadataReadSpecified(v432, *(_QWORD *)(v432 + 8), (int *)&_readNormalizers_tags);
                  objc_sync_exit(v459);

                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v432 + 88));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v432 + 92) |= 1u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v432 + 88));
              *(_BYTE *)(v432 + 92) |= 0x40u;
            }
            v453 = objc_msgSend(v452, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
            if (!v453)
            {
LABEL_877:

              break;
            }
          }
        }

      }
    }
    else
    {
      v432 = 0;
    }
    v460 = (id)v432;
    *(_QWORD *)(v966 + 308) |= 0x400040000uLL;
    objc_storeStrong((id *)(v966 + 152), (id)v432);

  }
  if (a3)
    v461 = CFSTR("queryTokenizerMetadata");
  else
    v461 = CFSTR("query_tokenizer_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v461);
  v462 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v463 = [GEOPDSearchQueryTokenizerMetadata alloc];
    if (v463)
      v464 = (void *)-[GEOPDSearchQueryTokenizerMetadata _initWithDictionary:isJSON:](v463, v462, a3);
    else
      v464 = 0;
    v465 = v464;
    *(_QWORD *)(v966 + 308) |= 0x410000000uLL;
    objc_storeStrong((id *)(v966 + 240), v464);

  }
  if (a3)
    v466 = CFSTR("queryTransliterMetadata");
  else
    v466 = CFSTR("query_transliter_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v466);
  v467 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v468 = [GEOPDSearchQueryTransliteratorMetadata alloc];
    if (!v468)
    {
      v470 = 0;
      goto LABEL_918;
    }
    v469 = v467;
    v470 = -[GEOPDSearchQueryTransliteratorMetadata init](v468, "init");
    if (!v470)
    {
LABEL_917:

LABEL_918:
      v482 = (id)v470;
      *(_QWORD *)(v966 + 308) |= 0x420000000uLL;
      objc_storeStrong((id *)(v966 + 248), (id)v470);

      goto LABEL_919;
    }
    objc_msgSend(v469, "objectForKeyedSubscript:", CFSTR("reading"));
    v471 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v472 = (void *)objc_msgSend(v471, "copy");
      v473 = v472;
      *(_BYTE *)(v470 + 48) |= 4u;
      *(_BYTE *)(v470 + 48) |= 8u;
      objc_storeStrong((id *)(v470 + 24), v472);

    }
    if (a3)
      v474 = CFSTR("parentQuery");
    else
      v474 = CFSTR("parent_query");
    objc_msgSend(v469, "objectForKeyedSubscript:", v474);
    v475 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v476 = (void *)objc_msgSend(v475, "copy");
      v477 = v476;
      *(_BYTE *)(v470 + 48) |= 2u;
      *(_BYTE *)(v470 + 48) |= 8u;
      objc_storeStrong((id *)(v470 + 16), v476);

    }
    if (a3)
      v478 = CFSTR("transliteratorSource");
    else
      v478 = CFSTR("transliterator_source");
    objc_msgSend(v469, "objectForKeyedSubscript:", v478);
    v479 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v480 = v479;
      if ((objc_msgSend(v480, "isEqualToString:", CFSTR("NONE")) & 1) != 0)
      {
        v481 = 0;
      }
      else if ((objc_msgSend(v480, "isEqualToString:", CFSTR("ICU")) & 1) != 0)
      {
        v481 = 1;
      }
      else if (objc_msgSend(v480, "isEqualToString:", CFSTR("KUROMOJI")))
      {
        v481 = 2;
      }
      else
      {
        v481 = 0;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_916:

        goto LABEL_917;
      }
      v481 = objc_msgSend(v479, "intValue");
    }
    *(_BYTE *)(v470 + 48) |= 8u;
    *(_BYTE *)(v470 + 48) |= 1u;
    *(_DWORD *)(v470 + 44) = v481;
    goto LABEL_916;
  }
LABEL_919:

  if (a3)
    v483 = CFSTR("queryFuzzyMatchV2Metadata");
  else
    v483 = CFSTR("query_fuzzy_match_v2_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v483);
  objf = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v484 = [GEOPDSearchQueryFuzzyMatchV2Metadata alloc];
    if (v484)
    {
      v942 = objf;
      v485 = -[GEOPDSearchQueryFuzzyMatchV2Metadata init](v484, "init");
      if (v485)
      {
        objc_msgSend(v942, "objectForKeyedSubscript:", CFSTR("rewrittenQueries"));
        v486 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1020 = 0u;
          v1019 = 0u;
          v1018 = 0u;
          v1017 = 0u;
          v487 = v486;
          v488 = objc_msgSend(v487, "countByEnumeratingWithState:objects:count:", &v1017, v1033, 16);
          if (v488)
          {
            v489 = *(_QWORD *)v1018;
            do
            {
              for (mm = 0; mm != v488; ++mm)
              {
                if (*(_QWORD *)v1018 != v489)
                  objc_enumerationMutation(v487);
                v491 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * mm);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v492 = (void *)objc_msgSend(v491, "copy");
                  -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueries:](v485, v492);

                }
              }
              v488 = objc_msgSend(v487, "countByEnumeratingWithState:objects:count:", &v1017, v1033, 16);
            }
            while (v488);
          }

        }
        objc_msgSend(v942, "objectForKeyedSubscript:", CFSTR("useFuzzyV1"));
        v493 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v494 = objc_msgSend(v493, "BOOLValue");
          *(_BYTE *)(v485 + 96) |= 0x40u;
          *(_BYTE *)(v485 + 96) |= 2u;
          *(_BYTE *)(v485 + 93) = v494;
        }

        objc_msgSend(v942, "objectForKeyedSubscript:", CFSTR("pruneFuzzyV2Results"));
        v495 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v496 = objc_msgSend(v495, "BOOLValue");
          *(_BYTE *)(v485 + 96) |= 0x40u;
          *(_BYTE *)(v485 + 96) |= 1u;
          *(_BYTE *)(v485 + 92) = v496;
        }

        objc_msgSend(v942, "objectForKeyedSubscript:", CFSTR("fuzzyV2Scores"));
        v929 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1016 = 0u;
          v1015 = 0u;
          v1014 = 0u;
          v1013 = 0u;
          v497 = v929;
          v498 = objc_msgSend(v497, "countByEnumeratingWithState:objects:count:", &v1013, &v1029, 16);
          if (v498)
          {
            v499 = *(_QWORD *)v1014;
            do
            {
              for (nn = 0; nn != v498; ++nn)
              {
                if (*(_QWORD *)v1014 != v499)
                  objc_enumerationMutation(v497);
                v501 = *(void **)(*((_QWORD *)&v1013 + 1) + 8 * nn);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v501, "doubleValue");
                  os_unfair_lock_lock((os_unfair_lock_t)(v485 + 88));
                  if ((*(_BYTE *)(v485 + 96) & 4) == 0)
                  {
                    v502 = *(void **)(v485 + 8);
                    if (v502)
                    {
                      v503 = v502;
                      objc_sync_enter(v503);
                      GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(v485, *(_QWORD *)(v485 + 8), (int *)&_readFuzzyV2Scores_tags);
                      objc_sync_exit(v503);

                    }
                  }
                  os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
                  PBRepeatedDoubleAdd();
                  os_unfair_lock_lock_with_options();
                  *(_BYTE *)(v485 + 96) |= 4u;
                  os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
                  *(_BYTE *)(v485 + 96) |= 0x40u;
                }
              }
              v498 = objc_msgSend(v497, "countByEnumeratingWithState:objects:count:", &v1013, &v1029, 16);
            }
            while (v498);
          }

        }
        if (a3)
          v504 = CFSTR("rewriteTypes");
        else
          v504 = CFSTR("rewrite_types");
        objc_msgSend(v942, "objectForKeyedSubscript:", v504);
        v930 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1007 = 0u;
          v1008 = 0u;
          v1005 = 0u;
          v1006 = 0u;
          v505 = v930;
          v506 = objc_msgSend(v505, "countByEnumeratingWithState:objects:count:", &v1005, &v1025, 16);
          if (!v506)
            goto LABEL_977;
          v507 = CFSTR("LAZY_REWRITE_NONE");
          v508 = *(_QWORD *)v1006;
          while (1)
          {
            for (i1 = 0; i1 != v506; ++i1)
            {
              if (*(_QWORD *)v1006 != v508)
                objc_enumerationMutation(v505);
              v510 = *(void **)(*((_QWORD *)&v1005 + 1) + 8 * i1);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v511 = v510;
                if ((objc_msgSend(v511, "isEqualToString:", v507) & 1) == 0
                  && (objc_msgSend(v511, "isEqualToString:", CFSTR("FV2")) & 1) == 0)
                {
                  objc_msgSend(v511, "isEqualToString:", CFSTR("TOK"));
                }

              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                  continue;
                objc_msgSend(v510, "intValue");
              }
              os_unfair_lock_lock((os_unfair_lock_t)(v485 + 88));
              if ((*(_BYTE *)(v485 + 96) & 8) == 0)
              {
                v512 = *(void **)(v485 + 8);
                if (v512)
                {
                  v513 = v507;
                  v514 = v512;
                  objc_sync_enter(v514);
                  GEOPDSearchQueryFuzzyMatchV2MetadataReadSpecified(v485, *(_QWORD *)(v485 + 8), (int *)&_readRewriteTypes_tags);
                  objc_sync_exit(v514);

                  v507 = v513;
                }
              }
              os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
              PBRepeatedInt32Add();
              os_unfair_lock_lock_with_options();
              *(_BYTE *)(v485 + 96) |= 8u;
              os_unfair_lock_unlock((os_unfair_lock_t)(v485 + 88));
              *(_BYTE *)(v485 + 96) |= 0x40u;
            }
            v506 = objc_msgSend(v505, "countByEnumeratingWithState:objects:count:", &v1005, &v1025, 16);
            if (!v506)
            {
LABEL_977:

              break;
            }
          }
        }

        objc_msgSend(v942, "objectForKeyedSubscript:", CFSTR("rewrittenQueryTokens"));
        v515 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1003 = 0u;
          v1004 = 0u;
          v1001 = 0u;
          v1002 = 0u;
          v516 = v515;
          v517 = objc_msgSend(v516, "countByEnumeratingWithState:objects:count:", &v1001, &v1021, 16);
          if (v517)
          {
            v518 = *(_QWORD *)v1002;
            do
            {
              v519 = 0;
              do
              {
                if (*(_QWORD *)v1002 != v518)
                  objc_enumerationMutation(v516);
                v520 = *(void **)(*((_QWORD *)&v1001 + 1) + 8 * v519);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v521 = [GEOPDSearchTokenSet alloc];
                  if (v521)
                    v522 = (void *)-[GEOPDSearchTokenSet _initWithDictionary:isJSON:](v521, v520, a3);
                  else
                    v522 = 0;
                  -[GEOPDSearchQueryFuzzyMatchV2Metadata addRewrittenQueryTokens:](v485, v522);

                }
                ++v519;
              }
              while (v517 != v519);
              v523 = objc_msgSend(v516, "countByEnumeratingWithState:objects:count:", &v1001, &v1021, 16);
              v517 = v523;
            }
            while (v523);
          }

        }
      }

    }
    else
    {
      v485 = 0;
    }
    v524 = (id)v485;
    *(_QWORD *)(v966 + 308) |= 0x400010000uLL;
    objc_storeStrong((id *)(v966 + 136), (id)v485);

  }
  if (a3)
    v525 = CFSTR("rewrittenQueryType");
  else
    v525 = CFSTR("rewritten_query_type");
  objc_msgSend(v885, "objectForKeyedSubscript:", v525);
  objg = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v975 = 0u;
    v976 = 0u;
    v973 = 0u;
    v974 = 0u;
    v526 = objg;
    v527 = objc_msgSend(v526, "countByEnumeratingWithState:objects:count:", &v973, v1010, 16);
    if (!v527)
      goto LABEL_1039;
    v528 = *(_QWORD *)v974;
    while (1)
    {
      for (i2 = 0; i2 != v527; ++i2)
      {
        if (*(_QWORD *)v974 != v528)
          objc_enumerationMutation(v526);
        v530 = *(void **)(*((_QWORD *)&v973 + 1) + 8 * i2);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v531 = v530;
          if ((objc_msgSend(v531, "isEqualToString:", CFSTR("NONE_REWRITTEN_QUERY_TYPE")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("NORMALIZATION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("SPELL_CORRECTION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("TOK_SYNONYM")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("REWRITTEN_QUERY_TYPE_SYNONYM")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("TOKENIZATION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("COMPLETION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("CLASSIFICATION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("QUERY_INTERPRETATION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("TAG")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("DEFINITIVE_QU")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("POI_SEARCH_SPELL_CORRECTION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("TRANSLITERATION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("FUZZY_MATCH_V2")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("DISPLAY_NAME")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("DIRECTION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("EMOJI")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("ZIP_DOOR_INTERPREATION")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("SIRI_ATTRIBUTES")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("TOKEN_IMPORTANCE")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("BRAND_DATA")) & 1) == 0
            && (objc_msgSend(v531, "isEqualToString:", CFSTR("NEURAL_REWRITE")) & 1) == 0)
          {
            objc_msgSend(v531, "isEqualToString:", CFSTR("EMBEDDING"));
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            continue;
          objc_msgSend(v530, "intValue");
        }
        v532 = (os_unfair_lock_s *)v966;
        os_unfair_lock_lock((os_unfair_lock_t)(v966 + 296));
        if ((*(_BYTE *)(v966 + 308) & 0x40) == 0)
        {
          v533 = *(void **)(v966 + 8);
          if (v533)
          {
            v534 = v533;
            objc_sync_enter(v534);
            GEOPDSearchQueryIntentMetadataReadSpecified(v966, *(_QWORD *)(v966 + 8), (int *)&_readRewrittenQueryTypes_tags);
            objc_sync_exit(v534);

            v532 = (os_unfair_lock_s *)v966;
          }
        }
        os_unfair_lock_unlock(v532 + 74);
        PBRepeatedInt32Add();
        os_unfair_lock_lock_with_options();
        *(_QWORD *)(v966 + 308) |= 0x40uLL;
        os_unfair_lock_unlock((os_unfair_lock_t)(v966 + 296));
        *(_QWORD *)(v966 + 308) |= 0x400000000uLL;
      }
      v527 = objc_msgSend(v526, "countByEnumeratingWithState:objects:count:", &v973, v1010, 16);
      if (!v527)
      {
LABEL_1039:

        break;
      }
    }
  }

  if (a3)
    v535 = CFSTR("queryPoiMetadata");
  else
    v535 = CFSTR("query_poi_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v535);
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v537 = [GEOPDSearchQueryPoiMetadata alloc];
    if (v537)
    {
      v538 = v536;
      v539 = -[GEOPDSearchQueryPoiMetadata init](v537, "init");
      if (v539)
      {
        if (a3)
          v540 = CFSTR("namedFeature");
        else
          v540 = CFSTR("named_feature");
        objc_msgSend(v538, "objectForKeyedSubscript:", v540);
        v541 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1032 = 0u;
          v1031 = 0u;
          v1030 = 0u;
          v1029 = 0u;
          v542 = v541;
          v543 = objc_msgSend(v542, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
          if (v543)
          {
            v544 = *(_QWORD *)v1030;
            do
            {
              for (i3 = 0; i3 != v543; ++i3)
              {
                if (*(_QWORD *)v1030 != v544)
                  objc_enumerationMutation(v542);
                v546 = *(_QWORD *)(*((_QWORD *)&v1029 + 1) + 8 * i3);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v547 = [GEONamedFeature alloc];
                  if ((a3 & 1) != 0)
                    v548 = -[GEONamedFeature initWithJSON:](v547, "initWithJSON:", v546);
                  else
                    v548 = -[GEONamedFeature initWithDictionary:](v547, "initWithDictionary:", v546);
                  v549 = v548;
                  -[GEOPDSearchQueryPoiMetadata addNamedFeature:]((uint64_t)v539, v548);

                }
              }
              v543 = objc_msgSend(v542, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
            }
            while (v543);
          }

        }
      }

    }
    else
    {
      v539 = 0;
    }
    v550 = v539;
    *(_QWORD *)(v966 + 308) |= 0x400800000uLL;
    objc_storeStrong((id *)(v966 + 200), v539);

  }
  if (a3)
    v551 = CFSTR("acHintMetadata");
  else
    v551 = CFSTR("ac_hint_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v551);
  v901 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v552 = [GEOPDSearchACHintMetadata alloc];
    if (v552)
    {
      v894 = v901;
      objh = -[GEOPDSearchACHintMetadata init](v552, "init");
      if (objh)
      {
        objc_msgSend(v894, "objectForKeyedSubscript:", CFSTR("feature"));
        v553 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1016 = 0u;
          v1015 = 0u;
          v1014 = 0u;
          v1013 = 0u;
          v554 = v553;
          v555 = objc_msgSend(v554, "countByEnumeratingWithState:objects:count:", &v1013, &v1029, 16);
          if (v555)
          {
            v556 = *(_QWORD *)v1014;
            do
            {
              v557 = 0;
              do
              {
                if (*(_QWORD *)v1014 != v556)
                  objc_enumerationMutation(v554);
                v558 = *(void **)(*((_QWORD *)&v1013 + 1) + 8 * v557);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v559 = [GEOPDSearchKeyValueFloatPair alloc];
                  if (v559)
                    v560 = (void *)-[GEOPDSearchKeyValueFloatPair _initWithDictionary:isJSON:]((uint64_t)v559, v558);
                  else
                    v560 = 0;
                  -[GEOPDSearchACHintMetadata addFeature:]((uint64_t)objh, v560);

                }
                ++v557;
              }
              while (v555 != v557);
              v561 = objc_msgSend(v554, "countByEnumeratingWithState:objects:count:", &v1013, &v1029, 16);
              v555 = v561;
            }
            while (v561);
          }

        }
        if (a3)
          v562 = CFSTR("brooklynEntry");
        else
          v562 = CFSTR("brooklyn_entry");
        objc_msgSend(v894, "objectForKeyedSubscript:", v562);
        v563 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1007 = 0u;
          v1008 = 0u;
          v1005 = 0u;
          v1006 = 0u;
          v564 = v563;
          v565 = objc_msgSend(v564, "countByEnumeratingWithState:objects:count:", &v1005, &v1025, 16);
          if (v565)
          {
            v566 = *(_QWORD *)v1006;
            do
            {
              for (i4 = 0; i4 != v565; ++i4)
              {
                if (*(_QWORD *)v1006 != v566)
                  objc_enumerationMutation(v564);
                v568 = *(_QWORD *)(*((_QWORD *)&v1005 + 1) + 8 * i4);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v569 = [GEOPDAutocompleteEntry alloc];
                  if ((a3 & 1) != 0)
                    v570 = -[GEOPDAutocompleteEntry initWithJSON:](v569, "initWithJSON:", v568);
                  else
                    v570 = -[GEOPDAutocompleteEntry initWithDictionary:](v569, "initWithDictionary:", v568);
                  v571 = v570;
                  -[GEOPDSearchACHintMetadata addBrooklynEntry:]((uint64_t)objh, v570);

                }
              }
              v565 = objc_msgSend(v564, "countByEnumeratingWithState:objects:count:", &v1005, &v1025, 16);
            }
            while (v565);
          }

        }
        if (a3)
          v572 = CFSTR("addressEntry");
        else
          v572 = CFSTR("address_entry");
        objc_msgSend(v894, "objectForKeyedSubscript:", v572);
        v887 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1003 = 0u;
          v1004 = 0u;
          v1001 = 0u;
          v1002 = 0u;
          v917 = v887;
          v943 = objc_msgSend(v917, "countByEnumeratingWithState:objects:count:", &v1001, &v1021, 16);
          if (v943)
          {
            v931 = *(_QWORD *)v1002;
            if (a3)
              v573 = CFSTR("topResult");
            else
              v573 = CFSTR("top_result");
            v909 = v573;
            do
            {
              v574 = 0;
              do
              {
                if (*(_QWORD *)v1002 != v931)
                  objc_enumerationMutation(v917);
                v575 = *(void **)(*((_QWORD *)&v1001 + 1) + 8 * v574);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v576 = [GEOPDSearchAddressEntry alloc];
                  if (v576)
                  {
                    v577 = v575;
                    v578 = -[GEOPDSearchAddressEntry init](v576, "init");
                    if (v578)
                    {
                      objc_msgSend(v577, "objectForKeyedSubscript:", v909);
                      v579 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v580 = [GEOPDSearchEntry alloc];
                        if (v580)
                          v581 = (void *)-[GEOPDSearchEntry _initWithDictionary:isJSON:](v580, v579, a3);
                        else
                          v581 = 0;
                        v582 = v581;
                        *(_BYTE *)(v578 + 44) |= 2u;
                        *(_BYTE *)(v578 + 44) |= 4u;
                        objc_storeStrong((id *)(v578 + 24), v581);

                      }
                      objc_msgSend(v577, "objectForKeyedSubscript:", CFSTR("candidates"));
                      v583 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v1020 = 0u;
                        v1019 = 0u;
                        v1018 = 0u;
                        v1017 = 0u;
                        v584 = v583;
                        v585 = objc_msgSend(v584, "countByEnumeratingWithState:objects:count:", &v1017, v1033, 16);
                        if (v585)
                        {
                          v586 = *(_QWORD *)v1018;
                          do
                          {
                            v587 = 0;
                            do
                            {
                              if (*(_QWORD *)v1018 != v586)
                                objc_enumerationMutation(v584);
                              v588 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * v587);
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                v589 = [GEOPDSearchEntry alloc];
                                if (v589)
                                  v590 = (void *)-[GEOPDSearchEntry _initWithDictionary:isJSON:](v589, v588, a3);
                                else
                                  v590 = 0;
                                -[GEOPDSearchAddressEntry addCandidates:](v578, v590);

                              }
                              ++v587;
                            }
                            while (v585 != v587);
                            v591 = objc_msgSend(v584, "countByEnumeratingWithState:objects:count:", &v1017, v1033, 16);
                            v585 = v591;
                          }
                          while (v591);
                        }

                      }
                    }

                  }
                  else
                  {
                    v578 = 0;
                  }
                  -[GEOPDSearchACHintMetadata addAddressEntry:]((uint64_t)objh, (void *)v578);

                }
                ++v574;
              }
              while (v574 != v943);
              v592 = objc_msgSend(v917, "countByEnumeratingWithState:objects:count:", &v1001, &v1021, 16);
              v943 = v592;
            }
            while (v592);
          }

        }
        if (a3)
          v593 = CFSTR("businessEntry");
        else
          v593 = CFSTR("business_entry");
        objc_msgSend(v894, "objectForKeyedSubscript:", v593);
        v944 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1020 = 0u;
          v1019 = 0u;
          v1018 = 0u;
          v1017 = 0u;
          v594 = v944;
          v595 = objc_msgSend(v594, "countByEnumeratingWithState:objects:count:", &v1017, v1033, 16);
          if (v595)
          {
            v596 = *(_QWORD *)v1018;
            if (a3)
              v597 = CFSTR("businessId");
            else
              v597 = CFSTR("business_id");
            do
            {
              v598 = 0;
              do
              {
                if (*(_QWORD *)v1018 != v596)
                  objc_enumerationMutation(v594);
                v599 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * v598);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v600 = [GEOPDSearchBusinessEntry alloc];
                  if (v600)
                  {
                    v601 = v599;
                    v602 = -[GEOPDSearchBusinessEntry init](v600, "init");
                    if (v602)
                    {
                      objc_msgSend(v601, "objectForKeyedSubscript:", v597);
                      v603 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v604 = objc_msgSend(v603, "unsignedLongLongValue");
                        *(_BYTE *)(v602 + 16) |= 1u;
                        *(_QWORD *)(v602 + 8) = v604;
                      }

                    }
                  }
                  else
                  {
                    v602 = 0;
                  }
                  -[GEOPDSearchACHintMetadata addBusinessEntry:]((uint64_t)objh, (void *)v602);

                }
                ++v598;
              }
              while (v595 != v598);
              v605 = objc_msgSend(v594, "countByEnumeratingWithState:objects:count:", &v1017, v1033, 16);
              v595 = v605;
            }
            while (v605);
          }

        }
      }

    }
    else
    {
      objh = 0;
    }
    -[GEOPDSearchQueryIntentMetadata setAcHintMetadata:](v966, objh);

  }
  if (a3)
    v606 = CFSTR("queryGeoTagMetadata");
  else
    v606 = CFSTR("query_geo_tag_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v606);
  v888 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_1434;
  v607 = [GEOPDSearchQueryGeoTagMetadata alloc];
  if (v607)
  {
    v882 = v888;
    obji = -[GEOPDSearchQueryGeoTagMetadata init](v607, "init");
    if (!obji)
    {
LABEL_1432:

      goto LABEL_1433;
    }
    if (a3)
      v608 = CFSTR("tagSources");
    else
      v608 = CFSTR("tag_sources");
    objc_msgSend(v882, "objectForKeyedSubscript:", v608);
    v945 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1016 = 0u;
      v1015 = 0u;
      v1014 = 0u;
      v1013 = 0u;
      v609 = v945;
      v610 = objc_msgSend(v609, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
      if (!v610)
        goto LABEL_1228;
      v611 = *(_QWORD *)v1014;
      while (1)
      {
        for (i5 = 0; i5 != v610; ++i5)
        {
          if (*(_QWORD *)v1014 != v611)
            objc_enumerationMutation(v609);
          v613 = *(void **)(*((_QWORD *)&v1013 + 1) + 8 * i5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v614 = v613;
            if ((objc_msgSend(v614, "isEqualToString:", CFSTR("CRF")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("LSTM")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("WFST")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("TAG_HINTS")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("JP_BUILDING")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("INTERSECTION_RULE")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("INTERSECTION_WITH_DOOR_NUMBER")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("INTERSECTION_WITHOUT_CONNECTOR")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_SINGLE_DIRECTION")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_DIRECTION")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_ARTICLE")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_POSTAL_ONLY")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_IPHOTO_LOCALITY_ONLY")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_BELOW_STREET_ONLY")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("ALTER_FRENCH_DOOR_NUMBER")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("FORK_ALL_STREET_PARSE_BY_RULE")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("WFST_AUGMENTATION")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("DICTIONARY_AUGMENTATION")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("STATIC_RULE_AUGMENTATION")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("TOKENDROP_BELOW_STREET")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("TOKENDROP_ABOVE_STREET")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("OVERRIDE")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("POSTAL_TOKENS_ONLY_FOR_IE")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("TYPE_TOKEN")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("REMOVE_SUB_PREMISE_FOR_CA")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("AC_HINT")) & 1) == 0
              && (objc_msgSend(v614, "isEqualToString:", CFSTR("POSTAL_AND_DOOR_NUMBER_ONLY")) & 1) == 0)
            {
              objc_msgSend(v614, "isEqualToString:", CFSTR("BUILDING"));
            }

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              continue;
            objc_msgSend(v613, "intValue");
          }
          v615 = (os_unfair_lock_s *)obji;
          os_unfair_lock_lock(&obji->_readerLock);
          if ((*(_BYTE *)&obji->_flags & 2) == 0)
          {
            reader = obji->_reader;
            if (reader)
            {
              v617 = reader;
              objc_sync_enter(v617);
              GEOPDSearchQueryGeoTagMetadataReadSpecified((uint64_t)obji, (unint64_t)obji->_reader, (int *)&_readTagSources_tags);
              objc_sync_exit(v617);

              v615 = (os_unfair_lock_s *)obji;
            }
          }
          os_unfair_lock_unlock(v615 + 22);
          PBRepeatedInt32Add();
          os_unfair_lock_lock_with_options();
          *(_BYTE *)&obji->_flags |= 2u;
          os_unfair_lock_unlock(&obji->_readerLock);
          *(_BYTE *)&obji->_flags |= 0x10u;
        }
        v610 = objc_msgSend(v609, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
        if (!v610)
        {
LABEL_1228:

          break;
        }
      }
    }

    if (a3)
      v618 = CFSTR("geoParsingResult");
    else
      v618 = CFSTR("geo_parsing_result");
    objc_msgSend(v882, "objectForKeyedSubscript:", v618);
    v619 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_1365:

      if (a3)
        v654 = CFSTR("geoTypeMap");
      else
        v654 = CFSTR("geo_type_map");
      objc_msgSend(v882, "objectForKeyedSubscript:", v654);
      v879 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v1020 = 0u;
        v1019 = 0u;
        v1018 = 0u;
        v1017 = 0u;
        v902 = v879;
        v918 = (id)objc_msgSend(v902, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
        if (v918)
        {
          v910 = *(_QWORD *)v1018;
          if (a3)
            v655 = CFSTR("geoTypeId");
          else
            v655 = CFSTR("geo_type_id");
          v895 = v655;
          do
          {
            v656 = 0;
            do
            {
              if (*(_QWORD *)v1018 != v910)
                objc_enumerationMutation(v902);
              v657 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * (_QWORD)v656);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v658 = [GEOPDSearchStringGeoTypesPair alloc];
                if (v658)
                {
                  v946 = v657;
                  v659 = -[GEOPDSearchStringGeoTypesPair init](v658, "init");
                  if (v659)
                  {
                    objc_msgSend(v946, "objectForKeyedSubscript:", CFSTR("key"));
                    v660 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v661 = (void *)objc_msgSend(v660, "copy");
                      v662 = v661;
                      *(_BYTE *)(v659 + 60) |= 2u;
                      *(_BYTE *)(v659 + 60) |= 4u;
                      objc_storeStrong((id *)(v659 + 40), v661);

                    }
                    objc_msgSend(v946, "objectForKeyedSubscript:", v895);
                    v932 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v1024 = 0u;
                      v1023 = 0u;
                      v1022 = 0u;
                      v1021 = 0u;
                      v663 = v932;
                      v664 = objc_msgSend(v663, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
                      if (v664)
                      {
                        v665 = *(_QWORD *)v1022;
                        do
                        {
                          for (i6 = 0; i6 != v664; ++i6)
                          {
                            if (*(_QWORD *)v1022 != v665)
                              objc_enumerationMutation(v663);
                            v667 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * i6);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_msgSend(v667, "intValue");
                              os_unfair_lock_lock((os_unfair_lock_t)(v659 + 56));
                              if ((*(_BYTE *)(v659 + 60) & 1) == 0)
                              {
                                v668 = *(void **)(v659 + 8);
                                if (v668)
                                {
                                  v669 = v668;
                                  objc_sync_enter(v669);
                                  GEOPDSearchStringGeoTypesPairReadSpecified(v659, *(_QWORD *)(v659 + 8), (int *)&_readGeoTypeIds_tags);
                                  objc_sync_exit(v669);

                                }
                              }
                              os_unfair_lock_unlock((os_unfair_lock_t)(v659 + 56));
                              PBRepeatedInt32Add();
                              os_unfair_lock_lock_with_options();
                              *(_BYTE *)(v659 + 60) |= 1u;
                              os_unfair_lock_unlock((os_unfair_lock_t)(v659 + 56));
                              *(_BYTE *)(v659 + 60) |= 4u;
                            }
                          }
                          v664 = objc_msgSend(v663, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
                        }
                        while (v664);
                      }

                    }
                  }

                }
                else
                {
                  v659 = 0;
                }
                -[GEOPDSearchQueryGeoTagMetadata addGeoTypeMap:]((uint64_t)obji, (void *)v659);

              }
              v656 = (char *)v656 + 1;
            }
            while (v656 != v918);
            v670 = objc_msgSend(v902, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
            v918 = (id)v670;
          }
          while (v670);
        }

      }
      if (a3)
        v671 = CFSTR("geoRewriteTypes");
      else
        v671 = CFSTR("geo_rewrite_types");
      objc_msgSend(v882, "objectForKeyedSubscript:", v671);
      v947 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v1024 = 0u;
        v1023 = 0u;
        v1022 = 0u;
        v1021 = 0u;
        v672 = v947;
        v673 = objc_msgSend(v672, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
        if (!v673)
          goto LABEL_1430;
        v674 = *(_QWORD *)v1022;
        while (1)
        {
          for (i7 = 0; i7 != v673; ++i7)
          {
            if (*(_QWORD *)v1022 != v674)
              objc_enumerationMutation(v672);
            v676 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * i7);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v677 = v676;
              if ((objc_msgSend(v677, "isEqualToString:", CFSTR("PREFIX_TO_FIRST_DIGIT")) & 1) == 0
                && (objc_msgSend(v677, "isEqualToString:", CFSTR("MX_COLONIA_STRICT")) & 1) == 0
                && (objc_msgSend(v677, "isEqualToString:", CFSTR("ON_IN")) & 1) == 0
                && (objc_msgSend(v677, "isEqualToString:", CFSTR("IE_COUNTY_STRICT")) & 1) == 0
                && (objc_msgSend(v677, "isEqualToString:", CFSTR("STATE_OF_STRICT")) & 1) == 0)
              {
                objc_msgSend(v677, "isEqualToString:", CFSTR("TR_MAHALLESI"));
              }

            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                continue;
              objc_msgSend(v676, "intValue");
            }
            v678 = (os_unfair_lock_s *)obji;
            os_unfair_lock_lock(&obji->_readerLock);
            if ((*(_BYTE *)&obji->_flags & 1) == 0)
            {
              v679 = obji->_reader;
              if (v679)
              {
                v680 = v679;
                objc_sync_enter(v680);
                GEOPDSearchQueryGeoTagMetadataReadSpecified((uint64_t)obji, (unint64_t)obji->_reader, (int *)&_readGeoRewriteTypes_tags);
                objc_sync_exit(v680);

                v678 = (os_unfair_lock_s *)obji;
              }
            }
            os_unfair_lock_unlock(v678 + 22);
            PBRepeatedInt32Add();
            os_unfair_lock_lock_with_options();
            *(_BYTE *)&obji->_flags |= 1u;
            os_unfair_lock_unlock(&obji->_readerLock);
            *(_BYTE *)&obji->_flags |= 0x10u;
          }
          v673 = objc_msgSend(v672, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
          if (!v673)
          {
LABEL_1430:

            break;
          }
        }
      }

      goto LABEL_1432;
    }
    v620 = [GEOPDSearchGeoParsingResult alloc];
    if (!v620)
    {
      v622 = 0;
LABEL_1364:
      v653 = (id)v622;
      *(_BYTE *)&obji->_flags |= 4u;
      *(_BYTE *)&obji->_flags |= 0x10u;
      objc_storeStrong((id *)&obji->_geoParsingResult, (id)v622);

      goto LABEL_1365;
    }
    v621 = v619;
    v622 = -[GEOPDSearchGeoParsingResult init](v620, "init");
    if (!v622)
    {
LABEL_1363:

      goto LABEL_1364;
    }
    objc_msgSend(v621, "objectForKeyedSubscript:", CFSTR("labeling"));
    v623 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v1024 = 0u;
      v1023 = 0u;
      v1022 = 0u;
      v1021 = 0u;
      v624 = v623;
      v625 = objc_msgSend(v624, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
      if (v625)
      {
        v626 = *(_QWORD *)v1022;
        do
        {
          v627 = 0;
          do
          {
            if (*(_QWORD *)v1022 != v626)
              objc_enumerationMutation(v624);
            v628 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v627);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v629 = [GEOPDSearchAddressLabeledToken alloc];
              if (v629)
                v630 = (void *)-[GEOPDSearchAddressLabeledToken _initWithDictionary:isJSON:](v629, v628, a3);
              else
                v630 = 0;
              -[GEOPDSearchGeoParsingResult addLabeling:](v622, v630);

            }
            ++v627;
          }
          while (v625 != v627);
          v631 = objc_msgSend(v624, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
          v625 = v631;
        }
        while (v631);
      }

    }
    if (a3)
      v632 = CFSTR("labelScore");
    else
      v632 = CFSTR("label_score");
    objc_msgSend(v621, "objectForKeyedSubscript:", v632);
    v633 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v633, "doubleValue");
      *(_BYTE *)(v622 + 64) |= 0x20u;
      *(_BYTE *)(v622 + 64) |= 1u;
      *(_QWORD *)(v622 + 24) = v634;
    }

    if (a3)
      v635 = CFSTR("tagSource");
    else
      v635 = CFSTR("tag_source");
    objc_msgSend(v621, "objectForKeyedSubscript:", v635);
    v636 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v637 = v636;
      if ((objc_msgSend(v637, "isEqualToString:", CFSTR("CRF")) & 1) != 0)
      {
        v638 = 1;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("LSTM")) & 1) != 0)
      {
        v638 = 2;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("WFST")) & 1) != 0)
      {
        v638 = 3;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("TAG_HINTS")) & 1) != 0)
      {
        v638 = 4;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("JP_BUILDING")) & 1) != 0)
      {
        v638 = 5;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("INTERSECTION_RULE")) & 1) != 0)
      {
        v638 = 6;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("INTERSECTION_WITH_DOOR_NUMBER")) & 1) != 0)
      {
        v638 = 7;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("INTERSECTION_WITHOUT_CONNECTOR")) & 1) != 0)
      {
        v638 = 8;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_SINGLE_DIRECTION")) & 1) != 0)
      {
        v638 = 9;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_DIRECTION")) & 1) != 0)
      {
        v638 = 10;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_ARTICLE")) & 1) != 0)
      {
        v638 = 11;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_POSTAL_ONLY")) & 1) != 0)
      {
        v638 = 12;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_ABOVE_STREET_IPHOTO_LOCALITY_ONLY")) & 1) != 0)
      {
        v638 = 13;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_BELOW_STREET_ONLY")) & 1) != 0)
      {
        v638 = 14;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("ALTER_FRENCH_DOOR_NUMBER")) & 1) != 0)
      {
        v638 = 15;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("FORK_ALL_STREET_PARSE_BY_RULE")) & 1) != 0)
      {
        v638 = 16;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("WFST_AUGMENTATION")) & 1) != 0)
      {
        v638 = 17;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("DICTIONARY_AUGMENTATION")) & 1) != 0)
      {
        v638 = 18;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("STATIC_RULE_AUGMENTATION")) & 1) != 0)
      {
        v638 = 19;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("TOKENDROP_BELOW_STREET")) & 1) != 0)
      {
        v638 = 20;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("TOKENDROP_ABOVE_STREET")) & 1) != 0)
      {
        v638 = 21;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("OVERRIDE")) & 1) != 0)
      {
        v638 = 22;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("POSTAL_TOKENS_ONLY_FOR_IE")) & 1) != 0)
      {
        v638 = 23;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("TYPE_TOKEN")) & 1) != 0)
      {
        v638 = 24;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("REMOVE_SUB_PREMISE_FOR_CA")) & 1) != 0)
      {
        v638 = 25;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("AC_HINT")) & 1) != 0)
      {
        v638 = 26;
      }
      else if ((objc_msgSend(v637, "isEqualToString:", CFSTR("POSTAL_AND_DOOR_NUMBER_ONLY")) & 1) != 0)
      {
        v638 = 27;
      }
      else if (objc_msgSend(v637, "isEqualToString:", CFSTR("BUILDING")))
      {
        v638 = 28;
      }
      else
      {
        v638 = 1;
      }

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_1339:

        if (a3)
          v639 = CFSTR("droppedTokens");
        else
          v639 = CFSTR("dropped_tokens");
        objc_msgSend(v621, "objectForKeyedSubscript:", v639);
        v640 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1020 = 0u;
          v1019 = 0u;
          v1018 = 0u;
          v1017 = 0u;
          v641 = v640;
          v642 = objc_msgSend(v641, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
          if (v642)
          {
            v643 = *(_QWORD *)v1018;
            do
            {
              v644 = 0;
              do
              {
                if (*(_QWORD *)v1018 != v643)
                  objc_enumerationMutation(v641);
                v645 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * v644);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v646 = [GEOPDSearchAddressLabeledToken alloc];
                  if (v646)
                    v647 = (void *)-[GEOPDSearchAddressLabeledToken _initWithDictionary:isJSON:](v646, v645, a3);
                  else
                    v647 = 0;
                  -[GEOPDSearchGeoParsingResult addDroppedTokens:](v622, v647);

                }
                ++v644;
              }
              while (v642 != v644);
              v648 = objc_msgSend(v641, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
              v642 = v648;
            }
            while (v648);
          }

        }
        if (a3)
          v649 = CFSTR("taggerModelId");
        else
          v649 = CFSTR("tagger_model_id");
        objc_msgSend(v621, "objectForKeyedSubscript:", v649);
        v650 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v651 = (void *)objc_msgSend(v650, "copy");
          v652 = v651;
          *(_BYTE *)(v622 + 64) |= 0x10u;
          *(_BYTE *)(v622 + 64) |= 0x20u;
          objc_storeStrong((id *)(v622 + 40), v651);

        }
        goto LABEL_1363;
      }
      v638 = objc_msgSend(v636, "intValue");
    }
    *(_BYTE *)(v622 + 64) |= 0x20u;
    *(_BYTE *)(v622 + 64) |= 2u;
    *(_DWORD *)(v622 + 60) = v638;
    goto LABEL_1339;
  }
  obji = 0;
LABEL_1433:
  v681 = obji;
  *(_QWORD *)(v966 + 308) |= 0x400080000uLL;
  objc_storeStrong((id *)(v966 + 160), obji);

LABEL_1434:
  if (a3)
    v682 = CFSTR("rawQueryTokenizerMetadata");
  else
    v682 = CFSTR("raw_query_tokenizer_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v682);
  v683 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v684 = [GEOPDSearchQueryTokenizerMetadata alloc];
    if (v684)
      v685 = (void *)-[GEOPDSearchQueryTokenizerMetadata _initWithDictionary:isJSON:](v684, v683, a3);
    else
      v685 = 0;
    v686 = v685;
    *(_QWORD *)(v966 + 308) |= 0x440000000uLL;
    objc_storeStrong((id *)(v966 + 256), v685);

  }
  if (a3)
    v687 = CFSTR("queryTokenImportanceMetadata");
  else
    v687 = CFSTR("query_token_importance_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v687);
  v688 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v689 = [GEOPDSearchQueryTokenImportanceMetadata alloc];
    if (v689)
      v690 = (void *)-[GEOPDSearchQueryTokenImportanceMetadata _initWithDictionary:isJSON:](v689, v688, a3);
    else
      v690 = 0;
    v691 = v690;
    *(_QWORD *)(v966 + 308) |= 0x408000000uLL;
    objc_storeStrong((id *)(v966 + 232), v690);

  }
  if (a3)
    v692 = CFSTR("geoTokenImportanceMetadata");
  else
    v692 = CFSTR("geo_token_importance_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v692);
  v693 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v694 = [GEOPDSearchQueryTokenImportanceMetadata alloc];
    if (v694)
      v695 = (void *)-[GEOPDSearchQueryTokenImportanceMetadata _initWithDictionary:isJSON:](v694, v693, a3);
    else
      v695 = 0;
    v696 = v695;
    *(_QWORD *)(v966 + 308) |= 0x400000100uLL;
    objc_storeStrong((id *)(v966 + 72), v695);

  }
  if (a3)
    v697 = CFSTR("richBrandMetadata");
  else
    v697 = CFSTR("rich_brand_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v697);
  v948 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v698 = [GEOPDSearchRichBrandMetadata alloc];
    if (v698)
    {
      v933 = v948;
      v699 = -[GEOPDSearchRichBrandMetadata init](v698, "init");
      if (v699)
      {
        objc_msgSend(v933, "objectForKeyedSubscript:", CFSTR("muid"));
        v700 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v701 = objc_msgSend(v700, "unsignedLongLongValue");
          *(_BYTE *)(v699 + 60) |= 0x10u;
          *(_BYTE *)(v699 + 60) |= 1u;
          *(_QWORD *)(v699 + 32) = v701;
        }

        if (a3)
          v702 = CFSTR("brandRelationshipInfo");
        else
          v702 = CFSTR("brand_relationship_info");
        objc_msgSend(v933, "objectForKeyedSubscript:", v702);
        v703 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1028 = 0u;
          v1027 = 0u;
          v1026 = 0u;
          v1025 = 0u;
          v704 = v703;
          v705 = objc_msgSend(v704, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
          if (v705)
          {
            v706 = *(_QWORD *)v1026;
            do
            {
              v707 = 0;
              do
              {
                if (*(_QWORD *)v1026 != v706)
                  objc_enumerationMutation(v704);
                v708 = *(void **)(*((_QWORD *)&v1025 + 1) + 8 * v707);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v709 = [GEOPDSearchChainInfo alloc];
                  if (v709)
                    v710 = (void *)-[GEOPDSearchChainInfo _initWithDictionary:isJSON:](v709, v708, a3);
                  else
                    v710 = 0;
                  -[GEOPDSearchRichBrandMetadata addBrandRelationshipInfo:](v699, v710);

                }
                ++v707;
              }
              while (v705 != v707);
              v711 = objc_msgSend(v704, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
              v705 = v711;
            }
            while (v711);
          }

        }
        if (a3)
          v712 = CFSTR("brandDensity");
        else
          v712 = CFSTR("brand_density");
        objc_msgSend(v933, "objectForKeyedSubscript:", v712);
        v713 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v714 = [GEOPDSearchBrandDensity alloc];
          if (v714)
            v715 = (void *)-[GEOPDSearchBrandDensity _initWithDictionary:isJSON:](v714, v713);
          else
            v715 = 0;
          v716 = v715;
          *(_BYTE *)(v699 + 60) |= 2u;
          *(_BYTE *)(v699 + 60) |= 0x10u;
          objc_storeStrong((id *)(v699 + 16), v715);

        }
        if (a3)
          v717 = CFSTR("preferredCategory");
        else
          v717 = CFSTR("preferred_category");
        objc_msgSend(v933, "objectForKeyedSubscript:", v717);
        v919 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v1024 = 0u;
          v1023 = 0u;
          v1022 = 0u;
          v1021 = 0u;
          v718 = v919;
          v719 = objc_msgSend(v718, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
          if (v719)
          {
            v720 = CFSTR("category_id");
            v721 = *(_QWORD *)v1022;
            if (a3)
              v720 = CFSTR("categoryId");
            objj = v720;
            do
            {
              v722 = 0;
              do
              {
                if (*(_QWORD *)v1022 != v721)
                  objc_enumerationMutation(v718);
                v723 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v722);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v724 = [GEOPDSearchPreferredCategory alloc];
                  if (v724)
                  {
                    v725 = v723;
                    v726 = -[GEOPDSearchPreferredCategory init](v724, "init");
                    if (v726)
                    {
                      objc_msgSend(v725, "objectForKeyedSubscript:", objj);
                      v727 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v728 = (void *)objc_msgSend(v727, "copy");
                        v729 = v728;
                        objc_storeStrong((id *)(v726 + 8), v728);

                      }
                      objc_msgSend(v725, "objectForKeyedSubscript:", CFSTR("score"));
                      v730 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        objc_msgSend(v730, "floatValue");
                        *(_BYTE *)(v726 + 20) |= 1u;
                        *(_DWORD *)(v726 + 16) = v731;
                      }

                    }
                  }
                  else
                  {
                    v726 = 0;
                  }
                  -[GEOPDSearchRichBrandMetadata addPreferredCategory:](v699, (void *)v726);

                }
                ++v722;
              }
              while (v719 != v722);
              v732 = objc_msgSend(v718, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
              v719 = v732;
            }
            while (v732);
          }

        }
      }

    }
    else
    {
      v699 = 0;
    }
    v733 = (id)v699;
    *(_QWORD *)(v966 + 308) |= 0x500000000uLL;
    objc_storeStrong((id *)(v966 + 272), (id)v699);

  }
  if (a3)
    v734 = CFSTR("queryEmbeddingMetadata");
  else
    v734 = CFSTR("query_embedding_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v734);
  v883 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v971 = 0u;
    v972 = 0u;
    v969 = 0u;
    v970 = 0u;
    v903 = v883;
    v920 = (char *)objc_msgSend(v903, "countByEnumeratingWithState:objects:count:", &v969, v1009, 16);
    if (v920)
    {
      v911 = *(_QWORD *)v970;
      if (a3)
        v735 = CFSTR("embeddingId");
      else
        v735 = CFSTR("embedding_id");
      v736 = CFSTR("model_version");
      if (a3)
        v736 = CFSTR("modelVersion");
      v889 = v736;
      v896 = v735;
      do
      {
        v737 = 0;
        do
        {
          if (*(_QWORD *)v970 != v911)
          {
            v738 = v737;
            objc_enumerationMutation(v903);
            v737 = v738;
          }
          objk = v737;
          v739 = *(void **)(*((_QWORD *)&v969 + 1) + 8 * (_QWORD)v737);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v740 = [GEOPDSearchQueryEmbeddingMetadata alloc];
            if (v740)
            {
              v949 = v739;
              v741 = -[GEOPDSearchQueryEmbeddingMetadata init](v740, "init");
              if (v741)
              {
                objc_msgSend(v949, "objectForKeyedSubscript:", v896);
                v742 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v743 = (void *)objc_msgSend(v742, "copy");
                  v744 = v743;
                  *(_BYTE *)(v741 + 68) |= 2u;
                  *(_BYTE *)(v741 + 68) |= 8u;
                  objc_storeStrong((id *)(v741 + 40), v743);

                }
                objc_msgSend(v949, "objectForKeyedSubscript:", CFSTR("embedding"));
                v934 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1028 = 0u;
                  v1027 = 0u;
                  v1026 = 0u;
                  v1025 = 0u;
                  v745 = v934;
                  v746 = objc_msgSend(v745, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
                  if (v746)
                  {
                    v747 = *(_QWORD *)v1026;
                    do
                    {
                      for (i8 = 0; i8 != v746; ++i8)
                      {
                        if (*(_QWORD *)v1026 != v747)
                          objc_enumerationMutation(v745);
                        v749 = *(void **)(*((_QWORD *)&v1025 + 1) + 8 * i8);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v749, "floatValue");
                          os_unfair_lock_lock((os_unfair_lock_t)(v741 + 64));
                          if ((*(_BYTE *)(v741 + 68) & 1) == 0)
                          {
                            v750 = *(void **)(v741 + 8);
                            if (v750)
                            {
                              v751 = v750;
                              objc_sync_enter(v751);
                              GEOPDSearchQueryEmbeddingMetadataReadSpecified(v741, *(_QWORD *)(v741 + 8), (int *)&_readEmbeddings_tags);
                              objc_sync_exit(v751);

                            }
                          }
                          os_unfair_lock_unlock((os_unfair_lock_t)(v741 + 64));
                          PBRepeatedFloatAdd();
                          os_unfair_lock_lock_with_options();
                          *(_BYTE *)(v741 + 68) |= 1u;
                          os_unfair_lock_unlock((os_unfair_lock_t)(v741 + 64));
                          *(_BYTE *)(v741 + 68) |= 8u;
                        }
                      }
                      v746 = objc_msgSend(v745, "countByEnumeratingWithState:objects:count:", &v1025, v1033, 16);
                    }
                    while (v746);
                  }

                }
                objc_msgSend(v949, "objectForKeyedSubscript:", v889);
                v752 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v1024 = 0u;
                  v1023 = 0u;
                  v1022 = 0u;
                  v1021 = 0u;
                  v753 = v752;
                  v754 = objc_msgSend(v753, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
                  if (v754)
                  {
                    v755 = *(_QWORD *)v1022;
                    do
                    {
                      v756 = 0;
                      do
                      {
                        if (*(_QWORD *)v1022 != v755)
                          objc_enumerationMutation(v753);
                        v757 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v756);
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          v758 = [GEOPDSearchStringStringPair alloc];
                          if (v758)
                            v759 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v758, v757);
                          else
                            v759 = 0;
                          -[GEOPDSearchQueryEmbeddingMetadata addModelVersion:](v741, v759);

                        }
                        ++v756;
                      }
                      while (v754 != v756);
                      v760 = objc_msgSend(v753, "countByEnumeratingWithState:objects:count:", &v1021, &v1029, 16);
                      v754 = v760;
                    }
                    while (v760);
                  }

                }
              }

            }
            else
            {
              v741 = 0;
            }
            -[GEOPDSearchQueryIntentMetadata addQueryEmbeddingMetadata:](v966, (void *)v741);

          }
          v737 = objk + 1;
        }
        while (objk + 1 != v920);
        v761 = objc_msgSend(v903, "countByEnumeratingWithState:objects:count:", &v969, v1009, 16);
        v920 = (char *)v761;
      }
      while (v761);
    }

  }
  if (a3)
    v762 = CFSTR("tokenSynonymMetadata");
  else
    v762 = CFSTR("token_synonym_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v762);
  v880 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_1656;
  v763 = [GEOPDSearchTokenSynonymMetadata alloc];
  if (!v763)
  {
    v912 = 0;
    goto LABEL_1655;
  }
  v877 = v880;
  v912 = -[GEOPDSearchTokenSynonymMetadata init](v763, "init");
  if (!v912)
    goto LABEL_1654;
  objc_msgSend(v877, "objectForKeyedSubscript:", CFSTR("synonymList"));
  v875 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_1653;
  v1016 = 0u;
  v1015 = 0u;
  v1014 = 0u;
  v1013 = 0u;
  v921 = v875;
  v950 = objc_msgSend(v921, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
  if (!v950)
    goto LABEL_1652;
  v935 = *(_QWORD *)v1014;
  if (a3)
    v764 = CFSTR("synFeatureMap");
  else
    v764 = CFSTR("syn_feature_map");
  v765 = CFSTR("rewrite_provider");
  if (a3)
    v765 = CFSTR("rewriteProvider");
  v897 = v765;
  v904 = v764;
  v766 = CFSTR("token_list");
  if (a3)
    v766 = CFSTR("tokenList");
  v890 = v766;
  v767 = CFSTR("synonym_text");
  if (a3)
    v767 = CFSTR("synonymText");
  v884 = v767;
  do
  {
    v768 = 0;
    do
    {
      if (*(_QWORD *)v1014 != v935)
        objc_enumerationMutation(v921);
      v769 = *(void **)(*((_QWORD *)&v1013 + 1) + 8 * v768);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v770 = [GEOPDSearchSynonym alloc];
        if (v770)
        {
          objl = v769;
          v771 = -[GEOPDSearchSynonym init](v770, "init");
          if (v771)
          {
            objc_msgSend(objl, "objectForKeyedSubscript:", CFSTR("confidence"));
            v772 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v772, "floatValue");
              *(_BYTE *)(v771 + 60) |= 0x20u;
              *(_BYTE *)(v771 + 60) |= 1u;
              *(_DWORD *)(v771 + 52) = v773;
            }

            objc_msgSend(objl, "objectForKeyedSubscript:", v904);
            v774 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v1024 = 0u;
              v1023 = 0u;
              v1022 = 0u;
              v1021 = 0u;
              v775 = v774;
              v776 = objc_msgSend(v775, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
              if (v776)
              {
                v777 = *(_QWORD *)v1022;
                do
                {
                  v778 = 0;
                  do
                  {
                    if (*(_QWORD *)v1022 != v777)
                      objc_enumerationMutation(v775);
                    v779 = *(void **)(*((_QWORD *)&v1021 + 1) + 8 * v778);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v780 = [GEOPDSearchPair alloc];
                      if (v780)
                        v781 = (void *)-[GEOPDSearchPair _initWithDictionary:isJSON:](v780, v779);
                      else
                        v781 = 0;
                      -[GEOPDSearchSynonym addSynFeatureMap:](v771, v781);

                    }
                    ++v778;
                  }
                  while (v776 != v778);
                  v782 = objc_msgSend(v775, "countByEnumeratingWithState:objects:count:", &v1021, v1033, 16);
                  v776 = v782;
                }
                while (v782);
              }

            }
            objc_msgSend(objl, "objectForKeyedSubscript:", v897);
            v783 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v784 = v783;
              if ((objc_msgSend(v784, "isEqualToString:", CFSTR("NONE_TYPE")) & 1) != 0)
              {
                v785 = 0;
              }
              else if ((objc_msgSend(v784, "isEqualToString:", CFSTR("FWDGEO")) & 1) != 0)
              {
                v785 = 1;
              }
              else if ((objc_msgSend(v784, "isEqualToString:", CFSTR("LOCALSEARCH")) & 1) != 0)
              {
                v785 = 2;
              }
              else if (objc_msgSend(v784, "isEqualToString:", CFSTR("POIGEOMIXED")))
              {
                v785 = 3;
              }
              else
              {
                v785 = 0;
              }

LABEL_1627:
              *(_BYTE *)(v771 + 60) |= 0x20u;
              *(_BYTE *)(v771 + 60) |= 2u;
              *(_DWORD *)(v771 + 56) = v785;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v785 = objc_msgSend(v783, "intValue");
                goto LABEL_1627;
              }
            }

            objc_msgSend(objl, "objectForKeyedSubscript:", v890);
            v786 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v1020 = 0u;
              v1019 = 0u;
              v1018 = 0u;
              v1017 = 0u;
              v787 = v786;
              v788 = objc_msgSend(v787, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
              if (v788)
              {
                v789 = *(_QWORD *)v1018;
                do
                {
                  v790 = 0;
                  do
                  {
                    if (*(_QWORD *)v1018 != v789)
                      objc_enumerationMutation(v787);
                    v791 = *(void **)(*((_QWORD *)&v1017 + 1) + 8 * v790);
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v792 = [GEOPDSearchStringStringPair alloc];
                      if (v792)
                        v793 = (void *)-[GEOPDSearchStringStringPair _initWithDictionary:isJSON:](v792, v791);
                      else
                        v793 = 0;
                      -[GEOPDSearchSynonym addTokenList:](v771, v793);

                    }
                    ++v790;
                  }
                  while (v788 != v790);
                  v794 = objc_msgSend(v787, "countByEnumeratingWithState:objects:count:", &v1017, &v1029, 16);
                  v788 = v794;
                }
                while (v794);
              }

            }
            objc_msgSend(objl, "objectForKeyedSubscript:", v884);
            v795 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v796 = (void *)objc_msgSend(v795, "copy");
              v797 = v796;
              *(_BYTE *)(v771 + 60) |= 8u;
              *(_BYTE *)(v771 + 60) |= 0x20u;
              objc_storeStrong((id *)(v771 + 24), v796);

            }
          }

        }
        else
        {
          v771 = 0;
        }
        -[GEOPDSearchTokenSynonymMetadata addSynonymList:]((uint64_t)v912, (void *)v771);

      }
      ++v768;
    }
    while (v768 != v950);
    v798 = objc_msgSend(v921, "countByEnumeratingWithState:objects:count:", &v1013, &v1025, 16);
    v950 = v798;
  }
  while (v798);
LABEL_1652:

LABEL_1653:
LABEL_1654:

LABEL_1655:
  v799 = v912;
  *(_QWORD *)(v966 + 308) |= 0x600000000uLL;
  objc_storeStrong((id *)(v966 + 280), v912);

LABEL_1656:
  if (a3)
    v800 = CFSTR("queryNeuralRewriteMetadata");
  else
    v800 = CFSTR("query_neural_rewrite_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v800);
  v801 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v802 = [GEOPDSearchQueryNeuralRewriteMetadata alloc];
    if (v802)
    {
      v803 = v801;
      v804 = -[GEOPDSearchQueryNeuralRewriteMetadata init](v802, "init");
      if (v804)
      {
        if (a3)
          v805 = CFSTR("modelId");
        else
          v805 = CFSTR("model_id");
        objc_msgSend(v803, "objectForKeyedSubscript:", v805);
        v806 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v807 = (void *)objc_msgSend(v806, "copy");
          v808 = v807;
          *(_BYTE *)(v804 + 56) |= 4u;
          *(_BYTE *)(v804 + 56) |= 0x10u;
          objc_storeStrong((id *)(v804 + 24), v807);

        }
        if (a3)
          v809 = CFSTR("modelScore");
        else
          v809 = CFSTR("model_score");
        objc_msgSend(v803, "objectForKeyedSubscript:", v809);
        v810 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v810, "floatValue");
          *(_BYTE *)(v804 + 56) |= 0x10u;
          *(_BYTE *)(v804 + 56) |= 1u;
          *(_DWORD *)(v804 + 52) = v811;
        }

        if (a3)
          v812 = CFSTR("inputQuery");
        else
          v812 = CFSTR("input_query");
        objc_msgSend(v803, "objectForKeyedSubscript:", v812);
        v813 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v814 = (void *)objc_msgSend(v813, "copy");
          v815 = v814;
          *(_BYTE *)(v804 + 56) |= 2u;
          *(_BYTE *)(v804 + 56) |= 0x10u;
          objc_storeStrong((id *)(v804 + 16), v814);

        }
        objc_msgSend(v803, "objectForKeyedSubscript:", v859);
        v816 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v817 = (void *)objc_msgSend(v816, "copy");
          v818 = v817;
          *(_BYTE *)(v804 + 56) |= 8u;
          *(_BYTE *)(v804 + 56) |= 0x10u;
          objc_storeStrong((id *)(v804 + 32), v817);

        }
      }

    }
    else
    {
      v804 = 0;
    }
    v819 = (id)v804;
    *(_QWORD *)(v966 + 308) |= 0x400200000uLL;
    objc_storeStrong((id *)(v966 + 184), (id)v804);

  }
  if (a3)
    v820 = CFSTR("queryCtrMetadata");
  else
    v820 = CFSTR("query_ctr_metadata");
  objc_msgSend(v885, "objectForKeyedSubscript:", v820);
  v905 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_1749;
  v821 = [GEOPDSearchQueryCtrMetadata alloc];
  if (!v821)
  {
    objm = 0;
    goto LABEL_1748;
  }
  v898 = v905;
  objm = -[GEOPDSearchQueryCtrMetadata init](v821, "init");
  if (!objm)
    goto LABEL_1747;
  objc_msgSend(v898, "objectForKeyedSubscript:", CFSTR("queryCtrKeyValuePair"));
  v891 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_1746;
  v1032 = 0u;
  v1031 = 0u;
  v1030 = 0u;
  v1029 = 0u;
  v822 = v891;
  v823 = objc_msgSend(v822, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
  if (!v823)
    goto LABEL_1745;
  v824 = CFSTR("num_taps");
  v825 = *(_QWORD *)v1030;
  v826 = a3 == 0;
  if (a3)
    v824 = CFSTR("numTaps");
  v968 = v824;
  if (v826)
    v827 = CFSTR("num_impressions");
  else
    v827 = CFSTR("numImpressions");
  v828 = CFSTR("num_query_taps");
  if (!v826)
    v828 = CFSTR("numQueryTaps");
  v936 = v828;
  v951 = v827;
  if (v826)
    v829 = CFSTR("forward_sctr");
  else
    v829 = CFSTR("forwardSctr");
  v830 = CFSTR("backwardSctr");
  if (v826)
    v830 = CFSTR("backward_sctr");
  v913 = v830;
  v922 = v829;
  while (2)
  {
    v831 = 0;
    while (2)
    {
      if (*(_QWORD *)v1030 != v825)
        objc_enumerationMutation(v822);
      v832 = *(void **)(*((_QWORD *)&v1029 + 1) + 8 * v831);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v833 = [GEOPDSearchCTRStoreKeyValuePair alloc];
        if (v833)
        {
          v834 = v832;
          v835 = -[GEOPDSearchCTRStoreKeyValuePair init](v833, "init");
          if (v835)
          {
            objc_msgSend(v834, "objectForKeyedSubscript:", v968);
            v836 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v837 = objc_msgSend(v836, "intValue");
              *(_BYTE *)(v835 + 68) |= 0x80u;
              *(_BYTE *)(v835 + 68) |= 0x10u;
              *(_DWORD *)(v835 + 60) = v837;
            }

            objc_msgSend(v834, "objectForKeyedSubscript:", v951);
            v838 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v839 = objc_msgSend(v838, "intValue");
              *(_BYTE *)(v835 + 68) |= 0x80u;
              *(_BYTE *)(v835 + 68) |= 4u;
              *(_DWORD *)(v835 + 52) = v839;
            }

            objc_msgSend(v834, "objectForKeyedSubscript:", v936);
            v840 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v841 = objc_msgSend(v840, "intValue");
              *(_BYTE *)(v835 + 68) |= 0x80u;
              *(_BYTE *)(v835 + 68) |= 8u;
              *(_DWORD *)(v835 + 56) = v841;
            }

            objc_msgSend(v834, "objectForKeyedSubscript:", v922);
            v842 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v843 = objc_msgSend(v842, "intValue");
              *(_BYTE *)(v835 + 68) |= 0x80u;
              *(_BYTE *)(v835 + 68) |= 2u;
              *(_DWORD *)(v835 + 48) = v843;
            }

            objc_msgSend(v834, "objectForKeyedSubscript:", v913);
            v844 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v845 = objc_msgSend(v844, "intValue");
              *(_BYTE *)(v835 + 68) |= 0x80u;
              *(_BYTE *)(v835 + 68) |= 1u;
              *(_DWORD *)(v835 + 44) = v845;
            }

            objc_msgSend(v834, "objectForKeyedSubscript:", CFSTR("query"));
            v846 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v847 = (void *)objc_msgSend(v846, "copy");
              v848 = v847;
              *(_BYTE *)(v835 + 68) |= 0x40u;
              *(_BYTE *)(v835 + 68) |= 0x80u;
              objc_storeStrong((id *)(v835 + 24), v847);

            }
            objc_msgSend(v834, "objectForKeyedSubscript:", CFSTR("geoHash"));
            v849 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v850 = (void *)objc_msgSend(v849, "copy");
              v851 = v850;
              *(_BYTE *)(v835 + 68) |= 0x20u;
              *(_BYTE *)(v835 + 68) |= 0x80u;
              objc_storeStrong((id *)(v835 + 16), v850);

            }
            objc_msgSend(v834, "objectForKeyedSubscript:", CFSTR("type"));
            v852 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v853 = v852;
              if ((objc_msgSend(v853, "isEqualToString:", CFSTR("CTR_GEO")) & 1) != 0)
              {
                v854 = 1;
              }
              else if ((objc_msgSend(v853, "isEqualToString:", CFSTR("CTR_POI")) & 1) != 0)
              {
                v854 = 2;
              }
              else if ((objc_msgSend(v853, "isEqualToString:", CFSTR("CTR_QUERY_SUGGESTION")) & 1) != 0)
              {
                v854 = 3;
              }
              else if (objc_msgSend(v853, "isEqualToString:", CFSTR("CTR_IS_NOT_TAPPED")))
              {
                v854 = 4;
              }
              else
              {
                v854 = 1;
              }

LABEL_1737:
              *(_BYTE *)(v835 + 68) |= 0x80u;
              *(_DWORD *)(v835 + 64) = v854;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v854 = objc_msgSend(v852, "intValue");
                goto LABEL_1737;
              }
            }

          }
        }
        else
        {
          v835 = 0;
        }
        -[GEOPDSearchQueryCtrMetadata addQueryCtrKeyValuePair:]((uint64_t)objm, (void *)v835);

      }
      if (v823 != ++v831)
        continue;
      break;
    }
    v855 = objc_msgSend(v822, "countByEnumeratingWithState:objects:count:", &v1029, v1033, 16);
    v823 = v855;
    if (v855)
      continue;
    break;
  }
LABEL_1745:

LABEL_1746:
LABEL_1747:

LABEL_1748:
  v856 = objm;
  *(_QWORD *)(v966 + 308) |= 0x400001000uLL;
  objc_storeStrong((id *)(v966 + 104), objm);

LABEL_1749:
LABEL_1750:

  return v966;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchQueryIntentMetadataReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  os_unfair_lock_s *p_readerLock;
  $BAF710AE58301BBFFC7E171ED67E2070 flags;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PBDataReader *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_readerLock = &self->_readerLock;
  os_unfair_lock_lock(&self->_readerLock);
  if (self->_reader && (_GEOPDSearchQueryIntentMetadataIsDirty((uint64_t)self) & 1) == 0)
  {
    v17 = self->_reader;
    objc_sync_enter(v17);
    *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
    -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
    -[PBDataReader readBytes:](self->_reader, "readBytes:", self->_readerMarkLength - self->_readerMarkPos);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v18);
    os_unfair_lock_unlock(p_readerLock);

    objc_sync_exit(v17);
    goto LABEL_85;
  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 0);
  if (self->_originalQuery)
    PBDataWriterWriteStringField();
  if (self->_rewrittenQuery)
    PBDataWriterWriteStringField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_9:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_10;
LABEL_82:
      PBDataWriterWriteBOOLField();
      if ((*(_QWORD *)&self->_flags & 0x10) == 0)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteDoubleField();
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    goto LABEL_82;
LABEL_10:
  if ((*(_BYTE *)&flags & 0x10) != 0)
LABEL_11:
    PBDataWriterWriteBOOLField();
LABEL_12:
  if (self->_queryTagMetadata)
    PBDataWriterWriteSubmessage();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = self->_queryClassificationMetadatas;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        PBDataWriterWriteSubmessage();
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v8);
  }

  if (self->_querySpellCorrectionMetadata)
    PBDataWriterWriteSubmessage();
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_queryGeoMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_intentSources.count)
  {
    v11 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v11;
    }
    while (v11 < self->_intentSources.count);
  }
  if (self->_querySynonymMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryDymMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryCompletionMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryInterpretationMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryDirectionsIntentMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryNormalizerMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryGeoNormalizerMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryTokenizerMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryTransliterMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryFuzzyMatchV2Metadata)
    PBDataWriterWriteSubmessage();
  if (self->_rewrittenQueryTypes.count)
  {
    v12 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v12;
    }
    while (v12 < self->_rewrittenQueryTypes.count);
  }
  if (self->_queryPoiMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_acHintMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryGeoTagMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_rawQueryTokenizerMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryTokenImportanceMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_geoTokenImportanceMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_richBrandMetadata)
    PBDataWriterWriteSubmessage();
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = self->_queryEmbeddingMetadatas;
  v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        PBDataWriterWriteSubmessage();
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

  if (self->_tokenSynonymMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryNeuralRewriteMetadata)
    PBDataWriterWriteSubmessage();
  if (self->_queryCtrMetadata)
    PBDataWriterWriteSubmessage();
LABEL_85:

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
  $BAF710AE58301BBFFC7E171ED67E2070 flags;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
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
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  NSMutableArray *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  id v68;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  os_unfair_lock_lock(&self->_readerLock);
  reader = self->_reader;
  if (reader)
  {
    v7 = reader;
    objc_sync_enter(v7);
    if ((*((_BYTE *)&self->_flags + 4) & 4) == 0)
    {
      *(_QWORD *)((char *)self->_reader + (int)*MEMORY[0x1E0D82BD8]) = self->_readerMarkLength;
      -[PBDataReader seekToOffset:](self->_reader, "seekToOffset:", self->_readerMarkPos);
      GEOPDSearchQueryIntentMetadataReadAllFrom(v5, self->_reader, 0);
      os_unfair_lock_unlock(&self->_readerLock);
      v8 = (id)v5;
      objc_sync_exit(v7);

      goto LABEL_27;
    }
    objc_sync_exit(v7);

  }
  os_unfair_lock_unlock(&self->_readerLock);
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 0);
  v9 = -[NSString copyWithZone:](self->_originalQuery, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v9;

  v11 = -[NSString copyWithZone:](self->_rewrittenQuery, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 264);
  *(_QWORD *)(v5 + 264) = v11;

  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    *(_DWORD *)(v5 + 300) = self->_rewrittenQueryIndex;
    *(_QWORD *)(v5 + 308) |= 2uLL;
    flags = self->_flags;
    if ((*(_BYTE *)&flags & 1) == 0)
    {
LABEL_7:
      if ((*(_BYTE *)&flags & 8) == 0)
        goto LABEL_8;
LABEL_30:
      *(_BYTE *)(v5 + 305) = self->_isFromKnowledgeGraph;
      *(_QWORD *)(v5 + 308) |= 8uLL;
      if ((*(_QWORD *)&self->_flags & 0x10) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&flags & 1) == 0)
  {
    goto LABEL_7;
  }
  *(double *)(v5 + 168) = self->_queryIntentWeight;
  *(_QWORD *)(v5 + 308) |= 1uLL;
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 8) != 0)
    goto LABEL_30;
LABEL_8:
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
LABEL_9:
    *(_BYTE *)(v5 + 306) = self->_isFromSearchQu;
    *(_QWORD *)(v5 + 308) |= 0x10uLL;
  }
LABEL_10:
  v14 = -[GEOPDSearchQueryTagMetadata copyWithZone:](self->_queryTagMetadata, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 224);
  *(_QWORD *)(v5 + 224) = v14;

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v16 = self->_queryClassificationMetadatas;
  v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v75 != v18)
          objc_enumerationMutation(v16);
        v20 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "copyWithZone:", a3);
        -[GEOPDSearchQueryIntentMetadata addQueryClassificationMetadata:](v5, v20);

      }
      v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v74, v79, 16);
    }
    while (v17);
  }

  v21 = -[GEOPDSearchQuerySpellCorrectionMetadata copyWithZone:](self->_querySpellCorrectionMetadata, "copyWithZone:", a3);
  v22 = *(void **)(v5 + 208);
  *(_QWORD *)(v5 + 208) = v21;

  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    *(_BYTE *)(v5 + 304) = self->_isFromDefinitiveQu;
    *(_QWORD *)(v5 + 308) |= 4uLL;
  }
  v23 = -[GEOPDSearchQueryGeoMetadata copyWithZone:](self->_queryGeoMetadata, "copyWithZone:", a3);
  v24 = *(void **)(v5 + 144);
  *(_QWORD *)(v5 + 144) = v23;

  PBRepeatedInt32Copy();
  v25 = -[GEOPDSearchQuerySynonymMetadata copyWithZone:](self->_querySynonymMetadata, "copyWithZone:", a3);
  v26 = *(void **)(v5 + 216);
  *(_QWORD *)(v5 + 216) = v25;

  v27 = -[GEOPDSearchQueryDymMetadata copyWithZone:](self->_queryDymMetadata, "copyWithZone:", a3);
  v28 = *(void **)(v5 + 120);
  *(_QWORD *)(v5 + 120) = v27;

  v29 = -[GEOPDSearchQueryCompletionMetadata copyWithZone:](self->_queryCompletionMetadata, "copyWithZone:", a3);
  v30 = *(void **)(v5 + 96);
  *(_QWORD *)(v5 + 96) = v29;

  v31 = -[GEOPDSearchQueryInterpretationMetadata copyWithZone:](self->_queryInterpretationMetadata, "copyWithZone:", a3);
  v32 = *(void **)(v5 + 176);
  *(_QWORD *)(v5 + 176) = v31;

  v33 = -[GEOPDSearchQueryDirectionsIntentMetadata copyWithZone:](self->_queryDirectionsIntentMetadata, "copyWithZone:", a3);
  v34 = *(void **)(v5 + 112);
  *(_QWORD *)(v5 + 112) = v33;

  v35 = -[GEOPDSearchQueryNormalizerMetadata copyWithZone:](self->_queryNormalizerMetadata, "copyWithZone:", a3);
  v36 = *(void **)(v5 + 192);
  *(_QWORD *)(v5 + 192) = v35;

  v37 = -[GEOPDSearchQueryGeoNormalizerMetadata copyWithZone:](self->_queryGeoNormalizerMetadata, "copyWithZone:", a3);
  v38 = *(void **)(v5 + 152);
  *(_QWORD *)(v5 + 152) = v37;

  v39 = -[GEOPDSearchQueryTokenizerMetadata copyWithZone:](self->_queryTokenizerMetadata, "copyWithZone:", a3);
  v40 = *(void **)(v5 + 240);
  *(_QWORD *)(v5 + 240) = v39;

  v41 = -[GEOPDSearchQueryTransliteratorMetadata copyWithZone:](self->_queryTransliterMetadata, "copyWithZone:", a3);
  v42 = *(void **)(v5 + 248);
  *(_QWORD *)(v5 + 248) = v41;

  v43 = -[GEOPDSearchQueryFuzzyMatchV2Metadata copyWithZone:](self->_queryFuzzyMatchV2Metadata, "copyWithZone:", a3);
  v44 = *(void **)(v5 + 136);
  *(_QWORD *)(v5 + 136) = v43;

  PBRepeatedInt32Copy();
  v45 = -[GEOPDSearchQueryPoiMetadata copyWithZone:](self->_queryPoiMetadata, "copyWithZone:", a3);
  v46 = *(void **)(v5 + 200);
  *(_QWORD *)(v5 + 200) = v45;

  v47 = -[GEOPDSearchACHintMetadata copyWithZone:](self->_acHintMetadata, "copyWithZone:", a3);
  v48 = *(void **)(v5 + 64);
  *(_QWORD *)(v5 + 64) = v47;

  v49 = -[GEOPDSearchQueryGeoTagMetadata copyWithZone:](self->_queryGeoTagMetadata, "copyWithZone:", a3);
  v50 = *(void **)(v5 + 160);
  *(_QWORD *)(v5 + 160) = v49;

  v51 = -[GEOPDSearchQueryTokenizerMetadata copyWithZone:](self->_rawQueryTokenizerMetadata, "copyWithZone:", a3);
  v52 = *(void **)(v5 + 256);
  *(_QWORD *)(v5 + 256) = v51;

  v53 = -[GEOPDSearchQueryTokenImportanceMetadata copyWithZone:](self->_queryTokenImportanceMetadata, "copyWithZone:", a3);
  v54 = *(void **)(v5 + 232);
  *(_QWORD *)(v5 + 232) = v53;

  v55 = -[GEOPDSearchQueryTokenImportanceMetadata copyWithZone:](self->_geoTokenImportanceMetadata, "copyWithZone:", a3);
  v56 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v55;

  v57 = -[GEOPDSearchRichBrandMetadata copyWithZone:](self->_richBrandMetadata, "copyWithZone:", a3);
  v58 = *(void **)(v5 + 272);
  *(_QWORD *)(v5 + 272) = v57;

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v59 = self->_queryEmbeddingMetadatas;
  v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v71 != v61)
          objc_enumerationMutation(v59);
        v63 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "copyWithZone:", a3, (_QWORD)v70);
        -[GEOPDSearchQueryIntentMetadata addQueryEmbeddingMetadata:](v5, v63);

      }
      v60 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v59, "countByEnumeratingWithState:objects:count:", &v70, v78, 16);
    }
    while (v60);
  }

  v64 = -[GEOPDSearchTokenSynonymMetadata copyWithZone:](self->_tokenSynonymMetadata, "copyWithZone:", a3);
  v65 = *(void **)(v5 + 280);
  *(_QWORD *)(v5 + 280) = v64;

  v66 = -[GEOPDSearchQueryNeuralRewriteMetadata copyWithZone:](self->_queryNeuralRewriteMetadata, "copyWithZone:", a3);
  v67 = *(void **)(v5 + 184);
  *(_QWORD *)(v5 + 184) = v66;

  v68 = -[GEOPDSearchQueryCtrMetadata copyWithZone:](self->_queryCtrMetadata, "copyWithZone:", a3);
  v8 = *(id *)(v5 + 104);
  *(_QWORD *)(v5 + 104) = v68;
LABEL_27:

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  char *v4;
  NSString *originalQuery;
  NSString *rewrittenQuery;
  $BAF710AE58301BBFFC7E171ED67E2070 flags;
  uint64_t v8;
  GEOPDSearchQueryTagMetadata *queryTagMetadata;
  NSMutableArray *queryClassificationMetadatas;
  GEOPDSearchQuerySpellCorrectionMetadata *querySpellCorrectionMetadata;
  uint64_t v12;
  GEOPDSearchQueryGeoMetadata *queryGeoMetadata;
  GEOPDSearchQuerySynonymMetadata *querySynonymMetadata;
  GEOPDSearchQueryDymMetadata *queryDymMetadata;
  GEOPDSearchQueryCompletionMetadata *queryCompletionMetadata;
  GEOPDSearchQueryInterpretationMetadata *queryInterpretationMetadata;
  GEOPDSearchQueryDirectionsIntentMetadata *queryDirectionsIntentMetadata;
  GEOPDSearchQueryNormalizerMetadata *queryNormalizerMetadata;
  GEOPDSearchQueryGeoNormalizerMetadata *queryGeoNormalizerMetadata;
  GEOPDSearchQueryTokenizerMetadata *queryTokenizerMetadata;
  GEOPDSearchQueryTransliteratorMetadata *queryTransliterMetadata;
  GEOPDSearchQueryFuzzyMatchV2Metadata *queryFuzzyMatchV2Metadata;
  GEOPDSearchQueryPoiMetadata *queryPoiMetadata;
  GEOPDSearchACHintMetadata *acHintMetadata;
  GEOPDSearchQueryGeoTagMetadata *queryGeoTagMetadata;
  GEOPDSearchQueryTokenizerMetadata *rawQueryTokenizerMetadata;
  GEOPDSearchQueryTokenImportanceMetadata *queryTokenImportanceMetadata;
  GEOPDSearchQueryTokenImportanceMetadata *geoTokenImportanceMetadata;
  GEOPDSearchRichBrandMetadata *richBrandMetadata;
  NSMutableArray *queryEmbeddingMetadatas;
  GEOPDSearchTokenSynonymMetadata *tokenSynonymMetadata;
  GEOPDSearchQueryNeuralRewriteMetadata *queryNeuralRewriteMetadata;
  GEOPDSearchQueryCtrMetadata *queryCtrMetadata;
  char v35;

  v4 = (char *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_92;
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 1);
  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)v4, 1);
  originalQuery = self->_originalQuery;
  if ((unint64_t)originalQuery | *((_QWORD *)v4 + 10))
  {
    if (!-[NSString isEqual:](originalQuery, "isEqual:"))
      goto LABEL_92;
  }
  rewrittenQuery = self->_rewrittenQuery;
  if ((unint64_t)rewrittenQuery | *((_QWORD *)v4 + 33))
  {
    if (!-[NSString isEqual:](rewrittenQuery, "isEqual:"))
      goto LABEL_92;
  }
  flags = self->_flags;
  v8 = *(_QWORD *)(v4 + 308);
  if ((*(_BYTE *)&flags & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_rewrittenQueryIndex != *((_DWORD *)v4 + 75))
      goto LABEL_92;
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&flags & 1) != 0)
  {
    if ((v8 & 1) == 0 || self->_queryIntentWeight != *((double *)v4 + 21))
      goto LABEL_92;
  }
  else if ((v8 & 1) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&flags & 8) != 0)
  {
    if ((v8 & 8) == 0)
      goto LABEL_92;
    if (self->_isFromKnowledgeGraph)
    {
      if (!v4[305])
        goto LABEL_92;
    }
    else if (v4[305])
    {
      goto LABEL_92;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_92;
  }
  if ((*(_BYTE *)&flags & 0x10) != 0)
  {
    if ((v8 & 0x10) == 0)
      goto LABEL_92;
    if (self->_isFromSearchQu)
    {
      if (!v4[306])
        goto LABEL_92;
    }
    else if (v4[306])
    {
      goto LABEL_92;
    }
  }
  else if ((v8 & 0x10) != 0)
  {
    goto LABEL_92;
  }
  queryTagMetadata = self->_queryTagMetadata;
  if ((unint64_t)queryTagMetadata | *((_QWORD *)v4 + 28)
    && !-[GEOPDSearchQueryTagMetadata isEqual:](queryTagMetadata, "isEqual:"))
  {
    goto LABEL_92;
  }
  queryClassificationMetadatas = self->_queryClassificationMetadatas;
  if ((unint64_t)queryClassificationMetadatas | *((_QWORD *)v4 + 11))
  {
    if (!-[NSMutableArray isEqual:](queryClassificationMetadatas, "isEqual:"))
      goto LABEL_92;
  }
  querySpellCorrectionMetadata = self->_querySpellCorrectionMetadata;
  if ((unint64_t)querySpellCorrectionMetadata | *((_QWORD *)v4 + 26))
  {
    if (!-[GEOPDSearchQuerySpellCorrectionMetadata isEqual:](querySpellCorrectionMetadata, "isEqual:"))
      goto LABEL_92;
  }
  v12 = *(_QWORD *)(v4 + 308);
  if ((*(_BYTE *)&self->_flags & 4) != 0)
  {
    if ((v12 & 4) != 0)
    {
      if (self->_isFromDefinitiveQu)
      {
        if (!v4[304])
          goto LABEL_92;
        goto LABEL_46;
      }
      if (!v4[304])
        goto LABEL_46;
    }
LABEL_92:
    v35 = 0;
    goto LABEL_93;
  }
  if ((v12 & 4) != 0)
    goto LABEL_92;
LABEL_46:
  queryGeoMetadata = self->_queryGeoMetadata;
  if ((unint64_t)queryGeoMetadata | *((_QWORD *)v4 + 18)
    && !-[GEOPDSearchQueryGeoMetadata isEqual:](queryGeoMetadata, "isEqual:"))
  {
    goto LABEL_92;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_92;
  querySynonymMetadata = self->_querySynonymMetadata;
  if ((unint64_t)querySynonymMetadata | *((_QWORD *)v4 + 27))
  {
    if (!-[GEOPDSearchQuerySynonymMetadata isEqual:](querySynonymMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryDymMetadata = self->_queryDymMetadata;
  if ((unint64_t)queryDymMetadata | *((_QWORD *)v4 + 15))
  {
    if (!-[GEOPDSearchQueryDymMetadata isEqual:](queryDymMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryCompletionMetadata = self->_queryCompletionMetadata;
  if ((unint64_t)queryCompletionMetadata | *((_QWORD *)v4 + 12))
  {
    if (!-[GEOPDSearchQueryCompletionMetadata isEqual:](queryCompletionMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryInterpretationMetadata = self->_queryInterpretationMetadata;
  if ((unint64_t)queryInterpretationMetadata | *((_QWORD *)v4 + 22))
  {
    if (!-[GEOPDSearchQueryInterpretationMetadata isEqual:](queryInterpretationMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryDirectionsIntentMetadata = self->_queryDirectionsIntentMetadata;
  if ((unint64_t)queryDirectionsIntentMetadata | *((_QWORD *)v4 + 14))
  {
    if (!-[GEOPDSearchQueryDirectionsIntentMetadata isEqual:](queryDirectionsIntentMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryNormalizerMetadata = self->_queryNormalizerMetadata;
  if ((unint64_t)queryNormalizerMetadata | *((_QWORD *)v4 + 24))
  {
    if (!-[GEOPDSearchQueryNormalizerMetadata isEqual:](queryNormalizerMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryGeoNormalizerMetadata = self->_queryGeoNormalizerMetadata;
  if ((unint64_t)queryGeoNormalizerMetadata | *((_QWORD *)v4 + 19))
  {
    if (!-[GEOPDSearchQueryGeoNormalizerMetadata isEqual:](queryGeoNormalizerMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryTokenizerMetadata = self->_queryTokenizerMetadata;
  if ((unint64_t)queryTokenizerMetadata | *((_QWORD *)v4 + 30))
  {
    if (!-[GEOPDSearchQueryTokenizerMetadata isEqual:](queryTokenizerMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryTransliterMetadata = self->_queryTransliterMetadata;
  if ((unint64_t)queryTransliterMetadata | *((_QWORD *)v4 + 31))
  {
    if (!-[GEOPDSearchQueryTransliteratorMetadata isEqual:](queryTransliterMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryFuzzyMatchV2Metadata = self->_queryFuzzyMatchV2Metadata;
  if ((unint64_t)queryFuzzyMatchV2Metadata | *((_QWORD *)v4 + 17))
  {
    if (!-[GEOPDSearchQueryFuzzyMatchV2Metadata isEqual:](queryFuzzyMatchV2Metadata, "isEqual:"))
      goto LABEL_92;
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_92;
  queryPoiMetadata = self->_queryPoiMetadata;
  if ((unint64_t)queryPoiMetadata | *((_QWORD *)v4 + 25))
  {
    if (!-[GEOPDSearchQueryPoiMetadata isEqual:](queryPoiMetadata, "isEqual:"))
      goto LABEL_92;
  }
  acHintMetadata = self->_acHintMetadata;
  if ((unint64_t)acHintMetadata | *((_QWORD *)v4 + 8))
  {
    if (!-[GEOPDSearchACHintMetadata isEqual:](acHintMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryGeoTagMetadata = self->_queryGeoTagMetadata;
  if ((unint64_t)queryGeoTagMetadata | *((_QWORD *)v4 + 20))
  {
    if (!-[GEOPDSearchQueryGeoTagMetadata isEqual:](queryGeoTagMetadata, "isEqual:"))
      goto LABEL_92;
  }
  rawQueryTokenizerMetadata = self->_rawQueryTokenizerMetadata;
  if ((unint64_t)rawQueryTokenizerMetadata | *((_QWORD *)v4 + 32))
  {
    if (!-[GEOPDSearchQueryTokenizerMetadata isEqual:](rawQueryTokenizerMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryTokenImportanceMetadata = self->_queryTokenImportanceMetadata;
  if ((unint64_t)queryTokenImportanceMetadata | *((_QWORD *)v4 + 29))
  {
    if (!-[GEOPDSearchQueryTokenImportanceMetadata isEqual:](queryTokenImportanceMetadata, "isEqual:"))
      goto LABEL_92;
  }
  geoTokenImportanceMetadata = self->_geoTokenImportanceMetadata;
  if ((unint64_t)geoTokenImportanceMetadata | *((_QWORD *)v4 + 9))
  {
    if (!-[GEOPDSearchQueryTokenImportanceMetadata isEqual:](geoTokenImportanceMetadata, "isEqual:"))
      goto LABEL_92;
  }
  richBrandMetadata = self->_richBrandMetadata;
  if ((unint64_t)richBrandMetadata | *((_QWORD *)v4 + 34))
  {
    if (!-[GEOPDSearchRichBrandMetadata isEqual:](richBrandMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryEmbeddingMetadatas = self->_queryEmbeddingMetadatas;
  if ((unint64_t)queryEmbeddingMetadatas | *((_QWORD *)v4 + 16))
  {
    if (!-[NSMutableArray isEqual:](queryEmbeddingMetadatas, "isEqual:"))
      goto LABEL_92;
  }
  tokenSynonymMetadata = self->_tokenSynonymMetadata;
  if ((unint64_t)tokenSynonymMetadata | *((_QWORD *)v4 + 35))
  {
    if (!-[GEOPDSearchTokenSynonymMetadata isEqual:](tokenSynonymMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryNeuralRewriteMetadata = self->_queryNeuralRewriteMetadata;
  if ((unint64_t)queryNeuralRewriteMetadata | *((_QWORD *)v4 + 23))
  {
    if (!-[GEOPDSearchQueryNeuralRewriteMetadata isEqual:](queryNeuralRewriteMetadata, "isEqual:"))
      goto LABEL_92;
  }
  queryCtrMetadata = self->_queryCtrMetadata;
  if ((unint64_t)queryCtrMetadata | *((_QWORD *)v4 + 13))
    v35 = -[GEOPDSearchQueryCtrMetadata isEqual:](queryCtrMetadata, "isEqual:");
  else
    v35 = 1;
LABEL_93:

  return v35;
}

- (unint64_t)hash
{
  $BAF710AE58301BBFFC7E171ED67E2070 flags;
  uint64_t v4;
  double queryIntentWeight;
  double v6;
  long double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  NSUInteger v43;
  uint64_t v44;
  NSUInteger v45;

  -[GEOPDSearchQueryIntentMetadata readAll:]((uint64_t)self, 1);
  v45 = -[NSString hash](self->_originalQuery, "hash");
  v43 = -[NSString hash](self->_rewrittenQuery, "hash");
  flags = self->_flags;
  if ((*(_BYTE *)&flags & 2) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&flags & 1) != 0)
      goto LABEL_3;
LABEL_9:
    v11 = 0;
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_16;
    goto LABEL_10;
  }
  v4 = 2654435761 * self->_rewrittenQueryIndex;
  if ((*(_BYTE *)&flags & 1) == 0)
    goto LABEL_9;
LABEL_3:
  queryIntentWeight = self->_queryIntentWeight;
  v6 = -queryIntentWeight;
  if (queryIntentWeight >= 0.0)
    v6 = self->_queryIntentWeight;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = fmod(v7, 1.84467441e19);
  v10 = 2654435761u * (unint64_t)v9;
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v11 = v10 + (unint64_t)v8;
    else
      v11 = 2654435761u * (unint64_t)v9;
    if ((*(_BYTE *)&flags & 8) != 0)
    {
LABEL_16:
      v12 = 2654435761 * self->_isFromKnowledgeGraph;
      if ((*(_BYTE *)&flags & 0x10) == 0)
        goto LABEL_17;
LABEL_11:
      v13 = 2654435761 * self->_isFromSearchQu;
      goto LABEL_18;
    }
  }
  else
  {
    v11 = v10 - (unint64_t)fabs(v8);
    if ((*(_BYTE *)&flags & 8) != 0)
      goto LABEL_16;
  }
LABEL_10:
  v12 = 0;
  if ((*(_BYTE *)&flags & 0x10) != 0)
    goto LABEL_11;
LABEL_17:
  v13 = 0;
LABEL_18:
  v14 = -[GEOPDSearchQueryTagMetadata hash](self->_queryTagMetadata, "hash", v43);
  v15 = -[NSMutableArray hash](self->_queryClassificationMetadatas, "hash");
  v16 = -[GEOPDSearchQuerySpellCorrectionMetadata hash](self->_querySpellCorrectionMetadata, "hash");
  if ((*(_BYTE *)&self->_flags & 4) != 0)
    v17 = 2654435761 * self->_isFromDefinitiveQu;
  else
    v17 = 0;
  v18 = v44 ^ v45 ^ v4 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17;
  v19 = -[GEOPDSearchQueryGeoMetadata hash](self->_queryGeoMetadata, "hash");
  v20 = v19 ^ PBRepeatedInt32Hash();
  v21 = v20 ^ -[GEOPDSearchQuerySynonymMetadata hash](self->_querySynonymMetadata, "hash");
  v22 = v18 ^ v21 ^ -[GEOPDSearchQueryDymMetadata hash](self->_queryDymMetadata, "hash");
  v23 = -[GEOPDSearchQueryCompletionMetadata hash](self->_queryCompletionMetadata, "hash");
  v24 = v23 ^ -[GEOPDSearchQueryInterpretationMetadata hash](self->_queryInterpretationMetadata, "hash");
  v25 = v24 ^ -[GEOPDSearchQueryDirectionsIntentMetadata hash](self->_queryDirectionsIntentMetadata, "hash");
  v26 = v25 ^ -[GEOPDSearchQueryNormalizerMetadata hash](self->_queryNormalizerMetadata, "hash");
  v27 = v22 ^ v26 ^ -[GEOPDSearchQueryGeoNormalizerMetadata hash](self->_queryGeoNormalizerMetadata, "hash");
  v28 = -[GEOPDSearchQueryTokenizerMetadata hash](self->_queryTokenizerMetadata, "hash");
  v29 = v28 ^ -[GEOPDSearchQueryTransliteratorMetadata hash](self->_queryTransliterMetadata, "hash");
  v30 = v29 ^ -[GEOPDSearchQueryFuzzyMatchV2Metadata hash](self->_queryFuzzyMatchV2Metadata, "hash");
  v31 = v30 ^ PBRepeatedInt32Hash();
  v32 = v31 ^ -[GEOPDSearchQueryPoiMetadata hash](self->_queryPoiMetadata, "hash");
  v33 = v27 ^ v32 ^ -[GEOPDSearchACHintMetadata hash](self->_acHintMetadata, "hash");
  v34 = -[GEOPDSearchQueryGeoTagMetadata hash](self->_queryGeoTagMetadata, "hash");
  v35 = v34 ^ -[GEOPDSearchQueryTokenizerMetadata hash](self->_rawQueryTokenizerMetadata, "hash");
  v36 = v35 ^ -[GEOPDSearchQueryTokenImportanceMetadata hash](self->_queryTokenImportanceMetadata, "hash");
  v37 = v36 ^ -[GEOPDSearchQueryTokenImportanceMetadata hash](self->_geoTokenImportanceMetadata, "hash");
  v38 = v37 ^ -[GEOPDSearchRichBrandMetadata hash](self->_richBrandMetadata, "hash");
  v39 = v38 ^ -[NSMutableArray hash](self->_queryEmbeddingMetadatas, "hash");
  v40 = v33 ^ v39 ^ -[GEOPDSearchTokenSynonymMetadata hash](self->_tokenSynonymMetadata, "hash");
  v41 = -[GEOPDSearchQueryNeuralRewriteMetadata hash](self->_queryNeuralRewriteMetadata, "hash");
  return v40 ^ v41 ^ -[GEOPDSearchQueryCtrMetadata hash](self->_queryCtrMetadata, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenSynonymMetadata, 0);
  objc_storeStrong((id *)&self->_richBrandMetadata, 0);
  objc_storeStrong((id *)&self->_rewrittenQuery, 0);
  objc_storeStrong((id *)&self->_rawQueryTokenizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryTransliterMetadata, 0);
  objc_storeStrong((id *)&self->_queryTokenizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryTokenImportanceMetadata, 0);
  objc_storeStrong((id *)&self->_queryTagMetadata, 0);
  objc_storeStrong((id *)&self->_querySynonymMetadata, 0);
  objc_storeStrong((id *)&self->_querySpellCorrectionMetadata, 0);
  objc_storeStrong((id *)&self->_queryPoiMetadata, 0);
  objc_storeStrong((id *)&self->_queryNormalizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryNeuralRewriteMetadata, 0);
  objc_storeStrong((id *)&self->_queryInterpretationMetadata, 0);
  objc_storeStrong((id *)&self->_queryGeoTagMetadata, 0);
  objc_storeStrong((id *)&self->_queryGeoNormalizerMetadata, 0);
  objc_storeStrong((id *)&self->_queryGeoMetadata, 0);
  objc_storeStrong((id *)&self->_queryFuzzyMatchV2Metadata, 0);
  objc_storeStrong((id *)&self->_queryEmbeddingMetadatas, 0);
  objc_storeStrong((id *)&self->_queryDymMetadata, 0);
  objc_storeStrong((id *)&self->_queryDirectionsIntentMetadata, 0);
  objc_storeStrong((id *)&self->_queryCtrMetadata, 0);
  objc_storeStrong((id *)&self->_queryCompletionMetadata, 0);
  objc_storeStrong((id *)&self->_queryClassificationMetadatas, 0);
  objc_storeStrong((id *)&self->_originalQuery, 0);
  objc_storeStrong((id *)&self->_geoTokenImportanceMetadata, 0);
  objc_storeStrong((id *)&self->_acHintMetadata, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
