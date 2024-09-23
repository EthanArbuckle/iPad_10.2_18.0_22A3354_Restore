@implementation HKSleepDurationSeries

- (HKSleepDurationSeries)init
{
  HKSleepDurationSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  NSArray *defaultFillStylesStorage;
  NSArray *highlightedFillStylesStorage;
  NSArray *inactiveFillStylesStorage;
  HKStrokeStyle *goalLineStrokeStyleStorage;
  HKLineSeriesPointMarkerStyle *goalLineMarkerStyleStorage;
  id startOfDayTransformStorage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKSleepDurationSeries;
  v2 = -[HKBarSeries init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKSleepDurationSeriesLock"));
    defaultFillStylesStorage = v2->_defaultFillStylesStorage;
    v2->_defaultFillStylesStorage = 0;

    highlightedFillStylesStorage = v2->_highlightedFillStylesStorage;
    v2->_highlightedFillStylesStorage = 0;

    inactiveFillStylesStorage = v2->_inactiveFillStylesStorage;
    v2->_inactiveFillStylesStorage = 0;

    goalLineStrokeStyleStorage = v2->_goalLineStrokeStyleStorage;
    v2->_goalLineStrokeStyleStorage = 0;

    goalLineMarkerStyleStorage = v2->_goalLineMarkerStyleStorage;
    v2->_goalLineMarkerStyleStorage = 0;

    v2->_extendGoalLineToAxisStorage = 0;
    startOfDayTransformStorage = v2->_startOfDayTransformStorage;
    v2->_startOfDayTransformStorage = 0;

    v2->_hideInBedDataStorage = 0;
    v2->_hideAsleepDataStorage = 0;
    -[HKSleepDurationSeries _rebuildPointMarkerImages](v2, "_rebuildPointMarkerImages");
  }
  return v2;
}

- (NSArray)defaultFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_defaultFillStylesStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setDefaultFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *defaultFillStylesStorage;
  void *v8;
  id v9;

  v4 = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  defaultFillStylesStorage = self->_defaultFillStylesStorage;
  self->_defaultFillStylesStorage = v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  objc_msgSend(v4, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[HKBarSeries setUnselectedFillStyle:](self, "setUnselectedFillStyle:", v9);
}

