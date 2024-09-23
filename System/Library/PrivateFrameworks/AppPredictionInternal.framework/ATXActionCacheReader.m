@implementation ATXActionCacheReader

- (ATXActionCacheReader)initWithChunks:(id)a3
{
  id v4;
  ATXActionCacheReader *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_super v12;
  uint64_t buf[5];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ATXActionCacheReader;
  v5 = -[ATXActionCacheClientReader initWithChunks:](&v12, sel_initWithChunks_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "count");
    if (v6 == -[ATXActionCacheClientReader chunkCount](v5, "chunkCount"))
    {
      v7 = (void *)MEMORY[0x1CAA48B6C]();
      -[ATXActionCacheReader _getActionToIndexMap](v5, "_getActionToIndexMap");
      std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::__move_assign((uint64_t)&v5->_actionToIndexMap, buf);
      std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)buf);
      objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXActionCacheReader _getIndexToPredictionItemMapWithChunk:withPredictionCount:map:abGroup:assetVersion:](ATXActionCacheReader, "_getIndexToPredictionItemMapWithChunk:withPredictionCount:map:abGroup:assetVersion:", v8, v5->_actionToIndexMap.__table_.__p2_.__value_, &v5->_predictionItems, &v5->_abGroup, &v5->_assetVersion);

      objc_msgSend(v4, "objectAtIndexedSubscript:", 3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXActionCacheReader _getExtraPredictionsFromChunk:map:abGroup:assetVersion:](ATXActionCacheReader, "_getExtraPredictionsFromChunk:map:abGroup:assetVersion:", v9, &v5->_extraPredictionItems, 0, 0);

      objc_autoreleasePoolPop(v7);
    }
    else
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ATXActionCacheReader initWithChunks:].cold.1((uint8_t *)buf, objc_msgSend(v4, "count"), -[ATXActionCacheClientReader chunkCount](v5, "chunkCount"), v10);

    }
  }

  return v5;
}

- (ATXActionCacheReader)initWithData:(id)a3
{
  void *v4;
  ATXActionCacheReader *v5;

  ATXCacheFileSplitChunks();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXActionCacheReader initWithChunks:](self, "initWithChunks:", v4);

  return v5;
}

- (ATXPredictionItem)predictionItemForAction:(SEL)a3
{
  uint64_t **v6;
  unint64_t v7;
  ATXPredictionItem *begin;
  id *p_key;
  uint64_t j;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  uint64_t i;
  ATXPredictionItem *result;
  id v16;
  uint8_t buf[24];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v6 = std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::find<ATXAction * {__strong}>(&self->_actionToIndexMap.__table_.__bucket_list_.__ptr_.__value_, &v16);
  if (v6)
  {
    v7 = *((int *)v6 + 6);
    begin = self->_predictionItems.__begin_;
    if (0xDAB7EC1DD3431B57 * (((char *)self->_predictionItems.__end_ - (char *)begin) >> 5) <= v7)
    {
      __atxlog_handle_default();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXActionCacheReader predictionItemForAction:].cold.1(v13, buf, v11);
      }

      retstr->key = 0;
      retstr->score = -31337.0;
      *(_WORD *)&retstr->isMediumConfidenceForBlendingLayer = 0;
      for (i = 16; i != 3284; i += 4)
        *(float *)((char *)&retstr->key + i) = -31337.0;
    }
    else
    {
      p_key = (id *)&begin[(int)v7].key;
      retstr->key = (NSString *)*p_key;
      memcpy(&retstr->actionHash, p_key + 1, 0xCD2uLL);
    }
  }
  else
  {
    -[ATXActionCacheReader failAndLog:](self, "failAndLog:", v16);
    retstr->key = 0;
    retstr->score = -31337.0;
    *(_WORD *)&retstr->isMediumConfidenceForBlendingLayer = 0;
    for (j = 16; j != 3284; j += 4)
      *(float *)((char *)&retstr->key + j) = -31337.0;
  }

  return result;
}

