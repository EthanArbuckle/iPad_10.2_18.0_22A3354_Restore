@implementation DESSparsification

- (BOOL)reportErrorWithErrorStr:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[DESLogging coreChannel](DESLogging, "coreChannel");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[DESSparsification reportErrorWithErrorStr:error:].cold.1((uint64_t)v5, v6);

  if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2008, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return a4 != 0;
}

- (id)splitResultToChunksWithResult:(id)a3 recipe:(id)a4 baseKey:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  int v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  char *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  DESSparsification *v64;
  void *v65;
  id *v66;
  NSObject *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  void *v74;
  void *v75;
  DESChunk *v76;
  void *v77;
  id v78;
  DESChunk *v79;
  unsigned __int8 *v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unsigned int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  unint64_t v95;
  unint64_t v96;
  char *v97;
  uint32_t __upper_bound[2];
  void *v99;
  void *v100;
  id v101;
  int v102;
  char *obj;
  id obja;
  id objb;
  id objc;
  DESSparsification *v107;
  id *v108;
  void *v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  float v114;
  uint8_t v115[128];
  uint8_t buf[4];
  void *v117;
  __int16 v118;
  double v119;
  uint64_t v120;

  v120 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v114 = 0.0;
  v13 = objc_msgSend(v11, "useAdaptiveClipping");
  if (v13)
  {
    objc_msgSend(v11, "maxNorm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v16 = v15;

    objc_msgSend(v11, "recipeUserInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("ClippingIndicatorScale"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    *(float *)&v21 = v16;
    *(float *)&v22 = v20;
    if (!+[DESAdaptiveClipping computeClippingIndicator:clippingBound:scale:clippingIndicator:](DESAdaptiveClipping, "computeClippingIndicator:clippingBound:scale:clippingIndicator:", v10, &v114, v21, v22))
    {
      v62 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "recipeID");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "stringWithFormat:", CFSTR("Recipe %@ has %@=%f but failed to compute the adaptive clipping indicator"), v63, CFSTR("ClippingIndicatorScale"), *(_QWORD *)&v20);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      v64 = self;
      v65 = v39;
      v66 = a6;
LABEL_25:
      -[DESSparsification reportErrorWithErrorStr:error:](v64, "reportErrorWithErrorStr:error:", v65, v66);
      v61 = 0;
      goto LABEL_26;
    }
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v11, "recipeID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v117 = v24;
      v118 = 2048;
      v119 = v114;
      _os_log_impl(&dword_1B96E5000, v23, OS_LOG_TYPE_INFO, "Recipe %@ uses adaptive clipping, indicator=%f", buf, 0x16u);

    }
    v102 = v13;
    v107 = self;
    v108 = a6;

    v25 = 1;
  }
  else
  {
    v102 = 0;
    v107 = self;
    v108 = a6;
    v25 = 0;
  }
  objc_msgSend(v11, "recipeUserInfo");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("sparsification"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("chunkClippingBounds"));
  v28 = objc_claimAutoreleasedReturnValue();
  if (!v28)
    goto LABEL_23;
  v29 = (void *)v28;
  objc_msgSend(v11, "recipeUserInfo");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("sparsification"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("numChunks"));
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {

LABEL_23:
    goto LABEL_24;
  }
  v33 = (void *)v32;
  obj = (char *)v25;
  objc_msgSend(v11, "recipeUserInfo");
  v109 = v11;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("sparsification"));
  v101 = v10;
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sparsificationMapFile"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v101;
  v11 = v109;

  if (!v36)
  {
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recipe does not include all keys required for sparsification and chunking. Required keys include %@, %@, %@, %@"), CFSTR("sparsification"), CFSTR("chunkClippingBounds"), CFSTR("numChunks"), CFSTR("sparsificationMapFile"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v107;
    v66 = v108;
    v65 = v39;
    goto LABEL_25;
  }
  objc_msgSend(v109, "recipeUserInfo");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("sparsification"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("chunkClippingBounds"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v109, "recipeUserInfo");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("sparsification"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("numChunks"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (int)objc_msgSend(v42, "intValue");

  v44 = objc_msgSend(v39, "count");
  v45 = objc_msgSend(v101, "length");
  v46 = &obj[v45 >> 2];
  if ((unint64_t)v46 >= v43 && v44 == v43)
  {
    v47 = v45;
    v97 = &obj[v45 >> 2];
    *(_QWORD *)__upper_bound = v43;
    v99 = v12;
    v100 = v39;
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    objc_msgSend(v109, "attachments");
    obja = (id)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
    if (v48)
    {
      v49 = v48;
      v95 = v47;
      v96 = v47 >> 2;
      v50 = *(_QWORD *)v111;
LABEL_14:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v111 != v50)
          objc_enumerationMutation(obja);
        v52 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * v51);
        objc_msgSend(v52, "lastPathComponent");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "recipeUserInfo");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("sparsification"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("sparsificationMapFile"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v53, "isEqualToString:", v56);

        if (v57)
          break;
        ++v51;
        v11 = v109;
        if (v49 == v51)
        {
          v49 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v110, v115, 16);
          if (v49)
            goto LABEL_14;
          goto LABEL_20;
        }
      }
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v68 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        -[DESSparsification splitResultToChunksWithResult:recipe:baseKey:error:].cold.1((uint64_t)v52, v68);

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v52, 1, v108);
      v69 = objc_claimAutoreleasedReturnValue();
      v11 = v109;
      v12 = v99;
      v39 = v100;
      v60 = obja;
      if (!v69)
      {
        v10 = v101;
        if (v108)
          v91 = *v108;
        else
          v91 = 0;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sparsification map file was not readable: %@"), v91);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        -[DESSparsification reportErrorWithErrorStr:error:](v107, "reportErrorWithErrorStr:error:", v93, v108);

        goto LABEL_28;
      }
      v70 = (void *)v69;

      v71 = objc_msgSend(v70, "length");
      if ((char *)v71 == v97)
      {
        objb = v70;
        v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (__upper_bound[0])
        {
          v73 = 1;
          do
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v73);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v99, "resultsKeyStringForChunk:", v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();

            v76 = [DESChunk alloc];
            objc_msgSend(v100, "objectAtIndexedSubscript:", v73 - 1);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
            v79 = -[DESChunk initWithKey:clippingBound:data:](v76, "initWithKey:clippingBound:data:", v75, v77, v78);

            objc_msgSend(v72, "addObject:", v79);
            ++v73;
          }
          while (v73 != __upper_bound[0] + 1);
        }
        objc = objc_retainAutorelease(objb);
        v80 = (unsigned __int8 *)objc_msgSend(objc, "bytes");
        v10 = v101;
        v81 = objc_msgSend(objc_retainAutorelease(v101), "bytes");
        v12 = v99;
        v82 = *(_QWORD *)__upper_bound;
        v83 = v96;
        if (v95 >= 4)
        {
          v84 = v81;
          do
          {
            v86 = *v80++;
            v85 = v86;
            if (v86)
            {
              if (v85 > *(_QWORD *)__upper_bound)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Chunk mapping value = %8u, which is greater than number of chunks = %lu, found in map file"), v85, *(_QWORD *)__upper_bound);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                -[DESSparsification reportErrorWithErrorStr:error:](v107, "reportErrorWithErrorStr:error:", v94, v108);

                v61 = 0;
                v11 = v109;
                goto LABEL_48;
              }
              objc_msgSend(v72, "objectAtIndexedSubscript:", (v85 - 1));
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "data");
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "appendBytes:length:", v84, 4);

            }
            v84 += 4;
            --v83;
          }
          while (v83);
        }
        if (v102)
        {
          objc_msgSend(v72, "objectAtIndexedSubscript:", objc_msgSend(v72, "count") - 1);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "data");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v90, "appendBytes:length:", &v114, 4);

        }
        v11 = v109;
        if (__upper_bound[0] >= 2)
        {
          do
          {
            objc_msgSend(v72, "exchangeObjectAtIndex:withObjectAtIndex:", v82 - 1, arc4random_uniform(v82));
            --v82;
          }
          while (v82 > 1);
        }
        v61 = v72;
