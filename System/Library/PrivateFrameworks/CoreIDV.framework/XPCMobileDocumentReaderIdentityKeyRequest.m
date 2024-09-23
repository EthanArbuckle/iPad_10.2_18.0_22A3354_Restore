@implementation XPCMobileDocumentReaderIdentityKeyRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)sub_20A1A4354((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A7000);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3620(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, (uint64_t (*)(uint64_t))type metadata accessor for MobileDocumentReaderIdentityKeyRequest, &qword_2545DB060, (uint64_t)&protocol conformance descriptor for MobileDocumentReaderIdentityKeyRequest);

}

- (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest)init
{
  _TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *result;

  result = (_TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A124284((uint64_t)self + OBJC_IVAR____TtC7CoreIDV41XPCMobileDocumentReaderIdentityKeyRequest_value, (uint64_t (*)(_QWORD))type metadata accessor for MobileDocumentReaderIdentityKeyRequest);
}

@end