- (void)failAndLog:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  _QWORD *next;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *i;
  NSObject *v22;
  int v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  int v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t value;
  __CFString *v39;
  __CFString *v40;
  void *v41;
  __CFString *v42;
  __CFString *v43;
  void *v44;
  void *v45;
  id v46;
  uint8_t buf[4];
  _BYTE v48[40];
  _BYTE v49[10];
  uint64_t v50;
  __int16 v51;
  unint64_t v52;
  __int16 v53;
  const __CFString *v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v46 = v4;
  if (objc_msgSend(v4, "isEqualToAction:", v4))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v39 = v5;
  v6 = objc_msgSend(v4, "hash");
  if (v6 == objc_msgSend(v4, "hash"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  v40 = v7;
  objc_msgSend(v4, "bundleId");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_className");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = CFSTR("No intent name");
  if (v9)
    v11 = (__CFString *)v9;
  v42 = v11;

  objc_msgSend(v4, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activityType");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("No activity type");
  if (v13)
    v15 = (__CFString *)v13;
  v43 = v15;

  next = self->_actionToIndexMap.__table_.__p1_.__value_.__next_;
  if (next)
  {
    v17 = CFSTR("NO");
    do
    {
      if (!next[2])
        v17 = CFSTR("YES");
      next = (_QWORD *)*next;
    }
    while (next);
  }
  else
  {
    v17 = CFSTR("NO");
  }
  value = self->_actionToIndexMap.__table_.__p2_.__value_;
  -[ATXActionCacheClientReader actionsWithConsumerSubType:limit:](self, "actionsWithConsumerSubType:limit:", 22, 0x7FFFFFFFLL);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v18, "count");

  -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", 0x7FFFFFFFLL, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v19, "count");

  -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", 0x7FFFFFFFLL, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v20, "count");

  for (i = self->_actionToIndexMap.__table_.__p1_.__value_.__next_; i; i = *(void **)i)
  {
    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = *((_DWORD *)i + 6);
      objc_msgSend(*((id *)i + 2), "bundleId");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "intent");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "_className");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = (void *)v24;
      if (v24)
        v26 = (const __CFString *)v24;
      else
        v26 = CFSTR("No intent name");
      objc_msgSend(v4, "userActivity", v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "activityType");
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = (void *)v28;
      if (v28)
        v30 = (const __CFString *)v28;
      else
        v30 = CFSTR("No activity type");
      v31 = objc_msgSend(*((id *)i + 2), "isEqual:", v46);
      v32 = objc_msgSend(*((id *)i + 2), "hash");
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v48 = v23;
      *(_WORD *)&v48[4] = 2112;
      *(_QWORD *)&v48[6] = v45;
      *(_WORD *)&v48[14] = 2112;
      *(_QWORD *)&v48[16] = v26;
      *(_WORD *)&v48[24] = 2112;
      *(_QWORD *)&v48[26] = v30;
      *(_WORD *)&v48[34] = 1024;
      *(_DWORD *)&v48[36] = v31;
      *(_WORD *)v49 = 2048;
      *(_QWORD *)&v49[2] = v32;
      _os_log_error_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_ERROR, "Action %d in _actionToIndexMap: bundleID: %@, Intent name: %@, activity type: %@, equal to action: %{BOOL}d, hash: %lu", buf, 0x36u);

      v4 = v46;
    }

  }
  __atxlog_handle_default();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
  {
    v34 = objc_msgSend(v4, "hash");
    *(_DWORD *)buf = 138414850;
    *(_QWORD *)v48 = v39;
    *(_WORD *)&v48[8] = 2112;
    *(_QWORD *)&v48[10] = v40;
    *(_WORD *)&v48[18] = 2112;
    *(_QWORD *)&v48[20] = v41;
    *(_WORD *)&v48[28] = 2112;
    *(_QWORD *)&v48[30] = v42;
    *(_WORD *)&v48[38] = 2112;
    *(_QWORD *)v49 = v43;
    *(_WORD *)&v49[8] = 2048;
    v50 = v34;
    v51 = 2048;
    v52 = value;
    v53 = 2112;
    v54 = v17;
    v55 = 2048;
    v56 = v37;
    v57 = 2048;
    v58 = v36;
    v59 = 2048;
    v60 = v35;
    _os_log_fault_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_FAULT, "Failed to find action in _secondStage. Self-equality, hash-equality: %@, %@, bundleID: %@, Intent name: %@, activity type: %@, hash: %lu, map items: %lu, nil in map: %@. lock, filtered, unfiltered: %lu %lu %lu", buf, 0x70u);
  }

}

