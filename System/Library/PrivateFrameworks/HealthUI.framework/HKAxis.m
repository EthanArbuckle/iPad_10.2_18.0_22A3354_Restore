@implementation HKAxis

- (HKAxis)initWithConfiguration:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  HKScalarZoomScale *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  HKAxisLabelCache *v23;
  id WeakRetained;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  HKValueRange *v30;
  void *v31;
  objc_super v33;

  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)HKAxis;
  v5 = -[HKAxis init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "preferredStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      +[HKAxisStyle defaultStyle](HKAxisStyle, "defaultStyle");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v8;

    *((_QWORD *)v5 + 3) = objc_msgSend(v4, "maxLabels");
    *((_QWORD *)v5 + 4) = objc_msgSend(v4, "minLabels");
    objc_msgSend(v4, "maxLabelWidth");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v10;

    *((_QWORD *)v5 + 6) = (id)objc_msgSend(v4, "horizontalAxisLabelSpacePadding");
    objc_msgSend(v4, "transform");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = v12;
    else
      v14 = (id)objc_opt_new();
    v15 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v14;

    objc_msgSend(v4, "zoomScaleEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
      v18 = v16;
    else
      v18 = objc_alloc_init(HKScalarZoomScale);
    v19 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v18;

    objc_msgSend(v4, "labelDataSource");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v20)
      v22 = (void *)v20;
    else
      v22 = v5;
    objc_storeWeak((id *)v5 + 9, v22);

    v5[8] = objc_msgSend(v4, "overrideNoTopBaseline");
    v5[9] = objc_msgSend(v4, "axisAnnotationsExcludeInterstitialAxisLabels");
    v23 = [HKAxisLabelCache alloc];
    WeakRetained = objc_loadWeakRetained((id *)v5 + 9);
    v25 = -[HKAxisLabelCache initWithLabelDataSource:](v23, "initWithLabelDataSource:", WeakRetained);
    v26 = (void *)*((_QWORD *)v5 + 10);
    *((_QWORD *)v5 + 10) = v25;

    v27 = objc_alloc_init(MEMORY[0x1E0CB3740]);
    v28 = (void *)*((_QWORD *)v5 + 11);
    *((_QWORD *)v5 + 11) = v27;

    objc_msgSend(*((id *)v5 + 11), "setName:", CFSTR("HKAxisMutableStateLock"));
    v29 = (void *)*((_QWORD *)v5 + 12);
    *((_QWORD *)v5 + 12) = 0;

    *((_QWORD *)v5 + 13) = 0;
    v5[10] = 1;
    *(_OWORD *)(v5 + 120) = HKLinearTransformIdentity;
    v30 = objc_alloc_init(HKValueRange);
    v31 = (void *)*((_QWORD *)v5 + 14);
    *((_QWORD *)v5 + 14) = v30;

  }
  return (HKAxis *)v5;
}

- (BOOL)isEqual:(id)a3
{
  HKAxis *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (HKAxis *)a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()))
    v6 = v4 == self || -[HKAxis isEqualToAxis:](self, "isEqualToAxis:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqualToAxis:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v23;

  v4 = a3;
  if (v4)
  {
    v5 = objc_opt_class();
    if (v5 != objc_opt_class())
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Not same type of axis"), 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v23);
    }
    v6 = objc_msgSend(v4, "maxLabels");
    if (v6 == -[HKAxis maxLabels](self, "maxLabels"))
    {
      v7 = objc_msgSend(v4, "minLabels");
      v8 = v7 == -[HKAxis minLabels](self, "minLabels");
    }
    else
    {
      v8 = 0;
    }
    -[HKAxis transform](self, "transform");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transform");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {
      v15 = 1;
    }
    else
    {
      -[HKAxis transform](self, "transform");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v4, "transform");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAxis transform](self, "transform");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

      }
      else
      {
        v15 = 0;
      }

    }
    -[HKAxis zoomScaleEngine](self, "zoomScaleEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zoomScaleEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {
      v21 = 1;
    }
    else
    {
      -[HKAxis zoomScaleEngine](self, "zoomScaleEngine");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        objc_msgSend(v4, "zoomScaleEngine");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKAxis zoomScaleEngine](self, "zoomScaleEngine");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

      }
      else
      {
        v21 = 0;
      }

    }
    v9 = v15 & v8 & v21;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSMutableArray)axisAnnotations
{
  void *v4;
  NSMutableArray *v5;
  void *v6;
  void *v8;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  if (self->_axisAnnotationsStorage && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAxis.m"), 223, CFSTR("Axis annotations may only be accessed on the main thread"));

  }
  v5 = self->_axisAnnotationsStorage;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  return v5;
}

- (void)setAxisAnnotations:(id)a3
{
  NSMutableArray *v5;
  void *v6;
  NSMutableArray *axisAnnotationsStorage;
  void *v8;
  id v9;

  v5 = (NSMutableArray *)a3;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  if (v5 && (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAxis.m"), 235, CFSTR("Axis annotations may only be set from the main thread"));

  }
  axisAnnotationsStorage = self->_axisAnnotationsStorage;
  self->_axisAnnotationsStorage = v5;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlock");

}

- (BOOL)requiresScaling
{
  void *v3;
  void *v4;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  LOBYTE(v3) = self->_requiresScalingStorage;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlock");

  return (char)v3;
}

- (int64_t)axisLabelEndings
{
  void *v3;
  int64_t v4;
  void *v5;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_axisLabelEndingsStorage != 0;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setAxisLabelEndings:(int64_t)a3
{
  void *v5;
  id v6;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  self->_axisLabelEndingsStorage = a3;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

}

- (HKLinearTransform)pointTransform
{
  void *v3;
  double offset;
  double scale;
  void *v6;
  double v7;
  double v8;
  HKLinearTransform result;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  offset = self->_pointTransformStorage.offset;
  scale = self->_pointTransformStorage.scale;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unlock");

  v7 = offset;
  v8 = scale;
  result.scale = v8;
  result.offset = v7;
  return result;
}

- (void)setPointTransform:(HKLinearTransform)a3
{
  double scale;
  double offset;
  void *v6;
  id v7;

  scale = a3.scale;
  offset = a3.offset;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lock");

  self->_pointTransformStorage.offset = offset;
  self->_pointTransformStorage.scale = scale;
  self->_requiresScalingStorage = 0;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKValueRange)axisChartableValueRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[HKValueRange minValue](self->_axisChartableValueRangeStorage, "minValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange maxValue](self->_axisChartableValueRangeStorage, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

  return (HKValueRange *)v6;
}

- (void)setAxisChartableValueRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HKValueRange *v8;
  HKValueRange *axisChartableValueRangeStorage;
  id v10;

  v4 = a3;
  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  objc_msgSend(v4, "minValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v6, v7);
  v8 = (HKValueRange *)objc_claimAutoreleasedReturnValue();
  axisChartableValueRangeStorage = self->_axisChartableValueRangeStorage;
  self->_axisChartableValueRangeStorage = v8;

  -[HKAxis axisMutableStateLock](self, "axisMutableStateLock");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unlock");

}

- (HKLinearTransform)pointTransformFittingValueRange:(id)a3 toChartRange:(HKRange)a4
{
  double var1;
  double var0;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  HKLinearTransform result;

  var1 = a4.var1;
  var0 = a4.var0;
  v7 = a3;
  -[HKAxis transform](self, "transform");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "coordinateForValue:", v9);
  v11 = v10;

  -[HKAxis transform](self, "transform");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "maxValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "coordinateForValue:", v13);
  v15 = v14;

  v16 = var1 / (v15 - v11);
  if (v15 - v11 <= 0.00000011920929)
    v16 = 0.0;
  v17 = var0 - v16 * v11;
  result.scale = v16;
  result.offset = v17;
  return result;
}

- (HKLinearTransform)_pointTransformFromSeriesRanges:(id)a3 linearTransform:(HKLinearTransform)a4 chartRange:(HKRange)a5
{
  double var1;
  double var0;
  double scale;
  double offset;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  HKLinearTransform result;

  var1 = a5.var1;
  var0 = a5.var0;
  scale = a4.scale;
  offset = a4.offset;
  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "unionRange:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16++), (_QWORD)v24);
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v14);
  }

  -[HKAxis adjustedRangeForFittedRange:chartRange:](self, "adjustedRangeForFittedRange:chartRange:", v11, var0, var1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis pointTransformFittingValueRange:toChartRange:](self, "pointTransformFittingValueRange:toChartRange:", v17, var0, var1);
  v19 = v18;
  v21 = v20;

  v22 = scale * v21;
  v23 = offset + v19 * scale;
  result.scale = v22;
  result.offset = v23;
  return result;
}

