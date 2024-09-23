@implementation HKStackedBarSeries

- (HKStackedBarSeries)init
{
  HKStackedBarSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSArray *selectedFillStylesStorage;
  NSArray *v6;
  NSArray *unselectedFillStylesStorage;
  NSArray *inactiveFillStylesStorage;
  NSIndexSet *v9;
  NSIndexSet *unseparatedSegmentIndicesStorage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKStackedBarSeries;
  v2 = -[HKBarSeries init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKStackedBarSeriesLock"));
    selectedFillStylesStorage = v2->_selectedFillStylesStorage;
    v6 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_selectedFillStylesStorage = (NSArray *)MEMORY[0x1E0C9AA60];

    unselectedFillStylesStorage = v2->_unselectedFillStylesStorage;
    v2->_unselectedFillStylesStorage = v6;

    inactiveFillStylesStorage = v2->_inactiveFillStylesStorage;
    v2->_inactiveFillStylesStorage = v6;

    v2->_shouldRoundBottomCornersStorage = 0;
    v9 = (NSIndexSet *)objc_alloc_init(MEMORY[0x1E0CB36B8]);
    unseparatedSegmentIndicesStorage = v2->_unseparatedSegmentIndicesStorage;
    v2->_unseparatedSegmentIndicesStorage = v9;

  }
  return v2;
}