- (void)enumerateExtraPredictionItemsWithBlock:(id)a3
{
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *p_extraPredictionItems;
  ATXPredictionItem *begin;
  ATXPredictionItem *end;
  void *v7;
  void (**v8)(id, ATXPredictionItem *);

  v8 = (void (**)(id, ATXPredictionItem *))a3;
  p_extraPredictionItems = &self->_extraPredictionItems;
  begin = self->_extraPredictionItems.__begin_;
  end = p_extraPredictionItems->__end_;
  while (begin != end)
  {
    v7 = (void *)MEMORY[0x1CAA48B6C]();
    v8[2](v8, begin);
    objc_autoreleasePoolPop(v7);
    ++begin;
  }

}

- (void)enumerateActionsAndPredictionItemsForConsumerSubtype:(unsigned __int8)a3 limit:(unint64_t)a4 block:(id)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  char v14;
  _QWORD v15[4];
  id v16;
  ATXActionCacheReader *v17;
  id v18;

  v6 = a3;
  v11 = a5;
  if ((_DWORD)v6 == 22)
  {
    -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", a4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXActionCacheClientReader lockscreenPredictionIndicesUpToLimit:](self, "lockscreenPredictionIndicesUpToLimit:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke;
    v15[3] = &unk_1E82E2558;
    v10 = v8;
    v16 = v10;
    v17 = self;
    v18 = v11;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v15);

  }
  else
  {
    -[ATXActionCacheClientReader actionsWithConsumerSubType:limit:](self, "actionsWithConsumerSubType:limit:", v6, a4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke_16;
    v12[3] = &unk_1E82E2580;
    v12[4] = self;
    v13 = v11;
    v14 = v6;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

  }
}

