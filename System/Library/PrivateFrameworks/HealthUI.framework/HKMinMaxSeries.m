@implementation HKMinMaxSeries

- (HKMinMaxSeries)init
{
  HKMinMaxSeries *v2;
  NSLock *v3;
  NSLock *seriesMutableStateLock;
  HKStrokeStyle *unselectedStrokeStyleStorage;
  HKStrokeStyle *selectedStrokeStyleStorage;
  UIImage *unselectedPointMarkerImageStorage;
  UIImage *selectedPointMarkerImageStorage;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMinMaxSeries;
  v2 = -[HKGraphSeries init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    seriesMutableStateLock = v2->_seriesMutableStateLock;
    v2->_seriesMutableStateLock = v3;

    -[NSLock setName:](v2->_seriesMutableStateLock, "setName:", CFSTR("HKMinMaxSeriesLock"));
    unselectedStrokeStyleStorage = v2->_unselectedStrokeStyleStorage;
    v2->_unselectedStrokeStyleStorage = 0;

    selectedStrokeStyleStorage = v2->_selectedStrokeStyleStorage;
    v2->_selectedStrokeStyleStorage = 0;

    unselectedPointMarkerImageStorage = v2->_unselectedPointMarkerImageStorage;
    v2->_unselectedPointMarkerImageStorage = 0;

    selectedPointMarkerImageStorage = v2->_selectedPointMarkerImageStorage;
    v2->_selectedPointMarkerImageStorage = 0;

  }
  return v2;
}

