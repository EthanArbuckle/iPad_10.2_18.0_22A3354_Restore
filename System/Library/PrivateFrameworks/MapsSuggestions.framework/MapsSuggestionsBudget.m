@implementation MapsSuggestionsBudget

- (MapsSuggestionsBudget)initWithDelegate:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  MapsSuggestionsBudget *v9;
  uint64_t v10;
  NSString *name;
  void *v12;
  OS_dispatch_queue *v13;
  OS_dispatch_queue *innerQueue;
  NSString *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  NSMutableDictionary *data;
  void *v20;
  int v21;
  NSObject *v22;
  NSMutableDictionary *v23;
  MapsSuggestionsBudget *v24;
  NSObject *v25;
  objc_super v27;
  _BYTE buf[18];
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    v27.receiver = self;
    v27.super_class = (Class)MapsSuggestionsBudget;
    v9 = -[MapsSuggestionsBudget init](&v27, sel_init);
    if (v9)
    {
      v10 = objc_msgSend(v8, "copy");
      name = v9->_name;
      v9->_name = (NSString *)v10;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MSg::Queue::Queue((dispatch_queue_t *)buf, CFSTR("MapsSuggestionsBudgetQueue"), v12);
      v13 = *(OS_dispatch_queue **)buf;
      *(_QWORD *)buf = 0;
      innerQueue = v9->_queue._innerQueue;
      v9->_queue._innerQueue = v13;

      v15 = *(NSString **)&buf[8];
      *(_QWORD *)&buf[8] = 0;
      v16 = v9->_queue._name;
      v9->_queue._name = v15;

      objc_storeStrong((id *)&v9->_delegate, a3);
      -[MapsSuggestionsBudgetDelegate readBudgetState](v9->_delegate, "readBudgetState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "mutableCopy");
      data = v9->_data;
      v9->_data = (NSMutableDictionary *)v18;

      -[NSMutableDictionary objectForKeyedSubscript:](v9->_data, "objectForKeyedSubscript:", CFSTR("MapsSuggestionsBudgetVersionKey"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "intValue");

      if (v21 != 2)
      {
        GEOFindOrCreateLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)&buf[4] = v21;
          *(_WORD *)&buf[8] = 1024;
          *(_DWORD *)&buf[10] = 2;
          _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "The version does not correspond. Them=%d. Me=%d. This may be a migration. Ignoring state!", buf, 0xEu);
        }

        v23 = v9->_data;
        v9->_data = 0;

      }
    }
    self = v9;
    v24 = self;
  }
  else
  {
    GEOFindOrCreateLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 179;
      v29 = 2082;
      v30 = "-[MapsSuggestionsBudget initWithDelegate:name:]";
      v31 = 2082;
      v32 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v25, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name", buf, 0x26u);
    }

    v24 = 0;
  }

  return v24;
}

- (void)addRollingWindowOfCount:(unint64_t)a3 perTimeInterval:(double)a4 name:(id)a5
{
  uint64_t v5;

  v5 = (uint64_t)(a4 * 1000000000.0);
  -[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:](self, "addRollingWindowOfCount:perDuration:name:", a3, &v5, a5);
}

- (void)addRollingWindowOfCount:(unint64_t)a3 perDuration:(const void *)a4 name:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  unint64_t v13;
  const void *v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  if (!*(_QWORD *)a4)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      v17 = 1024;
      v18 = 209;
      v19 = 2082;
      v20 = "-[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:]";
      v21 = 2082;
      v22 = "0LLu == duration.asNanoSeconds()";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. An empty time would be division by zero", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (!v8)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      v17 = 1024;
      v18 = 210;
      v19 = 2082;
      v20 = "-[MapsSuggestionsBudget addRollingWindowOfCount:perDuration:name:]";
      v21 = 2082;
      v22 = "nil == (name)";
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a name for the rule", buf, 0x26u);
    }
LABEL_9:

    goto LABEL_10;
  }
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__MapsSuggestionsBudget_addRollingWindowOfCount_perDuration_name___block_invoke;
  v11[3] = &unk_1E4BCEA60;
  v11[4] = self;
  v12 = v8;
  v13 = a3;
  v14 = a4;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, v11);

