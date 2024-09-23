@implementation CLSPublicEventCacheCreator

- (CLSPublicEventCacheCreator)initWithCache:(id)a3 queryRadius:(double)a4
{
  id v7;
  CLSPublicEventCacheCreator *v8;
  CLSPublicEventCacheCreator *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSPublicEventCacheCreator;
  v8 = -[CLSPublicEventCacheCreator init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_cache, a3);
    v9->_queryRadius = a4;
    v9->_maximumBatchSize = +[CLSPublicEventGeoServiceQuery maximumBatchSize](CLSPublicEventGeoServiceQuery, "maximumBatchSize");
  }

  return v9;
}

- (id)createCacheForTimeLocationTuples:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  unint64_t maximumBatchSize;
  CLSPublicEventCacheCreatorResult *v9;
  CLSPublicEventCacheCreatorResult *v10;
  void (**v11)(_QWORD, _QWORD, double);
  CLSPublicEventCacheCreatorResult *v12;
  char v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  CLSPublicEventCacheCreatorResult *v25;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  CLSPublicEventCacheCreatorResult *v32;
  void (**v33)(_QWORD, _QWORD, double);
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t *v49;
  double v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  _QWORD v59[4];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  _DWORD v64[4];
  _BYTE v65[128];
  uint64_t buf;
  uint64_t *p_buf;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  maximumBatchSize = self->_maximumBatchSize;
  v9 = objc_alloc_init(CLSPublicEventCacheCreatorResult);
  v10 = v9;
  if (maximumBatchSize)
  {
    v11 = (void (**)(_QWORD, _QWORD, double))MEMORY[0x1D1796244](v7);
    v12 = v10;
    v60 = 0;
    v61 = &v60;
    v62 = 0x2020000000;
    v63 = 0;
    if (v11
      && (LOBYTE(v59[0]) = 0,
          ((void (**)(_QWORD, _QWORD *, double))v11)[2](v11, v59, 0.0),
          v13 = *((_BYTE *)v61 + 24) | LOBYTE(v59[0]),
          (*((_BYTE *)v61 + 24) = v13) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 0x4504000100;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v7;
      v32 = v10;
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", maximumBatchSize);
      v33 = v11;
      buf = 0;
      p_buf = &buf;
      v68 = 0x2020000000;
      v69 = 0;
      v16 = objc_msgSend(v6, "count");
      v59[0] = 0;
      v59[1] = v59;
      v59[2] = 0x2020000000;
      v59[3] = 0;
      v55 = 0;
      v56 = &v55;
      v57 = 0x2020000000;
      v58 = 0;
      v51 = 0;
      v52 = &v51;
      v53 = 0x2020000000;
      v54 = 0;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __77__CLSPublicEventCacheCreator_createCacheForTimeLocationTuples_progressBlock___block_invoke;
      v39[3] = &unk_1E84F6F70;
      v45 = &buf;
      v39[4] = self;
      v17 = v15;
      v40 = v17;
      v43 = v7;
      v28 = v14;
      v41 = v28;
      v30 = v29;
      v42 = v30;
      v46 = &v51;
      v47 = v59;
      v50 = (double)maximumBatchSize / (double)v16;
      v18 = v11;
      v44 = v18;
      v48 = &v60;
      v49 = &v55;
      v19 = (void (**)(_QWORD))MEMORY[0x1D1796244](v39);
      if (v16)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v20 = v6;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v65, 16);
        if (v21)
        {
          v22 = *(_QWORD *)v36;
LABEL_9:
          v23 = 0;
          while (1)
          {
            if (*(_QWORD *)v36 != v22)
              objc_enumerationMutation(v20);
            objc_msgSend(v17, "addObject:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v23));
            if (objc_msgSend(v17, "count") >= maximumBatchSize)
              v19[2](v19);
            if (*((_BYTE *)v56 + 24) || *((_BYTE *)v52 + 24))
              break;
            if (v21 == ++v23)
            {
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v65, 16);
              if (v21)
                goto LABEL_9;
              break;
            }
          }
        }

        v7 = v31;
        v10 = v32;
        if (objc_msgSend(v17, "count") && !*((_BYTE *)v56 + 24) && !*((_BYTE *)v52 + 24))
          v19[2](v19);
      }
      if (v33
        && (v34 = 0,
            (*((void (**)(id, char *, double))v18 + 2))(v18, &v34, 1.0),
            v24 = *((_BYTE *)v61 + 24) | v34,
            (*((_BYTE *)v61 + 24) = v24) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          v64[0] = 67109120;
          v64[1] = 136;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)v64, 8u);
        }
      }
      else
      {
        objc_msgSend(v27, "setResolvedPublicEventsByTimeLocationIdentifier:", v28);
        objc_msgSend(v27, "setInvalidationTokenByTimeLocationIdentifier:", v30);
        objc_msgSend(v27, "setNumberOfRequests:", p_buf[3]);
      }

      _Block_object_dispose(&v51, 8);
      _Block_object_dispose(&v55, 8);
      _Block_object_dispose(v59, 8);
      _Block_object_dispose(&buf, 8);

      v11 = v33;
    }
    _Block_object_dispose(&v60, 8);

  }
  else
  {
    v25 = v9;
  }

  return v10;
}

