@implementation VideoRanker

- (VideoRanker)initWithCorpus:(id)a3
{
  id v5;
  void *v6;
  VideoRanker *v7;
  VideoRanker *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *tfs;
  NSMutableDictionary *v12;
  NSMutableDictionary *maxSegments;
  VideoRanker *v14;
  VideoRanker *v15;
  objc_super v17;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v17.receiver = self;
    v17.super_class = (Class)VideoRanker;
    v7 = -[VideoRanker init](&v17, sel_init);
    v8 = v7;
    if (!v7)
      goto LABEL_5;
    objc_storeStrong((id *)&v7->_corpus, a3);
    -[NSDictionary allKeys](v8->_corpus, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_corpusSize = objc_msgSend(v9, "count");

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    tfs = v8->_tfs;
    v8->_tfs = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    maxSegments = v8->_maxSegments;
    v8->_maxSegments = v12;

    *(_QWORD *)&v8->_b = 0x3FC000003F400000;
    v8->_topK = 20;
    if (!-[VideoRanker fit](v8, "fit"))
    {
      if (-[VideoRanker termAndDocumentFrequencies](v8, "termAndDocumentFrequencies"))
        v14 = 0;
      else
        v14 = v8;
    }
    else
    {
LABEL_5:
      v14 = 0;
    }
    v15 = v14;
  }
  else
  {
    v15 = 0;
    v8 = self;
  }

  return v15;
}

- (int)fit
{
  uint64_t v2;
  uint64_t i;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t j;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  float v16;
  int v17;
  void *v18;
  int topK;
  int v20;
  int v21;
  void *v22;
  float v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSDictionary allKeys](self->_corpus, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
  if (v2)
  {
    v37 = 0;
    v33 = *(_QWORD *)v45;
    while (2)
    {
      v32 = v2;
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v45 != v33)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_corpus, "objectForKeyedSubscript:", v4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v38, "count"))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v49 = v4;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No segments found for %@", buf, 0xCu);
          }

          v17 = -23803;
          goto LABEL_25;
        }
        v35 = objc_msgSend(v38, "count");
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v5 = v38;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
        v36 = v4;
        v7 = 0;
        if (v6)
        {
          v8 = *(_QWORD *)v41;
          v9 = &unk_1E6B72020;
          do
          {
            for (j = 0; j != v6; ++j)
            {
              if (*(_QWORD *)v41 != v8)
                objc_enumerationMutation(v5);
              v11 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("quality"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = v12 < v9;

              if (!v13)
              {
                objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("quality"));
                v14 = objc_claimAutoreleasedReturnValue();

                v15 = v11;
                v9 = (void *)v14;
                v7 = v15;
              }
            }
            v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
          }
          while (v6);
        }
        else
        {
          v9 = &unk_1E6B72020;
        }

        objc_msgSend(v34, "addObject:", v9);
        -[NSMutableDictionary setObject:forKey:](self->_maxSegments, "setObject:forKey:", v7, v36);

        v37 += v35;
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v55, 16);
      if (v2)
        continue;
      break;
    }
    v16 = (float)v37;
  }
  else
  {
    v16 = 0.0;
  }

  self->_avgDocumentLength = v16 / (float)self->_corpusSize;
  objc_msgSend(v34, "sortUsingComparator:", &__block_literal_global_85);
  topK = self->_topK;
  v20 = objc_msgSend(v34, "count");
  if (topK >= v20)
    v21 = v20;
  else
    v21 = topK;
  self->_topK = v21;
  objc_msgSend(v34, "objectAtIndexedSubscript:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "floatValue");
  self->_similarityThreshold = v23;

  v18 = v34;
  if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_topK);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v25 = self->_similarityThreshold;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0CB37E8];
    -[NSMutableDictionary allKeys](self->_maxSegments, "allKeys");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v49 = v24;
    v50 = 2112;
    v51 = v26;
    v52 = 2112;
    v53 = v29;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BM25: fit top_k %@, with threshold %@, maxSeg count %@", buf, 0x20u);

    v17 = 0;
LABEL_25:
    v18 = v34;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

uint64_t __18__VideoRanker_fit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (int)termAndDocumentFrequencies
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  float v13;
  int v14;
  NSMutableDictionary *tfs;
  void *v16;
  double v17;
  void *v18;
  int result;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[NSDictionary allKeys](self->_corpus, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
  if (v3)
  {
    v25 = *(_QWORD *)v32;
    while (2)
    {
      v4 = 0;
      v24 = v3;
      do
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v4);
        -[NSDictionary objectForKeyedSubscript:](self->_corpus, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v6, "count"))
        {
          if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v36 = v5;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "No segments found for %@", buf, 0xCu);
          }

          return -23803;
        }
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v7 = v6;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
        v26 = v5;
        v9 = 0;
        if (v8)
        {
          v10 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v28 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("quality"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "floatValue");
              v14 = v13 > self->_similarityThreshold;

              v9 += v14;
            }
            v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v41, 16);
          }
          while (v8);
        }

        tfs = self->_tfs;
        v16 = (void *)MEMORY[0x1E0CB37E8];
        *(float *)&v17 = (float)v9 / (float)(unint64_t)objc_msgSend(v7, "count");
        objc_msgSend(v16, "numberWithFloat:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKey:](tfs, "setObject:forKey:", v18, v26);

        self->_df += v9;
        ++v4;
      }
      while (v4 != v24);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v42, 16);
      if (v3)
        continue;
      break;
    }
  }

  self->_idf = (int)log(((double)(self->_corpusSize - self->_df) + 0.5) / ((double)self->_df + 0.5) + 1.0);
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    result = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (!result)
      return result;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_idf);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_df);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableDictionary count](self->_tfs, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v36 = v20;
    v37 = 2112;
    v38 = v21;
    v39 = 2112;
    v40 = v22;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "BM25: term And DocumentFrequencies _idf %@, _df %@, _tfs count %@", buf, 0x20u);

  }
  return 0;
}

- (id)rankingScores
{
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  float v9;
  float v10;
  int idf;
  float k1;
  float b;
  float avgDocumentLength;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  uint64_t v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[NSDictionary allKeys](self->_corpus, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v3)
  {
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_corpus, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "count");

        -[NSMutableDictionary objectForKeyedSubscript:](self->_tfs, "objectForKeyedSubscript:", v5);
        v8 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v8, "floatValue");
        v10 = v9;

        idf = self->_idf;
        b = self->_b;
        k1 = self->_k1;
        avgDocumentLength = self->_avgDocumentLength;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_maxSegments, "objectForKeyedSubscript:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = v15 == 0;

        if ((v8 & 1) != 0)
        {
          v18 = &unk_1E6B72490;
        }
        else
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_maxSegments, "objectForKeyedSubscript:", v5);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("quality"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        *(float *)&v16 = (float)((float)(k1 + 1.0) * (float)(idf * (int)v10))
                       / (float)((float)(int)v10
                               + (float)(k1
                                       * (float)((float)(1.0 - b) + (float)((float)(b * (float)v7) / avgDocumentLength))));
        v29[0] = CFSTR("BM25Rank");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29[1] = CFSTR("SimilarityScore");
        v30[0] = v19;
        v30[1] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setObject:forKey:", v20, v5);
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v3);
  }

  return v24;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxSegments, 0);
  objc_storeStrong((id *)&self->_tfs, 0);
  objc_storeStrong((id *)&self->_corpus, 0);
}

@end
