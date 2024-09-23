@implementation GEOPBOfflineDataBatchesResponse

- (NSMutableArray)layerBatchs
{
  return self->_layerBatchs;
}

- (void)setLayerBatchs:(id)a3
{
  objc_storeStrong((id *)&self->_layerBatchs, a3);
}

- (void)clearLayerBatchs
{
  -[NSMutableArray removeAllObjects](self->_layerBatchs, "removeAllObjects");
}

- (void)addLayerBatch:(id)a3
{
  id v4;
  NSMutableArray *layerBatchs;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  layerBatchs = self->_layerBatchs;
  v8 = v4;
  if (!layerBatchs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_layerBatchs;
    self->_layerBatchs = v6;

    v4 = v8;
    layerBatchs = self->_layerBatchs;
  }
  -[NSMutableArray addObject:](layerBatchs, "addObject:", v4);

}

- (unint64_t)layerBatchsCount
{
  return -[NSMutableArray count](self->_layerBatchs, "count");
}

- (id)layerBatchAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_layerBatchs, "objectAtIndex:", a3);
}

+ (Class)layerBatchType
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
  v8.super_class = (Class)GEOPBOfflineDataBatchesResponse;
  -[GEOPBOfflineDataBatchesResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPBOfflineDataBatchesResponse dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  return -[GEOPBOfflineDataBatchesResponse _dictionaryRepresentation:]((id *)&self->super.super.isa, 0);
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
  objc_msgSend(a1, "readAll:", 1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[1], "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1[1], "count"));
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = a1[1];
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
      v13 = CFSTR("layerBatch");
    else
      v13 = CFSTR("layer_batch");
    objc_msgSend(v4, "setObject:forKey:", v5, v13, (_QWORD)v15);

  }
  return v4;
}

- (id)jsonRepresentation
{
  return -[GEOPBOfflineDataBatchesResponse _dictionaryRepresentation:]((id *)&self->super.super.isa, 1);
}

- (GEOPBOfflineDataBatchesResponse)initWithDictionary:(id)a3
{
  return (GEOPBOfflineDataBatchesResponse *)-[GEOPBOfflineDataBatchesResponse _initWithDictionary:isJSON:](self, a3, 0);
}

