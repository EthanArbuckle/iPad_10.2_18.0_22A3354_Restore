@implementation CUIKEventLoader

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CUIKEventLoader)initWithEventStore:(id)a3
{
  id v5;
  CUIKEventLoader *v6;
  CUIKEventLoader *v7;
  void *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *occurrencesLock;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *loadQueue;
  dispatch_group_t v15;
  OS_dispatch_group *loadGroup;
  NSMutableSet *v17;
  NSMutableSet *occurrencesAwaitingRefresh;
  NSMutableSet *v19;
  NSMutableSet *occurrencesAwaitingDeletion;
  int64x2_t v21;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CUIKEventLoader;
  v6 = -[CUIKEventLoader init](&v23, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel__eventStoreChanged_, *MEMORY[0x1E0CA9F88], v7->_store);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.mobilecal.CalendarEventLoader.occurrencesLock", v9);
    occurrencesLock = v7->_occurrencesLock;
    v7->_occurrencesLock = (OS_dispatch_queue *)v10;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("com.apple.mobilecal.CalendarEventLoader.loadQueue", v12);
    loadQueue = v7->_loadQueue;
    v7->_loadQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_group_create();
    loadGroup = v7->_loadGroup;
    v7->_loadGroup = (OS_dispatch_group *)v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    occurrencesAwaitingRefresh = v7->_occurrencesAwaitingRefresh;
    v7->_occurrencesAwaitingRefresh = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    occurrencesAwaitingDeletion = v7->_occurrencesAwaitingDeletion;
    v7->_occurrencesAwaitingDeletion = v19;

    v7->_selectedCalendarsLock._os_unfair_lock_opaque = 0;
    v21 = vdupq_n_s64(0x7FF0000000000000uLL);
    *(int64x2_t *)&v7->_lastRequestedStart = v21;
    *(int64x2_t *)&v7->_loadedStart = v21;
    *(int64x2_t *)&v7->_currentlyLoadingStart = v21;
    v7->_currentGeneration = 1;
    *(_QWORD *)&v7->_daysOfPadding = 0xFFFFFFFF00000000;
    *(int64x2_t *)&v7->_preferredReloadStart = v21;
    v7->_allowEventLocationPrediction = 1;
  }

  return v7;
}

- (void)setPreferredReloadStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  else
    v7 = INFINITY;
  self->_preferredReloadStart = v7;
  if (v6)
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  else
    v8 = INFINITY;
  self->_preferredReloadEnd = v8;

}

uint64_t __26__CUIKEventLoader__reload__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "cancelAllLoads");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 160) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0x7FF0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = 0x7FF0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0x7FF0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0x7FF0000000000000;
  return result;
}

- (void)cancelAllLoads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, v0, v1, "EventLoader: Canceling all loads", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2_cold_1();

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0x7FF0000000000000;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = 0x7FF0000000000000;
}

void __51__CUIKEventLoader_setAllowEventLocationPrediction___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "setLocationPredictionAllowed:", objc_msgSend(*(id *)(a1 + 32), "allowEventLocationPrediction", (_QWORD)v7));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)allowEventLocationPrediction
{
  return self->_allowEventLocationPrediction;
}

- (BOOL)setSelectedCalendars:(id)a3
{
  id v4;
  char v5;
  NSSet *v6;
  NSSet *selectedCalendars;

  v4 = a3;
  os_unfair_lock_lock(&self->_selectedCalendarsLock);
  self->_selectedCalendarsWereSet = 1;
  v5 = objc_msgSend(v4, "isEqualToSet:", self->_selectedCalendars);
  if ((v5 & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_selectedCalendarsLock);
  }
  else
  {
    v6 = (NSSet *)objc_msgSend(v4, "copy");
    selectedCalendars = self->_selectedCalendars;
    self->_selectedCalendars = v6;

    os_unfair_lock_unlock(&self->_selectedCalendarsLock);
    -[CUIKEventLoader _reload](self, "_reload");
  }

  return v5 ^ 1;
}

- (void)_reload
{
  NSObject *occurrencesLock;
  _QWORD block[5];

  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CUIKEventLoader__reload__block_invoke;
  block[3] = &unk_1E6EB60F8;
  block[4] = self;
  dispatch_sync(occurrencesLock, block);
  -[CUIKEventLoader loadIfNeeded](self, "loadIfNeeded");
}

- (void)loadIfNeeded
{
  double preferredReloadStart;
  double preferredReloadEnd;
  double v6;
  double v7;

  preferredReloadStart = self->_preferredReloadStart;
  if (preferredReloadStart == INFINITY)
    preferredReloadStart = self->_lastRequestedStart;
  preferredReloadEnd = self->_preferredReloadEnd;
  if (preferredReloadEnd == INFINITY)
    preferredReloadEnd = self->_lastRequestedEnd;
  if (preferredReloadStart != INFINITY && preferredReloadEnd != INFINITY)
  {
    v6 = 0.0;
    v7 = 0.0;
    -[CUIKEventLoader _getStart:end:expandedToComponents:withResultStart:resultEnd:](self, "_getStart:end:expandedToComponents:withResultStart:resultEnd:", self->_componentForExpandingRequests, &v7, &v6);
    -[CUIKEventLoader _loadIfNeededBetweenStart:end:loadPaddingNow:](self, "_loadIfNeededBetweenStart:end:loadPaddingNow:", 0, v7, v6);
  }
}

- (void)setCacheLimit:(unsigned int)a3
{
  uint64_t v3;
  unsigned int *p_daysOfPadding;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int maxDaysToCache;

  v3 = *(_QWORD *)&a3;
  p_daysOfPadding = &self->_daysOfPadding;
  if (self->_daysOfPadding > a3)
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CUIKEventLoader setCacheLimit:].cold.2(v3, p_daysOfPadding, v6);

    *p_daysOfPadding = v3;
  }
  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[CUIKEventLoader setCacheLimit:].cold.1(v3, v7, v8, v9, v10, v11, v12, v13);

  maxDaysToCache = self->_maxDaysToCache;
  if (maxDaysToCache != (_DWORD)v3)
  {
    self->_maxDaysToCache = v3;
    if (maxDaysToCache > v3)
      -[CUIKEventLoader _pruneLoadedOccurrences](self, "_pruneLoadedOccurrences");
  }
}