- (void)setInactiveFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *inactiveFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  inactiveFillStylesStorage = self->_inactiveFillStylesStorage;
  self->_inactiveFillStylesStorage = v6;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (void)setUnselectedFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *unselectedFillStylesStorage;
  void *v8;
  id v9;

  v4 = a3;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  unselectedFillStylesStorage = self->_unselectedFillStylesStorage;
  self->_unselectedFillStylesStorage = v6;

  -[NSArray lastObject](self->_unselectedFillStylesStorage, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  -[HKBarSeries setUnselectedFillStyle:](self, "setUnselectedFillStyle:", v9);
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (NSArray)selectedFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedFillStylesStorage;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *selectedFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  selectedFillStylesStorage = self->_selectedFillStylesStorage;
  self->_selectedFillStylesStorage = v6;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSArray)unselectedFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unselectedFillStylesStorage;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (NSArray)inactiveFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_inactiveFillStylesStorage;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (BOOL)shouldRoundBottomCorners
{
  void *v3;
  void *v4;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_shouldRoundBottomCornersStorage;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setShouldRoundBottomCorners:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_shouldRoundBottomCornersStorage = a3;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (NSIndexSet)unseparatedSegmentIndices
{
  void *v3;
  NSIndexSet *v4;
  void *v5;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unseparatedSegmentIndicesStorage;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setUnseparatedSegmentIndices:(id)a3
{
  id v4;
  void *v5;
  NSIndexSet *v6;
  NSIndexSet *unseparatedSegmentIndicesStorage;
  id v8;

  v4 = a3;
  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSIndexSet *)objc_msgSend(v4, "copy");
  unseparatedSegmentIndicesStorage = self->_unseparatedSegmentIndicesStorage;
  self->_unseparatedSegmentIndicesStorage = v6;

  -[HKStackedBarSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t i;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  double v29;
  void *v30;
  HKStackedBarCoordinate *v31;
  void *v32;
  HKStackedBarCoordinate *v33;
  void *v34;
  void *v36;
  void *v38;
  void *v39;
  id obj;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  __int128 v45;
  int64_t resolution;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "chartPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKStackedBarSeries.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v39 = v10;
  objc_msgSend(v10, "transform");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v11;
  objc_msgSend(v11, "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v12;
  v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v44)
  {
    v41 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v44; ++i)
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        objc_msgSend(v15, "xValueAsGenericType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "coordinateForValue:", v16);
        v18 = v17;

        objc_msgSend(v13, "coordinateForValue:", &unk_1E9CEB468);
        v20 = v19;
        objc_msgSend(v15, "allYValues");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18, v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v23);

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v24 = v21;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v48;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v48 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(v13, "coordinateForValue:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v18, v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v30);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          }
          while (v26);
        }

        v31 = [HKStackedBarCoordinate alloc];
        objc_msgSend(v15, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = -[HKStackedBarCoordinate initWithStackPoints:userInfo:](v31, "initWithStackPoints:userInfo:", v22, v32);

        objc_msgSend(v42, "addObject:", v33);
      }
      v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v44);
  }

  v45 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v42, &v45);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height;
  double y;
  double x;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat MaxX;
  CGFloat MinX;
  void *v40;
  void *v41;
  id v42;
  id v43;
  __int128 v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  double rect;
  _OWORD v52[3];
  _QWORD v53[4];
  id v54;
  id v55;
  HKStackedBarSeries *v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  double v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGRect v69;
  CGRect v70;

  height = a7.size.height;
  rect = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a8;
  v17 = a3;
  if (objc_msgSend(v16, "seriesDrawingDuringTiling")
    && (-[HKBarSeries tiledStrokeStyle](self, "tiledStrokeStyle"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = (void *)v18;
    -[HKBarSeries tiledStrokeStyle](self, "tiledStrokeStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKBarSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKBarSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "lineWidth");
  v23 = v22;

  -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "lineWidth");
  v26 = v25;

  if (v26 < v23)
    v26 = v23;
  objc_msgSend(v16, "screenRectForSeries:", self);
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = v33;

  -[HKBarSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4, v28, v30, v32, v34, v26);
  v36 = v35;
  v37 = v26 + v35;
  v69.origin.x = x;
  v69.origin.y = y;
  v69.size.width = rect;
  v69.size.height = height;
  MaxX = CGRectGetMaxX(v69);
  v70.origin.x = x;
  v70.origin.y = y;
  v70.size.width = rect;
  v70.size.height = height;
  MinX = CGRectGetMinX(v70);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __119__HKStackedBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke;
  v53[3] = &unk_1E9C42390;
  v57 = MinX;
  v58 = v37;
  v59 = MaxX;
  v42 = v40;
  v54 = v42;
  v43 = v41;
  v60 = v65;
  v61 = v66;
  v62 = v67;
  v63 = v68;
  v64 = v36;
  v55 = v43;
  v56 = self;
  v44 = *(_OWORD *)&a5->c;
  v52[0] = *(_OWORD *)&a5->a;
  v52[1] = v44;
  v52[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v17, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v52, 1, v53);

  if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
    -[HKStackedBarSeries unselectedFillStyles](self, "unselectedFillStyles");
  else
    -[HKStackedBarSeries inactiveFillStyles](self, "inactiveFillStyles");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStackedBarSeries _drawLevels:withFillStyles:strokeStyle:axisRect:context:](self, "_drawLevels:withFillStyles:strokeStyle:axisRect:context:", v42, v45, v20, a6, x, y, rect, height);
  -[HKStackedBarSeries selectedFillStyles](self, "selectedFillStyles");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v46;
  if (!v46)
  {
    -[HKStackedBarSeries unselectedFillStyles](self, "unselectedFillStyles");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v48 = objc_claimAutoreleasedReturnValue();
  v49 = (void *)v48;
  if (v48)
    v50 = (void *)v48;
  else
    v50 = v20;
  -[HKStackedBarSeries _drawLevels:withFillStyles:strokeStyle:axisRect:context:](self, "_drawLevels:withFillStyles:strokeStyle:axisRect:context:", v43, v47, v50, a6, x, y, rect, height);

  if (!v46)
}

void __119__HKStackedBarSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  _HKStackedBarLevel *v20;
  void *v21;
  _HKStackedBarLevel *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  unint64_t v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double x;
  double y;
  double height;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  double v54;
  double v55;
  uint64_t v56;
  _HKStackedBarSegment *v57;
  void *v58;
  void *v59;
  void *v60;
  unint64_t v61;
  double v62;
  double v63;
  double v64;
  double v65;
  _OWORD v66[4];
  _OWORD v67[3];
  CGRect v68;
  CGRect v69;

  v5 = a2;
  objc_msgSend(v5, "stackPoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "CGPointValue");
  v9 = v8;
  v64 = v10;

  objc_msgSend(v5, "stackPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lastObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CGPointValue");
  v62 = v14;
  v63 = v13;

  v15 = *(double *)(a1 + 64);
  v65 = v9;
  if (*(double *)(a1 + 56) - v9 <= v15 && v9 - *(double *)(a1 + 72) <= v15)
  {
    objc_msgSend(v5, "stackPoints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17 != 1)
    {
      v18 = 0;
      do
      {
        if (objc_msgSend(*(id *)(a1 + 32), "count", *(_QWORD *)&v62) <= v18)
        {
          v19 = *(void **)(a1 + 32);
          v20 = objc_alloc_init(_HKStackedBarLevel);
          objc_msgSend(v19, "addObject:", v20);

          v21 = *(void **)(a1 + 40);
          v22 = objc_alloc_init(_HKStackedBarLevel);
          objc_msgSend(v21, "addObject:", v22);

        }
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v18);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = a3[1];
        v67[0] = *a3;
        v67[1] = v24;
        v25 = *(_OWORD *)(a1 + 96);
        v66[0] = *(_OWORD *)(a1 + 80);
        v66[1] = v25;
        v26 = *(_OWORD *)(a1 + 128);
        v66[2] = *(_OWORD *)(a1 + 112);
        v66[3] = v26;
        if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v67, (uint64_t *)v66))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v18);
          v27 = objc_claimAutoreleasedReturnValue();

          v23 = (void *)v27;
        }
        objc_msgSend(v5, "stackPoints");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndexedSubscript:", v18);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "CGPointValue");
        v31 = v30;
        v33 = v32;

        objc_msgSend(v5, "stackPoints");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v18 + 1;
        objc_msgSend(v34, "objectAtIndexedSubscript:", v18 + 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "CGPointValue");
        v38 = v37;
        v40 = v39;

        if (v38 != v65 || v40 != v64)
        {
          if (v31 - v38 >= 0.0)
            v41 = v31 - v38;
          else
            v41 = -(v31 - v38);
          if (v33 - v40 >= 0.0)
            v42 = v33 - v40;
          else
            v42 = -(v33 - v40);
          v43 = v38;
          v44 = v40;
          v68 = CGRectStandardize(*(CGRect *)(&v41 - 2));
          v69 = CGRectOffset(v68, *(double *)(a1 + 144) * -0.5, 0.0);
          x = v69.origin.x;
          y = v69.origin.y;
          height = v69.size.height;
          v48 = *(double *)(a1 + 144) + v69.size.width;
          v49 = v38 - v63;
          if (v38 - v63 < 0.0)
            v49 = -(v38 - v63);
          v50 = v40 - v62;
          if (v40 - v62 < 0.0)
            v50 = -(v40 - v62);
          v51 = 3;
          if (v50 > 0.00000011920929)
            v51 = 0;
          if (v49 <= 0.00000011920929)
            v52 = v51;
          else
            v52 = 0;
          v53 = objc_msgSend(*(id *)(a1 + 48), "shouldRoundBottomCorners");
          v54 = v31 - v65;
          if (v31 - v65 < 0.0)
            v54 = -(v31 - v65);
          v55 = v33 - v64;
          if (v33 - v64 < 0.0)
            v55 = -(v33 - v64);
          v56 = v52 | 0xC;
          if (v55 > 0.00000011920929)
            v56 = v52;
          if (v54 > 0.00000011920929)
            v56 = v52;
          if (v53)
            v52 = v56;
          v57 = objc_alloc_init(_HKStackedBarSegment);
          -[_HKStackedBarSegment setRect:](v57, "setRect:", x, y, v48, height);
          -[_HKStackedBarSegment setRoundedCorners:](v57, "setRoundedCorners:", v52);
          objc_msgSend(*(id *)(a1 + 48), "unseparatedSegmentIndices");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[_HKStackedBarSegment setShouldSeparateFromAdjacentSegments:](v57, "setShouldSeparateFromAdjacentSegments:", objc_msgSend(v58, "containsIndex:", v18) ^ 1);

          objc_msgSend(v23, "segments");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v57);

        }
        objc_msgSend(v5, "stackPoints");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = objc_msgSend(v60, "count") - 1;

        v18 = v35;
      }
      while (v35 < v61);
    }
  }

}