- (id)axisLabelsInModelRangeFromCache:(id)a3 zoomScale:(double)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[HKAxis extendModelRangeWithRange:zoomScale:](self, "extendModelRangeWithRange:zoomScale:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis axisLabelCache](self, "axisLabelCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allAxisLabelsForRange:zoomScale:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAxis.m"), 340, CFSTR("No implementation for cacheKeysForModelRange"));

  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKAxis.m"), 346, CFSTR("No implementation for findAxisLabelsInChartRange"));

  return 0;
}

- (id)adjustValueRangeForLabels:(id)a3
{
  return a3;
}

- (int64_t)_axisLabelCountWithTextInModelRange:(id)a3 zoomScale:(double)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[HKAxis axisLabelsInModelRangeFromCache:zoomScale:](self, "axisLabelsInModelRangeFromCache:zoomScale:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)enumerateTickCoordinatesInModelRange:(id)a3 zoomScale:(double)a4 handler:(id)a5
{
  void (**v8)(id, void *, uint64_t, void *, _BYTE *, double);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(id, void *, uint64_t, void *, _BYTE *, double))a5;
  -[HKAxis axisLabelsInModelRangeFromCache:zoomScale:](self, "axisLabelsInModelRangeFromCache:zoomScale:", a3, a4);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v28;
LABEL_3:
    v13 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v12)
        objc_enumerationMutation(v9);
      v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v13);
      -[HKAxis pointTransform](self, "pointTransform");
      v16 = v15;
      v18 = v17;
      -[HKAxis transform](self, "transform");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "location");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "coordinateForValue:", v20);
      v22 = v16 + v21 * v18;

      v26 = 0;
      objc_msgSend(v14, "location");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v14, "labelType");
      objc_msgSend(v14, "text");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, v23, v24, v25, &v26, v22);

      if (v26)
        break;
      if (v11 == ++v13)
      {
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (id)extendModelRangeWithRange:(id)a3 zoomScale:(double)a4
{
  return a3;
}

- (id)adjustedRangeForFittedRange:(id)a3 chartRange:(HKRange)a4
{
  return a3;
}

- (double)_axisOffsetWithStyle:(id)a3 chartRect:(CGRect)a4 horizontalAlignmentOut:(int64_t *)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  double MinY;
  double v12;
  double v13;
  int64_t v14;
  double MinX;
  double v16;
  double MaxY;
  double v18;
  void *v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  switch(objc_msgSend(v10, "location"))
  {
    case 0:
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      MinY = CGRectGetMinY(v21);
      objc_msgSend(v10, "fillOuterPadding");
      v13 = MinY + v12;
      v14 = 1;
      break;
    case 1:
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      MinX = CGRectGetMinX(v22);
      objc_msgSend(v10, "fillInnerPadding");
      goto LABEL_7;
    case 2:
      v23.origin.x = x;
      v23.origin.y = y;
      v23.size.width = width;
      v23.size.height = height;
      MaxY = CGRectGetMaxY(v23);
      objc_msgSend(v10, "fillOuterPadding");
      v13 = MaxY - v18;
      objc_msgSend(v10, "labelStyle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v19, "horizontalAlignment");

      break;
    case 3:
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      MinX = CGRectGetMinX(v24);
      objc_msgSend(v10, "fillOuterPadding");
LABEL_7:
      v14 = 0;
      v13 = MinX + v16;
      break;
    default:
      v14 = 0;
      v13 = 0.0;
      break;
  }
  if (a5)
    *a5 = v14;

  return v13;
}

- (CGRect)labelRectWithModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  -[HKAxis preferredStyle](self, "preferredStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis axisLabelsInModelRangeFromCache:zoomScale:](self, "axisLabelsInModelRangeFromCache:zoomScale:", v11, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAxis axisAnnotations](self, "axisAnnotations");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[HKAxis axisAnnotations](self, "axisAnnotations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxis _maximumWidthOfAnnotations:axisStyle:](self, "_maximumWidthOfAnnotations:axisStyle:", v15, v12);
    v17 = v16;

  }
  else
  {
    v17 = 0.0;
  }
  objc_msgSend(v12, "labelStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "font");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis _labelBackgroundRectWithLabels:font:maxAnnotationWidth:rect:style:](self, "_labelBackgroundRectWithLabels:font:maxAnnotationWidth:rect:style:", v13, v19, v12, v17, x, y, width, height);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)drawLabelsWithModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7 maximumLabelSize:(CGSize *)a8 omitOffscreenLabels:(BOOL)a9
{
  _BOOL8 v9;
  double y;
  double x;
  double height;
  double width;
  double v16;
  double v17;
  id v20;
  id v21;
  id v22;

  v9 = a9;
  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v16 = a4.origin.y;
  v17 = a4.origin.x;
  v20 = a7;
  v21 = a3;
  -[HKAxis preferredStyle](self, "preferredStyle");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  -[HKAxis _drawTextForModelRange:inRect:zoomScale:contentOffset:renderView:style:maximumLabelSize:omitOffscreenLabels:](self, "_drawTextForModelRange:inRect:zoomScale:contentOffset:renderView:style:maximumLabelSize:omitOffscreenLabels:", v21, v20, v22, a8, v9, v17, v16, width, height, a5, x, y);

}

- (void)drawBaselineForModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7
{
  double y;
  double x;
  double height;
  double width;
  double v13;
  double v14;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v13 = a4.origin.y;
  v14 = a4.origin.x;
  v22 = a3;
  v16 = a7;
  -[HKAxis preferredStyle](self, "preferredStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "showGridLines"))
  {
    -[HKAxis _baselineForModelRange:axisRect:zoomScale:contentOffset:style:](self, "_baselineForModelRange:axisRect:zoomScale:contentOffset:style:", v22, v17, v14, v13, width, height, a5, x, y);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "gridLineStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "strokeColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v21) = 0;
    objc_msgSend(v16, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v18, v20, 0, 0, 0, 0, v21);

  }
}

- (void)drawGridlinesForModelRange:(id)a3 chartRect:(CGRect)a4 gridlineRanges:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 renderView:(id)a8 blendMode:(int)a9
{
  uint64_t v9;
  double y;
  double x;
  double height;
  double width;
  double v17;
  double v18;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;

  v9 = *(_QWORD *)&a9;
  y = a7.y;
  x = a7.x;
  height = a4.size.height;
  width = a4.size.width;
  v17 = a4.origin.y;
  v18 = a4.origin.x;
  v36 = a3;
  v20 = a5;
  v21 = a8;
  -[HKAxis preferredStyle](self, "preferredStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "showGridLines"))
  {
    objc_msgSend(v22, "minorGridLineStyle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[HKAxis _gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:](self, "_gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:", v36, v20, v22, 2, v18, v17, width, height, a6, x, y);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "minorGridLineStyle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "strokeColor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v35) = 0;
      objc_msgSend(v21, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v24, v26, 0, 0, 0, v9, v35);

    }
    objc_msgSend(v22, "gridLineStyle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[HKAxis _gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:](self, "_gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:", v36, v20, v22, 1, v18, v17, width, height, a6, x, y);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "gridLineStyle");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "strokeColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v35) = 0;
      objc_msgSend(v21, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v28, v30, 0, 0, 0, v9, v35);

    }
    objc_msgSend(v22, "referenceGridLineStyle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      -[HKAxis _gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:](self, "_gridLinesForModelRange:axisRect:gridlineRanges:zoomScale:contentOffset:style:gridLineType:", v36, v20, v22, 0, v18, v17, width, height, a6, x, y);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "referenceGridLineStyle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "strokeColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v35) = 0;
      objc_msgSend(v21, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v32, v34, 0, 0, 0, v9, v35);

    }
  }

}

- (BOOL)_styleIsHorizontal:(id)a3
{
  return (objc_msgSend(a3, "location") & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

- (HKRange)_chartRangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5
{
  double x;
  CGFloat height;
  double width;
  CGFloat y;
  CGFloat v10;
  HKAxis *v11;
  void *v12;
  CGFloat v13;
  double v14;
  HKRange result;
  CGRect v16;

  x = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v10 = a3.origin.x;
  v11 = self;
  -[HKAxis preferredStyle](self, "preferredStyle", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a5.x, a5.y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = -[HKAxis _styleIsHorizontal:](v11, "_styleIsHorizontal:", v12);

  if ((_DWORD)v11)
  {
    v13 = x / a4;
    v14 = width / a4 + -2.22507386e-308;
    if (v14 < 0.0)
      v14 = 0.0;
  }
  else
  {
    v16.origin.x = v10;
    v16.origin.y = y;
    v16.size.width = width;
    v16.size.height = height;
    v13 = CGRectGetHeight(v16);
    v14 = -v13;
  }
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)_offsetForChartRect:(CGRect)a3 chartRange:(HKRange)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6
{
  double var1;
  double var0;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  HKAxis *v15;
  double *v16;
  void *v17;
  CGFloat v18;
  double v19;
  void *v20;
  NSObject *v21;
  void *v22;
  CGFloat v23;
  int v24;
  void *v25;
  uint64_t v26;
  CGRect v27;

  var1 = a4.var1;
  var0 = a4.var0;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = self;
  v26 = *MEMORY[0x1E0C80C00];
  v16 = (double *)MEMORY[0x1E0C9D538];
  -[HKAxis preferredStyle](self, "preferredStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v15) = -[HKAxis _styleIsHorizontal:](v15, "_styleIsHorizontal:", v17);

  if ((_DWORD)v15)
  {
    v18 = 1.0;
    if (var1 > 0.0 && a5)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      v18 = CGRectGetWidth(v27) / var1;
    }
    v19 = var0 * v18;
  }
  else
  {
    v19 = *v16;
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB52C0];
    v18 = 1.0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 138543362;
      v25 = v22;
      _os_log_impl(&dword_1D7813000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ called on vertical axis. This was probably not intentional", (uint8_t *)&v24, 0xCu);

    }
  }
  if (a5)
    *a5 = v18;
  if (a6)
  {
    v23 = v16[1];
    a6->x = v19;
    a6->y = v23;
  }
}

- (id)rangeForChartRect:(CGRect)a3 zoomScale:(double)a4 contentOffset:(CGPoint)a5
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[HKAxis _chartRangeForChartRect:zoomScale:contentOffset:](self, "_chartRangeForChartRect:zoomScale:contentOffset:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a5.x, a5.y);
  v7 = v6;
  v9 = v8;
  -[HKAxis pointTransform](self, "pointTransform");
  v12 = -v10 / v11;
  v13 = 1.0 / v11;
  v14 = v12 + v7 * v13;
  v15 = v9 * v13;
  -[HKAxis transform](self, "transform");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "valueForCoordinate:", HKRangeMin(v14, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAxis transform](self, "transform");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "valueForCoordinate:", HKRangeMax(v14, v15));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)offsetForValueRange:(id)a3 chartRect:(CGRect)a4 zoomScaleOut:(double *)a5 contentOffsetOut:(CGPoint *)a6
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  objc_msgSend(v13, "minValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  objc_msgSend(v13, "maxValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "doubleValue");
  v19 = v18;

  -[HKAxis pointTransform](self, "pointTransform");
  v22 = (v19 - v16) * v21;
  if (v22 > 0.0)
    -[HKAxis _offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:](self, "_offsetForChartRect:chartRange:zoomScaleOut:contentOffsetOut:", a5, a6, x, y, width, height, v20 + v16 * v21, v22);
}

- (int64_t)dateZoomForZoomScale:(double)a3
{
  return 5;
}

- (void)_drawTextForModelRange:(id)a3 inRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 renderView:(id)a7 style:(id)a8 maximumLabelSize:(CGSize *)a9 omitOffscreenLabels:(BOOL)a10
{
  double height;
  double width;
  double y;
  double x;
  void *v16;
  _BOOL8 v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v25;
  void *v26;
  BOOL v27;
  HKAxisExclusion *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  float64x2_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  BOOL v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  id v59;
  HKAxisExclusion *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v67;
  id v68;
  id v69;
  double v70;
  id v73;
  float64_t v75;
  float64_t v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  HKAxisExclusion *v82;
  id v83;
  uint64_t *v84;
  uint64_t *v85;
  double v86;
  double v87;
  double v88;
  double v89;
  uint64_t v90;
  uint64_t v91;
  BOOL v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  float64x2_t *v106;
  uint64_t v107;
  void *v108;
  CGSize v109;
  uint64_t v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v113 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v73 = a7;
  v69 = a8;
  objc_msgSend(v69, "labelStyle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HKAxis _styleIsHorizontal:](self, "_styleIsHorizontal:", v69);
    objc_msgSend(v69, "labelStyle");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "hyphenationFactor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v67, "verticalAlignment");
    objc_msgSend(v67, "textColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "font");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v110 = 0;
    -[HKAxis _axisOffsetWithStyle:chartRect:horizontalAlignmentOut:](self, "_axisOffsetWithStyle:chartRect:horizontalAlignmentOut:", v69, &v110, x, y, width, height);
    v70 = v19;
    v105 = 0;
    v106 = (float64x2_t *)&v105;
    v107 = 0x3010000000;
    v108 = &unk_1D7BC951A;
    v109 = *a9;
    v20 = v110;
    if (v110)
      v21 = 0;
    else
      v21 = v17;
    if (v21)
    {
      objc_msgSend(v69, "fillInnerPadding");
      v23 = v22;
      v20 = v110;
    }
    else
    {
      v23 = 0.0;
    }
    if (v20 == 2 && v17)
    {
      objc_msgSend(v69, "fillInnerPadding");
      v23 = -v25;
    }
    -[HKAxis _drawTextBackgroundWithRect:style:renderView:](self, "_drawTextBackgroundWithRect:style:renderView:", v69, v73, x, y, width, height);
    -[HKAxis axisAnnotations](self, "axisAnnotations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26 == 0;

    if (v27)
    {
      v28 = 0;
    }
    else
    {
      v28 = objc_alloc_init(HKAxisExclusion);
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      -[HKAxis axisAnnotations](self, "axisAnnotations");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v30; ++i)
          {
            if (*(_QWORD *)v102 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
            objc_msgSend(v33, "annotationText");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = v34 == 0;

            if (!v35)
            {
              -[HKAxis labelDataSource](self, "labelDataSource");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "position");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:", v37, v17, x, y, width, height, a5, a6.x, a6.y, v70, *(_QWORD *)&v23, 0);
              v39 = v38;
              v41 = v40;

              objc_msgSend(v33, "annotationText");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v73, "drawAttributedText:atPoint:axisRect:horizontalAlignment:verticalAlignment:exclusion:", v42, v110, v18, v28, v39, v41, x, y, width, height);
              v75 = v44;
              v76 = v43;

              v45.f64[0] = v76;
              v45.f64[1] = v75;
              v106[2] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v45, v106[2]), (int8x16_t)v45, (int8x16_t)v106[2]);
            }
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v101, v112, 16);
        }
        while (v30);
      }

    }
    if (-[HKAxis axisAnnotationsExcludeInterstitialAxisLabels](self, "axisAnnotationsExcludeInterstitialAxisLabels"))
      -[HKAxisExclusion unifyExclusion](v28, "unifyExclusion");
    v46 = (void *)CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
    v97 = 0;
    v98 = &v97;
    v99 = 0x2020000000;
    v100 = 0;
    -[HKAxis axisLabelsInModelRangeFromCache:zoomScale:](self, "axisLabelsInModelRangeFromCache:zoomScale:", v68, a5);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v48 = v47;
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
    if (v49)
    {
      v50 = *(_QWORD *)v94;
      do
      {
        for (j = 0; j != v49; ++j)
        {
          if (*(_QWORD *)v94 != v50)
            objc_enumerationMutation(v48);
          if (v17)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v93 + 1) + 8 * j), "text");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "rangeOfCharacterFromSet:", v46) != 0x7FFFFFFFFFFFFFFFLL
               || *((_BYTE *)v98 + 24) != 0;
            *((_BYTE *)v98 + 24) = v53;

          }
        }
        v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v93, v111, 16);
      }
      while (v49);
    }

    objc_msgSend(v69, "gridLineStyle");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "lineWidth");
    v56 = v55;
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __118__HKAxis__drawTextForModelRange_inRect_zoomScale_contentOffset_renderView_style_maximumLabelSize_omitOffscreenLabels___block_invoke;
    v77[3] = &unk_1E9C45EC0;
    v92 = a10;
    v86 = x;
    v87 = y;
    v88 = width;
    v89 = height;
    v78 = v73;
    v90 = v110;
    v91 = v18;
    v57 = v64;
    v79 = v57;
    v58 = v63;
    v80 = v58;
    v59 = v62;
    v81 = v59;
    v60 = v28;
    v82 = v60;
    v61 = v67;
    v83 = v61;
    v84 = &v97;
    v85 = &v105;
    -[HKAxis _enumerateAxisLabelsForTextInRange:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:gridlineWidth:usingBlock:](self, "_enumerateAxisLabelsForTextInRange:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:gridlineWidth:usingBlock:", v68, v17, v77, x, y, width, height, a5, a6.x, a6.y, v70, *(_QWORD *)&v23, 0, v56);

    *a9 = (CGSize)v106[2];
    _Block_object_dispose(&v97, 8);

    _Block_object_dispose(&v105, 8);
  }

}

