@implementation ModelManagerGameAssertionStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy31ModelManagerGameAssertionStatus *v5;

  v4 = a3;
  v5 = self;
  ModelManagerGameAssertionStatus.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy31ModelManagerGameAssertionStatus)initWithCoder:(id)a3
{
  id v3;
  _TtC10GamePolicy31ModelManagerGameAssertionStatus *v4;

  v3 = a3;
  v4 = (_TtC10GamePolicy31ModelManagerGameAssertionStatus *)sub_23C96C6A0(v3);

  return v4;
}

- (_TtC10GamePolicy31ModelManagerGameAssertionStatus)init
{
  _TtC10GamePolicy31ModelManagerGameAssertionStatus *result;

  result = (_TtC10GamePolicy31ModelManagerGameAssertionStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_enablementDate, &qword_256BD79F0);
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus_disablementDate, &qword_256BD79F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy31ModelManagerGameAssertionStatus____lazy_storage___config, (uint64_t *)&unk_256BD7ED8);
}

@end
