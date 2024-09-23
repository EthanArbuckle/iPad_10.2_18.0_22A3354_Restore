@implementation CUIKSingleDayTimelineLayout

void __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v12 = a2;
  objc_msgSend(v12, "occurrences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "_capVisibleTextForBucket:", v12);
    v8 = objc_msgSend(*(id *)(a1 + 32), "isRightToLeftLayout");
    objc_msgSend(v12, "correspondingPartition");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke_2;
    v13[3] = &unk_1E6EB5CF0;
    v17 = v8;
    v10 = *(_QWORD *)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v16 = a3;
    v11 = v9;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7
                                                                + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24)
                                                                - 1;

  }
}

void __66__CUIKSingleDayTimelineLayout__reclaimSpaceFromStackedOccurrences__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "occurrences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_adjustedStartTimeForOccurrence:", v4);
    v6 = v5;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v9, "correspondingPartition");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_popOccurrencesInPartition:endingBeforeTime:", v8, v6);

  }
}

- (void)_putCollidingOccurrencesIntoBucketsInResize:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSMutableArray *partitions;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[4];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = -[NSMutableArray count](self->_partitions, "count");
  v6 = -[NSMutableArray count](self->_collidingOccurrences, "count");
  -[NSMutableArray removeAllObjects](self->_occurrenceBuckets, "removeAllObjects");
  -[CUIKSingleDayTimelineLayout _combinedWidthOfPartitions](self, "_combinedWidthOfPartitions");
  v8 = v7;
  if (-[CUIKSingleDayTimelineLayout isRightToLeftLayout](self, "isRightToLeftLayout"))
    v9 = 0;
  else
    v9 = v5 - 1;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v35[3] = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__2;
  v33 = __Block_byref_object_dispose__2;
  v34 = 0;
  partitions = self->_partitions;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __75__CUIKSingleDayTimelineLayout__putCollidingOccurrencesIntoBucketsInResize___block_invoke;
  v21[3] = &unk_1E6EB5D68;
  v23 = v35;
  v21[4] = self;
  v25 = v9;
  v26 = v6;
  v27 = v8;
  v28 = a3;
  v12 = v10;
  v22 = v12;
  v24 = &v29;
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](partitions, "enumerateObjectsWithOptions:usingBlock:", 0, v21);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v36, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        objc_msgSend((id)v30[5], "addOccurrenceTemporarilyToEnd:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v16), (_QWORD)v17);
        objc_msgSend((id)v30[5], "makeTemporaryChangesPermanent");
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v36, 16);
    }
    while (v14);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(v35, 8);

}

- (BOOL)isRightToLeftLayout
{
  CUIKSingleDayTimelineGeometryDelegate **p_geometryDelegate;
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  char v8;

  p_geometryDelegate = &self->_geometryDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  if (!WeakRetained)
    return 0;
  v4 = WeakRetained;
  v5 = objc_loadWeakRetained((id *)p_geometryDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_geometryDelegate);
  v8 = objc_msgSend(v7, "shouldReverseLayoutDirection");

  return v8;
}

- (void)_findCollidingOccurrences
{
  double v3;
  double v4;
  id WeakRetained;
  double v6;
  double v7;
  double v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  id v19;
  id v20;
  char v21;
  CUIKSingleDayTimelineViewItem *v22;

  v22 = self->_currentOccurrence;
  -[NSMutableArray removeAllObjects](self->_collidingOccurrences, "removeAllObjects");
  -[NSMutableArray addObject:](self->_collidingOccurrences, "addObject:", v22);
  -[CUIKSingleDayTimelineLayout _adjustedStartTimeForOccurrence:](self, "_adjustedStartTimeForOccurrence:", v22);
  v4 = v3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  objc_msgSend(WeakRetained, "pointForDate:", v4);
  v7 = v6;

  -[CUIKSingleDayTimelineLayout _endOfCollisionZoneForY:occurrence:](self, "_endOfCollisionZoneForY:occurrence:", v22, v7);
  v9 = v8;
  v10 = -[NSArray count](self->_occurrences, "count");
  if (self->_currentOccurrenceIndex + 1 < v10)
  {
    v11 = v10;
    v12 = 1;
    while (1)
    {
      -[NSArray objectAtIndex:](self->_occurrences, "objectAtIndex:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKSingleDayTimelineLayout _adjustedStartTimeForOccurrence:](self, "_adjustedStartTimeForOccurrence:", v13);
      v15 = v14;
      v16 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      objc_msgSend(v16, "pointForDate:", v15);
      v18 = v17;

      v19 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      if (objc_msgSend(v19, "originIsUpperLeft"))
      {
        if (v18 > v9)
          break;
      }
      v20 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      v21 = objc_msgSend(v20, "originIsUpperLeft");

      if ((v21 & 1) == 0 && v18 < v9)
        goto LABEL_10;
      -[NSMutableArray insertObject:atIndex:](self->_collidingOccurrences, "insertObject:atIndex:", v13, -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](self->_collidingOccurrences, "indexOfObject:inSortedRange:options:usingComparator:", v13, 0, v12++, 1280, &__block_literal_global_10));
      ++self->_currentOccurrenceIndex;

      if (self->_currentOccurrenceIndex + 1 >= v11)
        goto LABEL_11;
    }

LABEL_10:
  }
LABEL_11:

}

