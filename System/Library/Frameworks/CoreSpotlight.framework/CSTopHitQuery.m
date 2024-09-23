@implementation CSTopHitQuery

- (CSTopHitQuery)initWithQueryString:(id)a3 queryContext:(id)a4
{
  CSTopHitQuery *v4;
  CSTopHitQuery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSTopHitQuery;
  v4 = -[CSUserQuery initWithQueryString:queryContext:](&v7, sel_initWithQueryString_queryContext_, a3, a4);
  v5 = v4;
  if (v4)
    thq_commonInit(v4);
  return v5;
}

- (CSTopHitQuery)initWithQueryString:(id)a3 context:(id)a4
{
  CSTopHitQuery *v4;
  CSTopHitQuery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSTopHitQuery;
  v4 = -[CSUserQuery initWithQueryString:context:](&v7, sel_initWithQueryString_context_, a3, a4);
  v5 = v4;
  if (v4)
    thq_commonInit(v4);
  return v5;
}

- (CSTopHitQuery)initWithUserString:(id)a3 queryContext:(id)a4
{
  CSTopHitQuery *v4;
  CSTopHitQuery *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSTopHitQuery;
  v4 = -[CSUserQuery initWithQueryString:context:](&v7, sel_initWithQueryString_context_, a3, a4);
  v5 = v4;
  if (v4)
    thq_commonInit(v4);
  return v5;
}

- (CSTopHitQuery)initWithUserQueryString:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  CSTopHitQuery *v8;
  CSTopHitQuery *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "maxItemCount") >= 1)
    objc_msgSend(v7, "setMaxResultCount:", objc_msgSend(v7, "maxItemCount"));
  v11.receiver = self;
  v11.super_class = (Class)CSTopHitQuery;
  v8 = -[CSUserQuery initWithUserQueryString:queryContext:](&v11, sel_initWithUserQueryString_queryContext_, v6, v7);
  v9 = v8;
  if (v8)
    thq_commonInit(v8);

  return v9;
}

- (void)filterRankedItems:(id)a3 hitCount:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t tokenCount;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  unsigned int v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  float v28;
  float v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  float v34;
  float v35;
  float v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  NSObject *v40;
  void *v41;
  int v42;
  NSObject *v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  unint64_t v53;
  __int16 v54;
  double v55;
  __int16 v56;
  double v57;
  __int16 v58;
  double v59;
  __int16 v60;
  double v61;
  __int16 v62;
  double v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  tokenCount = self->_tokenCount;
  if (tokenCount && (unint64_t)objc_msgSend(v6, "count") >= 2)
  {
    v46 = tokenCount;
    v47 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributeSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributeDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL1"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "attributeSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributeDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    v20 = v19;

    if (v14 <= 0.00000011921 || ((v21 = objc_msgSend(v7, "count"), v21 >= a4) ? (v22 = a4) : (v22 = v21), v22 < 2))
    {
LABEL_26:
      v39 = v46;
    }
    else
    {
      v45 = __PAIR64__(*(unsigned int *)"H?F?", v20);
      v23 = 1;
      while (1)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v23, v45);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "attributeSet");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "attributeDictionary");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL1"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "floatValue");
        v29 = v28;

        objc_msgSend(v7, "objectAtIndexedSubscript:", v23);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "attributeSet");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "attributeDictionary");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v35 = v34;

        v36 = v29 / v14;
        if (v29 == 0.0)
        {
          if (_os_feature_enabled_impl() && v35 < 0.33 && v29 < 0.00000011921)
            goto LABEL_25;
        }
        else if (v36 > 0.890452653 && v36 <= 0.8933734
               || v29 > 0.07188 && v29 <= 0.16988 && v36 <= *((float *)&v45 + 1))
        {
LABEL_25:
          v47 = v23;
          goto LABEL_26;
        }
        if (v47 == v23)
          break;
        ++v23;
        v37 = objc_msgSend(v7, "count");
        if (v37 >= a4)
          v38 = a4;
        else
          v38 = v37;
        if (v23 >= v38)
          goto LABEL_26;
      }
      logForCSLogCategoryDefault();
      v43 = objc_claimAutoreleasedReturnValue();
      v39 = v46;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        -[CSUserQuery queryContext](self, "queryContext");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67110912;
        v49 = objc_msgSend(v44, "queryID");
        v50 = 2048;
        v51 = v46;
        v52 = 2048;
        v53 = v47;
        v54 = 2048;
        v55 = v29;
        v56 = 2048;
        v57 = v36;
        v58 = 2048;
        v59 = v35;
        v60 = 2048;
        v61 = (float)(v35 / *(float *)&v45);
        v62 = 2048;
        v63 = (float)(*(float *)&v45 - v35);
        _os_log_impl(&dword_18C42F000, v43, OS_LOG_TYPE_INFO, "[TopHit Thresholding][qid=%d][num_tokens=%lu] Thresholding applied at item %lu:\nScores={L1Score=%.04f, L1ScoreRatio=%.04f, L2Score=%.04f, L2ScoreRatio=%.04f, L2ScoreDiff=%.04f}", buf, 0x4Eu);

      }
    }
    if (v47 < objc_msgSend(v7, "count"))
    {
      logForCSLogCategoryDefault();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        -[CSUserQuery queryContext](self, "queryContext");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "queryID");
        *(_DWORD *)buf = 67109632;
        v49 = v42;
        v50 = 2048;
        v51 = v39;
        v52 = 2048;
        v53 = v47;
        _os_log_impl(&dword_18C42F000, v40, OS_LOG_TYPE_INFO, "[TopHit Thresholding][qid=%d][num_tokens=%lu] Results beyond the top %lu results are filtered", buf, 0x1Cu);

      }
      objc_msgSend(v7, "removeObjectsInRange:", v47, objc_msgSend(v7, "count") - v47);
    }
  }

}