- (void)_pruneLoadedOccurrences
{
  NSObject *occurrencesLock;
  _QWORD block[5];

  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke;
  block[3] = &unk_1E6EB60F8;
  block[4] = self;
  dispatch_sync(occurrencesLock, block);
}

- (id)occurrencesForStartDate:(id)a3 endDate:(id)a4 preSorted:(BOOL)a5 waitForLoad:(BOOL)a6 isComplete:(BOOL *)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *occurrencesLock;
  double v24;
  BOOL v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  uint64_t v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t j;
  void *v63;
  void *v64;
  NSObject *v65;
  CUIKOccurrencesCollection *v66;
  CUIKOccurrencesCollection *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  const __CFString *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  void *v96;
  _BOOL4 v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  _QWORD block[12];
  uint64_t v116;
  double *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  double *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  uint64_t *v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  double v146;
  double v147;
  uint8_t v148[4];
  uint64_t v149;
  __int16 v150;
  id v151;
  __int16 v152;
  uint64_t v153;
  __int16 v154;
  uint64_t v155;
  _BYTE v156[128];
  _BYTE v157[128];
  uint8_t v158[128];
  _BYTE buf[24];
  uint64_t (*v160)(uint64_t, uint64_t);
  void (*v161)(uint64_t);
  id v162;
  uint64_t v163;

  v8 = a6;
  v97 = a5;
  v163 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v99 = v12;
  v100 = v11;
  if (!v11)
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:].cold.3();
    goto LABEL_7;
  }
  if (!v12)
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:].cold.4();
LABEL_7:

  }
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v15 = v14;
  objc_msgSend(v99, "timeIntervalSinceReferenceDate");
  v17 = v16;
  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:].cold.2(v18, v15, v17);

  v19 = v17 - v15;
  if (v17 - v15 > (double)(86400 * self->_maxDaysToCache))
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[CUIKEventLoader occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:].cold.1(&self->_maxDaysToCache, (int)(v19 / 86400.0), v20);

    -[CUIKEventLoader setCacheLimit:](self, "setCacheLimit:", (int)(v19 / 86400.0));
  }
  self->_lastRequestedStart = v15;
  self->_lastRequestedEnd = v17;
  v147 = 0.0;
  v146 = 0.0;
  -[CUIKEventLoader _getStart:end:expandedToComponents:withResultStart:resultEnd:](self, "_getStart:end:expandedToComponents:withResultStart:resultEnd:", self->_componentForExpandingRequests, &v147, &v146, v15, v17);
  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    __GetDateFormatter();
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v15);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "stringFromDate:", v70);
    v102 = (void *)objc_claimAutoreleasedReturnValue();
    __GetDateFormatter();
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "stringFromDate:", v72);
    v73 = objc_claimAutoreleasedReturnValue();
    v74 = (void *)v73;
    v75 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v102;
    *(_WORD *)&buf[12] = 2112;
    if (v8)
      v75 = CFSTR("YES");
    *(_QWORD *)&buf[14] = v73;
    *(_WORD *)&buf[22] = 2112;
    v160 = (uint64_t (*)(uint64_t, uint64_t))v75;
    _os_log_debug_impl(&dword_1B8A6A000, v21, OS_LOG_TYPE_DEBUG, "EventLoader: Kicking off load with start: %@, end: %@, waitForLoad: %@", buf, 0x20u);

  }
  -[CUIKEventLoader _loadIfNeededBetweenStart:end:loadPaddingNow:](self, "_loadIfNeededBetweenStart:end:loadPaddingNow:", 0, v147, v146);
  if (v8)
    -[CUIKEventLoader _waitForBackgroundLoad](self, "_waitForBackgroundLoad");
  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v160 = __Block_byref_object_copy__8;
  v161 = __Block_byref_object_dispose__8;
  v162 = 0;
  v140 = 0;
  v141 = &v140;
  v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__8;
  v144 = __Block_byref_object_dispose__8;
  v145 = 0;
  v134 = 0;
  v135 = &v134;
  v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__8;
  v138 = __Block_byref_object_dispose__8;
  v139 = 0;
  v128 = 0;
  v129 = &v128;
  v130 = 0x3032000000;
  v131 = __Block_byref_object_copy__8;
  v132 = __Block_byref_object_dispose__8;
  v133 = 0;
  v124 = 0;
  v125 = &v124;
  v126 = 0x2020000000;
  v127 = 0;
  v120 = 0;
  v121 = (double *)&v120;
  v122 = 0x2020000000;
  v123 = 0;
  v116 = 0;
  v117 = (double *)&v116;
  v118 = 0x2020000000;
  v119 = 0;
  occurrencesLock = self->_occurrencesLock;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__CUIKEventLoader_occurrencesForStartDate_endDate_preSorted_waitForLoad_isComplete___block_invoke;
  block[3] = &unk_1E6EB7030;
  block[4] = self;
  block[5] = buf;
  block[6] = &v140;
  block[7] = &v134;
  block[8] = &v128;
  block[9] = &v124;
  block[10] = &v120;
  block[11] = &v116;
  dispatch_sync(occurrencesLock, block);
  if (a7)
  {
    v24 = v121[3];
    if (v24 == INFINITY)
    {
      v25 = 1;
    }
    else
    {
      v26 = v117[3];
      v25 = v26 == INFINITY;
      if (v15 < v24)
        v25 = 1;
      if (v15 > v26)
        v25 = 1;
      if (v17 > v26)
        v25 = 1;
    }
    *a7 = !v25;
  }
  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    v76 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    __GetDateFormatter();
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v15);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "stringFromDate:", v78);
    v79 = (id)objc_claimAutoreleasedReturnValue();
    __GetDateFormatter();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "stringFromDate:", v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v148 = 134218498;
    v149 = v76;
    v150 = 2112;
    v151 = v79;
    v152 = 2112;
    v153 = (uint64_t)v82;
    _os_log_debug_impl(&dword_1B8A6A000, v27, OS_LOG_TYPE_DEBUG, "EventLoader: Loaded %ld occurrences for start: %@, end: %@", v148, 0x20u);

  }
  v28 = (void *)objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "mutableCopy");
  v29 = (void *)objc_msgSend((id)v141[5], "mutableCopy");
  if (objc_msgSend((id)v135[5], "count") || objc_msgSend((id)v129[5], "count"))
  {
    if (objc_msgSend((id)v135[5], "count"))
    {
      objc_msgSend(v28, "unionSet:", v135[5]);
      objc_msgSend(v29, "unionSet:", v135[5]);
    }
    if (objc_msgSend((id)v129[5], "count"))
    {
      objc_msgSend(v28, "minusSet:", v129[5]);
      objc_msgSend(v29, "minusSet:", v129[5]);
    }
  }
  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    v94 = objc_msgSend(v28, "count");
    __GetDateFormatter();
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v15);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "stringFromDate:", v95);
    v84 = (id)objc_claimAutoreleasedReturnValue();
    __GetDateFormatter();
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17);
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "stringFromDate:", v86);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v148 = 134218498;
    v149 = v94;
    v150 = 2112;
    v151 = v84;
    v152 = 2112;
    v153 = (uint64_t)v87;
    _os_log_debug_impl(&dword_1B8A6A000, v30, OS_LOG_TYPE_DEBUG, "EventLoader: %ld occurrences after refresh/delete filtering for start: %@, end: %@", v148, 0x20u);

  }
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v31 = (void *)objc_msgSend(v28, "copy");
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v111, v158, 16);
  if (v32)
  {
    v33 = *(_QWORD *)v112;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v112 != v33)
          objc_enumerationMutation(v31);
        v35 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
        objc_msgSend(v35, "startCalendarDate", v94);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "absoluteTime");
        v38 = v37;

        if (v38 >= v15)
        {
          v42 = v29;
          if (v38 < v17)
            goto LABEL_47;
LABEL_46:
          v42 = v28;
          goto LABEL_47;
        }
        objc_msgSend(v35, "endCalendarDate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "absoluteTime");
        v41 = v40;

        v42 = v29;
        if (v41 <= v15)
          goto LABEL_46;
LABEL_47:
        objc_msgSend(v42, "removeObject:", v35);
      }
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v111, v158, 16);
    }
    while (v32);
  }

  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v43 = (void *)objc_msgSend(v29, "copy");
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v107, v157, 16);
  if (!v44)
    goto LABEL_64;
  v45 = *(_QWORD *)v108;
  do
  {
    v46 = 0;
    do
    {
      if (*(_QWORD *)v108 != v45)
        objc_enumerationMutation(v43);
      v47 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * v46);
      objc_msgSend(v47, "startCalendarDate", v94);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "absoluteTime");
      v50 = v49;

      if (objc_msgSend(v47, "status") == 3)
      {
LABEL_55:
        objc_msgSend(v29, "removeObject:", v47);
        goto LABEL_56;
      }
      if (v50 >= v15)
      {
        if (v50 >= v17)
          goto LABEL_55;
      }
      else
      {
        objc_msgSend(v47, "endDateUnadjustedForLegacyClients");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "startDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "timeIntervalSinceDate:", v52);
        v54 = v53;

        if (v50 + v54 <= v15)
          goto LABEL_55;
      }