- (double)_endOfCollisionZoneForY:(double)a3 occurrence:(id)a4
{
  id v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double Height;
  id WeakRetained;
  int v19;
  double v20;
  double v21;
  CGRect v23;

  v6 = a4;
  objc_msgSend(v6, "viewMaxNaturalTextHeight");
  v8 = v7;
  objc_msgSend(v6, "stagedFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  Height = CGRectGetHeight(v23);
  if (Height < v8)
    v8 = Height;
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  v19 = objc_msgSend(WeakRetained, "originIsUpperLeft");
  v20 = -1.0;
  if (v19)
    v20 = 1.0;
  v21 = a3 + v8 * v20;

  return v21;
}

- (double)_combinedWidthOfPartitions
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_partitions;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "freeSpaceWidth", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

void __75__CUIKSingleDayTimelineLayout__putCollidingOccurrencesIntoBucketsInResize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  double v23;
  CUIKSingleDayTimelineOccurrenceBucket *v24;
  id WeakRetained;
  id v26;
  CUIKSingleDayTimelineOccurrenceBucket *v27;
  uint64_t v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (*(_QWORD *)(a1 + 64) == a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "subarrayWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count")- *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 72);
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v8 = (void *)(v9 - v10);
    if (v9 != v10)
    {
      objc_msgSend(v5, "freeSpaceWidth");
      v12 = vcvtad_u64_f64(v11 / *(double *)(a1 + 80) * (double)*(unint64_t *)(a1 + 72));
      if ((unint64_t)v8 >= v12)
        v13 = v12;
      else
        v13 = (unint64_t)v8;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "subarrayWithRange:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v14, "mutableCopy");

      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += v13;
    }
  }
  objc_msgSend(v6, "topBoundaryTime");
  v16 = v15;
  if (!*(_BYTE *)(a1 + 88))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v17 = (void *)objc_msgSend(v8, "mutableCopy", 0);
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(*(id *)(a1 + 32), "_adjustedStartTimeForOccurrence:", v22);
          if (v23 < v16)
          {
            objc_msgSend(*(id *)(a1 + 40), "addObject:", v22);
            objc_msgSend(v8, "removeObject:", v22);
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v19);
    }

  }
  v24 = [CUIKSingleDayTimelineOccurrenceBucket alloc];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  v26 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  v27 = -[CUIKSingleDayTimelineOccurrenceBucket initWithOccurrences:correspondingPartition:screenUtilsDelegate:geometryDelegate:](v24, "initWithOccurrences:correspondingPartition:screenUtilsDelegate:geometryDelegate:", v8, v6, WeakRetained, v26);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", v27);
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v31 = *(void **)(v28 + 40);
  v29 = (id *)(v28 + 40);
  v30 = v31;
  if (!v31)
    goto LABEL_22;
  objc_msgSend(v30, "correspondingPartition");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topBoundaryTime");
  v34 = v33;

  if (v16 < v34)
  {
    v29 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
LABEL_22:
    objc_storeStrong(v29, v27);
  }

}

uint64_t __53__CUIKSingleDayTimelineLayout__stampOccurrenceFrames__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stampFramesOntoOccurrences");
}

uint64_t __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_calculateVerticalFrameAspectsForOccurrence:", a2);
}

