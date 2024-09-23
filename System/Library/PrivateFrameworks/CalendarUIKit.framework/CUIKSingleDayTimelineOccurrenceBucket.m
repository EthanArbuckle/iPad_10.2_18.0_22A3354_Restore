@implementation CUIKSingleDayTimelineOccurrenceBucket

- (NSArray)occurrences
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_currentOccurrences, "copy");
}

- (CUIKSingleDayTimelineOccurrenceBucket)initWithOccurrences:(id)a3 correspondingPartition:(id)a4 screenUtilsDelegate:(id)a5 geometryDelegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  CUIKSingleDayTimelineOccurrenceBucket *v14;
  uint64_t v15;
  NSMutableArray *currentOccurrences;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CUIKSingleDayTimelineOccurrenceBucket;
  v14 = -[CUIKSingleDayTimelineOccurrenceBucket init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "mutableCopy");
    currentOccurrences = v14->_currentOccurrences;
    v14->_currentOccurrences = (NSMutableArray *)v15;

    objc_storeStrong((id *)&v14->_correspondingPartition, a4);
    v14->_temporaryFitnessLevelRequiresCalculation = 1;
    v14->_originalFitnessLevelRequiresCalculation = 1;
    objc_storeWeak((id *)&v14->_screenUtilsDelegate, v12);
    objc_storeWeak((id *)&v14->_geometryDelegate, v13);
  }

  return v14;
}

- (void)setIsOnlyBucket:(BOOL)a3
{
  self->_isOnlyBucket = a3;
}

void __67__CUIKSingleDayTimelineOccurrenceBucket_stampFramesOntoOccurrences__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id WeakRetained;
  double v16;
  int v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double MinX;
  double v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  CGRect v31;
  CGRect v32;

  v30 = a2;
  objc_msgSend(v30, "stagedFrame");
  v6 = v5;
  v8 = v7;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v9)
  {
    objc_msgSend(v9, "floatValue");
    v11 = v10;
    if (a3)
      goto LABEL_8;
  }
  else
  {
    v11 = *(double *)(a1 + 56);
    if (a3)
      goto LABEL_8;
  }
  if (*(_BYTE *)(a1 + 96) && *(_QWORD *)(a1 + 64) == 2)
  {
    v12 = *(double *)(a1 + 72);
    goto LABEL_10;
  }
LABEL_8:
  if (*(_QWORD *)(a1 + 80) == a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "endBoundary");
LABEL_10:
    v13 = v12 - v11;
    if (v13 >= 0.0)
      v14 = v13;
    else
      v14 = -v13;
    goto LABEL_14;
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(WeakRetained, "RoundToScreenScale:", *(double *)(a1 + 88));
  v14 = v16;

LABEL_14:
  v17 = *(unsigned __int8 *)(a1 + 97);
  v18 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v18, "RoundToScreenScale:", v11 - v14);
    v21 = v20;

    v22 = (void *)MEMORY[0x1E0CB37E8];
    v31.origin.x = v21;
    v31.origin.y = v6;
    v31.size.width = v14;
    v31.size.height = v8;
    MinX = CGRectGetMinX(v31);
  }
  else
  {
    objc_msgSend(v18, "RoundToScreenScale:", v11);
    v21 = v24;

    v22 = (void *)MEMORY[0x1E0CB37E8];
    v32.origin.x = v21;
    v32.origin.y = v6;
    v32.size.width = v14;
    v32.size.height = v8;
    MinX = CGRectGetMaxX(v32);
  }
  objc_msgSend(v22, "numberWithDouble:", MinX);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  v28 = (void *)objc_opt_class();
  v29 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 24));
  objc_msgSend(v28, "roundRectToScreenScaleForRect:screenUtilsDelegate:", v29, v21, v6, v14, v8);
  objc_msgSend(v30, "setStagedFrame:");

  objc_msgSend(v30, "stagedFrame");
  objc_msgSend(v30, "setUnPinnedViewFrame:");

}