LABEL_10:
}

uint64_t __66__MapsSuggestionsBudget_addRollingWindowOfCount_perDuration_name___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSString *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64x2_t v23;
  char *v24;
  char *v25;
  int64x2_t v26;
  char *v27;
  uint64_t v28;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t **)(a1 + 56);
  v3 = *(_QWORD *)(v1 + 40);
  v4 = *(_QWORD *)(v1 + 48);
  if (v3 >= v4)
  {
    v7 = *(_QWORD *)(v1 + 32);
    v8 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v3 - v7) >> 4);
    if (v8 + 1 > 0x333333333333333)
      std::vector<MSg::_RollingWindowBudgetRule>::__throw_length_error[abi:ne180100]();
    v9 = *(NSString **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = *v2;
    v12 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v4 - v7) >> 4);
    v13 = 2 * v12;
    if (2 * v12 <= v8 + 1)
      v13 = v8 + 1;
    if (v12 >= 0x199999999999999)
      v14 = 0x333333333333333;
    else
      v14 = v13;
    v28 = v1 + 48;
    if (v14)
    {
      if (v14 > 0x333333333333333)
        std::__throw_bad_array_new_length[abi:ne180100]();
      v15 = (char *)operator new(80 * v14);
    }
    else
    {
      v15 = 0;
    }
    v25 = v15;
    v26.i64[0] = (uint64_t)&v15[80 * v8];
    v27 = &v15[80 * v14];
    MSg::_RollingWindowBudgetRule::_RollingWindowBudgetRule((id *)v26.i64[0], (MapsSuggestionsBudget *)v1, v9, v10, v11);
    v16 = v26.i64[0];
    v6 = v26.i64[0] + 80;
    v26.i64[1] = v26.i64[0] + 80;
    v18 = *(_QWORD *)(v1 + 32);
    v17 = *(_QWORD *)(v1 + 40);
    if (v17 == v18)
    {
      v23 = vdupq_n_s64(v17);
    }
    else
    {
      v19 = 0;
      do
      {
        v20 = v16 + v19;
        v21 = v17 + v19;
        objc_moveWeak((id *)(v16 + v19 - 80), (id *)(v17 + v19 - 80));
        v22 = *(_QWORD *)(v17 + v19 - 72);
        *(_QWORD *)(v21 - 72) = 0;
        *(_QWORD *)(v20 - 72) = v22;
        *(_OWORD *)(v20 - 64) = *(_OWORD *)(v17 + v19 - 64);
        *(_QWORD *)(v20 - 48) = *(_QWORD *)(v17 + v19 - 48);
        *(_QWORD *)(v20 - 40) = *(_QWORD *)(v17 + v19 - 40);
        *(_QWORD *)(v20 - 32) = *(_QWORD *)(v17 + v19 - 32);
        *(_QWORD *)(v20 - 24) = *(_QWORD *)(v17 + v19 - 24);
        *(_OWORD *)(v21 - 48) = 0u;
        *(_OWORD *)(v21 - 32) = 0u;
        *(_QWORD *)(v20 - 16) = *(_QWORD *)(v17 + v19 - 16);
        *(_QWORD *)(v20 - 8) = *(_QWORD *)(v17 + v19 - 8);
        *(_QWORD *)(v21 - 16) = 0;
        *(_QWORD *)(v21 - 8) = 0;
        v19 -= 80;
      }
      while (v17 + v19 != v18);
      v23 = *(int64x2_t *)(v1 + 32);
      v6 = v26.i64[1];
      v16 += v19;
    }
    *(_QWORD *)(v1 + 32) = v16;
    *(_QWORD *)(v1 + 40) = v6;
    v26 = v23;
    v24 = *(char **)(v1 + 48);
    *(_QWORD *)(v1 + 48) = v27;
    v27 = v24;
    v25 = (char *)v23.i64[0];
    result = std::__split_buffer<MSg::_RollingWindowBudgetRule>::~__split_buffer((uint64_t)&v25);
  }
  else
  {
    result = (uint64_t)MSg::_RollingWindowBudgetRule::_RollingWindowBudgetRule(*(id **)(v1 + 40), (MapsSuggestionsBudget *)v1, *(NSString **)(a1 + 40), *(void **)(a1 + 48), *v2);
    v6 = v3 + 80;
    *(_QWORD *)(v1 + 40) = v3 + 80;
  }
  *(_QWORD *)(v1 + 40) = v6;
  return result;
}

