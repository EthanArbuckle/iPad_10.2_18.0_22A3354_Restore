@implementation SecurelyCodableWorkPlan

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC19HealthOrchestration23SecurelyCodableWorkPlan *v5;

  v4 = a3;
  v5 = self;
  sub_23DEB1448(v4);

}

- (_TtC19HealthOrchestration23SecurelyCodableWorkPlan)initWithCoder:(id)a3
{
  return (_TtC19HealthOrchestration23SecurelyCodableWorkPlan *)SecurelyCodableWorkPlan.init(coder:)(a3);
}

- (_TtC19HealthOrchestration23SecurelyCodableWorkPlan)init
{
  _TtC19HealthOrchestration23SecurelyCodableWorkPlan *result;

  result = (_TtC19HealthOrchestration23SecurelyCodableWorkPlan *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_23DE90B08(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_encodedContextDescriptor), *(_QWORD *)&self->identifier[OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_encodedContextDescriptor]);
  sub_23DE90B08(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_payload), *(_QWORD *)&self->identifier[OBJC_IVAR____TtC19HealthOrchestration23SecurelyCodableWorkPlan_payload]);
}

@end