- (void)_drawLevels:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  _UNKNOWN **v19;
  void *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  _UNKNOWN **v40;
  id v41;
  CGContext *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  void *v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  HKStackedBarSeries *v51;
  unint64_t v52;
  id v53;
  void *v54;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v53 = a3;
  v15 = a4;
  v16 = a5;
  v17 = objc_msgSend(v53, "count");
  v18 = v17 - 1;
  if (v17 - 1 >= 0)
  {
    v19 = &off_1E9C3C000;
    v49 = v15;
    v51 = self;
    do
    {
      v52 = v17;
      objc_msgSend(v53, "objectAtIndexedSubscript:", v18, v49);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v18;
      if (v18 >= objc_msgSend(v15, "count"))
      {
        v54 = 0;
      }
      else
      {
        objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v20, "segments");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

      if (v22)
      {
        v23 = 0;
        do
        {
          objc_msgSend(v20, "segments");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = v19[329];
          objc_msgSend(v25, "rect");
          v28 = v27;
          v30 = v29;
          v32 = v31;
          v34 = v33;
          v35 = objc_msgSend(v25, "roundedCorners");
          -[HKBarSeries cornerRadii](self, "cornerRadii");
          objc_msgSend(v26, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", v35, v28, v30, v32, v34, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v38, "isEmpty") & 1) == 0)
          {
            if (v16)
            {
              if (v52 >= objc_msgSend(v53, "count"))
              {
                v44 = 0;
              }
              else
              {
                objc_msgSend(v53, "objectAtIndexedSubscript:");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "segments");
                v40 = v19;
                v41 = v16;
                v42 = a7;
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "objectAtIndexedSubscript:", v23);
                v44 = (void *)objc_claimAutoreleasedReturnValue();

                a7 = v42;
                v16 = v41;
                v19 = v40;
                self = v51;

              }
              -[HKStackedBarSeries _strokeSeparatorIfNecessaryAboveSegment:belowSegment:strokeStyle:context:](self, "_strokeSeparatorIfNecessaryAboveSegment:belowSegment:strokeStyle:context:", v25, v44, v16, a7);

            }
            if (v54)
            {
              v45 = objc_msgSend(objc_retainAutorelease(v38), "CGPath");
              -[HKGraphSeries alpha](self, "alpha");
              objc_msgSend(v54, "renderPath:context:axisRect:alpha:", v45, a7, x, y, width, height, v46);
            }
          }

          ++v23;
          objc_msgSend(v20, "segments");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "count");

        }
        while (v23 < v48);
      }

      v15 = v49;
      v18 = v50 - 1;
      v17 = v50;
    }
    while (v50 > 0);
  }

}

