@implementation SpatialLayoutDelegate

- (CGRect)displayedRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = sub_1D2B5244C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_displayedRect);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (double)hourHeight
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  double result;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_endHourToShow);
  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_startHourToShow);
  v4 = __OFSUB__(v2, v3);
  v5 = v2 - v3;
  if (!v4)
    return *(double *)&self->displayedRect[OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_displayedRect + 16]
         / (double)v5;
  __break(1u);
  return result;
}

- (double)topPadding
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_topPadding);
}

- (void)setTopPadding:(double)a3
{
  *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_topPadding) = a3;
}

- (double)timeWidth
{
  return *(double *)&self->displayedRect[OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_displayedRect + 8];
}

- (BOOL)originIsUpperLeft
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_originIsUpperLeft);
}

- (void)setOriginIsUpperLeft:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_originIsUpperLeft) = a3;
}

- (double)dateForPoint:(CGPoint)a3
{
  _TtC14CalendarWidget21SpatialLayoutDelegate *v3;
  double v4;
  double v5;

  v3 = self;
  sub_1D2B51D34();
  v5 = v4;

  return v5;
}

- (CGPoint)pointForDate:(double)a3
{
  _TtC14CalendarWidget21SpatialLayoutDelegate *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  v3 = self;
  sub_1D2B51F64();
  v5 = v4;

  v6 = 0.0;
  v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (double)RoundToScreenScale:(double)a3
{
  return round(*(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_scale) * a3)
       / *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_scale);
}

- (_TtC14CalendarWidget21SpatialLayoutDelegate)init
{
  _TtC14CalendarWidget21SpatialLayoutDelegate *result;

  result = (_TtC14CalendarWidget21SpatialLayoutDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;

  v3 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_startDate;
  v4 = sub_1D2BCE9BC();
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_endDate, v4);
  v6 = (char *)self + OBJC_IVAR____TtC14CalendarWidget21SpatialLayoutDelegate_calendar;
  v7 = sub_1D2BCEB48();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

@end