void __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke(uint64_t a1, unint64_t a2)
{
  void *v4;
  uint64_t v5;
  id *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  unint64_t v10;
  id v11[414];

  v11[413] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  if (0xDAB7EC1DD3431B57 * ((*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) - v5) >> 5) <= a2)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0xDAB7EC1DD3431B57
          * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72) - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64)) >> 5);
      LODWORD(v11[0]) = 138412802;
      *(id *)((char *)v11 + 4) = v9;
      WORD2(v11[1]) = 2048;
      *(id *)((char *)&v11[1] + 6) = (id)a2;
      HIWORD(v11[2]) = 2048;
      v11[3] = (id)v10;
      _os_log_fault_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_FAULT, "%@ - lockscreen prediction index (%lu) is out of range of _predictionItems (%li)", (uint8_t *)v11, 0x20u);

    }
  }
  else
  {
    v6 = (id *)(v5 + 3296 * a2);
    v11[0] = *v6;
    memcpy(&v11[1], v6 + 1, 0xCD2uLL);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __89__ATXActionCacheReader_enumerateActionsAndPredictionItemsForConsumerSubtype_limit_block___block_invoke_16(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  id *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13[414];

  v13[413] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  if (0xDAB7EC1DD3431B57 * ((*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) - v6) >> 5) <= a3)
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", *(unsigned __int8 *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0xDAB7EC1DD3431B57
          * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)) >> 5);
      LODWORD(v13[0]) = 138413058;
      *(id *)((char *)v13 + 4) = v10;
      WORD2(v13[1]) = 2112;
      *(id *)((char *)&v13[1] + 6) = v11;
      HIWORD(v13[2]) = 2048;
      v13[3] = (id)a3;
      LOWORD(v13[4]) = 2048;
      *(id *)((char *)&v13[4] + 2) = (id)v12;
      _os_log_fault_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_FAULT, "%@ - %@ prediction index (%lu) is out of range of _predictionItems (%li)", (uint8_t *)v13, 0x2Au);

    }
  }
  else
  {
    v7 = (id *)(v6 + 3296 * a3);
    v13[0] = *v7;
    memcpy(&v13[1], v7 + 1, 0xCD2uLL);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (void)_getExtraPredictionsFromChunk:(id)a3 map:(void *)a4 abGroup:(id *)a5 assetVersion:(int64_t *)a6
{
  id v9;
  id *v10;
  id *i;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];

  v9 = a3;
  v10 = *(id **)a4;
  for (i = (id *)*((_QWORD *)a4 + 1); i != v10; *i)
    i -= 412;
  *((_QWORD *)a4 + 1) = v10;
  objc_msgSend(MEMORY[0x1E0CF8E48], "stringKeyWithData:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__ATXActionCacheReader__getExtraPredictionsFromChunk_map_abGroup_assetVersion___block_invoke;
  v15[3] = &__block_descriptor_40_e39_v52__0_B8__NSString_16Q24f32r_f36B44B48l;
  v15[4] = a4;
  objc_msgSend(v12, "enumerateApps:", v15);
  if (a5)
  {
    objc_msgSend(v12, "abGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *a5;
    *a5 = v13;

  }
  if (a6)
    *a6 = objc_msgSend(v12, "assetVersion");

}

void __79__ATXActionCacheReader__getExtraPredictionsFromChunk_map_abGroup_assetVersion___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, const void *a6)
{
  id v10;
  char **v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  _QWORD v32[5];
  _BYTE __dst[3268];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = *(char ***)(a1 + 32);
  v12 = v10;
  memcpy(__dst, a6, sizeof(__dst));
  v13 = (unint64_t)v11[1];
  v14 = (unint64_t)v11[2];
  if (v13 >= v14)
  {
    v16 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v13 - (_QWORD)*v11) >> 5);
    if (v16 + 1 > 0x13E22CBCE4A902)
      std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
    v17 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v14 - (_QWORD)*v11) >> 5);
    v18 = 2 * v17;
    if (2 * v17 <= v16 + 1)
      v18 = v16 + 1;
    if (v17 >= 0x9F1165E725481)
      v19 = 0x13E22CBCE4A902;
    else
      v19 = v18;
    v32[4] = v11 + 2;
    if (v19)
    {
      v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)(v11 + 2), v19);
      v22 = v21;
    }
    else
    {
      v20 = 0;
      v22 = 0;
    }
    v23 = &v20[3296 * v16];
    *(_QWORD *)v23 = v12;
    *((_QWORD *)v23 + 1) = a5;
    memcpy(v23 + 16, __dst, 0xCC4uLL);
    *((float *)v23 + 821) = a2;
    *((_WORD *)v23 + 1644) = 0;
    v25 = *v11;
    v24 = v11[1];
    if (v24 == *v11)
    {
      v30 = v11[1];
      v26 = v23;
    }
    else
    {
      v26 = v23;
      do
      {
        v27 = v24 - 3296;
        v28 = *((_QWORD *)v24 - 412);
        v29 = v26 - 3288;
        v26 -= 3296;
        *((_QWORD *)v24 - 412) = 0;
        *(_QWORD *)v26 = v28;
        memcpy(v29, v24 - 3288, 0xCD2uLL);
        v24 = v27;
      }
      while (v27 != v25);
      v30 = *v11;
      v24 = v11[1];
    }
    v15 = v23 + 3296;
    *v11 = v26;
    v32[0] = v30;
    v32[1] = v30;
    v11[1] = v15;
    v32[2] = v24;
    v31 = v11[2];
    v11[2] = &v20[3296 * v22];
    v32[3] = v31;
    std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v32);
  }
  else
  {
    *(_QWORD *)v13 = v12;
    *(_QWORD *)(v13 + 8) = a5;
    memcpy((void *)(v13 + 16), __dst, 0xCC4uLL);
    *(float *)(v13 + 3284) = a2;
    *(_WORD *)(v13 + 3288) = 0;
    v15 = (char *)(v13 + 3296);
  }
  v11[1] = v15;

}

