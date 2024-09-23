@implementation MobileDriversLicenseViewRequestInternal

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25525DA70;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25525DA70 = a3;
}

- (NSString)description
{
  _TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *v2;
  void *v3;

  v2 = self;
  MobileDriversLicenseViewRequestInternal.description.getter();

  v3 = (void *)sub_21C3A7EB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *v5;

  v4 = a3;
  v5 = self;
  MobileDriversLicenseViewRequestInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *)MobileDriversLicenseViewRequestInternal.init(coder:)(a3);
}

- (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal)init
{
  _TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *result;

  result = (_TtC15ProximityReader39MobileDriversLicenseViewRequestInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseViewRequestInternal_options));
  swift_bridgeObjectRelease();
  sub_21C2ED424((uint64_t)self + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseViewRequestInternal_documentType, (uint64_t (*)(_QWORD))type metadata accessor for IdentityDocumentType);
  swift_bridgeObjectRelease();
}

@end
