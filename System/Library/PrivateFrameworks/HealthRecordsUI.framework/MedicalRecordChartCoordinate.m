@implementation MedicalRecordChartCoordinate

- (double)startXValue
{
  uint64_t v2;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartCoordinate_pointValuesAscending);
  if (*(_QWORD *)(v2 + 16))
    return *(double *)(v2 + 32);
  else
    return 0.0;
}

- (double)endXValue
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(uint64_t *)((char *)&self->super.isa
                  + OBJC_IVAR____TtC15HealthRecordsUI28MedicalRecordChartCoordinate_pointValuesAscending);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
    return *(double *)(v2 + 16 * v3 + 16);
  else
    return 0.0;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return (HKGraphSeriesBlockCoordinateInfo *)(id)swift_unknownObjectRetain();
}

- (id)copyWithTransform:(CGAffineTransform *)a3 roundToViewScale:(BOOL)a4
{
  __int128 v4;
  _TtC15HealthRecordsUI28MedicalRecordChartCoordinate *v5;
  id v6;
  __int128 v8[3];

  v4 = *(_OWORD *)&a3->c;
  v8[0] = *(_OWORD *)&a3->a;
  v8[1] = v4;
  v8[2] = *(_OWORD *)&a3->tx;
  v5 = self;
  v6 = sub_1BC51F444(v8);

  return v6;
}

- (_TtC15HealthRecordsUI28MedicalRecordChartCoordinate)init
{
  _TtC15HealthRecordsUI28MedicalRecordChartCoordinate *result;

  result = (_TtC15HealthRecordsUI28MedicalRecordChartCoordinate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
