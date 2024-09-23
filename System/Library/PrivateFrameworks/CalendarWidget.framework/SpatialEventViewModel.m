@implementation SpatialEventViewModel

- (CGRect)unPinnedViewFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1D2B5244C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_unPinnedViewFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setUnPinnedViewFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_unPinnedViewFrame) = a3;
}

- (NSString)eventIdentifier
{
  _TtC14CalendarWidget21SpatialEventViewModel *v2;
  void *v3;

  v2 = self;
  sub_1D2B2CC08();

  v3 = (void *)sub_1D2BCFB5C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSDate)startWithTravelTime
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  _TtC14CalendarWidget21SpatialEventViewModel *v11;
  char *v12;
  void (*v13)(char *, uint64_t);
  void *v14;
  uint64_t v16;

  v3 = sub_1D2BCE9BC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v16 - v8;
  v10 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewStartDate;
  type metadata accessor for Event();
  v11 = self;
  sub_1D2BCE95C();
  sub_1D2B043C8();
  if ((sub_1D2BCFAD8() & 1) != 0)
    v12 = v7;
  else
    v12 = v10;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v12, v3);
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, v3);

  v14 = (void *)sub_1D2BCE968();
  v13(v9, v3);
  return (NSDate *)v14;
}

- (NSDate)start
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  _TtC14CalendarWidget21SpatialEventViewModel *v10;
  char *v11;
  void *v12;
  uint64_t v14;

  v3 = sub_1D2BCE9BC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewStartDate;
  v8 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_event;
  v9 = &v8[*(int *)(type metadata accessor for Event() + 20)];
  sub_1D2B043C8();
  v10 = self;
  if ((sub_1D2BCFAD8() & 1) != 0)
    v11 = v9;
  else
    v11 = v7;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v11, v3);

  v12 = (void *)sub_1D2BCE968();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v12;
}

- (NSDate)end
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  _TtC14CalendarWidget21SpatialEventViewModel *v10;
  char *v11;
  void *v12;
  uint64_t v14;

  v3 = sub_1D2BCE9BC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewEndDate;
  v8 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_event;
  v9 = &v8[*(int *)(type metadata accessor for Event() + 24)];
  sub_1D2B043C8();
  v10 = self;
  if ((sub_1D2BCFACC() & 1) != 0)
    v11 = v9;
  else
    v11 = v7;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v11, v3);

  v12 = (void *)sub_1D2BCE968();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v12;
}

- (BOOL)hideTravelTime
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_hideTravelTime);
}

- (void)setHideTravelTime:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_hideTravelTime) = a3;
}

- (double)enoughHeightForOneLine
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_lineHeight);
}

- (double)viewMaxNaturalTextHeight
{
  _TtC14CalendarWidget21SpatialEventViewModel *v2;
  double v3;

  v2 = self;
  v3 = sub_1D2B52878();

  return v3;
}

- (void)setStagedFrame:(CGRect)a3
{
  *(CGRect *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame) = a3;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeight) = (Class)0x7FEFFFFFFFFFFFFFLL;
}

- (CGRect)stagedFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame);
  v3 = *(double *)&self->_anon_0[OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame];
  v4 = *(double *)&self->id[OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame];
  v5 = *(double *)&self->id[OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_frame + 8];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)visibleHeightLocked
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked);
}

- (void)setVisibleHeightLocked:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked) = a3;
}

- (void)setVisibleHeight:(double)a3
{
  uint64_t v3;

  v3 = OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked;
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeightLocked) & 1) == 0)
  {
    *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_visibleHeight) = a3;
    *((_BYTE *)&self->super.isa + v3) = 1;
  }
}

- (void)setTravelTimeHeight:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_travelTimeHeight) = a3;
}

+ (double)barToBarHorizontalDistanceIncludingBarWidth
{
  return 0.0;
}

- (double)barToBarHorizontalDistanceIncludingBarWidth
{
  return (*(double **)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewMetrics))[6]
       + (*(double **)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewMetrics))[6]
       + (*(double **)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewMetrics))[8];
}

- (NSString)description
{
  _TtC14CalendarWidget21SpatialEventViewModel *v2;
  void *v3;

  v2 = self;
  sub_1D2B52ADC();

  v3 = (void *)sub_1D2BCFB5C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC14CalendarWidget21SpatialEventViewModel)init
{
  _TtC14CalendarWidget21SpatialEventViewModel *result;

  result = (_TtC14CalendarWidget21SpatialEventViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  sub_1D2AC51EC((uint64_t)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_event);
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewStartDate;
  v4 = sub_1D2BCE9BC();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialEventViewModel_viewEndDate, v4);
  swift_release();
}

@end
