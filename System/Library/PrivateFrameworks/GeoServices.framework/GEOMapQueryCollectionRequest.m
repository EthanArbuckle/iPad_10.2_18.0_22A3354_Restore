@implementation GEOMapQueryCollectionRequest

- (NSMutableArray)requestElements
{
  return self->_requestElements;
}

- (void)setRequestElements:(id)a3
{
  objc_storeStrong((id *)&self->_requestElements, a3);
}

- (void)clearRequestElements
{
  -[NSMutableArray removeAllObjects](self->_requestElements, "removeAllObjects");
}

- (void)addRequestElements:(id)a3
{
  id v4;
  NSMutableArray *requestElements;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  requestElements = self->_requestElements;
  v8 = v4;
  if (!requestElements)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_requestElements;
    self->_requestElements = v6;

    v4 = v8;
    requestElements = self->_requestElements;
  }
  -[NSMutableArray addObject:](requestElements, "addObject:", v4);

}

- (unint64_t)requestElementsCount
{
  return -[NSMutableArray count](self->_requestElements, "count");
}

- (id)requestElementsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_requestElements, "objectAtIndex:", a3);
}

+ (Class)requestElementsType
{
  return (Class)objc_opt_class();
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
  v8.super_class = (Class)GEOMapQueryCollectionRequest;
  -[GEOMapQueryCollectionRequest description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapQueryCollectionRequest dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOMapQueryCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 0);
}

- (id)_dictionaryRepresentation:(id *)a1
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[1], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = a1[1];
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((a2 & 1) != 0)
            objc_msgSend(v11, "jsonRepresentation");
          else
            objc_msgSend(v11, "dictionaryRepresentation", (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v12, (_QWORD)v14);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v8);
    }

    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("requestElements"));
  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOMapQueryCollectionRequest _dictionaryRepresentation:]((id *)&self->super.super.super.isa, 1);
}