LABEL_56:
      ++v46;
    }
    while (v44 != v46);
    v55 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v107, v157, 16);
    v44 = v55;
  }
  while (v55);
LABEL_64:

  objc_msgSend(v28, "unionSet:", v29);
  objc_msgSend(v28, "allObjects");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v56;
  if (v97)
  {
    objc_msgSend(v56, "sortedArrayUsingFunction:context:", CUIKCompareEKEvents, 0);
    v58 = objc_claimAutoreleasedReturnValue();

    v57 = (void *)v58;
  }
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  v59 = v57;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v156, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v60; ++j)
      {
        if (*(_QWORD *)v104 != v61)
          objc_enumerationMutation(v59);
        v63 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        if (objc_msgSend(v63, "isAllDay", v94))
          v64 = v101;
        else
          v64 = v22;
        objc_msgSend(v64, "addObject:", v63);
      }
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v103, v156, 16);
    }
    while (v60);
  }

  +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
  v65 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
  {
    __GetDateFormatter();
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v15);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "stringFromDate:", v98);
    v89 = (id)objc_claimAutoreleasedReturnValue();
    __GetDateFormatter();
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v17);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "stringFromDate:", v90);
    v91 = (id)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v101, "count");
    v93 = objc_msgSend(v22, "count");
    *(_DWORD *)v148 = 138413058;
    v149 = (uint64_t)v89;
    v150 = 2112;
    v151 = v91;
    v152 = 2048;
    v153 = v92;
    v154 = 2048;
    v155 = v93;
    _os_log_debug_impl(&dword_1B8A6A000, v65, OS_LOG_TYPE_DEBUG, "EventLoader: Final occurrence counts after all filtering for start: %@, end: %@, allDayCount: %ld, timedCount: %ld", v148, 0x2Au);

  }
  v66 = [CUIKOccurrencesCollection alloc];
  v67 = -[CUIKOccurrencesCollection initWithOccurrences:timedOccurrences:allDayOccurrences:generation:](v66, "initWithOccurrences:timedOccurrences:allDayOccurrences:generation:", v59, v22, v101, *((unsigned int *)v125 + 6));

  _Block_object_dispose(&v116, 8);
  _Block_object_dispose(&v120, 8);
  _Block_object_dispose(&v124, 8);
  _Block_object_dispose(&v128, 8);

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);

  _Block_object_dispose(buf, 8);
  return v67;
}