- (void)stampFramesOntoOccurrences
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  unint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;
  char v11;
  id v12;
  int v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  BOOL v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  NSMutableArray *currentOccurrences;
  id v29;
  _QWORD v30[4];
  id v31;
  CUIKSingleDayTimelineOccurrenceBucket *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  unint64_t v37;
  uint64_t v38;
  BOOL v39;
  char v40;
  _QWORD v41[5];
  id v42;

  -[CUIKSingleDayTimelineOccurrenceBucket correspondingPartition](self, "correspondingPartition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "freeSpaceWidth");
  v5 = v4;
  -[CUIKSingleDayTimelineOccurrenceBucket _occurrencesForFitnessLevel](self, "_occurrencesForFitnessLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_geometryDelegate);
  if (WeakRetained
    && (v9 = WeakRetained,
        v10 = objc_loadWeakRetained((id *)&self->_geometryDelegate),
        v11 = objc_opt_respondsToSelector(),
        v10,
        v9,
        (v11 & 1) != 0))
  {
    v12 = objc_loadWeakRetained((id *)&self->_geometryDelegate);
    v13 = objc_msgSend(v12, "shouldReverseLayoutDirection");

  }
  else
  {
    v13 = 0;
  }
  v14 = objc_loadWeakRetained((id *)&self->_screenUtilsDelegate);
  objc_msgSend(v14, "RoundToScreenScale:", v5 / (double)v7);
  v16 = v15;

  objc_msgSend(v3, "freeSpaceStartBoundary");
  v18 = v17;
  v19 = -[CUIKSingleDayTimelineOccurrenceBucket isOnlyBucket](self, "isOnlyBucket");
  v20 = -[CUIKSingleDayTimelineOccurrenceBucket isOnlyBucket](self, "isOnlyBucket");
  if (v13)
  {
    if (v20)
    {
      v21 = objc_loadWeakRetained((id *)&self->_screenUtilsDelegate);
      objc_msgSend(v3, "initialStartBoundary");
      v23 = v22;
      objc_msgSend(v3, "totalWidth");
      v25 = -0.5;
LABEL_10:
      objc_msgSend(v21, "RoundToScreenScale:", v23 + v24 * v25);
      v5 = v27;

    }
  }
  else
  {
    v5 = 0.0;
    if (v20)
    {
      v21 = objc_loadWeakRetained((id *)&self->_screenUtilsDelegate);
      objc_msgSend(v3, "initialStartBoundary");
      v23 = v26;
      objc_msgSend(v3, "totalWidth");
      v25 = 0.5;
      goto LABEL_10;
    }
  }
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__7;
  v41[4] = __Block_byref_object_dispose__7;
  v42 = 0;
  currentOccurrences = self->_currentOccurrences;
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __67__CUIKSingleDayTimelineOccurrenceBucket_stampFramesOntoOccurrences__block_invoke;
  v30[3] = &unk_1E6EB7000;
  v33 = v41;
  v34 = v18;
  v39 = v19;
  v35 = v7;
  v36 = v5;
  v37 = v7 - 1;
  v29 = v3;
  v31 = v29;
  v32 = self;
  v38 = v16;
  v40 = v13;
  -[NSMutableArray enumerateObjectsUsingBlock:](currentOccurrences, "enumerateObjectsUsingBlock:", v30);

  _Block_object_dispose(v41, 8);
}

- (BOOL)isOnlyBucket
{
  return self->_isOnlyBucket;
}

- (id)earliestOccurrence
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  -[CUIKSingleDayTimelineOccurrenceBucket _occurrencesForFitnessLevel](self, "_occurrencesForFitnessLevel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CUIKSingleDayTimelineOccurrenceBucket_earliestOccurrence__block_invoke;
  v5[3] = &unk_1E6EB6FD8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_occurrencesForFitnessLevel
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableArray *currentOccurrences;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_temporaryOccurrenceAtBeginning)
    objc_msgSend(v3, "addObject:");
  v5 = -[NSMutableArray count](self->_currentOccurrences, "count");
  v6 = v5 - 1;
  if (!v5)
    v6 = 0;
  currentOccurrences = self->_currentOccurrences;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__CUIKSingleDayTimelineOccurrenceBucket__occurrencesForFitnessLevel__block_invoke;
  v12[3] = &unk_1E6EB6FB0;
  v12[4] = self;
  v14 = v6;
  v8 = v4;
  v13 = v8;
  -[NSMutableArray enumerateObjectsUsingBlock:](currentOccurrences, "enumerateObjectsUsingBlock:", v12);
  if (self->_temporaryOccurrenceAtEnd)
    objc_msgSend(v8, "addObject:");
  v9 = v13;
  v10 = v8;

  return v10;
}

+ (CGRect)roundRectToScreenScaleForRect:(CGRect)a3 screenUtilsDelegate:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "RoundToScreenScale:", x);
  v10 = v9;
  objc_msgSend(v8, "RoundToScreenScale:", y);
  v12 = v11;
  objc_msgSend(v8, "RoundToScreenScale:", width);
  v14 = v13;
  objc_msgSend(v8, "RoundToScreenScale:", height);
  v16 = v15;

  v17 = v10;
  v18 = v12;
  v19 = v14;
  v20 = v16;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (CUIKSingleDayTimelineLayoutPartition)correspondingPartition
{
  return self->_correspondingPartition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentOccurrences, 0);
  objc_destroyWeak((id *)&self->_geometryDelegate);
  objc_storeStrong((id *)&self->_correspondingPartition, 0);
  objc_destroyWeak((id *)&self->_screenUtilsDelegate);
  objc_storeStrong((id *)&self->_temporaryOccurrenceAtEnd, 0);
  objc_storeStrong((id *)&self->_temporaryOccurrenceAtBeginning, 0);
}

void __59__CUIKSingleDayTimelineOccurrenceBucket_earliestOccurrence__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  v11 = v4;
  if (!v7)
    goto LABEL_4;
  objc_msgSend(v4, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "compare:", v9);

  if (v10 == -1)
  {
    v6 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
LABEL_4:
    objc_storeStrong(v6, a2);
  }

}

