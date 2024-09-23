@implementation _AXCodeItemDecoder

- (id)decodedCodeItemsFromURL:(id)a3 decodingErrors:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *OrderForInfo;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v72 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a3, 0, &v72);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v72;
  if (!v7)
  {
    v71 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v6, 0, &v71);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v71;
    v8 = v14;
    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v14, "ax_nonRedundantDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not decode ax bundle map JSON: %@"), v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v16);

      goto LABEL_6;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v11 = CFSTR("Could not load ax bundle map: Expected rootObject to be NSDictionary");
      goto LABEL_3;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("items"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      obj = v13;
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v62)
      {
        v52 = v6;
        v53 = v17;
        v50 = v13;
        v51 = v10;
        v19 = *(_QWORD *)v68;
        v20 = obj;
        v59 = v5;
        v57 = *(_QWORD *)v68;
        while (1)
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v68 != v19)
              objc_enumerationMutation(v20);
            v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v21);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item. expected NSDictionary"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v23);
              goto LABEL_59;
            }
            objc_msgSend(v22, "objectForKey:", CFSTR("name"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v23, "length"))
            {
              objc_msgSend(v22, "objectForKey:", CFSTR("target"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v58 = v24;
                objc_msgSend(v24, "objectForKey:", CFSTR("name"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v25, "length"))
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item. target name is missing"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "addObject:", v26);
                  v44 = v58;
                  goto LABEL_56;
                }
                objc_msgSend(v24, "objectForKey:", CFSTR("type"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v26, "length"))
                {
                  v27 = +[AXCodeItem codeItemTypeFromString:](AXCodeItem, "codeItemTypeFromString:", v26);
                  if (v27)
                  {
                    v55 = v27;
                    objc_msgSend(v22, "objectForKey:", CFSTR("platforms"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v56 = v28;
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v63 = 0u;
                      v64 = 0u;
                      v65 = 0u;
                      v66 = 0u;
                      v60 = v28;
                      v30 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                      if (v30)
                      {
                        v31 = v30;
                        v32 = *(_QWORD *)v64;
                        do
                        {
                          for (i = 0; i != v31; ++i)
                          {
                            v34 = v26;
                            if (*(_QWORD *)v64 != v32)
                              objc_enumerationMutation(v60);
                            v35 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              if (objc_msgSend(v35, "isEqualToString:", _AXBundleMapPlatformKey_iOS))
                                objc_msgSend(v29, "setObject:forKeyedSubscript:", v25, _AXBundleMapPlatformKey_iOS);
                              if (objc_msgSend(v35, "isEqualToString:", _AXBundleMapPlatformKey_tvOS))
                                objc_msgSend(v29, "setObject:forKeyedSubscript:", v25, _AXBundleMapPlatformKey_tvOS);
                              if (objc_msgSend(v35, "isEqualToString:", _AXBundleMapPlatformKey_watchOS))
                                objc_msgSend(v29, "setObject:forKeyedSubscript:", v25, _AXBundleMapPlatformKey_watchOS);
                              if (objc_msgSend(v35, "isEqualToString:", _AXBundleMapPlatformKey_iosmac))
                                objc_msgSend(v29, "setObject:forKeyedSubscript:", v25, _AXBundleMapPlatformKey_iosmac);
                              if (objc_msgSend(v35, "isEqualToString:", _AXBundleMapPlatformKey_macOS))
                                objc_msgSend(v29, "setObject:forKeyedSubscript:", v25, _AXBundleMapPlatformKey_macOS);
                            }
                            else
                            {
                              objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item named '%@'. supportedPlatforms item '%@' expected to be a string"), v25, v35);
                              v36 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(v59, "addObject:", v36);

                            }
                            v26 = v34;
                          }
                          v31 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                        }
                        while (v31);
                      }

                      AXAccessibilityBundlesDirectory();
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.axbundle/%@"), v23, v23);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v37, "stringByAppendingPathComponent:", v38);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v22, "objectForKey:", CFSTR("loadOrder"));
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v40 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                      {
                        objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("If loadOrder is specified, it must be a number"));
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        v5 = v59;
                        objc_msgSend(v59, "addObject:", v42);
                      }
                      else
                      {
                        v61 = v26;
                        OrderForInfo = _loadOrderForInfo(v40, v55);
                        objc_msgSend(v22, "objectForKey:", CFSTR("excludedProcesses"));
                        v42 = (void *)objc_claimAutoreleasedReturnValue();
                        v5 = v59;
                        if (v42 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                        {
                          objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("excludedProcesses was not an array"));
                          v43 = (id)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v59, "addObject:", v43);
                        }
                        else
                        {
                          v43 = -[AXCodeItem initAccessibilityCodeItemWithPath:targetType:platformToTarget:loadOrder:]([AXCodeItem alloc], "initAccessibilityCodeItemWithPath:targetType:platformToTarget:loadOrder:", v39, v55, v29, OrderForInfo);
                          objc_msgSend(v43, "setExcludedProcesses:", v42);
                          objc_msgSend(v53, "addObject:", v43);
                        }

                        v26 = v61;
                      }

                      v20 = obj;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item named '%@'. supportedPlatforms expected to be an array"), v25);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v5, "addObject:", v29);
                    }

                    v44 = v58;
                    v45 = v56;
LABEL_55:

LABEL_56:
LABEL_57:

                    v19 = v57;
                    goto LABEL_58;
                  }
                  objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item named '%@'. target type is unknown '%@'"), v25, v26);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item named '%@'. target type is missing"), v25, v49);
                }
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "addObject:", v45);
                v44 = v58;
                goto LABEL_55;
              }
              objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item. target expected to be NSDictionary"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v25);
              v44 = v24;
              goto LABEL_57;
            }
            objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load bundle map item. name is missing"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v44);
LABEL_58:

LABEL_59:
            ++v21;
          }
          while (v21 != v62);
          v46 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
          v62 = v46;
          if (!v46)
          {
            v8 = 0;
            v6 = v52;
            v13 = v50;
            v10 = v51;
            v47 = v20;
            v17 = v53;
            goto LABEL_73;
          }
        }
      }
      v47 = obj;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoader"), CFSTR("Could not load ax bundle map: Expected rootObject.items to be NSArray"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v47);
      v17 = 0;
    }
LABEL_73:

    goto LABEL_7;
  }
  v8 = v7;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v7, "ax_nonRedundantDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v10;
  v11 = CFSTR("Could not load ax bundle map: %@");
  v12 = v9;
LABEL_3:
  objc_msgSend(v12, "ax_errorWithDomain:description:", CFSTR("AXLoader"), v11, v48);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);
LABEL_6:
  v17 = 0;
LABEL_7:

  return v17;
}

@end