+ (unordered_map<NSString)getActionKeyToPredictionItemMapFromChunk:()ATXNSStringHash
{
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  return (unordered_map<NSString *, ATXPredictionItem, ATXNSStringHash, ATXNSStringEqual, std::allocator<std::pair<NSString *const, ATXPredictionItem>>> *)+[ATXActionCacheReader _getActionKeyToPredictionItemMapFromChunk:map:abGroup:assetVersion:](ATXActionCacheReader, "_getActionKeyToPredictionItemMapFromChunk:map:abGroup:assetVersion:", a4, retstr, 0, 0);
}

+ (void)_getActionKeyToPredictionItemMapFromChunk:(id)a3 map:(void *)a4 abGroup:(id *)a5 assetVersion:(int64_t *)a6
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v9 = a3;
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::clear((uint64_t)a4);
  objc_msgSend(MEMORY[0x1E0CF8E48], "stringKeyWithData:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__ATXActionCacheReader__getActionKeyToPredictionItemMapFromChunk_map_abGroup_assetVersion___block_invoke;
  v13[3] = &__block_descriptor_40_e39_v52__0_B8__NSString_16Q24f32r_f36B44B48l;
  v13[4] = a4;
  objc_msgSend(v10, "enumerateApps:", v13);
  if (a5)
  {
    objc_msgSend(v10, "abGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *a5;
    *a5 = v11;

  }
  if (a6)
    *a6 = objc_msgSend(v10, "assetVersion");

}

void __91__ATXActionCacheReader__getActionKeyToPredictionItemMapFromChunk_map_abGroup_assetVersion___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, void *a5, const void *a6)
{
  uint64_t v10;
  id v11[2];
  _BYTE v12[3268];
  float v13;
  __int16 v14;
  id v15;

  v15 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11[0] = v15;
  v11[1] = a5;
  v13 = a2;
  v14 = 0;
  memcpy(v12, a6, sizeof(v12));
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__emplace_unique_key_args<NSString * {__strong},NSString * {__strong}&,ATXPredictionItem>(v10, &v15, &v15, (uint64_t *)v11);

}

