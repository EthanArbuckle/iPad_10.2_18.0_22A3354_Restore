@implementation HKStateOfMindSeries

- (HKStateOfMindSeries)init
{
  HKStateOfMindSeries *v2;
  HKStateOfMindSeries *v3;
  objc_super v5;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___gradientFillStyle) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___inactiveFillStyle) = 0;
  v2 = self;
  *(Class *)((char *)&v2->super.super.isa + OBJC_IVAR___HKStateOfMindSeries_fixedAxisLabels) = (Class)sub_1D7AED514();

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for StateOfMindSeries();
  v3 = -[HKGraphSeries init](&v5, sel_init);
  -[HKGraphSeries setAdjustYAxisForLabels:](v3, sel_setAdjustYAxisForLabels_, 0);
  return v3;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index;
  int64_t zoom;
  int64_t resolution;
  id v12;
  id v13;
  id v14;
  HKStateOfMindSeries *v15;
  void *v16;
  void *v17;

  index = a4->index;
  zoom = a4->zoom;
  resolution = a4->resolution;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_1D7AEC39C(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  __int128 v18;
  id v19;
  id v20;
  CGContext *v21;
  id v22;
  HKStateOfMindSeries *v23;
  __int128 v24[3];

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
  sub_1D7AEDB98(v19, v20, v24, (uint64_t)v21, a9, x, y, width, height);

  swift_unknownObjectRelease();
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
  HKStateOfMindSeries *v11;
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
  type metadata accessor for StateOfMindCoordinate();
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
  double y;
  double x;
  HKStateOfMindSeries *v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1D7AEDF34(x, y);
  v10 = v9;
  swift_unknownObjectRelease();

  return v10;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double x;
  uint64_t v6;

  x = a3.x;
  type metadata accessor for StateOfMindCoordinate();
  v6 = swift_dynamicCastClass();
  if (v6)
    return vabdd_f64(*(double *)(v6 + OBJC_IVAR____TtC8HealthUI21StateOfMindCoordinate_xValue), x);
  else
    return 1.79769313e308;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  HKStateOfMindSeries *v7;
  double v8;

  y = a3.y;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = sub_1D7AEE094(y);
  swift_unknownObjectRelease();

  return v8;
}

- (id)cacheKeysForModelRange:(id)a3 zoomScale:(double)a4
{
  return 0;
}

- (id)findAxisLabelsInModelRange:(id)a3 zoomScale:(double)a4
{
  void *v4;

  sub_1D7AAF6EC(0, (unint64_t *)&qword_1F014EF70);
  swift_bridgeObjectRetain();
  v4 = (void *)sub_1D7B4A4A0();
  swift_bridgeObjectRelease();
  return v4;
}

- (CGPoint)renderPositionForLabelLocation:(id)a3 rect:(CGRect)a4 zoomScale:(double)a5 contentOffset:(CGPoint)a6 constantOffset:(double)a7 isHorizontal:(BOOL)a8 optionalOffset:(CGPoint)a9
{
  _BOOL8 v9;
  double x;
  double height;
  double width;
  double v14;
  double v15;
  HKStateOfMindSeries *v17;
  HKAxis *v18;
  double v19;
  double v20;
  HKAxis *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double y;
  _QWORD v28[4];
  uint64_t v29;
  uint64_t v30;
  CGPoint result;

  v9 = a8;
  y = a6.y;
  x = a6.x;
  height = a4.size.height;
  width = a4.size.width;
  v14 = a4.origin.y;
  v15 = a4.origin.x;
  swift_unknownObjectRetain();
  v17 = self;
  sub_1D7B4A770();
  swift_unknownObjectRelease();
  v18 = -[HKGraphSeries yAxis](v17, sel_yAxis);
  if (v18)
  {
    v21 = v18;
    __swift_project_boxed_opaque_existential_0(v28, v28[3]);
    -[HKAxis renderPositionForLabelLocation:rect:zoomScale:contentOffset:constantOffset:isHorizontal:optionalOffset:](v21, sel_renderPositionForLabelLocation_rect_zoomScale_contentOffset_constantOffset_isHorizontal_optionalOffset_, sub_1D7B4A92C(), v9, v15, v14, width, height, a5, x, y, a7, v29, v30);
    v23 = v22;
    v25 = v24;

    swift_unknownObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v28);
    v19 = v23;
    v20 = v25;
  }
  else
  {
    __break(1u);
  }
  result.y = v20;
  result.x = v19;
  return result;
}

+ (id)standardStateOfMindSeriesWithStateOfMindDisplayType:(id)a3 unitController:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  v7 = _s8HealthUI17StateOfMindSeriesC08standardcdeF005statedE11DisplayType14unitControllerACSo09HKDisplayJ0C_So016HKUnitPreferenceL0CtFZ_0(v5, (uint64_t)v6);

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___gradientFillStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR___HKStateOfMindSeries____lazy_storage___inactiveFillStyle));
}

@end
