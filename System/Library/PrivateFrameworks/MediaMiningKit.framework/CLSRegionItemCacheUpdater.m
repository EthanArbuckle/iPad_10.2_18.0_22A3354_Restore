@implementation CLSRegionItemCacheUpdater

- (CLSRegionItemCacheUpdater)initWithQueryPerformers:(id)a3
{
  id v5;
  CLSRegionItemCacheUpdater *v6;
  CLSRegionItemCacheUpdater *v7;
  os_log_t v8;
  OS_os_log *loggingConnection;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLSRegionItemCacheUpdater;
  v6 = -[CLSRegionItemCacheUpdater init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queryPerformers, a3);
    v7->_simulatesTimeout = 0;
    v7->_timeoutInterval = 20.0;
    v7->_numberOfRetries = 0;
    v8 = os_log_create("com.apple.mediaminingkit", "default");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;

  }
  return v7;
}

- (BOOL)createCacheForRegions:(id)a3 progressBlock:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  double Current;
  dispatch_group_t v9;
  dispatch_semaphore_t v10;
  void *v11;
  CLSGeoServiceThread *v12;
  uint64_t v13;
  NSUInteger v14;
  void *v15;
  float v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  uint64_t v30;
  id v31;
  OS_os_log *v32;
  OS_os_log *v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;
  id v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  void *v44;
  NSArray *queryPerformers;
  double v46;
  NSObject *v47;
  BOOL v48;
  id *v50;
  NSObject *v51;
  id v52;
  id v53;
  NSArray *obj;
  dispatch_group_t group;
  id v56;
  void *v57;
  _QWORD v59[5];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[4];
  OS_os_log *v65;
  id v66;
  id v67;
  id v68;
  uint64_t *v69;
  _QWORD *v70;
  uint64_t v71;
  float v72;
  _OWORD v73[2];
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _QWORD v83[4];
  dispatch_group_t v84;
  NSObject *v85;
  CLSRegionItemCacheUpdater *v86;
  id v87;
  id v88;
  id v89;
  uint64_t *v90;
  _QWORD *v91;
  uint64_t *v92;
  float v93;
  _QWORD v94[3];
  int v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  uint64_t v102;
  unsigned __int8 *v103;
  uint64_t v104;
  char v105;
  _BYTE v106[128];
  __int128 buf;
  __int128 v108;
  uint64_t v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v50 = a5;
  v112 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  Current = CFAbsoluteTimeGetCurrent();
  v9 = dispatch_group_create();
  v10 = dispatch_semaphore_create(1);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc_init(CLSGeoServiceThread);
  -[CLSGeoServiceThread setName:](v12, "setName:", CFSTR("GeoService thread Run Loop"));
  -[CLSGeoServiceThread start](v12, "start");
  objc_msgSend(v11, "addObject:", v12);

  v102 = 0;
  v103 = (unsigned __int8 *)&v102;
  v104 = 0x2020000000;
  v105 = 0;
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__1115;
  v100 = __Block_byref_object_dispose__1116;
  v101 = 0;
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  v95 = 0;
  v13 = objc_msgSend(v6, "count");
  v14 = -[NSArray count](self->_queryPerformers, "count");
  v15 = (void *)objc_opt_new();
  v16 = (float)(v14 * v13);
  v83[0] = MEMORY[0x1E0C809B0];
  v83[1] = 3221225472;
  v83[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke;
  v83[3] = &unk_1E84F77C8;
  group = v9;
  v84 = group;
  v90 = &v102;
  v51 = v10;
  v85 = v51;
  v86 = self;
  v53 = v15;
  v87 = v53;
  v52 = v11;
  v88 = v52;
  v56 = v7;
  v89 = v56;
  v91 = v94;
  v93 = v16;
  v92 = &v96;
  v57 = (void *)MEMORY[0x1D1796244](v83);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v19 = v6;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v80 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1E0D71860];
        objc_msgSend(v23, "clsHorizontalAccuracy", v50, v51, v52, v53);
        if (objc_msgSend(v24, "horizontalAccuracyIsCoarse:"))
          v25 = v18;
        else
          v25 = v17;
        objc_msgSend(v25, "addObject:", v23);
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v79, v111, 16);
    }
    while (v20);
  }

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  obj = self->_queryPerformers;
  v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v110, 16);
  if (v26)
  {
    v27 = *(_QWORD *)v76;
    while (2)
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v76 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
        v30 = objc_msgSend((id)objc_opt_class(), "numberOfRegionsPerBatch");
        objc_msgSend(v29, "setLoggingConnection:", self->_loggingConnection);
        v31 = v29;
        objc_sync_enter(v31);
        v109 = 0;
        buf = 0u;
        v108 = 0u;
        if (v31)
          objc_msgSend(v31, "statistics");
        *(_QWORD *)&buf = objc_msgSend(v19, "count", v50);
        v74 = v109;
        v73[0] = buf;
        v73[1] = v108;
        objc_msgSend(v31, "setStatistics:", v73);
        objc_sync_exit(v31);

        v32 = self->_loggingConnection;
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_4;
        v64[3] = &unk_1E84F7818;
        v33 = v32;
        v65 = v33;
        v66 = v31;
        v71 = v30;
        v67 = v57;
        v69 = &v102;
        v68 = v56;
        v70 = v94;
        v72 = v16;
        v34 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D1796244](v64);
        ((void (**)(_QWORD, void *, const __CFString *))v34)[2](v34, v17, CFSTR("precise"));
        v35 = atomic_load(v103 + 24);
        if ((v35 & 1) != 0
          || (((void (**)(_QWORD, void *, const __CFString *))v34)[2](v34, v18, CFSTR("coarse")),
              v36 = atomic_load(v103 + 24),
              (v36 & 1) != 0))
        {

          goto LABEL_24;
        }
        dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);

      }
      v26 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v75, v110, 16);
      if (v26)
        continue;
      break;
    }
  }