- (void)_strokeSeparatorIfNecessaryAboveSegment:(id)a3 belowSegment:(id)a4 strokeStyle:(id)a5 context:(CGContext *)a6
{
  id v9;
  id v10;
  int v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  id v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v26 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v26, "shouldSeparateFromAdjacentSegments");
  if (v9 && v11 && objc_msgSend(v9, "shouldSeparateFromAdjacentSegments"))
  {
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "rect");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v10, "lineWidth");
    v22 = v21;
    v27.origin.x = v14;
    v27.origin.y = v16;
    v27.size.width = v18;
    v27.size.height = v20;
    v23 = v22 * 0.5;
    v24 = CGRectGetMinX(v27) - v22 * 0.5;
    v28.origin.x = v14;
    v28.origin.y = v16;
    v28.size.width = v18;
    v28.size.height = v20;
    objc_msgSend(v12, "moveToPoint:", v24, CGRectGetMinY(v28));
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.width = v18;
    v29.size.height = v20;
    v25 = v23 + CGRectGetMaxX(v29);
    v30.origin.x = v14;
    v30.origin.y = v16;
    v30.size.width = v18;
    v30.size.height = v20;
    objc_msgSend(v12, "addLineToPoint:", v25, CGRectGetMinY(v30));
    if ((objc_msgSend(v12, "isEmpty") & 1) == 0)
    {
      CGContextSaveGState(a6);
      objc_msgSend(v10, "applyToContext:", a6);
      CGContextAddPath(a6, (CGPathRef)objc_msgSend(objc_retainAutorelease(v12), "CGPath"));
      CGContextStrokePath(a6);
      CGContextRestoreGState(a6);
    }

  }
}

- (NSArray)selectedFillStylesStorage
{
  return self->_selectedFillStylesStorage;
}

- (void)setSelectedFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSArray)unselectedFillStylesStorage
{
  return self->_unselectedFillStylesStorage;
}

- (void)setUnselectedFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)inactiveFillStylesStorage
{
  return self->_inactiveFillStylesStorage;
}

- (void)setInactiveFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (BOOL)shouldRoundBottomCornersStorage
{
  return self->_shouldRoundBottomCornersStorage;
}

- (void)setShouldRoundBottomCornersStorage:(BOOL)a3
{
  self->_shouldRoundBottomCornersStorage = a3;
}

- (NSIndexSet)unseparatedSegmentIndicesStorage
{
  return self->_unseparatedSegmentIndicesStorage;
}

- (void)setUnseparatedSegmentIndicesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unseparatedSegmentIndicesStorage, 0);
  objc_storeStrong((id *)&self->_inactiveFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_unselectedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_selectedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
