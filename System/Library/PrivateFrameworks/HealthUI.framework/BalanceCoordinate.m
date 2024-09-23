@implementation BalanceCoordinate

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return (HKGraphSeriesBlockCoordinateInfo *)(id)swift_unknownObjectRetain();
}

- (_TtC8HealthUI17BalanceCoordinate)init
{
  _TtC8HealthUI17BalanceCoordinate *result;

  result = (_TtC8HealthUI17BalanceCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (double)startXValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI17BalanceCoordinate_xValue);
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  __int128 v4;
  _TtC8HealthUI17BalanceCoordinate *v5;
  id v6;
  _OWORD v8[3];

  v4 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->tx;
  v5 = self;
  v6 = sub_1D7B1BFE0((CGFloat *)v8);

  return v6;
}

@end