- (NSArray)highlightedFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_highlightedFillStylesStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setHighlightedFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *highlightedFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  highlightedFillStylesStorage = self->_highlightedFillStylesStorage;
  self->_highlightedFillStylesStorage = v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (NSArray)inactiveFillStyles
{
  void *v3;
  NSArray *v4;
  void *v5;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_inactiveFillStylesStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setInactiveFillStyles:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *inactiveFillStylesStorage;
  id v8;

  v4 = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (NSArray *)objc_msgSend(v4, "copy");
  inactiveFillStylesStorage = self->_inactiveFillStylesStorage;
  self->_inactiveFillStylesStorage = v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKStrokeStyle)goalLineStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_goalLineStrokeStyleStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setGoalLineStrokeStyle:(id)a3
{
  id v4;
  void *v5;
  HKStrokeStyle *v6;
  HKStrokeStyle *goalLineStrokeStyleStorage;
  id v8;

  v4 = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (HKStrokeStyle *)objc_msgSend(v4, "copy");
  goalLineStrokeStyleStorage = self->_goalLineStrokeStyleStorage;
  self->_goalLineStrokeStyleStorage = v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (HKLineSeriesPointMarkerStyle)goalLineMarkerStyle
{
  void *v3;
  HKLineSeriesPointMarkerStyle *v4;
  void *v5;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_goalLineMarkerStyleStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setGoalLineMarkerStyle:(id)a3
{
  HKLineSeriesPointMarkerStyle *v4;
  void *v5;
  HKLineSeriesPointMarkerStyle *goalLineMarkerStyleStorage;
  void *v7;

  v4 = (HKLineSeriesPointMarkerStyle *)a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  goalLineMarkerStyleStorage = self->_goalLineMarkerStyleStorage;
  self->_goalLineMarkerStyleStorage = v4;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  -[HKSleepDurationSeries _rebuildPointMarkerImages](self, "_rebuildPointMarkerImages");
}

- (BOOL)extendGoalLineToAxis
{
  void *v3;
  void *v4;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_extendGoalLineToAxisStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setExtendGoalLineToAxis:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_extendGoalLineToAxisStorage = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (id)startOfDayTransform
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = _Block_copy(self->_startOfDayTransformStorage);
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  v6 = _Block_copy(v4);
  return v6;
}

- (void)setStartOfDayTransform:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id startOfDayTransformStorage;
  id v8;

  v4 = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  v6 = (void *)objc_msgSend(v4, "copy");
  startOfDayTransformStorage = self->_startOfDayTransformStorage;
  self->_startOfDayTransformStorage = v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

}

- (BOOL)hideInBedData
{
  void *v3;
  void *v4;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_hideInBedDataStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setHideInBedData:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_hideInBedDataStorage = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)hideAsleepData
{
  void *v3;
  void *v4;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_hideAsleepDataStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (void)setHideAsleepData:(BOOL)a3
{
  void *v5;
  id v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_hideAsleepDataStorage = a3;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (id)goalLineMarkerImage
{
  void *v3;
  UIImage *v4;
  void *v5;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_goalLineMarkerImageStorage;
  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)_rebuildPointMarkerImages
{
  void *v3;
  UIImage *v4;
  UIImage *goalLineMarkerImageStorage;
  id v6;

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  if (self->_goalLineMarkerStyleStorage)
  {
    +[HKChartSeriesPointMarker chartPointWithLineSeriesPresentationStyle:](HKChartSeriesPointMarker, "chartPointWithLineSeriesPresentationStyle:");
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    goalLineMarkerImageStorage = self->_goalLineMarkerImageStorage;
    self->_goalLineMarkerImageStorage = v4;
  }
  else
  {
    goalLineMarkerImageStorage = self->_goalLineMarkerImageStorage;
    self->_goalLineMarkerImageStorage = 0;
  }

  -[HKSleepDurationSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (void)clearCaches
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[HKSleepDurationSeries defaultFillStyles](self, "defaultFillStyles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v7++), "clearCache");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    }
    while (v5);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HKSleepDurationSeries highlightedFillStyles](self, "highlightedFillStyles");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12++), "clearCache");
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKSleepDurationSeries inactiveFillStyles](self, "inactiveFillStyles");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17++), "clearCache");
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v31, 16);
    }
    while (v15);
  }

  -[HKSleepDurationSeries _rebuildPointMarkerImages](self, "_rebuildPointMarkerImages");
  v18.receiver = self;
  v18.super_class = (Class)HKSleepDurationSeries;
  -[HKBarSeries clearCaches](&v18, sel_clearCaches);
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
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  HKSleepDurationCoordinate *v35;
  uint64_t v36;
  void *v37;
  HKSleepDurationCoordinate *v38;
  void *v39;
  void *v41;
  void *v43;
  void *v44;
  id obj;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  __int128 v50;
  int64_t resolution;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  objc_msgSend(a3, "chartPoints");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSleepDurationSeries.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  v44 = v10;
  objc_msgSend(v10, "transform");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v11;
  objc_msgSend(v11, "transform");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v12;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
  if (v49)
  {
    v46 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v57 != v46)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v15, "xValueAsGenericType");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "coordinateForValue:", v16);
        v18 = v17;

        v19 = v18 + -0.25;
        objc_msgSend(v13, "coordinateForValue:", &unk_1E9CEB5A0);
        v21 = v20;
        objc_msgSend(v15, "allYValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v19, v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v24);

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v25 = v22;
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (v26)
        {
          v27 = v26;
          v28 = *(_QWORD *)v53;
          do
          {
            for (j = 0; j != v27; ++j)
            {
              if (*(_QWORD *)v53 != v28)
                objc_enumerationMutation(v25);
              objc_msgSend(v13, "coordinateForValue:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * j));
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v19, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v31);

            }
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
          }
          while (v27);
        }

        objc_msgSend(v15, "goalValue");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          v33 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v15, "goalValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "coordinateForValue:", v34);
          objc_msgSend(v33, "numberWithDouble:");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v35 = [HKSleepDurationCoordinate alloc];
        v36 = objc_msgSend(v15, "highlighted");
        objc_msgSend(v15, "userInfo");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = -[HKSleepDurationCoordinate initWithStackPoints:goalLineYValue:highlighted:userInfo:](v35, "initWithStackPoints:goalLineYValue:highlighted:userInfo:", v23, v32, v36, v37);

        objc_msgSend(v47, "addObject:", v38);
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    }
    while (v49);
  }

  v50 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v47, &v50);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  return v39;
}