- (CUIKSingleDayTimelineLayout)initWithOccurrences:(id)a3 startOfDay:(id)a4 endOfDay:(id)a5 geometryDelegate:(id)a6 screenUtilsDelegate:(id)a7 calendar:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CUIKSingleDayTimelineLayout *v20;
  CUIKSingleDayTimelineLayout *v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  NSMutableArray *v28;
  NSMutableArray *occurrenceBuckets;
  NSMutableArray *v30;
  NSMutableArray *collidingOccurrences;
  id v33;
  objc_super v34;

  v33 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)CUIKSingleDayTimelineLayout;
  v20 = -[CUIKSingleDayTimelineLayout init](&v34, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_ungroupedOccurrences, a3);
    objc_storeStrong((id *)&v21->_calendar, a8);
    objc_storeStrong((id *)&v21->_startOfDay, a4);
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    v21->_startOfDayAbsoluteTime = v22;
    objc_storeStrong((id *)&v21->_endOfDay, a5);
    objc_msgSend(v16, "timeIntervalSinceReferenceDate");
    v21->_endOfDayAbsoluteTime = v23;
    objc_msgSend(v17, "displayedRect");
    v21->_frame.origin.x = v24;
    v21->_frame.origin.y = v25;
    v21->_frame.size.width = v26;
    v21->_frame.size.height = v27;
    objc_storeWeak((id *)&v21->_geometryDelegate, v17);
    objc_storeWeak((id *)&v21->_screenUtilsDelegate, v18);
    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    occurrenceBuckets = v21->_occurrenceBuckets;
    v21->_occurrenceBuckets = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    collidingOccurrences = v21->_collidingOccurrences;
    v21->_collidingOccurrences = v30;

  }
  return v21;
}

- (void)applyLayoutToOccurrencesInResize:(BOOL)a3
{
  id *p_occurrences;
  double Current;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  NSArray *occurrences;
  CUIKSingleDayTimelineViewItem *v18;
  CUIKSingleDayTimelineViewItem *currentOccurrence;
  unint64_t currentOccurrenceIndex;
  NSMutableArray *occurrenceBuckets;
  _QWORD v22[5];
  _QWORD v23[5];

  p_occurrences = (id *)&self->_occurrences;
  if (!self->_occurrences)
    objc_storeStrong((id *)&self->_occurrences, self->_ungroupedOccurrences);
  Current = CFAbsoluteTimeGetCurrent();
  if (*p_occurrences && objc_msgSend(*p_occurrences, "count", Current))
  {
    if (-[CUIKSingleDayTimelineLayout _inputIsInvalid](self, "_inputIsInvalid"))
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CUIKSingleDayTimelineLayout applyLayoutToOccurrencesInResize:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    }
    else
    {
      -[CUIKSingleDayTimelineLayout _initializeFirstGridStripe](self, "_initializeFirstGridStripe");
      v15 = -[NSArray count](self->_occurrences, "count");
      v16 = MEMORY[0x1E0C809B0];
      occurrences = self->_occurrences;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke;
      v23[3] = &unk_1E6EB5CA0;
      v23[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](occurrences, "enumerateObjectsUsingBlock:", v23);
      if (self->_currentOccurrenceIndex < v15)
      {
        do
        {
          -[NSArray objectAtIndex:](self->_occurrences, "objectAtIndex:");
          v18 = (CUIKSingleDayTimelineViewItem *)objc_claimAutoreleasedReturnValue();
          currentOccurrence = self->_currentOccurrence;
          self->_currentOccurrence = v18;

          if (a3)
          {
            -[CUIKSingleDayTimelineLayout _findCollidingOccurrences](self, "_findCollidingOccurrences");
            -[CUIKSingleDayTimelineLayout _putCollidingOccurrencesIntoBucketsInResize:](self, "_putCollidingOccurrencesIntoBucketsInResize:", 1);
          }
          else
          {
            -[CUIKSingleDayTimelineLayout _generateNewPartitions](self, "_generateNewPartitions");
            -[CUIKSingleDayTimelineLayout _mergePartitions](self, "_mergePartitions");
            -[CUIKSingleDayTimelineLayout _findCollidingOccurrences](self, "_findCollidingOccurrences");
            -[CUIKSingleDayTimelineLayout _putCollidingOccurrencesIntoBucketsInResize:](self, "_putCollidingOccurrencesIntoBucketsInResize:", 0);
            -[CUIKSingleDayTimelineLayout _reclaimSpaceFromStackedOccurrences](self, "_reclaimSpaceFromStackedOccurrences");
          }
          -[CUIKSingleDayTimelineLayout _stampOccurrenceFrames](self, "_stampOccurrenceFrames");
          currentOccurrenceIndex = self->_currentOccurrenceIndex + 1;
          self->_currentOccurrenceIndex = currentOccurrenceIndex;
          if (currentOccurrenceIndex == v15)
          {
            occurrenceBuckets = self->_occurrenceBuckets;
            v22[0] = v16;
            v22[1] = 3221225472;
            v22[2] = __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke_2;
            v22[3] = &unk_1E6EB5CC8;
            v22[4] = self;
            -[NSMutableArray enumerateObjectsUsingBlock:](occurrenceBuckets, "enumerateObjectsUsingBlock:", v22);
            currentOccurrenceIndex = self->_currentOccurrenceIndex;
          }
        }
        while (currentOccurrenceIndex < v15);
      }
    }
  }
}