- (uint64_t)_q_hasBudgetLeft
{
  uint64_t v1;
  MSg::_RollingWindowBudgetRule *v2;
  MSg::_RollingWindowBudgetRule *v3;
  NSObject *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    v3 = *(MSg::_RollingWindowBudgetRule **)(v1 + 32);
    v2 = *(MSg::_RollingWindowBudgetRule **)(v1 + 40);
    while (1)
    {
      if (v3 == v2)
        return 1;
      MSg::_RollingWindowBudgetRule::_prune(v3);
      if (*((_QWORD *)v3 + 9) >= *((_QWORD *)v3 + 2))
        break;
      v3 = (MSg::_RollingWindowBudgetRule *)((char *)v3 + 80);
    }
    GEOFindOrCreateLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v5 = (void *)*((_QWORD *)v3 + 1);
      v7 = 138412290;
      v8 = v5;
      v6 = v5;
      _os_log_impl(&dword_1A427D000, v4, OS_LOG_TYPE_DEBUG, "RULE{%@} had no Budget left!", (uint8_t *)&v7, 0xCu);

    }
    return 0;
  }
  return result;
}

- (BOOL)hasBudgetLeft
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__MapsSuggestionsBudget_hasBudgetLeft__block_invoke;
  v3[3] = &unk_1E4BCEA88;
  v3[4] = self;
  return MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v3);
}

