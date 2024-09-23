@implementation _HKCompoundBlockCoordinateList

- (_HKCompoundBlockCoordinateList)initWithSubCoordinates:(id)a3 chartableValueRange:(id)a4
{
  id v7;
  id v8;
  _HKCompoundBlockCoordinateList *v9;
  _HKCompoundBlockCoordinateList *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HKCompoundBlockCoordinateList;
  v9 = -[_HKCompoundBlockCoordinateList init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_subCoordinates, a3);
    objc_storeStrong((id *)&v10->_chartableValueRange, a4);
  }

  return v10;
}

- (void)enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4 block:(id)a5
{
  _BOOL8 v6;
  HKValueRange *chartableValueRange;
  __int128 v8;
  _OWORD v9[3];

  v6 = a4;
  chartableValueRange = self->_chartableValueRange;
  v8 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a3->tx;
  -[_HKCompoundBlockCoordinateList _enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:](self, "_enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:", v9, chartableValueRange, v6, a5);
}

- (void)_enumerateCoordinatesWithTransform:(CGAffineTransform *)a3 chartableValueRange:(id)a4 roundToViewScale:(BOOL)a5 block:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  _OWORD v18[3];
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v7 = a5;
  v31 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v12 = self->_subCoordinates;
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v27;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v12);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __112___HKCompoundBlockCoordinateList__enumerateCoordinatesWithTransform_chartableValueRange_roundToViewScale_block___block_invoke;
      v19[3] = &unk_1E9C43D90;
      v20 = v11;
      v21 = &v22;
      v17 = *(_OWORD *)&a3->c;
      v18[0] = *(_OWORD *)&a3->a;
      v18[1] = v17;
      v18[2] = *(_OWORD *)&a3->tx;
      objc_msgSend(v16, "_enumerateCoordinatesWithTransform:chartableValueRange:roundToViewScale:block:", v18, v10, v7, v19);
      LOBYTE(v16) = *((_BYTE *)v23 + 24) == 0;

      _Block_object_dispose(&v22, 8);
      if ((v16 & 1) == 0)
        break;
      if (v13 == ++v15)
      {
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)_coordinatesInChartableRange:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_subCoordinates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "_coordinatesInChartableRange:", v4, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)coordinates
{
  return -[_HKCompoundBlockCoordinateList _coordinatesInChartableRange:](self, "_coordinatesInChartableRange:", self->_chartableValueRange);
}

- (int64_t)numCoordinates
{
  return -[_HKCompoundBlockCoordinateList _numCoordinatesInChartableRange:](self, "_numCoordinatesInChartableRange:", self->_chartableValueRange);
}

- (int64_t)_numCoordinatesInChartableRange:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_subCoordinates;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "_numCoordinatesInChartableRange:", v4, (_QWORD)v12);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HKGraphSeriesDataBlockPath)blockPathStart
{
  void *v4;
  HKGraphSeriesDataBlockPath *result;
  void *v6;

  -[NSArray firstObject](self->_subCoordinates, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "blockPathStart");
    v4 = v6;
  }
  else
  {
    retstr->index = 0;
    retstr->zoom = 0;
    retstr->resolution = 0;
  }

  return result;
}

- (HKGraphSeriesDataBlockPath)blockPathEnd
{
  void *v4;
  HKGraphSeriesDataBlockPath *result;
  void *v6;

  -[NSArray lastObject](self->_subCoordinates, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "blockPathEnd");
    v4 = v6;
  }
  else
  {
    retstr->index = 0;
    retstr->zoom = 0;
    retstr->resolution = 0;
  }

  return result;
}

- (id)firstCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  __int128 v4;
  NSArray *subCoordinates;
  id v6;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v15 = 0x3032000000;
  v8[1] = 3221225472;
  v11 = *(_OWORD *)&a3->tx;
  v4 = *(_OWORD *)&a3->a;
  v10 = *(_OWORD *)&a3->c;
  v13 = 0;
  v14 = &v13;
  subCoordinates = self->_subCoordinates;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v8[0] = MEMORY[0x1E0C809B0];
  v18 = 0;
  v8[2] = __80___HKCompoundBlockCoordinateList_firstCoordinateWithTransform_roundToViewScale___block_invoke;
  v8[3] = &unk_1E9C43DB8;
  v8[4] = &v13;
  v9 = v4;
  v12 = a4;
  -[NSArray enumerateObjectsUsingBlock:](subCoordinates, "enumerateObjectsUsingBlock:", v8);
  v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (id)lastCoordinateWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  __int128 v4;
  NSArray *subCoordinates;
  id v6;
  _QWORD v8[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v15 = 0x3032000000;
  v8[1] = 3221225472;
  v11 = *(_OWORD *)&a3->tx;
  v4 = *(_OWORD *)&a3->a;
  v10 = *(_OWORD *)&a3->c;
  v13 = 0;
  v14 = &v13;
  subCoordinates = self->_subCoordinates;
  v16 = __Block_byref_object_copy__15;
  v17 = __Block_byref_object_dispose__15;
  v8[0] = MEMORY[0x1E0C809B0];
  v18 = 0;
  v8[2] = __79___HKCompoundBlockCoordinateList_lastCoordinateWithTransform_roundToViewScale___block_invoke;
  v8[3] = &unk_1E9C43DB8;
  v8[4] = &v13;
  v9 = v4;
  v12 = a4;
  -[NSArray enumerateObjectsWithOptions:usingBlock:](subCoordinates, "enumerateObjectsWithOptions:usingBlock:", 2, v8);
  v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chartableValueRange, 0);
  objc_storeStrong((id *)&self->_subCoordinates, 0);
}

@end