- (void)_stampOccurrenceFrames
{
  void *v3;

  if (-[NSMutableArray count](self->_occurrenceBuckets, "count") == 1)
  {
    -[NSMutableArray objectAtIndex:](self->_occurrenceBuckets, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsOnlyBucket:", 1);

  }
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_occurrenceBuckets, "enumerateObjectsUsingBlock:", &__block_literal_global_9_0);
}

- (void)_reclaimSpaceFromStackedOccurrences
{
  NSMutableArray *occurrenceBuckets;
  _QWORD v4[5];

  if (-[NSMutableArray count](self->_occurrenceBuckets, "count"))
  {
    occurrenceBuckets = self->_occurrenceBuckets;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __66__CUIKSingleDayTimelineLayout__reclaimSpaceFromStackedOccurrences__block_invoke;
    v4[3] = &unk_1E6EB5CC8;
    v4[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](occurrenceBuckets, "enumerateObjectsUsingBlock:", v4);
  }
}

- (void)_mergePartitions
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[7];
  _QWORD v7[5];
  id v8;

  -[CUIKSingleDayTimelineLayout _adjustedStartTimeForOccurrence:](self, "_adjustedStartTimeForOccurrence:", self->_currentOccurrence);
  v4 = v3;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__2;
  v7[4] = __Block_byref_object_dispose__2;
  v8 = 0;
  v5 = (void *)-[NSMutableArray copy](self->_partitions, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__CUIKSingleDayTimelineLayout__mergePartitions__block_invoke;
  v6[3] = &unk_1E6EB5D40;
  v6[6] = v4;
  v6[4] = self;
  v6[5] = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  _Block_object_dispose(v7, 8);
}

- (void)_generateNewPartitions
{
  uint64_t v3;
  NSMutableArray *occurrenceBuckets;
  _QWORD v5[7];
  _QWORD v6[4];

  v3 = -[NSMutableArray count](self->_occurrenceBuckets, "count");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  occurrenceBuckets = self->_occurrenceBuckets;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke;
  v5[3] = &unk_1E6EB5D18;
  v5[5] = v6;
  v5[6] = v3;
  v5[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](occurrenceBuckets, "enumerateObjectsUsingBlock:", v5);
  _Block_object_dispose(v6, 8);
}

void __47__CUIKSingleDayTimelineLayout__mergePartitions__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_popOccurrencesInPartition:endingBeforeTime:", v10, *(double *)(a1 + 48));
  v4 = v10;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v10, "stackedOccurrences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {

      v4 = v10;
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "topBoundaryTime");
      v7 = v6;
      v8 = *(double *)(a1 + 48);

      v4 = v10;
      if (v7 <= v8)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", v10);
        objc_msgSend(v10, "endBoundary");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setEndBoundary:");
        goto LABEL_8;
      }
    }
  }
  objc_msgSend(v4, "topBoundaryTime");
  if (*(double *)(a1 + 48) > v9)
    objc_msgSend(v10, "setTopBoundaryTime:");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_8:

}

