@implementation GameModeStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy14GameModeStatus *v5;

  v4 = a3;
  v5 = self;
  GameModeStatus.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy14GameModeStatus)initWithCoder:(id)a3
{
  id v3;
  _TtC10GamePolicy14GameModeStatus *v4;

  v3 = a3;
  v4 = (_TtC10GamePolicy14GameModeStatus *)sub_23C973A74(v3);

  return v4;
}

- (_TtC10GamePolicy14GameModeStatus)init
{
  _TtC10GamePolicy14GameModeStatus *result;

  result = (_TtC10GamePolicy14GameModeStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_enablementDate, &qword_256BD79F0);
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy14GameModeStatus_disablementDate, &qword_256BD79F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy14GameModeStatus____lazy_storage___config, (uint64_t *)&unk_256BD8288);
}

@end
