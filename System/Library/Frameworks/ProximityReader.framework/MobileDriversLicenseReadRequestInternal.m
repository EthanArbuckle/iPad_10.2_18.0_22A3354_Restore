@implementation MobileDriversLicenseReadRequestInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC15ProximityReader39MobileDriversLicenseReadRequestInternal *v2;
  void *v3;

  v2 = self;
  MobileDriversLicenseReadRequestInternal.description.getter();

  v3 = (void *)sub_21C3A7EB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15ProximityReader39MobileDriversLicenseReadRequestInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader39MobileDriversLicenseReadRequestInternal *)MobileDriversLicenseReadRequestInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader39MobileDriversLicenseReadRequestInternal *v5;

  v4 = a3;
  v5 = self;
  MobileDriversLicenseReadRequestInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader39MobileDriversLicenseReadRequestInternal)init
{
  _TtC15ProximityReader39MobileDriversLicenseReadRequestInternal *result;

  result = (_TtC15ProximityReader39MobileDriversLicenseReadRequestInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C2ED424((uint64_t)self + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseReadRequestInternal_documentType, (uint64_t (*)(_QWORD))type metadata accessor for IdentityDocumentType);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