- (void)_calculateVerticalFrameAspectsForOccurrence:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double Height;
  double v37;
  double v38;
  id WeakRetained;
  double v40;
  id v41;
  int v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  char v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  id v57;
  CGRect v58;

  v57 = a3;
  objc_msgSend(v57, "startWithTravelTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  v6 = 0.0;
  if (objc_msgSend(v4, "isAfterDate:", self->_startOfDay))
  {
    -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 224, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "second");
    v9 = v8 + 60 * objc_msgSend(v7, "minute");
    v6 = (double)(v9 + 3600 * objc_msgSend(v7, "hour"));

  }
  objc_msgSend(v57, "start");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isAfterDate:", self->_startOfDay))
  {
    -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 224, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "second");
    v13 = v12 + 60 * objc_msgSend(v11, "minute");
    v5 = (double)(v13 + 3600 * objc_msgSend(v11, "hour"));

  }
  objc_msgSend(v57, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isBeforeDate:", self->_endOfDay))
  {
    -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 224, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "second");
    v17 = v16 + 60 * objc_msgSend(v15, "minute");
    v18 = (double)(v17 + 3600 * objc_msgSend(v15, "hour"));

    v19 = (uint64_t)v18;
  }
  else
  {
    v19 = 86400;
  }
  -[CUIKSingleDayTimelineLayout _rectForStartSeconds:endSeconds:](self, "_rectForStartSeconds:endSeconds:", (uint64_t)v6, v19);
  v55 = v21;
  v56 = v20;
  v54 = v22;
  v24 = v23;
  -[CUIKSingleDayTimelineLayout _rectForStartSeconds:endSeconds:](self, "_rectForStartSeconds:endSeconds:", (uint64_t)v5, v19);
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  objc_msgSend(v57, "enoughHeightForOneLine");
  v33 = v5;
  v35 = v34;
  v53 = v26;
  v58.origin.x = v26;
  v58.origin.y = v28;
  v58.size.width = v30;
  v58.size.height = v32;
  Height = CGRectGetHeight(v58);
  if (Height >= v35)
  {
    v35 = v32;
    v46 = v57;
    v44 = v55;
    v47 = v56;
    v45 = v54;
  }
  else
  {
    v37 = Height;
    v38 = 0.0;
    if (v33 - v6 > 0.0)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
      objc_msgSend(WeakRetained, "hourHeight");
      v38 = (v33 - v6) / 3600.0 * v40;

    }
    v24 = v35 + v38;
    v41 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
    v42 = objc_msgSend(v41, "originIsUpperLeft");

    v43 = v35 - v37;
    if (v42)
      v43 = 0.0;
    v44 = v55;
    v45 = v54 - v43;
    v28 = v28 - v43;
    v46 = v57;
    v47 = v56;
  }
  objc_msgSend(v46, "setTravelTimeHeight:", v24 - v35);
  v48 = objc_msgSend(v57, "hideTravelTime");
  if ((v48 & 1) != 0)
    v49 = v53;
  else
    v49 = v47;
  if ((v48 & 1) != 0)
    v50 = v28;
  else
    v50 = v45;
  if ((v48 & 1) != 0)
    v51 = v30;
  else
    v51 = v44;
  if ((v48 & 1) != 0)
    v52 = v35;
  else
    v52 = v24;
  objc_msgSend(v57, "setStagedFrame:", v49, v50, v51, v52);

}

- (double)_adjustedStartTimeForOccurrence:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double result;

  v4 = a3;
  if ((objc_msgSend(v4, "hideTravelTime") & 1) != 0)
    objc_msgSend(v4, "start");
  else
    objc_msgSend(v4, "startWithTravelTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  result = self->_startOfDayAbsoluteTime;
  if (result < v7)
    return v7;
  return result;
}

- (CGRect)_rectForStartSeconds:(int64_t)a3 endSeconds:(int64_t)a4
{
  double v5;
  int64_t v6;
  int64_t v7;
  unint64_t v8;
  double v9;
  CUIKSingleDayTimelineGeometryDelegate **p_geometryDelegate;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  id v15;
  double v16;
  double v17;
  CUIKSingleDayTimelineLayoutScreenUtils **p_screenUtilsDelegate;
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  double v25;
  id v26;
  id v27;
  double v28;
  double v29;
  id v30;
  id v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGRect result;

  v5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v6 = a4 - a3;
  v7 = (a4 + 100) % 3600;
  v8 = a4 - a3 - 1679;
  if ((double)a3 / 86400.0 >= 0.0)
    v9 = (double)a3 / 86400.0;
  else
    v9 = 0.0;
  p_geometryDelegate = &self->_geometryDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  objc_msgSend(WeakRetained, "hourHeight");
  v13 = v12;

  v14 = v13 * 24.0;
  v15 = objc_loadWeakRetained((id *)p_geometryDelegate);
  objc_msgSend(v15, "topPadding");
  v17 = v16;

  p_screenUtilsDelegate = &self->_screenUtilsDelegate;
  v19 = objc_loadWeakRetained((id *)p_screenUtilsDelegate);
  objc_msgSend(v19, "RoundToScreenScale:", v9 * v14);
  v21 = v17 + v20;

  v22 = objc_loadWeakRetained((id *)p_screenUtilsDelegate);
  objc_msgSend(v22, "RoundToScreenScale:", (double)v6 / 86400.0 * v14);
  v24 = v23;

  v25 = v24 + -0.5 + -0.5;
  if (v7 >= 200)
    v25 = v24 + -0.5;
  if (v8 < 0xF3)
    v24 = v25;
  v26 = objc_loadWeakRetained((id *)p_screenUtilsDelegate);
  v27 = objc_loadWeakRetained((id *)p_geometryDelegate);
  objc_msgSend(v27, "timeWidth");
  objc_msgSend(v26, "RoundToScreenScale:");
  v29 = v28;

  v30 = objc_loadWeakRetained((id *)p_geometryDelegate);
  LOBYTE(v27) = objc_msgSend(v30, "originIsUpperLeft");

  if ((v27 & 1) == 0)
  {
    v31 = objc_loadWeakRetained((id *)p_geometryDelegate);
    objc_msgSend(v31, "displayedRect");
    v21 = v32 - v21 - v24;

  }
  v33 = v29;
  v34 = v21;
  v35 = v5;
  v36 = v24;
  result.size.height = v36;
  result.size.width = v35;
  result.origin.y = v34;
  result.origin.x = v33;
  return result;
}

