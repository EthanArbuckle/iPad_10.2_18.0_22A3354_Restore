@implementation EARLMTGlobalNNLM

uint64_t __44___EARLMTGlobalNNLM_attachmentURL_withName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __31___EARLMTGlobalNNLM_loadWeight__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(v16, "isEqualToString:", &stru_1E5D49530) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v10 = (void *)objc_opt_new();
      objc_msgSend(v9, "setValue:forKey:", v10, v5);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v7, v6);

    if ((unint64_t)objc_msgSend(v4, "count") >= 4)
    {
      objc_msgSend(v4, "objectAtIndex:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("nB"));

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v13, CFSTR("nC"));

    }
  }

}

void __32___EARLMTGlobalNNLM_saveWeight___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  if ((objc_msgSend(v16, "isEqualToString:", &stru_1E5D49530) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      v10 = (void *)objc_opt_new();
      objc_msgSend(v9, "setValue:forKey:", v10, v5);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forKey:", v7, v6);

    if ((unint64_t)objc_msgSend(v4, "count") >= 4)
    {
      objc_msgSend(v4, "objectAtIndex:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectAtIndex:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setValue:forKey:", v12, CFSTR("nB"));

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forKey:", v13, CFSTR("nC"));

    }
  }

}

uint64_t __26___EARLMTGlobalNNLM_setup__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "addTokenizedText:length:", a2, *(_QWORD *)(a1 + 40));
}

void __60___EARLMTGlobalNNLM_findTensorsIndicesByKeyWord_tensorInfo___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v8;

  v8 = a3;
  if (objc_msgSend(a2, "containsString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

uint64_t __26___EARLMTGlobalNNLM_train__block_invoke(uint64_t a1, unint64_t a2, void *a3, void *a4)
{
  id v6;
  unint64_t i;
  id v8;
  id v9;
  void *v10;
  void *v11;
  float *v12;
  NSObject *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  float v20;
  float v21;
  float v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  uint8_t v54[128];
  uint8_t buf[4];
  unint64_t v56;
  __int16 v57;
  double v58;
  uint64_t v59;

  v45 = a2;
  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v46 = a4;
  for (i = 0; i < objc_msgSend(v6, "numberOfDataPoints", v45); ++i)
  {
    v53 = 0;
    objc_msgSend(v6, "dataPointAtIndex:error:", i, &v53);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = v53;
    if (v9)
    {
      v31 = v9;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        __26___EARLMTGlobalNNLM_train__block_invoke_cold_1();
LABEL_39:

      v35 = 0;
      goto LABEL_40;
    }
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (float *)objc_msgSend(v11, "dataPointer");

    v13 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v15 = *v12;
      *(_DWORD *)buf = 134218240;
      v56 = i;
      v57 = 2048;
      v58 = v15;
      _os_log_impl(&dword_1AD756000, v13, OS_LOG_TYPE_INFO, "Cost for batch %lu = %f", buf, 0x16u);
    }
    v16 = *(void **)(a1 + 40);
    *(float *)&v14 = *v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  v18 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    v56 = v45;
    v57 = 2112;
    v58 = *(double *)&v6;
    _os_log_impl(&dword_1AD756000, v18, OS_LOG_TYPE_INFO, "Espresso training iteration=%lu result=%@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 96), "shuffleSamples");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 104), "setVectorsWithProcessor:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 96));
  v19 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v56 = v45;
    _os_log_impl(&dword_1AD756000, v19, OS_LOG_TYPE_INFO, "Finish running train epoch number %lu", buf, 0xCu);
  }
  v20 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v20 > 0.0)
  {
    multiply(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), 1.0 / v20);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      v21 = l2norm(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v22 = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
      if (v21 > v22)
        multiply(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v22 / v21);
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
    goto LABEL_31;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1 + 48) + 152);
  v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (!v23)
    goto LABEL_30;
  v47 = *(_QWORD *)v50;
  while (2)
  {
    for (j = 0; j != v23; ++j)
    {
      if (*(_QWORD *)v50 != v47)
        objc_enumerationMutation(v8);
      v25 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "objectForKey:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)v26;
      if (v20 > 0.0 && v26 != 0)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 152), "objectForKeyedSubscript:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        LODWORD(v30) = 1.0;
        objc_msgSend(v27, "applyToTensor:scale:error:", v29, &v48, v30);
        v31 = v48;

        if (v31)
        {
          v36 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
            __26___EARLMTGlobalNNLM_train__block_invoke_cold_3(v36, v37, v38, v39, v40, v41, v42, v43);
        }
        else
        {
          objc_msgSend(v46, "getTensorNamed:directBind:", v25, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 152), "objectForKeyedSubscript:", v25);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          _copy(v32, v33);
          v31 = (id)objc_claimAutoreleasedReturnValue();

          if (!v31)
          {
            objc_msgSend(v27, "reset");
            goto LABEL_28;
          }
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
            __26___EARLMTGlobalNNLM_train__block_invoke_cold_2();
        }

        goto LABEL_39;
      }
