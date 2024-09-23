@implementation MUISearchSuggestionsGenerator

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__MUISearchSuggestionsGenerator_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_14 != -1)
    dispatch_once(&log_onceToken_14, block);
  return (OS_os_log *)(id)log_log_14;
}

void __36__MUISearchSuggestionsGenerator_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_14;
  log_log_14 = (uint64_t)v1;

}

- (MUISearchSuggestionsGenerator)initWithSuggesters:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  MUISearchSuggestionsGenerator *v8;
  MUISearchSuggestionsGenerator *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *cancelledOperations;
  uint64_t v15;
  NSMutableArray *activeOperations;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *queue;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MUISearchSuggestionsGenerator;
  v8 = -[MUISearchSuggestionsGenerator init](&v23, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(v6, "copy");
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v9->_suggesters, v12);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    cancelledOperations = v9->_cancelledOperations;
    v9->_cancelledOperations = (NSMutableArray *)v13;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = objc_claimAutoreleasedReturnValue();
    activeOperations = v9->_activeOperations;
    v9->_activeOperations = (NSMutableArray *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);
    v18 = objc_claimAutoreleasedReturnValue();

    dispatch_queue_attr_make_with_autorelease_frequency(v18, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();

    v20 = dispatch_queue_create("com.apple.mobilemail.searchSuggestionsManager", v19);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v20;

  }
  return v9;
}

- (id)startGeneratingSuggestionsUsingPhraseManager:(id)a3
{
  id v4;
  MUISearchRequestID *v5;
  id v6;
  MUISearchRequestID *v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  uint64_t v12;
  os_signpost_id_t v13;
  unsigned int underlying;
  void *v15;
  unsigned int v16;
  void *v17;
  OS_dispatch_queue *queue;
  NSObject *v19;
  MUISearchRequestID *v20;
  id v21;
  void *v22;
  MUISearchRequestID *v23;
  _QWORD block[4];
  MUISearchRequestID *v26;
  id v27;
  id v28;
  uint8_t buf[8];
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MUISearchRequestID);
  v6 = v4;
  v7 = v5;
  signpostLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_enabled(v8);

  if (v9)
  {
    v10 = objc_msgSend(v6, "phraseKind");
    signpostLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v6, "signpostID");
    v13 = v12;
    if (v10)
    {
      if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        if (v7)
          underlying = v7->_underlying;
        else
          underlying = 0;
        objc_msgSend(v6, "phrase");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109379;
        *(_DWORD *)&buf[4] = underlying;
        v30 = 2113;
        v31 = v15;
        _os_signpost_emit_with_name_impl(&dword_1D5522000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "com.apple.mail.search.suggestion.zkw.queue", "id=%{signpost.description:attribute}u text=%{private}@", buf, 0x12u);

      }
    }
    else if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      if (v7)
        v16 = v7->_underlying;
      else
        v16 = 0;
      objc_msgSend(v6, "phrase");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109379;
      *(_DWORD *)&buf[4] = v16;
      v30 = 2113;
      v31 = v17;
      _os_signpost_emit_with_name_impl(&dword_1D5522000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "com.apple.mail.search.suggestion.ayt.queue", "id=%{signpost.description:attribute}u text=%{private}@", buf, 0x12u);

    }
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  if (self)
    queue = self->_queue;
  else
    queue = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__MUISearchSuggestionsGenerator_startGeneratingSuggestionsUsingPhraseManager___block_invoke;
  block[3] = &unk_1E99E3578;
  v19 = queue;
  objc_copyWeak(&v28, (id *)buf);
  v20 = v7;
  v26 = v20;
  v27 = v6;
  v21 = v6;
  dispatch_async(v19, block);

  v22 = v27;
  v23 = v20;

  objc_destroyWeak(&v28);
  objc_destroyWeak((id *)buf);
  return v23;
}

