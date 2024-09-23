@implementation _GEOPlaceSearchCompletionItem

- (_GEOPlaceSearchCompletionItem)initWithEntry:(id)a3 traits:(id)a4 entryListIndex:(int)a5 entryIndex:(int)a6 mapItems:(id)a7 collections:(id)a8 publishers:(id)a9
{
  _GEOPlaceSearchCompletionItem *v16;
  id *p_entry;
  uint64_t v18;
  GEOMapServiceTraits *traits;
  void *v20;
  GEOMapItemIdentifier *v21;
  void *v22;
  GEOMapItemIdentifier *v23;
  _GEOPlaceDataItem *v24;
  id v25;
  _GEOPlaceDataItem *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  GEOMapItem *mapItem;
  GEOSearchCategory *v35;
  GEOSearchCategory *category;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  GEOMapItemIdentifier *v41;
  void *v42;
  void *v43;
  GEOMapItemIdentifier *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  BOOL v57;
  GEOMapItemIdentifier *v58;
  void *v59;
  void *v60;
  GEOMapItemIdentifier *v61;
  GEOMapItemIdentifier *v62;
  GEOCollectionResult *v63;
  uint64_t v64;
  GEOCollectionResult *collectionResult;
  void *v66;
  BOOL v67;
  void *v68;
  void *v69;
  BOOL v70;
  GEOMapItemIdentifier *v71;
  void *v72;
  void *v73;
  GEOMapItemIdentifier *v74;
  GEOMapItemIdentifier *v75;
  GEOPublisherResult *v76;
  uint64_t v77;
  GEOPublisherResult *publisherResult;
  void *v79;
  BOOL v80;
  void *v81;
  GEOMapItemIdentifier *v82;
  void *v83;
  void *v84;
  GEOMapItemIdentifier *v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t k;
  void *v90;
  void *v91;
  char v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v102;
  int v103;
  void *v104;
  uint64_t v105;
  uint64_t m;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t n;
  void *v114;
  unsigned int v115;
  unsigned int v116;
  void *v117;
  NSArray *displayLines;
  NSArray *v119;
  NSArray *lineHighlights;
  id v122;
  id v123;
  id v124;
  id v125;
  _GEOPlaceSearchCompletionItem *v126;
  id v127;
  NSArray *v128;
  NSArray *v129;
  id obj;
  uint64_t v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  _QWORD v144[4];
  GEOMapItemIdentifier *v145;
  uint64_t *v146;
  _QWORD v147[4];
  GEOMapItemIdentifier *v148;
  uint64_t *v149;
  uint64_t v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t (*v153)(uint64_t, uint64_t);
  void (*v154)(uint64_t);
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  objc_super v164;
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  uint64_t v170;

  v170 = *MEMORY[0x1E0C80C00];
  v127 = a3;
  v125 = a4;
  v124 = a7;
  v123 = a8;
  v122 = a9;
  v164.receiver = self;
  v164.super_class = (Class)_GEOPlaceSearchCompletionItem;
  v126 = -[_GEOPlaceSearchCompletionItem init](&v164, sel_init);
  v16 = 0;
  if (!v127 || !v126)
    goto LABEL_116;
  p_entry = (id *)&v126->_entry;
  objc_storeStrong((id *)&v126->_entry, a3);
  v18 = objc_msgSend(v125, "copy");
  traits = v126->_traits;
  v126->_traits = (GEOMapServiceTraits *)v18;

  v126->_entryListIndex = a5;
  v126->_entryIndex = a6;
  if (objc_msgSend(v127, "type") == 1 && objc_msgSend(v127, "hasBusiness"))
  {
    objc_msgSend(v127, "business");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (((objc_msgSend(v20, "hasMuid") & 1) != 0 || objc_msgSend(v20, "hasMapsId"))
      && objc_msgSend(v124, "count"))
    {
      if (objc_msgSend(v20, "hasMapsId"))
      {
        v21 = [GEOMapItemIdentifier alloc];
        objc_msgSend(v20, "mapsId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v21, "initWithMapsIdentifier:", v22);

      }
      else
      {
        v23 = 0;
      }
      v162 = 0u;
      v163 = 0u;
      v160 = 0u;
      v161 = 0u;
      v25 = v124;
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v160, v169, 16);
      if (v27)
      {
        v28 = *(_QWORD *)v161;
        while (2)
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v161 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v160 + 1) + 8 * i);
            if (!v23
              || (objc_msgSend(*(id *)(*((_QWORD *)&v160 + 1) + 8 * i), "_identifier"),
                  v31 = (void *)objc_claimAutoreleasedReturnValue(),
                  v32 = objc_msgSend(v31, "isEqualToGEOMapItemIdentifier:", v23),
                  v31,
                  !v32))
            {
              if (!objc_msgSend(v20, "hasMuid"))
                continue;
              v33 = objc_msgSend(v30, "_muid");
              if (v33 != objc_msgSend(v20, "muid"))
                continue;
            }
            v26 = v30;
            goto LABEL_26;
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v160, v169, 16);
          if (v27)
            continue;
          break;
        }
      }
    }
    else
    {
      if (!objc_msgSend(v20, "hasPlace"))
      {
LABEL_28:

        goto LABEL_29;
      }
      v24 = [_GEOPlaceDataItem alloc];
      objc_msgSend(v127, "business");
      v23 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
      -[GEOMapItemIdentifier place](v23, "place");
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = -[_GEOPlaceDataItem initWithPlaceData:](v24, "initWithPlaceData:", v25);
LABEL_26:
      mapItem = v126->_mapItem;
      v126->_mapItem = (GEOMapItem *)v26;

    }
    goto LABEL_28;
  }