void __68__CUIKSingleDayTimelineOccurrenceBucket__occurrencesForFitnessLevel__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 32);
  if ((a3 || !*(_BYTE *)(v6 + 64)) && (!*(_BYTE *)(v6 + 65) || *(_QWORD *)(a1 + 48) != a3))
  {
    v7 = v5;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    v5 = v7;
  }

}

- (CUIKSingleDayTimelineOccurrenceBucket)initWithOccurrences:(id)a3 correspondingPartition:(id)a4 screenUtilsDelegate:(id)a5
{
  return -[CUIKSingleDayTimelineOccurrenceBucket initWithOccurrences:correspondingPartition:screenUtilsDelegate:geometryDelegate:](self, "initWithOccurrences:correspondingPartition:screenUtilsDelegate:geometryDelegate:", a3, a4, a5, 0);
}

- (void)addOccurrenceTemporarilyToBeginning:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_temporaryOccurrenceAtBeginning)
  {
    *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
    v6 = v5;
    objc_storeStrong((id *)&self->_temporaryOccurrenceAtBeginning, a3);
    v5 = v6;
  }

}

- (void)addOccurrenceTemporarilyToEnd:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (!self->_temporaryOccurrenceAtBeginning)
  {
    *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
    v6 = v5;
    objc_storeStrong((id *)&self->_temporaryOccurrenceAtEnd, a3);
    v5 = v6;
  }

}

- (void)removeOccurrenceAtBeginningTemporarily
{
  *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
  self->_ignoreFirstOccurrenceInFitnessCalculations = 1;
}

- (void)removeOccurrenceAtEndTemporarily
{
  *(_WORD *)&self->_useTemporaryFitnessLevel = 257;
  self->_ignoreLastOccurrenceInFitnessCalculations = 1;
}

- (void)revertTemporaryChanges
{
  CUIKSingleDayTimelineViewItem *temporaryOccurrenceAtBeginning;
  CUIKSingleDayTimelineViewItem *temporaryOccurrenceAtEnd;

  self->_useTemporaryFitnessLevel = 0;
  temporaryOccurrenceAtBeginning = self->_temporaryOccurrenceAtBeginning;
  self->_temporaryOccurrenceAtBeginning = 0;

  temporaryOccurrenceAtEnd = self->_temporaryOccurrenceAtEnd;
  self->_temporaryOccurrenceAtEnd = 0;

  *(_WORD *)&self->_ignoreFirstOccurrenceInFitnessCalculations = 0;
}

- (void)makeTemporaryChangesPermanent
{
  CUIKSingleDayTimelineViewItem *temporaryOccurrenceAtBeginning;
  CUIKSingleDayTimelineViewItem *v4;
  CUIKSingleDayTimelineViewItem *temporaryOccurrenceAtEnd;

  self->_useTemporaryFitnessLevel = 0;
  temporaryOccurrenceAtBeginning = self->_temporaryOccurrenceAtBeginning;
  if (temporaryOccurrenceAtBeginning)
  {
    -[NSMutableArray insertObject:atIndex:](self->_currentOccurrences, "insertObject:atIndex:", temporaryOccurrenceAtBeginning, 0);
    v4 = self->_temporaryOccurrenceAtBeginning;
    self->_temporaryOccurrenceAtBeginning = 0;

  }
  if (self->_temporaryOccurrenceAtEnd)
  {
    -[NSMutableArray addObject:](self->_currentOccurrences, "addObject:");
    temporaryOccurrenceAtEnd = self->_temporaryOccurrenceAtEnd;
    self->_temporaryOccurrenceAtEnd = 0;

  }
  if (self->_ignoreFirstOccurrenceInFitnessCalculations)
  {
    if (-[NSMutableArray count](self->_currentOccurrences, "count"))
      -[NSMutableArray removeObjectAtIndex:](self->_currentOccurrences, "removeObjectAtIndex:", 0);
    self->_ignoreFirstOccurrenceInFitnessCalculations = 0;
  }
  if (self->_ignoreLastOccurrenceInFitnessCalculations)
  {
    if (-[NSMutableArray count](self->_currentOccurrences, "count"))
      -[NSMutableArray removeLastObject](self->_currentOccurrences, "removeLastObject");
    self->_ignoreLastOccurrenceInFitnessCalculations = 0;
  }
}

- (void)setCorrespondingPartition:(id)a3
{
  objc_storeStrong((id *)&self->_correspondingPartition, a3);
}

- (CUIKSingleDayTimelineGeometryDelegate)geometryDelegate
{
  return (CUIKSingleDayTimelineGeometryDelegate *)objc_loadWeakRetained((id *)&self->_geometryDelegate);
}

- (void)setGeometryDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_geometryDelegate, a3);
}

- (NSMutableArray)currentOccurrences
{
  return self->_currentOccurrences;
}

- (void)setCurrentOccurrences:(id)a3
{
  objc_storeStrong((id *)&self->_currentOccurrences, a3);
}

@end