void __118__HKAxis__drawTextForModelRange_inRect_zoomScale_contentOffset_renderView_style_maximumLabelSize_omitOffscreenLabels___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v27 = a2;
  v7 = a4;
  objc_msgSend(a3, "CGPointValue");
  v9 = v8;
  v11 = v10;
  if (!*(_BYTE *)(a1 + 144) || v8 >= *(double *)(a1 + 96))
  {
    v12 = *(_QWORD *)(a1 + 128);
    v13 = *(_QWORD *)(a1 + 136);
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 48);
    v17 = *(_QWORD *)(a1 + 56);
    v18 = *(_QWORD *)(a1 + 64);
    v19 = objc_msgSend(*(id *)(a1 + 72), "isSystemSymbol");
    BYTE1(v26) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    LOBYTE(v26) = v19;
    LOBYTE(v25) = 0;
    objc_msgSend(v14, "drawText:atPoint:spaceAvailable:horizontalAlignment:verticalAlignment:hyphenationFactor:textColor:font:clipToAxis:exclusion:isSystemSymbol:isTallText:", v27, v7, v12, v13, v15, v16, v9, v11, v17, v25, v18, v26);
    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(double *)(v22 + 32) >= v20)
      v20 = *(double *)(v22 + 32);
    *(double *)(v22 + 32) = v20;
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v24 = *(double *)(v23 + 40);
    if (v24 < v21)
      v24 = v21;
    *(double *)(v23 + 40) = v24;
  }

}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  _BOOL4 v9;
  double x;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v16;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat MinX;
  double v28;
  double v29;
  CGFloat MinY;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGPoint result;

  v9 = a8;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v16 = a4.origin.x;
  -[HKCoordinateTransform coordinateForValue:](self->_transform, "coordinateForValue:", a3, a8, *(_QWORD *)&a9.x, *(_QWORD *)&a9.y);
  v19 = v18;
  -[HKAxis pointTransform](self, "pointTransform");
  v22 = v20 + v19 * v21;
  v23 = v16;
  v24 = y;
  v25 = width;
  v26 = height;
  if (v9)
  {
    MinX = CGRectGetMinX(*(CGRect *)&v23);
    v28 = HKUIFloorToScreenScale(MinX - (x - v22 * a5));
    v29 = HKUIFloorToScreenScale(v28);
  }
  else
  {
    MinY = CGRectGetMinY(*(CGRect *)&v23);
    v31 = HKUIFloorToScreenScale(v22 + MinY);
    v32 = HKUIFloorToScreenScale(v31);
    v29 = a7;
    a7 = v32;
  }
  v33 = v36 + a7;
  v34 = v35 + v29;
  result.y = v33;
  result.x = v34;
  return result;
}