void __78__MUISearchSuggestionsGenerator_startGeneratingSuggestionsUsingPhraseManager___block_invoke(void **a1)
{
  id *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v2 = -[_MUISearchSuggestionsOperation initWithRequestID:phraseManager:suggestionsGenerator:]((id *)[_MUISearchSuggestionsOperation alloc], a1[4], a1[5], WeakRetained);
  -[MUISearchSuggestionsGenerator _appendOperation:]((uint64_t)WeakRetained, v2);

}

- (void)_appendOperation:(uint64_t)a1
{
  void **v4;
  NSObject *v5;
  id *v6;
  id *v7;
  _DWORD *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  NSObject *v26;
  _BOOL4 v27;
  id *v28;
  id *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  _QWORD *v36;
  void *v37;
  id v38;
  _QWORD *v39;
  void *v40;
  id *v41;
  id *v42;
  _DWORD *v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  id v52;
  _QWORD *v53;
  void *v54;
  dispatch_time_t v55;
  void *v56;
  NSObject *v57;
  id *v58;
  id *v59;
  id *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  int v65;
  int v66;
  _QWORD *v67;
  _QWORD block[4];
  id v69;
  id v70;
  uint8_t buf[8];
  __int16 v72;
  _BYTE v73[24];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v67 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    v4 = (void **)(a1 + 24);
    if (!*(_QWORD *)(a1 + 24))
      goto LABEL_13;
    +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
LABEL_12:

      signpostEndEnqueueInterval(*v4, 1);
LABEL_13:
      objc_storeStrong((id *)(a1 + 24), a2);
      v20 = v67;
      if (v67)
        v20 = (void *)v67[3];
      v21 = v20;
      v22 = objc_msgSend(*(id *)(a1 + 40), "count");
      v23 = v22;
      if (_throttleIntervalMilliseconds_onceToken == -1)
      {
        if (v22)
          goto LABEL_17;
      }
      else
      {
        dispatch_once(&_throttleIntervalMilliseconds_onceToken, &__block_literal_global_34);
        if (v23)
        {
LABEL_17:
          v24 = _throttleIntervalMilliseconds_interval;
          v25 = _throttleIntervalMilliseconds_interval == 0;
          +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
          if (!v25)
          {
            if (v27)
            {
              v28 = *v4;
              v29 = v28;
              if (v28 && (v30 = v28[3]) != 0)
              {
                v62 = v30;
                v65 = *((_DWORD *)v30 + 2);
              }
              else
              {
                v62 = 0;
                v65 = 0;
              }
              v59 = v29;
              v31 = *v4;
              v32 = v31;
              if (v31)
                v33 = (void *)*((_QWORD *)v31 + 4);
              else
                v33 = 0;
              v34 = v33;
              objc_msgSend(v34, "phrase");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = *v4;
              if (*v4)
                v37 = (void *)v36[4];
              else
                v37 = 0;
              v38 = v37;
              v39 = v36;
              objc_msgSend(v38, "updatedSuggestion");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109890;
              *(_DWORD *)&buf[4] = v65;
              v72 = 1024;
              *(_DWORD *)v73 = v24;
              *(_WORD *)&v73[4] = 2112;
              *(_QWORD *)&v73[6] = v35;
              *(_WORD *)&v73[14] = 2112;
              *(_QWORD *)&v73[16] = v40;
              _os_log_impl(&dword_1D5522000, v26, OS_LOG_TYPE_INFO, "Throttling search #%u for %u ms (text:'%@', suggestion: '%@').", buf, 0x22u);

            }
            goto LABEL_36;
          }
          if (!v27)
          {
LABEL_36:

            v55 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 1000000 * v24);
            *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
            objc_initWeak((id *)buf, (id)a1);
            v56 = *(void **)(a1 + 48);
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __50__MUISearchSuggestionsGenerator__appendOperation___block_invoke;
            block[3] = &unk_1E99E35C0;
            v57 = v56;
            objc_copyWeak(&v70, (id *)buf);
            v69 = v21;
            dispatch_after(v55, v57, block);

            objc_destroyWeak(&v70);
            objc_destroyWeak((id *)buf);
LABEL_39:

            goto LABEL_40;
          }
          v41 = *v4;
          v42 = v41;
          if (v41)
          {
            v43 = v41[3];
            v44 = v43;
            if (v43)
            {
              v66 = v43[2];
LABEL_31:
              v60 = v42;
              v45 = *v4;
              v46 = v45;
              v63 = v44;
              if (v45)
                v47 = (void *)*((_QWORD *)v45 + 4);
              else
                v47 = 0;
              v48 = v47;
              objc_msgSend(v48, "phrase");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = *v4;
              if (*v4)
                v51 = (void *)v50[4];
              else
                v51 = 0;
              v52 = v51;
              v53 = v50;
              objc_msgSend(v52, "updatedSuggestion");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109634;
              *(_DWORD *)&buf[4] = v66;
              v72 = 2112;
              *(_QWORD *)v73 = v49;
              *(_WORD *)&v73[8] = 2112;
              *(_QWORD *)&v73[10] = v54;
              _os_log_impl(&dword_1D5522000, v26, OS_LOG_TYPE_INFO, "Enqueueing search #%u (text:'%@', suggestion: '%@').", buf, 0x1Cu);

              goto LABEL_36;
            }
          }
          else
          {
            v44 = 0;
          }
          v66 = 0;
          goto LABEL_31;
        }
      }
      -[MUISearchSuggestionsGenerator startPendingOperationWithID:](a1, v21);
      goto LABEL_39;
    }
    v6 = *v4;
    v7 = v6;
    if (v6)
    {
      v8 = v6[3];
      v9 = v8;
      if (v8)
      {
        v64 = v8[2];
LABEL_7:
        v58 = v7;
        v10 = *v4;
        v11 = v10;
        v61 = v9;
        if (v10)
          v12 = (void *)*((_QWORD *)v10 + 4);
        else
          v12 = 0;
        v13 = v12;
        objc_msgSend(v13, "phrase");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *v4;
        if (*v4)
          v16 = (void *)v15[4];
        else
          v16 = 0;
        v17 = v16;
        v18 = v15;
        objc_msgSend(v17, "updatedSuggestion");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = v64;
        v72 = 2112;
        *(_QWORD *)v73 = v14;
        *(_WORD *)&v73[8] = 2112;
        *(_QWORD *)&v73[10] = v19;
        _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "Cancelling search #%u, text:'%@', suggestion: '%@'", buf, 0x1Cu);

        goto LABEL_12;
      }
    }
    else
    {
      v9 = 0;
    }
    v64 = 0;
    goto LABEL_7;
  }