- (double)barWidthForVisibleBarCount:(int64_t)a3 axisRect:(CGRect)a4 minimumSpacing:(double)a5
{
  double v5;
  double v6;
  double result;

  v5 = a4.size.width / (double)a3;
  v6 = v5 * 0.33;
  if (v5 * 0.33 <= a5)
    v6 = a5;
  result = round(v5 - v6);
  if (result > 29.0)
    return 29.0;
  return result;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v18;
  id v19;
  int64_t v20;
  __int128 v21;
  _OWORD v22[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = a9;
  v19 = a3;
  v20 = -[HKBarSeries visibleBarCountWithZoomLevelConfiguration:](self, "visibleBarCountWithZoomLevelConfiguration:", a5);
  v21 = *(_OWORD *)&a6->c;
  v22[0] = *(_OWORD *)&a6->a;
  v22[1] = v21;
  v22[2] = *(_OWORD *)&a6->tx;
  -[HKSleepDurationSeries drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:](self, "drawWithBlockCoordinates:visibleBarCount:pointTransform:context:axisRect:seriesRenderingDelegate:", v19, v20, v22, a7, v18, x, y, width, height);

}

- (void)drawWithBlockCoordinates:(id)a3 visibleBarCount:(int64_t)a4 pointTransform:(CGAffineTransform *)a5 context:(CGContext *)a6 axisRect:(CGRect)a7 seriesRenderingDelegate:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat MaxX;
  CGFloat MinX;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v54;
  _OWORD v55[3];
  _QWORD v56[4];
  id v57;
  id v58;
  HKSleepDurationSeries *v59;
  id v60;
  id v61;
  _QWORD *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  _QWORD v78[5];
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  CGRect v92;
  CGRect v93;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v16 = a3;
  v17 = a8;
  v51 = objc_msgSend(v17, "seriesDrawingDuringTiling");
  v52 = v16;
  if (v51
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
  v54 = v20;
  objc_msgSend(v20, "lineWidth");
  v22 = v21;
  -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "lineWidth");
  v25 = v24;

  if (v25 < v22)
    v25 = v22;
  objc_msgSend(v17, "screenRectForSeries:", self);
  -[HKSleepDurationSeries barWidthForVisibleBarCount:axisRect:minimumSpacing:](self, "barWidthForVisibleBarCount:axisRect:minimumSpacing:", a4);
  v27 = v26;
  v28 = v25 + v26 + v25 + v26;
  v92.origin.x = x;
  v92.origin.y = y;
  v92.size.width = width;
  v92.size.height = height;
  MaxX = CGRectGetMaxX(v92);
  v93.origin.x = x;
  v93.origin.y = y;
  v93.size.width = width;
  v93.size.height = height;
  MinX = CGRectGetMinX(v93);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = 0;
  v87 = &v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__9;
  v90 = __Block_byref_object_dispose__9;
  v91 = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = __Block_byref_object_copy__9;
  v84 = __Block_byref_object_dispose__9;
  v85 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__9;
  v78[4] = __Block_byref_object_dispose__9;
  v79 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __122__HKSleepDurationSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke;
  v56[3] = &unk_1E9C428B0;
  v66 = MinX;
  v67 = v28;
  v68 = MaxX;
  v35 = v31;
  v57 = v35;
  v36 = v32;
  v69 = v27;
  v58 = v36;
  v59 = self;
  v37 = v33;
  v60 = v37;
  v38 = v34;
  v61 = v38;
  v62 = v78;
  v70 = x;
  v71 = y;
  v72 = width;
  v73 = height;
  v63 = &v74;
  v64 = &v86;
  v65 = &v80;
  v39 = *(_OWORD *)&a5->c;
  v55[0] = *(_OWORD *)&a5->a;
  v55[1] = v39;
  v55[2] = *(_OWORD *)&a5->tx;
  objc_msgSend(v52, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v55, 1, v56);
  -[HKSleepDurationSeries defaultFillStyles](self, "defaultFillStyles");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    if (-[HKGraphSeries allowsSelection](self, "allowsSelection"))
      -[HKSleepDurationSeries defaultFillStyles](self, "defaultFillStyles");
    else
      -[HKSleepDurationSeries inactiveFillStyles](self, "inactiveFillStyles");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepDurationSeries _drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "_drawPaths:withFillStyles:strokeStyle:axisRect:context:", v35, v41, v20, a6, x, y, width, height);
    -[HKSleepDurationSeries highlightedFillStyles](self, "highlightedFillStyles");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (!v42)
    {
      -[HKSleepDurationSeries defaultFillStyles](self, "defaultFillStyles");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[HKBarSeries selectedStrokeStyle](self, "selectedStrokeStyle");
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = (void *)v44;
    if (v44)
      v46 = (void *)v44;
    else
      v46 = v54;
    -[HKSleepDurationSeries _drawPaths:withFillStyles:strokeStyle:axisRect:context:](self, "_drawPaths:withFillStyles:strokeStyle:axisRect:context:", v36, v43, v46, a6, x, y, width, height);

    if (!v42)
  }
  if ((objc_msgSend(v37, "isEmpty") & 1) == 0)
  {
    -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    if (v47)
    {
      if (v81[5] && -[HKSleepDurationSeries extendGoalLineToAxis](self, "extendGoalLineToAxis"))
      {
        objc_msgSend((id)v81[5], "doubleValue");
        objc_msgSend(v37, "addLineToPoint:", x + width, v48);
      }
      -[HKSleepDurationSeries _drawGoalLinePath:context:](self, "_drawGoalLinePath:context:", v37, a6);
      -[HKSleepDurationSeries goalLineMarkerImage](self, "goalLineMarkerImage");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (v49)
        -[HKSleepDurationSeries _drawGoalLineMarkers:context:goalLineMarkerImage:](self, "_drawGoalLineMarkers:context:goalLineMarkerImage:", v38, a6, v49);
      if (v87[5])
      {
        objc_msgSend(v17, "axisAnnotationDelegateForSeries:", self);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v51 & 1) != 0 || !*((_BYTE *)v75 + 24))
        {
          objc_msgSend((id)v87[5], "doubleValue");
          -[HKSleepDurationSeries _addAnnotationForValue:axisAnnotationDelegate:](self, "_addAnnotationForValue:axisAnnotationDelegate:", v50);
        }
        else
        {
          objc_msgSend((id)v87[5], "doubleValue");
          -[HKSleepDurationSeries _addGoalAnnotationAtLocation:axisAnnotationDelegate:](self, "_addGoalAnnotationAtLocation:axisAnnotationDelegate:", v50);
        }

      }
    }
  }

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(&v86, 8);

}