- (void)_capVisibleTextForBucket:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  CUIKSingleDayTimelineGeometryDelegate **p_geometryDelegate;
  id WeakRetained;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  id v18;

  v4 = a3;
  if (v4)
  {
    v18 = v4;
    objc_msgSend(v4, "earliestOccurrence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v18, "correspondingPartition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "peekOccurrence");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7 && (objc_msgSend(v7, "visibleHeightLocked") & 1) == 0)
      {
        -[CUIKSingleDayTimelineLayout _adjustedStartTimeForOccurrence:](self, "_adjustedStartTimeForOccurrence:", v5);
        v9 = v8;
        p_geometryDelegate = &self->_geometryDelegate;
        WeakRetained = objc_loadWeakRetained((id *)p_geometryDelegate);
        objc_msgSend(WeakRetained, "pointForDate:", v9);
        v13 = v12;

        objc_msgSend(v7, "stagedFrame");
        v15 = v13 - v14;
        v16 = objc_loadWeakRetained((id *)p_geometryDelegate);
        LOBYTE(WeakRetained) = objc_msgSend(v16, "originIsUpperLeft");

        if ((WeakRetained & 1) == 0)
        {
          objc_msgSend(v7, "stagedFrame");
          v15 = v15 - v17;
        }
        objc_msgSend(v7, "setVisibleHeight:", fabs(v15));
      }

    }
    v4 = v18;
  }

}

- (void)_popOccurrencesInPartition:(id)a3 endingBeforeTime:(double)a4
{
  id v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  if (v6)
  {
    v10 = v6;
    objc_msgSend(v6, "peekOccurrence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v7)
    {
      do
      {
        -[CUIKSingleDayTimelineLayout _effectiveEndTimeForOccurrence:](self, "_effectiveEndTimeForOccurrence:", v7);
        if (v8 > a4)
          break;
        objc_msgSend(v10, "popOccurrence");
        objc_msgSend(v10, "peekOccurrence");
        v9 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v9;
      }
      while (v9);

      v6 = v10;
    }
  }

}

- (double)_effectiveEndTimeForOccurrence:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double MaxY;
  id WeakRetained;
  double v17;
  double v18;
  CGRect v20;

  v4 = a3;
  -[CUIKSingleDayTimelineLayout _adjustedEndTimeForOccurrence:](self, "_adjustedEndTimeForOccurrence:", v4);
  v6 = v5;
  objc_msgSend(v4, "stagedFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  MaxY = CGRectGetMaxY(v20);
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  objc_msgSend(WeakRetained, "dateForPoint:", -1.0, MaxY);
  v18 = v17;

  if (v18 <= v6)
    return v6;
  if (v18 - v6 < 90.0)
    return v6;
  return v18;
}

- (double)_adjustedEndTimeForOccurrence:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double result;

  objc_msgSend(a3, "end");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  result = self->_endOfDayAbsoluteTime;
  if (result >= v6)
    return v6;
  return result;
}

- (BOOL)_inputIsInvalid
{
  double width;
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  width = self->_frame.size.width;
  v4 = width <= 0.0;
  if (width <= 0.0)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CUIKSingleDayTimelineLayout _inputIsInvalid].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[NSDate timeIntervalSinceDate:](self->_endOfDay, "timeIntervalSinceDate:", self->_startOfDay);
  if (v13 < 0.0)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CUIKSingleDayTimelineLayout _inputIsInvalid].cold.1(v14, v15, v16, v17, v18, v19, v20, v21);

    return 1;
  }
  return v4;
}