- (void)handleBatches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t k;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  unint64_t v34;
  CSTopHitQuery *v35;
  objc_super v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSUserQuery queryContext](self, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "maxCount") < 1)
  {
    v7 = 0;
  }
  else
  {
    -[CSUserQuery queryContext](self, "queryContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "maxCount");

  }
  logForCSLogCategoryQuery();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CSTopHitQuery handleBatches:].cold.1();
  v34 = v7;
  v35 = self;

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v43 != v13)
          objc_enumerationMutation(v9);
        v12 += objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "count");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = v9;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(v15, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
    }
    while (v18);
  }

  objc_msgSend(v15, "objectEnumerator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = 0;
  for (k = 0; ; k = v28)
  {
    objc_msgSend(v21, "nextObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (!v25)
      break;
    objc_msgSend(v25, "bundleID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22 || objc_msgSend(v22, "isEqualToString:", v27))
    {
      v28 = k + 1;
      goto LABEL_38;
    }
LABEL_28:
    if (k == 1)
    {
      objc_msgSend(v15, "objectAtIndexedSubscript:", v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v29;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v37.receiver = v35;
      v37.super_class = (Class)CSTopHitQuery;
      -[CSUserQuery handleFoundItems:](&v37, sel_handleFoundItems_, v30);

    }
    else
    {
      v31 = objc_alloc(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v15, "subarrayWithRange:", v23, k);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v31, "initWithArray:", v32);

      +[CSTopHitQuery sortSearchableItems:](CSTopHitQuery, "sortSearchableItems:", v29);
      if ((objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0
        || objc_msgSend(v22, "isEqualToString:", CFSTR("com.apple.pommesctl")))
      {
        -[CSTopHitQuery filterRankedItems:hitCount:](v35, "filterRankedItems:hitCount:", v29, v34);
      }
      if (v34)
      {
        if (v34 < objc_msgSend(v29, "count"))
          objc_msgSend(v29, "removeObjectsInRange:", v34, objc_msgSend(v29, "count") - v34);
      }
      v36.receiver = v35;
      v36.super_class = (Class)CSTopHitQuery;
      -[CSUserQuery handleFoundItems:](&v36, sel_handleFoundItems_, v29);
    }
    v28 = v26 != 0;

    v23 += k;
LABEL_38:

    v33 = v27;
    v22 = v33;
  }
  v27 = v22;
  if (k)
    goto LABEL_28;

}

+ (void)sortSearchableItems:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_15);
}

uint64_t __37__CSTopHitQuery_sortSearchableItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LODWORD(v8) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LODWORD(v13) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(v7, "floatValue");
  v16 = v15;
  objc_msgSend(v12, "floatValue");
  if (v16 <= v17)
  {
    objc_msgSend(v7, "floatValue");
    v20 = v19;
    objc_msgSend(v12, "floatValue");
    v18 = v20 < v21;
  }
  else
  {
    v18 = -1;
  }

  return v18;
}

- (unint64_t)dispatchApplyWidth
{
  return 1;
}

- (void)handleFoundItems:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSTopHitQuery handleFoundItems:].cold.1();

  -[NSMutableArray addObject:](self->_batches, "addObject:", v4);
}

- (void)handleFoundInstantAnswers:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a3;
  -[CSUserQuery foundInstantAnswersHandler](self, "foundInstantAnswersHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[CSTopHitQuery handleFoundInstantAnswers:].cold.1();

    -[CSUserQuery foundInstantAnswersHandler](self, "foundInstantAnswersHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v4);

  }
}

- (BOOL)isTopHitQuery
{
  return 1;
}

- (void)handleCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSTopHitQuery handleCompletion:].cold.1();

  if (!v4)
    -[CSTopHitQuery handleBatches:](self, "handleBatches:", self->_batches);
  v6.receiver = self;
  v6.super_class = (Class)CSTopHitQuery;
  -[CSUserQuery handleCompletion:](&v6, sel_handleCompletion_, v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batches, 0);
}

- (void)handleBatches:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "Handle batches %@ for query:%@");
  OUTLINED_FUNCTION_1();
}

- (void)handleFoundItems:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "Received batch %@ for query:%@");
  OUTLINED_FUNCTION_1();
}

- (void)handleFoundInstantAnswers:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "Handle instant answer batches %@ for query:%@");
  OUTLINED_FUNCTION_1();
}

- (void)handleCompletion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_4_2(&dword_18C42F000, v0, v1, "Received completion %@ for query:%@");
  OUTLINED_FUNCTION_1();
}

@end
