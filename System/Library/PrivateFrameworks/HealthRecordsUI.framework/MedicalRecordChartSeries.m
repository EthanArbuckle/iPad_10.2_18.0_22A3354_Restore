@implementation MedicalRecordChartSeries

- ($29D920EB297D915BAF2BF71A1708758A)selectedPathRange
{
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v4;
  __int128 v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  $29D920EB297D915BAF2BF71A1708758A *result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __n128 v13;
  __n128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __n128 v18;
  __int128 v19;
  __n128 v20;
  __int128 v21;

  v4 = self;
  if (-[HKGraphSeries allowsSelection](v4, sel_allowsSelection))
  {
    HKGraphSeriesDataBlockPathMake((uint64_t)&v14);
    v20 = v14;
    *(_QWORD *)&v21 = v15;
    HKGraphSeriesDataPointPathMake(&v20, &v14);
    v5 = *(_OWORD *)(MEMORY[0x1E0D2F468] + 16);
    v20 = *(__n128 *)MEMORY[0x1E0D2F468];
    v21 = v5;
    v18 = v14;
    v19 = v15;
  }
  else
  {
    v6 = *(_QWORD *)(MEMORY[0x1E0D2F468] + 8);
    v8 = *(_QWORD *)(MEMORY[0x1E0D2F468] + 16);
    v7 = *(_QWORD *)(MEMORY[0x1E0D2F468] + 24);
    v20.n128_u64[0] = *MEMORY[0x1E0D2F468];
    v20.n128_u64[1] = v6;
    *(_QWORD *)&v21 = v8;
    *((_QWORD *)&v21 + 1) = v7;
    v18.n128_u64[0] = v20.n128_u64[0];
    v18.n128_u64[1] = v6;
    *(_QWORD *)&v19 = v8;
    *((_QWORD *)&v19 + 1) = v7;
  }
  HKGraphSeriesDataPointPathRangeMake(&v20, (uint64_t)&v18, &v14);
  v12 = v15;
  v13 = v14;
  v10 = v17;
  v11 = v16;

  *(__n128 *)&retstr->var0.var0.index = v13;
  *(_OWORD *)&retstr->var0.var0.resolution = v12;
  *(_OWORD *)&retstr->var1.var0.index = v11;
  *(_OWORD *)&retstr->var1.var0.resolution = v10;
  return result;
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index;
  int64_t zoom;
  int64_t resolution;
  id v12;
  id v13;
  id v14;
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v15;
  void *v16;
  void *v17;

  index = a4->index;
  zoom = a4->zoom;
  resolution = a4->resolution;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_1BC51E2A0(v12, index, zoom, resolution, v13, v14);
  v17 = v16;

  return v17;
}

- (void)drawSeriesWithBlockCoordinates:(id)a3 axisRect:(CGRect)a4 zoomLevelConfiguration:(id)a5 pointTransform:(CGAffineTransform *)a6 renderContext:(CGContext *)a7 secondaryRenderContext:(id)a8 seriesRenderingDelegate:(id)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat tx;
  CGFloat ty;
  id v19;
  id v20;
  CGContext *v21;
  id v22;
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v23;
  CGFloat MinX;
  CGFloat MaxX;
  CGFloat *v26;
  void *v27;
  CGContext *v28;
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v29;
  __int128 v30;
  __int128 v31;
  __int128 aBlock;
  __int128 v33;
  uint64_t (*v34)();
  CGFloat v35;
  CGRect v36;
  CGRect v37;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v30 = *(_OWORD *)&a6->c;
  v31 = *(_OWORD *)&a6->a;
  tx = a6->tx;
  ty = a6->ty;
  v19 = a3;
  v20 = a5;
  v21 = a7;
  v22 = a8;
  swift_unknownObjectRetain();
  v23 = self;
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MinX = CGRectGetMinX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MaxX = CGRectGetMaxX(v37);
  v26 = (CGFloat *)swift_allocObject();
  v26[2] = MinX;
  v26[3] = MaxX;
  *((_QWORD *)v26 + 4) = v23;
  *((_QWORD *)v26 + 5) = v21;
  v34 = sub_1BC51F838;
  v35 = *(double *)&v26;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v33 = sub_1BC51D8D0;
  *((_QWORD *)&v33 + 1) = &block_descriptor_8;
  v27 = _Block_copy(&aBlock);
  v28 = v21;
  v29 = v23;
  swift_release();
  aBlock = v31;
  v33 = v30;
  v34 = *(uint64_t (**)())&tx;
  v35 = ty;
  objc_msgSend(v19, sel_enumerateCoordinatesWithTransform_roundToViewScale_block_, &aBlock, 1, v27);
  _Block_release(v27);

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
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v10;
  BOOL v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  swift_unknownObjectRetain();
  v10 = self;
  v11 = sub_1BC51EA84((uint64_t)a4, x, y, width, height);
  swift_unknownObjectRelease();

  return v11;
}

- (double)distanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  double x;
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v9;
  double v10;
  double v11;

  y = a3.y;
  x = a3.x;
  swift_unknownObjectRetain();
  v9 = self;
  sub_1BC51ED60((uint64_t)a4, x, y);
  v11 = v10;
  swift_unknownObjectRelease();

  return v11;
}

- (double)xAxisDistanceFromPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v7;
  double v8;
  double v9;

  swift_unknownObjectRetain();
  v7 = self;
  sub_1BC51EF9C((uint64_t)a4);
  v9 = v8;
  swift_unknownObjectRelease();

  return v9;
}

- (double)yAxisDifferenceToPoint:(CGPoint)a3 blockCoordinate:(id)a4 chartRect:(CGRect)a5
{
  double y;
  _TtC15HealthRecordsUI24MedicalRecordChartSeries *v8;
  double v9;
  double v10;

  y = a3.y;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1BC51F1CC((uint64_t)a4, y);
  v10 = v9;
  swift_unknownObjectRelease();

  return v10;
}

- (_TtC15HealthRecordsUI24MedicalRecordChartSeries)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_selectedStrokeStyle) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_unselectedStrokeStyle) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MedicalRecordChartSeries();
  return -[HKGraphSeries init](&v3, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_selectedStrokeStyle));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC15HealthRecordsUI24MedicalRecordChartSeries_unselectedStrokeStyle));
}

@end
