@implementation ATXActionCacheBuilder

+ (id)serializedDataFromActionPredictionResults:(id)a3 lockscreenPredictionIndices:(id)a4
{
  void *v4;
  void *v5;

  +[ATXActionCacheBuilder serializedChunksFromActionPredictionResults:lockscreenPredictionIndices:](ATXActionCacheBuilder, "serializedChunksFromActionPredictionResults:lockscreenPredictionIndices:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ATXCacheFileJoinChunks();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)serializedChunksFromActionPredictionResults:(id)a3 lockscreenPredictionIndices:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id *v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  double v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id obj;
  void *v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id location;
  _QWORD v51[411];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v42 = a4;
  objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupForConsumerSubType:", 24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupNilString");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v38 = v8;
  objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupForConsumerSubType:", 25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v41 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupNilString");
    v41 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupForConsumerSubType:", 27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CF8C10], "abGroupNilString");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v39 = v14;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@:%@"), v8, v41, v14);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(MEMORY[0x1E0CF8CF0], "version");
  v47 = (void *)objc_opt_new();
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E40]), "initWithABGroup:assetVersion:", v43, v15);
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8E40]), "initWithABGroup:assetVersion:", v43, v15);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v40;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v16)
  {
    v17 = 0;
    v18 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v53 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v20, "scoredAction");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          location = 0;
          *((float *)&v51[409] + 1) = -31337.0;
          v23 = 16;
          LOWORD(v51[410]) = 0;
          do
          {
            *(float *)((char *)&v51[-1] + v23) = -31337.0;
            v23 += 4;
          }
          while (v23 != 3284);
          if (objc_msgSend(v20, "predictionItem"))
          {
            v24 = (id *)objc_msgSend(v20, "predictionItem");
            objc_storeStrong(&location, *v24);
            memcpy(v51, v24 + 1, 0xCD2uLL);
          }
          objc_msgSend(v22, "predictedItem");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setTitleForSerializationToCache");
          objc_msgSend(v25, "setSubtitleForSerializationToCache");
          objc_msgSend(v22, "score");
          objc_msgSend(v47, "recordPrediction:score:", v25);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v27) = HIDWORD(v51[409]);
          objc_msgSend(v46, "recordPrediction:actionHash:totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:", v26, v51[0], &v51[1], LOBYTE(v51[410]), BYTE1(v51[410]), v27);

          ++v17;
        }
        else if (objc_msgSend(v20, "predictionItem"))
        {
          v28 = objc_msgSend(v20, "predictionItem");
          LODWORD(v29) = *(_DWORD *)(v28 + 3284);
          objc_msgSend(v44, "recordPrediction:actionHash:totalScore:scoreInputs:isMediumConfidenceForBlendingLayer:isHighConfidenceForBlendingLayer:", *(_QWORD *)v28, *(_QWORD *)(v28 + 8), v28 + 16, *(unsigned __int8 *)(v28 + 3288), *(unsigned __int8 *)(v28 + 3289), v29);
        }

        objc_autoreleasePoolPop(v21);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v16);
  }

  objc_msgSend(v47, "finish");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_opt_new();
  objc_msgSend(v42, "count");
  ATXCacheAppendInteger();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __97__ATXActionCacheBuilder_serializedChunksFromActionPredictionResults_lockscreenPredictionIndices___block_invoke;
  v48[3] = &unk_1E82E3FC0;
  v32 = v31;
  v49 = v32;
  objc_msgSend(v42, "enumerateIndexesUsingBlock:", v48);
  objc_msgSend(v46, "finish");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "finish");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v30;
  v35 = (void *)objc_msgSend(v32, "copy");
  v56[1] = v35;
  v56[2] = v33;
  v56[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  return v36;
}

uint64_t __97__ATXActionCacheBuilder_serializedChunksFromActionPredictionResults_lockscreenPredictionIndices___block_invoke()
{
  return ATXCacheAppendInteger();
}

@end
