@implementation EKAvailabilityCachedSpanRange

- (EKAvailabilityCachedSpanRange)init
{
  EKAvailabilityCachedSpanRange *v2;
  NSMutableArray *v3;
  NSMutableArray *cachedSpans;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKAvailabilityCachedSpanRange;
  v2 = -[EKAvailabilityCachedSpanRange init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    cachedSpans = v2->_cachedSpans;
    v2->_cachedSpans = v3;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0D0C2D0]);
  v8.receiver = self;
  v8.super_class = (Class)EKAvailabilityCachedSpanRange;
  -[EKAvailabilityCachedSpanRange description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSuperclassDescription:", v4);

  objc_msgSend(v5, "setKey:withArray:", CFSTR("_cachedSpans"), self->_cachedSpans);
  objc_msgSend(v5, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)gatherFreshlyCachedSpansBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSMutableArray *cachedSpans;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, uint64_t, _BYTE *);
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    -[EKAvailabilityCachedSpanRange gatherFreshlyCachedSpansBetweenStartDate:endDate:].cold.1();
  if (-[EKAvailabilityCachedSpanRange _rangeCompletelyCoversPeriodBetweenStartDate:endDate:](self, "_rangeCompletelyCoversPeriodBetweenStartDate:endDate:", v6, v7))
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    cachedSpans = self->_cachedSpans;
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __82__EKAvailabilityCachedSpanRange_gatherFreshlyCachedSpansBetweenStartDate_endDate___block_invoke;
    v20 = &unk_1E4785EA8;
    v11 = v7;
    v21 = v11;
    v12 = v6;
    v22 = v12;
    v23 = v9;
    v13 = v8;
    v24 = v13;
    v14 = v9;
    -[NSMutableArray enumerateObjectsUsingBlock:](cachedSpans, "enumerateObjectsUsingBlock:", &v17);
    if (objc_msgSend(v13, "count", v17, v18, v19, v20))
    {
      objc_msgSend((id)objc_opt_class(), "_clampDateRangeForSpans:startDate:endDate:", v13, v12, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __82__EKAvailabilityCachedSpanRange_gatherFreshlyCachedSpansBetweenStartDate_endDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "span");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "CalIsBeforeOrSameAsDate:", v7))
  {
    *a4 = 1;
  }
  else if (objc_msgSend(*(id *)(a1 + 40), "CalIsBeforeDate:", v8))
  {
    objc_msgSend(v16, "creationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", v9);
    v11 = v10;
    +[EKDebugPreferences shared](EKDebugPreferences, "shared");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "availabilityFreshnessWindow");
    v14 = v13;

    v15 = *(void **)(a1 + 56);
    if (v11 <= v14)
    {
      objc_msgSend(v15, "addObject:", v6);
    }
    else
    {
      objc_msgSend(v15, "removeAllObjects");
      *a4 = 1;
    }

  }
}

- (int64_t)_currentMaxSpanTypeIn:(id)a3
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    v5 = -1;
    v6 = 2;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "integerValue") >= 1)
      {
        v8 = +[EKAvailabilitySpanDate valueForSpanType:](EKAvailabilitySpanDate, "valueForSpanType:", v4);
        v9 = v5 < v8;
        if (v5 <= v8)
          v5 = v8;
        if (v9)
          v6 = v4;
      }

      ++v4;
    }
    while (v4 < objc_msgSend(v3, "count"));
  }
  else
  {
    v6 = 2;
  }

  return v6;
}

