@implementation HKMultiLineSeries

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  uint64_t v14;
  CGFloat b;
  CGFloat c;
  CGFloat d;
  CGFloat tx;
  CGFloat ty;
  id v20;
  id v21;
  CGContext *v22;
  id v23;
  _TtC8HealthUI17HKMultiLineSeries *v24;
  uint64_t v25;
  void *v26;
  CGContext *v27;
  _TtC8HealthUI17HKMultiLineSeries *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t);
  CGFloat v32;
  char *(*v33)(char *);
  CGFloat v34;
  __int128 v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;

  b = a6->b;
  c = a6->c;
  d = a6->d;
  tx = a6->tx;
  ty = a6->ty;
  *(CGFloat *)&v35 = a6->a;
  v14 = v35;
  *((CGFloat *)&v35 + 1) = b;
  v36 = c;
  v37 = d;
  v38 = tx;
  v39 = ty;
  v20 = a3;
  v21 = a5;
  v22 = a7;
  v23 = a8;
  swift_unknownObjectRetain();
  v24 = self;
  sub_1D7B2E1E8(v22, v20, &v35, a9);
  CGContextSaveGState(v22);
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = v24;
  *(_QWORD *)(v25 + 24) = v22;
  v33 = sub_1D7B30544;
  v34 = *(double *)&v25;
  v29 = MEMORY[0x1E0C809B0];
  v30 = 1107296256;
  v31 = sub_1D7B2DBA0;
  v32 = COERCE_DOUBLE(&block_descriptor_10);
  v26 = _Block_copy(&v29);
  v27 = v22;
  v28 = v24;
  swift_release();
  v29 = v14;
  v30 = *(_QWORD *)&b;
  v31 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *, uint64_t, uint64_t))&c;
  v32 = d;
  v33 = *(char *(**)(char *))&tx;
  v34 = ty;
  objc_msgSend(v20, sel_enumerateCoordinatesWithTransform_roundToViewScale_block_, &v29, 1, v26);
  _Block_release(v26);
  CGContextRestoreGState(v27);

  swift_unknownObjectRelease();
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index;
  int64_t zoom;
  int64_t resolution;
  id v12;
  id v13;
  id v14;
  _TtC8HealthUI17HKMultiLineSeries *v15;
  void *v16;
  void *v17;

  index = a4->index;
  zoom = a4->zoom;
  resolution = a4->resolution;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_1D7B2E980(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  _TtC8HealthUI17HKMultiLineSeries *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a3.y;
  v11 = a3.x;
  swift_unknownObjectRetain();
  v13 = self;
  -[HKMultiLineSeries xAxisDistanceFromPoint:blockCoordinate:chartRect:](v13, sel_xAxisDistanceFromPoint_blockCoordinate_chartRect_, a4, v11, v10, x, y, width, height);
  v15 = v14;
  -[HKMultiLineSeries yAxisDifferenceToPoint:blockCoordinate:chartRect:](v13, sel_yAxisDifferenceToPoint_blockCoordinate_chartRect_, a4, v11, v10, x, y, width, height);
  v17 = v16;
  swift_unknownObjectRelease();

  return _stdlib_squareRoot(v15 * v15 + v17 * v17);
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return sub_1D7B2EF6C(self, a3.x, a3.y, (uint64_t)a2, (uint64_t)a4, (double (*)(uint64_t, double, double))sub_1D7B30028);
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  return sub_1D7B2EF6C(self, a3.x, a3.y, (uint64_t)a2, (uint64_t)a4, (double (*)(uint64_t, double, double))sub_1D7B30290);
}

- (BOOL)blockCoordinate:(id)a3 lessThan:(id)a4
{
  return sub_1D7B2F65C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_1D7B2EFDC);
}

- (BOOL)blockCoordinate:(id)a3 greaterThan:(id)a4
{
  return sub_1D7B2F65C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))sub_1D7B2F31C);
}

- (_TtC8HealthUI17HKMultiLineSeries)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HKMultiLineSeries();
  return -[HKGraphSeries init](&v3, sel_init);
}

@end
