@implementation ATXAppPredictionFeedbackItem

- (ATXAppPredictionFeedbackItem)initWithBundleId:(id)a3 totalScore:(float)a4 scoreInputs:(const float *)a5
{
  id v9;
  ATXAppPredictionFeedbackItem *v10;
  uint64_t v11;
  NSString *bundleId;
  void *v14;
  void *v15;
  objc_super v16;

  v9 = a3;
  if (v9)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppPredictionFeedbackItem.mm"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXAppPredictionFeedbackItem.mm"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scoreInputs"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)ATXAppPredictionFeedbackItem;
  v10 = -[ATXAppPredictionFeedbackItem init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    bundleId = v10->_bundleId;
    v10->_bundleId = (NSString *)v11;

    v10->_totalScore = a4;
    memcpy(v10->_scoreInputs, a5, sizeof(v10->_scoreInputs));
  }

  return v10;
}

- (const)scoreInputs
{
  return self->_scoreInputs;
}

- (id)description
{
  void *v3;
  unint64_t i;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("["));
  for (i = 0; i != 817; ++i)
  {
    objc_msgSend(v3, "appendFormat:", CFSTR(" %f"), self->_scoreInputs[i]);
    if (i <= 0x32F)
      objc_msgSend(v3, "appendFormat:", CFSTR(", "));
  }
  objc_msgSend(v3, "appendString:", CFSTR(" ]"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:\n  totalScore:  %f\n  scoreInputs: %@\n"), self->_bundleId, self->_totalScore, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)feedbackItemsForResponse:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "cacheFileData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "feedbackItemsForCacheFileData:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)feedbackItemsForCacheFileData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (v3)
  {
    ATXCacheFileSplitChunks();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAppPredictionFeedbackItem feedbackItemsForChunks:](ATXAppPredictionFeedbackItem, "feedbackItemsForChunks:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

+ (id)feedbackItemsForChunks:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      +[ATXAppPredictionFeedbackItem feedbackItemsForChunks:].cold.1((uint64_t)v8, objc_msgSend(v3, "count"), v6);

    v5 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAppPredictionFeedbackItem feedbackItemsForFeedbackChunk:](ATXAppPredictionFeedbackItem, "feedbackItemsForFeedbackChunk:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)feedbackItemsForFeedbackChunk:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CF8E48], "stringKeyWithData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__ATXAppPredictionFeedbackItem_feedbackItemsForFeedbackChunk___block_invoke;
  v7[3] = &unk_1E82E7A98;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateApps:", v7);

  return v5;
}

void __62__ATXAppPredictionFeedbackItem_feedbackItemsForFeedbackChunk___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  ATXAppPredictionFeedbackItem *v10;
  double v11;
  ATXAppPredictionFeedbackItem *v12;
  id v13;

  v13 = a4;
  v9 = *(void **)(a1 + 32);
  v10 = [ATXAppPredictionFeedbackItem alloc];
  *(float *)&v11 = a2;
  v12 = -[ATXAppPredictionFeedbackItem initWithBundleId:totalScore:scoreInputs:](v10, "initWithBundleId:totalScore:scoreInputs:", v13, a6, v11);
  objc_msgSend(v9, "addObject:", v12);

}

+ (vector<ATXPredictionItem,)predictionItemsInFeedbackChunkFromCacheFileData:(id)a2
{
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  id v5;

  ATXCacheFileSplitChunks();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[ATXAppPredictionFeedbackItem predictionItemsInFeedbackChunkFromCacheChunks:](ATXAppPredictionFeedbackItem, "predictionItemsInFeedbackChunkFromCacheChunks:");

  return result;
}

+ (vector<ATXPredictionItem,)predictionItemsInFeedbackChunkFromCacheChunks:(id)a2
{
  id v5;
  void *v6;
  NSObject *v7;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  void **v9;
  __int128 v10;
  ATXPredictionItem *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    __atxlog_handle_default();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[ATXAppPredictionFeedbackItem predictionItemsInFeedbackChunkFromCacheChunks:].cold.1((uint64_t)&v10, objc_msgSend(v5, "count"), v7);

  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAppPredictionFeedbackItem predictionItemsForFeedbackChunk:](ATXAppPredictionFeedbackItem, "predictionItemsForFeedbackChunk:", v6);
    std::vector<ATXPredictionItem>::__vdeallocate((id **)retstr);
    *(_OWORD *)&retstr->__begin_ = v10;
    retstr->__end_cap_.__value_ = v11;
    v11 = 0;
    v9 = (void **)&v10;
    v10 = 0uLL;
    std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v9);

  }
  return result;
}

