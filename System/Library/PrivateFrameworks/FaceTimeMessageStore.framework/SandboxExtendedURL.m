@implementation SandboxExtendedURL

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC20FaceTimeMessageStore18SandboxExtendedURL_sandboxExtensionToken));
}

- (_TtC20FaceTimeMessageStore18SandboxExtendedURL)initWithCoder:(id)a3
{
  return (_TtC20FaceTimeMessageStore18SandboxExtendedURL *)SandboxExtendedURL.init(coder:)(a3);
}

- (void)dealloc
{
  _TtC20FaceTimeMessageStore18SandboxExtendedURL *v2;

  v2 = self;
  SandboxExtendedURL.__deallocating_deinit();
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC20FaceTimeMessageStore18SandboxExtendedURL *v5;

  v4 = a3;
  v5 = self;
  sub_23B304D78(v4);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC20FaceTimeMessageStore18SandboxExtendedURL *v2;
  void *v3;

  v2 = self;
  sub_23B353A4C();

  v3 = (void *)sub_23B3D5228();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore18SandboxExtendedURL)init
{
  SandboxExtendedURL.init()();
}

@end
