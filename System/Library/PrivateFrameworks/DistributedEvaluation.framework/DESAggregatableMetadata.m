@implementation DESAggregatableMetadata

+ (id)encodeMetadata:(id)a3 recipe:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  DESMetadataSchema *v14;
  void *v15;
  DESMetadataSchema *v16;
  id v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  char v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v67;
  void *v68;
  id obj;
  id v70;
  id v71;
  uint64_t v72;
  void *v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint8_t buf[4];
  void *v80;
  __int16 v81;
  void *v82;
  __int16 v83;
  void *v84;
  _BYTE v85[128];
  _QWORD v86[2];
  _QWORD v87[4];

  v87[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v86[0] = CFSTR("encodedCategoricalMetadata");
  v86[1] = CFSTR("encodedNumericMetadata");
  v70 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v71 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v87[0] = v70;
  v87[1] = v71;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "recipeID");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v80 = v62;
      _os_log_impl(&dword_1B96E5000, v61, OS_LOG_TYPE_INFO, "No metadata for recipe %@", buf, 0xCu);

    }
    goto LABEL_56;
  }
  if ((objc_msgSend(v7, "useAggregatableMetadata") & 1) == 0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "recipeID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v80 = v63;
      _os_log_impl(&dword_1B96E5000, v61, OS_LOG_TYPE_INFO, "Recipe %@ is not configured to use aggregatable metadata.", buf, 0xCu);

    }