- (void)sanitizeAndInsertResults:(id)a3 inRange:(id)a4
{
  id v6;
  id v7;
  EKAvailabilitySpan *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  EKAvailabilitySpan *v13;
  void *v14;
  EKAvailabilitySpan *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  EKAvailabilitySpan *v20;
  void *v21;
  EKAvailabilitySpan *v22;
  uint64_t v23;
  EKAvailabilitySpan *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    v23 = 0;
LABEL_10:
    v24 = [EKAvailabilitySpan alloc];
    objc_msgSend(v7, "startDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v24, "initWithStartDate:endDate:type:", v25, v26, v23);

    v27[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKAvailabilityCachedSpanRange insertSpans:](self, "insertSpans:", v10);
    goto LABEL_11;
  }
  if (!objc_msgSend(v6, "count"))
  {
    v23 = 2;
    goto LABEL_10;
  }
  v8 = (EKAvailabilitySpan *)objc_opt_new();
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isBeforeDate:", v10);

  if (v12)
  {
    v13 = [EKAvailabilitySpan alloc];
    objc_msgSend(v7, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v13, "initWithStartDate:endDate:type:", v14, v10, 2);
    -[EKAvailabilitySpan addObject:](v8, "addObject:", v15);

  }
  -[EKAvailabilitySpan addObjectsFromArray:](v8, "addObjectsFromArray:", v6);
  objc_msgSend(v6, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isAfterDate:", v17);

  if (v19)
  {
    v20 = [EKAvailabilitySpan alloc];
    objc_msgSend(v7, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v20, "initWithStartDate:endDate:type:", v17, v21, 2);
    -[EKAvailabilitySpan addObject:](v8, "addObject:", v22);

  }
  -[EKAvailabilityCachedSpanRange insertSpans:](self, "insertSpans:", v8);

LABEL_11:
}

- (id)cachedSpansFromSpans:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  EKAvailabilityCachedSpan *v11;
  EKAvailabilityCachedSpan *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [EKAvailabilityCachedSpan alloc];
        v12 = -[EKAvailabilityCachedSpan initWithSpan:](v11, "initWithSpan:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)spanType:(int64_t)a3 isSimilarToSpanType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;

  if (a3 == a4)
    return 1;
  v13 = v5;
  v14 = v4;
  return a3 == 1 && a4 == 5
      || a3 == 5 && a4 == 1
      || +[EKAvailabilityUtilities showTypeAsUnavailable:](EKAvailabilityUtilities, "showTypeAsUnavailable:", a3, v7, v6, v13, v14, v8, v9)&& +[EKAvailabilityUtilities showTypeAsUnavailable:](EKAvailabilityUtilities, "showTypeAsUnavailable:", a4)|| !+[EKAvailabilityUtilities showTypeAsBusy:](EKAvailabilityUtilities, "showTypeAsBusy:", a3)&& !+[EKAvailabilityUtilities showTypeAsBusy:](EKAvailabilityUtilities, "showTypeAsBusy:", a4);
}

- (id)mergeSpansOfSameType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  EKAvailabilityCachedSpanRange *v15;
  id v16;
  void *v17;
  int v18;
  void *v19;
  int64_t v20;
  id v21;
  void *v22;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  do
  {
    v25 = v4;
    v5 = qword_1A244A430[v4];
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v24;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      v27 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (-[EKAvailabilityCachedSpanRange spanType:isSimilarToSpanType:](self, "spanType:isSimilarToSpanType:", v5, objc_msgSend(v12, "type")))
          {
            if (!v9)
              goto LABEL_13;
            objc_msgSend(v9, "endDate");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "startDate");
            v14 = v5;
            v15 = self;
            v16 = v6;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v13, "isAfterDate:", v17);

            v6 = v16;
            self = v15;
            v5 = v14;

            v10 = v27;
            if (v18)
            {
              objc_msgSend(v12, "endDate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setEndDate:", v19);

              v20 = +[EKAvailabilityUtilities orderForType:](EKAvailabilityUtilities, "orderForType:", objc_msgSend(v12, "type"));
              if (v20 > +[EKAvailabilityUtilities orderForType:](EKAvailabilityUtilities, "orderForType:", objc_msgSend(v9, "type")))objc_msgSend(v9, "setType:", objc_msgSend(v12, "type"));
              objc_msgSend(v26, "removeObject:", v12);
              v5 = v14;
              v10 = v27;
            }
            else
            {
LABEL_13:
              v21 = v12;

              v9 = v21;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

    v4 = v25 + 1;
  }
  while (v25 != 2);
  -[EKAvailabilityCachedSpanRange cachedSpansFromSpans:](self, "cachedSpansFromSpans:", v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)insertSpans:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  NSMutableArray *cachedSpans;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  NSMutableArray *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  int v45;
  EKAvailabilitySpan *v46;
  void *v47;
  void *v48;
  EKAvailabilitySpan *v49;
  void *v50;
  void *v51;
  int v52;
  EKAvailabilitySpan *v53;
  void *v54;
  void *v55;
  EKAvailabilitySpan *v56;
  uint64_t v57;
  uint64_t v58;
  NSMutableArray *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  EKAvailabilityCachedSpanRange *v65;
  NSMutableArray *v66;
  NSMutableArray *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = EKAvailabilityHandle;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
  {
    -[EKAvailabilityCachedSpanRange insertSpans:].cold.2((uint64_t)v4, v5, v6);
    if (!v4)
    {
LABEL_35:
      v60 = EKAvailabilityHandle;
      if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_ERROR))
        -[EKAvailabilityCachedSpanRange insertSpans:].cold.1(v60);
      goto LABEL_37;
    }
  }
  else if (!v4)
  {
    goto LABEL_35;
  }
  if (!objc_msgSend(v4, "count"))
    goto LABEL_35;
  v64 = v4;
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_31);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v65 = self;
  v9 = self->_cachedSpans;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "span");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    }
    while (v11);
  }

  v15 = objc_alloc(MEMORY[0x1E0D0C2B8]);
  objc_msgSend(v7, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v7;
  objc_msgSend(v7, "lastObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "initWithStartDate:endDate:", v17, v19);

  v21 = objc_alloc(MEMORY[0x1E0D0C2B8]);
  objc_msgSend(v8, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "startDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lastObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v21, "initWithStartDate:endDate:", v23, v25);

  v61 = (void *)v26;
  if (!-[NSMutableArray count](v65->_cachedSpans, "count") || objc_msgSend(v20, "containsRange:", v26))
  {
    v27 = v62;
    -[EKAvailabilityCachedSpanRange mergeSpansOfSameType:](v65, "mergeSpansOfSameType:", v62);
    v28 = objc_claimAutoreleasedReturnValue();
    cachedSpans = v65->_cachedSpans;
    v65->_cachedSpans = (NSMutableArray *)v28;
    goto LABEL_33;
  }
  v67 = (NSMutableArray *)objc_opt_new();
  v66 = (NSMutableArray *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v30 = v8;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  if (!v31)
    goto LABEL_32;
  v32 = v31;
  v33 = *(_QWORD *)v69;
  do
  {
    v34 = 0;
    do
    {
      if (*(_QWORD *)v69 != v33)
        objc_enumerationMutation(v30);
      v35 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v34);
      objc_msgSend(v35, "endDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "startDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "CalIsBeforeOrSameAsDate:", v37);

      if (v38)
      {
        v39 = v67;
LABEL_23:
        -[NSMutableArray addObject:](v39, "addObject:", v35);
        goto LABEL_24;
      }
      objc_msgSend(v20, "endDate");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "startDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v40, "CalIsBeforeOrSameAsDate:", v41);

      if (v42)
      {
        v39 = v66;
        goto LABEL_23;
      }
      if (objc_msgSend(v20, "intersectsRange:", v35))
      {
        objc_msgSend(v35, "startDate");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "startDate");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "CalIsBeforeDate:", v44);

        if (v45)
        {
          v46 = [EKAvailabilitySpan alloc];
          objc_msgSend(v35, "startDate");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "startDate");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v46, "initWithStartDate:endDate:type:", v47, v48, objc_msgSend(v35, "type"));

          -[NSMutableArray addObject:](v67, "addObject:", v49);
        }
        objc_msgSend(v20, "endDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "endDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v50, "CalIsBeforeDate:", v51);

        if (v52)
        {
          v53 = [EKAvailabilitySpan alloc];
          objc_msgSend(v20, "endDate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "endDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v53, "initWithStartDate:endDate:type:", v54, v55, objc_msgSend(v35, "type"));

          -[NSMutableArray addObject:](v66, "addObject:", v56);
        }
      }
LABEL_24:
      ++v34;
    }
    while (v32 != v34);
    v57 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    v32 = v57;
  }
  while (v57);
