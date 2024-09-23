@implementation EKUIOverlayCalendarSignificantDatesProvider

- (EKUIOverlayCalendarSignificantDatesProvider)init
{
  EKUIOverlayCalendarSignificantDatesProvider *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKUIOverlayCalendarSignificantDatesProvider;
  v2 = -[EKUIOverlayCalendarSignificantDatesProvider init](&v7, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("EKUIOverlayCalendarSignificantDatesProvider", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__invalidateCaches, *MEMORY[0x1E0D0CA70], 0);

  }
  return v2;
}

- (void)setSignificantDatesChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D0CA70], 0);

  v4.receiver = self;
  v4.super_class = (Class)EKUIOverlayCalendarSignificantDatesProvider;
  -[EKUIOverlayCalendarSignificantDatesProvider dealloc](&v4, sel_dealloc);
}

- (void)_invalidateCaches
{
  NSDate *currentRequest;
  NSDate *v4;
  CalDateRange *cachedDateRange;
  CalDateRange *cachedCentralYear;
  NSDictionary *cachedFirstsOfMonths;
  NSDictionary *cachedFirstsOfYears;
  void *v9;
  void (**significantDatesChangedHandler)(id, _QWORD);
  NSDate *v11;

  currentRequest = self->_currentRequest;
  if (currentRequest)
  {
    v4 = currentRequest;
  }
  else
  {
    -[CalDateRange midpoint](self->_cachedDateRange, "midpoint");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v11 = v4;
  cachedDateRange = self->_cachedDateRange;
  self->_cachedDateRange = 0;

  cachedCentralYear = self->_cachedCentralYear;
  self->_cachedCentralYear = 0;

  cachedFirstsOfMonths = self->_cachedFirstsOfMonths;
  self->_cachedFirstsOfMonths = 0;

  cachedFirstsOfYears = self->_cachedFirstsOfYears;
  self->_cachedFirstsOfYears = 0;

  ++self->_currentGeneration;
  CUIKGetOverlayCalendar();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[EKUIOverlayCalendarSignificantDatesProvider _requestDate:](self, "_requestDate:", v11);
  }
  else
  {
    significantDatesChangedHandler = (void (**)(id, _QWORD))self->_significantDatesChangedHandler;
    if (significantDatesChangedHandler)
      significantDatesChangedHandler[2](significantDatesChangedHandler, 0);
  }

}

