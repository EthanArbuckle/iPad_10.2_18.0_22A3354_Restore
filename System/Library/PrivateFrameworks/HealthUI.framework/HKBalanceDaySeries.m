@implementation HKBalanceDaySeries

- (HKBalanceDaySeries)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  HKBalanceDaySeries *v11;
  objc_class *v12;
  objc_super v14;

  v3 = sub_1D7B49228();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1D7B49300();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x1E0CB0EF8], v3);
  v11 = self;
  sub_1D7B49234();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))((uint64_t)v11 + OBJC_IVAR___HKBalanceDaySeries_gregorianCalendar, v10, v7);
  *(Class *)((char *)&v11->super.super.super.isa + OBJC_IVAR___HKBalanceDaySeries_sleepingMetrics) = (Class)sub_1D7B494EC();

  v12 = (objc_class *)type metadata accessor for BalanceDaySeries();
  v14.receiver = v11;
  v14.super_class = v12;
  return -[HKBalanceSeries init](&v14, sel_init);
}

- (id)coordinatesForBlock:(id)a3 blockPath:(HKGraphSeriesDataBlockPath *)a4 xAxis:(id)a5 yAxis:(id)a6
{
  int64_t index;
  int64_t zoom;
  int64_t resolution;
  id v12;
  id v13;
  id v14;
  HKBalanceDaySeries *v15;
  void *v16;
  void *v17;

  index = a4->index;
  zoom = a4->zoom;
  resolution = a4->resolution;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = self;
  sub_1D7AF2B74(v12, index, zoom, resolution, v13, v14);
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
  HKBalanceDaySeries *v23;
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
  sub_1D7AF71B0(v19, x, y, width, height, (uint64_t)v20, (uint64_t *)v24, (uint64_t)v21, a9);

  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___HKBalanceDaySeries_gregorianCalendar;
  v3 = sub_1D7B49300();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