- (void)_getStart:(double)a3 end:(double)a4 expandedToComponents:(unint64_t)a5 withResultStart:(double *)a6 resultEnd:(double *)a7
{
  __int16 v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;

  if (a5)
  {
    v11 = a5;
    v13 = (void *)MEMORY[0x1E0D0C420];
    -[EKEventStore timeZone](self->_store, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "calendarDateWithAbsoluteTime:timeZone:", v14, a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)MEMORY[0x1E0D0C420];
    -[EKEventStore timeZone](self->_store, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "calendarDateWithAbsoluteTime:timeZone:", v17, a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v11 & 0x10) == 0)
    {
      if ((v11 & 0x1000) == 0)
      {
        if ((v11 & 8) == 0)
        {
          v19 = v15;
          v20 = v18;
LABEL_9:
          v21 = v20;
LABEL_10:
          objc_msgSend(v19, "absoluteTime");
          a3 = v22;
          objc_msgSend(v21, "absoluteTime");
          a4 = v23;

          goto LABEL_11;
        }
        if (objc_msgSend(v18, "differenceInDays:", v15) < 7)
        {
          objc_msgSend(v15, "calendarDateForMonth");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart());
          v19 = (id)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v18, "calendarDateForEndOfMonth");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "calendarDateForEndOfWeekWithWeekStart:", CUIKOneIndexedWeekStart());
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_10;
        }
      }
      objc_msgSend(v15, "calendarDateForWeekWithWeekStart:", CUIKOneIndexedWeekStart());
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "calendarDateForEndOfWeekWithWeekStart:", CUIKOneIndexedWeekStart());
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    objc_msgSend(v15, "calendarDateForDay");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "calendarDateForEndOfDay");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
LABEL_11:
  if (a6)
    *a6 = a3;
  if (a7)
    *a7 = a4;
}

- (void)_waitForBackgroundLoad
{
  NSObject *loadGroup;
  dispatch_time_t v3;

  loadGroup = self->_loadGroup;
  v3 = dispatch_time(0, 700000000);
  dispatch_group_wait(loadGroup, v3);
}