- (void)_initWithDictionary:(int)a3 isJSON:
{
  void *v5;
  const __CFString *v6;
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
  uint64_t v17;
  void *v18;
  GEOPBOfflineDataLayerBatches *v19;
  GEOPBOfflineDataLayerBatches *v20;
  id v21;
  GEOPBOfflineDataLayerBatches *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  GEOPBOfflineDataBatchReference *v34;
  GEOPBOfflineDataBatchReference *v35;
  id v36;
  uint64_t v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v51;
  id v52;
  const __CFString *v53;
  const __CFString *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  __int128 v74;
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v52 = a2;
  if (a1)
  {
    v5 = (void *)objc_msgSend(a1, "init");
    if (v5)
    {
      if (a3)
        v6 = CFSTR("layerBatch");
      else
        v6 = CFSTR("layer_batch");
      objc_msgSend(v52, "objectForKeyedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        v51 = v7;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v66;
          if (a3)
            v12 = CFSTR("layerVersion");
          else
            v12 = CFSTR("layer_version");
          if (a3)
            v13 = CFSTR("batchReference");
          else
            v13 = CFSTR("batch_reference");
          if (a3)
            v14 = CFSTR("batchIdentifier");
          else
            v14 = CFSTR("batch_identifier");
          v15 = CFSTR("batchSizeBytes");
          if (!a3)
            v15 = CFSTR("batch_size_bytes");
          v62 = v15;
          v63 = v14;
          v16 = CFSTR("batch_compressed_size_bytes");
          if (a3)
            v16 = CFSTR("batchCompressedSizeBytes");
          v61 = v16;
          v56 = v8;
          v57 = v5;
          v54 = v12;
          v55 = *(_QWORD *)v66;
          v53 = v13;
          do
          {
            v17 = 0;
            v58 = v10;
            do
            {
              if (*(_QWORD *)v66 != v11)
                objc_enumerationMutation(v8);
              v18 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v17);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v60 = v17;
                v19 = [GEOPBOfflineDataLayerBatches alloc];
                if (v19)
                {
                  v20 = v19;
                  v21 = v18;
                  v22 = v20;
                  v23 = v21;
                  v24 = -[GEOPBOfflineDataLayerBatches init](v22, "init");
                  if (v24)
                  {
                    v59 = v23;
                    objc_msgSend(v23, "objectForKeyedSubscript:", v12);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v74 = 0uLL;
                      v75 = 0;
                      _GEOPBOfflineDataLayerVersionFromDictionaryRepresentation(v25, (uint64_t)&v74);
                      *(_BYTE *)(v24 + 40) |= 1u;
                      *(_OWORD *)(v24 + 8) = v74;
                      *(_QWORD *)(v24 + 24) = v75;
                    }

                    v23 = v59;
                    objc_msgSend(v59, "objectForKeyedSubscript:", v13);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v71 = 0u;
                      v72 = 0u;
                      v69 = 0u;
                      v70 = 0u;
                      v27 = v26;
                      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, &v74, 16);
                      v29 = v26;
                      if (v28)
                      {
                        v30 = v28;
                        v31 = *(_QWORD *)v70;
                        v64 = v26;
                        do
                        {
                          v32 = 0;
                          do
                          {
                            if (*(_QWORD *)v70 != v31)
                              objc_enumerationMutation(v27);
                            v33 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v32);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v34 = [GEOPBOfflineDataBatchReference alloc];
                              if (v34)
                              {
                                v35 = v34;
                                v36 = v33;
                                v37 = -[GEOPBOfflineDataBatchReference init](v35, "init");
                                if (v37)
                                {
                                  objc_msgSend(v36, "objectForKeyedSubscript:", v63);
                                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v38, 0);
                                    v40 = v39;
                                    *(_BYTE *)(v37 + 60) |= 4u;
                                    *(_BYTE *)(v37 + 60) |= 0x10u;
                                    objc_storeStrong((id *)(v37 + 24), v39);

                                    v29 = v64;
                                  }

                                  objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("url"));
                                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v42 = (void *)objc_msgSend(v41, "copy");
                                    v43 = v42;
                                    *(_BYTE *)(v37 + 60) |= 8u;
                                    *(_BYTE *)(v37 + 60) |= 0x10u;
                                    objc_storeStrong((id *)(v37 + 40), v42);

                                    v29 = v64;
                                  }

                                  objc_msgSend(v36, "objectForKeyedSubscript:", v62);
                                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v45 = objc_msgSend(v44, "unsignedLongLongValue");
                                    *(_BYTE *)(v37 + 60) |= 0x10u;
                                    *(_BYTE *)(v37 + 60) |= 2u;
                                    *(_QWORD *)(v37 + 32) = v45;
                                  }

                                  objc_msgSend(v36, "objectForKeyedSubscript:", v61);
                                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_opt_class();
                                  if ((objc_opt_isKindOfClass() & 1) != 0)
                                  {
                                    v47 = objc_msgSend(v46, "unsignedLongLongValue");
                                    *(_BYTE *)(v37 + 60) |= 0x10u;
                                    *(_BYTE *)(v37 + 60) |= 1u;
                                    *(_QWORD *)(v37 + 16) = v47;
                                  }

                                }
                              }
                              else
                              {
                                v37 = 0;
                              }
                              -[GEOPBOfflineDataLayerBatches addBatchReference:](v24, (void *)v37);

                            }
                            ++v32;
                          }
                          while (v30 != v32);
                          v48 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, &v74, 16);
                          v30 = v48;
                        }
                        while (v48);
                      }

                      v8 = v56;
                      v5 = v57;
                      v12 = v54;
                      v11 = v55;
                      v26 = v29;
                      v10 = v58;
                      v23 = v59;
                      v13 = v53;
                    }

                  }
                }
                else
                {
                  v24 = 0;
                }
                v17 = v60;
                objc_msgSend(v5, "addLayerBatch:", v24, v51);

              }
              ++v17;
            }
            while (v17 != v10);
            v49 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            v10 = v49;
          }
          while (v49);
        }

        v7 = v51;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOPBOfflineDataBatchesResponse)initWithJSON:(id)a3
{
  return (GEOPBOfflineDataBatchesResponse *)-[GEOPBOfflineDataBatchesResponse _initWithDictionary:isJSON:](self, a3, 1);
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
  BOOL v17;
  char v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  int v25;
  char v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  int v33;
  int v34;
  unsigned int v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  int v40;
  BOOL v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  int v46;
  int v47;
  int v48;
  BOOL v49;

  objc_msgSend(a3, "position");
  objc_msgSend(a3, "length");
  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) >= *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
    goto LABEL_95;
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
    if (v15)
      v17 = 1;
    else
      v17 = v16 == 4;
    if (v17)
      break;
    if ((v10 >> 3) != 1)
    {
      if ((PBReaderSkipValueWithTag() & 1) != 0)
        continue;
LABEL_98:
      PBReaderRecallMark();
      return 0;
    }
    if (v16 != 2 || !PBReaderPlaceMark())
      goto LABEL_98;
    objc_msgSend(a3, "position", 0, 0);
    objc_msgSend(a3, "length");
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
      if ((v20 >> 3) == 2)
      {
        if (v25 != 2 || !PBReaderPlaceMark())
          goto LABEL_97;
        objc_msgSend(a3, "position");
        objc_msgSend(a3, "length");
LABEL_47:
        while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5) && !*((_BYTE *)a3 + *v6))
        {
          v27 = 0;
          v28 = 0;
          v29 = 0;
          while (1)
          {
            v30 = *v4;
            v31 = *(_QWORD *)((char *)a3 + v30);
            if (v31 == -1 || v31 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v32 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v7) + v31);
            *(_QWORD *)((char *)a3 + v30) = v31 + 1;
            v29 |= (unint64_t)(v32 & 0x7F) << v27;
            if ((v32 & 0x80) == 0)
              goto LABEL_57;
            v27 += 7;
            v14 = v28++ >= 9;
            if (v14)
            {
              v29 = 0;
              v33 = *((unsigned __int8 *)a3 + *v6);
              goto LABEL_59;
            }
          }
          *((_BYTE *)a3 + *v6) = 1;