LABEL_56:

    v64 = v67;
    v60 = v67;
    goto LABEL_61;
  }
  objc_msgSend(v7, "recipeUserInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MetadataEncoding"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v73, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = v10;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v11)
  {
    v72 = *(_QWORD *)v76;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v76 != v72)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v12);
        v14 = [DESMetadataSchema alloc];
        objc_msgSend(v7, "attachments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = 0;
        v16 = -[DESMetadataSchema initWith:key:attachments:error:](v14, "initWith:key:attachments:error:", v73, v13, v15, &v74);
        v17 = v74;

        if (v16)
        {
          objc_msgSend(v6, "valueForKeyPath:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v6, "valueForKeyPath:", v13);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v7, "recipeID");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v80 = v20;
              v81 = 2112;
              v82 = v13;
              v83 = 2112;
              v84 = v50;
              _os_log_debug_impl(&dword_1B96E5000, v21, OS_LOG_TYPE_DEBUG, "Encoding string value %@ for metadata entry %@, recipe %@", buf, 0x20u);

            }
            -[DESMetadataSchema encoder](v16, "encoder");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "encodeString:toLength:", v20, -[DESMetadataSchema buckets](v16, "buckets"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v6, "valueForKeyPath:", v13);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v25 = objc_opt_isKindOfClass();

            if ((v25 & 1) != 0)
            {
              objc_msgSend(v6, "valueForKeyPath:", v13);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              +[DESLogging coreChannel](DESLogging, "coreChannel");
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v7, "recipeID");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v80 = v26;
                v81 = 2112;
                v82 = v13;
                v83 = 2112;
                v84 = v55;
                _os_log_debug_impl(&dword_1B96E5000, v27, OS_LOG_TYPE_DEBUG, "Encoding numeric value %@ for metadata entry %@, recipe %@", buf, 0x20u);

              }
              -[DESMetadataSchema encoder](v16, "encoder");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "encodeNumber:toLength:", v26, -[DESMetadataSchema buckets](v16, "buckets"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              objc_msgSend(v6, "valueForKeyPath:", v13);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v30 = objc_opt_isKindOfClass();

              if ((v30 & 1) != 0)
              {
                objc_msgSend(v6, "valueForKeyPath:", v13);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v68, "count"))
                {
                  objc_msgSend(v68, "firstObject");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  v32 = objc_opt_isKindOfClass();

                  if ((v32 & 1) != 0)
                  {
                    objc_msgSend(v6, "valueForKeyPath:", v13);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    +[DESLogging coreChannel](DESLogging, "coreChannel");
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                    {
                      objc_msgSend(v7, "recipeID");
                      v58 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v80 = v33;
                      v81 = 2112;
                      v82 = v13;
                      v83 = 2112;
                      v84 = v58;
                      _os_log_debug_impl(&dword_1B96E5000, v34, OS_LOG_TYPE_DEBUG, "Encoding string vector %@ for metadata entry %@, recipe %@", buf, 0x20u);

                    }
                    -[DESMetadataSchema encoder](v16, "encoder");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v35, "encodeStringVector:toLength:", v33, -[DESMetadataSchema buckets](v16, "buckets"));
                    v36 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v68, "firstObject");
                    v47 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v48 = objc_opt_isKindOfClass();

                    if ((v48 & 1) != 0)
                    {
                      objc_msgSend(v6, "valueForKeyPath:", v13);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      +[DESLogging coreChannel](DESLogging, "coreChannel");
                      v49 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                      {
                        objc_msgSend(v7, "recipeID");
                        v59 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412802;
                        v80 = v33;
                        v81 = 2112;
                        v82 = v13;
                        v83 = 2112;
                        v84 = v59;
                        _os_log_debug_impl(&dword_1B96E5000, v49, OS_LOG_TYPE_DEBUG, "Encoding numeric vector %@ for metadata entry %@, recipe %@", buf, 0x20u);

                      }
                      -[DESMetadataSchema encoder](v16, "encoder");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "encodeNumberVector:toLength:", v33, -[DESMetadataSchema buckets](v16, "buckets"));
                      v36 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      v51 = (void *)MEMORY[0x1E0CB3940];
                      objc_msgSend(v7, "recipeID");
                      v52 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v51, "stringWithFormat:", CFSTR("Array data type of %@ is not supported by schema for recipe %@, must be either string or number."), v13, v52);
                      v33 = (void *)objc_claimAutoreleasedReturnValue();

                      +[DESLogging coreChannel](DESLogging, "coreChannel");
                      v53 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412290;
                        v80 = v33;
                        _os_log_error_impl(&dword_1B96E5000, v53, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                      }

                      -[DESMetadataSchema encoder](v16, "encoder");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                      v36 = objc_claimAutoreleasedReturnValue();
                    }
                  }
                  v23 = (void *)v36;

                }
                else
                {
                  +[DESLogging coreChannel](DESLogging, "coreChannel");
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v7, "recipeID");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v80 = v13;
                    v81 = 2112;
                    v82 = v56;
                    _os_log_debug_impl(&dword_1B96E5000, v44, OS_LOG_TYPE_DEBUG, "Zero encode empty vector for metadata entry %@, recipe %@", buf, 0x16u);

                  }
                  -[DESMetadataSchema encoder](v16, "encoder");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v33, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                }

              }
              else
              {
                objc_msgSend(v6, "valueForKeyPath:", v13);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                v38 = v37 == 0;

                if (v38)
                {
                  +[DESLogging coreChannel](DESLogging, "coreChannel");
                  v45 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v7, "recipeID");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v80 = v13;
                    v81 = 2112;
                    v82 = v57;
                    _os_log_debug_impl(&dword_1B96E5000, v45, OS_LOG_TYPE_DEBUG, "Metadata %@ is specified in schema but missing from user data for recipe %@", buf, 0x16u);

                  }
                  -[DESMetadataSchema encoder](v16, "encoder");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v39 = (void *)MEMORY[0x1E0CB3940];
                  objc_msgSend(v7, "recipeID");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "stringWithFormat:", CFSTR("Data type of %@ is not supported by schema for recipe %@, must be either string or number."), v13, v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();

                  +[DESLogging coreChannel](DESLogging, "coreChannel");
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 138412290;
                    v80 = v41;
                    _os_log_error_impl(&dword_1B96E5000, v42, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
                  }

                  -[DESMetadataSchema encoder](v16, "encoder");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "zeroWithLength:", -[DESMetadataSchema buckets](v16, "buckets"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                }
              }
            }
          }
          if (-[DESMetadataSchema outputType](v16, "outputType") == 1)
            v54 = v70;
          else
            v54 = v71;
          objc_msgSend(v54, "appendData:", v23);

        }
        else if (v17)
        {
          if (a5)
            *a5 = objc_retainAutorelease(v17);

          v60 = 0;
          goto LABEL_60;
        }

        ++v12;
      }
      while (v11 != v12);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      if (v11)
        continue;
      break;
    }
  }

  v60 = v67;
LABEL_60:

  v64 = v67;
LABEL_61:

  return v60;
}

@end
