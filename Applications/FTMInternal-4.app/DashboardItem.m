@implementation DashboardItem

+ (BOOL)supportsSecureCoding
{
  return byte_1002B4568;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1002B4568 = a3;
}

- (NSString)description
{
  _TtC13FTMInternal_413DashboardItem *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100156E40();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13FTMInternal_413DashboardItem *v5;

  v4 = a3;
  v5 = self;
  sub_100156F98(v4);

}

- (_TtC13FTMInternal_413DashboardItem)initWithCoder:(id)a3
{
  return (_TtC13FTMInternal_413DashboardItem *)sub_1001571DC(a3);
}

- (_TtC13FTMInternal_413DashboardItem)init
{
  _TtC13FTMInternal_413DashboardItem *result;

  result = (_TtC13FTMInternal_413DashboardItem *)_swift_stdlib_reportUnimplementedInitializer("FTMInternal_4.DashboardItem", 27, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricTech[OBJC_IVAR____TtC13FTMInternal_413DashboardItem_metricTech]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricTech[OBJC_IVAR____TtC13FTMInternal_413DashboardItem_metricName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricTech[OBJC_IVAR____TtC13FTMInternal_413DashboardItem_metricId]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->metricTech[OBJC_IVAR____TtC13FTMInternal_413DashboardItem_attributeName]);
}

@end