LABEL_29:
  if (objc_msgSend(v127, "type") == 3 && objc_msgSend(v127, "hasCategory"))
  {
    v35 = -[GEOSearchCategory initWithAutocompleteEntry:]([GEOSearchCategory alloc], "initWithAutocompleteEntry:", v127);
    category = v126->_category;
    v126->_category = v35;

  }
  if (objc_msgSend(v127, "type") == 2)
  {
    objc_msgSend(v127, "address");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "hasOpaqueGeoId"))
    {

LABEL_36:
      objc_msgSend(v127, "address");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v40, "hasMapsId"))
      {
        v41 = [GEOMapItemIdentifier alloc];
        objc_msgSend(v127, "address");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "mapsId");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v41, "initWithMapsIdentifier:", v43);

      }
      else
      {
        v44 = 0;
      }

      v158 = 0u;
      v159 = 0u;
      v156 = 0u;
      v157 = 0u;
      v45 = v124;
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v157;
        while (2)
        {
          for (j = 0; j != v46; ++j)
          {
            if (*(_QWORD *)v157 != v47)
              objc_enumerationMutation(v45);
            v49 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * j);
            if (v44)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v156 + 1) + 8 * j), "_identifier");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = objc_msgSend(v50, "isEqualToGEOMapItemIdentifier:", v44);

              if ((v51 & 1) != 0)
              {
LABEL_53:
                objc_storeStrong((id *)&v126->_mapItem, v49);
                goto LABEL_54;
              }
            }
            objc_msgSend(v127, "address");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v52, "hasOpaqueGeoId") & 1) != 0)
            {
              v53 = objc_msgSend(v49, "_muid");
              objc_msgSend(v127, "address");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v53) = v53 == objc_msgSend(v54, "opaqueGeoId");

              if ((v53 & 1) != 0)
                goto LABEL_53;
            }
            else
            {

            }
          }
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v156, v168, 16);
          if (v46)
            continue;
          break;
        }
      }
LABEL_54:

      goto LABEL_55;
    }
    objc_msgSend(v127, "address");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "hasMapsId");

    if (v39)
      goto LABEL_36;
  }