LABEL_40:

}

void __62__MUISearchSuggestionsGenerator__throttleIntervalMilliseconds__block_invoke()
{
  void *v0;
  uint64_t v1;
  NSObject *v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "integerForKey:", CFSTR("SearchSuggestionGeneratorThrottleInterval"));

  _throttleIntervalMilliseconds_interval = v1 & ~(v1 >> 63);
  +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = _throttleIntervalMilliseconds_interval;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "Throttle interval: %u ms", (uint8_t *)v3, 8u);
  }

}

void __50__MUISearchSuggestionsGenerator__appendOperation___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[MUISearchSuggestionsGenerator startPendingOperationWithID:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)startPendingOperationWithID:(uint64_t)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  char v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  Class isa;
  void *v13;
  Class v14;
  objc_class *v15;
  int v16;
  Class v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  int v23;
  int v24;
  objc_class *v25;
  NSObject *log;
  void *v27;
  objc_class *v28;
  int v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    v4 = *(_QWORD **)(a1 + 24);
    if (v4)
      v5 = v4[3];
    else
      v5 = 0;
    v6 = v4;
    v7 = objc_msgSend(v3, "isEqualToID:", v5);

    if ((v7 & 1) != 0)
    {
      v8 = *(id *)(a1 + 24);
      v9 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
      +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        if (v8)
        {
          v11 = v8[3].isa;
          if (v11)
            v29 = *((_DWORD *)v11 + 2);
          else
            v29 = 0;
          v33 = v11;
          isa = v8[4].isa;
        }
        else
        {
          v29 = 0;
          v33 = 0;
          isa = 0;
        }
        v13 = (void *)MEMORY[0x1E0D1EF48];
        v32 = isa;
        -[objc_class phrase](v32, "phrase");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "partiallyRedactedStringForString:");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          v14 = v8[4].isa;
        else
          v14 = 0;
        log = v10;
        v28 = v14;
        -[objc_class updatedSuggestion](v28, "updatedSuggestion");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          v15 = v8[5].isa;
          v16 = (int)v15;
          v17 = v8[5].isa;
          v25 = v15;
        }
        else
        {
          v16 = 0;
          v25 = 0;
          v17 = 0;
        }
        v18 = v17;
        -[objc_class ef_map:](v18, "ef_map:", &__block_literal_global_130);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR(", "));
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = *(id *)(a1 + 40);
        v22 = v20;
        v23 = objc_msgSend(v21, "count");
        v24 = objc_msgSend(*(id *)(a1 + 32), "count");
        *(_DWORD *)buf = 67110658;
        v35 = v29;
        v36 = 2112;
        v37 = v31;
        v38 = 2112;
        v39 = v27;
        v40 = 1024;
        v41 = v16;
        v42 = 2114;
        v43 = v20;
        v44 = 1024;
        v45 = v23;
        v46 = 1024;
        v47 = v24;
        v10 = log;
        _os_log_impl(&dword_1D5522000, log, OS_LOG_TYPE_DEFAULT, "Starting search #%u, text '%@', suggestion: '%@', %u suggester(s): '%{public}@'. Now %u active operation(s), %u cancelled operation(s).", buf, 0x38u);

      }
      -[_MUISearchSuggestionsOperation start]((dispatch_queue_t *)v8);
    }
    else
    {
      +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[MUISearchSuggestionsGenerator startPendingOperationWithID:].cold.1((uint64_t)v3, v8);
    }

  }
}