LABEL_24:

  v37 = atomic_load(v103 + 24);
  if ((v37 & 1) != 0)
  {
    v38 = v53;
    objc_sync_enter(v38);
    v39 = (void *)objc_msgSend(v38, "copy");
    objc_sync_exit(v38);

    objc_msgSend(v39, "enumerateObjectsUsingBlock:", &__block_literal_global_1119);
    if (v50)
      *v50 = objc_retainAutorelease((id)v97[5]);

  }
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v40 = v52;
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v106, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v61;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v61 != v42)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * k), "cancel", v50);
      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v60, v106, 16);
    }
    while (v41);
  }

  -[CLSRegionItemCacheUpdater loggingConnection](self, "loggingConnection");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    queryPerformers = self->_queryPerformers;
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2_149;
    v59[3] = &unk_1E84F7880;
    v59[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](queryPerformers, "enumerateObjectsUsingBlock:", v59);
  }
  v46 = CFAbsoluteTimeGetCurrent();
  -[CLSRegionItemCacheUpdater loggingConnection](self, "loggingConnection");
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v46 - Current;
    _os_log_impl(&dword_1CAB79000, v47, OS_LOG_TYPE_INFO, "[GEO] Location Cache Creation took %.2f s", (uint8_t *)&buf, 0xCu);
  }

  v48 = v97[5] == 0;
  _Block_object_dispose(v94, 8);
  _Block_object_dispose(&v96, 8);

  _Block_object_dispose(&v102, 8);
  return v48;
}

- (OS_os_log)loggingConnection
{
  return self->_loggingConnection;
}

- (void)setLoggingConnection:(id)a3
{
  objc_storeStrong((id *)&self->_loggingConnection, a3);
}

- (BOOL)isSimulatingTimeout
{
  return self->_simulatesTimeout;
}