- (void)_loadIfNeededBetweenStart:(double)a3 end:(double)a4 loadPaddingNow:(BOOL)a5
{
  _BOOL4 v5;
  NSObject *occurrencesLock;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t maxDaysToCache;
  void *v14;
  double v15;
  uint64_t daysOfPadding;
  void *v17;
  double v18;
  _BOOL4 v19;
  unint64_t componentForExpandingPadding;
  double v21;
  dispatch_time_t v22;
  _QWORD v23[7];
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD block[9];
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;

  v5 = a5;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0;
  v37 = 0;
  v38 = (double *)&v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x2020000000;
  v32 = 0;
  occurrencesLock = self->_occurrencesLock;
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke;
  block[3] = &unk_1E6EB7058;
  block[4] = self;
  block[5] = &v41;
  block[6] = &v37;
  block[7] = &v33;
  block[8] = &v29;
  dispatch_sync(occurrencesLock, block);
  v26 = 0.0;
  v27 = 0.0;
  -[CUIKEventLoader _getLoadStart:end:fromLoadedStart:loadedEnd:currentlyLoadingStart:currentlyLoadingEnd:](self, "_getLoadStart:end:fromLoadedStart:loadedEnd:currentlyLoadingStart:currentlyLoadingEnd:", &v27, &v26, v42[3], v38[3], v34[3], v30[3]);
  if (v42[3] != INFINITY || v34[3] != INFINITY)
  {
    v24 = 0.0;
    v25 = 0.0;
    v12 = v26;
    v11 = v27;
    maxDaysToCache = self->_maxDaysToCache;
    -[EKEventStore timeZone](self->_store, "timeZone");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUIKEventLoader _getStart:end:paddedByDays:inTimeZone:resultStart:resultEnd:](self, "_getStart:end:paddedByDays:inTimeZone:resultStart:resultEnd:", maxDaysToCache, v14, &v25, &v24, v11, v12);

    v15 = v25;
    if (v25 > a3 || (v15 = v24, v24 < a4))
    {
      -[CUIKEventLoader _reload](self, "_reload", v15);
      goto LABEL_35;
    }
  }
  v24 = 0.0;
  v25 = 0.0;
  daysOfPadding = self->_daysOfPadding;
  -[EKEventStore timeZone](self->_store, "timeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKEventLoader _getStart:end:paddedByDays:inTimeZone:resultStart:resultEnd:](self, "_getStart:end:paddedByDays:inTimeZone:resultStart:resultEnd:", daysOfPadding, v17, &v25, &v24, a3, a4);

  -[CUIKEventLoader _getStart:end:expandedToComponents:withResultStart:resultEnd:](self, "_getStart:end:expandedToComponents:withResultStart:resultEnd:", self->_componentForExpandingPadding, &v25, &v24, v25, v24);
  if (v42[3] != INFINITY || v34[3] != INFINITY)
  {
    v18 = v26;
    if (v26 < a4)
    {
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", v26 + 1.0, a4);
      v18 = v26;
    }
    if (v18 <= a4)
      v18 = a4;
    if (v24 > v18)
    {
      if (self->_daysOfPadding)
      {
        if (!v5)
        {
          v19 = 1;
LABEL_24:
          v21 = v27;
          if (v27 > a3)
          {
            -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", a3, v27 + -1.0);
            v21 = v27;
          }
          if (v21 > a3)
            v21 = a3;
          if (v25 < v21 && (self->_daysOfPadding || self->_componentForExpandingPadding))
          {
            if (!v5)
              goto LABEL_34;
            -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", v25, v21 + -1.0);
          }
          if (!v19)
            goto LABEL_35;
LABEL_34:
          v22 = dispatch_time(0, 300000000);
          v23[0] = v10;
          v23[1] = 3221225472;
          v23[2] = __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke_2;
          v23[3] = &unk_1E6EB7080;
          v23[4] = self;
          *(double *)&v23[5] = a3;
          *(double *)&v23[6] = a4;
          dispatch_after(v22, MEMORY[0x1E0C80D38], v23);
          goto LABEL_35;
        }
      }
      else
      {
        componentForExpandingPadding = self->_componentForExpandingPadding;
        v19 = componentForExpandingPadding != 0;
        if (!componentForExpandingPadding || !v5)
          goto LABEL_24;
      }
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", v18 + 1.0, v24);
    }
    v19 = 0;
    goto LABEL_24;
  }
  -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", a3, a4);
  if (self->_daysOfPadding || self->_componentForExpandingPadding)
  {
    if (v5)
    {
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", a4 + 1.0, v24);
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:](self, "_enqueueLoadForRangeStart:end:", v25, a3 + -1.0);
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_35:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
}

- (void)_getLoadStart:(double *)a3 end:(double *)a4 fromLoadedStart:(double)a5 loadedEnd:(double)a6 currentlyLoadingStart:(double)a7 currentlyLoadingEnd:(double)a8
{
  if (a5 == INFINITY)
  {
LABEL_4:
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  if (a7 == INFINITY)
  {
    a8 = a6;
    a7 = a5;
    goto LABEL_4;
  }
  if (a7 >= a5)
    a7 = a5;
  if (a8 < a6)
    a8 = a6;
  if (a3)
LABEL_5:
    *a3 = a7;
LABEL_6:
  if (a4)
    *a4 = a8;
}

- (void)_enqueueLoadForRangeStart:(double)a3 end:(double)a4
{
  NSUInteger v7;
  BOOL v8;
  NSObject *v9;
  BOOL v10;
  EKEventStore *store;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *occurrencesLock;
  uint64_t v18;
  int cancelSeed;
  NSObject *loadGroup;
  NSObject *loadQueue;
  NSObject *v22;
  NSObject *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  id v26;
  double v27;
  double v28;
  int v29;
  BOOL v30;
  BOOL v31;
  _QWORD block[9];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;

  if (a3 >= a4)
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:].cold.2(v9, a3, a4);
  }
  else
  {
    if (_enqueueLoadForRangeStart_end__onceToken != -1)
      dispatch_once(&_enqueueLoadForRangeStart_end__onceToken, &__block_literal_global_14);
    os_unfair_lock_lock(&self->_selectedCalendarsLock);
    v7 = -[NSSet count](self->_selectedCalendars, "count");
    v8 = v7 == 0;
    -[NSSet allObjects](self->_selectedCalendars, "allObjects");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v7)
      v10 = 0;
    else
      v10 = !self->_selectedCalendarsWereSet;
    os_unfair_lock_unlock(&self->_selectedCalendarsLock);
    store = self->_store;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventStore predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:](store, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v12, v13, v9, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[CUIKEventLoader _enqueueLoadForRangeStart:end:].cold.1((uint64_t)v14, v15, v16);

    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    occurrencesLock = self->_occurrencesLock;
    v18 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_19;
    block[3] = &unk_1E6EB70A8;
    *(double *)&block[7] = a3;
    *(double *)&block[8] = a4;
    block[4] = self;
    block[5] = &v33;
    block[6] = &v37;
    dispatch_sync(occurrencesLock, block);
    if (!*((_BYTE *)v34 + 24))
    {
      cancelSeed = self->_cancelSeed;
      loadGroup = self->_loadGroup;
      loadQueue = self->_loadQueue;
      v25[0] = v18;
      v25[1] = 3221225472;
      v25[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_20;
      v25[3] = &unk_1E6EB70F8;
      v25[4] = self;
      v29 = cancelSeed;
      v30 = v8;
      v26 = v14;
      v27 = a3;
      v28 = a4;
      v31 = v10;
      dispatch_group_async(loadGroup, loadQueue, v25);
      if (*((_BYTE *)v38 + 24))
      {
        v22 = self->_loadGroup;
        v23 = self->_loadQueue;
        v24[0] = v18;
        v24[1] = 3221225472;
        v24[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2;
        v24[3] = &unk_1E6EB60F8;
        v24[4] = self;
        dispatch_group_notify(v22, v23, v24);
      }

    }
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);

  }
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke()
{
  _firstLoadBegan = 1;
}

- (void)setAllowEventLocationPrediction:(BOOL)a3
{
  NSObject *occurrencesLock;
  _QWORD block[5];

  if (self->_allowEventLocationPrediction != a3)
  {
    self->_allowEventLocationPrediction = a3;
    occurrencesLock = self->_occurrencesLock;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__CUIKEventLoader_setAllowEventLocationPrediction___block_invoke;
    block[3] = &unk_1E6EB60F8;
    block[4] = self;
    dispatch_sync(occurrencesLock, block);
  }
}

double __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke(_QWORD *a1)
{
  double result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 144);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 152);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 168);
  result = *(double *)(a1[4] + 176);
  *(double *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

void __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  double v43;
  double v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v1 = a1 + 32;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(double *)(v2 + 184);
  if (v3 != INFINITY)
  {
    v4 = *(double *)(v2 + 192);
    if (v4 != INFINITY && *(double *)(v2 + 144) != INFINITY && *(double *)(v2 + 152) != INFINITY)
    {
      v43 = 0.0;
      v44 = 0.0;
      v5 = *(unsigned int *)(v2 + 80);
      objc_msgSend(*(id *)(v2 + 8), "timeZone");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v2, "_getStart:end:paddedByDays:inTimeZone:resultStart:resultEnd:", v5, v6, &v44, &v43, v3, v4);

      v7 = *(_QWORD *)v1;
      if (*(double *)(*(_QWORD *)v1 + 144) < v44 || *(double *)(v7 + 152) > v43)
      {
        v8 = (void *)objc_msgSend(*(id *)(v7 + 24), "mutableCopy");
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(_QWORD *)v1;
        if (*(double *)(*(_QWORD *)v1 + 144) < v44)
        {
          v41 = 0u;
          v42 = 0u;
          v39 = 0u;
          v40 = 0u;
          v11 = v8;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v40;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v40 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
                objc_msgSend(v16, "startCalendarDate");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "absoluteTime");
                v19 = v18;
                v20 = v44;

                if (v19 <= v20)
                  objc_msgSend(v9, "addObject:", v16);
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v46, 16);
            }
            while (v13);
          }

          *(double *)(*(_QWORD *)v1 + 144) = v44;
          +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_2(v1, v21);

          v10 = *(_QWORD *)v1;
        }
        if (*(double *)(v10 + 152) > v43)
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v22 = v8;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v24; ++j)
              {
                if (*(_QWORD *)v36 != v25)
                  objc_enumerationMutation(v22);
                v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
                objc_msgSend(v27, "startCalendarDate", (_QWORD)v35);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "absoluteTime");
                v30 = v29;
                v31 = v43;

                if (v30 >= v31)
                  objc_msgSend(v9, "addObject:", v27);
              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
            }
            while (v24);
          }

          *(double *)(*(_QWORD *)v1 + 152) = v43;
          +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_1(v1, v32);

        }
        objc_msgSend(v8, "minusSet:", v9, (_QWORD)v35);
        v33 = objc_msgSend(v8, "copy");
        v34 = *(void **)(*(_QWORD *)v1 + 24);
        *(_QWORD *)(*(_QWORD *)v1 + 24) = v33;

      }
    }
  }
}