- (void)_enumerateAxisLabelsForTextInRange:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9 gridlineWidth:(double)a10 usingBlock:(id)a11
{
  CGFloat x;
  _BOOL4 v12;
  double width;
  double y;
  double v16;
  id v18;
  void (**v19)(id, void *, void *, void *);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double height;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;
  uint64_t v67;
  double v68;

  x = a9.x;
  v12 = a8;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  v16 = a4.origin.x;
  v66 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = (void (**)(id, void *, void *, void *))*(id *)&x;
  v55 = v18;
  -[HKAxis axisLabelsInModelRangeFromCache:zoomScale:](self, "axisLabelsInModelRangeFromCache:zoomScale:", v18, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxis labelDataSource](self, "labelDataSource");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v20;
  if (v12)
  {
    objc_msgSend(v20, "count");
    v22 = 0;
    v23 = 0;
    v24 = 0;
    v25 = -1;
    v26 = v20;
    while (v25 + 1 != objc_msgSend(v26, "count"))
    {
      objc_msgSend(v26, "objectAtIndexedSubscript:", v25 + 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v27, "location");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:", v29, 1, v16, y, width, height, a5, a6.x, a6.y, a7, *(_QWORD *)&a10, v67);
        v31 = v30;
        v57 = v32;

        objc_msgSend(v23, "CGPointValue");
        v33 = (void *)MEMORY[0x1E0CB37E8];
        v34 = v31;
        v36 = v31 - v35 - a10 - v68;
        -[NSNumber doubleValue](self->_horizontalAxisLabelSpacePadding, "doubleValue");
        objc_msgSend(v33, "numberWithDouble:", v36 - v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24 && HKUIObjectIsLarger(v38, (uint64_t)&unk_1E9CED280))
          v19[2](v19, v24, v23, v38);
        objc_msgSend(v27, "text");
        v39 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v34, v57);
        v40 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v39;
        v23 = (void *)v40;
        v22 = v38;
        v26 = v56;
      }
      else
      {
        v38 = v22;
      }

      if (++v25 >= (unint64_t)objc_msgSend(v26, "count"))
        goto LABEL_26;
    }
    if (v24 && HKUIObjectIsLarger(v22, (uint64_t)&unk_1E9CED280))
      v19[2](v19, v24, v23, v22);
    v38 = v22;