LABEL_55:
  if (objc_msgSend(v127, "type") == 8)
  {
    objc_msgSend(v127, "collection");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "collectionId");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = v56 == 0;

    if (!v57)
    {
      v58 = [GEOMapItemIdentifier alloc];
      objc_msgSend(v127, "collection");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "collectionId");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v58, "initWithMapsIdentifier:", v60);

      v150 = 0;
      v151 = &v150;
      v152 = 0x3032000000;
      v153 = __Block_byref_object_copy__18;
      v154 = __Block_byref_object_dispose__18;
      v155 = 0;
      v147[0] = MEMORY[0x1E0C809B0];
      v147[1] = 3221225472;
      v147[2] = __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke;
      v147[3] = &unk_1E1C06B00;
      v62 = v61;
      v148 = v62;
      v149 = &v150;
      objc_msgSend(v123, "enumerateObjectsUsingBlock:", v147);
      if (v151[5])
      {
        v63 = [GEOCollectionResult alloc];
        v64 = -[GEOCollectionResult initWithCollectionResult:](v63, "initWithCollectionResult:", v151[5]);
        collectionResult = v126->_collectionResult;
        v126->_collectionResult = (GEOCollectionResult *)v64;

      }
      -[GEOCollectionResult collection](v126->_collectionResult, "collection");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v66 == 0;

      _Block_object_dispose(&v150, 8);
      if (v67)
        goto LABEL_69;
    }
  }
  if (objc_msgSend(v127, "type") != 9)
    goto LABEL_119;
  objc_msgSend(v127, "publisher");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "publisherId");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v69 == 0;

  if (v70)
    goto LABEL_119;
  v71 = [GEOMapItemIdentifier alloc];
  objc_msgSend(v127, "publisher");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "publisherId");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v71, "initWithMapsIdentifier:", v73);

  v150 = 0;
  v151 = &v150;
  v152 = 0x3032000000;
  v153 = __Block_byref_object_copy__18;
  v154 = __Block_byref_object_dispose__18;
  v155 = 0;
  v144[0] = MEMORY[0x1E0C809B0];
  v144[1] = 3221225472;
  v144[2] = __112___GEOPlaceSearchCompletionItem_initWithEntry_traits_entryListIndex_entryIndex_mapItems_collections_publishers___block_invoke_2;
  v144[3] = &unk_1E1C06B00;
  v75 = v74;
  v145 = v75;
  v146 = &v150;
  objc_msgSend(v122, "enumerateObjectsUsingBlock:", v144);
  if (v151[5])
  {
    v76 = [GEOPublisherResult alloc];
    v77 = -[GEOPublisherResult initWithPublisherResult:](v76, "initWithPublisherResult:", v151[5]);
    publisherResult = v126->_publisherResult;
    v126->_publisherResult = (GEOPublisherResult *)v77;

  }
  -[GEOPublisherResult publisher](v126->_publisherResult, "publisher");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = v79 == 0;

  _Block_object_dispose(&v150, 8);
  if (v80)
  {
LABEL_69:
    v16 = 0;
  }
  else
  {
LABEL_119:
    if (objc_msgSend(v127, "type") == 5 && objc_msgSend(v127, "hasOfflineArea"))
    {
      objc_msgSend(v127, "offlineArea");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v81, "hasMapsId"))
      {
        v82 = [GEOMapItemIdentifier alloc];
        objc_msgSend(v127, "offlineArea");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "mapsId");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = -[GEOMapItemIdentifier initWithMapsIdentifier:](v82, "initWithMapsIdentifier:", v84);

      }
      else
      {
        v85 = 0;
      }

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v86 = v124;
      v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v140, v167, 16);
      if (v87)
      {
        v88 = *(_QWORD *)v141;
        while (2)
        {
          for (k = 0; k != v87; ++k)
          {
            if (*(_QWORD *)v141 != v88)
              objc_enumerationMutation(v86);
            v90 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * k);
            if (v85)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v140 + 1) + 8 * k), "_identifier");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v92 = objc_msgSend(v91, "isEqualToGEOMapItemIdentifier:", v85);

              if ((v92 & 1) != 0)
              {
LABEL_85:
                objc_storeStrong((id *)&v126->_mapItem, v90);
                goto LABEL_86;
              }
            }
            objc_msgSend(v127, "offlineArea");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v93, "hasFeatureId") & 1) != 0)
            {
              v94 = objc_msgSend(v90, "_muid");
              objc_msgSend(v127, "offlineArea");
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v94) = v94 == objc_msgSend(v95, "featureId");

              if ((v94 & 1) != 0)
                goto LABEL_85;
            }
            else
            {

            }
          }
          v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v140, v167, 16);
          if (v87)
            continue;
          break;
        }
      }
