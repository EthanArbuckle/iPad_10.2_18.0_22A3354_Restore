@implementation MobileDriversLicenseDataRequestInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  _TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *v2;
  void *v3;

  v2 = self;
  MobileDriversLicenseDataRequestInternal.description.getter();

  v3 = (void *)sub_21C3A7EB4();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *)MobileDriversLicenseDataRequestInternal.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *v5;

  v4 = a3;
  v5 = self;
  MobileDriversLicenseDataRequestInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal)init
{
  _TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *result;

  result = (_TtC15ProximityReader39MobileDriversLicenseDataRequestInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_21C2ED424((uint64_t)self + OBJC_IVAR____TtC15ProximityReader39MobileDriversLicenseDataRequestInternal_documentType, (uint64_t (*)(_QWORD))type metadata accessor for IdentityDocumentType);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