- (id)_queryEventsForTimeLocationTuples:(id)a3 invalidationTokens:(id *)a4 progressBlock:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, double);
  char v14;
  id v15;
  CLSPublicEventGeoServiceQuery *v16;
  id *v17;
  id v18;
  id *v19;
  dispatch_block_t v20;
  CLSQueueBasedGeoMapQueryHelper *v21;
  uint64_t v22;
  id v23;
  char v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v29;
  char v30;
  _QWORD v31[4];
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t *v35;
  _QWORD v36[4];
  void (**v37)(_QWORD, _QWORD, double);
  uint64_t *v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  int v53;
  int v54;
  uint64_t buf;
  uint64_t *p_buf;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = MEMORY[0x1D1796244]();
  v13 = (void (**)(_QWORD, _QWORD, double))v12;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (!v12
    || (LOBYTE(v43) = 0,
        (*(void (**)(uint64_t, uint64_t *, double))(v12 + 16))(v12, &v43, 0.0),
        v14 = *((_BYTE *)v50 + 24) | v43,
        (*((_BYTE *)v50 + 24) = v14) == 0))
  {
    buf = 0;
    p_buf = &buf;
    v57 = 0x3032000000;
    v58 = __Block_byref_object_copy_;
    v59 = __Block_byref_object_dispose_;
    v60 = 0;
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy_;
    v47 = __Block_byref_object_dispose_;
    v48 = 0;
    v39 = 0;
    v40 = &v39;
    v41 = 0x2020000000;
    v42 = 0;
    v16 = -[CLSPublicEventGeoServiceQuery initWithTimeLocationTuples:radius:]([CLSPublicEventGeoServiceQuery alloc], "initWithTimeLocationTuples:radius:", v10, self->_queryRadius);
    if (v16)
    {
      v29 = v11;
      v17 = a4;
      v18 = v10;
      v19 = a6;
      v20 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global);
      v21 = -[CLSQueueBasedGeoMapQueryHelper initWithQueryObject:]([CLSQueueBasedGeoMapQueryHelper alloc], "initWithQueryObject:", v16);
      -[CLSQueueBasedGeoMapQueryHelper setSimulatesTimeout:](v21, "setSimulatesTimeout:", self->_simulatesTimeout);
      v22 = MEMORY[0x1E0C809B0];
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_2;
      v36[3] = &unk_1E84F87B8;
      v37 = v13;
      v38 = &v49;
      v31[0] = v22;
      v31[1] = 3221225472;
      v31[2] = __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_3;
      v31[3] = &unk_1E84F6FB8;
      v33 = &v39;
      v34 = &buf;
      v35 = &v43;
      v23 = v20;
      v32 = v23;
      -[CLSQueueBasedGeoMapQueryHelper launchQueryWithCancellerBlock:completionBlock:](v21, "launchQueryWithCancellerBlock:completionBlock:", v36, v31);
      dispatch_block_wait(v23, 0xFFFFFFFFFFFFFFFFLL);

      a6 = v19;
      v10 = v18;
      a4 = v17;
      v11 = v29;

    }
    if (v13
      && (v30 = 0,
          ((void (**)(_QWORD, char *, double))v13)[2](v13, &v30, 0.8),
          v24 = *((_BYTE *)v50 + 24) | v30,
          (*((_BYTE *)v50 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v53 = 67109120;
        v54 = 181;
        v25 = MEMORY[0x1E0C81028];
LABEL_24:
        _os_log_impl(&dword_1CAB79000, v25, OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&v53, 8u);
      }
    }
    else
    {
      if (*((_BYTE *)v40 + 24))
      {
        if (a4)
        {
          -[CLSPublicEventGeoServiceQuery invalidationTokens](v16, "invalidationTokens");
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        -[CLSPublicEventCacheCreator cache](self, "cache", v29);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "insertBatchesOfPublicEventsByTimeLocationIdentifier:forTimeLocationTuples:", v44[5], v10);

      }
      else if (a4)
      {
        *a4 = 0;
      }
      if (a6)
        *a6 = objc_retainAutorelease((id)p_buf[5]);
      if (!v13
        || (v30 = 0,
            ((void (**)(_QWORD, char *, double))v13)[2](v13, &v30, 1.0),
            v27 = *((_BYTE *)v50 + 24) | v30,
            (*((_BYTE *)v50 + 24) = v27) == 0))
      {
        v15 = (id)v44[5];
        goto LABEL_27;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v53 = 67109120;
        v54 = 204;
        v25 = MEMORY[0x1E0C81028];
        goto LABEL_24;
      }
    }
    v15 = (id)MEMORY[0x1E0C9AA70];
LABEL_27:

    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(&v43, 8);

    _Block_object_dispose(&buf, 8);
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x9904000100;
    _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", (uint8_t *)&buf, 8u);
  }
  v15 = (id)MEMORY[0x1E0C9AA70];
LABEL_28:
  _Block_object_dispose(&v49, 8);

  return v15;
}