LABEL_86:

      objc_msgSend(v127, "offlineArea");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v96, "hasAvailableForDownload") & 1) != 0)
      {
        objc_msgSend(v127, "offlineArea");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        v126->_supportsOfflineDownload = objc_msgSend(v97, "availableForDownload");

      }
      else
      {
        v126->_supportsOfflineDownload = 1;
      }

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*p_entry, "hasHighlightMain"))
    {
      objc_msgSend(*p_entry, "highlightMain");
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = objc_msgSend(v99, "hasLine");

      if (v100)
      {
        objc_msgSend(*p_entry, "highlightMain");
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addObject:", v101);

      }
    }
    if (objc_msgSend(*p_entry, "hasHighlightExtra"))
    {
      objc_msgSend(*p_entry, "highlightExtra");
      v102 = (void *)objc_claimAutoreleasedReturnValue();
      v103 = objc_msgSend(v102, "hasLine");

      if (v103)
      {
        objc_msgSend(*p_entry, "highlightExtra");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addObject:", v104);

      }
    }
    v129 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v98, "count"));
    v128 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v98, "count"));
    v138 = 0u;
    v139 = 0u;
    v136 = 0u;
    v137 = 0u;
    obj = v98;
    v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v166, 16);
    if (v105)
    {
      v131 = *(_QWORD *)v137;
      do
      {
        for (m = 0; m != v105; ++m)
        {
          if (*(_QWORD *)v137 != v131)
            objc_enumerationMutation(obj);
          v107 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * m);
          if (objc_msgSend(v107, "hasLine"))
          {
            objc_msgSend(v107, "line");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSArray addObject:](v129, "addObject:", v108);

            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v107, "spansCount"));
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = 0u;
            v135 = 0u;
            v132 = 0u;
            v133 = 0u;
            objc_msgSend(v107, "spans");
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v132, v165, 16);
            if (v111)
            {
              v112 = *(_QWORD *)v133;
              do
              {
                for (n = 0; n != v111; ++n)
                {
                  if (*(_QWORD *)v133 != v112)
                    objc_enumerationMutation(v110);
                  v114 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * n);
                  if (objc_msgSend(v114, "hasStartIndex")
                    && objc_msgSend(v114, "hasLength"))
                  {
                    v115 = objc_msgSend(v114, "startIndex");
                    v116 = objc_msgSend(v114, "length");
                    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v115, v116);
                    v117 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v109, "addObject:", v117);

                  }
                }
                v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v132, v165, 16);
              }
              while (v111);
            }

            -[NSArray addObject:](v128, "addObject:", v109);
          }
        }
        v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v166, 16);
      }
      while (v105);
    }

    displayLines = v126->_displayLines;
    v126->_displayLines = v129;
    v119 = v129;

    lineHighlights = v126->_lineHighlights;
    v126->_lineHighlights = v128;

    v16 = v126;
  }
LABEL_116:

  return v16;
}

