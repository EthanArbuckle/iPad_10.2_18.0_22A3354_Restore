@implementation HKBalanceSeries

- (HKBalanceSeries)init
{
  return (HKBalanceSeries *)BalanceSeries.init()();
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index;
  int64_t zoom;
  char *resolution;
  id v12;
  id v13;
  id v14;
  HKBalanceSeries *v15;
  void *v16;
  void *v17;

  index = a4->index;
  zoom = a4->zoom;
  resolution = (char *)a4->resolution;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_1D7B03798(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v18;
  id v19;
  id v20;
  CGContext *v21;
  id v22;
  HKBalanceSeries *v23;
  _OWORD v24[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v18 = *(_OWORD *)&a6->c;
  v24[0] = *(_OWORD *)&a6->a;
  v24[1] = v18;
  v24[2] = *(_OWORD *)&a6->tx;
  v19 = a3;
  v20 = a5;
  v21 = a7;
  v22 = a8;
  swift_unknownObjectRetain();
  v23 = self;
  sub_1D7B08440(v19, v20, (uint64_t *)v24, v21, a9, x, y, width, height);

  swift_unknownObjectRelease();
}

- (id)marginsForYAxis:(id)a3 xAxisRange:(id)a4 zoomLevel:(int64_t)a5 chartRect:(CGRect)a6
{
  id v9;
  id v10;
  HKBalanceSeries *v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = sub_1D7B08650(a3);

  return v12;
}

- (void)selectPathsinPathRange:(id *)a3 coordinateRange:(id)a4
{
  int64_t index;
  int64_t zoom;
  int64_t resolution;
  int64_t var1;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  os_unfair_lock_s *v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  HKBalanceSeries *v21;
  id v22;
  uint64_t v23;
  os_unfair_lock_s *v24;
  HKBalanceSeries *v25;
  objc_class *v26;
  _QWORD v27[2];
  int64_t v28;
  int64_t v29;
  int64_t v30;
  _QWORD v31[8];
  objc_super v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  int64_t v37;
  int64_t v38;
  int64_t v39;
  int64_t v40;

  index = a3->var0.var0.index;
  zoom = a3->var0.var0.zoom;
  resolution = a3->var0.var0.resolution;
  var1 = a3->var0.var1;
  v11 = a3->var1.var0.index;
  v10 = a3->var1.var0.zoom;
  v12 = a3->var1.var0.resolution;
  v13 = a3->var1.var1;
  v33 = a3->var0.var0.index;
  v34 = zoom;
  v35 = resolution;
  v36 = var1;
  v37 = v11;
  v38 = v10;
  v39 = v12;
  v40 = v13;
  if (a4)
  {
    v27[1] = v27;
    MEMORY[0x1E0C80A78](self);
    v29 = resolution;
    v30 = index;
    v28 = v12;
    v14 = v10;
    v15 = v11;
    v16 = var1;
    v17 = zoom;
    v19 = (uint64_t)&v18[4];
    v20 = v18 + 21;
    v21 = self;
    v22 = a4;
    os_unfair_lock_lock(v20);
    v23 = v19;
    zoom = v17;
    var1 = v16;
    v11 = v15;
    v10 = v14;
    v12 = v28;
    sub_1D7B08900(v23);
    v24 = v20;
    resolution = v29;
    index = v30;
    os_unfair_lock_unlock(v24);
  }
  else
  {
    v25 = self;
  }
  v26 = (objc_class *)type metadata accessor for BalanceSeries();
  v32.receiver = self;
  v32.super_class = v26;
  v31[0] = index;
  v31[1] = zoom;
  v31[2] = resolution;
  v31[3] = var1;
  v31[4] = v11;
  v31[5] = v10;
  v31[6] = v12;
  v31[7] = v13;
  -[HKGraphSeries selectPathsinPathRange:coordinateRange:](&v32, sel_selectPathsinPathRange_coordinateRange_, v31, a4);

}

- (void)finishSelection
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  os_unfair_lock_s *v4;
  HKBalanceSeries *v5;

  v2 = *(os_unfair_lock_s **)((char *)&self->super.super.isa + OBJC_IVAR___HKBalanceSeries_lollipopPathRangeLock);
  v3 = (uint64_t)&v2[4];
  v4 = v2 + 21;
  v5 = self;
  os_unfair_lock_lock(v4);
  sub_1D7B055DC(v3);
  os_unfair_lock_unlock(v4);

}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (BOOL)blockCoordinateIsVisibleInsideOfChartRect:(CGRect)a3 blockCoordinate:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v9;
  void *v10;
  HKBalanceSeries *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxX;
  CGRect v18;
  CGRect v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  type metadata accessor for BalanceCoordinate();
  v9 = swift_dynamicCastClass();
  if (v9)
  {
    v10 = (void *)v9;
    swift_unknownObjectRetain();
    v11 = self;
    objc_msgSend(v10, sel_startXValue);
    v13 = v12;
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (CGRectGetMinX(v18) <= v13)
    {
      objc_msgSend(v10, sel_endXValue);
      v15 = v14;
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      MaxX = CGRectGetMaxX(v19);
      swift_unknownObjectRelease();

      LOBYTE(v9) = v15 <= MaxX;
    }
    else
    {
      swift_unknownObjectRelease();

      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  HKBalanceSeries *v6;
  double v7;
  double v8;

  swift_unknownObjectRetain();
  v6 = self;
  sub_1D7B08778();
  v8 = v7;
  swift_unknownObjectRelease();

  return v8;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  uint64_t v6;

  x = a3.x;
  type metadata accessor for BalanceCoordinate();
  v6 = swift_dynamicCastClass();
  if (v6)
    return vabdd_f64(*(double *)(v6 + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_xValue), x);
  else
    return 1.79769313e308;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  uint64_t v6;
  double *v7;
  double result;
  double v10;
  double v11;

  y = a3.y;
  type metadata accessor for BalanceCoordinate();
  v6 = swift_dynamicCastClass();
  if (!v6)
    return 1.79769313e308;
  v7 = (double *)(v6 + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_yValueRange);
  if ((*(_BYTE *)(v6 + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_yValueRange + 16) & 1) != 0)
    return 1.79769313e308;
  result = 0.0;
  if (*v7 > y || y > v7[1])
  {
    if (y >= *v7)
      v10 = v7[1];
    else
      v10 = *v7;
    v11 = vabdd_f64(v10, y);
    result = 1.79769313e308;
    if (v11 <= 1.79769313e308)
      return v11;
  }
  return result;
}

- (void).cxx_destruct
{
  sub_1D7AF44A8((uint64_t)self + OBJC_IVAR___HKBalanceSeries_selectedMetric);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___backgroundInactiveFillStyle));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___metricsLineStrokeStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___primaryInRangeFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___primaryOutOfRangeFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___secondaryInRangeFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___secondaryOutOfRangeFillStyle));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKBalanceSeries____lazy_storage___warmupInnerFillStyle));
}

@end