LABEL_28:

    }
    v23 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    if (v23)
      continue;
    break;
  }
LABEL_30:

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
LABEL_31:
  v34 = _fetchTensors(*(void **)(*(_QWORD *)(a1 + 48) + 168), *(void **)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 128));
  v35 = 1;
LABEL_40:

  return v35;
}

uint64_t __26___EARLMTGlobalNNLM_train__block_invoke_214(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  float v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t i;
  void *v18;
  GradientBuffer *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  GradientBuffer *v25;
  void *v26;
  double v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  _QWORD *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  double v40;
  NSObject *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  float v45;
  float v46;
  __int128 v48;
  void *v49;
  void *v50;
  void *v51;
  id obj;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  id v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v55 = a4;
  v68 = 0;
  v49 = (void *)a2;
  v50 = v7;
  objc_msgSend(v7, "dataPointAtIndex:error:", a2, &v68);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v68;
  if (v8)
  {
    v9 = v8;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_4();
    goto LABEL_51;
  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = a1;
  objc_msgSend(v51, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = *(float *)objc_msgSend(v11, "dataPointer");
  v13 = a1;
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v12
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v14 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
  {
    __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_3(v14, v12);
    v13 = a1;
  }
  v67 = 0u;
  v65 = 0u;
  v66 = 0u;
  v64 = 0u;
  obj = *(id *)(*(_QWORD *)(v13 + 40) + 152);
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
  if (v15)
  {
    v53 = *(id *)v65;
    *(_QWORD *)&v16 = 138412546;
    v48 = v16;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(id *)v65 != v53)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v56 + 56) + 8) + 40), "objectForKey:", v18, v48);
        v19 = (GradientBuffer *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)MEMORY[0x1AF44DFA0]();
        objc_msgSend(v55, "getTensorNamed:directBind:", v18, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v56 + 64) + 8) + 40), "containsObject:", v18);
        if (v19)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(v56 + 40) + 152), "objectForKeyedSubscript:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 0;
          *(float *)&v24 = v12;
          -[GradientBuffer accumulateDifferenceBetweenTensorBefore:andTensorAfter:withScale:error:](v19, "accumulateDifferenceBetweenTensorBefore:andTensorAfter:withScale:error:", v23, v21, &v62, v24);
          v9 = v62;

        }
        else
        {
          v25 = [GradientBuffer alloc];
          objc_msgSend(*(id *)(*(_QWORD *)(v56 + 40) + 152), "objectForKeyedSubscript:", v18);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = 0;
          *(float *)&v27 = v12;
          v19 = -[GradientBuffer initWithTensorBefore:tensorAfter:withScale:shouldSparsify:error:](v25, "initWithTensorBefore:tensorAfter:withScale:shouldSparsify:error:", v26, v21, v22, &v63, v27);
          v9 = v63;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(v56 + 56) + 8) + 40), "setObject:forKeyedSubscript:", v19, v18);
        }
        if (v9)
        {
          v28 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v71 = v49;
            v72 = 2112;
            v73 = v18;
            _os_log_error_impl(&dword_1AD756000, v28, OS_LOG_TYPE_ERROR, "Unable to accumulate gradient of batch %lu for %@", buf, 0x16u);
          }
        }
        else if ((_DWORD)v22)
        {
          v29 = (id)sLog;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            -[GradientBuffer description](v19, "description");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v48;
            v71 = v18;
            v72 = 2112;
            v73 = v30;
            _os_log_debug_impl(&dword_1AD756000, v29, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);

          }
        }

        objc_autoreleasePoolPop(v20);
        if (v9)
        {

LABEL_51:
          v44 = 0;
          goto LABEL_52;
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v74, 16);
    }
    while (v15);
  }

  v31 = (_QWORD *)v56;
  v32 = ((unint64_t)v49 + 1) % *(int *)(v56 + 96);
  if (!v32)
  {
    multiply(*(void **)(*(_QWORD *)(*(_QWORD *)(v56 + 56) + 8) + 40), 1.0 / *(float *)(*(_QWORD *)(*(_QWORD *)(v56 + 48) + 8) + 24));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v56 + 72) + 8) + 24))
    {
      v45 = l2norm(*(void **)(*(_QWORD *)(*(_QWORD *)(v56 + 56) + 8) + 40));
      v46 = *(float *)(*(_QWORD *)(*(_QWORD *)(v56 + 80) + 8) + 24);
      if (v45 > v46)
        multiply(*(void **)(*(_QWORD *)(*(_QWORD *)(v56 + 56) + 8) + 40), v46 / v45);
    }
  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v54 = *(id *)(*(_QWORD *)(v56 + 40) + 152);
  v33 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
  if (!v33)
    goto LABEL_39;
  v34 = *(_QWORD *)v59;
  while (2)
  {
    for (j = 0; j != v33; ++j)
    {
      if (*(_QWORD *)v59 != v34)
        objc_enumerationMutation(v54);
      v36 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
      objc_msgSend(*(id *)(*(_QWORD *)(v31[7] + 8) + 40), "objectForKeyedSubscript:", v36);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      if (*(_BYTE *)(*(_QWORD *)(v31[11] + 8) + 24))
      {
        if (!v32 && v37)
        {
          objc_msgSend(*(id *)(v31[5] + 152), "objectForKeyedSubscript:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = 0;
          LODWORD(v40) = 1.0;
          objc_msgSend(v38, "applyToTensor:scale:error:", v39, &v57, v40);
          v9 = v57;

          if (v9)
          {
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
              __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_2();
            goto LABEL_50;
          }
          objc_msgSend(v38, "reset");
          v31 = (_QWORD *)v56;
          v41 = sLog;
          if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v71 = v36;
            _os_log_debug_impl(&dword_1AD756000, v41, OS_LOG_TYPE_DEBUG, "Applied gradient on %@", buf, 0xCu);
          }
        }
        objc_msgSend(v55, "getTensorNamed:directBind:", v36, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v31[5] + 152), "objectForKeyedSubscript:", v36);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        _copy(v42, v43);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_37;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
          __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_1();
LABEL_50:

        goto LABEL_51;
      }
LABEL_37:

      v31 = (_QWORD *)v56;
    }
    v33 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
    if (v33)
      continue;
    break;
  }
LABEL_39:

  v9 = 0;
  if (!v32)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v56 + 48) + 8) + 24) = 0;
  v44 = 1;
LABEL_52:

  return v44;
}

void __26___EARLMTGlobalNNLM_train__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1AD756000, v0, v1, "epochCallback is unable to retrieve output of iteration %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __26___EARLMTGlobalNNLM_train__block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_5(&dword_1AD756000, v0, v1, "Unable to set %@ after epoch %lu");
  OUTLINED_FUNCTION_1();
}

void __26___EARLMTGlobalNNLM_train__block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Unable to apply gradient", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

void __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_2_5(&dword_1AD756000, v0, v1, "Unable to set %@ after batch %lu");
  OUTLINED_FUNCTION_1();
}

void __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1AD756000, v0, v1, "Unable to apply gradient for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_3(os_log_t log, float a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = (int)a2;
  _os_log_debug_impl(&dword_1AD756000, log, OS_LOG_TYPE_DEBUG, "batchSize == %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_3_0();
}

void __26___EARLMTGlobalNNLM_train__block_invoke_214_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_1AD756000, v0, v1, "batchCallback is unable to retrieve outputs for batch %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