LABEL_26:

  }
  else
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v41 = v20;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v62 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_msgSend(v46, "text");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (v47)
          {
            objc_msgSend(v46, "location");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:", v48, 0, v16, y, width, height, a5, a6.x, a6.y, a7, *(_QWORD *)&a10, v67);
            v50 = v49;
            v52 = v51;

            objc_msgSend(v46, "text");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v50, v52);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v19[2](v19, v53, v54, self->_maxLabelWidth);

          }
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v43);
    }

    v26 = v20;
  }

}

- (CGRect)_labelBackgroundRectWithLabels:(id)a3 font:(id)a4 maxAnnotationWidth:(double)a5 rect:(CGRect)a6 style:(id)a7
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v15;
  id v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  double v20;
  CGFloat v21;
  uint64_t v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double MinX;
  CGFloat MinY;
  double v29;
  double v30;
  double v31;
  double v32;
  CGRect v33;
  CGRect v34;
  CGRect result;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v15 = a3;
  v16 = a4;
  v17 = a7;
  objc_msgSend(v17, "fillStyle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKAxis _styleIsHorizontal:](self, "_styleIsHorizontal:", v17);
  if (!v18 || v19)
  {
    MinX = *MEMORY[0x1E0C9D648];
    MinY = *(double *)(MEMORY[0x1E0C9D648] + 8);
    a5 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    -[HKAxis _axisFillWidthForStyle:labels:font:](self, "_axisFillWidthForStyle:labels:font:", v17, v15, v16);
    if (v20 > a5)
      a5 = v20;
    v33.origin.x = x;
    v33.origin.y = y;
    v33.size.width = width;
    v33.size.height = height;
    v21 = CGRectGetHeight(v33);
    v22 = objc_msgSend(v17, "location");
    v23 = x;
    v24 = y;
    v25 = width;
    v26 = height;
    if (v22 == 3)
      MinX = CGRectGetMinX(*(CGRect *)&v23);
    else
      MinX = CGRectGetMaxX(*(CGRect *)&v23) - a5;
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = width;
    v34.size.height = height;
    MinY = CGRectGetMinY(v34);
  }

  v29 = MinX;
  v30 = MinY;
  v31 = a5;
  v32 = v21;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (double)_maximumWidthOfAnnotations:(id)a3 axisStyle:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "annotationText");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "size");
        v14 = v13;

        if (v10 < v14)
          v10 = v14;
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
    if (v10 > 0.0)
    {
      objc_msgSend(v6, "fillInnerPadding");
      v16 = v15;
      objc_msgSend(v6, "fillOuterPadding");
      v10 = v10 + v16 + v17;
    }
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (void)_drawTextBackgroundWithRect:(CGRect)a3 style:(id)a4 renderView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;
  CGRect v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  objc_msgSend(a4, "fillStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12.origin.x = x;
    v12.origin.y = y;
    v12.size.width = width;
    v12.size.height = height;
    if (!CGRectEqualToRect(v12, *MEMORY[0x1E0C9D648]))
      objc_msgSend(v11, "fillRect:withFillStyle:axisRect:alpha:", v10, x, y, width, height, x, y, width, height, 0x3FF0000000000000);
  }

}

- (double)_axisFillWidthForStyle:(id)a3 labels:(id)a4 font:(id)a5
{
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v8 = a3;
  -[HKAxis _maxLabelWidthFromLabels:font:](self, "_maxLabelWidthFromLabels:font:", a4, a5);
  v10 = v9;
  objc_msgSend(v8, "fillInnerPadding");
  v12 = v10 + v11;
  objc_msgSend(v8, "fillOuterPadding");
  v14 = v13;

  return ceil(v12 + v14);
}

- (double)_maxLabelWidthFromLabels:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  NSNumber *maxLabelWidth;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    v11 = *MEMORY[0x1E0DC1138];
    v12 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "text");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v11;
        v26 = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "sizeWithAttributes:", v15);
        v17 = v16;

        if (v12 < v17)
          v12 = v17;

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }
  else
  {
    v12 = 0.0;
  }
  maxLabelWidth = self->_maxLabelWidth;
  if (maxLabelWidth)
  {
    -[NSNumber doubleValue](maxLabelWidth, "doubleValue");
    if (v12 >= v19)
      v12 = v19;
  }

  return v12;
}

- (double)bottomBaselineYCoordinateForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  double v12;
  _QWORD v14[9];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  unint64_t v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0xC7EFFFFFE0000000;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__HKAxis_bottomBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke;
  v14[3] = &unk_1E9C45EE8;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  v14[4] = &v15;
  -[HKAxis enumerateTickCoordinatesInModelRange:zoomScale:handler:](self, "enumerateTickCoordinatesInModelRange:zoomScale:handler:", v11, v14, a5);
  if (v16[3] == -3.40282347e38)
    v12 = -1.0;
  else
    v12 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __68__HKAxis_bottomBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke(uint64_t a1, double a2)
{
  CGFloat MinY;
  double v5;
  uint64_t v6;

  MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  v5 = HKUIFloorToScreenScale(MinY + a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 > *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
}

- (BOOL)_containsTopBaselineWithModelRange:(id)a3 zoomScale:(double)a4
{
  return !self->_overrideNoTopBaseline
      && -[HKAxis _axisLabelCountWithTextInModelRange:zoomScale:](self, "_axisLabelCountWithTextInModelRange:zoomScale:", a3, a4) > 0;
}

- (double)topBaselineYCoordinateForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  id v11;
  _QWORD v13[9];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  if (-[HKAxis _containsTopBaselineWithModelRange:zoomScale:](self, "_containsTopBaselineWithModelRange:zoomScale:", v11, a5))
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0x47EFFFFFE0000000;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __65__HKAxis_topBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke;
    v13[3] = &unk_1E9C45EE8;
    *(CGFloat *)&v13[5] = x;
    *(double *)&v13[6] = y;
    *(CGFloat *)&v13[7] = width;
    *(CGFloat *)&v13[8] = height;
    v13[4] = &v14;
    -[HKAxis enumerateTickCoordinatesInModelRange:zoomScale:handler:](self, "enumerateTickCoordinatesInModelRange:zoomScale:handler:", v11, v13, a5);
    if (v15[3] == 3.40282347e38)
      y = -1.0;
    else
      y = v15[3];
    _Block_object_dispose(&v14, 8);
  }

  return y;
}

