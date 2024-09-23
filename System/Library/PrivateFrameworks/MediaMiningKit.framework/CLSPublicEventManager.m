@implementation CLSPublicEventManager

- (CLSPublicEventManager)initWithURL:(id)a3
{
  id v4;
  CLSPublicEventManager *v5;
  CLSPublicEventManager *v6;
  CLSPublicEventCache *v7;
  void *v8;
  uint64_t v9;
  CLSPublicEventCache *cache;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CLSPublicEventManager;
  v5 = -[CLSPublicEventManager init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_queryRadius = 500.0;
    v7 = [CLSPublicEventCache alloc];
    +[CLSDBCache urlWithParentURL:](CLSPublicEventCache, "urlWithParentURL:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CLSDBCache initWithURL:](v7, "initWithURL:", v8);
    cache = v6->_cache;
    v6->_cache = (CLSPublicEventCache *)v9;

  }
  return v6;
}

- (id)publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;
  uint64_t v25;
  double v26;
  CLSPublicEventCacheCreator *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  void (**v40)(_QWORD, _QWORD);
  uint64_t *v41;
  uint64_t *v42;
  double v43;
  double v44;
  char v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[8];
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38 = v6;
  v8 = objc_msgSend(v6, "count");
  v37 = v7;
  if (v8)
  {
    v36 = v8;
    v9 = MEMORY[0x1D1796244](v7);
    v10 = (void (**)(_QWORD, _QWORD))v9;
    v54 = 0;
    v55 = &v54;
    v56 = 0x2020000000;
    v57 = 0;
    if (v9)
    {
      LOBYTE(v50) = 0;
      (*(void (**)(uint64_t, uint64_t *, double))(v9 + 16))(v9, &v50, 0.0);
      v11 = *((_BYTE *)v55 + 24) | v50;
      *((_BYTE *)v55 + 24) = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = 55;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v12 = (id)MEMORY[0x1E0C9AA70];
        goto LABEL_32;
      }
    }
    -[CLSPublicEventManager loadInvalidationTokensAndInvalidateCachesIfNeeded](self, "loadInvalidationTokensAndInvalidateCachesIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0;
    v51 = (double *)&v50;
    v52 = 0x2020000000;
    v53 = 0;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v16 = v6;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v47;
      while (2)
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          -[CLSPublicEventCache publicEventsForTimeLocationTuple:](self->_cache, "publicEventsForTimeLocationTuple:", v20, v35);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v20, "timeLocationIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v21, v22);

          }
          else
          {
            objc_msgSend(v15, "addObject:", v20);
          }
          v51[3] = 1.0 / (double)v36 * 0.35 + v51[3];
          if (v10)
          {
            buf[0] = 0;
            ((void (**)(_QWORD, uint8_t *))v10)[2](v10, buf);
            v23 = *((_BYTE *)v55 + 24) | buf[0];
            *((_BYTE *)v55 + 24) = v23;
            if (v23)
            {

              goto LABEL_23;
            }
          }

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v46, v63, 16);
        if (v17)
          continue;
        break;
      }
    }

    if (v10)
    {
LABEL_23:
      v45 = 0;
      ((void (*)(void (**)(_QWORD, _QWORD), char *, double))v10[2])(v10, &v45, v51[3]);
      v24 = *((_BYTE *)v55 + 24) | v45;
      *((_BYTE *)v55 + 24) = v24;
      if (v24)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = 80;
          _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d", buf, 8u);
        }
        v12 = (id)MEMORY[0x1E0C9AA70];
        goto LABEL_31;
      }
    }
    v25 = objc_msgSend(v15, "count", v35);
    v26 = v51[3];
    if (objc_msgSend(v15, "count"))
    {
      v27 = -[CLSPublicEventCacheCreator initWithCache:queryRadius:]([CLSPublicEventCacheCreator alloc], "initWithCache:queryRadius:", self->_cache, self->_queryRadius);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __102__CLSPublicEventManager_publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples_progressBlock___block_invoke;
      v39[3] = &unk_1E84F8B60;
      v41 = &v50;
      v43 = v26;
      v44 = 1.0 - v26;
      v40 = v10;
      v42 = &v54;
      -[CLSPublicEventCacheCreator createCacheForTimeLocationTuples:progressBlock:](v27, "createCacheForTimeLocationTuples:progressBlock:", v15, v39);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "resolvedPublicEventsByTimeLocationIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addEntriesFromDictionary:", v29);

      objc_msgSend(v28, "invalidationTokenByTimeLocationIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addEntriesFromDictionary:", v30);

      -[CLSPublicEventManager saveEventsForCacheInvalidation:](self, "saveEventsForCacheInvalidation:", v35);
      v31 = objc_msgSend(v28, "numberOfRequests");
      v32 = -[CLSPublicEventCacheCreator maximumBatchSize](v27, "maximumBatchSize");

    }
    else
    {
      v31 = 0;
      v32 = 0;
    }
    v33 = objc_msgSend(v14, "count");
    *(_QWORD *)buf = v36;
    v59 = v33 - (v36 - v25);
    v60 = v36 - v25;
    v61 = v31;
    v62 = v32;
    CLSPrintQueryPerformerProtocolStatisticsDescription((uint64_t)CFSTR("CLSPublicEventGeoQuery"), buf);
    v12 = v14;
LABEL_31:
    _Block_object_dispose(&v50, 8);

LABEL_32:
    _Block_object_dispose(&v54, 8);

    goto LABEL_33;
  }
  v12 = (id)MEMORY[0x1E0C9AA70];
LABEL_33:

  return v12;
}

- (id)cachedPublicEventsForMuid:(unint64_t)a3
{
  return -[CLSPublicEventCache publicEventsForMuid:](self->_cache, "publicEventsForMuid:", a3);
}

- (id)loadInvalidationTokensAndInvalidateCachesIfNeeded
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
}

- (id)urlForEventsForCacheInvalidation
{
  void *v2;
  void *v3;
  void *v4;

  -[CLSDBCache diskCacheURL](self->_cache, "diskCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("eventsForCacheInvalidation.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)invalidateMemoryCaches
{
  -[CLSDBCache invalidateMemoryCaches](self->_cache, "invalidateMemoryCaches");
}

- (void)invalidateDiskCaches
{
  -[CLSDBCache invalidateDiskCaches](self->_cache, "invalidateDiskCaches");
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  -[CLSPublicEventCache invalidateCacheItemsBeforeDateWithTimestamp:](self->_cache, "invalidateCacheItemsBeforeDateWithTimestamp:", a3);
}

- (double)queryRadius
{
  return self->_queryRadius;
}

- (void)setQueryRadius:(double)a3
{
  self->_queryRadius = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

uint64_t __102__CLSPublicEventManager_publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;
  char v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 56) + a3 * *(double *)(a1 + 64);
  result = *(_QWORD *)(a1 + 32);
  if (result)
  {
    v6 = 0;
    result = (*(uint64_t (**)(uint64_t, char *, double))(result + 16))(result, &v6, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) |= v6;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      *a2 = 1;
  }
  return result;
}

@end