+ (void)_getIndexToPredictionItemMapWithChunk:(id)a3 withPredictionCount:(int64_t)a4 map:(void *)a5 abGroup:(id *)a6 assetVersion:(int64_t *)a7
{
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[7];

  v12 = a3;
  std::vector<ATXPredictionItem>::resize((uint64_t)a5, a4);
  objc_msgSend(MEMORY[0x1E0CF8E48], "numberKeyWithData:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __107__ATXActionCacheReader__getIndexToPredictionItemMapWithChunk_withPredictionCount_map_abGroup_assetVersion___block_invoke;
  v16[3] = &__block_descriptor_56_e39_v52__0_B8__NSNumber_16Q24f32r_f36B44B48l;
  v16[4] = a4;
  v16[5] = a5;
  v16[6] = a1;
  objc_msgSend(v13, "enumerateApps:", v16);
  if (a6)
  {
    objc_msgSend(v13, "abGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *a6;
    *a6 = v14;

  }
  if (a7)
    *a7 = objc_msgSend(v13, "assetVersion");

}

void __107__ATXActionCacheReader__getIndexToPredictionItemMapWithChunk_withPredictionCount_map_abGroup_assetVersion___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, const void *a6, char a7, char a8)
{
  id v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  _QWORD v24[410];

  v24[409] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = objc_msgSend(v14, "integerValue");
  v16 = v15;
  if ((int64_t)v15 >= *(_QWORD *)(a1 + 32)
    || v15 >= 0xDAB7EC1DD3431B57 * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - **(_QWORD **)(a1 + 40)) >> 5))
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      NSStringFromClass(*(Class *)(a1 + 48));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(_QWORD *)(a1 + 32);
      v23 = 0xDAB7EC1DD3431B57 * ((uint64_t)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) - **(_QWORD **)(a1 + 40)) >> 5);
      LODWORD(v24[0]) = 138413058;
      *(_QWORD *)((char *)v24 + 4) = v21;
      WORD2(v24[1]) = 2048;
      *(_QWORD *)((char *)&v24[1] + 6) = v22;
      HIWORD(v24[2]) = 2048;
      v24[3] = v16;
      LOWORD(v24[4]) = 2048;
      *(_QWORD *)((char *)&v24[4] + 2) = v23;
      _os_log_fault_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_FAULT, "%@ - feedback data shouldn't have data which isn't included in the prediction set. (count: %li, index: %li, map size: %li)", (uint8_t *)v24, 0x2Au);

    }
  }
  else
  {
    memcpy(v24, a6, 0xCC4uLL);
    v17 = *(_QWORD **)(a1 + 40);
    if (0xDAB7EC1DD3431B57 * ((uint64_t)(v17[1] - *v17) >> 5) <= v16)
      std::vector<ATXPredictionItem>::__throw_out_of_range[abi:ne180100]();
    v18 = *v17 + 3296 * v16;
    v19 = *(void **)v18;
    *(_QWORD *)v18 = &stru_1E82FDC98;

    *(_QWORD *)(v18 + 8) = a5;
    memcpy((void *)(v18 + 16), v24, 0xCC4uLL);
    *(float *)(v18 + 3284) = a2;
    *(_BYTE *)(v18 + 3288) = a7;
    *(_BYTE *)(v18 + 3289) = a8;
  }

}

- (unordered_map<ATXAction)_getActionToIndexMap
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unordered_map<ATXAction *, int, ATXActionHash, ATXActionEqual, std::allocator<std::pair<ATXAction *const, int>>> *result;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  retstr->__table_.__bucket_list_ = 0u;
  *(_OWORD *)&retstr->__table_.__p1_.__value_.__next_ = 0u;
  retstr->__table_.__p3_.__value_ = 1.0;
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ATXActionCacheClientReader actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:](self, "actionsWithLimit:shouldFilterRestrictedAppsAndRecentEngagements:", 0x7FFFFFFFLL, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "predictedItem");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::__emplace_unique_key_args<ATXAction * {__strong},ATXAction * {__strong},long &>((uint64_t)retstr, &v9, (uint64_t *)&v9, &v14);

        ++v14;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

  return result;
}

- (NSString)abGroup
{
  return self->_abGroup;
}

- (int64_t)assetVersion
{
  return self->_assetVersion;
}

- (void).cxx_destruct
{
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *p_extraPredictionItems;

  objc_storeStrong((id *)&self->_abGroup, 0);
  p_extraPredictionItems = &self->_extraPredictionItems;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_extraPredictionItems);
  p_extraPredictionItems = &self->_predictionItems;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_extraPredictionItems);
  std::__hash_table<std::__hash_value_type<ATXAction * {__strong},int>,std::__unordered_map_hasher<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionHash,ATXActionEqual,true>,std::__unordered_map_equal<ATXAction * {__strong},std::__hash_value_type<ATXAction * {__strong},int>,ATXActionEqual,ATXActionHash,true>,std::allocator<std::__hash_value_type<ATXAction * {__strong},int>>>::~__hash_table((uint64_t)&self->_actionToIndexMap);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 14) = 1065353216;
  *((_QWORD *)self + 9) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 12) = 0;
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 11) = 0;
  return self;
}

- (void)initWithChunks:(uint64_t)a3 .cold.1(uint8_t *buf, uint64_t a2, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a2;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "We were passed data with %lu chunks but expected %lu", buf, 0x16u);
}

- (void)predictionItemForAction:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "%@ - Index return from _actionToIndexMap is out of range of _secondStage.", buf, 0xCu);

}

@end