LABEL_48:

        v39 = v100;
        v60 = objc;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Length of sparsification mapping file does not match number of statistics to be privatised and aggregated: number of statistics = %lu; number of byte values in mapping file = %lu"),
          v97,
          v71);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        -[DESSparsification reportErrorWithErrorStr:error:](v107, "reportErrorWithErrorStr:error:", v92, v108);

        v61 = 0;
        v60 = v70;
        v10 = v101;
      }
    }
    else
    {
LABEL_20:

      v58 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v11, "attachments");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "stringWithFormat:", CFSTR("Sparsification map file not found in recipe attachments. Recipe attachments = %@"), v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();

      -[DESSparsification reportErrorWithErrorStr:error:](v107, "reportErrorWithErrorStr:error:", v60, v108);
      v61 = 0;
      v39 = v100;
      v10 = v101;
      v12 = v99;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Incorrect settings for chunking parameters: size of result vector = %lu; number of chunks = %lu; number of clipping bounds = %lu"),
      v46,
      v43,
      v44);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[DESSparsification reportErrorWithErrorStr:error:](v107, "reportErrorWithErrorStr:error:", v60, v108);
LABEL_28:
    v61 = 0;
  }

LABEL_26:
  return v61;
}

- (void)reportErrorWithErrorStr:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

- (void)splitResultToChunksWithResult:(uint64_t)a1 recipe:(NSObject *)a2 baseKey:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_DEBUG, "Sparsification map file found at: %@", (uint8_t *)&v2, 0xCu);
}

@end
