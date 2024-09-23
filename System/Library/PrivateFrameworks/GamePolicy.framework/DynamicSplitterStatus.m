@implementation DynamicSplitterStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy21DynamicSplitterStatus *v5;

  v4 = a3;
  v5 = self;
  DynamicSplitterStatus.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy21DynamicSplitterStatus)initWithCoder:(id)a3
{
  id v3;
  _TtC10GamePolicy21DynamicSplitterStatus *v4;

  v3 = a3;
  v4 = (_TtC10GamePolicy21DynamicSplitterStatus *)sub_23C963B74(v3);

  return v4;
}

- (_TtC10GamePolicy21DynamicSplitterStatus)init
{
  _TtC10GamePolicy21DynamicSplitterStatus *result;

  result = (_TtC10GamePolicy21DynamicSplitterStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_enablementDate, &qword_256BD79F0);
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus_disablementDate, &qword_256BD79F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23C964EB8((uint64_t)self + OBJC_IVAR____TtC10GamePolicy21DynamicSplitterStatus____lazy_storage___config, &qword_256BD7A08);
}

@end
