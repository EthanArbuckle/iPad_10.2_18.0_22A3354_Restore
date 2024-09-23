@implementation SandboxExtensionURL

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC8Feedback19SandboxExtensionURL *v5;

  v4 = a3;
  v5 = self;
  sub_22DD9986C(v4);

}

- (_TtC8Feedback19SandboxExtensionURL)initWithCoder:(id)a3
{
  id v3;
  _TtC8Feedback19SandboxExtensionURL *v4;

  v3 = a3;
  v4 = (_TtC8Feedback19SandboxExtensionURL *)sub_22DD9A768();

  return v4;
}

- (_TtC8Feedback19SandboxExtensionURL)init
{
  _TtC8Feedback19SandboxExtensionURL *result;

  result = (_TtC8Feedback19SandboxExtensionURL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC8Feedback19SandboxExtensionURL_url;
  v3 = sub_22DE1DFB4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end