void __65__HKAxis_topBaselineYCoordinateForModelRange_axisRect_zoomScale___block_invoke(uint64_t a1, double a2)
{
  CGFloat MinY;
  double v5;
  uint64_t v6;

  MinY = CGRectGetMinY(*(CGRect *)(a1 + 40));
  v5 = HKUIFloorToScreenScale(MinY + a2);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v5 < *(double *)(v6 + 24))
    *(double *)(v6 + 24) = v5;
}

- (id)_baselineForModelRange:(id)a3 axisRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 style:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v23;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v14, "gridLineStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "lineWidth");
  v19 = v18;

  objc_msgSend(v16, "setLineWidth:", v19);
  -[HKAxis bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:](self, "bottomBaselineYCoordinateForModelRange:axisRect:zoomScale:", v15, x, y, width, height, a5);
  v21 = v20;

  if (v21 >= -0.00000011920929)
  {
    objc_msgSend(v16, "moveToPoint:", x, v21);
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    objc_msgSend(v16, "addLineToPoint:", CGRectGetMaxX(v23), v21);
  }
  return v16;
}

- (id)_gridLinesForModelRange:(id)a3 axisRect:(CGRect)a4 gridlineRanges:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 style:(id)a8 gridLineType:(int64_t)a9
{
  CGFloat y;
  CGFloat x;
  double height;
  double width;
  double v17;
  double v18;
  id v20;
  id v21;
  id v22;
  _BOOL4 v23;
  BOOL v24;
  CGRectEdge v25;
  uint64_t v26;
  void *v27;
  double v28;
  CGFloat v29;
  void *v30;
  id v31;
  id v32;
  double v33;
  double v34;
  CGFloat v35;
  void *v36;
  id v37;
  _QWORD v39[4];
  id v40;
  id v41;
  int64_t v42;
  CGRect v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  BOOL v51;
  CGRect remainder;
  CGRect slice;
  CGRect v54;

  y = a7.y;
  x = a7.x;
  height = a4.size.height;
  width = a4.size.width;
  v17 = a4.origin.y;
  v18 = a4.origin.x;
  v20 = a3;
  v21 = a5;
  v22 = a8;
  v23 = -[HKAxis _styleIsHorizontal:](self, "_styleIsHorizontal:", v22);
  v24 = v23;
  v25 = !v23;
  switch(a9)
  {
    case 0:
      objc_msgSend(v22, "referenceGridLineStyle");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(v22, "gridLineStyle");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v22, "minorGridLineStyle");
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v27 = (void *)v26;
      goto LABEL_9;
  }
  v27 = 0;
LABEL_9:
  objc_msgSend(v27, "lineWidth");
  v29 = v28;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v54.origin.x = v18;
  v54.origin.y = v17;
  v54.size.width = width;
  v54.size.height = height;
  CGRectDivide(v54, &slice, &remainder, v29, v25);
  v30 = (void *)objc_opt_new();
  objc_msgSend(v30, "setLineWidth:", v29);
  if (objc_msgSend(v27, "dashStyle"))
    objc_msgSend(v30, "setLineDash:count:phase:", &_HKNonSolidGridLineDash, 1, 0.0);
  v39[1] = 3221225472;
  v43 = slice;
  v39[0] = MEMORY[0x1E0C809B0];
  v39[2] = __101__HKAxis__gridLinesForModelRange_axisRect_gridlineRanges_zoomScale_contentOffset_style_gridLineType___block_invoke;
  v39[3] = &unk_1E9C45F10;
  v42 = a9;
  v51 = v24;
  v44 = a6;
  v45 = x;
  v46 = y;
  v47 = v18;
  v48 = v17;
  v49 = width;
  v50 = height;
  v31 = v30;
  v40 = v31;
  v41 = v21;
  v32 = v21;
  -[HKAxis enumerateTickCoordinatesInModelRange:zoomScale:handler:](self, "enumerateTickCoordinatesInModelRange:zoomScale:handler:", v20, v39, a6);
  if (self->_overrideNoTopBaseline && !v24)
  {
    -[HKAxis topBaselineYCoordinateForModelRange:axisRect:zoomScale:](self, "topBaselineYCoordinateForModelRange:axisRect:zoomScale:", v20, v18, v17, width, height, a6);
    v34 = v33;
    v35 = slice.origin.x + slice.size.width;
    objc_msgSend(v31, "moveToPoint:");
    objc_msgSend(v31, "addLineToPoint:", v35, v34);
  }
  v36 = v41;
  v37 = v31;

  return v37;
}

void __101__HKAxis__gridLinesForModelRange_axisRect_gridlineRanges_zoomScale_contentOffset_style_gridLineType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat MinX;
  double v15;
  CGFloat v16;
  CGFloat MinY;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxX;
  double MaxY;
  void *v25;
  double v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  float v34;
  double v35;
  void *v36;
  float v37;
  double v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a4;
  if (*(_QWORD *)(a1 + 48) == a3)
  {
    if (*(_BYTE *)(a1 + 144))
    {
      v11 = *(double *)(a1 + 64);
      v12 = *(double *)(a1 + 80);
      v13 = -(*(double *)(a1 + 96) - a5 * *(double *)(a1 + 88));
      MinX = CGRectGetMinX(*(CGRect *)(a1 + 112));
      v15 = HKUIFloorToScreenScale(v13 + MinX);
      v16 = 0.0;
    }
    else
    {
      v16 = *(double *)(a1 + 72);
      v15 = *(double *)(a1 + 56);
      MinY = CGRectGetMinY(*(CGRect *)(a1 + 112));
      v11 = HKUIFloorToScreenScale(MinY + a5);
      v12 = 0.0;
    }
    v55.origin.x = v15;
    v55.origin.y = v11;
    v55.size.width = v16;
    v55.size.height = v12;
    if (CGRectContainsRect(*(CGRect *)(a1 + 112), v55))
    {
      v18 = *(void **)(a1 + 32);
      v49.origin.x = v15;
      v49.origin.y = v11;
      v49.size.width = v16;
      v49.size.height = v12;
      v19 = CGRectGetMinX(v49);
      v50.origin.x = v15;
      v50.origin.y = v11;
      v50.size.width = v16;
      v50.size.height = v12;
      objc_msgSend(v18, "moveToPoint:", v19, CGRectGetMinY(v50));
      if (*(_BYTE *)(a1 + 144))
      {
        v20 = 0.0;
        v21 = 48.0;
        if (!v10)
          v21 = 0.0;
        if (!a3)
          v20 = v21;
        if (a3 == 1)
          v20 = 48.0;
        if (a3 == 2)
          v22 = -2.0;
        else
          v22 = v20;
        v51.origin.x = v15;
        v51.origin.y = v11;
        v51.size.width = v16;
        v51.size.height = v12;
        MaxX = CGRectGetMaxX(v51);
        v52.origin.x = v15;
        v52.origin.y = v11;
        v52.size.width = v16;
        v52.size.height = v12;
        MaxY = CGRectGetMaxY(v52);
        v25 = *(void **)(a1 + 40);
        if (v25 && objc_msgSend(v25, "count"))
        {
          v26 = v22 + MaxY;
          v45 = 0u;
          v46 = 0u;
          v43 = 0u;
          v44 = 0u;
          v27 = *(id *)(a1 + 40);
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v44 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
                objc_msgSend(v32, "minValue", (_QWORD)v43);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "floatValue");
                v35 = v34;

                objc_msgSend(v32, "maxValue");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "floatValue");
                v38 = v37;

                objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", MaxX, v35);
                objc_msgSend(*(id *)(a1 + 32), "addLineToPoint:", MaxX, v38);
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            }
            while (v29);
          }
          else
          {
            v38 = v22 + MaxY;
          }

          objc_msgSend(*(id *)(a1 + 32), "moveToPoint:", MaxX, v38);
          v42 = MaxX;
          if (v22 == 0.0)
            v40 = v38;
          else
            v40 = v26;
          v39 = *(void **)(a1 + 32);
          goto LABEL_34;
        }
        v39 = *(void **)(a1 + 32);
        v40 = v22 + MaxY;
      }
      else
      {
        v41 = *(void **)(a1 + 32);
        v53.origin.x = v15;
        v53.origin.y = v11;
        v53.size.width = v16;
        v53.size.height = v12;
        MaxX = CGRectGetMaxX(v53);
        v54.origin.x = v15;
        v54.origin.y = v11;
        v54.size.width = v16;
        v54.size.height = v12;
        v40 = CGRectGetMaxY(v54);
        v39 = v41;
      }
      v42 = MaxX;