- (void)_getStart:(double)a3 end:(double)a4 paddedByDays:(int)a5 inTimeZone:(id)a6 resultStart:(double *)a7 resultEnd:(double *)a8
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v10 = a6;
  CalAbsoluteTimeAddGregorianUnits();
  v12 = v11;
  CalAbsoluteTimeAddGregorianUnits();
  v14 = v13;

  if (a7)
    *(_QWORD *)a7 = v12;
  if (a8)
    *(_QWORD *)a8 = v14;
}

double __84__CUIKEventLoader_occurrencesForStartDate_endDate_preSorted_waitForLoad_isComplete___block_invoke(_QWORD *a1)
{
  double result;

  objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(a1[4] + 24));
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 48));
  *(_DWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = *(_DWORD *)(a1[4] + 200);
  *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 24) = *(_QWORD *)(a1[4] + 144);
  result = *(double *)(a1[4] + 152);
  *(double *)(*(_QWORD *)(a1[11] + 8) + 24) = result;
  return result;
}

- (void)addOccurrenceAwaitingRefresh:(id)a3
{
  id v4;
  NSObject *occurrencesLock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    occurrencesLock = self->_occurrencesLock;
    block[1] = 3221225472;
    block[2] = __48__CUIKEventLoader_addOccurrenceAwaitingRefresh___block_invoke;
    block[3] = &unk_1E6EB6170;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(occurrencesLock, block);

    v4 = v6;
  }

}

uint64_t __48__CUIKEventLoader_addOccurrenceAwaitingRefresh___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addOccurrenceAwaitingDeletion:(id)a3
{
  id v4;
  NSObject *occurrencesLock;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    occurrencesLock = self->_occurrencesLock;
    block[1] = 3221225472;
    block[2] = __49__CUIKEventLoader_addOccurrenceAwaitingDeletion___block_invoke;
    block[3] = &unk_1E6EB6170;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(occurrencesLock, block);

    v4 = v6;
  }

}

uint64_t __49__CUIKEventLoader_addOccurrenceAwaitingDeletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)setPadding:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (self->_daysOfPadding != a3)
  {
    v3 = *(_QWORD *)&a3;
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CUIKEventLoader setPadding:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);

    self->_daysOfPadding = v3;
    -[CUIKEventLoader loadIfNeeded](self, "loadIfNeeded");
  }
}

- (void)setComponentForExpandingRequests:(unint64_t)a3
{
  if (self->_componentForExpandingRequests != a3)
  {
    self->_componentForExpandingRequests = a3;
    -[CUIKEventLoader loadIfNeeded](self, "loadIfNeeded");
  }
}

- (void)setComponentForExpandingPadding:(unint64_t)a3
{
  if (self->_componentForExpandingPadding != a3)
    self->_componentForExpandingPadding = a3;
}

- (void)_eventStoreChanged:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9F80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  if (v6 != 2)
    -[CUIKEventLoader _reload](self, "_reload");
}