- (HKStrokeStyle)unselectedStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unselectedStrokeStyleStorage;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setUnselectedStrokeStyle:(id)a3
{
  HKStrokeStyle *v4;
  void *v5;
  HKStrokeStyle *unselectedStrokeStyleStorage;
  id v7;

  v4 = (HKStrokeStyle *)a3;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  unselectedStrokeStyleStorage = self->_unselectedStrokeStyleStorage;
  self->_unselectedStrokeStyleStorage = v4;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (HKStrokeStyle)selectedStrokeStyle
{
  void *v3;
  HKStrokeStyle *v4;
  void *v5;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedStrokeStyleStorage;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedStrokeStyle:(id)a3
{
  HKStrokeStyle *v4;
  void *v5;
  HKStrokeStyle *selectedStrokeStyleStorage;
  id v7;

  v4 = (HKStrokeStyle *)a3;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  selectedStrokeStyleStorage = self->_selectedStrokeStyleStorage;
  self->_selectedStrokeStyleStorage = v4;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIImage)unselectedPointMarkerImage
{
  void *v3;
  UIImage *v4;
  void *v5;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_unselectedPointMarkerImageStorage;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setUnselectedPointMarkerImage:(id)a3
{
  UIImage *v4;
  void *v5;
  UIImage *unselectedPointMarkerImageStorage;
  id v7;

  v4 = (UIImage *)a3;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  unselectedPointMarkerImageStorage = self->_unselectedPointMarkerImageStorage;
  self->_unselectedPointMarkerImageStorage = v4;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (UIImage)selectedPointMarkerImage
{
  void *v3;
  UIImage *v4;
  void *v5;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  v4 = self->_selectedPointMarkerImageStorage;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unlock");

  return v4;
}

- (void)setSelectedPointMarkerImage:(id)a3
{
  UIImage *v4;
  void *v5;
  UIImage *selectedPointMarkerImageStorage;
  id v7;

  v4 = (UIImage *)a3;
  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  selectedPointMarkerImageStorage = self->_selectedPointMarkerImageStorage;
  self->_selectedPointMarkerImageStorage = v4;

  -[HKMinMaxSeries seriesMutableStateLock](self, "seriesMutableStateLock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unlock");

}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  id v16;
  void *v17;
  void *v18;
  __int128 v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v16 = a3;
  -[HKMinMaxSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {

  }
  else
  {
    -[HKMinMaxSeries selectedStrokeStyle](self, "selectedStrokeStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
      goto LABEL_5;
  }
  v19 = *(_OWORD *)&a6->c;
  v23 = *(_OWORD *)&a6->a;
  v24 = v19;
  v25 = *(_OWORD *)&a6->tx;
  -[HKMinMaxSeries _drawStrokeWithBlockCoordinates:pointTransform:context:axisRect:](self, "_drawStrokeWithBlockCoordinates:pointTransform:context:axisRect:", v16, &v23, a7, x, y, width, height);
LABEL_5:
  -[HKMinMaxSeries unselectedPointMarkerImage](self, "unselectedPointMarkerImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

LABEL_8:
    v22 = *(_OWORD *)&a6->c;
    v23 = *(_OWORD *)&a6->a;
    v24 = v22;
    v25 = *(_OWORD *)&a6->tx;
    -[HKMinMaxSeries _drawPointMarkersWithBlockCoordinates:pointTransform:context:](self, "_drawPointMarkersWithBlockCoordinates:pointTransform:context:", v16, &v23, a7);
    goto LABEL_9;
  }
  -[HKMinMaxSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    goto LABEL_8;
LABEL_9:

}

- (void)_drawStrokeWithBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 context:(CGContext *)a5 axisRect:(CGRect)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  CGFloat MaxX;
  CGFloat MinX;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _OWORD v31[3];
  _QWORD v32[4];
  id v33;
  id v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  CGRect v46;
  CGRect v47;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a3;
  CGContextSaveGState(a5);
  -[HKMinMaxSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineWidth");
  v16 = v15;

  -[HKMinMaxSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lineWidth");
  v19 = v18;

  if (v19 < v16)
    v19 = v16;
  v46.origin.x = x;
  v46.origin.y = y;
  v46.size.width = width;
  v46.size.height = height;
  MaxX = CGRectGetMaxX(v46);
  v47.origin.x = x;
  v47.origin.y = y;
  v47.size.width = width;
  v47.size.height = height;
  MinX = CGRectGetMinX(v47);
  v22 = (void *)objc_opt_new();
  v23 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __82__HKMinMaxSeries__drawStrokeWithBlockCoordinates_pointTransform_context_axisRect___block_invoke;
  v32[3] = &unk_1E9C47790;
  v35 = MinX;
  v36 = v19;
  v37 = MaxX;
  v24 = v22;
  v33 = v24;
  v38 = v42;
  v39 = v43;
  v40 = v44;
  v41 = v45;
  v25 = v23;
  v34 = v25;
  v26 = *(_OWORD *)&a4->c;
  v31[0] = *(_OWORD *)&a4->a;
  v31[1] = v26;
  v31[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v13, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v31, 1, v32);

  -[HKMinMaxSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[HKMinMaxSeries unselectedStrokeStyle](self, "unselectedStrokeStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "applyToContext:", a5);

    CGContextAddPath(a5, (CGPathRef)objc_msgSend(objc_retainAutorelease(v24), "CGPath"));
    CGContextStrokePath(a5);
  }
  -[HKMinMaxSeries selectedStrokeStyle](self, "selectedStrokeStyle");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[HKMinMaxSeries selectedStrokeStyle](self, "selectedStrokeStyle");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "applyToContext:", a5);

    CGContextAddPath(a5, (CGPathRef)objc_msgSend(objc_retainAutorelease(v25), "CGPath"));
    CGContextStrokePath(a5);
  }
  CGContextRestoreGState(a5);

}

void __82__HKMinMaxSeries__drawStrokeWithBlockCoordinates_pointTransform_context_axisRect___block_invoke(uint64_t a1, void *a2, _OWORD *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _OWORD v20[4];
  _OWORD v21[2];

  v5 = a2;
  objc_msgSend(v5, "min");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v5, "max");
  v11 = v10;
  v13 = v12;

  v14 = *(double *)(a1 + 56);
  if (*(double *)(a1 + 48) - v7 <= v14 && v7 - *(double *)(a1 + 64) <= v14)
  {
    v15 = *(id *)(a1 + 32);
    v16 = a3[1];
    v21[0] = *a3;
    v21[1] = v16;
    v17 = *(_OWORD *)(a1 + 88);
    v20[0] = *(_OWORD *)(a1 + 72);
    v20[1] = v17;
    v18 = *(_OWORD *)(a1 + 120);
    v20[2] = *(_OWORD *)(a1 + 104);
    v20[3] = v18;
    if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)v21, (uint64_t *)v20))
    {
      v19 = *(id *)(a1 + 40);

      v15 = v19;
    }
    objc_msgSend(v15, "moveToPoint:", v11, v13);
    objc_msgSend(v15, "addLineToPoint:", v7, v9);

  }
}

- (void)_drawPointMarkersWithBlockCoordinates:(id)a3 pointTransform:(CGAffineTransform *)a4 context:(CGContext *)a5
{
  id v8;
  void *v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  _OWORD v30[3];
  _QWORD v31[9];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CGContext *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v8 = a3;
  CGContextSaveGState(a5);
  -[HKMinMaxSeries unselectedPointMarkerImage](self, "unselectedPointMarkerImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HKChartSeriesPointMarkerBaseRect(v9);
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[HKMinMaxSeries unselectedPointMarkerImage](self, "unselectedPointMarkerImage");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = objc_msgSend(v17, "CGImage");

  -[HKMinMaxSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = HKChartSeriesPointMarkerBaseRect(v19);
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[HKMinMaxSeries selectedPointMarkerImage](self, "selectedPointMarkerImage");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v28 = objc_msgSend(v27, "CGImage");

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[HKGraphSeries selectedPathRange](self, "selectedPathRange");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __79__HKMinMaxSeries__drawPointMarkersWithBlockCoordinates_pointTransform_context___block_invoke;
  v31[3] = &__block_descriptor_184_e94_v64__0__HKMinMaxCoordinate_8____HKGraphSeriesDataBlockPath_qqq_q_16__HKMinMaxCoordinate_48_B56l;
  v31[4] = v18;
  *(double *)&v31[5] = v10;
  v31[6] = v12;
  v31[7] = v14;
  v31[8] = v16;
  v32 = v42;
  v33 = v43;
  v34 = v44;
  v35 = v45;
  v36 = v28;
  v37 = v20;
  v38 = v22;
  v39 = v24;
  v40 = v26;
  v41 = a5;
  v29 = *(_OWORD *)&a4->c;
  v30[0] = *(_OWORD *)&a4->a;
  v30[1] = v29;
  v30[2] = *(_OWORD *)&a4->tx;
  objc_msgSend(v8, "enumerateCoordinatesWithTransform:roundToViewScale:block:", v30, 1, v31);

  CGContextRestoreGState(a5);
}

void __79__HKMinMaxSeries__drawPointMarkersWithBlockCoordinates_pointTransform_context___block_invoke(uint64_t a1, void *a2, __int128 *a3)
{
  CGImage *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  id v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGContext *v21;
  CGContext *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  v4 = *(CGImage **)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v6 = *(double *)(a1 + 48);
  v7 = *(double *)(a1 + 56);
  v8 = *(double *)(a1 + 64);
  v9 = a3[1];
  v27 = *a3;
  v28 = v9;
  v10 = *(_OWORD *)(a1 + 88);
  v23 = *(_OWORD *)(a1 + 72);
  v24 = v10;
  v11 = *(_OWORD *)(a1 + 120);
  v25 = *(_OWORD *)(a1 + 104);
  v26 = v11;
  v12 = a2;
  if (HKGraphSeriesDataPointPathInRangeInclusive((uint64_t *)&v27, (uint64_t *)&v23))
  {
    v4 = *(CGImage **)(a1 + 136);
    v5 = *(double *)(a1 + 144);
    v6 = *(double *)(a1 + 152);
    v7 = *(double *)(a1 + 160);
    v8 = *(double *)(a1 + 168);
  }
  objc_msgSend(v12, "min", v23, v24, v25, v26, v27, v28);
  v14 = v13;
  v16 = v15;
  objc_msgSend(v12, "max");
  v18 = v17;
  v20 = v19;

  v21 = *(CGContext **)(a1 + 176);
  v29.origin.x = v5;
  v29.origin.y = v6;
  v29.size.width = v7;
  v29.size.height = v8;
  v30 = CGRectOffset(v29, v14, v16);
  CGContextDrawImage(v21, v30, v4);
  if (v14 != v18 || v16 != v20)
  {
    v22 = *(CGContext **)(a1 + 176);
    v31.origin.x = v5;
    v31.origin.y = v6;
    v31.size.width = v7;
    v31.size.height = v8;
    v32 = CGRectOffset(v31, v18, v20);
    CGContextDrawImage(v22, v32, v4);
  }
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v22;
  __int128 v23;
  int64_t resolution;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;

  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "chartPoints");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMinMaxSeries.m"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("points != nil"));

  }
  objc_msgSend(v11, "transform");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transform");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)objc_opt_new();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__HKMinMaxSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke;
  v25[3] = &unk_1E9C40CB8;
  v26 = v16;
  v27 = v14;
  v28 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
  v23 = *(_OWORD *)&a4->index;
  resolution = a4->resolution;
  +[HKGraphSeriesBlockCoordinateList coordinateListWithCoordinates:blockPath:](HKGraphSeriesBlockCoordinateList, "coordinateListWithCoordinates:blockPath:", v19, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

void __60__HKMinMaxSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  HKMinMaxCoordinate *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "yValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)a1[4];
    v5 = -[HKMinMaxCoordinate initWithChartPoint:xAxisTransform:yAxisTransform:]([HKMinMaxCoordinate alloc], "initWithChartPoint:xAxisTransform:yAxisTransform:", v6, a1[5], a1[6]);
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (BOOL)supportsMultiTouchSelection
{
  return 1;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  void *v13;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMinMaxSeries.m"), 247, CFSTR("distanceFromPoint type class failure"));

  }
  objc_msgSend(v9, "distanceToPoint:", x, y);
  v11 = v10;

  return v11;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  id v8;
  double v9;
  double v10;
  void *v12;

  x = a3.x;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMinMaxSeries.m"), 255, CFSTR("xAxisDistanceFromPoint type class failure"));

  }
  objc_msgSend(v8, "startXValue");
  v10 = vabdd_f64(v9, x);

  return v10;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  double x;
  id v9;
  double v10;
  double v11;
  void *v13;

  y = a3.y;
  x = a3.x;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMinMaxSeries.m"), 263, CFSTR("yAxisDifferenceToPoint\x13 type class failure"));

  }
  objc_msgSend(v9, "yAxisDifferenceToPoint:", x, y);
  v11 = v10;

  return v11;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  return objc_msgSend(a4, "isVisibleInChartRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMinMaxSeries.m"), 274, CFSTR("compare type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "min");
  v11 = v10;
  objc_msgSend(v9, "min");
  v13 = v12;

  return v11 < v13;
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  id v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v15;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMinMaxSeries.m"), 282, CFSTR("compare type class failure"));

  }
  v9 = v8;
  objc_msgSend(v7, "max");
  v11 = v10;
  objc_msgSend(v9, "max");
  v13 = v12;

  return v11 > v13;
}

- (NSLock)seriesMutableStateLock
{
  return self->_seriesMutableStateLock;
}

- (HKStrokeStyle)unselectedStrokeStyleStorage
{
  return self->_unselectedStrokeStyleStorage;
}

- (void)setUnselectedStrokeStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, a3);
}

- (HKStrokeStyle)selectedStrokeStyleStorage
{
  return self->_selectedStrokeStyleStorage;
}

- (void)setSelectedStrokeStyleStorage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, a3);
}

- (UIImage)unselectedPointMarkerImageStorage
{
  return self->_unselectedPointMarkerImageStorage;
}

- (void)setUnselectedPointMarkerImageStorage:(id)a3
{
  objc_storeStrong((id *)&self->_unselectedPointMarkerImageStorage, a3);
}

- (UIImage)selectedPointMarkerImageStorage
{
  return self->_selectedPointMarkerImageStorage;
}

- (void)setSelectedPointMarkerImageStorage:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_unselectedPointMarkerImageStorage, 0);
  objc_storeStrong((id *)&self->_selectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_unselectedStrokeStyleStorage, 0);
  objc_storeStrong((id *)&self->_seriesMutableStateLock, 0);
}

@end