void __122__HKSleepDurationSeries_drawWithBlockCoordinates_visibleBarCount_pointTransform_context_axisRect_seriesRenderingDelegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double x;
  double y;
  double width;
  double height;
  double v37;
  double v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v54;
  CGRect v55;
  CGRect v56;

  v54 = a2;
  v6 = a4;
  objc_msgSend(v54, "stackPoints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "CGPointValue");
  v10 = v9;
  v12 = v11;

  v13 = *(double *)(a1 + 112);
  if (*(double *)(a1 + 104) - v10 <= v13 && v10 - *(double *)(a1 + 120) <= v13)
  {
    objc_msgSend(v54, "stackPoints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 != 1)
    {
      v16 = 0;
      do
      {
        if (objc_msgSend(*(id *)(a1 + 32), "count") <= v16)
        {
          v17 = *(void **)(a1 + 32);
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

          v19 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);

        }
        objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v16);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "highlighted"))
        {
          objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v16);
          v22 = objc_claimAutoreleasedReturnValue();

          v21 = (void *)v22;
        }
        objc_msgSend(v54, "stackPoints");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectAtIndexedSubscript:", ++v16);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "CGPointValue");
        v26 = v25;
        v28 = v27;

        if (v26 != v10 || v28 != v12)
        {
          if (v12 - v28 >= 0.0)
            v30 = v12 - v28;
          else
            v30 = -(v12 - v28);
          v31 = v26;
          v32 = v28;
          v29 = *(_QWORD *)(a1 + 128);
          v55 = CGRectStandardize(*(CGRect *)(&v30 - 3));
          v56 = CGRectOffset(v55, *(double *)(a1 + 128) * -0.5, 0.0);
          x = v56.origin.x;
          y = v56.origin.y;
          width = v56.size.width;
          height = v56.size.height;
          objc_msgSend(*(id *)(a1 + 48), "cornerRadii");
          +[HKBarSeries barSeriesRoundedRect:byRoundingCorners:cornerRadii:](HKBarSeries, "barSeriesRoundedRect:byRoundingCorners:cornerRadii:", 3, x, y, width, height, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "appendPath:", v39);

        }
        objc_msgSend(v54, "stackPoints");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "count") - 1;

      }
      while (v16 < v41);
    }
    objc_msgSend(*(id *)(a1 + 48), "addGoalLinePathsToCoordinate:goalLinePath:goalLineMarkerPoints:previousCoordinateGoal:axisRect:", v54, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152), *(double *)(a1 + 160));
    objc_msgSend(v54, "goalLineYValue");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
      {
        v43 = *(void **)(a1 + 48);
        objc_msgSend(v54, "goalLineYValue");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = objc_msgSend(v43, "_currentGoal:differentFrom:", v44, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

        if ((_DWORD)v43)
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      }
      objc_msgSend(v6, "goalLineYValue");
      v45 = objc_claimAutoreleasedReturnValue();
      v46 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v47 = *(void **)(v46 + 40);
      *(_QWORD *)(v46 + 40) = v45;

      objc_msgSend(v54, "goalLineYValue");
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v50 = *(void **)(v49 + 40);
      *(_QWORD *)(v49 + 40) = v48;

    }
    objc_msgSend(v54, "goalLineYValue");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v53 = *(void **)(v52 + 40);
    *(_QWORD *)(v52 + 40) = v51;

  }
}