uint64_t __64__CUIKEventLoader__loadIfNeededBetweenStart_end_loadPaddingNow___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadIfNeededBetweenStart:end:loadPaddingNow:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (BOOL)firstLoadBegan
{
  return _firstLoadBegan;
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_19(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  double v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v2 = (uint64_t *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "_getLoadStart:end:fromLoadedStart:loadedEnd:currentlyLoadingStart:currentlyLoadingEnd:", &v13, &v12, *(double *)(*(_QWORD *)(a1 + 32) + 144), *(double *)(*(_QWORD *)(a1 + 32) + 152), *(double *)(*(_QWORD *)(a1 + 32) + 168), *(double *)(*(_QWORD *)(a1 + 32) + 176));
  v3 = *v2;
  if (*(double *)(*v2 + 144) == INFINITY || *(double *)(a1 + 56) < v13 || *(double *)(a1 + 64) > v12)
  {
    v4 = *(double *)(v3 + 168);
    if (v4 == INFINITY)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(double *)(v3 + 168);
    }
    if (*(double *)(a1 + 56) < v4 || v4 == INFINITY)
      v4 = *(double *)(a1 + 56);
    *(double *)(v3 + 168) = v4;
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(double *)(v6 + 176);
    if (*(double *)(a1 + 64) >= v7)
      v8 = *(double *)(a1 + 64);
    else
      v8 = *(double *)(v6 + 176);
    if (v7 == INFINITY)
      v9 = *(double *)(a1 + 64);
    else
      v9 = v8;
    *(double *)(v6 + 176) = v9;
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_19_cold_1(v2);

  }
  else
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_19_cold_2((double *)(a1 + 56), (double *)(a1 + 64));

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_20(uint64_t a1)
{
  _DWORD *v2;
  dispatch_group_t *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  __int128 v10;
  int v11;
  char v12;

  v2 = *(_DWORD **)(a1 + 32);
  if (v2[34] == *(_DWORD *)(a1 + 64))
  {
    objc_msgSend(v2, "_waitIfSimulatingSlowerLoads");
    v3 = *(dispatch_group_t **)(a1 + 32);
    if (*(_BYTE *)(a1 + 68))
    {
      -[dispatch_group_t handleAsynchronousFetchResults:cancelSeed:start:end:filterAll:emptyLoad:](v3, "handleAsynchronousFetchResults:cancelSeed:start:end:filterAll:emptyLoad:", MEMORY[0x1E0C9AA60], *(unsigned int *)(a1 + 64), 1, *(unsigned __int8 *)(a1 + 69), *(double *)(a1 + 48), *(double *)(a1 + 56));
    }
    else
    {
      dispatch_group_enter(v3[15]);
      v6 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      v7 = *(void **)(v6 + 8);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_21;
      v9[3] = &unk_1E6EB70D0;
      v9[4] = v6;
      v11 = *(_DWORD *)(a1 + 64);
      v10 = *(_OWORD *)(a1 + 48);
      v12 = *(_BYTE *)(a1 + 69);
      v8 = (id)objc_msgSend(v7, "fetchEventsMatchingPredicate:resultHandler:", v5, v9);
    }
  }
  else
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_20_cold_1();

  }
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_21(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "handleAsynchronousFetchResults:cancelSeed:start:end:filterAll:emptyLoad:", a2, *(unsigned int *)(a1 + 56), 0, *(unsigned __int8 *)(a1 + 60), *(double *)(a1 + 40), *(double *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 120));
}

- (void)handleAsynchronousFetchResults:(id)a3 cancelSeed:(int)a4 start:(double)a5 end:(double)a6 filterAll:(BOOL)a7 emptyLoad:(BOOL)a8
{
  id v14;
  void *v15;
  NSObject *occurrencesLock;
  NSObject *v17;
  _QWORD block[5];
  id v19;
  double v20;
  double v21;
  int v22;
  BOOL v23;
  BOOL v24;

  v14 = a3;
  v15 = v14;
  if (self->_cancelSeed == a4)
  {
    occurrencesLock = self->_occurrencesLock;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke;
    block[3] = &unk_1E6EB70F8;
    block[4] = self;
    v23 = a7;
    v19 = v14;
    v22 = a4;
    v20 = a5;
    v21 = a6;
    v24 = a8;
    dispatch_sync(occurrencesLock, block);
    -[CUIKEventLoader _pruneLoadedOccurrences](self, "_pruneLoadedOccurrences");

  }
  else
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_20_cold_1();

  }
}

void __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke(uint64_t a1)
{
  id v2;
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  NSObject *v26;
  double *v27;
  int v28;
  _QWORD block[5];
  __int128 v30;
  int v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  v2 = *(id *)(a1 + 32);
  if (*((double *)v2 + 18) == INFINITY || *((_BYTE *)v2 + 160) || *(_BYTE *)(a1 + 68))
  {
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = 0;

    v5 = (void *)*((_QWORD *)*v3 + 4);
    *((_QWORD *)*v3 + 4) = 0;

    v2 = *v3;
    if (*((_BYTE *)*v3 + 160))
    {
      objc_msgSend(*((id *)v2 + 5), "removeAllObjects");
      objc_msgSend(*((id *)*v3 + 6), "removeAllObjects");
      *((_BYTE *)*v3 + 160) = 0;
      v2 = *v3;
    }
  }
  if (*((_QWORD *)v2 + 3))
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    if (v6)
    {
      objc_msgSend(v7, "setByAddingObjectsFromArray:", *(_QWORD *)(a1 + 40));
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = v7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v10 + 136) == *(_DWORD *)(a1 + 64))
  {
    objc_storeStrong((id *)(v10 + 24), v8);
    v28 = *((_DWORD *)*v3 + 50) + 1;
    *((_DWORD *)*v3 + 50) = v28;
    v11 = objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v12 = *((id *)*v3 + 3);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v34 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v17, "proposedStartDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            -[NSObject addObject:](v11, "addObject:", v17);
          objc_msgSend(v17, "setLocationPredictionAllowed:", objc_msgSend(*v3, "allowEventLocationPrediction"));
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v14);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), v11);
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(double *)(v19 + 144);
    if (v20 >= *(double *)(a1 + 48))
      v21 = *(double *)(a1 + 48);
    else
      v21 = *(double *)(v19 + 144);
    if (v20 == INFINITY)
      v22 = *(double *)(a1 + 48);
    else
      v22 = v21;
    *(double *)(v19 + 144) = v22;
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(double *)(v23 + 152);
    if (v24 < *(double *)(a1 + 56) || v24 == INFINITY)
      v24 = *(double *)(a1 + 56);
    *(double *)(v23 + 152) = v24;
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_cold_1(v3);

    v27 = (double *)*v3;
    if (*((double *)*v3 + 21) == *((double *)*v3 + 18))
    {
      v27[21] = v27[19] + 1.0;
      v27 = (double *)*v3;
    }
    if (v27[22] == v27[19])
      v27[22] = v27[18] + -1.0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_24;
    block[3] = &unk_1E6EB7120;
    block[4] = *(_QWORD *)(a1 + 32);
    v30 = *(_OWORD *)(a1 + 48);
    v31 = v28;
    v32 = *(_BYTE *)(a1 + 69);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    +[CUIKLogSubsystem eventLoader](CUIKLogSubsystem, "eventLoader");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_20_cold_1();
  }

}