LABEL_32:

  cachedSpans = v67;
  v27 = v62;
  -[NSMutableArray addObjectsFromArray:](v67, "addObjectsFromArray:", v62);
  -[NSMutableArray addObjectsFromArray:](v67, "addObjectsFromArray:", v66);
  -[EKAvailabilityCachedSpanRange mergeSpansOfSameType:](v65, "mergeSpansOfSameType:", v67);
  v58 = objc_claimAutoreleasedReturnValue();
  v59 = v65->_cachedSpans;
  v65->_cachedSpans = (NSMutableArray *)v58;

LABEL_33:
  v4 = v64;

LABEL_37:
}

uint64_t __45__EKAvailabilityCachedSpanRange_insertSpans___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "compare:", v10);

  }
  return v8;
}

- (id)spans
{
  id v3;
  NSMutableArray *cachedSpans;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  cachedSpans = self->_cachedSpans;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__EKAvailabilityCachedSpanRange_spans__block_invoke;
  v7[3] = &unk_1E4785EF0;
  v5 = v3;
  v8 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](cachedSpans, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __38__EKAvailabilityCachedSpanRange_spans__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "span");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "span");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (BOOL)_rangeCompletelyCoversPeriodBetweenStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  NSMutableArray *cachedSpans;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  char v16;

  v6 = a4;
  cachedSpans = self->_cachedSpans;
  v8 = a3;
  -[NSMutableArray firstObject](cachedSpans, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray lastObject](self->_cachedSpans, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "span");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "CalIsBeforeOrSameAsDate:", v8);

  if (v13)
  {
    objc_msgSend(v10, "span");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "CalIsAfterOrSameAsDate:", v6);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)_clampDateRangeForSpans:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  EKAvailabilitySpan *v22;
  void *v23;
  void *v24;
  int v25;
  EKAvailabilitySpan *v26;
  void *v27;
  int v28;
  id v29;
  EKAvailabilitySpan *v30;
  void *v31;
  EKAvailabilitySpan *v32;
  void *v33;
  EKAvailabilitySpan *v34;
  void *v35;
  EKAvailabilitySpan *v36;
  NSObject *v37;
  NSObject *v39;
  void *v40;
  void *v41;
  EKAvailabilitySpan *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
    +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:].cold.4();
  v10 = v7;
  v11 = objc_msgSend(v10, "count");
  v12 = v10;
  if (v10)
  {
    v13 = v11;
    v12 = v10;
    if (v11)
    {
      objc_msgSend(v10, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "CalIsBeforeDate:", v8))
      {

      }
      else
      {
        objc_msgSend(v15, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "CalIsAfterDate:", v9);

        if (!v18)
        {
          v37 = EKAvailabilityHandle;
          v12 = v10;
          if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
          {
            +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:].cold.3(v37);
            v12 = v10;
          }
          goto LABEL_24;
        }
      }
      v19 = (void *)EKAvailabilityHandle;
      if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
      {
        v39 = v19;
        objc_msgSend(v14, "startDate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v44 = v40;
        v45 = 2112;
        v46 = v41;
        v47 = 2112;
        v48 = v8;
        v49 = 2112;
        v50 = v9;
        _os_log_debug_impl(&dword_1A2318000, v39, OS_LOG_TYPE_DEBUG, "Clamping date range for spans.  Original start date: [%@].  Original end date: [%@].  New start date: [%@].  New end date: [%@].", buf, 0x2Au);

      }
      v20 = v13 - 1;
      if (v13 == 1)
      {
        v21 = objc_msgSend(v14, "type");
        objc_msgSend(v14, "startDate");
        v22 = (EKAvailabilitySpan *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "endDate");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "startDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "CalIsBeforeDate:", v8);

        if (v25)
        {
          v26 = (EKAvailabilitySpan *)v8;

          v22 = v26;
        }
        objc_msgSend(v14, "endDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "CalIsAfterDate:", v9);

        if (v28)
        {
          v29 = v9;

          v23 = v29;
        }
        v30 = -[EKAvailabilitySpan initWithStartDate:endDate:type:]([EKAvailabilitySpan alloc], "initWithStartDate:endDate:type:", v22, v23, v21);
        v31 = (void *)EKAvailabilityHandle;
        if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
          +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:].cold.1(v31, v21);
        v42 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v32 = [EKAvailabilitySpan alloc];
        objc_msgSend(v14, "endDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v32, "initWithStartDate:endDate:type:", v8, v33, objc_msgSend(v14, "type"));

        v34 = [EKAvailabilitySpan alloc];
        objc_msgSend(v15, "startDate");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[EKAvailabilitySpan initWithStartDate:endDate:type:](v34, "initWithStartDate:endDate:type:", v35, v9, objc_msgSend(v15, "type"));

        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v10);
        objc_msgSend(v12, "replaceObjectAtIndex:withObject:", 0, v22);
        objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v20, v36);
        if (os_log_type_enabled((os_log_t)EKAvailabilityHandle, OS_LOG_TYPE_DEBUG))
          +[EKAvailabilityCachedSpanRange _clampDateRangeForSpans:startDate:endDate:].cold.2();

      }
