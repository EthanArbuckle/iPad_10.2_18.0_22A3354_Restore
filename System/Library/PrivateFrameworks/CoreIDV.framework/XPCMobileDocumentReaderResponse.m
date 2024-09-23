@implementation XPCMobileDocumentReaderResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC7CoreIDV31XPCMobileDocumentReaderResponse)initWithCoder:(id)a3
{
  return (_TtC7CoreIDV31XPCMobileDocumentReaderResponse *)sub_20A1A4354((uint64_t)self, (uint64_t)a2, a3, (uint64_t (*)(void *))sub_20A1A6D4C);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC7CoreIDV31XPCMobileDocumentReaderResponse *v5;

  v4 = a3;
  v5 = self;
  sub_20A1A3620(v4, (uint64_t)&OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, type metadata accessor for MobileDocumentReaderResponse, &qword_2545DB040, (uint64_t)&protocol conformance descriptor for MobileDocumentReaderResponse);

}

- (_TtC7CoreIDV31XPCMobileDocumentReaderResponse)init
{
  _TtC7CoreIDV31XPCMobileDocumentReaderResponse *result;

  result = (_TtC7CoreIDV31XPCMobileDocumentReaderResponse *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_20A124284((uint64_t)self + OBJC_IVAR____TtC7CoreIDV31XPCMobileDocumentReaderResponse_value, type metadata accessor for MobileDocumentReaderResponse);
}

@end