void __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_24(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 208));
  objc_msgSend(WeakRetained, "calendarEventLoader:occurrencesDidUpdateBetweenStart:end:generation:wasEmptyLoad:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60), *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (CUIKEventLoaderDelegate)delegate
{
  return (CUIKEventLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadQueue, 0);
  objc_storeStrong((id *)&self->_loadGroup, 0);
  objc_storeStrong((id *)&self->_selectedCalendars, 0);
  objc_storeStrong((id *)&self->_occurrencesAwaitingDeletion, 0);
  objc_storeStrong((id *)&self->_occurrencesAwaitingRefresh, 0);
  objc_storeStrong((id *)&self->_loadedProposedTimeOccurrences, 0);
  objc_storeStrong((id *)&self->_loadedOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrencesLock, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)setPadding:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_1B8A6A000, a2, a3, "EventLoader: Set padding to %i days", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setCacheLimit:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_1B8A6A000, a2, a3, "EventLoader: Set cache limit to %i days", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)setCacheLimit:(NSObject *)a3 .cold.2(unsigned int a1, unsigned int *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a2;
  v4 = 134218240;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_12(&dword_1B8A6A000, a3, (uint64_t)a3, "EventLoader: Attempted to set cache limit to %lu days, which is < the amount of padding (%lu)", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)occurrencesForStartDate:(os_log_t)log endDate:preSorted:waitForLoad:isComplete:.cold.1(unsigned int *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 2048;
  v6 = v3;
  _os_log_debug_impl(&dword_1B8A6A000, log, OS_LOG_TYPE_DEBUG, "EventLoader: Requested occurrences in range (%i) larger than cache limit (%lu)", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)occurrencesForStartDate:(double)a3 endDate:preSorted:waitForLoad:isComplete:.cold.2(NSObject *a1, double a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __GetDateFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __GetDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  _os_log_debug_impl(&dword_1B8A6A000, a1, OS_LOG_TYPE_DEBUG, "EventLoader: Requested occurrences for start: %@, end: %@", v12, 0x16u);

  OUTLINED_FUNCTION_5_0();
}

- (void)occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, v0, v1, "EventLoader: nil 'startDate' given.  Will not return any occurrences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)occurrencesForStartDate:endDate:preSorted:waitForLoad:isComplete:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, v0, v1, "EventLoader: nil 'endDate' given.  Will not return any occurrences.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_enqueueLoadForRangeStart:(uint64_t)a3 end:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_8_0(&dword_1B8A6A000, a2, a3, "EventLoader: Enqueuing load with predicate %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)_enqueueLoadForRangeStart:(double)a3 end:.cold.2(NSObject *a1, double a2, double a3)
{
  void *v3;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  __GetDateFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_1(), "stringFromDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __GetDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_12(&dword_1B8A6A000, a1, v12, "EventLoader: Attempted to enqueue load request with start >= end (start = %@, end = %@)", v13);

  OUTLINED_FUNCTION_5_0();
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_19_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  __GetDateFormatter();
  objc_claimAutoreleasedReturnValue();
  v5 = (void *)OUTLINED_FUNCTION_14();
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v6 + 168));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_1(), "stringFromDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __GetDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 3432), "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)a1 + 176));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "stringFromDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_1B8A6A000, v10, v11, "EventLoader: Set _currentlyLoadingStart = %@, end = %@", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_2_2();
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_19_cold_2(double *a1, double *a2)
{
  void *v2;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;

  __GetDateFormatter();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *a1);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_1(), "stringFromDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __GetDateFormatter();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *a2);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "stringFromDate:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_1B8A6A000, v9, v10, "EventLoader: Skipped enqueuing load: already loading/loaded on range start = %@, end = %@", v11, v12, v13, v14, v15);

  OUTLINED_FUNCTION_2_2();
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_20_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, v0, v1, "EventLoader: Cancel seeds don't match. Aborting load.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__CUIKEventLoader__enqueueLoadForRangeStart_end___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_1(&dword_1B8A6A000, v0, v1, "EventLoader: Set _currentlyLoadingStart, end = NOT_LOADING", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __91__CUIKEventLoader_handleAsynchronousFetchResults_cancelSeed_start_end_filterAll_emptyLoad___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t v16;

  __GetDateFormatter();
  objc_claimAutoreleasedReturnValue();
  v5 = (void *)OUTLINED_FUNCTION_14();
  objc_msgSend(v5, "dateWithTimeIntervalSinceReferenceDate:", *(double *)(v6 + 144));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_6_1(), "stringFromDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __GetDateFormatter();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 3432), "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)a1 + 152));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11(), "stringFromDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3_2(&dword_1B8A6A000, v10, v11, "EventLoader: Loaded range is start: %@, end: %@", v12, v13, v14, v15, v16);

  OUTLINED_FUNCTION_2_2();
}

void __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __GetDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)a1 + 152));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412290;
  v9 = v6;
  OUTLINED_FUNCTION_8_0(&dword_1B8A6A000, a2, v7, "EventLoader: Pruned end to %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_5();
}

void __42__CUIKEventLoader__pruneLoadedOccurrences__block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  __GetDateFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)a1 + 144));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412290;
  v9 = v6;
  OUTLINED_FUNCTION_8_0(&dword_1B8A6A000, a2, v7, "EventLoader: Pruned start to %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_5();
}

@end
