@implementation StateOfMindCoordinate

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return (HKGraphSeriesBlockCoordinateInfo *)(id)swift_unknownObjectRetain();
}

- (_TtC8HealthUI21StateOfMindCoordinate)init
{
  _TtC8HealthUI21StateOfMindCoordinate *result;

  result = (_TtC8HealthUI21StateOfMindCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (double)startXValue
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC8HealthUI21StateOfMindCoordinate_xValue);
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  __int128 v4;
  _TtC8HealthUI21StateOfMindCoordinate *v5;
  void *v6;
  void *v7;
  _OWORD v9[3];

  v4 = *(_OWORD *)&a3->c;
  v9[0] = *(_OWORD *)&a3->a;
  v9[1] = v4;
  v9[2] = *(_OWORD *)&a3->tx;
  v5 = self;
  sub_1D7AC8FB4((CGFloat *)v9);
  v7 = v6;

  return v7;
}

@end