uint64_t __38__MapsSuggestionsBudget_hasBudgetLeft__block_invoke(uint64_t a1)
{
  return -[MapsSuggestionsBudget _q_hasBudgetLeft](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_q_spendAtTime:(uint64_t)a1
{
  id v3;
  __int128 v4;
  MSg::_RollingWindowBudgetRule *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  id WeakRetained;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  id *v15;
  uint64_t v16;
  id v17;
  id *v18;
  NSObject *v19;
  id v20;
  void *v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  char *v25;
  NSObject *v26;
  char *v27;
  const char *v28;
  NSObject *v29;
  uint32_t v30;
  char *v31;
  __int128 v33;
  uint64_t v34;
  unsigned int hasBudget;
  MSg::_RollingWindowBudgetRule *v36;
  NSObject *v37;
  uint8_t buf[4];
  char *v39;
  __int16 v40;
  _BYTE v41[14];
  __int16 v42;
  const char *v43;
  const __CFString *v44;
  _QWORD v45[3];

  v45[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    hasBudget = 0;
    goto LABEL_34;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  hasBudget = -[MapsSuggestionsBudget _q_hasBudgetLeft](a1);
  if ((hasBudget & 1) != 0)
  {
    v5 = *(MSg::_RollingWindowBudgetRule **)(a1 + 32);
    v34 = a1;
    v36 = *(MSg::_RollingWindowBudgetRule **)(a1 + 40);
    if (v5 != v36)
    {
      *(_QWORD *)&v4 = 136446722;
      v33 = v4;
      do
      {
        v6 = v3;
        v37 = v6;
        if (v3)
        {
          v7 = v6;
          MSg::_RollingWindowBudgetRule::_prune(v5);
          if (*((_QWORD *)v5 + 9) >= *((_QWORD *)v5 + 2))
          {
            GEOFindOrCreateLog();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136446978;
              v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
              v40 = 1024;
              *(_DWORD *)v41 = 72;
              *(_WORD *)&v41[4] = 2082;
              *(_QWORD *)&v41[6] = "BOOL MSg::_RollingWindowBudgetRule::spendAt(NSDate *__strong)";
              v42 = 2082;
              v43 = "! hasBudgetLeft()";
              _os_log_impl(&dword_1A427D000, v19, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. This is supposed to be checked beforehand. Are we running concurrently?!", buf, 0x26u);
            }

          }
          else
          {
            GEOFindOrCreateLog();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              v9 = (char *)*((_QWORD *)v5 + 1);
              *(_DWORD *)buf = 138412546;
              v39 = v9;
              v40 = 2112;
              *(_QWORD *)v41 = v3;
              _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_DEBUG, "%@ spent at %@", buf, 0x16u);
            }

            std::deque<NSDate * {__strong}>::push_back((_QWORD *)v5 + 4, (id *)&v37);
            WeakRetained = objc_loadWeakRetained((id *)v5);
            if (WeakRetained)
            {
              v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *((_QWORD *)v5 + 9));
              v12 = *((_QWORD *)v5 + 5);
              if (*((_QWORD *)v5 + 6) != v12)
              {
                v13 = *((_QWORD *)v5 + 8);
                v14 = (_QWORD *)(v12 + 8 * (v13 >> 9));
                v15 = (id *)(*v14 + 8 * (v13 & 0x1FF));
                v16 = *(_QWORD *)(v12 + (((*((_QWORD *)v5 + 9) + v13) >> 6) & 0x3FFFFFFFFFFFFF8))
                    + 8 * ((*((_QWORD *)v5 + 9) + v13) & 0x1FF);
                while (v15 != (id *)v16)
                {
                  v17 = *v15;
                  -[NSObject addObject:](v11, "addObject:", v17);

                  if ((id *)((char *)++v15 - *v14) == (id *)4096)
                  {
                    v18 = (id *)v14[1];
                    ++v14;
                    v15 = v18;
                  }
                }
              }
              v44 = CFSTR("MSgRollingWindowBudgetRuleBudgetAlreadySpentKey");
              v20 = -[NSObject copy](v11, "copy", v33);
              v45[0] = v20;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "mutableCopy");

              v23 = objc_msgSend(WeakRetained, "q_saveStateForRuleName:state:", *((_QWORD *)v5 + 1), v22);
              GEOFindOrCreateLog();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              {
                v25 = (char *)*((_QWORD *)v5 + 1);
                *(_DWORD *)buf = 138412546;
                v39 = v25;
                v40 = 1024;
                *(_DWORD *)v41 = v23;
                _os_log_impl(&dword_1A427D000, v24, OS_LOG_TYPE_DEBUG, "State of RULE{%@} saved with result=%d", buf, 0x12u);
              }

            }
            else
            {
              GEOFindOrCreateLog();
              v22 = (id)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v33;
                v39 = "MapsSuggestionsBudget.mm";
                v40 = 1026;
                *(_DWORD *)v41 = 126;
                *(_WORD *)&v41[4] = 2082;
                *(_QWORD *)&v41[6] = "void MSg::_RollingWindowBudgetRule::_saveState()";
                _os_log_impl(&dword_1A427D000, v22, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", buf, 0x1Cu);
              }
              v11 = v22;
            }

          }
        }
        else
        {
          GEOFindOrCreateLog();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136446978;
            v39 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
            v40 = 1024;
            *(_DWORD *)v41 = 71;
            *(_WORD *)&v41[4] = 2082;
            *(_QWORD *)&v41[6] = "BOOL MSg::_RollingWindowBudgetRule::spendAt(NSDate *__strong)";
            v42 = 2082;
            v43 = "nil == (time)";
            _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time. Consider -spendNow instead.", buf, 0x26u);
          }
        }

        v5 = (MSg::_RollingWindowBudgetRule *)((char *)v5 + 80);
      }
      while (v5 != v36);
    }
    GEOFindOrCreateLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      goto LABEL_33;
    v27 = *(char **)(v34 + 8);
    *(_DWORD *)buf = 138412546;
    v39 = v27;
    v40 = 2112;
    *(_QWORD *)v41 = v3;
    v28 = "%@ spent at %@";
    v29 = v26;
    v30 = 22;
    goto LABEL_32;
  }
  GEOFindOrCreateLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
  {
    v31 = *(char **)(a1 + 8);
    *(_DWORD *)buf = 138412290;
    v39 = v31;
    v28 = "%@ has no budget left";
    v29 = v26;
    v30 = 12;
LABEL_32:
    _os_log_impl(&dword_1A427D000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
  }
LABEL_33:

LABEL_34:
  return hasBudget;
}