- (void)stopGeneratingSuggestionsWithIdentifier:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    if (self)
      queue = self->_queue;
    else
      queue = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__MUISearchSuggestionsGenerator_stopGeneratingSuggestionsWithIdentifier___block_invoke;
    block[3] = &unk_1E99E35C0;
    v6 = queue;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    dispatch_async(v6, block);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __73__MUISearchSuggestionsGenerator_stopGeneratingSuggestionsWithIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  -[MUISearchSuggestionsGenerator _stopGeneratingSuggestionsWithIdentifier:]((uint64_t)WeakRetained, *(void **)(a1 + 32));

}

- (void)_stopGeneratingSuggestionsWithIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  _DWORD *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _DWORD *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  int v17;
  int v18;
  _DWORD *v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    if (v3)
    {
      v4 = *(void **)(a1 + 40);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __74__MUISearchSuggestionsGenerator__stopGeneratingSuggestionsWithIdentifier___block_invoke;
      v20[3] = &unk_1E99E35E8;
      v5 = v3;
      v21 = v5;
      v6 = v4;
      objc_msgSend(v6, "ef_firstObjectPassingTest:", v20);
      v7 = objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[_MUISearchSuggestionsOperation cancel]((unsigned __int8 *)v7);
        objc_msgSend(*(id *)(a1 + 40), "removeObjectIdenticalTo:", v7);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
        +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v9 = *(_DWORD **)(v7 + 24);
          if (v9)
            v18 = v9[2];
          else
            v18 = 0;
          v10 = *(id *)(v7 + 32);
          v19 = v9;
          objc_msgSend(v10, "phrase");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(id *)(v7 + 32);
          objc_msgSend(v12, "updatedSuggestion");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(id *)(a1 + 40);
          v15 = objc_msgSend(v14, "count");
          v16 = objc_msgSend(*(id *)(a1 + 32), "count");
          *(_DWORD *)buf = 67110146;
          v23 = v18;
          v24 = 2112;
          v25 = v11;
          v26 = 2112;
          v27 = v13;
          v28 = 1024;
          v29 = v15;
          v30 = 1024;
          v31 = v16;
          _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "Cancelling search #%u, text:'%@', suggestion: '%@'. Now %u active operation(s), %u cancelled operation(s).", buf, 0x28u);

        }
      }
      else
      {
        +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v5[2];
          *(_DWORD *)buf = 67109120;
          v23 = v17;
          _os_log_impl(&dword_1D5522000, v8, OS_LOG_TYPE_DEFAULT, "No active search #%u. Not cancelling.", buf, 8u);
        }
      }

    }
  }

}