+ (vector<ATXPredictionItem,)predictionItemsForFeedbackChunk:(id)a2
{
  void *v5;
  uint64_t *v6;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __n128 (*v12)(__n128 *, __n128 *);
  void (*v13)(uint64_t);
  void *v14;
  _QWORD v15[3];
  void **v16;

  objc_msgSend(MEMORY[0x1E0CF8E48], "stringKeyWithData:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x4812000000;
  v12 = __Block_byref_object_copy__86;
  v13 = __Block_byref_object_dispose__86;
  v14 = &unk_1C9F35407;
  memset(v15, 0, sizeof(v15));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ATXAppPredictionFeedbackItem_predictionItemsForFeedbackChunk___block_invoke;
  v8[3] = &unk_1E82E7AC0;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateApps:", v8);
  v6 = v10;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  std::vector<ATXPredictionItem>::__init_with_size[abi:ne180100]<ATXPredictionItem*,ATXPredictionItem*>(retstr, (id *)v6[6], (id *)v6[7], 0xDAB7EC1DD3431B57 * ((v6[7] - v6[6]) >> 5));
  _Block_object_dispose(&v9, 8);
  v16 = (void **)v15;
  std::vector<ATXPredictionItem>::__destroy_vector::operator()[abi:ne180100](&v16);

  return result;
}

void __64__ATXAppPredictionFeedbackItem_predictionItemsForFeedbackChunk___block_invoke(uint64_t a1, float a2, uint64_t a3, void *a4, uint64_t a5, const void *a6, char a7, char a8)
{
  id v14;
  int64x2_t *v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  char *v33;
  int64x2_t v34;
  uint64_t v35;
  uint64_t v36;
  int64x2_t v37;
  uint64_t v38;
  int64x2_t *v39;
  _BYTE __dst[3268];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  memcpy(__dst, a6, sizeof(__dst));
  v15 = *(int64x2_t **)(*(_QWORD *)(a1 + 32) + 8);
  v16 = v15[3].u64[1];
  v17 = v15[4].u64[0];
  if (v16 >= v17)
  {
    v19 = v15[3].i64[0];
    v20 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v16 - v19) >> 5);
    if (v20 + 1 > 0x13E22CBCE4A902)
      std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
    v21 = 0xDAB7EC1DD3431B57 * ((uint64_t)(v17 - v19) >> 5);
    v22 = 2 * v21;
    if (2 * v21 <= v20 + 1)
      v22 = v20 + 1;
    if (v21 >= 0x9F1165E725481)
      v23 = 0x13E22CBCE4A902;
    else
      v23 = v22;
    v39 = v15 + 4;
    if (v23)
    {
      v24 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)v15[4].i64, v23);
      v26 = v25;
    }
    else
    {
      v24 = 0;
      v26 = 0;
    }
    v27 = &v24[3296 * v20];
    *(_QWORD *)v27 = v14;
    *((_QWORD *)v27 + 1) = a5;
    memcpy(v27 + 16, __dst, 0xCC4uLL);
    *((float *)v27 + 821) = a2;
    v27[3288] = a7;
    v27[3289] = a8;
    v29 = v15[3].i64[0];
    v28 = v15[3].u64[1];
    if (v28 == v29)
    {
      v34 = vdupq_n_s64(v28);
      v30 = v27;
    }
    else
    {
      v30 = v27;
      do
      {
        v31 = v28 - 3296;
        v32 = *(_QWORD *)(v28 - 3296);
        v33 = v30 - 3288;
        v30 -= 3296;
        *(_QWORD *)(v28 - 3296) = 0;
        *(_QWORD *)v30 = v32;
        memcpy(v33, (const void *)(v28 - 3288), 0xCD2uLL);
        v28 = v31;
      }
      while (v31 != v29);
      v34 = v15[3];
    }
    v18 = v27 + 3296;
    v15[3].i64[0] = (uint64_t)v30;
    v15[3].i64[1] = (uint64_t)(v27 + 3296);
    v37 = v34;
    v35 = v15[4].i64[0];
    v15[4].i64[0] = (uint64_t)&v24[3296 * v26];
    v38 = v35;
    v36 = v34.i64[0];
    std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)&v36);
  }
  else
  {
    *(_QWORD *)v16 = v14;
    *(_QWORD *)(v16 + 8) = a5;
    memcpy((void *)(v16 + 16), __dst, 0xCC4uLL);
    *(float *)(v16 + 3284) = a2;
    *(_BYTE *)(v16 + 3288) = a7;
    v18 = (char *)(v16 + 3296);
    *(_BYTE *)(v16 + 3289) = a8;
  }
  v15[3].i64[1] = (uint64_t)v18;

}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (float)totalScore
{
  return self->_totalScore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleId, 0);
}

+ (void)feedbackItemsForChunks:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_15(&dword_1C9A3B000, a2, a3, "feedbackItemsForChunks received only %lu chunks", (uint8_t *)a1);
}

+ (void)predictionItemsInFeedbackChunkFromCacheChunks:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a1 = 134217984;
  *(_QWORD *)(a1 + 4) = a2;
  OUTLINED_FUNCTION_0_15(&dword_1C9A3B000, a2, a3, "predictionItemsInFeedbackChunkFromCacheChunks received only %lu chunks", (uint8_t *)a1);
}

@end