- (void)_initializeFirstGridStripe
{
  NSMutableArray *v3;
  NSMutableArray *partitions;
  _BOOL4 v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  CUIKSingleDayTimelineLayoutPartition *v11;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  partitions = self->_partitions;
  self->_partitions = v3;

  v11 = objc_alloc_init(CUIKSingleDayTimelineLayoutPartition);
  MEMORY[0x1BCCB6C44](self->_startOfDay);
  -[CUIKSingleDayTimelineLayoutPartition setTopBoundaryTime:](v11, "setTopBoundaryTime:");
  v5 = -[CUIKSingleDayTimelineLayout isRightToLeftLayout](self, "isRightToLeftLayout");
  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  if (v5)
  {
    -[CUIKSingleDayTimelineLayoutPartition setInitialStartBoundary:](v11, "setInitialStartBoundary:", CGRectGetMaxX(*(CGRect *)&x));
    MinX = CGRectGetMinX(self->_frame);
  }
  else
  {
    -[CUIKSingleDayTimelineLayoutPartition setInitialStartBoundary:](v11, "setInitialStartBoundary:", CGRectGetMinX(*(CGRect *)&x));
    MinX = CGRectGetMaxX(self->_frame);
  }
  -[CUIKSingleDayTimelineLayoutPartition setEndBoundary:](v11, "setEndBoundary:", MinX);
  -[NSMutableArray addObject:](self->_partitions, "addObject:", v11);

}

- (void)applyLayoutToOccurrences
{
  -[CUIKSingleDayTimelineLayout applyLayoutToOccurrencesInResize:](self, "applyLayoutToOccurrencesInResize:", 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_screenUtilsDelegate);
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_endOfDay, 0);
  objc_storeStrong((id *)&self->_startOfDay, 0);
  objc_storeStrong((id *)&self->_collidingOccurrences, 0);
  objc_storeStrong((id *)&self->_occurrenceBuckets, 0);
  objc_storeStrong((id *)&self->_partitions, 0);
  objc_storeStrong((id *)&self->_currentOccurrence, 0);
  objc_storeStrong((id *)&self->_occurrences, 0);
  objc_storeStrong((id *)&self->_ungroupedOccurrences, 0);
}

- (id)groupOccurrences:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  CUIKSingleDayTimelineGeometryDelegate **p_geometryDelegate;
  id WeakRetained;
  int v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  void *v34;
  void *v35;
  id v36;
  double v37;
  uint64_t v38;
  NSArray *occurrences;
  NSArray *v40;
  CUIKSingleDayTimelineLayout *v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v7 = self->_ungroupedOccurrences;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (objc_msgSend(v4, "itemIsEligibleForGrouping:", v12))
          v13 = v5;
        else
          v13 = v6;
        objc_msgSend(v13, "addObject:", v12);
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_3);
  v42 = self;
  p_geometryDelegate = &self->_geometryDelegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  v16 = objc_msgSend(WeakRetained, "originIsUpperLeft");

  if (objc_msgSend(v5, "count"))
  {
    v17 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_loadWeakRetained((id *)p_geometryDelegate);
      objc_msgSend(v18, "start");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceReferenceDate");
      objc_msgSend(v19, "pointForDate:");
      v22 = v21;

      objc_msgSend(v18, "enoughHeightForOneLine");
      v24 = v23;
      v44 = v17;
      v25 = v17 + 1;
      v43 = v17 + 1;
      if (v17 + 1 < objc_msgSend(v5, "count"))
      {
        v26 = -v24;
        if (v16)
          v26 = v24;
        v27 = v22 + v26;
        while (1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v25);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_loadWeakRetained((id *)p_geometryDelegate);
          objc_msgSend(v28, "start");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSinceReferenceDate");
          objc_msgSend(v29, "pointForDate:");
          v32 = v31;

          if (v16 ? v32 > v27 : v32 < v27)
            break;
          objc_msgSend(v4, "groupItem:withItem:", v18, v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v34;
          if (v34)
          {
            if (v34 != v18)
            {
              v36 = v34;

              objc_msgSend(v5, "setObject:atIndexedSubscript:", v36, v44);
              v18 = v36;
            }
            objc_msgSend(v5, "removeObjectAtIndex:", v25);
            objc_msgSend(v18, "enoughHeightForOneLine");
            if (!v16)
              v37 = -v37;
            v27 = v22 + v37;
            --v25;
          }

          ++v25;
          if (v25 >= objc_msgSend(v5, "count"))
            goto LABEL_30;
        }

      }
LABEL_30:

      v17 = v43;
    }
    while (v43 < objc_msgSend(v5, "count"));
  }
  objc_msgSend(v6, "addObjectsFromArray:", v5);
  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_3);
  v38 = objc_msgSend(v6, "copy");
  occurrences = v42->_occurrences;
  v42->_occurrences = (NSArray *)v38;

  v40 = v42->_occurrences;
  return v40;
}