BOOL __74__MUISearchSuggestionsGenerator__stopGeneratingSuggestionsWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  _DWORD *v3;
  int v4;
  uint64_t v5;
  _BOOL8 v6;

  if (a2)
  {
    v3 = *(id *)(a2 + 24);
    if (v3)
    {
      v4 = v3[2];
      goto LABEL_4;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = 0;
LABEL_4:
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    LODWORD(v5) = *(_DWORD *)(v5 + 8);
  v6 = v4 == (_DWORD)v5;

  return v6;
}

- (void)cancel
{
  MUISearchSuggestionsGenerator *v2;
  _QWORD block[5];

  v2 = self;
  if (self)
    self = (MUISearchSuggestionsGenerator *)self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__MUISearchSuggestionsGenerator_cancel__block_invoke;
  block[3] = &unk_1E99E1258;
  block[4] = v2;
  dispatch_async(&self->super, block);
  if (v2)
    objc_storeWeak((id *)&v2->_delegate, 0);
}

uint64_t __39__MUISearchSuggestionsGenerator_cancel__block_invoke(uint64_t a1)
{
  return -[MUISearchSuggestionsGenerator _cancel](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_cancel
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 48));
    v2 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = 0;

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v1;
    v3 = *(id *)(v1 + 40);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      v7 = &off_1E99E0000;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
          objc_msgSend(v7[131], "log");
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            if (v9)
            {
              v11 = *(id *)(v9 + 24);
              v12 = v11;
              if (v11)
                v13 = *((_DWORD *)v11 + 2);
              else
                v13 = 0;
              v14 = *(void **)(v9 + 32);
            }
            else
            {
              v13 = 0;
              v12 = 0;
              v14 = 0;
            }
            v15 = v14;
            objc_msgSend(v15, "phrase");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 67109378;
            v26 = v13;
            v27 = 2112;
            v28 = v16;
            _os_log_impl(&dword_1D5522000, v10, OS_LOG_TYPE_DEFAULT, "Cancelling search #%u, text:'%@'.", buf, 0x12u);

            v7 = &off_1E99E0000;
          }

          -[_MUISearchSuggestionsOperation cancel]((unsigned __int8 *)v9);
          ++v8;
        }
        while (v5 != v8);
        v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        v5 = v17;
      }
      while (v17);
    }

    v18 = *(_QWORD *)(v20 + 40);
    v19 = *(id *)(v20 + 32);
    objc_msgSend(v19, "addObjectsFromArray:", v18);

    return objc_msgSend(*(id *)(v20 + 40), "removeAllObjects");
  }
  return result;
}

- (void)_didProduceResult:(uint64_t)a1
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    objc_msgSend(v3, "requestID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[MUISearchSuggestionsGenerator _hasActiveOperationsWithRequestID:](a1, v4);

    if (v5)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__MUISearchSuggestionsGenerator__didProduceResult___block_invoke;
      v10[3] = &unk_1E99E1600;
      v11 = v3;
      v12 = a1;
      dispatch_async(MEMORY[0x1E0C80D38], v10);
      v6 = v11;
    }
    else
    {
      +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "requestID");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        if (v7)
          v9 = *(_DWORD *)(v7 + 8);
        else
          v9 = 0;
        *(_DWORD *)buf = 67109120;
        v14 = v9;
        _os_log_impl(&dword_1D5522000, v6, OS_LOG_TYPE_DEFAULT, "Search #%u did produce result, but it’s no longer active.", buf, 8u);

      }
    }

  }
}