- (void)addGoalLinePathsToCoordinate:(id)a3 goalLinePath:(id)a4 goalLineMarkerPoints:(id)a5 previousCoordinateGoal:(id)a6 axisRect:(CGRect)a7
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  id v23;

  v23 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v23, "goalLineYValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v23, "startXValue");
    v14 = v13;
    objc_msgSend(v23, "goalLineYValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    if (a6)
      objc_msgSend(v10, "addLineToPoint:", v14, v16);
    else
      objc_msgSend(v10, "moveToPoint:", v14, v16);

    v17 = (void *)MEMORY[0x1E0CB3B18];
    objc_msgSend(v23, "startXValue");
    v19 = v18;
    objc_msgSend(v23, "goalLineYValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValue");
    objc_msgSend(v17, "valueWithCGPoint:", v19, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v22);

  }
}

- (BOOL)_currentGoal:(id)a3 differentFrom:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v5 = a4;
  objc_msgSend(a3, "doubleValue");
  v7 = v6;
  objc_msgSend(v5, "doubleValue");
  v9 = v8;

  return vabdd_f64(v7, v9) >= 0.000001;
}

- (void)_drawGoalLinePath:(id)a3 context:(CGContext *)a4
{
  id v6;
  void *v7;
  id v8;
  const CGPath *v9;

  v6 = a3;
  CGContextSaveGState(a4);
  -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyToContext:", a4);

  v8 = objc_retainAutorelease(v6);
  v9 = (const CGPath *)objc_msgSend(v8, "CGPath");

  CGContextAddPath(a4, v9);
  CGContextStrokePath(a4);
  CGContextRestoreGState(a4);
}

