@implementation PHImageManagerRequestTracer

+ (id)_currentTimestampString
{
  void *v2;
  void *v3;
  void *v4;

  if (_currentTimestampString_s_onceToken != -1)
    dispatch_once(&_currentTimestampString_s_onceToken, &__block_literal_global_30035);
  v2 = (void *)_currentTimestampString_s_formatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringFromDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (void)_inq_recordRequestID:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)s_mostRecentTraceDateByRequestID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

+ (void)_inq_trimToMostRecentImageManagerMessages
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)objc_msgSend((id)s_mostRecentTraceDateByRequestID, "count") >= 0x65)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v31 = 0;
    v32 = (id *)&v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__30030;
    v35 = __Block_byref_object_dispose__30031;
    v36 = 0;
    objc_msgSend((id)s_mostRecentTraceDateByRequestID, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    if (v6)
    {
      v7 = 0;
      v8 = *(_QWORD *)v28;
LABEL_4:
      v9 = 0;
      v10 = 4 - v7;
      v7 += v6;
      while (1)
      {
        if (*(_QWORD *)v28 != v8)
          objc_enumerationMutation(v5);
        objc_storeStrong(v32 + 5, *(id *)(*((_QWORD *)&v27 + 1) + 8 * v9));
        if (v10 == v9)
          break;
        if (v6 == ++v9)
        {
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }

    v11 = (void *)s_mostRecentTraceDateByRequestID;
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke;
    v24[3] = &unk_1E35DC378;
    v26 = &v31;
    v13 = v2;
    v25 = v13;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v24);
    objc_msgSend((id)s_messagesByRequestID, "removeObjectsForKeys:", v13);
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = (void *)s_requestIDsByAssetUUID;
    v18 = v12;
    v19 = 3221225472;
    v20 = __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke_2;
    v21 = &unk_1E35DC3A0;
    v16 = v13;
    v22 = v16;
    v17 = v14;
    v23 = v17;
    objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", &v18);
    objc_msgSend((id)s_mostRecentTraceDateByRequestID, "removeObjectsForKeys:", v16, v18, v19, v20, v21);
    objc_msgSend((id)s_requestIDsByAssetUUID, "removeObjectsForKeys:", v17);

    _Block_object_dispose(&v31, 8);
  }
}

+ (void)initialize
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  NSObject *attr;

  if ((id)objc_opt_class() == a1)
  {
    s_tracingDisabled = 0;
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)s_requestIDsByAssetUUID;
    s_requestIDsByAssetUUID = (uint64_t)v2;

    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = (void *)s_messagesByRequestID;
    s_messagesByRequestID = (uint64_t)v4;

    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = (void *)s_mostRecentTraceDateByRequestID;
    s_mostRecentTraceDateByRequestID = (uint64_t)v6;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_UTILITY, 0);
    attr = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.photos.pdimagemanagertracingqueue", attr);
    v10 = (void *)s_queue;
    s_queue = (uint64_t)v9;

  }
}

+ (int)requestIDFromTaskIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "length")
    && (v4 = objc_msgSend(v3, "rangeOfString:options:", CFSTR("-"), 2), v4 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v3, "substringFromIndex:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (void)registerRequestID:(int)a3 withAssetUUID:(id)a4
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  int v13;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManagerRequestTracer.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUID"));

  }
  v8 = s_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PHImageManagerRequestTracer_registerRequestID_withAssetUUID___block_invoke;
  block[3] = &unk_1E35DC3E8;
  v12 = v7;
  v13 = a3;
  v9 = v7;
  dispatch_async(v8, block);

}

+ (void)traceMessageForRequestID:(int)a3 message:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18;
  int v19;
  uint64_t *v20;
  uint64_t v21;

  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManagerRequestTracer.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v20 = &v21;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "_currentTimestampString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: "), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v7, &v21);
  objc_msgSend(v10, "stringByAppendingString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = s_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__PHImageManagerRequestTracer_traceMessageForRequestID_message___block_invoke;
  block[3] = &unk_1E35DC410;
  v19 = a3;
  v17 = v12;
  v18 = a1;
  v14 = v12;
  dispatch_async(v13, block);

}

+ (id)recentMessagesSummaryForAssetUUID:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v13;
  _QWORD block[4];
  id v15;
  id v16;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHImageManagerRequestTracer.m"), 178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = s_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__PHImageManagerRequestTracer_recentMessagesSummaryForAssetUUID___block_invoke;
  block[3] = &unk_1E35DF9E8;
  v15 = v5;
  v8 = v6;
  v16 = v8;
  v9 = v5;
  dispatch_sync(v7, block);
  v10 = v16;
  v11 = v8;

  return v11;
}

+ (void)setTracingDisabled:(BOOL)a3
{
  s_tracingDisabled = a3;
}

void __65__PHImageManagerRequestTracer_recentMessagesSummaryForAssetUUID___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
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
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend((id)s_requestIDsByAssetUUID, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend((id)s_mostRecentTraceDateByRequestID, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);
        objc_msgSend(v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "sortUsingSelector:", sel_compare_);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v11)
  {
    v12 = v11;
    v21 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("ID: %@\n"), v14);
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend((id)s_messagesByRequestID, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v23;
          do
          {
            for (k = 0; k != v17; ++k)
            {
              if (*(_QWORD *)v23 != v18)
                objc_enumerationMutation(v15);
              objc_msgSend(*(id *)(a1 + 40), "appendString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * k));
              objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));
            }
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
          }
          while (v17);
        }

        objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\n"));
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }

}

void __64__PHImageManagerRequestTracer_traceMessageForRequestID_message___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)s_messagesByRequestID;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = (void *)s_messagesByRequestID;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

  }
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_inq_recordRequestID:", *(int *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "_inq_trimToMostRecentImageManagerMessages");

}

void __63__PHImageManagerRequestTracer_registerRequestID_withAssetUUID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend((id)s_requestIDsByAssetUUID, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)s_requestIDsByAssetUUID, "setObject:forKeyedSubscript:");
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v2);

}

void __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) == -1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __72__PHImageManagerRequestTracer__inq_trimToMostRecentImageManagerMessages__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "removeObjectsInArray:", v5);
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

uint64_t __54__PHImageManagerRequestTracer__currentTimestampString__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_currentTimestampString_s_formatter;
  _currentTimestampString_s_formatter = (uint64_t)v0;

  return objc_msgSend((id)_currentTimestampString_s_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd' 'HH:mm:ss.SS"));
}

@end
