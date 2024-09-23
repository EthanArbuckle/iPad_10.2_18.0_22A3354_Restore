@implementation GEOPDSearchSectionList

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = *(id *)(a1 + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if ((-[GEOPDSearchSection hasGreenTeaWithValue:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7), a2) & 1) != 0)
        {
          v8 = 1;
          goto LABEL_12;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (void)mergeFrom:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(a2 + 16);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          -[GEOPDSearchSectionList addSection:](a1, *(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
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
    v4 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    if (a2)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v5 = *(id *)(a1 + 16);
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
            -[GEOPDSearchSection clearUnknownFields:](*(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 1);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (id)sections
{
  if (a1)
    a1 = (id *)a1[2];
  return a1;
}

- (void)addSection:(uint64_t)a1
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
  v8.super_class = (Class)GEOPDSearchSectionList;
  -[GEOPDSearchSectionList description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDSearchSectionList dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDSearchSectionList _dictionaryRepresentation:]((uint64_t)self, 0);
}

- (id)_dictionaryRepresentation:(uint64_t)a1
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 16), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = *(id *)(a1 + 16);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("section"));
  }
  v13 = *(void **)(a1 + 8);
  if (v13)
  {
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v14, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__GEOPDSearchSectionList__dictionaryRepresentation___block_invoke;
      v20[3] = &unk_1E1C00600;
      v17 = v16;
      v21 = v17;
      objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v20);
      v18 = v17;

      v15 = v18;
    }
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDSearchSectionList _dictionaryRepresentation:]((uint64_t)self, 1);
}