- (void)_drawGoalLineMarkers:(id)a3 context:(CGContext *)a4 goalLineMarkerImage:(id)a5
{
  id v7;
  id v8;
  CGImage *v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_retainAutorelease(a5);
  v9 = (CGImage *)objc_msgSend(v8, "CGImage");
  v10 = HKChartSeriesPointMarkerBaseRect(v8);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v27;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v21), "CGPointValue", (_QWORD)v26);
        v23 = v22;
        v25 = v24;
        v32.origin.x = v10;
        v32.origin.y = v12;
        v32.size.width = v14;
        v32.size.height = v16;
        v33 = CGRectOffset(v32, v23, v25);
        CGContextDrawImage(a4, v33, v9);
        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v19);
  }

}

- (void)_drawPaths:(id)a3 withFillStyles:(id)a4 strokeStyle:(id)a5 axisRect:(CGRect)a6 context:(CGContext *)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  id v24;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v24 = a3;
  v15 = a4;
  v16 = a5;
  v17 = objc_msgSend(v24, "count");
  if (v17 - 1 >= 0)
  {
    v18 = v17;
    do
    {
      objc_msgSend(v24, "objectAtIndexedSubscript:", --v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v19, "isEmpty") & 1) == 0
        && !-[HKSleepDurationSeries _dataIsHidden:](self, "_dataIsHidden:", v18))
      {
        if (v16)
        {
          CGContextSaveGState(a7);
          objc_msgSend(v16, "applyToContext:", a7);
          CGContextAddPath(a7, (CGPathRef)objc_msgSend(objc_retainAutorelease(v19), "CGPath"));
          CGContextStrokePath(a7);
          CGContextRestoreGState(a7);
        }
        if (v18 < (unint64_t)objc_msgSend(v15, "count"))
        {
          objc_msgSend(v15, "objectAtIndexedSubscript:", v18);
          v20 = objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v21 = (void *)v20;
            v22 = objc_msgSend(objc_retainAutorelease(v19), "CGPath");
            -[HKGraphSeries alpha](self, "alpha");
            objc_msgSend(v21, "renderPath:context:axisRect:alpha:", v22, a7, x, y, width, height, v23);

          }
        }
      }

    }
    while (v18 > 0);
  }

}

- (BOOL)_dataIsHidden:(int64_t)a3
{
  if (a3 == 1)
    return -[HKSleepDurationSeries hideInBedData](self, "hideInBedData");
  if (a3)
    return 0;
  return -[HKSleepDurationSeries hideAsleepData](self, "hideAsleepData");
}

- (void)_addAnnotationForValue:(double)a3 axisAnnotationDelegate:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v6 = a4;
    -[HKGraphSeries seriesDataSourceContext](self, "seriesDataSourceContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "chartType");
    v9 = &stru_1E9C4C428;
    if (v8 <= 6 && ((1 << v8) & 0x65) != 0)
    {
      -[HKSleepDurationSeries _stringForDuration:](self, "_stringForDuration:", a3);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v16[0] = *MEMORY[0x1E0DC1140];
    -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "strokeColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v16[1] = *MEMORY[0x1E0DC1138];
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addAxisAnnotation:forSeries:modelCoordinate:", v14, self, v15);

  }
}