LABEL_34:
      objc_msgSend(v39, "addLineToPoint:", v42, v40, (_QWORD)v43);
    }
  }

}

- (void)_addTickMarksForPosition:(unint64_t)a3 axisRect:(CGRect)a4 modelRange:(id)a5 zoomScale:(double)a6 contentOffset:(CGPoint)a7 toBezierPath:(id)a8 style:(id)a9
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v16;
  CGFloat v17;
  id v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  HKAxis *v31;
  int v32;
  void *v33;
  char v34;
  double v35;
  CGFloat v36;
  CGRectEdge edge;
  BOOL v38;
  _QWORD v39[4];
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  CGFloat v45;
  CGFloat v46;
  CGRect v47;
  CGRect v48;
  char v49;
  BOOL v50;
  CGRect slice;
  CGRect remainder;
  CGRect v53;

  y = a7.y;
  x = a7.x;
  height = a4.size.height;
  width = a4.size.width;
  v16 = a4.origin.y;
  v17 = a4.origin.x;
  remainder = a4;
  v20 = a5;
  v21 = a8;
  v22 = a9;
  objc_msgSend(v22, "tickStyle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "axisLineStyle");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v23 && v24)
  {
    objc_msgSend(v23, "tickLength");
    v27 = v26;
    v28 = objc_msgSend(v23, "tickDirection");
    v29 = -[HKAxis _styleIsHorizontal:](self, "_styleIsHorizontal:", v22);
    v30 = objc_msgSend(v22, "location");
    v38 = v29;
    v31 = self;
    if ((unint64_t)(v30 - 1) > 2)
      v32 = 1;
    else
      v32 = dword_1D7B82B68[v30 - 1];
    edge = v32;
    objc_msgSend(v22, "tickStyle");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "shouldRenderMajorTickMarks");

    if (v28 == 2)
    {
      if (a3 == 2)
        v28 = 4;
      else
        v28 = 3;
    }
    else if (v28 == 1)
    {
      if (a3 == 2)
        v28 = 3;
      else
        v28 = 4;
    }
    memset(&slice, 0, sizeof(slice));
    objc_msgSend(v25, "lineWidth");
    v36 = v35;
    v53.origin.x = v17;
    v53.origin.y = v16;
    v53.size.width = width;
    v53.size.height = height;
    CGRectDivide(v53, &slice, &remainder, v36, edge);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __98__HKAxis__addTickMarksForPosition_axisRect_modelRange_zoomScale_contentOffset_toBezierPath_style___block_invoke;
    v39[3] = &unk_1E9C45F38;
    v49 = v34;
    v42 = (uint64_t)v27;
    v43 = v28;
    v40 = v25;
    v50 = v38;
    v44 = a6;
    v45 = x;
    v46 = y;
    v47 = remainder;
    v48 = slice;
    v41 = v21;
    -[HKAxis enumerateTickCoordinatesInModelRange:zoomScale:handler:](v31, "enumerateTickCoordinatesInModelRange:zoomScale:handler:", v20, v39, a6);

  }
}

void __98__HKAxis__addTickMarksForPosition_axisRect_modelRange_zoomScale_contentOffset_toBezierPath_style___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, double a5)
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat MinX;
  double v17;
  double v18;
  CGFloat width;
  CGFloat v20;
  CGFloat v21;
  double x;
  CGFloat MinY;
  void *v24;
  double v25;
  void *v26;
  double MaxX;
  CGAffineTransform v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v9 = a2;
  v10 = a4;
  if (a3 == 2 || *(_BYTE *)(a1 + 152))
  {
    v11 = 1.7;
    if (a3 == 2)
      v11 = 1.0;
    v12 = floor(v11 * (double)*(uint64_t *)(a1 + 48));
    if (*(_QWORD *)(a1 + 56) == 4)
    {
      objc_msgSend(*(id *)(a1 + 32), "lineWidth");
      v14 = v13;
    }
    else
    {
      v14 = -v12;
    }
    if (*(_BYTE *)(a1 + 153))
    {
      v15 = -(*(double *)(a1 + 72) - a5 * *(double *)(a1 + 64));
      MinX = CGRectGetMinX(*(CGRect *)(a1 + 88));
      v17 = HKUIFloorToScreenScale(v15 + MinX);
      v18 = v14 + *(double *)(a1 + 128);
      width = 0.0;
    }
    else
    {
      v20 = *MEMORY[0x1E0C9D648];
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      CGAffineTransformMakeRotation(&v28, -1.57079633);
      v29.origin.x = v20;
      v29.origin.y = v14;
      v29.size.width = v21;
      v29.size.height = v12;
      v30 = CGRectApplyAffineTransform(v29, &v28);
      x = v30.origin.x;
      width = v30.size.width;
      MinY = CGRectGetMinY(*(CGRect *)(a1 + 88));
      v18 = HKUIFloorToScreenScale(MinY + a5);
      v17 = x + *(double *)(a1 + 120);
      v12 = 0.0;
    }
    v24 = *(void **)(a1 + 40);
    v31.origin.x = v17;
    v31.origin.y = v18;
    v31.size.width = width;
    v31.size.height = v12;
    v25 = CGRectGetMinX(v31);
    v32.origin.x = v17;
    v32.origin.y = v18;
    v32.size.width = width;
    v32.size.height = v12;
    objc_msgSend(v24, "moveToPoint:", v25, CGRectGetMinY(v32));
    v26 = *(void **)(a1 + 40);
    v33.origin.x = v17;
    v33.origin.y = v18;
    v33.size.width = width;
    v33.size.height = v12;
    MaxX = CGRectGetMaxX(v33);
    v34.origin.x = v17;
    v34.origin.y = v18;
    v34.size.width = width;
    v34.size.height = v12;
    objc_msgSend(v26, "addLineToPoint:", MaxX, CGRectGetMaxY(v34));
  }

}

