@implementation ATXActionPredictionsHelpers

+ (id)processCandidateActionPredictions:(id)a3 limit:(int)a4 predictionItemsToKeep:(void *)a5
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;

  v6 = *(_QWORD *)&a4;
  v7 = a3;
  +[ATXActionPredictionsHelpers sortedPredictions:](ATXActionPredictionsHelpers, "sortedPredictions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXActionPredictionsHelpers keepRandomPredictionItems:limit:predictionItemsToKeep:](ATXActionPredictionsHelpers, "keepRandomPredictionItems:limit:predictionItemsToKeep:", v8, (int)v6, a5);
  +[ATXActionPredictionsHelpers limitTheNumberOfPredictions:withLimit:](ATXActionPredictionsHelpers, "limitTheNumberOfPredictions:withLimit:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXActionPredictionsHelpers applyLogSoftmaxToPredictions:](ATXActionPredictionsHelpers, "applyLogSoftmaxToPredictions:", v9);
  +[ATXSlotResolution setSlotLogProbabilityForCandidateActionPredictions:](ATXSlotResolution, "setSlotLogProbabilityForCandidateActionPredictions:", v9);
  return v9;
}

+ (void)keepRandomPredictionItems:(id)a3 limit:(unint64_t)a4 predictionItemsToKeep:(void *)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void ***v13;
  void **v14;
  void ***v15;
  void ***v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void ***v23;
  void **v24;
  char *v25;
  void ***v26;
  void ***v27;
  uint64_t v28;
  char *v29;
  void ***v30;
  void *v31;
  void *v32;
  unint64_t v33;
  char **v34;
  id obj;
  void **v36;
  _BYTE v37[3282];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char *v42;
  void ***v43;
  void ***v44;
  _QWORD v45[5];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a5)
  {
    v33 = a4;
    v34 = (char **)a5;
    v43 = 0;
    v42 = 0;
    v44 = 0;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    v32 = v8;
    if (v9)
    {
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          if (v12)
            objc_msgSend(v12, "predictionItem");
          else
            bzero(&v36, 0xCE0uLL);
          v13 = v43;
          if (v43 >= v44)
          {
            v16 = (void ***)v42;
            v17 = 0xDAB7EC1DD3431B57 * (((char *)v43 - v42) >> 5);
            v18 = v17 + 1;
            if (v17 + 1 > 0x13E22CBCE4A902)
              std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
            if (0xB56FD83BA68636AELL * (((char *)v44 - v42) >> 5) > v18)
              v18 = 0xB56FD83BA68636AELL * (((char *)v44 - v42) >> 5);
            if (0xDAB7EC1DD3431B57 * (((char *)v44 - v42) >> 5) >= 0x9F1165E725481)
              v19 = 0x13E22CBCE4A902;
            else
              v19 = v18;
            v45[4] = &v44;
            if (v19)
            {
              v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)&v44, v19);
              v22 = v21;
              v13 = v43;
              v16 = (void ***)v42;
            }
            else
            {
              v20 = 0;
              v22 = 0;
            }
            v23 = (void ***)&v20[3296 * v17];
            v24 = v36;
            v36 = 0;
            *v23 = v24;
            memcpy(v23 + 1, v37, 0xCD2uLL);
            if (v13 == v16)
            {
              v29 = &v20[3296 * v17];
            }
            else
            {
              v25 = &v20[3296 * v17];
              v26 = v13;
              do
              {
                v27 = v26 - 412;
                v28 = (uint64_t)*(v26 - 412);
                v29 = v25 - 3296;
                *(v26 - 412) = 0;
                *((_QWORD *)v25 - 412) = v28;
                memcpy(v25 - 3288, v26 - 411, 0xCD2uLL);
                v25 = v29;
                v26 = v27;
              }
              while (v27 != v16);
            }
            v15 = v23 + 412;
            v42 = v29;
            v43 = v15;
            v30 = v44;
            v44 = (void ***)&v20[3296 * v22];
            v45[2] = v13;
            v45[3] = v30;
            v45[1] = v16;
            v45[0] = v16;
            std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v45);
          }
          else
          {
            v14 = v36;
            v36 = 0;
            *v43 = v14;
            memcpy(v13 + 1, v37, 0xCD2uLL);
            v15 = v13 + 412;
          }
          v43 = v15;

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      }
      while (v9);
    }

    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ATXKeepRandomPredictionItemsBelowLimit((uint64_t)&v42, v33, v34, (int)objc_msgSend(v31, "numberOfRandomSlotsToKeepForLogging"));

    v36 = (void **)&v42;
    std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v36);
    v8 = v32;
  }

}