- (uint64_t)_hasActiveOperationsWithRequestID:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__MUISearchSuggestionsGenerator__hasActiveOperationsWithRequestID___block_invoke;
    v7[3] = &unk_1E99E3610;
    v8 = v3;
    a1 = objc_msgSend(v5, "indexOfObjectPassingTest:", v7) != 0x7FFFFFFFFFFFFFFFLL;

  }
  return a1;
}

void __51__MUISearchSuggestionsGenerator__didProduceResult___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "requestID");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v3;
    if (v3)
      v5 = *(_DWORD *)(v3 + 8);
    else
      v5 = 0;
    objc_msgSend(*(id *)(a1 + 32), "suggestions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109376;
    v10[1] = v5;
    v11 = 1024;
    v12 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "Search #%u did produce result with %u suggestions.", (uint8_t *)v10, 0xEu);

  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 8));
    v9 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v9 = 0;
    WeakRetained = 0;
  }
  objc_msgSend(WeakRetained, "suggestionsGenerator:didProduceResult:", v9, *(_QWORD *)(a1 + 32));

}

BOOL __67__MUISearchSuggestionsGenerator__hasActiveOperationsWithRequestID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (a2)
    v2 = *(_QWORD *)(a2 + 24);
  else
    v2 = 0;
  return v2 == *(_QWORD *)(a1 + 32);
}

- (void)_operationDidComplete:(uint64_t)a1
{
  id v3;
  unsigned __int8 v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD block[4];
  NSObject *v8;
  uint64_t v9;
  char v10;
  uint8_t buf[4];
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 48));
    if (v3 && (v4 = atomic_load((unsigned __int8 *)v3 + 8), (v4 & 1) != 0))
    {
      +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *((_QWORD *)v3 + 3);
        if (v6)
          LODWORD(v6) = *(_DWORD *)(v6 + 8);
        *(_DWORD *)buf = 67109120;
        v12 = v6;
        _os_log_impl(&dword_1D5522000, v5, OS_LOG_TYPE_DEFAULT, "Search #%u did complete, but it’s cancelled.", buf, 8u);
      }
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __55__MUISearchSuggestionsGenerator__operationDidComplete___block_invoke;
      block[3] = &unk_1E99E3638;
      v8 = v3;
      v9 = a1;
      v10 = 0;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      v5 = v8;
    }

    objc_msgSend(*(id *)(a1 + 32), "removeObjectIdenticalTo:", v3);
    objc_msgSend(*(id *)(a1 + 40), "removeObjectIdenticalTo:", v3);
  }

}

void __55__MUISearchSuggestionsGenerator__operationDidComplete___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _DWORD *v4;
  int v5;
  uint64_t v6;
  id WeakRetained;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[MUISearchSuggestionsGenerator log](MUISearchSuggestionsGenerator, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3 && (v4 = *(id *)(v3 + 24)) != 0)
    {
      v5 = v4[2];

    }
    else
    {
      v5 = 0;
    }
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl(&dword_1D5522000, v2, OS_LOG_TYPE_DEFAULT, "Search #%u did complete.", (uint8_t *)v11, 8u);
  }

  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 8));
    v8 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v8 = 0;
    WeakRetained = 0;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    v10 = *(_QWORD *)(v9 + 24);
  else
    v10 = 0;
  objc_msgSend(WeakRetained, "suggestionsGenerator:didCompleteRequestID:", v8, v10);

  signpostEndEnqueueInterval(*(void **)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_activeOperations, 0);
  objc_storeStrong((id *)&self->_cancelledOperations, 0);
  objc_storeStrong((id *)&self->_pendingOperation, 0);
  objc_storeStrong((id *)&self->_suggesters, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startPendingOperationWithID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (a1)
    v2 = *(_DWORD *)(a1 + 8);
  else
    v2 = 0;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1D5522000, a2, OS_LOG_TYPE_DEBUG, "Not starting throttled search #%u", (uint8_t *)v3, 8u);
}

@end