- (GEOMapQueryCollectionRequest)initWithDictionary:(id)a3
{
  return (GEOMapQueryCollectionRequest *)-[GEOMapQueryCollectionRequest _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(char)a3 isJSON:
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  GEOMapQuery *v11;
  GEOMapQuery *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  id v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  GEOMapRegion *v43;
  GEOMapRegion *v44;
  GEOMapRegion *v45;
  GEOMapRegion *v46;
  void *v47;
  GEOLocation *v48;
  GEOLocation *v49;
  GEOLocation *v50;
  void *v51;
  void *v52;
  GEOPlaceSearchRequest *v53;
  GEOPlaceSearchRequest *v54;
  GEOPlaceSearchRequest *v55;
  uint64_t v56;
  void *v58;
  void *v60;
  id obj;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1 || (v60 = (void *)objc_msgSend(a1, "init")) == 0)
  {
    v60 = 0;
    goto LABEL_81;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("requestElements"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_79;
  v58 = v5;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
  if (!v6)
    goto LABEL_78;
  v7 = v6;
  v8 = *(_QWORD *)v63;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v63 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = [GEOMapQuery alloc];
        if (v11)
        {
          v12 = v11;
          v13 = v10;
          v14 = -[GEOMapQuery init](v12, "init");
          if (v14)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("query"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = (void *)objc_msgSend(v15, "copy");
              v17 = v16;
              *(_DWORD *)(v14 + 120) |= 0x4000u;
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              objc_storeStrong((id *)(v14 + 48), v16);

            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("requestType"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = v18;
              if ((objc_msgSend(v19, "isEqualToString:", CFSTR("SEARCH_REQUEST_TYPE")) & 1) != 0)
              {
                v20 = 1;
              }
              else if (objc_msgSend(v19, "isEqualToString:", CFSTR("GEOCODE_REQUEST_TYPE")))
              {
                v20 = 2;
              }
              else
              {
                v20 = 1;
              }

LABEL_23:
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x100u;
              *(_DWORD *)(v14 + 104) = v20;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v20 = objc_msgSend(v18, "intValue");
                goto LABEL_23;
              }
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mapCenterX"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = objc_msgSend(v21, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x10u;
              *(_DWORD *)(v14 + 88) = v22;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mapCenterY"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v24 = objc_msgSend(v23, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x20u;
              *(_DWORD *)(v14 + 92) = v24;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mapSpanX"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v26 = objc_msgSend(v25, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x40u;
              *(_DWORD *)(v14 + 96) = v26;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mapSpanY"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v28 = objc_msgSend(v27, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x80u;
              *(_DWORD *)(v14 + 100) = v28;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("zoomlevel"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v30 = objc_msgSend(v29, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x800u;
              *(_DWORD *)(v14 + 116) = v30;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clientImgFmt"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v32 = v31;
              if ((objc_msgSend(v32, "isEqualToString:", CFSTR("PNG")) & 1) != 0)
              {
                v33 = 0;
              }
              else if ((objc_msgSend(v32, "isEqualToString:", CFSTR("GIF")) & 1) != 0)
              {
                v33 = 1;
              }
              else if (objc_msgSend(v32, "isEqualToString:", CFSTR("JPEG")))
              {
                v33 = 2;
              }
              else
              {
                v33 = 0;
              }

LABEL_45:
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 2u;
              *(_DWORD *)(v14 + 76) = v33;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v33 = objc_msgSend(v31, "intValue");
                goto LABEL_45;
              }
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("tilesizeX"));
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v35 = objc_msgSend(v34, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x200u;
              *(_DWORD *)(v14 + 108) = v35;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("tilesizeY"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v37 = objc_msgSend(v36, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 0x400u;
              *(_DWORD *)(v14 + 112) = v37;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clientImgMaxWidth"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v39 = objc_msgSend(v38, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 8u;
              *(_DWORD *)(v14 + 84) = v39;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("clientImgMaxHeight"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v41 = objc_msgSend(v40, "intValue");
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 4u;
              *(_DWORD *)(v14 + 80) = v41;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("mapRegion"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v43 = [GEOMapRegion alloc];
              if ((a3 & 1) != 0)
                v44 = -[GEOMapRegion initWithJSON:](v43, "initWithJSON:", v42);
              else
                v44 = -[GEOMapRegion initWithDictionary:](v43, "initWithDictionary:", v42);
              v45 = v44;
              v46 = v44;
              *(_DWORD *)(v14 + 120) |= 0x1000u;
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              objc_storeStrong((id *)(v14 + 32), v45);

            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("userLocation"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v48 = [GEOLocation alloc];
              if ((a3 & 1) != 0)
                v49 = -[GEOLocation initWithJSON:](v48, "initWithJSON:", v47);
              else
                v49 = -[GEOLocation initWithDictionary:](v48, "initWithDictionary:", v47);
              v50 = v49;
              -[GEOMapQuery setUserLocation:](v14, v49);

            }
            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("sessionID"));
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v66 = 0uLL;
              _GEOSessionIDFromDictionaryRepresentation(v51, &v66);
              *(_DWORD *)(v14 + 120) |= 0x10000u;
              *(_DWORD *)(v14 + 120) |= 1u;
              *(_OWORD *)(v14 + 16) = v66;
            }

            objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("placeSearchRequest"));
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v53 = [GEOPlaceSearchRequest alloc];
              if ((a3 & 1) != 0)
                v54 = -[GEOPlaceSearchRequest initWithJSON:](v53, "initWithJSON:", v52);
              else
                v54 = -[GEOPlaceSearchRequest initWithDictionary:](v53, "initWithDictionary:", v52);
              v55 = v54;
              -[GEOMapQuery setPlaceSearchRequest:](v14, v54);

            }
          }

        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(v60, "addRequestElements:", v14);

      }
      ++v9;
    }
    while (v7 != v9);
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v67, 16);
    v7 = v56;
  }
  while (v56);
LABEL_78:

  v5 = v58;
LABEL_79:

LABEL_81:
  return v60;
}

- (GEOMapQueryCollectionRequest)initWithJSON:(id)a3
{
  return (GEOMapQueryCollectionRequest *)-[GEOMapQueryCollectionRequest _initWithDictionary:isJSON:](self, a3, 1);
}

