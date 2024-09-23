@implementation GEOPDPlaceQuestionnaireLookupParameters

- (void)addPlaceInfo:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 8);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = v5;

      v4 = *(void **)(a1 + 8);
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
  v8.super_class = (Class)GEOPDPlaceQuestionnaireLookupParameters;
  -[GEOPDPlaceQuestionnaireLookupParameters description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceQuestionnaireLookupParameters dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPDPlaceQuestionnaireLookupParameters _dictionaryRepresentation:]((uint64_t)self, 0);
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
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 8), "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 8), "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = *(id *)(a1 + 8);
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v15);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    if (a2)
      v13 = CFSTR("placeInfo");
    else
      v13 = CFSTR("place_info");
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPDPlaceQuestionnaireLookupParameters _dictionaryRepresentation:]((uint64_t)self, 1);
}

- (uint64_t)_initWithDictionary:(int)a3 isJSON:
{
  id v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  GEOPDPlaceQuestionnairePlaceInfo *v16;
  GEOPDPlaceQuestionnairePlaceInfo *v17;
  id v18;
  uint64_t v19;
  void *v20;
  GEOPDMapsIdentifier *v21;
  GEOPDMapsIdentifier *v22;
  GEOPDMapsIdentifier *v23;
  GEOPDMapsIdentifier *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  char v32;
  uint64_t v33;
  void *v35;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (a1 && (v41 = objc_msgSend(a1, "init")) != 0)
  {
    if (a3)
      v5 = CFSTR("placeInfo");
    else
      v5 = CFSTR("place_info");
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v35 = v6;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v6;
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v44;
        if (a3)
          v10 = CFSTR("mapsId");
        else
          v10 = CFSTR("maps_id");
        v11 = CFSTR("mapsCategoryId");
        if (!a3)
          v11 = CFSTR("maps_category_id");
        v39 = v11;
        v40 = v10;
        v12 = CFSTR("country_code");
        if (a3)
          v12 = CFSTR("countryCode");
        v38 = v12;
        if (a3)
          v13 = CFSTR("hasRichData");
        else
          v13 = CFSTR("has_rich_data");
        v37 = v13;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v44 != v9)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = [GEOPDPlaceQuestionnairePlaceInfo alloc];
              if (v16)
              {
                v17 = v16;
                v18 = v15;
                v19 = -[GEOPDPlaceQuestionnairePlaceInfo init](v17, "init");
                if (v19)
                {
                  objc_msgSend(v18, "objectForKeyedSubscript:", v40);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v21 = [GEOPDMapsIdentifier alloc];
                    if ((a3 & 1) != 0)
                      v22 = -[GEOPDMapsIdentifier initWithJSON:](v21, "initWithJSON:", v20);
                    else
                      v22 = -[GEOPDMapsIdentifier initWithDictionary:](v21, "initWithDictionary:", v20);
                    v23 = v22;
                    v24 = v22;
                    *(_BYTE *)(v19 + 56) |= 8u;
                    *(_BYTE *)(v19 + 56) |= 0x10u;
                    objc_storeStrong((id *)(v19 + 32), v23);

                  }
                  objc_msgSend(v18, "objectForKeyedSubscript:", v39);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v26 = (void *)objc_msgSend(v25, "copy");
                    v27 = v26;
                    *(_BYTE *)(v19 + 56) |= 4u;
                    *(_BYTE *)(v19 + 56) |= 0x10u;
                    objc_storeStrong((id *)(v19 + 24), v26);

                  }
                  objc_msgSend(v18, "objectForKeyedSubscript:", v38);
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v29 = (void *)objc_msgSend(v28, "copy");
                    v30 = v29;
                    *(_BYTE *)(v19 + 56) |= 2u;
                    *(_BYTE *)(v19 + 56) |= 0x10u;
                    objc_storeStrong((id *)(v19 + 16), v29);

                  }
                  objc_msgSend(v18, "objectForKeyedSubscript:", v37);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v32 = objc_msgSend(v31, "BOOLValue");
                    *(_BYTE *)(v19 + 56) |= 0x10u;
                    *(_BYTE *)(v19 + 56) |= 1u;
                    *(_BYTE *)(v19 + 52) = v32;
                  }

                }
              }
              else
              {
                v19 = 0;
              }
              -[GEOPDPlaceQuestionnaireLookupParameters addPlaceInfo:](v41, (void *)v19);

            }
            ++v14;
          }
          while (v8 != v14);
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          v8 = v33;
        }
        while (v33);
      }

      v6 = v35;
    }

  }
  else
  {
    v41 = 0;
  }

  return v41;
}

- (BOOL)readFrom:(id)a3
{
  return GEOPDPlaceQuestionnaireLookupParametersReadAllFrom((uint64_t)self, a3, 0);
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
  v5 = self->_placeInfos;
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

}

- (uint64_t)hasGreenTeaWithValue:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = *(id *)(a1 + 8);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7);
        if (v8)
        {
          -[GEOPDPlaceQuestionnairePlaceInfo _readMapsId](*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
          if ((objc_msgSend(*(id *)(v8 + 32), "hasGreenTeaWithValue:", a2, (_QWORD)v11) & 1) != 0)
          {
            v9 = 1;
            goto LABEL_13;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
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
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_placeInfos;
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
        -[GEOPDPlaceQuestionnaireLookupParameters addPlaceInfo:]((uint64_t)v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSMutableArray *placeInfos;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    placeInfos = self->_placeInfos;
    if ((unint64_t)placeInfos | v4[1])
      v6 = -[NSMutableArray isEqual:](placeInfos, "isEqual:");
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
  return -[NSMutableArray hash](self->_placeInfos, "hash");
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
    v3 = *(id *)(a2 + 8);
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
          -[GEOPDPlaceQuestionnaireLookupParameters addPlaceInfo:](a1, *(void **)(*((_QWORD *)&v8 + 1) + 8 * v7++));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInfos, 0);
}

@end