- (BOOL)spendAtTime:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__MapsSuggestionsBudget_spendAtTime___block_invoke;
    v9[3] = &unk_1E4BCEAB0;
    v9[4] = self;
    v10 = v4;
    v6 = MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v9);

  }
  else
  {
    GEOFindOrCreateLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      v13 = 1024;
      v14 = 258;
      v15 = 2082;
      v16 = "-[MapsSuggestionsBudget spendAtTime:]";
      v17 = 2082;
      v18 = "nil == (time)";
      _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a time. Consider -spendNow instead.", buf, 0x26u);
    }

    v6 = 0;
  }

  return v6;
}

uint64_t __37__MapsSuggestionsBudget_spendAtTime___block_invoke(uint64_t a1)
{
  return -[MapsSuggestionsBudget _q_spendAtTime:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)spendNow
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__MapsSuggestionsBudget_spendNow__block_invoke;
  v3[3] = &unk_1E4BCEA88;
  v3[4] = self;
  return MSg::Queue::sync<BOOL>((NSObject **)&self->_queue, v3);
}

uint64_t __33__MapsSuggestionsBudget_spendNow__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(a1 + 32);
  MapsSuggestionsNow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MapsSuggestionsBudget _q_spendAtTime:](v1, v2);

  return v3;
}

- (void)reset
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__MapsSuggestionsBudget_reset__block_invoke;
  block[3] = &unk_1E4BCE640;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)self->_queue._innerQueue, block);
}

uint64_t __30__MapsSuggestionsBudget_reset__block_invoke(uint64_t result)
{
  uint64_t v1;
  _OWORD *v2;
  _OWORD *v3;
  _OWORD v4[3];

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_OWORD **)(v1 + 32);
  v3 = *(_OWORD **)(v1 + 40);
  while (v2 != v3)
  {
    v4[0] = v2[2];
    v2[2] = 0u;
    v4[1] = v2[3];
    v2[3] = 0u;
    v4[2] = v2[4];
    v2[4] = 0u;
    result = std::deque<NSDate * {__strong}>::~deque[abi:ne180100]((uint64_t)v4);
    v2 += 5;
  }
  return result;
}

- (id)q_loadStateForRuleName:(id)a3
{
  char *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSString *name;
  int v12;
  const char *v13;
  __int16 v14;
  _BYTE v15[14];
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (char *)a3;
  if (!v4)
  {
    GEOFindOrCreateLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      v14 = 1024;
      *(_DWORD *)v15 = 287;
      *(_WORD *)&v15[4] = 2082;
      *(_QWORD *)&v15[6] = "-[MapsSuggestionsBudget q_loadStateForRuleName:]";
      v16 = 2082;
      v17 = "nil == (ruleName)";
      _os_log_impl(&dword_1A427D000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Rule name", (uint8_t *)&v12, 0x26u);
    }
    goto LABEL_15;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_data, "objectForKeyedSubscript:", self->_name);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    GEOFindOrCreateLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_DEBUG, "No state found for RULE{%@}", (uint8_t *)&v12, 0xCu);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      name = self->_name;
      v12 = 138412546;
      v13 = (const char *)name;
      v14 = 2112;
      *(_QWORD *)v15 = objc_opt_class();
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "We found some invalid state for RULE{%@}, that was actually a %@?!", (uint8_t *)&v12, 0x16u);
    }

LABEL_14:
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  GEOFindOrCreateLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v4;
    _os_log_impl(&dword_1A427D000, v7, OS_LOG_TYPE_DEBUG, "Correctly loaded state for RULE{%@}", (uint8_t *)&v12, 0xCu);
  }

  v8 = -[NSObject mutableCopy](v6, "mutableCopy");
LABEL_16:

  return v8;
}

- (BOOL)q_saveStateForRuleName:(id)a3 state:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *data;
  NSMutableDictionary *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  id v16;
  BOOL v17;
  const char *v18;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      v22 = 1024;
      v23 = 305;
      v24 = 2082;
      v25 = "-[MapsSuggestionsBudget q_saveStateForRuleName:state:]";
      v26 = 2082;
      v27 = "nil == (ruleName)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a Rule name";