- (id)firstOfOverlayMonthsForCalendarMonth:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKUIOverlayCalendarSignificantDatesProvider _requestDate:](self, "_requestDate:", v4);
  -[NSDictionary objectForKeyedSubscript:](self->_cachedFirstsOfMonths, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstOfOverlayYearsForCalendarMonth:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[EKUIOverlayCalendarSignificantDatesProvider _requestDate:](self, "_requestDate:", v4);
  -[NSDictionary objectForKeyedSubscript:](self->_cachedFirstsOfYears, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_requestDate:(id)a3
{
  void *v5;
  NSDate *currentRequest;
  id v7;

  v7 = a3;
  CUIKGetOverlayCalendar();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (-[CalDateRange containsDate:](self->_cachedCentralYear, "containsDate:", v7))
    {
      currentRequest = self->_currentRequest;
      ++self->_currentGeneration;
      self->_currentRequest = 0;

    }
    else
    {
      objc_storeStrong((id *)&self->_currentRequest, a3);
      if (!self->_loadPending)
      {
        self->_loadPending = 1;
        -[EKUIOverlayCalendarSignificantDatesProvider _load](self, "_load");
      }
    }
  }

}

- (void)_load
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke;
  block[3] = &unk_1E6018688;
  block[4] = self;
  dispatch_async(queue, block);
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  _QWORD *v39;
  uint64_t *v40;
  uint64_t *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  _QWORD block[11];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  _QWORD v79[5];

  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v79[3] = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__13;
  v77 = __Block_byref_object_dispose__13;
  v78 = 0;
  v67 = 0;
  v68 = &v67;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__13;
  v71 = __Block_byref_object_dispose__13;
  v72 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__13;
  v65 = __Block_byref_object_dispose__13;
  v66 = 0;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__13;
  v59 = __Block_byref_object_dispose__13;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5;
  block[3] = &unk_1E601B1A0;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v51;
  block[6] = v79;
  block[7] = &v73;
  block[8] = &v67;
  block[9] = &v61;
  block[10] = &v55;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  if (!*((_BYTE *)v52 + 24))
  {
    CUIKCalendar();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    CUIKGetOverlayCalendar();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      if (!v62[5] || !v56[5])
      {
        v4 = objc_opt_new();
        v5 = (void *)v62[5];
        v62[5] = v4;

        v6 = objc_opt_new();
        v7 = (void *)v56[5];
        v56[5] = v6;

      }
      objc_msgSend(v2, "components:fromDate:", 6, v74[5]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "dateFromComponents:", v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = objc_alloc(MEMORY[0x1E0D0C2B8]);
      objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 4, 1, v9, 1024);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v9, v11);

      objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 4, -2, v9, 1024);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "dateByAddingUnit:value:toDate:options:", 4, 2, v14, 1024);
      v15 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)v9;

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D0C2B8]), "initWithStartDate:endDate:", v13, v15);
      v31 = (void *)v15;
      v32 = (void *)v13;
      v17 = (void *)objc_opt_new();
      v18 = (void *)v62[5];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_2;
      v47[3] = &unk_1E601B1C8;
      v19 = v16;
      v48 = v19;
      v20 = v17;
      v49 = v20;
      objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v47);
      objc_msgSend((id)v62[5], "removeObjectsForKeys:", v20);
      objc_msgSend((id)v56[5], "removeObjectsForKeys:", v20);
      v34 = v3;
      objc_msgSend(v19, "subtractRange:", v68[5]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_opt_new();
      v23 = (void *)objc_opt_new();
      objc_msgSend(v21, "distinctRanges");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_3;
      v42[3] = &unk_1E601B218;
      v43 = v34;
      v44 = v2;
      v25 = v22;
      v45 = v25;
      v26 = v23;
      v46 = v26;
      objc_msgSend(v24, "enumerateObjectsUsingBlock:", v42);

      objc_msgSend((id)v62[5], "setValuesForKeysWithDictionary:", v25);
      objc_msgSend((id)v56[5], "setValuesForKeysWithDictionary:", v26);
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5;
      v35[3] = &unk_1E601B240;
      v35[4] = *(_QWORD *)(a1 + 32);
      v36 = v19;
      v39 = v79;
      v40 = &v61;
      v41 = &v55;
      v37 = v12;
      v38 = v21;
      v27 = v21;
      v28 = v12;
      v29 = v19;
      v30 = (void *)MEMORY[0x1E0C80D38];
      dispatch_sync(MEMORY[0x1E0C80D38], v35);

      v3 = v34;
    }

  }
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v67, 8);

  _Block_object_dispose(&v73, 8);
  _Block_object_dispose(v79, 8);
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = a1[4];
  if (!*(_QWORD *)(v2 + 56) || objc_msgSend(*(id *)(v2 + 16), "containsDate:"))
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  if (!*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 48);
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), *(id *)(a1[4] + 56));
    objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), *(id *)(a1[4] + 8));
    v3 = objc_msgSend(*(id *)(a1[4] + 24), "mutableCopy");
    v4 = *(_QWORD *)(a1[9] + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v6 = objc_msgSend(*(id *)(a1[4] + 32), "mutableCopy");
    v7 = *(_QWORD *)(a1[10] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  v9 = a1[4];
  v10 = *(void **)(v9 + 56);
  *(_QWORD *)(v9 + 56) = 0;

  *(_BYTE *)(a1[4] + 64) = 0;
}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsDate:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);

}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_3(id *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v3 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "setDay:", 1);
  v4 = a1[4];
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_4;
  v8[3] = &unk_1E601B1F0;
  v9 = v3;
  v10 = a1[5];
  v11 = a1[6];
  v12 = a1[4];
  v13 = a1[7];
  v6 = v3;
  objc_msgSend(v4, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v5, v7, 1024, v8);

}

void __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_4(id *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  if ((objc_msgSend(a1[4], "containsDate:") & 1) != 0)
  {
    objc_msgSend(a1[5], "components:fromDate:", 30, v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "day");
    objc_msgSend(v6, "setDay:", 1);
    objc_msgSend(a1[5], "dateFromComponents:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v9, v8);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    objc_msgSend(a1[7], "components:fromDate:", 8, v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "month") == 1 && (objc_msgSend(v11, "isLeapMonth") & 1) == 0)
    {
      objc_msgSend(a1[8], "objectForKeyedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v12 = (void *)objc_opt_new();
        objc_msgSend(a1[8], "setObject:forKeyedSubscript:", v12, v8);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v13);

    }
  }
  else
  {
    *a4 = 1;
  }

}

uint64_t __52__EKUIOverlayCalendarSignificantDatesProvider__load__block_invoke_5(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 64) + 8) + 24) == *(_QWORD *)(v1 + 48))
  {
    v2 = result;
    objc_storeStrong((id *)(v1 + 8), *(id *)(result + 40));
    objc_storeStrong((id *)(*(_QWORD *)(v2 + 32) + 16), *(id *)(v2 + 48));
    objc_storeStrong((id *)(*(_QWORD *)(v2 + 32) + 24), *(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 72) + 8) + 40));
    objc_storeStrong((id *)(*(_QWORD *)(v2 + 32) + 32), *(id *)(*(_QWORD *)(*(_QWORD *)(v2 + 80) + 8) + 40));
    result = *(_QWORD *)(*(_QWORD *)(v2 + 32) + 72);
    if (result)
      return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(v2 + 56));
  }
  return result;
}

- (id)significantDatesChangedHandler
{
  return self->_significantDatesChangedHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_significantDatesChangedHandler, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cachedFirstsOfYears, 0);
  objc_storeStrong((id *)&self->_cachedFirstsOfMonths, 0);
  objc_storeStrong((id *)&self->_cachedCentralYear, 0);
  objc_storeStrong((id *)&self->_cachedDateRange, 0);
}

@end