- (void)_renderTickMarksForModelRange:(id)a3 chartRect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 style:(id)a7 renderView:(id)a8
{
  double y;
  double x;
  double height;
  double width;
  double v15;
  double v16;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;

  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v15 = a4.origin.y;
  v16 = a4.origin.x;
  v26 = a3;
  v18 = a7;
  v19 = a8;
  v20 = objc_msgSend(v18, "tickPositions");
  if (v20)
  {
    v21 = v20;
    v22 = (void *)objc_opt_new();
    if ((v21 & 1) != 0)
      -[HKAxis _addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:](self, "_addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:", 1, v26, v22, v18, v16, v15, width, height, a5, x, y);
    if ((v21 & 2) != 0)
      -[HKAxis _addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:](self, "_addTickMarksForPosition:axisRect:modelRange:zoomScale:contentOffset:toBezierPath:style:", 2, v26, v22, v18, v16, v15, width, height, a5, x, y);
    if ((objc_msgSend(v22, "isEmpty") & 1) == 0)
    {
      objc_msgSend(v18, "tickStyle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "strokeColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = 0;
      objc_msgSend(v19, "drawPath:strokeColor:fillColor:markerImage:useGradientFill:blendMode:clipToAxes:", v22, v24, 0, 0, 0, 0, v25);

    }
  }

}

- (void)addAxisAnnotation:(id)a3 modelCoordinate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  HKAxisAnnotation *v11;

  v6 = a4;
  v7 = a3;
  -[HKAxis axisAnnotations](self, "axisAnnotations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[HKAxis setAxisAnnotations:](self, "setAxisAnnotations:", v9);

  }
  v11 = -[HKAxisAnnotation initWithAnnotation:position:]([HKAxisAnnotation alloc], "initWithAnnotation:position:", v7, v6);

  -[HKAxis axisAnnotations](self, "axisAnnotations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

- (int64_t)axisAnnotationCount
{
  void *v2;
  int64_t v3;

  -[HKAxis axisAnnotations](self, "axisAnnotations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)clearAnnotations
{
  -[HKAxis setAxisAnnotations:](self, "setAxisAnnotations:", 0);
}

- (void)clearCache
{
  id v2;

  -[HKAxisStyle fillStyle](self->_preferredStyle, "fillStyle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clearCache");

}

- (void)invalidateAxisLabelCache
{
  -[HKAxisLabelCache invalidateCache](self->_axisLabelCache, "invalidateCache");
}

- (double)offsetForLegendView
{
  return 0.0;
}

+ (HKAxisMinMaxDefinition)expandByPointsLow:(double)a3 high:(double)a4 modelRange:(HKAxisMinMaxDefinition)a5 pointRange:(HKAxisMinMaxDefinition)a6
{
  double v6;
  double v7;
  double v8;
  double var0;
  double var1;
  HKAxisMinMaxDefinition result;

  v6 = a6.var0 + a3;
  v7 = a6.var1 - a4;
  v8 = vabdd_f64(v7, a6.var0);
  if (vabdd_f64(v6, v7) >= 0.00000011920929 && v8 >= 0.00000011920929)
  {
    a5.var0 = (a5.var0 * (a6.var0 - v7) + a5.var1 * (v6 - a6.var0)) / (v6 - v7);
    a5.var1 = a5.var0 + (a6.var1 - a6.var0) * (a5.var1 - a5.var0) / (v7 - a6.var0);
  }
  var0 = a5.var0;
  var1 = a5.var1;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

+ (HKAxisMinMaxDefinition)contractByPointsLow:(double)a3 high:(double)a4 modelRange:(HKAxisMinMaxDefinition)a5 pointRange:(HKAxisMinMaxDefinition)a6
{
  double v6;
  double v7;
  double var0;
  double var1;
  HKAxisMinMaxDefinition result;

  if (vabdd_f64(a6.var1, a6.var0) >= 0.00000011920929)
  {
    v6 = a6.var1 - a4;
    v7 = (a5.var1 - a5.var0) / (a6.var1 - a6.var0);
    a5.var1 = a5.var0 + (v6 - a6.var0) * v7;
    a5.var0 = a5.var0 + (a6.var0 + a3 - a6.var0) * v7;
  }
  var0 = a5.var0;
  var1 = a5.var1;
  result.var1 = var1;
  result.var0 = var0;
  return result;
}

- (HKAxisStyle)preferredStyle
{
  return self->_preferredStyle;
}

- (int64_t)maxLabels
{
  return self->_maxLabels;
}

- (int64_t)minLabels
{
  return self->_minLabels;
}

- (NSNumber)maxLabelWidth
{
  return self->_maxLabelWidth;
}

- (void)setMaxLabelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_maxLabelWidth, a3);
}

- (NSNumber)horizontalAxisLabelSpacePadding
{
  return self->_horizontalAxisLabelSpacePadding;
}

- (HKCoordinateTransform)transform
{
  return self->_transform;
}

- (HKZoomScale)zoomScaleEngine
{
  return self->_zoomScaleEngine;
}

- (HKAxisLabelDataSource)labelDataSource
{
  return (HKAxisLabelDataSource *)objc_loadWeakRetained((id *)&self->_labelDataSource);
}

- (BOOL)overrideNoTopBaseline
{
  return self->_overrideNoTopBaseline;
}

- (BOOL)axisAnnotationsExcludeInterstitialAxisLabels
{
  return self->_axisAnnotationsExcludeInterstitialAxisLabels;
}

- (HKAxisLabelCache)axisLabelCache
{
  return self->_axisLabelCache;
}

- (NSLock)axisMutableStateLock
{
  return self->_axisMutableStateLock;
}

- (NSMutableArray)axisAnnotationsStorage
{
  return self->_axisAnnotationsStorage;
}

- (void)setAxisAnnotationsStorage:(id)a3
{
  objc_storeStrong((id *)&self->_axisAnnotationsStorage, a3);
}

- (BOOL)requiresScalingStorage
{
  return self->_requiresScalingStorage;
}

- (void)setRequiresScalingStorage:(BOOL)a3
{
  self->_requiresScalingStorage = a3;
}

- (int64_t)axisLabelEndingsStorage
{
  return self->_axisLabelEndingsStorage;
}

- (void)setAxisLabelEndingsStorage:(int64_t)a3
{
  self->_axisLabelEndingsStorage = a3;
}

- (HKLinearTransform)pointTransformStorage
{
  double offset;
  double scale;
  HKLinearTransform result;

  offset = self->_pointTransformStorage.offset;
  scale = self->_pointTransformStorage.scale;
  result.scale = scale;
  result.offset = offset;
  return result;
}

- (void)setPointTransformStorage:(HKLinearTransform)a3
{
  self->_pointTransformStorage = a3;
}

- (HKValueRange)axisChartableValueRangeStorage
{
  return self->_axisChartableValueRangeStorage;
}

- (void)setAxisChartableValueRangeStorage:(id)a3
{
  objc_storeStrong((id *)&self->_axisChartableValueRangeStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisChartableValueRangeStorage, 0);
  objc_storeStrong((id *)&self->_axisAnnotationsStorage, 0);
  objc_storeStrong((id *)&self->_axisMutableStateLock, 0);
  objc_storeStrong((id *)&self->_axisLabelCache, 0);
  objc_destroyWeak((id *)&self->_labelDataSource);
  objc_storeStrong((id *)&self->_zoomScaleEngine, 0);
  objc_storeStrong((id *)&self->_transform, 0);
  objc_storeStrong((id *)&self->_maxLabelWidth, 0);
  objc_storeStrong((id *)&self->_preferredStyle, 0);
}

@end