- (id)highlightsForLine:(unint64_t)a3
{
  void *v5;

  if (-[NSArray count](self->_lineHighlights, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_lineHighlights, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)queryLine
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  GEOSearchCategory *category;
  void *v8;

  if (-[GEOPDAutocompleteEntry hasQuery](self->_entry, "hasQuery")
    && (-[GEOPDAutocompleteEntry query](self->_entry, "query"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "hasCompletion"),
        v3,
        v4))
  {
    -[GEOPDAutocompleteEntry query](self->_entry, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "completion");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray componentsJoinedByString:](self->_displayLines, "componentsJoinedByString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = v5;
      v5 = v6;
    }
    else
    {
      category = self->_category;
      if (!category)
      {
        v8 = 0;
        goto LABEL_9;
      }
      -[GEOSearchCategory displayString](category, "displayString");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = v6;
LABEL_9:

  return v8;
}

- (GEOMapItem)geoMapItem
{
  return self->_mapItem;
}

- (GEOSearchCategory)searchCategory
{
  return self->_category;
}

- (GEOResolvedItem)clientResolved
{
  uint64_t v3;
  void *v4;
  GEOResolvedItem *v5;
  void *v6;
  GEOResolvedItem *v7;

  if (-[GEOPDAutocompleteEntry type](self->_entry, "type") == 6
    && (-[GEOPDAutocompleteEntry clientResolved](self->_entry, "clientResolved"),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    v5 = [GEOResolvedItem alloc];
    -[GEOPDAutocompleteEntry clientResolved](self->_entry, "clientResolved");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOResolvedItem initWithAutocompleteResolvedItem:](v5, "initWithAutocompleteResolvedItem:", v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (GEODirectionIntent)directionIntent
{
  void *v3;
  void *v4;
  GEODirectionIntent *v5;

  if (-[GEOPDAutocompleteEntry type](self->_entry, "type") == 7
    && (-[GEOPDAutocompleteEntry directionIntent](self->_entry, "directionIntent"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "directionIntent"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v4))
  {
    v5 = -[GEODirectionIntent initWithDirectionIntent:]([GEODirectionIntent alloc], "initWithDirectionIntent:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (GEORetainedSearchMetadata)retainedSearchMetadata
{
  void *v3;
  GEORetainedSearchMetadata *v4;
  void *v5;
  GEORetainedSearchMetadata *v6;

  -[GEOPDAutocompleteEntry retainSearch](self->_entry, "retainSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [GEORetainedSearchMetadata alloc];
    -[GEOPDAutocompleteEntry retainSearch](self->_entry, "retainSearch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEORetainedSearchMetadata initWithRetainedSearchMetadata:](v4, "initWithRetainedSearchMetadata:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasSortPriority
{
  return -[GEOPDAutocompleteEntry hasSortPriority](self->_entry, "hasSortPriority");
}

- (int64_t)sortPriority
{
  return -[GEOPDAutocompleteEntry sortPriority](self->_entry, "sortPriority");
}

- (int64_t)entryTapBehavior
{
  void *v2;
  int v3;

  -[GEOPDAutocompleteEntry query](self->_entry, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "tapBehavior");

  return v3 != 0;
}

- (int64_t)autocompleteCellType
{
  uint64_t v2;

  v2 = -[GEOPDAutocompleteEntry autocompleteResultCellType](self->_entry, "autocompleteResultCellType")
     - 1;
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

- (GEOServerResultScoreMetadata)serverResultScoreMetadata
{
  void *v3;
  GEOServerResultScoreMetadata *v4;
  void *v5;
  GEOServerResultScoreMetadata *v6;

  -[GEOPDAutocompleteEntry serverResultScoreMetadata](self->_entry, "serverResultScoreMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [GEOServerResultScoreMetadata alloc];
    -[GEOPDAutocompleteEntry serverResultScoreMetadata](self->_entry, "serverResultScoreMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEOServerResultScoreMetadata initWithGEOServerResultScoreMetadata:](v4, "initWithGEOServerResultScoreMetadata:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasQueryAcceleratorAffordanceEnabled
{
  return -[GEOPDAutocompleteEntry enableQueryAcceleratorAffordance](self->_entry, "enableQueryAcceleratorAffordance");
}

- (NSString)queryAcceleratorCompletionString
{
  return -[GEOPDAutocompleteEntry queryAcceleratorCompletionString](self->_entry, "queryAcceleratorCompletionString");
}

- (BOOL)getCoordinate:(id *)a3
{
  GEOMapItem *mapItem;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  double v15;
  double v16;

  mapItem = self->_mapItem;
  if (mapItem)
  {
    -[GEOMapItem coordinate](mapItem, "coordinate");
    if (v7 >= -180.0 && v7 <= 180.0 && v6 >= -90.0 && v6 <= 90.0)
    {
      if (a3)
      {
        -[GEOMapItem coordinate](self->_mapItem, "coordinate");
        a3->var0 = v8;
        a3->var1 = v9;
      }
LABEL_13:
      LOBYTE(v10) = 1;
      return v10;
    }
  }
  if (-[GEOPDAutocompleteEntry type](self->_entry, "type") != 2)
  {
LABEL_14:
    LOBYTE(v10) = 0;
    return v10;
  }
  v10 = -[GEOPDAutocompleteEntry hasAddress](self->_entry, "hasAddress");
  if (v10)
  {
    -[GEOPDAutocompleteEntry address](self->_entry, "address");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "hasCenter");

    if (v12)
    {
      if (a3)
      {
        -[GEOPDAutocompleteEntry address](self->_entry, "address");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "center");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "coordinate");
        a3->var0 = v15;
        a3->var1 = v16;

      }
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  return v10;
}

- (NSData)entryMetadata
{
  return 0;
}

- (NSData)metadata
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[GEOPDAutocompleteEntry isEqual:](self->_entry, "isEqual:", v4[3]);

  return v5;
}

- (unint64_t)hash
{
  return -[GEOPDAutocompleteEntry hash](self->_entry, "hash");
}

- (GEOPDAutocompleteEntry)_placeDataAutocompleteEntry
{
  return self->_entry;
}

- (int64_t)type
{
  int v2;

  v2 = -[GEOPDAutocompleteEntry type](self->_entry, "type") - 1;
  if (v2 > 8)
    return 0;
  else
    return qword_189CCD520[v2];
}

- (GEOMapItemIdentifier)identifier
{
  return (GEOMapItemIdentifier *)-[GEOMapItem _identifier](self->_mapItem, "_identifier");
}

- (int)placeType
{
  void *v3;
  int v4;

  if (-[GEOPDAutocompleteEntry type](self->_entry, "type") != 2)
    return 0;
  -[GEOPDAutocompleteEntry address](self->_entry, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _MapItemPlaceTypeForPDPlaceType(objc_msgSend(v3, "placeType"));

  return v4;
}

- (BOOL)hasDisambiguationRadiusMeters
{
  void *v3;
  char v4;

  if (-[GEOPDAutocompleteEntry type](self->_entry, "type") != 2)
    return 0;
  -[GEOPDAutocompleteEntry address](self->_entry, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasDisambiguationRadiusMeters");

  return v4;
}

- (float)disambiguationRadiusMeters
{
  float v3;
  void *v4;
  int v5;
  void *v6;
  double v7;

  v3 = 0.0;
  if (-[GEOPDAutocompleteEntry type](self->_entry, "type") == 2)
  {
    -[GEOPDAutocompleteEntry address](self->_entry, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasDisambiguationRadiusMeters");

    if (v5)
    {
      -[GEOPDAutocompleteEntry address](self->_entry, "address");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "disambiguationRadiusMeters");
      v3 = v7;

    }
  }
  return v3;
}

- (GEOCollectionResult)collectionResult
{
  return self->_collectionResult;
}

- (GEOPublisherResult)publisherResult
{
  return self->_publisherResult;
}

- (NSArray)resultRefinements
{
  NSArray *resultRefinements;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;

  resultRefinements = self->_resultRefinements;
  if (!resultRefinements)
  {
    -[GEOPDAutocompleteEntry query](self->_entry, "query");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "resultRefinementsCount");

    if (!v5)
    {
      v10 = 0;
      return v10;
    }
    -[GEOPDAutocompleteEntry query](self->_entry, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resultRefinements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_geo_compactMap:", &__block_literal_global_735);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_resultRefinements;
    self->_resultRefinements = v8;

    resultRefinements = self->_resultRefinements;
  }
  v10 = resultRefinements;
  return v10;
}

- (GEOStyleAttributes)iconStyleAttributes
{
  void *v2;
  void *v3;

  -[GEOPDAutocompleteEntry query](self->_entry, "query");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "styleAttributes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GEOStyleAttributes *)v3;
}

- (NSArray)displayLines
{
  return self->_displayLines;
}

- (GEOPDAutocompleteEntry)entry
{
  return self->_entry;
}

- (BOOL)supportsOfflineDownload
{
  return self->_supportsOfflineDownload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultRefinements, 0);
  objc_storeStrong((id *)&self->_publisherResult, 0);
  objc_storeStrong((id *)&self->_collectionResult, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_lineHighlights, 0);
  objc_storeStrong((id *)&self->_displayLines, 0);
  objc_storeStrong((id *)&self->_entry, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