- (void)_addGoalAnnotationAtLocation:(double)a3 axisAnnotationDelegate:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB34D0];
  v7 = a4;
  objc_msgSend(v6, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SLEEP_MULTIPLE_GOAL_AXIS"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Eucalyptus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = *MEMORY[0x1E0DC1140];
  -[HKSleepDurationSeries goalLineStrokeStyle](self, "goalLineStrokeStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "strokeColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v16[1] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v9, v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAxisAnnotation:forSeries:modelCoordinate:", v14, self, v15);

}

- (id)_durationAbbreviatedFormatter
{
  if (_durationAbbreviatedFormatter_onceToken != -1)
    dispatch_once(&_durationAbbreviatedFormatter_onceToken, &__block_literal_global_37);
  return (id)_durationAbbreviatedFormatter___formatter;
}

uint64_t __54__HKSleepDurationSeries__durationAbbreviatedFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_durationAbbreviatedFormatter___formatter;
  _durationAbbreviatedFormatter___formatter = (uint64_t)v0;

  objc_msgSend((id)_durationAbbreviatedFormatter___formatter, "setUnitsStyle:", 1);
  return objc_msgSend((id)_durationAbbreviatedFormatter___formatter, "setAllowedUnits:", 96);
}

- (id)_durationShortFormatter
{
  if (_durationShortFormatter_onceToken != -1)
    dispatch_once(&_durationShortFormatter_onceToken, &__block_literal_global_246);
  return (id)_durationShortFormatter___formatter;
}

uint64_t __48__HKSleepDurationSeries__durationShortFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v1 = (void *)_durationShortFormatter___formatter;
  _durationShortFormatter___formatter = (uint64_t)v0;

  objc_msgSend((id)_durationShortFormatter___formatter, "setUnitsStyle:", 2);
  return objc_msgSend((id)_durationShortFormatter___formatter, "setAllowedUnits:", 96);
}

- (id)_stringForDuration:(double)a3
{
  void *v4;
  void *v5;

  if (__ROR8__(0xFEDCBA987654321 * llround(a3) + 0x91A2B3C4D5E6F0, 4) <= 0x123456789ABCDEuLL)
    -[HKSleepDurationSeries _durationShortFormatter](self, "_durationShortFormatter");
  else
    -[HKSleepDurationSeries _durationAbbreviatedFormatter](self, "_durationAbbreviatedFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromTimeInterval:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (UIImage)goalLineMarkerImageStorage
{
  return self->_goalLineMarkerImageStorage;
}

- (void)setGoalLineMarkerImageStorage:(id)a3
{
  objc_storeStrong((id *)&self->_goalLineMarkerImageStorage, a3);
}

- (NSArray)defaultFillStylesStorage
{
  return self->_defaultFillStylesStorage;
}

- (void)setDefaultFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (NSArray)highlightedFillStylesStorage
{
  return self->_highlightedFillStylesStorage;
}

- (void)setHighlightedFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (NSArray)inactiveFillStylesStorage
{
  return self->_inactiveFillStylesStorage;
}

- (void)setInactiveFillStylesStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (HKStrokeStyle)goalLineStrokeStyleStorage
{
  return self->_goalLineStrokeStyleStorage;
}

- (void)setGoalLineStrokeStyleStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (HKLineSeriesPointMarkerStyle)goalLineMarkerStyleStorage
{
  return self->_goalLineMarkerStyleStorage;
}

- (void)setGoalLineMarkerStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_goalLineMarkerStyleStorage, a3);
}

- (BOOL)extendGoalLineToAxisStorage
{
  return self->_extendGoalLineToAxisStorage;
}

- (void)setExtendGoalLineToAxisStorage:(BOOL)a3
{
  self->_extendGoalLineToAxisStorage = a3;
}

- (id)startOfDayTransformStorage
{
  return self->_startOfDayTransformStorage;
}

- (void)setStartOfDayTransformStorage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (BOOL)hideInBedDataStorage
{
  return self->_hideInBedDataStorage;
}

- (void)setHideInBedDataStorage:(BOOL)a3
{
  self->_hideInBedDataStorage = a3;
}

- (BOOL)hideAsleepDataStorage
{
  return self->_hideAsleepDataStorage;
}

- (void)setHideAsleepDataStorage:(BOOL)a3
{
  self->_hideAsleepDataStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startOfDayTransformStorage, 0);
  objc_storeStrong((id *)&self->_goalLineMarkerStyleStorage, 0);
  objc_storeStrong((id *)&self->_goalLineStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_inactiveFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_highlightedFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_defaultFillStylesStorage, 0);
  objc_storeStrong((id *)&self->_goalLineMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
