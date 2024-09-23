@implementation MobileDriversLicenseReadResponseInternal

- (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal)init
{
  _TtC15ProximityReader40MobileDriversLicenseReadResponseInternal *result;

  result = (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21C2D2B48(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_responseData), *(_QWORD *)&self->responseData[OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_responseData]);
  sub_21C2D2B48(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_sessionTranscript), *(_QWORD *)&self->responseData[OBJC_IVAR____TtC15ProximityReader40MobileDriversLicenseReadResponseInternal_sessionTranscript]);
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_25525DC00;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_25525DC00 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15ProximityReader40MobileDriversLicenseReadResponseInternal *v5;

  v4 = a3;
  v5 = self;
  MobileDriversLicenseReadResponseInternal.encode(with:)((NSCoder)v4);

}

- (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal)initWithCoder:(id)a3
{
  return (_TtC15ProximityReader40MobileDriversLicenseReadResponseInternal *)MobileDriversLicenseReadResponseInternal.init(coder:)(a3);
}

@end