LABEL_24:

    }
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSpans, 0);
}

- (void)gatherFreshlyCachedSpansBetweenStartDate:endDate:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "Gathering freshly cached spans between [%@] and [%@]");
  OUTLINED_FUNCTION_1_0();
}

- (void)insertSpans:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "ERROR: No span given to insert results.", v1, 2u);
}

- (void)insertSpans:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, a2, a3, "Inserting spans [%@].", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)_clampDateRangeForSpans:(void *)a1 startDate:(unint64_t)a2 endDate:.cold.1(void *a1, unint64_t a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  EKAvailabilitySpanTypeAsString(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_0_0(&dword_1A2318000, v3, v5, "There is only one span.  Created a new span and set its type to: [%@]", (uint8_t *)&v6);

}

+ (void)_clampDateRangeForSpans:startDate:endDate:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "Clamped the spans.  firstTruncatedSpan: [%@].  lastTruncatedSpan: [%@]");
  OUTLINED_FUNCTION_1_0();
}

+ (void)_clampDateRangeForSpans:(os_log_t)log startDate:endDate:.cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1A2318000, log, OS_LOG_TYPE_DEBUG, "No clamping needed.", v1, 2u);
}

+ (void)_clampDateRangeForSpans:startDate:endDate:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_4(&dword_1A2318000, v0, v1, "Clamping date range for spans between [%@] and [%@]");
  OUTLINED_FUNCTION_1_0();
}

@end