+ (void)sortPredictions:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_11);
}

uint64_t __47__ATXActionPredictionsHelpers_sortPredictions___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  float v6;
  float v7;
  float v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "score");
  v7 = v6;
  objc_msgSend(v5, "score");
  if (v7 <= v8)
    v9 = 0;
  else
    v9 = -1;
  if (v7 < v8)
    v10 = 1;
  else
    v10 = v9;

  return v10;
}

+ (id)sortedPredictions:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "sortPredictions:", v4);
  return v4;
}

+ (id)limitTheNumberOfPredictions:(id)a3 withLimit:(int)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v11;

  v7 = a3;
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXActionPredictionsHelpers.mm"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit >= 0"));

  }
  if (objc_msgSend(v7, "count") > (unint64_t)a4)
  {
    objc_msgSend(v7, "subarrayWithRange:", 0, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");

    v7 = (id)v9;
  }
  return v7;
}

+ (void)applyJointLogProbabilityToActionPredictions:(id)a3 withAppActionTypePredictionScore:(double)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  float v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = a3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "scoredAction", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "score");
        v11 = v10 + a4;
        *(float *)&v11 = v11;
        objc_msgSend(v9, "setScore:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

+ (void)applyNormalizationToPredictions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  float v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t j;
  void *v17;
  float v18;
  float v19;
  float v20;
  unint64_t v21;
  id v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t k;
  void *v27;
  float v28;
  double v29;
  float v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v40;
      v7 = 0.0;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v40 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "score");
          v7 = v7 + v9;
        }
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 0.0;
    }

    v10 = objc_msgSend(v4, "count");
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    v13 = v7 / (double)v10;
    if (v12)
    {
      v14 = *(_QWORD *)v36;
      v15 = 0.0;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v17, "score");
          v19 = v18;
          objc_msgSend(v17, "score");
          v15 = v15 + (v19 - v13) * (v20 - v13);
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
      }
      while (v12);
    }
    else
    {
      v15 = 0.0;
    }

    v21 = objc_msgSend(v11, "count");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v22 = v11;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    if (v23)
    {
      v24 = sqrt(v15 / (double)v21);
      v25 = *(_QWORD *)v32;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v32 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * k);
          if (v24 == 0.0)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "score", (_QWORD)v31);
            v29 = v30 - v13;
          }
          else
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * k), "score");
            v29 = (v28 - v13) / v24;
          }
          *(float *)&v29 = v29;
          objc_msgSend(v27, "setScore:", v29, (_QWORD)v31);
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v23);
    }

  }
}

+ (void)applyLogOfLinearProbabilityTransformationToPredictions:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  uint64_t i;
  void *v12;
  float v13;
  float v14;
  float v15;
  float v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  float v24;
  long double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_25;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v31;
    v9 = 0.0;
    v10 = INFINITY;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "score");
        v14 = v13;
        objc_msgSend(v12, "score");
        if (v10 > v15)
        {
          objc_msgSend(v12, "score");
          v10 = v16;
        }
        v9 = v9 + v14;
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);

    v17 = 0.0;
    if (v10 <= 0.0)
    {
      v17 = 1.0 - v10;
      v9 = v9 + (1.0 - v10) * (double)(unint64_t)objc_msgSend(v6, "count");
    }
    if (v9 > 0.0)
      goto LABEL_17;
  }
  else
  {

    v9 = 0.0;
    v17 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXActionPredictionsHelpers.mm"), 126, CFSTR("Error: Shifting sum is not greater than zero"));

LABEL_17:
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v23, "score", (_QWORD)v26);
        v25 = log((v17 + v24) / v9);
        *(float *)&v25 = v25;
        objc_msgSend(v23, "setScore:", (double)v25);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v20);
  }

LABEL_25:
}

+ (void)applyLogSoftmaxToPredictions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  void *v8;
  float v9;
  float v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  long double v14;
  uint64_t j;
  float v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t k;
  void *v22;
  float v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v34;
    v6 = -INFINITY;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v8, "score");
        if (v6 < v9)
        {
          objc_msgSend(v8, "score");
          v6 = v10;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v4);
  }
  else
  {
    v6 = -INFINITY;
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v30;
    v14 = 0.0;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * j), "score");
        v14 = v14 + exp(v16 - v6);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v12);
  }
  else
  {
    v14 = 0.0;
  }

  v17 = log(v14);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v18 = v11;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v26;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v18);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * k);
        objc_msgSend(v22, "score", (_QWORD)v25);
        v24 = v23 - v6 - v17;
        *(float *)&v24 = v24;
        objc_msgSend(v22, "setScore:", v24);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v19);
  }

}

@end
