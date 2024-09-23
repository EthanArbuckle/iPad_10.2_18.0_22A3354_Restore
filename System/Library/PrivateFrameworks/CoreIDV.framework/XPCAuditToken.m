@implementation XPCAuditToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV13XPCAuditToken)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV13XPCAuditToken *)sub_20A1A5160((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_20A1A7CD4, (uint64_t)&type metadata for AuditToken, (uint64_t (*)(uint64_t))type metadata accessor for XPCAuditToken, &OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV13XPCAuditToken *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3A90(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV13XPCAuditToken_value, (void (*)(void))sub_20A1A7D1C);

}

- (_TtC7CoreIDV13XPCAuditToken)init
{
  _TtC7CoreIDV13XPCAuditToken *result;

  result = (_TtC7CoreIDV13XPCAuditToken *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