- (void)setSimulatesTimeout:(BOOL)a3
{
  self->_simulatesTimeout = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (void)setNumberOfRetries:(unint64_t)a3
{
  self->_numberOfRetries = a3;
}

- (NSArray)queryPerformers
{
  return self->_queryPerformers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryPerformers, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unsigned __int8 v7;
  void *v8;
  id v9;
  void *v10;
  CLSQueryHandler *v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  CFAbsoluteTime Current;
  id v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, char, uint64_t, void *);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32[2];
  id location;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  int v38;

  v5 = a2;
  v6 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 40), 0xFFFFFFFFFFFFFFFFLL);
  v7 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
  if ((v7 & 1) != 0)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "queryWithTemplate:forRegions:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLoggingConnection:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
    v9 = *(id *)(a1 + 56);
    objc_sync_enter(v9);
    objc_msgSend(*(id *)(a1 + 64), "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 64), "removeLastObject");
    objc_sync_exit(v9);

    v11 = -[CLSQueryHandler initWithQueryPerformer:geoServiceThread:loggingConnection:]([CLSQueryHandler alloc], "initWithQueryPerformer:geoServiceThread:loggingConnection:", v8, v10, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
    -[CLSQueryHandler setSimulatesTimeout:](v11, "setSimulatesTimeout:", objc_msgSend(*(id *)(a1 + 48), "isSimulatingTimeout"));
    objc_msgSend(*(id *)(a1 + 48), "timeoutInterval");
    -[CLSQueryHandler setTimeoutInterval:](v11, "setTimeoutInterval:");
    -[CLSQueryHandler setNumberOfRetries:](v11, "setNumberOfRetries:", objc_msgSend(*(id *)(a1 + 48), "numberOfRetries"));
    v12 = *(void **)(a1 + 72);
    v13 = MEMORY[0x1E0C809B0];
    if (v12)
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2;
      v34[3] = &unk_1E84F7778;
      v36 = *(_QWORD *)(a1 + 88);
      v38 = *(_DWORD *)(a1 + 104);
      v14 = v12;
      v15 = *(_QWORD *)(a1 + 80);
      v35 = v14;
      v37 = v15;
      -[CLSQueryHandler setProgressBlock:](v11, "setProgressBlock:", v34);

    }
    Current = CFAbsoluteTimeGetCurrent();
    objc_initWeak(&location, v11);
    v21 = v13;
    v22 = 3221225472;
    v23 = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_3;
    v24 = &unk_1E84F77A0;
    objc_copyWeak(v32, &location);
    v25 = *(id *)(a1 + 56);
    v26 = *(id *)(a1 + 64);
    v17 = v5;
    v18 = *(_QWORD *)(a1 + 80);
    v27 = v17;
    v19 = *(_QWORD *)(a1 + 96);
    v30 = v18;
    v31 = v19;
    v32[1] = *(id *)&Current;
    v28 = *(id *)(a1 + 40);
    v29 = *(id *)(a1 + 32);
    -[CLSQueryHandler setCompletionBlock:](v11, "setCompletionBlock:", &v21);
    v20 = *(id *)(a1 + 56);
    objc_sync_enter(v20);
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v11, v21, v22, v23, v24);
    objc_sync_exit(v20);

    -[CLSQueryHandler cacheItems](v11, "cacheItems");
    objc_destroyWeak(v32);
    objc_destroyWeak(&location);

  }
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  id v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    *(_DWORD *)buf = 67109634;
    v28 = objc_msgSend(v5, "count");
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = objc_opt_class();
    _os_log_impl(&dword_1CAB79000, v11, OS_LOG_TYPE_DEFAULT, "[CLSRegionItemCacheUpdater] Starting to process %d %@ regions with %@", buf, 0x1Cu);

    v10 = *(NSObject **)(a1 + 32);
  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_137;
  v17[3] = &unk_1E84F77F0;
  v17[4] = *(_QWORD *)(a1 + 40);
  v18 = v8;
  v25 = *(_QWORD *)(a1 + 80);
  v19 = v9;
  v20 = v7;
  v21 = v10;
  v22 = *(id *)(a1 + 48);
  v16 = *(_OWORD *)(a1 + 56);
  v12 = (id)v16;
  v23 = v16;
  v24 = *(_QWORD *)(a1 + 72);
  v26 = *(_DWORD *)(a1 + 88);
  v13 = v7;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);

}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2_149(uint64_t a1, void *a2)
{
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v3, "statistics");
    v7 = *((_QWORD *)&v13 + 1);
    v6 = v13;
    v9 = *((_QWORD *)&v14 + 1);
    v8 = v14;
    v10 = v15;
  }
  else
  {
    v10 = 0;
    v9 = 0;
    v7 = 0;
    v8 = 0;
    v6 = 0;
    v15 = 0;
    v13 = 0u;
    v14 = 0u;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[GEO] %@ | [Locations]: %lu | [Cached Locations]: %lu | [Resolved Locations]: %lu | [Requests]: %lu | [Batch Size]: %lu"), v5, v6, v8, v7, v9, v10, v13, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v11;
    _os_log_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
  }

}