uint64_t __48__CUIKSingleDayTimelineLayout_groupOccurrences___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  v5 = a2;
  if (objc_msgSend(v5, "hideTravelTime"))
    objc_msgSend(v5, "start");
  else
    objc_msgSend(v5, "startWithTravelTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hideTravelTime"))
    objc_msgSend(v4, "start");
  else
    objc_msgSend(v4, "startWithTravelTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  return v8;
}

uint64_t __64__CUIKSingleDayTimelineLayout_applyLayoutToOccurrencesInResize___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_capVisibleTextForBucket:", a2);
}

void __53__CUIKSingleDayTimelineLayout__generateNewPartitions__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id WeakRetained;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinY;
  id v19;
  double v20;
  double v21;
  id v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  double MinX;
  double v30;
  CUIKSingleDayTimelineLayoutPartition *v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double MaxX;
  id v37;
  CGRect v38;
  CGRect v39;

  v37 = a2;
  objc_msgSend(v37, "stagedFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 144));
  +[CUIKSingleDayTimelineOccurrenceBucket roundRectToScreenScaleForRect:screenUtilsDelegate:](CUIKSingleDayTimelineOccurrenceBucket, "roundRectToScreenScaleForRect:screenUtilsDelegate:", WeakRetained, v6, v8, v10, v12);
  objc_msgSend(v37, "setStagedFrame:");

  objc_msgSend(v37, "stagedFrame");
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;
  MinY = CGRectGetMinY(v38);
  v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  LOBYTE(WeakRetained) = objc_msgSend(v19, "originIsUpperLeft");

  if ((WeakRetained & 1) == 0)
  {
    v39.origin.x = x;
    v39.origin.y = y;
    v39.size.width = width;
    v39.size.height = height;
    MinY = CGRectGetMaxY(v39);
  }
  objc_msgSend(*(id *)(a1 + 32), "_endOfCollisionZoneForY:occurrence:", v37, MinY);
  v21 = v20;
  v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 136));
  objc_msgSend(v22, "dateForPoint:", -1.0, v21);
  v24 = v23;

  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  if (*(_BYTE *)(a1 + 64))
    MinX = CGRectGetMinX(*(CGRect *)&v25);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v25);
  v30 = MinX;
  if (a3)
  {
    v31 = objc_alloc_init(CUIKSingleDayTimelineLayoutPartition);
    -[CUIKSingleDayTimelineLayoutPartition setTopBoundaryTime:](v31, "setTopBoundaryTime:", v24);
    v32 = x;
    v33 = y;
    v34 = width;
    v35 = height;
    if (*(_BYTE *)(a1 + 64))
      MaxX = CGRectGetMaxX(*(CGRect *)&v32);
    else
      MaxX = CGRectGetMinX(*(CGRect *)&v32);
    -[CUIKSingleDayTimelineLayoutPartition setInitialStartBoundary:](v31, "setInitialStartBoundary:", MaxX);
    -[CUIKSingleDayTimelineLayoutPartition setEndBoundary:](v31, "setEndBoundary:", v30);
    -[CUIKSingleDayTimelineLayoutPartition pushOccurrence:](v31, "pushOccurrence:", v37);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "insertObject:atIndex:", v31, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + a3 + *(_QWORD *)(a1 + 56));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_adjustedStartTimeForOccurrence:", v37);
    objc_msgSend(*(id *)(a1 + 32), "_popOccurrencesInPartition:endingBeforeTime:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 40), "setTopBoundaryTime:", v24);
    objc_msgSend(*(id *)(a1 + 40), "setEndBoundary:", v30);
    objc_msgSend(*(id *)(a1 + 40), "pushOccurrence:", v37);
  }

}

- (double)_topOfOccurrence:(id)a3
{
  double v4;
  double v5;
  id WeakRetained;
  double v7;
  double v8;

  -[CUIKSingleDayTimelineLayout _adjustedStartTimeForOccurrence:](self, "_adjustedStartTimeForOccurrence:", a3);
  v5 = v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  objc_msgSend(WeakRetained, "pointForDate:", v5);
  v8 = v7;

  return v8;
}

- (void)applyLayoutToOccurrencesInResize:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "Layout input is invalid.  Will not lay out occurrences.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)_inputIsInvalid
{
  OUTLINED_FUNCTION_6(&dword_1B8A6A000, a1, a3, "Invalid width specified", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