LABEL_57:
          v33 = *((unsigned __int8 *)a3 + *v6);
          if (*((_BYTE *)a3 + *v6))
            v29 = 0;
LABEL_59:
          v34 = v29 & 7;
          if (v33 || v34 == 4)
            break;
          switch((v29 >> 3))
          {
            case 1u:
              if (v34 != 2)
                goto LABEL_96;
              goto LABEL_67;
            case 2u:
              if (v34 == 2)
                goto LABEL_67;
              goto LABEL_96;
            case 3u:
              if ((v29 & 7) != 0)
                goto LABEL_96;
              v36 = 0;
              while (1)
              {
                v37 = *v4;
                v38 = *(_QWORD *)((char *)a3 + v37);
                if (v38 == -1 || v38 >= *(_QWORD *)((char *)a3 + *v5))
                  goto LABEL_85;
                v39 = v38 + 1;
                v40 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v38);
                *(_QWORD *)((char *)a3 + v37) = v39;
                if (v40 < 0)
                {
                  v41 = v36++ > 8;
                  if (!v41)
                    continue;
                }
                goto LABEL_47;
              }
            case 4u:
              if ((v29 & 7) != 0)
                goto LABEL_96;
              v42 = 0;
              break;
            default:
LABEL_67:
              if ((PBReaderSkipValueWithTag() & 1) != 0)
                continue;
