@implementation XPCMobileDocumentReaderCertificateResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse *)sub_20A1A5160((uint64_t)self, (uint64_t)a2, a3, (void (*)(uint64_t))sub_20A1A7EA4, (uint64_t)&type metadata for MobileDocumentReaderCertificateResponse, (uint64_t (*)(uint64_t))type metadata accessor for XPCMobileDocumentReaderCertificateResponse, &OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3A90(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse_value, (void (*)(void))sub_20A1A7EEC);

}

- (_TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse)init
{
  _TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse *result;

  result = (_TtC7CoreIDV42XPCMobileDocumentReaderCertificateResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