LABEL_14:
      _os_log_impl(&dword_1A427D000, v13, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v20, 0x26u);
    }
LABEL_15:
    v17 = 0;
    goto LABEL_16;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsBudget.mm";
      v22 = 1024;
      v23 = 306;
      v24 = 2082;
      v25 = "-[MapsSuggestionsBudget q_saveStateForRuleName:state:]";
      v26 = 2082;
      v27 = "nil == (state)";
      v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a state dictionary to write";
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue._innerQueue);
  data = self->_data;
  if (!data)
  {
    v10 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
    v11 = self->_data;
    self->_data = v10;

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", &unk_1E4C097D0, CFSTR("MapsSuggestionsBudgetVersionKey"));
    data = self->_data;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](data, "objectForKeyedSubscript:", self->_name);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "mutableCopy");

  if (!v13)
  {
    GEOFindOrCreateLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1A427D000, v14, OS_LOG_TYPE_DEBUG, "Starting brand new state", (uint8_t *)&v20, 2u);
    }

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  }
  v15 = (void *)objc_msgSend(v8, "copy");
  -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v15, v6);

  v16 = -[NSObject copy](v13, "copy");
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_data, "setObject:forKeyedSubscript:", v16, self->_name);

  -[MapsSuggestionsBudgetDelegate writeBudgetState:](self->_delegate, "writeBudgetState:", self->_data);
  v17 = 1;
LABEL_16:

  return v17;
}

- (NSString)uniqueName
{
  return self->_name;
}

- (NSString)description
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  _RollingWindowBudgetRule *begin;
  _RollingWindowBudgetRule *i;
  __CFString *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = self->_rules.__end_ - self->_rules.__begin_;
  v5 = (void *)objc_msgSend(v3, "initWithCapacity:", 4 * ((v4 >> 2) + (v4 >> 4)));
  -[MapsSuggestionsBudget uniqueName](self, "uniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("%@: ["), v6);

  begin = self->_rules.__begin_;
  for (i = self->_rules.__end_; begin != i; begin = (_RollingWindowBudgetRule *)((char *)begin + 80))
  {
    MSg::_RollingWindowBudgetRule::_prune((MSg::_RollingWindowBudgetRule *)begin);
    if (*((_QWORD *)begin + 9))
      v9 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%.0fs"), MapsSuggestionsSecondsSince(*(void **)(*(_QWORD *)(*((_QWORD *)begin + 5)+ ((*((_QWORD *)begin + 8) >> 6) & 0x3FFFFFFFFFFFFF8))+ 8 * (*((_QWORD *)begin + 8) & 0x1FFLL))));
    else
      v9 = CFSTR("none");
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@: count=%u oldest=%@ limit=%u/%.0fs"), *((_QWORD *)begin + 1), *((_QWORD *)begin + 9), v9, *((_QWORD *)begin + 2), *((_QWORD *)begin + 3));

    objc_msgSend(v5, "appendFormat:", CFSTR("{%@}"), v10);
  }
  objc_msgSend(v5, "appendString:", CFSTR("]"));
  v11 = (void *)objc_msgSend(v5, "copy");

  return (NSString *)v11;
}

- (id)nameForJSON
{
  return self->_name;
}

- (id)objectForJSON
{
  return MSg::jsonFor((MSg *)-[MapsSuggestionsBudget isTrue](self, "isTrue"));
}

- (void).cxx_destruct
{
  _RollingWindowBudgetRule *begin;
  _RollingWindowBudgetRule *end;
  _RollingWindowBudgetRule *v5;

  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  begin = self->_rules.__begin_;
  if (begin)
  {
    end = self->_rules.__end_;
    v5 = self->_rules.__begin_;
    if (end != begin)
    {
      do
        MSg::_RollingWindowBudgetRule::~_RollingWindowBudgetRule((id *)end - 10);
      while (end != begin);
      v5 = self->_rules.__begin_;
    }
    self->_rules.__end_ = begin;
    operator delete(v5);
  }

  objc_storeStrong((id *)&self->_name, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end
