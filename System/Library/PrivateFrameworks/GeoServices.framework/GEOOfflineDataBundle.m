@implementation GEOOfflineDataBundle

+ (id)installedBundles
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_opt_self();
  +[GEOFilePaths urlFor:](GEOFilePaths, "urlFor:", 37);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "_geo_compactMap:", &__block_literal_global_20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

GEOOfflineDataBundle *__40__GEOOfflineDataBundle_installedBundles__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  GEOOfflineDataBundle *v5;
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  uint32_t v33;
  void *v34;
  id v35;
  _QWORD *v37;
  id v38;
  void *v39;
  id obj;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  uint8_t buf[4];
  id v49;
  uint8_t v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("offlinemap"));

  if (v4)
  {
    v5 = [GEOOfflineDataBundle alloc];
    v6 = v2;
    if (v5)
    {
      v47.receiver = v5;
      v47.super_class = (Class)GEOOfflineDataBundle;
      v7 = objc_msgSendSuper2(&v47, sel_init);
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v6, "pathExtension");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("offlinemap"));

        if ((v10 & 1) != 0)
        {
          v38 = v2;
          v11 = objc_msgSend(v6, "copy");
          v12 = (void *)v8[1];
          v8[1] = v11;

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v8;
          objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8[1], 0, 1, 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          obj = v14;
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
          if (!v15)
          {
            v39 = 0;
            goto LABEL_74;
          }
          v16 = v15;
          v39 = 0;
          v17 = *(_QWORD *)v44;
          while (1)
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v44 != v17)
                objc_enumerationMutation(obj);
              v19 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v19, "lastPathComponent");
              v20 = (id)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_UNKNOWN")) & 1) == 0)
              {
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_FARPOINT_METADATA")) & 1) != 0)
                {
                  v22 = 1;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING")) & 1) != 0)
                {
                  v22 = 2;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_POI_SEARCH_AND_PLACES")) & 1) != 0)
                {
                  v22 = 3;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_VECTOR_PARSEC_INDEX")) & 1) != 0)
                {
                  v22 = 4;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_REVGEO")) & 1) != 0)
                {
                  v22 = 5;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_VECTOR_PARSEC_DATA")) & 1) != 0)
                {
                  v22 = 6;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_GEO_SEARCH")) & 1) != 0)
                {
                  v22 = 7;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_SEARCH_STATIC_CONTENT")) & 1) != 0)
                {
                  v22 = 8;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_VECTOR_TILE")) & 1) != 0)
                {
                  v22 = 9;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_BROWSE_AND_CATEGORY_SEARCH")) & 1) != 0)
                {
                  v22 = 10;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_VECTOR_ASSET")) & 1) != 0)
                {
                  v22 = 11;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_SEARCH_ML_MODELS")) & 1) != 0)
                {
                  v22 = 12;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V2")) & 1) != 0)
                {
                  v22 = 13;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V2_TRANSIT")) & 1) != 0)
                {
                  v22 = 14;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V2_TRAFFIC_INCIDENTS")) & 1) != 0)
                {
                  v22 = 15;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_GEO_SEARCH_V2")) & 1) != 0)
                {
                  v22 = 16;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V3")) & 1) != 0)
                {
                  v22 = 17;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_METADATA")) & 1) != 0)
                {
                  v22 = 18;
                  goto LABEL_52;
                }
                if ((objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_TRANSIT")) & 1) != 0)
                {
                  v22 = 19;
                  goto LABEL_52;
                }
                if (objc_msgSend(v20, "isEqualToString:", CFSTR("LAYER_ROUTING_V3_TRAFFIC_INCIDENTS")))
                {
                  v22 = 20;
LABEL_52:

                  objc_msgSend(v19, "URLByAppendingPathComponent:", CFSTR("keys.json"));
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v21, "path");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v23, "fileExistsAtPath:", v24);

                  if (!v25)
                    goto LABEL_70;
                  v42 = 0;
                  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v21, 0, &v42);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = v42;
                  if (v26)
                  {
                    v41 = v27;
                    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v26, 0, &v41);
                    v28 = objc_claimAutoreleasedReturnValue();
                    v20 = v41;

                    if (v28)
                    {
                      objc_opt_class();
                      if ((objc_opt_isKindOfClass() & 1) != 0)
                      {
                        v29 = v39;
                        if (!v39)
                        {
                          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                          v29 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22);
                        v30 = objc_claimAutoreleasedReturnValue();
                        v39 = v29;
                        objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v30);
LABEL_67:

LABEL_68:
                        goto LABEL_69;
                      }
                      GEOGetOfflineDataAccessLog();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        goto LABEL_67;
                      *(_WORD *)buf = 0;
                      v31 = v30;
                      v32 = "keys.json contains non-dictionary root";
                      v33 = 2;
                    }
                    else
                    {
                      GEOGetOfflineDataAccessLog();
                      v30 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                        goto LABEL_67;
                      *(_DWORD *)buf = 138543362;
                      v49 = v20;
                      v31 = v30;
                      v32 = "Failed to decode keys.json for data bundle: %{public}@";
                      v33 = 12;
                    }
                    _os_log_impl(&dword_1885A9000, v31, OS_LOG_TYPE_ERROR, v32, buf, v33);
                    goto LABEL_67;
                  }
                  GEOGetOfflineDataAccessLog();
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138543362;
                    v49 = v27;
                    _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_ERROR, "Failed to load keys.json for data bundle: %{public}@", buf, 0xCu);
                  }
                  v20 = v27;
                  goto LABEL_68;
                }
              }
              v21 = v20;
LABEL_69:

LABEL_70:
            }
            v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
            if (!v16)
            {
LABEL_74:

              v8 = v37;
              v34 = (void *)v37[2];
              v37[2] = v39;
              v35 = v39;

              v5 = v37;
              v2 = v38;
              goto LABEL_75;
            }
          }
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)v50 = 0;
          _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [url.pathExtension isEqualToString:OfflineDataBundleExtension]", v50, 2u);
        }
        v5 = 0;
LABEL_75:

      }
      else
      {
        v5 = 0;
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)availableKeysForLayer:(uint64_t)a1
{
  uint64_t v2;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v36;
  int v37;
  id obj;
  uint64_t v39;
  void *v40;
  _QWORD v41[4];
  int v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = a2;
  v4 = *(void **)(a1 + 8);
  if (a2 >= 0x15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), a2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E1C027E0[(int)a2];
  }
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 16);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 16), "count"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v9, "allKeys");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v11)
    {
      v12 = v11;
      v36 = v2;
      obj = v10;
      v39 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v48 != v39)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          v15 = v9;
          objc_msgSend(v9, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v6;
          objc_msgSend(v6, "URLByAppendingPathComponent:", v16);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "path");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v19, "fileExistsAtPath:", v20);

          if (v21)
            objc_msgSend(v40, "addObject:", v14);

          v6 = v17;
          v9 = v15;
        }
        v10 = obj;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      }
      while (v12);
      LODWORD(v2) = v36;
    }
  }
  else
  {
    v37 = v2;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v6;
    objc_msgSend(v22, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 1, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v10 = v24;
    v25 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(v10);
          v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "path");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "fileExistsAtPath:", v31);

          if (v32)
          {
            objc_msgSend(v29, "lastPathComponent");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v33);

          }
        }
        v26 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v26);
    }

    LODWORD(v2) = v37;
    v6 = v23;
    v9 = 0;
  }

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __46__GEOOfflineDataBundle_availableKeysForLayer___block_invoke;
  v41[3] = &__block_descriptor_36_e18__16__0__NSString_8l;
  v42 = v2;
  objc_msgSend(v40, "_geo_compactMap:", v41);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

GEOOfflineDataKey *__46__GEOOfflineDataBundle_availableKeysForLayer___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  GEOOfflineDataKey *v6;

  v3 = (objc_class *)MEMORY[0x1E0C99D50];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBase64EncodedString:options:", v4, 0);

  if (v5)
    v6 = -[GEOOfflineDataKey initWithLayer:serviceKey:]([GEOOfflineDataKey alloc], "initWithLayer:serviceKey:", *(unsigned int *)(a1 + 32), v5);
  else
    v6 = 0;

  return v6;
}

- (GEOTileData)dataForKey:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  GEOTileData *v19;

  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "serviceKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v3, "layer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), CFSTR("-"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("_"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v9, "length"))
    {
      v11 = (void *)MEMORY[0x1E0CB3940];
      v12 = objc_msgSend(v3, "layer");
      if (v12 >= 0x15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = off_1E1C027E0[(int)v12];
      }
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@/%@"), v13, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 8), "URLByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }

    if (v15
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "path"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v16, "fileExistsAtPath:", v17),
          v17,
          v16,
          v18))
    {
      v19 = -[GEOTileData initWithFileURL:]([GEOTileData alloc], "initWithFileURL:", v15);
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 0;
  }
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keysToFilenames, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

@end