- (CLSPublicEventCache)cache
{
  return self->_cache;
}

- (unint64_t)maximumBatchSize
{
  return self->_maximumBatchSize;
}

- (double)queryRadius
{
  return self->_queryRadius;
}

- (BOOL)simulatesTimeout
{
  return self->_simulatesTimeout;
}

- (void)setSimulatesTimeout:(BOOL)a3
{
  self->_simulatesTimeout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

uint64_t __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_2(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  char v5;

  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v5, 0.5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

void __103__CLSPublicEventCacheCreator__queryEventsForTimeLocationTuples_invalidationTokens_progressBlock_error___block_invoke_3(_QWORD *a1, int a2, void *a3, void *a4)
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a3);
  if (a2)
  {
    objc_msgSend(v8, "resolvedPublicEventsForTimeLocationTuples");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[7] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  (*(void (**)(void))(a1[4] + 16))();

}

uint64_t __77__CLSPublicEventCacheCreator_createCacheForTimeLocationTuples_progressBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D1796094]();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v11 = 0;
  objc_msgSend(v3, "_queryEventsForTimeLocationTuples:invalidationTokens:progressBlock:error:", v4, &v11, *(_QWORD *)(a1 + 64), &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  v7 = v10;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 48), "addEntriesFromDictionary:", v5);
    if (v6)
      objc_msgSend(*(id *)(a1 + 56), "addEntriesFromDictionary:", v6);
  }
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 1;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Received a geo error, stopping the public event creation: (%@)", buf, 0xCu);
    }
  }

  objc_autoreleasePoolPop(v2);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                          + 24);
  v8 = *(_QWORD *)(a1 + 72);
  if (!v8)
    return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  buf[0] = 0;
  result = (*(uint64_t (**)(uint64_t, uint8_t *, double))(v8 + 16))(v8, buf, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) |= buf[0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    return objc_msgSend(*(id *)(a1 + 40), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
  return result;
}

@end
