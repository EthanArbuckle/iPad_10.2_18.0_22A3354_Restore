@implementation SustainedExecutionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy24SustainedExecutionStatus *v5;

  v4 = a3;
  v5 = self;
  SustainedExecutionStatus.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy24SustainedExecutionStatus)initWithCoder:(id)a3
{
  id v3;
  _TtC10GamePolicy24SustainedExecutionStatus *v4;

  v3 = a3;
  v4 = (_TtC10GamePolicy24SustainedExecutionStatus *)sub_23C971494(v3);

  return v4;
}

- (_TtC10GamePolicy24SustainedExecutionStatus)init
{
  _TtC10GamePolicy24SustainedExecutionStatus *result;

  result = (_TtC10GamePolicy24SustainedExecutionStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_enablementDate, &qword_256BD79F0);
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus_disablementDate, &qword_256BD79F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy24SustainedExecutionStatus____lazy_storage___config, (uint64_t *)&unk_256BD8128);
}

@end
