@implementation XPCMobileDocumentReaderCertificateRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)sub_20A1A4354((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A72B4);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3620(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderCertificateRequest, &qword_2545DB070, (uint64_t)&protocol conformance descriptor for MobileDocumentReaderCertificateRequest);

}

- (_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest)init
{
  _TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *result;

  result = (_TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A124284((uint64_t)self + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderCertificateRequest_value, (uint64_t (*)(_QWORD))type metadata accessor for MobileDocumentReaderCertificateRequest);
}

@end