LABEL_96:
              PBReaderRecallMark();
              goto LABEL_97;
          }
          while (1)
          {
            v43 = *v4;
            v44 = *(_QWORD *)((char *)a3 + v43);
            if (v44 == -1 || v44 >= *(_QWORD *)((char *)a3 + *v5))
              break;
            v45 = v44 + 1;
            v46 = *(char *)(*(_QWORD *)((char *)a3 + *v7) + v44);
            *(_QWORD *)((char *)a3 + v43) = v45;
            if (v46 < 0)
            {
              v41 = v42++ > 8;
              if (!v41)
                continue;
            }
            goto LABEL_47;
          }
LABEL_85:
          *((_BYTE *)a3 + *v6) = 1;
        }
        v47 = *((unsigned __int8 *)a3 + *v6);
        PBReaderRecallMark();
        if (v47)
        {
LABEL_97:
          PBReaderRecallMark();
          goto LABEL_98;
        }
LABEL_89:
        PBReaderRecallMark();
      }
      else
      {
        if ((v20 >> 3) == 1)
        {
          if (v25 != 2 || !PBReaderPlaceMark() || !GEOPBOfflineDataLayerVersionIsValid(a3))
            goto LABEL_97;
          goto LABEL_89;
        }
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          goto LABEL_97;
      }
    }
    v48 = *((unsigned __int8 *)a3 + *v6);
    PBReaderRecallMark();
    if (v48)
      goto LABEL_98;
    PBReaderRecallMark();
  }
  while (*(_QWORD *)((char *)a3 + *v4) < *(_QWORD *)((char *)a3 + *v5));
LABEL_95:
  v49 = *((_BYTE *)a3 + *v6) == 0;
  PBReaderRecallMark();
  return v49;
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
  GEOPBOfflineDataLayerBatches *v18;
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
        if ((v11 >> 3) == 1)
        {
          if ((PBReaderPlaceMark() & 1) == 0)
            goto LABEL_27;
          v18 = objc_alloc_init(GEOPBOfflineDataLayerBatches);
          if (!GEOPBOfflineDataLayerBatchesReadAllFrom((uint64_t)v18, v4))
          {

            goto LABEL_27;
          }
          PBReaderRecallMark();
          -[GEOPBOfflineDataBatchesResponse addLayerBatch:](self, "addLayerBatch:", v18, 0, 0);

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
  v5 = self->_layerBatchs;
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

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  void *v7;
  id v8;

  v8 = a3;
  -[GEOPBOfflineDataBatchesResponse readAll:](self, "readAll:", 0);
  if (-[GEOPBOfflineDataBatchesResponse layerBatchsCount](self, "layerBatchsCount"))
  {
    objc_msgSend(v8, "clearLayerBatchs");
    v4 = -[GEOPBOfflineDataBatchesResponse layerBatchsCount](self, "layerBatchsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[GEOPBOfflineDataBatchesResponse layerBatchAtIndex:](self, "layerBatchAtIndex:", i);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addLayerBatch:", v7);

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
  v6 = self->_layerBatchs;
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
        objc_msgSend(v5, "addLayerBatch:", v11);

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
  NSMutableArray *layerBatchs;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = 1;
    -[GEOPBOfflineDataBatchesResponse readAll:](self, "readAll:", 1);
    objc_msgSend(v4, "readAll:", 1);
    layerBatchs = self->_layerBatchs;
    if ((unint64_t)layerBatchs | v4[1])
      v5 = -[NSMutableArray isEqual:](layerBatchs, "isEqual:");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  -[GEOPBOfflineDataBatchesResponse readAll:](self, "readAll:", 1);
  return -[NSMutableArray hash](self->_layerBatchs, "hash");
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
        -[GEOPBOfflineDataBatchesResponse addLayerBatch:](self, "addLayerBatch:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layerBatchs, 0);
}

@end
