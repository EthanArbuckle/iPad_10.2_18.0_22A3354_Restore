@implementation MLHostExtensionContext

- (NSString)description
{
  return (NSString *)sub_2402AD23C(self, (uint64_t)a2, (void (*)(void))MLHostExtensionContext.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_256FE1080;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_256FE1080 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20LighthouseBackground22MLHostExtensionContext *v5;

  v4 = a3;
  v5 = self;
  MLHostExtensionContext.encode(with:)((NSCoder)v4);

}

- (_TtC20LighthouseBackground22MLHostExtensionContext)initWithCoder:(id)a3
{
  return (_TtC20LighthouseBackground22MLHostExtensionContext *)MLHostExtensionContext.init(coder:)(a3);
}

- (_TtC20LighthouseBackground22MLHostExtensionContext)init
{
  _TtC20LighthouseBackground22MLHostExtensionContext *result;

  result = (_TtC20LighthouseBackground22MLHostExtensionContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
