@implementation GameModeCCUIStatusBundleInfo

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static GameModeCCUIStatusBundleInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static GameModeCCUIStatusBundleInfo.supportsSecureCoding = a3;
}

- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)initWithExecutableDisplayName:(id)a3 bundleIdentifier:(id)a4 isSystemService:(BOOL)a5 isAAAGame:(BOOL)a6 usedRecently:(BOOL)a7 state:(int64_t)a8
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  objc_super v21;

  v13 = sub_23C976B4C();
  v15 = v14;
  v16 = sub_23C976B4C();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
  *v17 = v13;
  v17[1] = v15;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
  *v18 = v16;
  v18[1] = v19;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService) = a5;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame) = a6;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently) = a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state) = (Class)a8;
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for GameModeCCUIStatusBundleInfo();
  return -[GameModeCCUIStatusBundleInfo init](&v21, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC10GamePolicy28GameModeCCUIStatusBundleInfo *v5;

  v4 = a3;
  v5 = self;
  GameModeCCUIStatusBundleInfo.encode(with:)((NSCoder)v4);

}

- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo *)GameModeCCUIStatusBundleInfo.init(coder:)(a3);
}

- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)init
{
  _TtC10GamePolicy28GameModeCCUIStatusBundleInfo *result;

  result = (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_23C969DA4();
}

@end