uint64_t __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_147(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cancel");
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_137(uint64_t a1, void *a2, uint64_t a3, uint8_t *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  mach_timebase_info v19;
  NSObject *v20;
  NSObject *v21;
  int v22;
  NSObject *v23;
  void *v24;
  unsigned __int8 v25;
  int v26;
  float v27;
  uint8_t v28;
  unsigned int *v29;
  unsigned int v30;
  uint64_t v31;
  mach_timebase_info info;
  _OWORD v33[2];
  uint64_t v34;
  uint8_t buf[32];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = (void *)MEMORY[0x1D1796094]();
  if (!objc_msgSend(*(id *)(a1 + 32), "shouldQueryItemsForRegion:selectedRegions:", v6, *(_QWORD *)(a1 + 40)))
  {
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    v36 = 0;
    memset(buf, 0, sizeof(buf));
    v9 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v9, "statistics");
      v9 = *(void **)(a1 + 32);
      v10 = *(_QWORD *)&buf[16] + 1;
    }
    else
    {
      v10 = 1;
    }
    *(_QWORD *)&buf[16] = v10;
    v34 = v36;
    v33[0] = *(_OWORD *)buf;
    v33[1] = *(_OWORD *)&buf[16];
    objc_msgSend(v9, "setStatistics:", v33);
    objc_sync_exit(v8);

LABEL_8:
    if (*(id *)(a1 + 56) != v6 || !objc_msgSend(*(id *)(a1 + 48), "count"))
      goto LABEL_19;
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") < *(_QWORD *)(a1 + 104))
    goto LABEL_8;
LABEL_10:
  v11 = *(id *)(a1 + 64);
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAB79000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CLSRegionItemCacheUpdater", (const char *)&unk_1CABE99BA, buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v31 = mach_absolute_time();
  v15 = *(_QWORD *)(a1 + 72);
  v16 = *(_QWORD *)(a1 + 32);
  v17 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
  (*(void (**)(uint64_t, uint64_t, void *))(v15 + 16))(v15, v16, v17);

  v18 = mach_absolute_time();
  v19 = info;
  v20 = v14;
  v21 = v20;
  if (v12 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v20))
  {
    v22 = objc_msgSend(*(id *)(a1 + 48), "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v22;
    _os_signpost_emit_with_name_impl(&dword_1CAB79000, v21, OS_SIGNPOST_INTERVAL_END, v12, "CLSRegionItemCacheUpdater", "Processed batch of %d regions", buf, 8u);
  }

  v23 = v21;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Processed batch of %d regions"), objc_msgSend(*(id *)(a1 + 48), "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "CLSRegionItemCacheUpdater";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2048;
    *(double *)&buf[24] = (float)((float)((float)((float)(v18 - v31) * (float)v19.numer) / (float)v19.denom) / 1000000.0);
    _os_log_impl(&dword_1CAB79000, v23, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 48), "removeAllObjects");
  v25 = atomic_load((unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
  *a4 = v25 & 1;

LABEL_19:
  if (*(_QWORD *)(a1 + 80))
  {
    v26 = atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24));
    v27 = *(float *)(a1 + 112);
    buf[0] = 0;
    (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))((float)((float)v26 / v27));
    v28 = buf[0];
    atomic_store(buf[0], (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24));
    *a4 = v28;
  }
  v29 = (unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
  do
    v30 = __ldaxr(v29);
  while (__stlxr(v30 + 1, v29));
  objc_autoreleasePoolPop(v7);

}

uint64_t __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_2(uint64_t a1, unsigned __int8 *a2)
{
  int v4;
  float v5;
  uint64_t result;
  unsigned __int8 v7;
  unsigned __int8 v8;

  v4 = atomic_load((unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  v5 = *(float *)(a1 + 56);
  v8 = 0;
  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))((float)((float)v4 / v5));
  v7 = v8;
  atomic_store(v8, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  *a2 = v7;
  return result;
}

void __71__CLSRegionItemCacheUpdater_createCacheForRegions_progressBlock_error___block_invoke_3(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v8;
  id WeakRetained;
  id v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 v19;
  double Current;
  void *v21;
  void *v22;
  _OWORD v23[2];
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    v10 = *(id *)(a1 + 32);
    objc_sync_enter(v10);
    v11 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", WeakRetained);
    objc_sync_exit(v10);

    if (v11)
    {
      v12 = *(id *)(a1 + 32);
      objc_sync_enter(v12);
      objc_msgSend(*(id *)(a1 + 32), "removeObject:", WeakRetained);
      v13 = *(void **)(a1 + 40);
      objc_msgSend(WeakRetained, "geoServiceThread");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v14);

      objc_sync_exit(v12);
      v15 = *(id *)(a1 + 48);
      objc_sync_enter(v15);
      v27 = 0;
      v25 = 0u;
      v26 = 0u;
      v16 = *(void **)(a1 + 48);
      if (v16)
      {
        objc_msgSend(v16, "statistics");
        v17 = *((_QWORD *)&v25 + 1);
        v16 = *(void **)(a1 + 48);
        v18 = *((_QWORD *)&v26 + 1) + 1;
      }
      else
      {
        v17 = 0;
        v18 = 1;
      }
      *((_QWORD *)&v25 + 1) = v17 + a3;
      *((_QWORD *)&v26 + 1) = v18;
      v24 = v27;
      v23[0] = v25;
      v23[1] = v26;
      objc_msgSend(v16, "setStatistics:", v23);
      objc_sync_exit(v15);

      v19 = a2 ^ 1;
      atomic_store(v19, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), a4);
      Current = CFAbsoluteTimeGetCurrent();
      if ((v19 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "logGeoLookupFailureResult", Current);
      }
      else
      {
        v21 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", Current - *(double *)(a1 + 96));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logGeoLookupCounterAndDurationWithLookupDuration:", v22);

      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 64));

}

+ (id)businessItemsForRegion:(id)a3 poiCache:(id)a4
{
  return +[CLSNewLocationInformant businessItemsForRegion:poiCache:](CLSNewLocationInformant, "businessItemsForRegion:poiCache:", a3, a4);
}

@end