void __52__GEOPDSearchSectionList__dictionaryRepresentation___block_invoke(uint64_t a1, void *a2, void *a3)
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
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  GEOPDSearchSection *v22;
  GEOPDSearchSection *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  int v31;
  void *v32;
  GEOPDSearchSectionPlace *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  GEOPDMapsIdentifier *v42;
  GEOPDMapsIdentifier *v43;
  GEOPDMapsIdentifier *v44;
  GEOPDSearchSectionPlace *v45;
  void *v46;
  GEOPDSearchSectionGuide *v47;
  id v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t j;
  uint64_t v55;
  GEOPDMapsIdentifier *v56;
  GEOPDMapsIdentifier *v57;
  GEOPDMapsIdentifier *v58;
  GEOPDSearchSectionGuide *v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  id v65;
  int v66;
  uint64_t v67;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  const __CFString *v75;
  const __CFString *v76;
  id v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
  {
    v6 = 0;
    goto LABEL_122;
  }
  v6 = objc_msgSend(a1, "init");
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("section"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_121;
    v69 = v7;
    v70 = v5;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
    if (!v9)
      goto LABEL_120;
    v10 = v9;
    v11 = *(_QWORD *)v92;
    if (a3)
      v12 = CFSTR("sectionType");
    else
      v12 = CFSTR("section_type");
    v13 = CFSTR("section_place");
    if (a3)
      v13 = CFSTR("sectionPlace");
    v85 = v13;
    v86 = v12;
    v14 = CFSTR("placeId");
    if (!a3)
      v14 = CFSTR("place_id");
    v76 = v14;
    v15 = CFSTR("section_guide");
    if (a3)
      v15 = CFSTR("sectionGuide");
    v84 = v15;
    if (a3)
      v16 = CFSTR("guideId");
    else
      v16 = CFSTR("guide_id");
    v75 = v16;
    if (a3)
      v17 = CFSTR("sectionIdentifier");
    else
      v17 = CFSTR("section_identifier");
    v18 = CFSTR("section_rank");
    if (a3)
      v18 = CFSTR("sectionRank");
    v82 = v18;
    v83 = v17;
    v19 = CFSTR("content_type");
    if (a3)
      v19 = CFSTR("contentType");
    v81 = v19;
    v77 = v8;
    v78 = v6;
    v87 = *(_QWORD *)v92;
    while (1)
    {
      v20 = 0;
      v88 = v10;
      do
      {
        if (*(_QWORD *)v92 != v11)
          objc_enumerationMutation(v8);
        v21 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * v20);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v90 = v20;
          v22 = [GEOPDSearchSection alloc];
          if (v22)
          {
            v23 = v22;
            v24 = v21;
            v25 = -[GEOPDSearchSection init](v23, "init");
            if (v25)
            {
              objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("name"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v89 = v24;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v27 = (void *)objc_msgSend(v26, "copy");
                v28 = v27;
                *(_WORD *)(v25 + 76) |= 0x20u;
                *(_WORD *)(v25 + 76) |= 0x100u;
                objc_storeStrong((id *)(v25 + 24), v27);

                v24 = v89;
              }

              objc_msgSend(v24, "objectForKeyedSubscript:", v86);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v30 = v29;
                if ((objc_msgSend(v30, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v31 = 0;
                }
                else if ((objc_msgSend(v30, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_PLACE")) & 1) != 0)
                {
                  v31 = 1;
                }
                else if (objc_msgSend(v30, "isEqualToString:", CFSTR("SEARCH_SECTION_TYPE_GUIDE")))
                {
                  v31 = 2;
                }
                else
                {
                  v31 = 0;
                }

LABEL_44:
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 8u;
                *(_DWORD *)(v25 + 72) = v31;
                v24 = v89;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v31 = objc_msgSend(v29, "intValue");
                  goto LABEL_44;
                }
              }

              objc_msgSend(v24, "objectForKeyedSubscript:", v85);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = [GEOPDSearchSectionPlace alloc];
                v79 = v32;
                if (v33)
                {
                  v34 = v32;
                  v33 = -[GEOPDSearchSectionPlace init](v33, "init");
                  if (v33)
                  {
                    objc_msgSend(v34, "objectForKeyedSubscript:", v76);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v71 = v35;
                      v73 = v34;
                      v97 = 0u;
                      v98 = 0u;
                      v95 = 0u;
                      v96 = 0u;
                      v36 = v35;
                      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
                      if (v37)
                      {
                        v38 = v37;
                        v39 = *(_QWORD *)v96;
                        do
                        {
                          for (i = 0; i != v38; ++i)
                          {
                            if (*(_QWORD *)v96 != v39)
                              objc_enumerationMutation(v36);
                            v41 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * i);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v42 = [GEOPDMapsIdentifier alloc];
                              if ((a3 & 1) != 0)
                                v43 = -[GEOPDMapsIdentifier initWithJSON:](v42, "initWithJSON:", v41);
                              else
                                v43 = -[GEOPDMapsIdentifier initWithDictionary:](v42, "initWithDictionary:", v41);
                              v44 = v43;
                              -[GEOPDSearchSectionPlace addPlaceId:]((uint64_t)v33, v43);

                            }
                          }
                          v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
                        }
                        while (v38);
                      }

                      v8 = v77;
                      v6 = v78;
                      v24 = v89;
                      v35 = v71;
                      v34 = v73;
                    }

                  }
                }
                v45 = v33;
                *(_WORD *)(v25 + 76) |= 0x80u;
                *(_WORD *)(v25 + 76) |= 0x100u;
                objc_storeStrong((id *)(v25 + 40), v33);

                v32 = v79;
              }

              objc_msgSend(v24, "objectForKeyedSubscript:", v84);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v47 = [GEOPDSearchSectionGuide alloc];
                v80 = v46;
                if (v47)
                {
                  v48 = v46;
                  v47 = -[GEOPDSearchSectionGuide init](v47, "init");
                  if (v47)
                  {
                    objc_msgSend(v48, "objectForKeyedSubscript:", v75);
                    v49 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v72 = v49;
                      v74 = v48;
                      v97 = 0u;
                      v98 = 0u;
                      v95 = 0u;
                      v96 = 0u;
                      v50 = v49;
                      v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
                      if (v51)
                      {
                        v52 = v51;
                        v53 = *(_QWORD *)v96;
                        do
                        {
                          for (j = 0; j != v52; ++j)
                          {
                            if (*(_QWORD *)v96 != v53)
                              objc_enumerationMutation(v50);
                            v55 = *(_QWORD *)(*((_QWORD *)&v95 + 1) + 8 * j);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v56 = [GEOPDMapsIdentifier alloc];
                              if ((a3 & 1) != 0)
                                v57 = -[GEOPDMapsIdentifier initWithJSON:](v56, "initWithJSON:", v55);
                              else
                                v57 = -[GEOPDMapsIdentifier initWithDictionary:](v56, "initWithDictionary:", v55);
                              v58 = v57;
                              -[GEOPDSearchSectionGuide addGuideId:]((uint64_t)v47, v57);

                            }
                          }
                          v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v95, v100, 16);
                        }
                        while (v52);
                      }

                      v8 = v77;
                      v6 = v78;
                      v24 = v89;
                      v49 = v72;
                      v48 = v74;
                    }

                  }
                }
                v59 = v47;
                *(_WORD *)(v25 + 76) |= 0x40u;
                *(_WORD *)(v25 + 76) |= 0x100u;
                objc_storeStrong((id *)(v25 + 32), v47);

                v46 = v80;
              }

              objc_msgSend(v24, "objectForKeyedSubscript:", v83);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v61 = objc_msgSend(v60, "unsignedIntValue");
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 2u;
                *(_DWORD *)(v25 + 64) = v61;
              }

              objc_msgSend(v24, "objectForKeyedSubscript:", v82);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v63 = objc_msgSend(v62, "unsignedIntValue");
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 4u;
                *(_DWORD *)(v25 + 68) = v63;
              }

              objc_msgSend(v24, "objectForKeyedSubscript:", v81);
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v65 = v64;
                if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_UNKNOWN")) & 1) != 0)
                {
                  v66 = 0;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_PRIMARY")) & 1) != 0)
                {
                  v66 = 1;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_ALTERNATE")) & 1) != 0)
                {
                  v66 = 2;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_PARTIAL_MATCHES")) & 1) != 0)
                {
                  v66 = 3;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_NONE_MATCHES")) & 1) != 0)
                {
                  v66 = 4;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_KEYWORD_MATCHES")) & 1) != 0)
                {
                  v66 = 5;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_DYM")) & 1) != 0)
                {
                  v66 = 6;
                }
                else if ((objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_NAME_FALLBACK")) & 1) != 0)
                {
                  v66 = 7;
                }
                else if (objc_msgSend(v65, "isEqualToString:", CFSTR("SEARCH_SECTION_CONTENT_TYPE_CATEGORY_FALLBACK")))
                {
                  v66 = 8;
                }
                else
                {
                  v66 = 0;
                }

                v24 = v89;
LABEL_112:
                *(_WORD *)(v25 + 76) |= 0x100u;
                *(_WORD *)(v25 + 76) |= 1u;
                *(_DWORD *)(v25 + 60) = v66;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v66 = objc_msgSend(v64, "intValue");
                  goto LABEL_112;
                }
              }

            }
          }
          else
          {
            v25 = 0;
          }
          -[GEOPDSearchSectionList addSection:](v6, (void *)v25);

          v11 = v87;
          v10 = v88;
          v20 = v90;
        }
        ++v20;
      }
      while (v20 != v10);
      v67 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v91, v99, 16);
      v10 = v67;
      if (!v67)
      {
LABEL_120:

        v7 = v69;
        v5 = v70;
LABEL_121:

        break;
      }
    }
  }
LABEL_122:

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDSearchSectionListReadAllFrom((uint64_t)self, a3, 0);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
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
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4, v10);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_sections;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (_QWORD)v13);
        -[GEOPDSearchSectionList addSection:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_storeStrong(v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *sections;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    sections = self->_sections;
    if ((unint64_t)sections | v4[2])
      v6 = -[NSMutableArray isEqual:](sections, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[NSMutableArray hash](self->_sections, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
