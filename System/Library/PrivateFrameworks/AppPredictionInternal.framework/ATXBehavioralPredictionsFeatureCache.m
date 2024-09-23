@implementation ATXBehavioralPredictionsFeatureCache

- (ATXBehavioralPredictionsFeatureCache)init
{
  ATXBehavioralPredictionsFeatureCache *v2;
  void *v3;
  uint64_t v4;
  _PASLock *lock;
  _OWORD v7[2];
  int v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXBehavioralPredictionsFeatureCache;
  v2 = -[ATXBehavioralPredictionsFeatureCache init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    memset(v7, 0, sizeof(v7));
    v8 = 1065353216;
    std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__move_assign((uint64_t)v3 + 8, (uint64_t *)v7);
    std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::~__hash_table((uint64_t)v7);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v4;

  }
  return v2;
}

- (ATXPredictionItem)itemForBundleId:(SEL)a3
{
  id v6;
  uint64_t i;
  _PASLock *lock;
  id v9;
  uint64_t *v10;
  ATXPredictionItem *result;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void *(*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  id v21;
  float v22;
  __int16 v23;

  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0xD1012000000;
  v18 = __Block_byref_object_copy__36;
  v19 = __Block_byref_object_dispose__36;
  v20 = 256;
  v21 = 0;
  v22 = -31337.0;
  v23 = 0;
  for (i = 64; i != 3332; i += 4)
    *(float *)((char *)&v15 + i) = -31337.0;
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke;
  v12[3] = &unk_1E82DFCF8;
  v13 = v6;
  v14 = &v15;
  v9 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  v10 = v16;
  retstr->key = (NSString *)(id)v16[6];
  memcpy(&retstr->actionHash, v10 + 7, 0xCD2uLL);

  _Block_object_dispose(&v15, 8);
  return result;
}

void __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t **v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a2;
  v4 = a1 + 32;
  v5 = std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::find<NSString * {__strong}>(v3 + 1, (id *)(a1 + 32));
  if (v5)
  {
    __atxlog_handle_default();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_2(a1 + 32, v6, v7, v8, v9, v10, v11, v12);

    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    objc_storeStrong((id *)(v13 + 48), v5[3]);
    memcpy((void *)(v13 + 56), v5 + 4, 0xCD2uLL);
  }
  else
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_1(v4, v14, v15, v16, v17, v18, v19, v20);

  }
}

- (void)addItem:(ATXPredictionItem *)a3 forBundleId:(id)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  _QWORD v9[4];
  id v10;
  NSString *v11;
  _BYTE v12[3282];

  v6 = a4;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3321888768;
  v9[2] = __60__ATXBehavioralPredictionsFeatureCache_addItem_forBundleId___block_invoke;
  v9[3] = &unk_1E82DFD20;
  v10 = v6;
  v11 = a3->key;
  memcpy(v12, &a3->actionHash, sizeof(v12));
  v8 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);

}

void __60__ATXBehavioralPredictionsFeatureCache_addItem_forBundleId___block_invoke(id *a1, void *a2)
{
  uint64_t v3;
  id v4;
  __int128 v5;
  _BYTE v6[3282];

  v3 = (uint64_t)a2 + 8;
  v4 = a2;
  *(_QWORD *)&v5 = a1[4];
  *((_QWORD *)&v5 + 1) = a1[5];
  memcpy(v6, a1 + 6, sizeof(v6));
  std::__hash_table<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,std::__unordered_map_hasher<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringHash,ATXNSStringEqual,true>,std::__unordered_map_equal<NSString * {__strong},std::__hash_value_type<NSString * {__strong},ATXPredictionItem>,ATXNSStringEqual,ATXNSStringHash,true>,std::allocator<std::__hash_value_type<NSString * {__strong},ATXPredictionItem>>>::__emplace_unique_key_args<NSString * {__strong},std::pair<NSString * {__strong},ATXPredictionItem>>(v3, (id *)&v5, &v5);

}

