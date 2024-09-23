@implementation HKMultiLineSeriesBlockCoordinate

- (double)startXValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI32HKMultiLineSeriesBlockCoordinate_startXValue);
}

- (double)endXValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI32HKMultiLineSeriesBlockCoordinate_endXValue);
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return (HKGraphSeriesBlockCoordinateInfo *)(id)swift_unknownObjectRetain();
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  __int128 v5;
  _TtC8HealthUI32HKMultiLineSeriesBlockCoordinate *v6;
  char *v7;
  _OWORD v9[3];

  v5 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v5;
  v9[2] = *(_OWORD *)&a3->tx;
  v6 = self;
  v7 = sub_1D7B2DD34((CGFloat *)v9, a4);

  return v7;
}

- (_TtC8HealthUI32HKMultiLineSeriesBlockCoordinate)init
{
  _TtC8HealthUI32HKMultiLineSeriesBlockCoordinate *result;

  result = (_TtC8HealthUI32HKMultiLineSeriesBlockCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