+ (BOOL)isValid:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  int v16;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  int v25;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  int v31;
  BOOL v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  int v37;
  unsigned int v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int v42;
  unsigned int v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  int v52;
  unsigned int v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  int v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  int v62;
  unsigned int v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  int v67;
  unsigned int v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  unsigned int v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  int v77;
  unsigned int v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  int v82;
  int v83;
  BOOL v84;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v7 = (int *)MEMORY[0x1E0D82BB8];
    do
    {
      if (*((_BYTE *)a3 + *v6))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v4;
        v12 = *(_QWORD *)((char *)a3 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v12);
        *(_QWORD *)((char *)a3 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v15 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v10 = 0;
LABEL_14:
      v16 = v10 & 7;
      if (v15 || v16 == 4)
        break;
      if ((v10 >> 3) == 2)
      {
        if (v16 != 2 || !PBReaderPlaceMark())
          goto LABEL_154;
        objc_msgSend(a3, "position", 0, 0);
        objc_msgSend(a3, "length");
LABEL_22:
        while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5) && !*((_BYTE *)a3 + *v6))
        {
          v18 = 0;
          v19 = 0;
          v20 = 0;
          while (1)
          {
            v21 = *v4;
            v22 = *(_QWORD *)((char *)a3 + v21);
            if (v22 == -1 || v22 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v23 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v22);
            *(_QWORD *)((char *)a3 + v21) = v22 + 1;
            v20 |= (unint64_t)(v23 & 0x7F) << v18;
            if ((v23 & 0x80) == 0)
              goto LABEL_32;
            v18 += 7;
            v14 = v19++ >= 9;
            if (v14)
            {
              v20 = 0;
              v24 = *((unsigned __int8 *)a3 + *v6);
              goto LABEL_34;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_32:
          v24 = *((unsigned __int8 *)a3 + *v6);
          if (*((_BYTE *)a3 + *v6))
            v20 = 0;
LABEL_34:
          v25 = v20 & 7;
          if (v24 || v25 == 4)
            break;
          switch((v20 >> 3))
          {
            case 1u:
              if (v25 != 2)
                goto LABEL_153;
              goto LABEL_40;
            case 2u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v27 = 0;
              while (1)
              {
                v28 = *v4;
                v29 = *(_QWORD *)((char *)a3 + v28);
                if (v29 == -1 || v29 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v30 = v29 + 1;
                v31 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v29);
                *(_QWORD *)((char *)a3 + v28) = v30;
                if (v31 < 0)
                {
                  v32 = v27++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 3u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v33 = 0;
              while (1)
              {
                v34 = *v4;
                v35 = *(_QWORD *)((char *)a3 + v34);
                if (v35 == -1 || v35 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v36 = v35 + 1;
                v37 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v35);
                *(_QWORD *)((char *)a3 + v34) = v36;
                if (v37 < 0)
                {
                  v32 = v33++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 4u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v38 = 0;
              while (1)
              {
                v39 = *v4;
                v40 = *(_QWORD *)((char *)a3 + v39);
                if (v40 == -1 || v40 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v41 = v40 + 1;
                v42 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v40);
                *(_QWORD *)((char *)a3 + v39) = v41;
                if (v42 < 0)
                {
                  v32 = v38++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 5u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v43 = 0;
              while (1)
              {
                v44 = *v4;
                v45 = *(_QWORD *)((char *)a3 + v44);
                if (v45 == -1 || v45 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v46 = v45 + 1;
                v47 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v45);
                *(_QWORD *)((char *)a3 + v44) = v46;
                if (v47 < 0)
                {
                  v32 = v43++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 6u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v48 = 0;
              while (1)
              {
                v49 = *v4;
                v50 = *(_QWORD *)((char *)a3 + v49);
                if (v50 == -1 || v50 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v51 = v50 + 1;
                v52 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v50);
                *(_QWORD *)((char *)a3 + v49) = v51;
                if (v52 < 0)
                {
                  v32 = v48++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 7u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v53 = 0;
              while (1)
              {
                v54 = *v4;
                v55 = *(_QWORD *)((char *)a3 + v54);
                if (v55 == -1 || v55 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v56 = v55 + 1;
                v57 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v55);
                *(_QWORD *)((char *)a3 + v54) = v56;
                if (v57 < 0)
                {
                  v32 = v53++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 8u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v58 = 0;
              while (1)
              {
                v59 = *v4;
                v60 = *(_QWORD *)((char *)a3 + v59);
                if (v60 == -1 || v60 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v61 = v60 + 1;
                v62 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v60);
                *(_QWORD *)((char *)a3 + v59) = v61;
                if (v62 < 0)
                {
                  v32 = v58++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 9u:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v63 = 0;
              while (1)
              {
                v64 = *v4;
                v65 = *(_QWORD *)((char *)a3 + v64);
                if (v65 == -1 || v65 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v66 = v65 + 1;
                v67 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v65);
                *(_QWORD *)((char *)a3 + v64) = v66;
                if (v67 < 0)
                {
                  v32 = v63++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 0xAu:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v68 = 0;
              while (1)
              {
                v69 = *v4;
                v70 = *(_QWORD *)((char *)a3 + v69);
                if (v70 == -1 || v70 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v71 = v70 + 1;
                v72 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v70);
                *(_QWORD *)((char *)a3 + v69) = v71;
                if (v72 < 0)
                {
                  v32 = v68++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 0xBu:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v73 = 0;
              while (1)
              {
                v74 = *v4;
                v75 = *(_QWORD *)((char *)a3 + v74);
                if (v75 == -1 || v75 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_130;
                v76 = v75 + 1;
                v77 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v75);
                *(_QWORD *)((char *)a3 + v74) = v76;
                if (v77 < 0)
                {
                  v32 = v73++ > 8;
                  if (!v32)
                    continue;
                }
                goto LABEL_22;
              }
            case 0xCu:
              if ((v20 & 7) != 0)
                goto LABEL_153;
              v78 = 0;
              break;
            case 0xDu:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOMapRegionIsValid((char *)a3))
                goto LABEL_153;
              goto LABEL_146;
            case 0xEu:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOLocationIsValid((char *)a3))
                goto LABEL_153;
              goto LABEL_146;
            case 0xFu:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOSessionIDIsValid(a3))
                goto LABEL_153;
              goto LABEL_146;
            case 0x10u:
              if (v25 != 2 || !PBReaderPlaceMark() || !GEOPlaceSearchRequestIsValid((char *)a3))
                goto LABEL_153;
LABEL_146:
              PBReaderRecallMark();
              continue;
            default:
LABEL_40:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                continue;
LABEL_153:
              PBReaderRecallMark();
              goto LABEL_154;
          }
          while (1)
          {
            v79 = *v4;
            v80 = *(_QWORD *)((char *)a3 + v79);
            if (v80 == -1 || v80 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v81 = v80 + 1;
            v82 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v80);
            *(_QWORD *)((char *)a3 + v79) = v81;
            if (v82 < 0)
            {
              v32 = v78++ > 8;
              if (!v32)
                continue;
            }
            goto LABEL_22;
          }
LABEL_130:
          *((_BYTE *)a3 + *v6) = 1;
        }
        v83 = *((unsigned __int8 *)a3 + *v6);
        PBReaderRecallMark();
        if (v83)
        {
LABEL_154:
          PBReaderRecallMark();
          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        goto LABEL_154;
      }
    }
    while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
  }
  v84 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v84;
}

- (BOOL)readFrom:(id)a3
{
  char *v4;
  int *v5;
  int *v6;
  int *v7;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  int v16;
  GEOMapQuery *v18;
  BOOL v19;

  v4 = (char *)a3;
  objc_sync_enter(v4);
  if (v4)
  {
    v5 = (int *)MEMORY[0x1E0D82BF0];
    v6 = (int *)MEMORY[0x1E0D82BD8];
    v7 = (int *)MEMORY[0x1E0D82BC8];
    if (*(_QWORD *)&v4[*MEMORY[0x1E0D82BF0]] < *(_QWORD *)&v4[*MEMORY[0x1E0D82BD8]])
    {
      v8 = (int *)MEMORY[0x1E0D82BB8];
      do
      {
        if (v4[*v7])
          break;
        v9 = 0;
        v10 = 0;
        v11 = 0;
        while (1)
        {
          v12 = *v5;
          v13 = *(_QWORD *)&v4[v12];
          if (v13 == -1 || v13 >= *(_QWORD *)&v4[*v6])
            break;
          v14 = *(_BYTE *)(*(_QWORD *)&v4[*v8] + v13);
          *(_QWORD *)&v4[v12] = v13 + 1;
          v11 |= (unint64_t)(v14 & 0x7F) << v9;
          if ((v14 & 0x80) == 0)
            goto LABEL_13;
          v9 += 7;
          if (v10++ >= 9)
          {
            v11 = 0;
            v16 = v4[*v7];
            goto LABEL_15;
          }
        }
        v4[*v7] = 1;
LABEL_13:
        v16 = v4[*v7];
        if (v4[*v7])
          v11 = 0;
LABEL_15:
        if (v16 || (v11 & 7) == 4)
          break;
        if ((v11 >> 3) == 2)
        {
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_27;
          v18 = objc_alloc_init(GEOMapQuery);
          if (!GEOMapQueryReadAllFrom((uint64_t)v18, v4))
          {

            goto LABEL_27;
          }
          PBReaderRecallMark();
          -[GEOMapQueryCollectionRequest addRequestElements:](self, "addRequestElements:", v18, 0, 0);

        }
        else if (!PBReaderSkipValueWithTag())
        {
          goto LABEL_27;
        }
      }
      while (*(_QWORD *)&v4[*v5] < *(_QWORD *)&v4[*v6]);
    }
    v19 = v4[*v7] == 0;
  }
  else
  {
LABEL_27:
    v19 = 0;
  }
  objc_sync_exit(v4);

  return v19;
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
  v5 = self->_requestElements;
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

- (void)clearSensitiveFields:(unint64_t)a3
{
  unint64_t i;
  id *v6;
  id *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;

  if (-[NSMutableArray count](self->_requestElements, "count"))
  {
    for (i = 0; i < -[NSMutableArray count](self->_requestElements, "count"); ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_requestElements, "objectAtIndexedSubscript:", i);
      v6 = (id *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        -[GEOMapQuery userLocation](v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (GEOLocationHasSensitiveFields((uint64_t)v8))
        {

        }
        else
        {
          -[GEOMapQuery placeSearchRequest](v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = GEOPlaceSearchRequestHasSensitiveFields(v9);

          if (!v10)
          {
            GEOMapQueryClearSensitiveFields((uint64_t)v7, a3, 1);
            goto LABEL_9;
          }
        }
        v11 = (void *)objc_msgSend(v7, "copy");
        GEOMapQueryClearSensitiveFields((uint64_t)v11, a3, 0);
        -[NSMutableArray replaceObjectAtIndex:withObject:](self->_requestElements, "replaceObjectAtIndex:withObject:", i, v11);

      }
LABEL_9:

    }
  }
}

- (BOOL)hasGreenTeaWithValue:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_requestElements;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(id **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v9)
        {
          -[GEOMapQuery _readMapRegion](*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
          if ((objc_msgSend(v9[4], "hasGreenTeaWithValue:", v3, (_QWORD)v12) & 1) != 0
            || (-[GEOMapQuery _readPlaceSearchRequest]((uint64_t)v9),
                (objc_msgSend(v9[5], "hasGreenTeaWithValue:", v3) & 1) != 0)
            || (-[GEOMapQuery _readUserLocation]((uint64_t)v9),
                (objc_msgSend(v9[7], "hasGreenTeaWithValue:", v3) & 1) != 0))
          {
            v10 = 1;
            goto LABEL_15;
          }
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (unsigned)requestTypeCode
{
  return 1001;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  -[GEOMapQueryCollectionRequest readAll:](self, "readAll:", 0);
  if (-[GEOMapQueryCollectionRequest requestElementsCount](self, "requestElementsCount"))
  {
    objc_msgSend(v8, "clearRequestElements");
    v4 = -[GEOMapQueryCollectionRequest requestElementsCount](self, "requestElementsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOMapQueryCollectionRequest requestElementsAtIndex:](self, "requestElementsAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addRequestElements:", v7);

      }
    }
  }

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
  v6 = self->_requestElements;
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
        objc_msgSend(v5, "addRequestElements:", v11);

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
  char v5;
  NSMutableArray *requestElements;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOMapQueryCollectionRequest readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    requestElements = self->_requestElements;
    if ((unint64_t)requestElements | v4[1])
      v5 = -[NSMutableArray isEqual:](requestElements, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOMapQueryCollectionRequest readAll:](self, "readAll:", 1);
  return -[NSMutableArray hash](self->_requestElements, "hash");
}

- (void)mergeFrom:(id)a3
{
  id *v4;
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
  v4 = (id *)a3;
  objc_msgSend(v4, "readAll:", 0);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v4[1];
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
        -[GEOMapQueryCollectionRequest addRequestElements:](self, "addRequestElements:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestElements, 0);
}

@end