- (vector<ATXPredictionItem,)itemsForBundleIds:(ATXBehavioralPredictionsFeatureCache *)self
{
  id v6;
  id v7;
  uint64_t v8;
  __compressed_pair<ATXPredictionItem *, std::allocator<ATXPredictionItem>> *p_end_cap;
  uint64_t v10;
  void *v11;
  ATXPredictionItem *value;
  ATXPredictionItem *end;
  ATXPredictionItem *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  ATXPredictionItem *v22;
  ATXPredictionItem *begin;
  ATXPredictionItem *v24;
  id v25;
  ATXPredictionItem *v26;
  ATXPredictionItem *v27;
  ATXPredictionItem *v28;
  NSString *key;
  unint64_t *p_actionHash;
  ATXPredictionItem *v31;
  vector<ATXPredictionItem, std::allocator<ATXPredictionItem>> *result;
  ATXBehavioralPredictionsFeatureCache *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[3282];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v8)
  {
    p_end_cap = &retstr->__end_cap_;
    v35 = *(_QWORD *)v39;
    v33 = self;
    do
    {
      v10 = 0;
      v34 = v8;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(v7);
        -[ATXBehavioralPredictionsFeatureCache itemForBundleId:](self, "itemForBundleId:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v10));
        v11 = v36;
        if (v36)
        {
          end = retstr->__end_;
          value = retstr->__end_cap_.__value_;
          if (end >= value)
          {
            v15 = 0xDAB7EC1DD3431B57 * (((char *)end - (char *)retstr->__begin_) >> 5);
            v16 = v15 + 1;
            if (v15 + 1 > 0x13E22CBCE4A902)
              std::vector<ATXPredictionItem>::__throw_length_error[abi:ne180100]();
            v17 = 0xDAB7EC1DD3431B57 * (((char *)value - (char *)retstr->__begin_) >> 5);
            if (2 * v17 > v16)
              v16 = 2 * v17;
            if (v17 >= 0x9F1165E725481)
              v18 = 0x13E22CBCE4A902;
            else
              v18 = v16;
            v42[4] = p_end_cap;
            if (v18)
            {
              v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ATXPredictionItem>>((uint64_t)p_end_cap, v18);
              v21 = v20;
              v11 = v36;
            }
            else
            {
              v19 = 0;
              v21 = 0;
            }
            v22 = (ATXPredictionItem *)&v19[3296 * v15];
            v22->key = (NSString *)v11;
            memcpy(&v22->actionHash, v37, 0xCD2uLL);
            begin = retstr->__begin_;
            v24 = retstr->__end_;
            if (v24 == retstr->__begin_)
            {
              begin = retstr->__end_;
              v26 = (ATXPredictionItem *)&v19[3296 * v15];
            }
            else
            {
              v25 = v7;
              v26 = (ATXPredictionItem *)&v19[3296 * v15];
              v27 = retstr->__end_;
              do
              {
                v28 = v27 - 1;
                key = v27[-1].key;
                p_actionHash = &v26[-1].actionHash;
                --v26;
                v27[-1].key = 0;
                v26->key = key;
                memcpy(p_actionHash, &v27[-1].actionHash, 0xCD2uLL);
                v27 = v28;
              }
              while (v28 != begin);
              v7 = v25;
              self = v33;
            }
            v14 = v22 + 1;
            retstr->__begin_ = v26;
            retstr->__end_ = v14;
            v31 = retstr->__end_cap_.__value_;
            retstr->__end_cap_.__value_ = (ATXPredictionItem *)&v19[3296 * v21];
            v42[2] = v24;
            v42[3] = v31;
            v42[1] = begin;
            v42[0] = begin;
            std::__split_buffer<ATXPredictionItem>::~__split_buffer((uint64_t)v42);
            p_end_cap = &retstr->__end_cap_;
            v8 = v34;
          }
          else
          {
            end->key = (NSString *)v36;
            memcpy(&end->actionHash, v37, 0xCD2uLL);
            v14 = end + 1;
          }
          retstr->__end_ = v14;
          v11 = v36;
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v8);
  }

  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
}

void __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "ATXBehavioralPredictionsFeatureCache: Cache miss for %@", a5, a6, a7, a8, 2u);
}

void __56__ATXBehavioralPredictionsFeatureCache_itemForBundleId___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_3(&dword_1C9A3B000, a2, a3, "ATXBehavioralPredictionsFeatureCache: Cache hit for %@", a5, a6, a7, a8, 2u);
}

@end
